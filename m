Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C634C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 09:34:42 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
 by mx.groups.io with SMTP id smtpd.web10.15128.1671615280627191738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 01:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g8NfL3h0;
 spf=pass (domain: gmail.com, ip: 209.85.217.50, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f50.google.com with SMTP id 3so14191400vsq.7
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 01:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I3HwRX5I0FnbHM7n7CWT/1s7yuDsegnTsT2dSfLOD1o=;
        b=g8NfL3h0SCQloiJgjcgQGR6mMOBDXFTTehjx2nPh9laLvJnhuFlNhOq5LNKClriSml
         vBuTSlOHeEqHDB2poK+sGrXrIkeUzsbYVFwx2w01eKABjWQDupv7uDsCF+EJwimCXdov
         P2+ihB89Nh3OaQuMipGwcDPXh8OrPipcpHIFVxPUhQF/e6lIITRkF1PsPz1mntHT1eqN
         Mpa2iKT1vxnTE1C7cYvcY2bEU9s4uLxVmlO+Uplelp3mB7SB3Gh6SfrBlDl8jiPwSWGU
         xLL5ggKXZn4Souakr4Ft2YNJqSCa49emCm786DgKL3fICMHh0wuW6FA2MR0RRyv7N36s
         Q/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3HwRX5I0FnbHM7n7CWT/1s7yuDsegnTsT2dSfLOD1o=;
        b=lUMoO1m2MLRqqhLxBr2P6Jasiv3xDVkNvSLX34QEevarB5omyl2llYbS/cE4Q5StTC
         GN1487AD0WNx/XJf9QmiXeJo9ZzgmYteXYopHq18DBC4LVfe/xkOd8WfFZcAsSPNXINs
         cAXPmkyVAtOgzrqjY7wXVxZLv7T53Jqh0GOE2gPnltUZ6fmOcson4vKB+Kq0oyyHRr77
         MPvFwygK5H0ypBAjPG28VyLqrIs50g0fW9/uzVgVuK98/zFRrG9dXg7yGLAMNhClZvp3
         /YJebokOilkp28AmTGFpbQNah5wgOaq5WGuQvKYlDiwzKaBAUx7kTVsLYRcgOU5irqMw
         tQxA==
X-Gm-Message-State: AFqh2kpgow18CkGknKYCSTMSQhcgAo8CJr5Pe83mN2sX/OS407yZaomj
	OVw4NQKE4F9CkkY7HtN7nlmPfiy5jnkZsQsl1R4=
X-Google-Smtp-Source: AMrXdXuOkYs5YqX8fMG9RioHIT6MM7poRURQmbEvFFEguw2l2Agf3FU2i9FgnI2OrO876JyVZSEXQgAmd7/jBl7NFa4=
X-Received: by 2002:a05:6102:22eb:b0:3b6:35bc:72c0 with SMTP id
 b11-20020a05610222eb00b003b635bc72c0mr151872vsh.2.1671615279611; Wed, 21 Dec
 2022 01:34:39 -0800 (PST)
MIME-Version: 1.0
References: <1671591551-12455-1-git-send-email-wangmy@fujitsu.com> <1671591551-12455-4-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1671591551-12455-4-git-send-email-wangmy@fujitsu.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 21 Dec 2022 09:34:28 +0000
Message-ID: <CANPvuRk=XV8cTMp_oge-OHGQnOn=2vF=xicpEQAwmqc=hdAPTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gstreamer1.0: upgrade 1.20.4 -> 1.20.5
To: wangmy <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000f143b705f05342d9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 09:34:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174903

--000000000000f143b705f05342d9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Wang,

This won't work without updating the full framework with all the plugins.

Jose

wangmy <wangmy@fujitsu.com> escreveu no dia quarta, 21/12/2022 =C3=A0(s) 02=
:59:

> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> systemclock waiting fixes for certain 32-bit platforms/libcs
> alphacombine: robustness improvements for corner case scenarios
> avfvideosrc: Report latency when doing screen capture
> d3d11videosink: various thread-safety and stability fixes
> decklink: fix performance issue when HDMI signal has been lost for a long
> time
> flacparse: Fix handling of headers advertising 32 bits per sample
> mpegts: Handle when iconv doesn't support ISO 6937 (e.g. musl libc)
> opengl: fix automatic dispmanx detection for rpi4 and fix usage of
> eglCreate/DestroyImage
> opusdec: Various channel-related fixes
> textrender: event handling fixes, esp. for GAP event
> subparse: Fix non-closed tag handling
> videoscale: fix handling of unknown buffer metas
> videosink: reverse playback handling fixes
> qtmux: Prefill mode fixes, especially for raw audio
> multiudpsink: allow binding to IPv6 address
> rtspsrc: Fix usage of IPv6 connections in SETUP
> rtspsrc: Only EOS on timeout if all streams are timed out/EOS
> splitmuxsrc: fix playback stall if there are unlinked pads
> v4l2: Fix SIGSEGV on state change during format changes
> wavparse robustness fixes
> Fix static linking on macOS (opengl, vulkan)
> gstreamer-vaapi: fix headless build against mesa >=3D 22.3.0
> GStreamer Editing Services library: Fix build with tools disabled
> webrtc example/demo fixes
> unit test fixes for aesdec and rtpjitterbuffer
> Cerbero: Fix ios cross-compile with cmake on M1; some recipe updates and
> other build fixes
> Binary packages: pkg-config file fixes for various recipes (ffmpeg,
> taglib, gstreamer)
> Binary packages: Enable high bitdepth support for libvpx (VP8/VP9
> encoding/decoding)
> Binary packages: ship aes plugin
> Miscellaneous bug fixes, memory leak fixes, and other stability and
> reliability improvements
> Performance improvements
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{gstreamer1.0_1.20.4.bb =3D> gstreamer1.0_1.20.5.bb}          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.20.4.bb =3D>
> gstreamer1.0_1.20.5.bb} (97%)
>
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
> b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
> similarity index 97%
> rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
> rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
> index d0ba2919ee..bb4dba3861 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.4.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.20.5.bb
> @@ -23,7 +23,7 @@ SRC_URI =3D "
> https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
>
> file://0004-tests-add-helper-script-to-run-the-installed_tests.patch;stri=
plevel=3D3
> \
>
> file://0005-tests-remove-gstbin-test_watch_for_state_change-test.patch \
>             "
> -SRC_URI[sha256sum] =3D
> "67c1edf8c3c339cda5dde85f4f7b953bb9607c2d13ae970e2491c5c4c055ef5f"
> +SRC_URI[sha256sum] =3D
> "5a19083faaf361d21fc391124f78ba6d609be55845a82fa8f658230e5fa03dff"
>
>  PACKAGECONFIG ??=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests',
> '', d)} \
>                     check \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174892):
> https://lists.openembedded.org/g/openembedded-core/message/174892
> Mute This Topic: https://lists.openembedded.org/mt/95800009/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000f143b705f05342d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"color:rgb(0,0,0)">Hi Wang,<br><br>This won&#=
39;t work without updating the full framework with all the plugins.</div><b=
r style=3D"color:rgb(0,0,0)"><span style=3D"color:rgb(0,0,0)">Jose</span><b=
r></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr=
">wangmy &lt;<a href=3D"mailto:wangmy@fujitsu.com">wangmy@fujitsu.com</a>&g=
t; escreveu no dia quarta, 21/12/2022 =C3=A0(s) 02:59:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">From: Wang Mingyu &lt;<a href=3D"mai=
lto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
systemclock waiting fixes for certain 32-bit platforms/libcs<br>
alphacombine: robustness improvements for corner case scenarios<br>
avfvideosrc: Report latency when doing screen capture<br>
d3d11videosink: various thread-safety and stability fixes<br>
decklink: fix performance issue when HDMI signal has been lost for a long t=
ime<br>
flacparse: Fix handling of headers advertising 32 bits per sample<br>
mpegts: Handle when iconv doesn&#39;t support ISO 6937 (e.g. musl libc)<br>
opengl: fix automatic dispmanx detection for rpi4 and fix usage of eglCreat=
e/DestroyImage<br>
opusdec: Various channel-related fixes<br>
textrender: event handling fixes, esp. for GAP event<br>
subparse: Fix non-closed tag handling<br>
videoscale: fix handling of unknown buffer metas<br>
videosink: reverse playback handling fixes<br>
qtmux: Prefill mode fixes, especially for raw audio<br>
multiudpsink: allow binding to IPv6 address<br>
rtspsrc: Fix usage of IPv6 connections in SETUP<br>
rtspsrc: Only EOS on timeout if all streams are timed out/EOS<br>
splitmuxsrc: fix playback stall if there are unlinked pads<br>
v4l2: Fix SIGSEGV on state change during format changes<br>
wavparse robustness fixes<br>
Fix static linking on macOS (opengl, vulkan)<br>
gstreamer-vaapi: fix headless build against mesa &gt;=3D 22.3.0<br>
GStreamer Editing Services library: Fix build with tools disabled<br>
webrtc example/demo fixes<br>
unit test fixes for aesdec and rtpjitterbuffer<br>
Cerbero: Fix ios cross-compile with cmake on M1; some recipe updates and ot=
her build fixes<br>
Binary packages: pkg-config file fixes for various recipes (ffmpeg, taglib,=
 gstreamer)<br>
