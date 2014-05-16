Return-Path: <jacob.kroon@gmail.com>
X-Greylist: delayed 448 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 16 May 2014 05:21:25 UTC
Received: from mail-la0-f47.google.com (unknown [209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 230D9605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 05:21:25 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id pn19so1544788lab.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 May 2014 22:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=+RwE2TJ5fskOseets0kJ1dxTdsNYWfKFfd9g2xHF+K0=;
	b=rA8ZO2544SEFLlslFFyOncHf5qxEmwYn1BjUkfb56aF71q7xLCJoEO++AVxfZHZClQ
	D/ZClqu+uVbh4QN3itlCrVCtL+nZXGqlFBXFAX/J8ZPrxT0/AmZKj6NhU5ty99EXacdE
	DSiM8eA1Ye8d3R4NJlKDxVek9rKshDjBmrasuiJ1c0CH2wAknxiNOjUUwyU3T3Z1fNmp
	lxygW0KRuVXNDnxRpSw5hKCIkissv29iB7pWlZUa3fqFaM0PKsc9WkQx5AFuBXQUgjSY
	1TkB6LvoToggeo53GdPiMIdpSG6L1sr5VAjZ0P9QHL33QxTvTu2e57061qWh0Ag7bdsP
	uGZQ==
MIME-Version: 1.0
X-Received: by 10.152.28.166 with SMTP id c6mr241125lah.51.1400217237295; Thu,
	15 May 2014 22:13:57 -0700 (PDT)
Received: by 10.112.99.106 with HTTP; Thu, 15 May 2014 22:13:57 -0700 (PDT)
In-Reply-To: <1400169517-29966-1-git-send-email-sgw@linux.intel.com>
References: <1400169517-29966-1-git-send-email-sgw@linux.intel.com>
Date: Fri, 16 May 2014 07:13:57 +0200
Message-ID: <CAPbeDC=LgSCO0F7gB7nCJQCgXQrUvRAJCUt35Ss2JrVVWB21dQ@mail.gmail.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libusb1: Update to 1.0.18
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
X-List-Received-Date: Fri, 16 May 2014 05:21:28 -0000
Content-Type: multipart/alternative; boundary=089e0158c7c009979204f97d7b4c

--089e0158c7c009979204f97d7b4c
Content-Type: text/plain; charset=UTF-8

Hello Saul,

On Thu, May 15, 2014 at 5:58 PM, Saul Wold <sgw@linux.intel.com> wrote:

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../{libusb1-1.0.9 => libusb1}/obsolete_automake_macros.patch      | 0
>  .../recipes-support/libusb/{libusb1_1.0.9.bb => libusb1_1.0.18.bb} | 7
> ++-----
>  2 files changed, 2 insertions(+), 5 deletions(-)
>  rename meta/recipes-support/libusb/{libusb1-1.0.9 =>
> libusb1}/obsolete_automake_macros.patch (100%)
>  rename meta/recipes-support/libusb/{libusb1_1.0.9.bb => libusb1_1.0.18.bb}
> (78%)
>
> diff --git
> a/meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch
> b/meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
> similarity index 100%
> rename from
> meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_macros.patch
> rename to
> meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patch
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.9.bbb/meta/recipes-support/libusb/
> libusb1_1.0.18.bb
> similarity index 78%
> rename from meta/recipes-support/libusb/libusb1_1.0.9.bb
> rename to meta/recipes-support/libusb/libusb1_1.0.18.bb
> index d57425b..c64f1db 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.9.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.18.bb
> @@ -8,14 +8,11 @@ LIC_FILES_CHKSUM =
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>
>  BBCLASSEXTEND = "native nativesdk"
>
> -PR = "r1"
> -
>  SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
> -           file://obsolete_automake_macros.patch \
>            "
>

That patch is still in git, maybe it should be removed as well ?

/Jacob

--089e0158c7c009979204f97d7b4c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">Hell=
o Saul,<br><br>On Thu, May 15, 2014 at 5:58 PM, Saul Wold <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linux.int=
el.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Signed-off-by: Saul Wold &lt;<a href=3D"mail=
to:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0.../{libusb1-1.0.9 =3D&gt; libusb1}/obsolete_automake_macros.patch =
=C2=A0 =C2=A0 =C2=A0| 0<br>
=C2=A0.../recipes-support/libusb/{<a href=3D"http://libusb1_1.0.9.bb" targe=
t=3D"_blank">libusb1_1.0.9.bb</a> =3D&gt; <a href=3D"http://libusb1_1.0.18.=
bb" target=3D"_blank">libusb1_1.0.18.bb</a>} | 7 ++-----<br>
=C2=A02 files changed, 2 insertions(+), 5 deletions(-)<br>
=C2=A0rename meta/recipes-support/libusb/{libusb1-1.0.9 =3D&gt; libusb1}/ob=
solete_automake_macros.patch (100%)<br>
=C2=A0rename meta/recipes-support/libusb/{<a href=3D"http://libusb1_1.0.9.b=
b" target=3D"_blank">libusb1_1.0.9.bb</a> =3D&gt; <a href=3D"http://libusb1=
_1.0.18.bb" target=3D"_blank">libusb1_1.0.18.bb</a>} (78%)<br>
<br>
diff --git a/meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_ma=
cros.patch b/meta/recipes-support/libusb/libusb1/obsolete_automake_macros.p=
atch<br>
similarity index 100%<br>
rename from meta/recipes-support/libusb/libusb1-1.0.9/obsolete_automake_mac=
ros.patch<br>
rename to meta/recipes-support/libusb/libusb1/obsolete_automake_macros.patc=
h<br>
diff --git a/meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.9.bb=
" target=3D"_blank">libusb1_1.0.9.bb</a> b/meta/recipes-support/libusb/<a h=
ref=3D"http://libusb1_1.0.18.bb" target=3D"_blank">libusb1_1.0.18.bb</a><br=
>
similarity index 78%<br>
rename from meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.9.bb"=
 target=3D"_blank">libusb1_1.0.9.bb</a><br>
rename to meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.18.bb" =
target=3D"_blank">libusb1_1.0.18.bb</a><br>
index d57425b..c64f1db 100644<br>
--- a/meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.9.bb" targe=
t=3D"_blank">libusb1_1.0.9.bb</a><br>
+++ b/meta/recipes-support/libusb/<a href=3D"http://libusb1_1.0.18.bb" targ=
et=3D"_blank">libusb1_1.0.18.bb</a><br>
@@ -8,14 +8,11 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dfbc093901=
857fcd118f065f900982c24&quot;<br>
<br>
=C2=A0BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
<br>
-PR =3D &quot;r1&quot;<br>
-<br>
=C2=A0SRC_URI =3D &quot;${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \=
<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://obsolete_automake_macros.patch =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br></blockquote><br></div>T=
hat patch is still in git, maybe it should be removed as well ?<br><br></di=
v><div class=3D"gmail_extra">/Jacob<br></div></div>

--089e0158c7c009979204f97d7b4c--
