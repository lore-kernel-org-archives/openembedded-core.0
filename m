Return-Path: <rehsack@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 41D9379C9D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 14:53:19 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id a8-v6so1470156wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 06:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=BOFFrqV2aZAwb1N9N3h/8XQRupuPHULtggwLOX95BTg=;
	b=FTi8L90jj7aCkKs4Tjsz0JSAJCnAzLf2o6tCLroSfdnXRWy+1oKeOLsz1wIgAnr+Au
	rH7gsETzzXM8jfc+L63vdo0DrREvJ5ThK4azhl+04fP424gDmo8b32sEBK59QDTOINsY
	uP16LHFDbW4vPfyDtF7LMCz15uJqaJTjrzllETp+LttHSC6ErFR0Kur0ms3w4uYeqGP4
	ttxOfZ7IHd3l/sQyB8rYBLE+WNd1YtMElcpaGsdRtwFVplFHAVqbgfd18qoykot3ga4l
	rHmdVfgNhDkQTUR0cxDeEcJCBJiuWpyQPLtHP7pqw0+3duQK0p5qLFWCzcRmtjXyC6H1
	L6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=BOFFrqV2aZAwb1N9N3h/8XQRupuPHULtggwLOX95BTg=;
	b=Gon5g5hKF+BysI+2cwpfOlNxxRFrcWP58DaPrRE+ceH2KLl5fzpxBgsv5kEosa0wB3
	DiiGASrv7V1w1OdWqDanh+GL5H4nD82PjVY3Jrp0hTCyvsYBvQcQHEFil+DGoVRtPZ7Y
	m0MN5UdFO4G+ZRtqRdH04Pjy8dipRJH7Yv5Aghqq8NdeaJQfeJZx6HPh+wwsHwxvaMg2
	V37GT6kjdlNXO9OiixtDA6y+FLNBEEh92qnsTjeSxm1el1zWBhKAAi3cpzzR1f8dXGqs
	8AiDvBcRyBdT1+BJAuECluFcoM8hDSIkauJX0fCRfQ9k3TBFerzmMNvW6enSJLeDhi2Z
	jU2Q==
X-Gm-Message-State: AGRZ1gII+F5RlOtAjAoZBod5ZGtMnf3qJhg/u1c7KjU5z+UX7lw6qTOo
	t3M2XWANXHRLx8j5iHXsBeQ=
X-Google-Smtp-Source: AJdET5cUzTSV9NbBda9WweQhpsjiMSigAsCkiaFrTpyYzCX91LwZUA00/CwJjeoFB2y+QDWt4ZQGyg==
X-Received: by 2002:a7b:c183:: with SMTP id
	y3-v6mr1454208wmi.150.1541688799686; 
	Thu, 08 Nov 2018 06:53:19 -0800 (PST)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	s195-v6sm3702102wmd.39.2018.11.08.06.53.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 06:53:18 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <FB4F7315-9363-4F94-B5B0-3C736A1AE7FA@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Thu, 8 Nov 2018 15:53:16 +0100
In-Reply-To: <20181106122429.24563-1-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
References: <20181106122429.24563-1-ross.burton@intel.com>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: fix link with new sqlite3
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
X-List-Received-Date: Thu, 08 Nov 2018 14:53:19 -0000
X-Groupsio-MsgNum: 118046
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DF87F14D-9975-4482-9819-F0C1D838602B";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_DF87F14D-9975-4482-9819-F0C1D838602B
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_0FF2129A-B66E-42FD-BBB9-9C0EA1861183"

