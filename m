Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id A93F26FF78
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Sep 2016 05:09:53 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id 2so8375096oif.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 22:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=CW4Ji+uQKhywIBH0PH3N2lheEmLFLtPqG5I23OzPG4Q=;
	b=zVCblNHJpqWY0mm8ekXHYJUV5r0RjY3CKmaZ1ox63nJ5u9CWSi4EdWBWogtaaFVK/K
	FcEK+rmhq9mkRPbdTloEBw8FfuEK0h9ZKOS7j5MOShUPsycbBk8OD9cdIu1B1DQHSh+k
	98vrtik+kCHLxo4dFDL4kboQs65GENwdHSEMia3hbY5+RtYd22HlcGYK05r2HbcZX6Ne
	1+Uh86wHW5Y0smr5a9uE0i9X8SRnciWJ/03GeQn0lhdIOdPuNeJAqt2Gx1WeL9UL+D4R
	dGW4xR1ruxvXQfyw9UT6DLsGxjuS5emgsQYXLVZINydaAbH2OS9i8MCBR8vwUVggNYv9
	WeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=CW4Ji+uQKhywIBH0PH3N2lheEmLFLtPqG5I23OzPG4Q=;
	b=P8PA3lP2oJ1sWf9L+7VCrDOEw7tUAfW0u8iahMryBdbIXIbSaQxPo5xmkIp39IlW0d
	JqBji7GeEAzmjjcWZXnzpCg5KzR1A4uSL3skV2FXl6k15cDh6B+Rl5O1f3XHhTwWcHZZ
	EyjCPQKBP9afxXMiz8dBGDTguLCzvndIsp+wbU54e9iFSpgVqPoAYzchWk8vbmW/vH1y
	eVz09rKu/humHWvJTzXagL8SCMRj6cunxQ2jJIelNxEl9dr1GJVrl1r/K7oEGBZggYGv
	6PZhOWm7gmDa6/HnysFFeN6/FZVBMLzQkXpKXnNFIyCi38Eu0I3n8Ikmn5oqAB9HM6kd
	1cYw==
X-Gm-Message-State: AE9vXwPyNJurGC6X//Pexe8TOXwZKD9SzfkelwzTpIRki4y9I6YoPDWohzCofJ7IFpZhlMR+GmkP1IWhHq2xFQ==
X-Received: by 10.202.75.16 with SMTP id y16mr16206800oia.52.1474088994638;
	Fri, 16 Sep 2016 22:09:54 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Fri, 16 Sep 2016 22:09:34 -0700 (PDT)
In-Reply-To: <1474076227-17032-1-git-send-email-Randy.MacLeod@windriver.com>
References: <1474076227-17032-1-git-send-email-Randy.MacLeod@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Fri, 16 Sep 2016 22:09:34 -0700
X-Google-Sender-Auth: BiYkhtKdEl5bH2VGqPTeO-q4mq0
Message-ID: <CABcZANk=aHGZVw5vnh5+KyQaxLa8=7NB2GuFt49P0B_hDyaXcQ@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: add packageconfig for -file-
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
X-List-Received-Date: Sat, 17 Sep 2016 05:09:57 -0000
Content-Type: multipart/alternative; boundary=001a11c15442e4949f053cad16a6

--001a11c15442e4949f053cad16a6
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 16, 2016 at 6:37 PM, Randy MacLeod <Randy.MacLeod@windriver.com=
>
wrote:

> Without a packageconfig dependency for the file utility, there's
> a very rare compile faiure caused by a race where the magic.h
> header file is not found:
>
>  ../../../git/lib/support/plausible.c:33:19: fatal error: magic.h: No
> such file or directory
>
> This file, plausible.c, is part of libsupport.a which is used by
> many binaries produced by the e2fsprogs package. plausible.c attempts
> to dynamically load libmagic.so if the e2fsprogs configure detects
> that magic was available. Adding the packageconfig will eliminate
> the build as well as the possible configure-time race condition.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> index f4855bc..1707cb9 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
> @@ -23,6 +23,7 @@ EXTRA_OECONF +=3D "--libdir=3D${base_libdir}
> --sbindir=3D${base_sbindir} \
>  EXTRA_OECONF_darwin =3D "--libdir=3D${base_libdir} --sbindir=3D${base_sb=
indir}
> --enable-bsd-shlibs"
>
>  PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG[file] =3D ',,file'
>

This isn=E2=80=99t going to be good enough. You aren=E2=80=99t explicitly
enabling/disabling the option, so it=E2=80=99ll still detect based on what=
=E2=80=99s in the
sysroot, so recipe build order will result in non-deterministic behavior.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c15442e4949f053cad16a6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Fri, Sep 16, 2016 at 6:37 PM, Randy MacLeod <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy.MacLeod@wi=
ndriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":21p" class=3D"a3s aXjCH m15735cd0fa519af0">Without a packageconfig dep=
endency for the file utility, there&#39;s<br>
a very rare compile faiure caused by a race where the magic.h<br>
header file is not found:<br>
<br>
=C2=A0../../../git/lib/support/<wbr>plausible.c:33:19: fatal error: magic.h=
: No such file or directory<br>
<br>
This file, plausible.c, is part of libsupport.a which is used by<br>
many binaries produced by the e2fsprogs package. plausible.c attempts<br>
to dynamically load libmagic.so if the e2fsprogs configure detects<br>
that magic was available. Adding the packageconfig will eliminate<br>
the build as well as the possible configure-time race condition.<br>
<br>
Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacLeod@windriver.=
com">Randy.MacLeod@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fsprogs_1.43=
.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.bb</a> | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fspro=
gs_1.43.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.bb</a> b/me=
ta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fsprogs_1.43.bb" rel=
=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.bb</a><br>
index f4855bc..1707cb9 100644<br>
--- a/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fsprogs_1.43=
.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.bb</a><br>
+++ b/meta/recipes-devtools/<wbr>e2fsprogs/<a href=3D"http://e2fsprogs_1.43=
.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.bb</a><br>
@@ -23,6 +23,7 @@ EXTRA_OECONF +=3D &quot;--libdir=3D${base_libdir} --sbind=
ir=3D${base_sbindir} \<br>
=C2=A0EXTRA_OECONF_darwin =3D &quot;--libdir=3D${base_libdir} --sbindir=3D$=
{base_sbindir} --enable-bsd-shlibs&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
+PACKAGECONFIG[file] =3D &#39;,,file&#39;</div></blockquote></div><br>This =
isn=E2=80=99t going to be good enough. You aren=E2=80=99t explicitly enabli=
ng/disabling the option, so it=E2=80=99ll still detect based on what=E2=80=
=99s in the sysroot, so recipe build order will result in non-deterministic=
 behavior.<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail=
_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - B=
itBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software E=
ngineer, Mentor Graphics</div>
</div></div>

--001a11c15442e4949f053cad16a6--
