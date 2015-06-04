Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2F822736BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 08:36:50 +0000 (UTC)
Received: by wibdt2 with SMTP id dt2so40721858wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 01:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=1X475kJtjGXUN3z5X98wuwZ+szslPMoWtamfiM/Mq+E=;
	b=NdqcD0MCLTQRbUSJKRuG65NZdQoklR40bUPahcKRuv/OM6Itfe9KQpFms6xkrxxqY2
	PZ5aV80gZriCyskezGzLiKR+0A3av+Lvul7sIAIKuOVDXbpTAspj/8MkJfBkoOh0oegS
	30+ft6z7dlcXpvJwPRnwavp2rU6WZLzyj2GVabvAhLyCfP30mA2oGnMzo8KshAKeVFmY
	eM8e4o4/JiSPvIHIHxe288ZlkJsR+bBSkXh4LdpHIhXQSBE5kJA9/wDAgniEAlH2USFE
	eQjyMb2I21/1CXoPE2aexiYk8ewsVCeyCW1dImvSqryS5H9fEO2YhcO6P6voAVKzm4QZ
	TDbQ==
X-Received: by 10.180.230.199 with SMTP id ta7mr5178528wic.1.1433407011681;
	Thu, 04 Jun 2015 01:36:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id x10sm4656368wjf.45.2015.06.04.01.36.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 01:36:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Jun 2015 10:37:11 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150604083711.GC2376@jama>
References: <1432207451-32310-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1432207451-32310-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [dizzy][PATCH] squashfs-tools: build and install unsquashfs as well
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
X-List-Received-Date: Thu, 04 Jun 2015 08:36:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2015 at 01:24:11PM +0200, Martin Jansa wrote:
> * it's useful for debugging corrupt squashfs images from mksquashfs

ping

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb b=
/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
> index d36f0fe..19d555e1 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
> @@ -27,11 +27,12 @@ SPDX_S =3D "${WORKDIR}/squashfs${PV}"
>  EXTRA_OEMAKE =3D "MAKEFLAGS=3D LZMA_SUPPORT=3D1 LZMA_DIR=3D../.. XZ_SUPP=
ORT=3D1 LZO_SUPPORT=3D1 LZ4_SUPPORT=3D1"
> =20
>  do_compile() {
> -        oe_runmake mksquashfs
> +	oe_runmake mksquashfs unsquashfs
>  }
>  do_install () {
>          install -d ${D}${sbindir}
>          install -m 0755 mksquashfs ${D}${sbindir}/
> +	install -m 0755 unsquashfs ${D}${sbindir}/
>  }
> =20
>  ARM_INSTRUCTION_SET =3D "arm"
> --=20
> 2.4.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

