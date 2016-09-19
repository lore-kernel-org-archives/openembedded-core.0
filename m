Return-Path: <kergoth@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 767557016E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 02:37:29 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id 2so11147923oif.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 19:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=b4ZbeGqbhG2Gx3qJwddKKeZ+t+6exHiTIm842iFu0cQ=;
	b=pld0ITfKQy5fB25cUyynJwqNhDz+jX7GAF1guP7nBdIq6FE9fb4o3JFcTpfv4zBZ3Z
	fURKykvQJ+CLQh7PYPHKFotRGGCX/3eYG+mnm6N28UW+JnqQoeEEfQt637F84Gg9Qxh2
	ytKU/j5KvfRTW9XrAD1anosCLmTj3r3jKbDSucBAIsxP2bEMeAwuV5ZnZG4rvDs/gxj6
	05h445MosBDdVfiBJ9mzxt3//knrf6Pey1FkM0L+TvQJfA/MW5dUX1wh2X+djiY/oX5e
	wl3YjeCMjpLN6ot4c5720Q7sdTzucf4mqDusnChcJRZ3v3e0dnsBjk4hV2G0Mft8rb9g
	Ebfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=b4ZbeGqbhG2Gx3qJwddKKeZ+t+6exHiTIm842iFu0cQ=;
	b=celAUwNeau6UZxWd1nowiY9SugVmF2XcXP1a95jeAVRUI41rW0H+SEPwcTnYhLTNsx
	TWsrGHNfp0jG+79/pLG7rf8Fm+Fkj2fR8bEc4yepCm5A9g3l/Ev1ixX1Iy4h8Ip4CGcZ
	5wvvsL4HGZq5eILwW/05Zg0Ru20egy2WgFftwVUEy0oqbHu8XTtHfAK10WWjyp+aPQ2D
	YJZA966enIDyNUmQqKZhwI3WwOxdeNoPoXE4uTo64wUHa4tQ8BwSppf270dlKoJAyQoY
	uv8ltDTH5l4ynDcneWdA1dD85BpRGWarmGgSlRZftAFUba2hhHut78b9vZe8sWGCwmPX
	F7FQ==
X-Gm-Message-State: AE9vXwN125jBDNOkK68xCV6GDzZidtAqVUeBbV70m/OtsuaUmfcoSLduUIURjVPi5L7qGYDcGQIIHcXasnXfrA==
X-Received: by 10.202.212.199 with SMTP id l190mr27914232oig.57.1474252649800; 
	Sun, 18 Sep 2016 19:37:29 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.157.13.194 with HTTP; Sun, 18 Sep 2016 19:37:09 -0700 (PDT)
In-Reply-To: <82ab3d71-56c0-44b8-a892-91cfc90c0330@windriver.com>
References: <1474076227-17032-1-git-send-email-Randy.MacLeod@windriver.com>
	<CABcZANk=aHGZVw5vnh5+KyQaxLa8=7NB2GuFt49P0B_hDyaXcQ@mail.gmail.com>
	<82ab3d71-56c0-44b8-a892-91cfc90c0330@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Sun, 18 Sep 2016 19:37:09 -0700
X-Google-Sender-Auth: I5w5Yeu7EAxkmiiTG_b8PVRwFrk
Message-ID: <CABcZANnnuemBFW_JFQJn-sVeao2vFviexrq-ps743M_V2264kw@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
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
X-List-Received-Date: Mon, 19 Sep 2016 02:37:29 -0000
Content-Type: multipart/alternative; boundary=001a113de59a802ea3053cd33187

--001a113de59a802ea3053cd33187
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 18, 2016 at 7:32 PM, Randy MacLeod <randy.macleod@windriver.com=
>
wrote:

