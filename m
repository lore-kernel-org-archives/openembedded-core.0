Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id EBFDB76536
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 10:45:35 +0000 (UTC)
Received: by obbfr1 with SMTP id fr1so55377364obb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 03:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DzdbMNkymikZJpLEfanIwwaDQJjic18fX4cV5bNRGhU=;
	b=KRS+j3hOjPgGx52SrRyCF9Qu4oW2RWiizwJcweMEoKTW+ZQkxG50mwurnu448gpQvh
	jDRqEaonWrxZrU0sMnHPJMfrkMoBQaUbt6RMNsgTPCbnv8ENJ22vrxkvrzGL0kbyxAy6
	roRX77Z7nyi+1gitoH3cjNlWcuqTG3Cq/O6DhoexJOgwdGLguZY6EDjZ1nPWJk0U3uDW
	TB+uzxc1t8EwY0bq5xzCCGLeaTcgRZVNiGKzHP89Q9R6P6PBRKU76NSbp1oiV9TJ21Js
	bhNiydJFyy4pNou2wJE5t8ACq0sdcfGkGmQrgBzRPqNO08PPpoohRAhjsB01OVs49bZJ
	qfuQ==
X-Gm-Message-State: ALoCoQkOxSA4cjQ7lHnhgyvCD4xfty2eE8I2Zzf+oa9Q19By4Q5zxPV49pWZH0ODpyNPb1LCm+mc
X-Received: by 10.60.50.169 with SMTP id d9mr4268493oeo.9.1440153935796; Fri,
	21 Aug 2015 03:45:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Fri, 21 Aug 2015 03:45:06 -0700 (PDT)
In-Reply-To: <9dd6d914345f37e8584ef7a879afbe2d2e1835b8.1440145857.git.liezhi.yang@windriver.com>
References: <cover.1440145857.git.liezhi.yang@windriver.com>
	<9dd6d914345f37e8584ef7a879afbe2d2e1835b8.1440145857.git.liezhi.yang@windriver.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Fri, 21 Aug 2015 13:45:06 +0300
Message-ID: <CAHiDW_HjW089mLdSNCKxtTjRdY9rLzs0G-okYrCrjJRyN_TxYQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] man-pages: 4.01 -> 4.02
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
X-List-Received-Date: Fri, 21 Aug 2015 10:45:38 -0000
Content-Type: text/plain; charset=UTF-8

On 21 August 2015 at 13:15, Robert Yang <liezhi.yang@windriver.com> wrote:
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../{man-pages_4.01.bb => man-pages_4.02.bb}       |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-extended/man-pages/{man-pages_4.01.bb => man-pages_4.02.bb} (86%)

Maxin sent this patch yesterday already.

 - Jussi

>
> diff --git a/meta/recipes-extended/man-pages/man-pages_4.01.bb b/meta/recipes-extended/man-pages/man-pages_4.02.bb
> similarity index 86%
> rename from meta/recipes-extended/man-pages/man-pages_4.01.bb
> rename to meta/recipes-extended/man-pages/man-pages_4.02.bb
> index f6a5c49..1b90a44 100644
> --- a/meta/recipes-extended/man-pages/man-pages_4.01.bb
> +++ b/meta/recipes-extended/man-pages/man-pages_4.02.bb
> @@ -7,8 +7,8 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://README;md5=8f2a3d43057d458e5066714980567a60"
>  SRC_URI = "${KERNELORG_MIRROR}/linux/docs/${BPN}/Archive/${BP}.tar.gz"
>
> -SRC_URI[md5sum] = "575f4e8920166b1433c329bb621819d1"
> -SRC_URI[sha256sum] = "ba89f3453982fae6c699a877368d51ee27883b4de709e753eee3783b447a8381"
> +SRC_URI[md5sum] = "93df3279798a3345bb2c709584c83639"
> +SRC_URI[sha256sum] = "42324f9ed47c89a43cb37b6bb0d5fbcad44838eee45cd394e181c98d038c49ff"
>
>  RDEPENDS_${PN} = "man"
>
> --
> 1.7.9.5
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