Binary packages: Enable high bitdepth support for libvpx (VP8/VP9 encoding/=
decoding)<br>
Binary packages: ship aes plugin<br>
Miscellaneous bug fixes, memory leak fixes, and other stability and reliabi=
lity improvements<br>
Performance improvements<br>
<br>
Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=
=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
---<br>
=C2=A0.../{<a href=3D"http://gstreamer1.0_1.20.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">gstreamer1.0_1.20.4.bb</a> =3D&gt; <a href=3D"http://gstream=
er1.0_1.20.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.5.b=
b</a>}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
=C2=A0rename meta/recipes-multimedia/gstreamer/{<a href=3D"http://gstreamer=
1.0_1.20.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.4.bb<=
/a> =3D&gt; <a href=3D"http://gstreamer1.0_1.20.5.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">gstreamer1.0_1.20.5.bb</a>} (97%)<br>
<br>
diff --git a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1=
.0_1.20.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.4.bb</=
a> b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.20.=
5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.5.bb</a><br>
similarity index 97%<br>
rename from meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.=
0_1.20.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.4.bb</a=
><br>
rename to meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_=
1.20.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.5.bb</a><=
br>
index d0ba2919ee..bb4dba3861 100644<br>
--- a/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.20=
.4.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.4.bb</a><br>
+++ b/meta/recipes-multimedia/gstreamer/<a href=3D"http://gstreamer1.0_1.20=
.5.bb" rel=3D"noreferrer" target=3D"_blank">gstreamer1.0_1.20.5.bb</a><br>
@@ -23,7 +23,7 @@ SRC_URI =3D &quot;<a href=3D"https://gstreamer.freedeskto=
p.org/src/gstreamer/gstreamer-$%7BPV%7D.tar.x" rel=3D"noreferrer" target=3D=
"_blank">https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.ta=
r.x</a><br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0004-tests-add-helper-scri=
pt-to-run-the-installed_tests.patch;striplevel=3D3 \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0005-tests-remove-gstbin-t=
est_watch_for_state_change-test.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
-SRC_URI[sha256sum] =3D &quot;67c1edf8c3c339cda5dde85f4f7b953bb9607c2d13ae9=
70e2491c5c4c055ef5f&quot;<br>
+SRC_URI[sha256sum] =3D &quot;5a19083faaf361d21fc391124f78ba6d609be55845a82=
fa8f658230e5fa03dff&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;${@bb.utils.contains(&#39;PTEST_ENABLED&#39=
;, &#39;1&#39;, &#39;tests&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 check=
 \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174892): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174892" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/174892</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95800009/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/95800009/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--000000000000f143b705f05342d9--