> On 2016-09-17 01:09 AM, Christopher Larson wrote:
>
>>
>> On Fri, Sep 16, 2016 at 6:37 PM, Randy MacLeod
>> <Randy.MacLeod@windriver.com <mailto:Randy.MacLeod@windriver.com>> wrote=
:
>>
>>     Without a packageconfig dependency for the file utility, there's
>>     a very rare compile faiure caused by a race where the magic.h
>>     header file is not found:
>>
>>      ../../../git/lib/support/plausible.c:33:19: fatal error: magic.h:
>>     No such file or directory
>>
>>     This file, plausible.c, is part of libsupport.a which is used by
>>     many binaries produced by the e2fsprogs package. plausible.c attempt=
s
>>     to dynamically load libmagic.so if the e2fsprogs configure detects
>>     that magic was available. Adding the packageconfig will eliminate
>>     the build as well as the possible configure-time race condition.
>>
>>     Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com
>>     <mailto:Randy.MacLeod@windriver.com>>
>>     ---
>>      meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>     <http://e2fsprogs_1.43.bb> | 1 +
>>      1 file changed, 1 insertion(+)
>>
>>     diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>     <http://e2fsprogs_1.43.bb>
>>     b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>     <http://e2fsprogs_1.43.bb>
>>     index f4855bc..1707cb9 100644
>>     --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>     <http://e2fsprogs_1.43.bb>
>>     +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
>>     <http://e2fsprogs_1.43.bb>
>>     @@ -23,6 +23,7 @@ EXTRA_OECONF +=3D "--libdir=3D${base_libdir}
>>     --sbindir=3D${base_sbindir} \
>>      EXTRA_OECONF_darwin =3D "--libdir=3D${base_libdir}
>>     --sbindir=3D${base_sbindir} --enable-bsd-shlibs"
>>
>>      PACKAGECONFIG ??=3D ""
>>     +PACKAGECONFIG[file] =3D ',,file'
>>
>>
>> This isn=E2=80=99t going to be good enough. You aren=E2=80=99t explicitl=
y
>> enabling/disabling the option, so it=E2=80=99ll still detect based on wh=
at=E2=80=99s in
>> the sysroot, so recipe build order will result in non-deterministic
>> behavior.
>>
>
> Hi Christopher,
>
> Thanks for the response but I don't understand.
> I'm probably wrong so please explain.
> It seems that you're suggesting that I add:
>  --with[out]-magic to e2fsprogs configure, and while
> I could do that, it does not seem to be needed.
>
>
> Short response:
>
>   This change forces 'file' to be built before e2fsprogs if 'file'
>   is present in the image or world build. Then e2fsprogs will
>   detect magic.h,libmagic.so and  the race is eliminated.


That=E2=80=99s only the case if =E2=80=98file=E2=80=99 is in PACKAGECONFIG,=
 if not, it=E2=80=99ll still
behave the way it did before, and change its deps based on build order. Our
policy is to avoid floating deps period, regardless of PACKAGECONFIG. If a
given packageconfig is not enabled, then explicitly disable the dependency,
don=E2=80=99t detect and use it anyway.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113de59a802ea3053cd33187
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sun, Sep 18, 2016 at 7:32 PM, Randy MacLeod <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:randy.macleod@windriver.com" target=3D"_blank">randy.macleod@wi=
ndriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span c=
lass=3D"">On 2016-09-17 01:09 AM, Christopher Larson wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
On Fri, Sep 16, 2016 at 6:37 PM, Randy MacLeod<br></span><span class=3D"">
&lt;<a href=3D"mailto:Randy.MacLeod@windriver.com" target=3D"_blank">Randy.=
MacLeod@windriver.com</a> &lt;mailto:<a href=3D"mailto:Randy.MacLeod@windri=
ver.com" target=3D"_blank">Randy.MacLeod@windrive<wbr>r.com</a>&gt;&gt; wro=
te:<br>
<br>
=C2=A0 =C2=A0 Without a packageconfig dependency for the file utility, ther=
e&#39;s<br>
=C2=A0 =C2=A0 a very rare compile faiure caused by a race where the magic.h=
<br>
=C2=A0 =C2=A0 header file is not found:<br>
<br>
=C2=A0 =C2=A0 =C2=A0../../../git/lib/support/plau<wbr>sible.c:33:19: fatal =
error: magic.h:<br>
=C2=A0 =C2=A0 No such file or directory<br>
<br>
=C2=A0 =C2=A0 This file, plausible.c, is part of libsupport.a which is used=
 by<br>
