Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 515586AC43
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 08:47:19 +0000 (UTC)
Received: by wibdt2 with SMTP id dt2so41030191wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 01:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=soawLZOzJRbJoFIX11Yqo/efVfriphMqOhDmHtHKCoQ=;
	b=rIAJX4iKXPas7/264GTG8cfo1g/Hst3E4WWM/JxN+pd8iD9vU3Tn3PT7CFgWifI4bG
	BRfRLFkQFxpr1p9dPyG/1r1wZdx1aelFpHNZVGVPbh9AqZFc+j+Kbw7b6lsLWyNw0Yts
	A6H9QGzRcSdgY6OgaZXkd1pzaKdnLFr3eu0rWIw+s8MC13S5wuAjQlP3k3tIvxCUTdXJ
	KpQDsaS70l+qNeDYPJugbYnypdRLYBnhBj/ddEVvMatNtBiHwsya8X5ivFRdDvQeyTy8
	qDXtY3bhuGxGKwxoX+UwZ7B7R17Yz9AmHCbHiEunmXIp13e6QM236QMe515qICskhF8t
	vKOg==
X-Received: by 10.180.37.200 with SMTP id a8mr50684396wik.11.1433407640336;
	Thu, 04 Jun 2015 01:47:20 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id x10sm4699974wjf.45.2015.06.04.01.47.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 01:47:19 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Jun 2015 10:47:40 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150604084740.GE2376@jama>
References: <1431752323-17235-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1431752323-17235-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [fido][PATCH] e2fsprogs: install populate-extfs.sh
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
X-List-Received-Date: Thu, 04 Jun 2015 08:47:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2015 at 06:58:43AM +0200, Martin Jansa wrote:
> From: Martin Jansa <martin.jansa@gmail.com>

ping

>=20
> * install populate-extfs.sh from contrib, be aware that in order
>   to use it you need to set DEBUGFS shell variable, otherwise it will
>   try to use debugfs from relative path which is almost always
>   incorrect:
>     CONTRIB_DIR=3D$(dirname $(readlink -f $0))
>     DEBUGFS=3D"$CONTRIB_DIR/../debugfs/debugfs"
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/r=
ecipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
> index 66065bc..abc959f 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
> @@ -54,6 +54,8 @@ do_install () {
>  	oe_multilib_header ext2fs/ext2_types.h
>  	install -d ${D}${base_bindir}
>  	mv ${D}${bindir}/chattr ${D}${base_bindir}/chattr.e2fsprogs
> +
> +	install -v -m 755 ${S}/contrib/populate-extfs.sh ${D}${base_sbindir}/
>  }
> =20
>  do_install_append_class-target() {
> --=20
> 2.4.0
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

