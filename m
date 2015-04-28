Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6F6D472491
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 21:30:03 +0000 (UTC)
Received: by wizk4 with SMTP id k4so156992517wiz.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Apr 2015 14:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=RxzLtU+uaZVLWXRFgqK6W/G4/cMB+Kr1nsXOTvljMoM=;
	b=qiFMTO27/u16fDof9TL7/2KNbLYBo80XKDX8qrfSaHLJbcVq7NsR6d7Dd8FZiofrjP
	zGuq1/TwZ0MmERMNqsiW6kJTAFn0ziZBASLvPSmmVHws2HWCRltTNpo1+mHu3tm3gcmV
	CuYKo8rfBkHUA5888GzClJrnsFHG+hh7gCq+qds6qpx57iyREJIAaxm/TM+mwVn0naG6
	74cxzEijOWKF9RRga8C711C3FB7XpzeiCOws4ITaPFJXMkz6Yf1IefhNvg2oFtJ7ruip
	jjmh7Y0rVG50HTjEFp+pgCKJfCgEoeRBNFkRydJcFGudRjwElb4g7UERtKOVicl9m27n
	yc1Q==
X-Received: by 10.194.6.102 with SMTP id z6mr27076775wjz.121.1430256604921;
	Tue, 28 Apr 2015 14:30:04 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id
	es5sm36031914wjc.30.2015.04.28.14.30.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Apr 2015 14:30:03 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 28 Apr 2015 23:30:07 +0200
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20150428213007.GC2322@jama>
References: <1430251922-28699-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1430251922-28699-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: bring back the patch to customise root's $HOME
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
X-List-Received-Date: Tue, 28 Apr 2015 21:30:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2015 at 09:12:02PM +0100, Ross Burton wrote:
> This patch appears to have been accidently dropped in the move to 219-sta=
ble,
> probably because it didn't apply.  Update the patch and re-add it.

what about the unused .patch files reported in:
http://lists.openembedded.org/pipermail/openembedded-core/2015-April/104197=
=2Ehtml
?

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../systemd/systemd/0010-Make-root-s-home-directory-configurable.patch |=
 3 ++-
>  meta/recipes-core/systemd/systemd_219.bb                               |=
 1 +
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-dire=
ctory-configurable.patch b/meta/recipes-core/systemd/systemd/0010-Make-root=
-s-home-directory-configurable.patch
> index 41b9039..b65fe42 100644
> --- a/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-c=
onfigurable.patch
> +++ b/meta/recipes-core/systemd/systemd/0010-Make-root-s-home-directory-c=
onfigurable.patch
> @@ -26,10 +26,11 @@ diff --git a/Makefile.am b/Makefile.am
>  index 0fb3f9f..4623963 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -199,6 +199,7 @@ AM_CPPFLAGS =3D \
> +@@ -199,7 +199,8 @@ AM_CPPFLAGS =3D \
>   	-DKEXEC=3D\"$(KEXEC)\" \
>   	-DLIBDIR=3D\"$(libdir)\" \
>   	-DROOTLIBDIR=3D\"$(rootlibdir)\" \
> + 	-DROOTLIBEXECDIR=3D\"$(rootlibexecdir)\" \
>  +	-DROOTHOMEDIR=3D\"$(roothomedir)\" \
>   	-DTEST_DIR=3D\"$(abs_top_srcdir)/test\" \
>   	-I $(top_srcdir)/src \
> diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core=
/systemd/systemd_219.bb
> index d1303f7..c196017 100644
> --- a/meta/recipes-core/systemd/systemd_219.bb
> +++ b/meta/recipes-core/systemd/systemd_219.bb
> @@ -38,6 +38,7 @@ SRC_URI =3D "git://anongit.freedesktop.org/systemd/syst=
emd-stable;branch=3Dv219-stab
>             file://0007-util-Use-mkostemp-only-if-libc-supports-it.patch \
>             file://0008-util-bypass-unimplemented-_SC_PHYS_PAGES-system-c=
onf.patch \
>             file://0009-sysv-generator-add-support-for-executing-scripts-=
und.patch \
> +           file://0010-Make-root-s-home-directory-configurable.patch \
>             file://0011-systemd-user-avoid-using-system-auth.patch \
>             file://0012-systemd-tmpfiles.c-Honor-ordering-within-files-as=
-th.patch \
>             file://0014-Revert-rules-remove-firmware-loading-rules.patch \
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