=C2=A0 =C2=A0 many binaries produced by the e2fsprogs package. plausible.c =
attempts<br>
=C2=A0 =C2=A0 to dynamically load libmagic.so if the e2fsprogs configure de=
tects<br>
=C2=A0 =C2=A0 that magic was available. Adding the packageconfig will elimi=
nate<br>
=C2=A0 =C2=A0 the build as well as the possible configure-time race conditi=
on.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Randy MacLeod &lt;<a href=3D"mailto:Randy.MacL=
eod@windriver.com" target=3D"_blank">Randy.MacLeod@windriver.com</a><br></s=
pan>
=C2=A0 =C2=A0 &lt;mailto:<a href=3D"mailto:Randy.MacLeod@windriver.com" tar=
get=3D"_blank">Randy.MacLeod@windrive<wbr>r.com</a>&gt;&gt;<br>
=C2=A0 =C2=A0 ---<br>
=C2=A0 =C2=A0 =C2=A0meta/recipes-devtools/e2fspro<wbr>gs/<a href=3D"http://=
e2fsprogs_1.43.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.bb</=
a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://e2fsprogs_1.43.bb" rel=3D"noreferrer" t=
arget=3D"_blank">http://e2fsprogs_1.43.bb</a>&gt; | 1 +<span class=3D""><br=
>
=C2=A0 =C2=A0 =C2=A01 file changed, 1 insertion(+)<br>
<br>
=C2=A0 =C2=A0 diff --git a/meta/recipes-devtools/e2fspr<wbr>ogs/<a href=3D"=
http://e2fsprogs_1.43.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.=
43.bb</a><br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"http://e2fsprogs_1.43.bb" rel=3D"noreferrer" t=
arget=3D"_blank">http://e2fsprogs_1.43.bb</a>&gt;<br>
=C2=A0 =C2=A0 b/meta/recipes-devtools/e2fspr<wbr>ogs/<a href=3D"http://e2fs=
progs_1.43.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.bb</a><b=
r>
=C2=A0 =C2=A0 &lt;<a href=3D"http://e2fsprogs_1.43.bb" rel=3D"noreferrer" t=
arget=3D"_blank">http://e2fsprogs_1.43.bb</a>&gt;<span class=3D""><br>
=C2=A0 =C2=A0 index f4855bc..1707cb9 100644<br>
=C2=A0 =C2=A0 --- a/meta/recipes-devtools/e2fspr<wbr>ogs/<a href=3D"http://=
e2fsprogs_1.43.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.bb</=
a><br></span>
=C2=A0 =C2=A0 &lt;<a href=3D"http://e2fsprogs_1.43.bb" rel=3D"noreferrer" t=
arget=3D"_blank">http://e2fsprogs_1.43.bb</a>&gt;<br>
=C2=A0 =C2=A0 +++ b/meta/recipes-devtools/e2fspr<wbr>ogs/<a href=3D"http://=
e2fsprogs_1.43.bb" rel=3D"noreferrer" target=3D"_blank">e2fsprogs_1.43.bb</=
a><br>
=C2=A0 =C2=A0 &lt;<a href=3D"http://e2fsprogs_1.43.bb" rel=3D"noreferrer" t=
arget=3D"_blank">http://e2fsprogs_1.43.bb</a>&gt;<span class=3D""><br>
=C2=A0 =C2=A0 @@ -23,6 +23,7 @@ EXTRA_OECONF +=3D &quot;--libdir=3D${base_l=
ibdir}<br>
=C2=A0 =C2=A0 --sbindir=3D${base_sbindir} \<br>
=C2=A0 =C2=A0 =C2=A0EXTRA_OECONF_darwin =3D &quot;--libdir=3D${base_libdir}=
<br>
=C2=A0 =C2=A0 --sbindir=3D${base_sbindir} --enable-bsd-shlibs&quot;<br>
<br>
=C2=A0 =C2=A0 =C2=A0PACKAGECONFIG ??=3D &quot;&quot;<br>
=C2=A0 =C2=A0 +PACKAGECONFIG[file] =3D &#39;,,file&#39;<br>
<br>
<br>
This isn=E2=80=99t going to be good enough. You aren=E2=80=99t explicitly<b=
r>
enabling/disabling the option, so it=E2=80=99ll still detect based on what=
=E2=80=99s in<br>
the sysroot, so recipe build order will result in non-deterministic<br>
behavior.<br>
</span></blockquote>
<br>
Hi Christopher,<br>
<br>
Thanks for the response but I don&#39;t understand.<br>
I&#39;m probably wrong so please explain.<br>
It seems that you&#39;re suggesting that I add:<br>
=C2=A0--with[out]-magic to e2fsprogs configure, and while<br>
I could do that, it does not seem to be needed.<br>
<br>
<br>
Short response:<br>
<br>
=C2=A0 This change forces &#39;file&#39; to be built before e2fsprogs if &#=
39;file&#39;<br>
=C2=A0 is present in the image or world build. Then e2fsprogs will<br>
=C2=A0 detect magic.h,libmagic.so and=C2=A0 the race is eliminated.</blockq=
uote></div><br>That=E2=80=99s only the case if =E2=80=98file=E2=80=99 is in=
 PACKAGECONFIG, if not, it=E2=80=99ll still behave the way it did before, a=
nd change its deps based on build order. Our policy is to avoid floating de=
ps period, regardless of PACKAGECONFIG. If a given packageconfig is not ena=
bled, then explicitly disable the dependency, don=E2=80=99t detect and use =
it anyway.<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"gmail=
_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder - B=
itBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software E=
ngineer, Mentor Graphics</div>
</div></div>

--001a113de59a802ea3053cd33187--
