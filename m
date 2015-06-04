Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id D3DC8755FA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 08:36:27 +0000 (UTC)
Received: by wiwd19 with SMTP id d19so13665589wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 01:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=QgL+8XZsCXNGFUcdORGZhLXyZluBNqfVpl8mHxSB+BM=;
	b=N5CbrinwhNskI94JjsgSwUK0bpxwyVuS01SOAknOlUVJq/8ERb0e3LGUhKk4bzAlEn
	ixC+uu+a5x/rbNKNzsSaTdkebryMAPtwsoeyAjITSYWP0Y/O52kyBHNl3rR2FrqMTreB
	G9Cgjbh4qUFKihzVKayNDHHn4hTdshxmtmJxl+Li93j3wFy4NUne78YirtYOMbVK5NWA
	CVlL94/7P7oMOvZx6EYEmRrP6p61pxhiBUqh4qa3prrL3DAlOThIUNASXd2WLhhbFq2p
	FQx4Zm3/Oekoy/9y6kbBzdJ5el8khm0XQu5HulEVuYai96+h2k+Svb5lkOkUbP/hACgX
	6KyQ==
X-Received: by 10.194.63.228 with SMTP id j4mr69842408wjs.38.1433406988250;
	Thu, 04 Jun 2015 01:36:28 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	gw7sm30137914wib.15.2015.06.04.01.36.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 01:36:27 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 4 Jun 2015 10:36:48 +0200
To: openembedded-core@lists.openembedded.org
Message-ID: <20150604083648.GB2376@jama>
References: <1431752355-17659-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1431752355-17659-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [dizzy][PATCH] e2fsprogs: install populate-extfs.sh
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
X-List-Received-Date: Thu, 04 Jun 2015 08:36:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2015 at 06:59:15AM +0200, Martin Jansa wrote:
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
> index 70ccdfd..95c612c 100644
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

