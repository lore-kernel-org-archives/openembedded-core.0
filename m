Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E8AF67CBE7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 15:14:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 445Zcw2XqfzJs;
	Fri, 22 Feb 2019 16:14:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1550848464;
	bh=I/W08zjnPSLTWOWu3Td49/euFyzmCnILymADohI96v8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QFlJhyb9GfHLeV35m4N7sNJ26T5sPEQ92QYeQDC8vpummwAXToWHbviSZoQTb6Eyn
	ZUmry4XRWvb9aXH910ziYT33wz6v05eeCMRPC0RD5zB857o3yNNxdDO68TURhcFPaP
	CEZVUL3UTtYiZDls2YobvPDKshdV2GBdGk2K7/hiRqDPO8TlOBrtxmM1n1xC1Ay2+d
	2DY28RDAceD2CgIAy7ZTPSv5Gtt0v48BNtXPLRt9EbSVEyvJAO9KOGdOfk6LmNDzpV
	fx+MsrstZk4nuGjv/q43Pz0CzaKRdQRoe0nnnfiAa2VJGumnCJ49Uyy1So5J1vVMGI
	9UYwD819mYi3E6BNy7/lzTAQKLDxMAgbS0TgTdjL+3nsM43Nk7IL1KydjSYxmv+q8f
	SZXm8kOUTirxrteMn57L4m3LTY2UvkBLHBFAgkTE7Vu945azdePJZfMHkeP4wF46Ye
	8MceAAeqM0x8z3iNEHUeJ7Qjv4C8fISzfJ79+nirUagS14vcdwdrQwk5QAYyE6SkGb
	vagizCLgnapcqOgN45oao1CMKQqpTMJB2HASHP60vnZS430LOcIo7IT+XU2mr5RmoG
	Q11zZjUDYG3SeU2KW94dbTYyW6wFnHlaognlIr6u0oElqNdJVI+qX7TUPY74rPOMuO
	3z6pL9cB53/p5HLwWB8rki40=
Date: Fri, 22 Feb 2019 17:14:23 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190222151423.GA24699@localhost>
References: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <20190221124130.25733-1-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/14] blktool: upgrade 4-7 -> 4-7.1
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
X-List-Received-Date: Fri, 22 Feb 2019 15:14:25 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, Feb 21, 2019 at 12:41:17PM +0000, Richard Purdie wrote:
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../blktool/{blktool_4-7.bb => blktool_4-7.1.bb}                | 2 ++
>  1 file changed, 2 insertions(+)
>  rename meta/recipes-extended/blktool/{blktool_4-7.bb => blktool_4-7.1.bb} (90%)
> 
> diff --git a/meta/recipes-extended/blktool/blktool_4-7.bb b/meta/recipes-extended/blktool/blktool_4-7.1.bb
> similarity index 90%
> rename from meta/recipes-extended/blktool/blktool_4-7.bb
> rename to meta/recipes-extended/blktool/blktool_4-7.1.bb
> index 0e6f7ee6df1..468925e329b 100644
> --- a/meta/recipes-extended/blktool/blktool_4-7.bb
> +++ b/meta/recipes-extended/blktool/blktool_4-7.1.bb
> @@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>  
>  DEPENDS = "glib-2.0"
>  
> +SRC_URI[sha256sum] = "b1e6d5912546d2a4b704ec65c2b9664aa3b4663e7d800e06803330335a2cb764"
> +SRC_URI[md5sum] = "62edc09c9908107e69391c87f4f3fd40"

Adding hashes insted of updating them looks wrong.

>  SRC_URI = "http://snapshot.debian.org/archive/debian/20160728T043443Z/pool/main/b/${BPN}/${BPN}_4.orig.tar.gz;name=tarball \
>...

And the recipe seems to build the stale upstream version 4,
not the Debian-patched package.

In a related note, an actual upgrade 4-7 -> 4-7.1 would have failed 
since the new patch in 4-7.1 is already applied in yocto.

# for this package we're mostly interested in tracking debian patches,
# and not in the upstream version where all development has effectively stopped

This seems to imply that every new "upstream" version requires manual 
checking of the Debian changes, and an automatic upgrade does nothing.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


