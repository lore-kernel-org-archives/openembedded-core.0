Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web11.1813.1588749023859437488
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 00:10:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=CFJp3cPv;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=fjce=6u=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49H75l5j8gzd;
	Wed,  6 May 2020 09:10:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1588749020;
	bh=dcYsM/gI1mOZM1HANzUuoXmTPOTDBB+xuBTgxGuxNgs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CFJp3cPvWk7+tMJ3I3S7htH289dKGl4PSkruTrAbAaVF8DtPryZz8PdN7YhJ7hMrm
	 toc11VGmLTdflRz+XM83t3hEBxnhaWWrjTAiFdgx6RfAa1IRfDtBo5lE2c1OCt2MJw
	 p861Ozhp+qFgKCQHdjLcjGfWvTmWUs0cfO0qzLdahSKDdqC9TWgnQSeTi0rSI59RRb
	 7gaAHyyCs45gyGKK5qNB4xdLlctd60PoX5nPEnQGY+HwPEs7ctpMv/KH7zesPWGhd+
	 0BIvvLV1SjdbmCWKmtI3hSqk6INQ+76P8q0IbhBYwTbHwT0+UFm5Xe3/87GSazdPrO
	 uUc3ZVYFGlCORG0fFbSJEyG+zVKfn9jGGpwpXYojpO95zao6G16R6n3I4drmmMpsd8
	 ReecLaVFUPy7yRJybNJ0Rhs9IINjHqOMTJBil1g+fjLiaVFjVX0+ol3zV+E3/dYl/I
	 nM4/hW/pxg4MKxDm8Sp5vLuxI1Bn4qSAd4J3ohEZWwkujX6KDUbh9vhYyiXrO7Qmy8
	 3VNBOVwFIrdPvNlPtPvyamzkqFzmMYpn3UBp0p+BbjxtaICnneUtAsNlIDgqeX8R/E
	 Iu4Vfjamt+oTNo765ctJzYzYqQlbzApzENQzGGY9sJN0W4uW7VqVETtETa9N4xwkbC
	 rVABY++cEkVufLS5o3Cc25ZA=
Date: Wed, 6 May 2020 10:10:16 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] dtc: update to 1.6.0
Message-ID: <20200506071016.GA31672@localhost>
References: <20200505115535.141557-1-richard.leitner@skidata.com>
MIME-Version: 1.0
In-Reply-To: <20200505115535.141557-1-richard.leitner@skidata.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 05, 2020 at 01:55:35PM +0200, Richard Leitner wrote:
>...
> --- a/meta/recipes-kernel/dtc/dtc_1.5.1.bb
> +++ b/meta/recipes-kernel/dtc/dtc_1.6.0.bb
> @@ -3,7 +3,7 @@ require dtc.inc
>  LIC_FILES_CHKSUM = "file://GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>  		    file://libfdt/libfdt.h;beginline=4;endline=7;md5=05bb357cfb75cae7d2b01d2ee8d76407"
>  
> -SRCREV = "60e0db3d65a1218b0d5a29474e769f28a18e3ca6"
> +SRCREV = "v${PV}"
>...

It is tempting to use tags, but it is a bad idea.
Upstream might move a tag to a different commit.
Someone might do a man-in-the-middle attack on a specific user,
and there is no other verification of the sources apart from
the commit hash.

cu
Adrian
