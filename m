Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 70E877F669
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2019 11:26:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46ZWdS6cPkz4S;
	Fri, 20 Sep 2019 13:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1568978813;
	bh=o7enk84wkDZ8QNOorDoohFq1AJHMPOmIgnRBYUfS9dg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hSXuqvEtZy8i+lHi0RPoXJMsHCiF+0mPz+MKM7B4fUPjw3Fckhi5OEl6XbUbnGFUz
	Mekb3/WLt2PMxLzXTxLQTYYnYCX8bI8dWWOO19RgDJLQd/mqjVFp5tqmMK27gdiPCE
	CM0dzJCCCC53i+ECx1YNrevmAWNxUbwsypQO0j2ACAzXeAfRzSbnpzGV0BtwGIemzi
	kvjM/ujtslup0KekCI7LZ3NvZromsbfvW+FldRBvK5xyYDeM/k4hf5nLopDwM8VWeH
	NOgeGzAkaPyp03yblRWzEluCq0UZeBFx+ZqQYLvpnjSMeUmqELi4mOvNVaytr32Wgm
	yzheBk9aAKLEwG8jFBKKLqYS6WgpvIvigQDR8c3Cpz5zMK8nI3us1MXH4DzksMU1Rg
	9SzOQ7GBaLsaleLFygiSQQ9nFKcHE2ash7CVrrGRLgFPG+ZxeHc8hHGThNe24kkWkL
	fd+/JnwTP5veuEMQVYsmH5jf0YFLW1Nd862xlv1eyaNfhozKXjudBthVI66UZ0lpop
	g/i5bTZChXawFqrtKxo3ITtPMawGnihKveZUFbw5UoU9vhxVDkAHfcgrIh79wE9EsV
	UYjWbnj5YLAXXMXP5H6fPLPsi5plDe2fL8qBfMtZeDy/nko6FakxbuhwN3L002FATZ
	QiKjEPLoswfRJUBXjZe6Jcww=
Date: Fri, 20 Sep 2019 14:26:49 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20190920112649.GA6059@localhost>
References: <20190920111602.27927-1-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <20190920111602.27927-1-ross.burton@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] json-c: use GitHub for upstream release checking
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Sep 2019 11:26:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Sep 20, 2019 at 12:16:01PM +0100, Ross Burton wrote:
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/json-c/json-c_0.13.1.bb | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/meta/recipes-devtools/json-c/json-c_0.13.1.bb b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> index 9654e60a3d2..fcc3e4337ea 100644
> --- a/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> +++ b/meta/recipes-devtools/json-c/json-c_0.13.1.bb
> @@ -10,13 +10,7 @@ SRC_URI = "https://s3.amazonaws.com/json-c_releases/releases/${BP}.tar.gz \
>  SRC_URI[md5sum] = "04969ad59cc37bddd83741a08b98f350"
>  SRC_URI[sha256sum] = "b87e608d4d3f7bfdd36ef78d56d53c74e66ab278d318b71e6002a369d36f4873"
>  
> -UPSTREAM_CHECK_REGEX = "json-c-(?P<pver>\d+(\.\d+)+).tar"
> -# json-c releases page is fetching the list of releases in some weird XML format
> -# from https://s3.amazonaws.com/json-c_releases and processes it with javascript :-/
> -#UPSTREAM_CHECK_URI = "https://s3.amazonaws.com/json-c_releases/releases/index.html"
> -RECIPE_UPSTREAM_VERSION = "0.13.1"
> -RECIPE_UPSTREAM_DATE = "Mar 04, 2018"
> -CHECK_DATE = "May 02, 2018"
> +UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
>...

Upstream tag names are appending the date to the version,
making "devtool check-upgrade-status" with this patch result in
INFO: json-c                    0.13.1          UNKNOWN_BROKEN  Yi Zhao <yi.zhao@windriver.com>


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


