Return-Path: <sungwon.pino@gmail.com>
Received: from mail-yw1-f45.google.com (mail-yw1-f45.google.com
	[209.85.161.45])
	by mail.openembedded.org (Postfix) with ESMTP id 531F36C102
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 18:40:17 +0000 (UTC)
Received: by mail-yw1-f45.google.com with SMTP id h193so7604287ywc.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 10:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=P4gHfUT9sCXh9U8ZbWQQ9s7e0CDAaXAmSmKap/RdSAQ=;
	b=FJ20fcYvU8ysUBlDVnAri+P6HZOA1oUNvoqRgPXYEnzd/sUew9IOn5a9u2aeoRe0z0
	Ik2L9ksrwC31jn6pz4zuUXAIco0hjywwNUGuDbKlmyIOwU15u0blg4xa4xRDC5Wf/jHo
	bqNTgjzUR/98/HsLbqm0ZB3FavJM5vK+eyu3q6SpxD4xcuT/z2BuxBJ9XqeteOWDbqhS
	rokmZ+17LZmGJsnq/j28Zmh/7ujvsfWbTjhwhxFPt+PjrJhQapdSZF6mUiyITqgCvIe8
	HHcItW1P7OizXybxWRohA4PoNAJF81EUkbsxKBTu08kuiWm8mODy4KcordGD24UHMGkE
	yAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=P4gHfUT9sCXh9U8ZbWQQ9s7e0CDAaXAmSmKap/RdSAQ=;
	b=bdxY40JuG8vqnrewjUQ4mGpjh8o/NC5K6uRgejxzbJpHwtRifp0FTbvPFHWHnnsgU9
	neEo5akoq0VHVHNazg+BMujzlQOTrZJifZv7nPFvZuUAjo3Wi+U2ve4LUb5OtGF80D0U
	7YDArHG1AmJBPx5JJplgaxSd4sXOPXyiqHoRz1aRiRgxOwu5N7/Z2yy73QpqYpUjAumw
	b4ZYOnYu3JY591nvh6EDErpu6pLNGFDxerq6XAiHD5CYyPT3jcfHUSu+b44Vd0PVkCxu
	YR6piDIWm3Ft7V55xF/4M9a4AgvadCeOW3QHKIEFifSzNsiwUIB71wcDq6B1GrtpStia
	cTxw==
X-Gm-Message-State: AA+aEWa9lFwgRVhLyZ+A01+BLLPm2itP0G03F2WTe/ymcwlgYFUkJyqv
	bvvvfqb3l/MXaQp7ZflZiByHa8jzQvOkhpxbZXGwmQ==
X-Google-Smtp-Source: AFSGD/U+fv7RWl7h3+A3SsSjCNSTH1RB+hQvXJSgVA8UjZcbryS2+JIFocRngkG0R6AxiPj6UvYPICqzjgx89EAorbk=
X-Received: by 2002:a81:a70a:: with SMTP id e10mr24661603ywh.233.1545936018054;
	Thu, 27 Dec 2018 10:40:18 -0800 (PST)
MIME-Version: 1.0
From: sungwon kim <sungwon.pino@gmail.com>
Date: Fri, 28 Dec 2018 03:40:07 +0900
Message-ID: <CAE7Z+X3A0pB8fLvgE7fLzAAVB--Bngy5rR5w_J=VmpEpH4HtiA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v2] gdb-cross-canadian: Add bison-native for gdb-cross-canadian
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
X-List-Received-Date: Thu, 27 Dec 2018 18:40:17 -0000
Content-Type: multipart/alternative; boundary="00000000000033a3d3057e05472f"

--00000000000033a3d3057e05472f
Content-Type: text/plain; charset="UTF-8"

This fixes RISC-V gdb-cross-canadian cross compile configure failure
on missing bison.

Signed-off-by: pino-kim <sungwon.pino@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index 475e4f08ef..4977a66c32 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -5,7 +5,7 @@ SUMMARY = "GNU debugger (cross-canadian gdb for
${TARGET_ARCH} target)"
 PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"

-DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext \
+DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext bison-native \
            virtual/${HOST_PREFIX}gcc-crosssdk
virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc"

 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
-- 
2.17.1

--00000000000033a3d3057e05472f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><pre cl=
ass=3D"gmail-content" style=3D"box-sizing:border-box;overflow:auto;padding:=
9.5px;margin-top:0px;margin-bottom:10px;line-height:14.3px;word-break:break=
-all;border:0px;border-radius:0px">This fixes RISC-V gdb-cross-canadian cro=
ss compile configure failure on missing bison.</pre><pre class=3D"gmail-con=
tent" style=3D"box-sizing:border-box;overflow:auto;padding:9.5px;margin-top=
:0px;margin-bottom:10px;line-height:14.3px;word-break:break-all;border:0px;=
border-radius:0px"><font color=3D"#333333" face=3D"Menlo, Monaco, Consolas,=
 Courier New, monospace"><span style=3D"font-size:13px">Signed-off-by: pino=
-kim &lt;<a href=3D"mailto:sungwon.pino@gmail.com">sungwon.pino@gmail.com</=
a>&gt;
---
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipe=
s-devtools/gdb/gdb-cross-canadian.inc
index 475e4f08ef..4977a66c32 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -5,7 +5,7 @@ SUMMARY =3D &quot;GNU debugger (cross-canadian gdb for ${TA=
RGET_ARCH} target)&quot;
 PN =3D &quot;gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}&quot;
 BPN =3D &quot;gdb&quot;
=20
-DEPENDS =3D &quot;nativesdk-ncurses nativesdk-expat nativesdk-gettext \
+DEPENDS =3D &quot;nativesdk-ncurses nativesdk-expat nativesdk-gettext biso=
n-native \
            virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binuti=
ls-crosssdk virtual/nativesdk-libc&quot;
=20
 GDBPROPREFIX =3D &quot;--program-prefix=3D&#39;${TARGET_PREFIX}&#39;&quot;
--=20
2.17.1</span></font><br></pre></div></div></div></div>

--00000000000033a3d3057e05472f--