--Apple-Mail=_0FF2129A-B66E-42FD-BBB9-9C0EA1861183
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 06.11.2018 um 13:24 schrieb Ross Burton <ross.burton@intel.com>:
>=20
> If sqlite3 is built with FTS5 it uses log() from libm, but that =
linkage is lost
> if we manually statically link so explicitly link to libm.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-devtools/pseudo/files/libm.patch | 33 =
+++++++++++++++++++++++++++
> meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
> 2 files changed, 34 insertions(+)
> create mode 100644 meta/recipes-devtools/pseudo/files/libm.patch
>=20
> diff --git a/meta/recipes-devtools/pseudo/files/libm.patch =
b/meta/recipes-devtools/pseudo/files/libm.patch
> new file mode 100644
> index 00000000000..1a82979313d
> --- /dev/null
> +++ b/meta/recipes-devtools/pseudo/files/libm.patch
> @@ -0,0 +1,33 @@
> +If sqlite3 is built with FTS5 enabled then it links to libm.so for =
log(), but if
> +we statically link to libsqlite3.a then this linkage is lost.
> +
> +Work around this by always linking to libm.so.
> +
> +Upstream-Status: Submitted
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +=46rom 4633a8750f0966621d258548fba82bc6aa5aa997 Mon Sep 17 00:00:00 =
2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Tue, 6 Nov 2018 12:13:17 +0000
> +Subject: [PATCH] Makefile: sqlite can need libm
> +
> +---
> + Makefile.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.in b/Makefile.in
> +index ad6541b..28b5ecb 100644
> +--- a/Makefile.in
> ++++ b/Makefile.in
> +@@ -73,7 +73,7 @@ WRAPOBJS=3Dpseudo_wrappers.o
> +
> + # needed for anything that links with pseduo_client.o, pretty much
> + CLIENT_LDFLAGS=3D-ldl -lpthread
> +-DB_LDFLAGS=3D@SQLITE_LDARG@ -lpthread
> ++DB_LDFLAGS=3D@SQLITE_LDARG@ -lpthread -lm
> +
> + PSEUDO=3D$(BIN)/pseudo
> + PSEUDODB=3D$(BIN)/pseudodb
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb =
b/meta/recipes-devtools/pseudo/pseudo_git.bb
> index 79e0b6bd21a..c9a4ecd2e23 100644
> --- a/meta/recipes-devtools/pseudo/pseudo_git.bb
> +++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
> @@ -2,6 +2,7 @@ require pseudo.inc
>=20
> SRC_URI =3D "git://git.yoctoproject.org/pseudo \
>            file://0001-configure-Prune-PIE-flags.patch \
> +           file://libm.patch \
>            file://fallback-passwd \
>            file://fallback-group \
>            file://moreretries.patch \
> --
> 2.11.0
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


I digged a bit deeper (since I'd like to get a reasonable solution even =
for other dependent components) and would say, pseudo will also fail, =
when sqlite3 is build using readline or libz.
The better option will be to let pseudo use the libs and link-flags from =
sqlite.pc

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_0FF2129A-B66E-42FD-BBB9-9C0EA1861183
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 06.11.2018 um 13:24 schrieb Ross Burton &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">If =
sqlite3 is built with FTS5 it uses log() from libm, but that linkage is =
lost<br class=3D"">if we manually statically link so explicitly link to =
libm.<br class=3D""><br class=3D"">Signed-off-by: Ross Burton &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt;<br class=3D"">---<br class=3D""> =
meta/recipes-devtools/pseudo/files/libm.patch | 33 =
+++++++++++++++++++++++++++<br class=3D""> =
meta/recipes-devtools/pseudo/pseudo_git.bb &nbsp;&nbsp;&nbsp;| &nbsp;1 =
+<br class=3D""> 2 files changed, 34 insertions(+)<br class=3D""> create =
mode 100644 meta/recipes-devtools/pseudo/files/libm.patch<br =
class=3D""><br class=3D"">diff --git =
a/meta/recipes-devtools/pseudo/files/libm.patch =
b/meta/recipes-devtools/pseudo/files/libm.patch<br class=3D"">new file =
mode 100644<br class=3D"">index 00000000000..1a82979313d<br class=3D"">---=
 /dev/null<br class=3D"">+++ =
b/meta/recipes-devtools/pseudo/files/libm.patch<br class=3D"">@@ -0,0 =
+1,33 @@<br class=3D"">+If sqlite3 is built with FTS5 enabled then it =
links to libm.so for log(), but if<br class=3D"">+we statically link to =
libsqlite3.a then this linkage is lost.<br class=3D"">+<br =
class=3D"">+Work around this by always linking to libm.so.<br =
class=3D"">+<br class=3D"">+Upstream-Status: Submitted<br =
class=3D"">+Signed-off-by: Ross Burton &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt;<br class=3D"">+<br =
class=3D"">+=46rom 4633a8750f0966621d258548fba82bc6aa5aa997 Mon Sep 17 =
00:00:00 2001<br class=3D"">+From: Ross Burton &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt;<br class=3D"">+Date: Tue, 6 Nov =
2018 12:13:17 +0000<br class=3D"">+Subject: [PATCH] Makefile: sqlite can =
need libm<br class=3D"">+<br class=3D"">+---<br class=3D"">+ <a =
href=3D"http://Makefile.in" class=3D"">Makefile.in</a> | 2 +-<br =
class=3D"">+ 1 file changed, 1 insertion(+), 1 deletion(-)<br =
class=3D"">+<br class=3D"">+diff --git a/<a href=3D"http://Makefile.in" =
class=3D"">Makefile.in</a> b/<a href=3D"http://Makefile.in" =
class=3D"">Makefile.in</a><br class=3D"">+index ad6541b..28b5ecb =
100644<br class=3D"">+--- a/<a href=3D"http://Makefile.in" =
class=3D"">Makefile.in</a><br class=3D"">++++ b/<a =
href=3D"http://Makefile.in" class=3D"">Makefile.in</a><br class=3D"">+@@ =
-73,7 +73,7 @@ WRAPOBJS=3Dpseudo_wrappers.o<br class=3D"">+ <br =
class=3D"">+ # needed for anything that links with pseduo_client.o, =
pretty much<br class=3D"">+ CLIENT_LDFLAGS=3D-ldl -lpthread<br =
class=3D"">+-DB_LDFLAGS=3D@SQLITE_LDARG@ -lpthread<br =
class=3D"">++DB_LDFLAGS=3D@SQLITE_LDARG@ -lpthread -lm<br class=3D"">+ =
<br class=3D"">+ PSEUDO=3D$(BIN)/pseudo<br class=3D"">+ =
PSEUDODB=3D$(BIN)/pseudodb<br class=3D"">+-- <br class=3D"">+2.11.0<br =
class=3D"">+<br class=3D"">diff --git =
a/meta/recipes-devtools/pseudo/pseudo_git.bb =
b/meta/recipes-devtools/pseudo/pseudo_git.bb<br class=3D"">index =
79e0b6bd21a..c9a4ecd2e23 100644<br class=3D"">--- =
a/meta/recipes-devtools/pseudo/pseudo_git.bb<br class=3D"">+++ =
b/meta/recipes-devtools/pseudo/pseudo_git.bb<br class=3D"">@@ -2,6 +2,7 =
@@ require pseudo.inc<br class=3D""><br class=3D""> SRC_URI =3D "<a =
href=3D"git://git.yoctoproject.org/pseudo" =
class=3D"">git://git.yoctoproject.org/pseudo</a> \<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///0001-configure-Prune-PIE-flags.patch" =
class=3D"">file://0001-configure-Prune-PIE-flags.patch</a> \<br =
class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///libm.patch" class=3D"">file://libm.patch</a> \<br =
class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///fallback-passwd" class=3D"">file://fallback-passwd</a> =
\<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///fallback-group" class=3D"">file://fallback-group</a> =
\<br class=3D""> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a =
href=3D"file:///moreretries.patch" class=3D"">file://moreretries.patch</a>=
 \<br class=3D"">-- <br class=3D"">2.11.0<br class=3D""><br class=3D"">-- =
<br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></div></blockquote></div><div class=3D""><br =
class=3D""></div><div class=3D"">I digged a bit deeper (since I'd like =
to get a reasonable solution even for other dependent components) and =
would say, pseudo will also fail, when sqlite3 is build using readline =
or libz.</div><div class=3D"">The better option will be to let pseudo =
use the libs and link-flags from sqlite.pc</div><div class=3D""><br =
class=3D""></div><div class=3D"">Cheers</div><div class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></body></html>=

--Apple-Mail=_0FF2129A-B66E-42FD-BBB9-9C0EA1861183--

--Apple-Mail=_DF87F14D-9975-4482-9819-F0C1D838602B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlvkTdwACgkQRJmWrtzl
Cp2skxAAiEmIXTMS5qgr9oc3xHlXNaKlKs12eOm0uX/sm/mmlP7BzNBMJZnWs8mN
yflu6yFemdq2FwMwovq/4WUt9sMTJf1zAmIdnIq9fY4pbaDkinWqEUIx2h6sSM/i
OAeGS5XrWELLkAQhQBwXzEHddQitKp2RW1JnE1GALC594ZY6Or0GnQal5IiN9YJf
0ZU9vLgn1hO/WSvf63unHnrYqPfMWMGHOM84Jx7fCe+bYR1Do67RfZVFWOwZjCid
Nty2ZfA0yRjlSNSqvKgTyuQdTVpMEvNdDSvHUp3BfV8HtZkZ0VmL4TttYSC5ontK
dEfNEhRC/4qRWaCaMcgInSqcMSxxaTbyIrg/4MbTP9S8PL4bIf11SaoElurwHheJ
s27TzSLCO8JC8TVBEUiT0tJHEJgwS34T/WJV3eQTYsK2hA0rFdVgQdgMFeKggOMs
MaLCz82TNslAbCalJEWsHhj6DYp6mQStpY0eUHNbAkXWdODG3EpcWWzKQNa8TfHx
IWb70sfBKRcOuQ0hXCRlOHDFA1ooWe34nubjmwNvCgXvDjhlGX1OfdifDUazksI9
auw1SpvBBSb2J55+zfb3vVQjrK10s02BuEVMnszGqgPsXFLt5iK3ncymKwiMZb+m
axBp0fBOjqaqneTnZHaGQePFXyQq/lvmhX4FokkOLUPZh5zQbII=
=xB9y
-----END PGP SIGNATURE-----

--Apple-Mail=_DF87F14D-9975-4482-9819-F0C1D838602B--
