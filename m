Return-Path: <sungwon.pino@gmail.com>
Received: from mail-yw1-f67.google.com (mail-yw1-f67.google.com
	[209.85.161.67])
	by mail.openembedded.org (Postfix) with ESMTP id 504946003C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 15:25:24 +0000 (UTC)
Received: by mail-yw1-f67.google.com with SMTP id i73so7413051ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Dec 2018 07:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=xoPefLaGNughgaXsjyvR7yp2W0a/rKfW0IGZOQy6V1Q=;
	b=I/DQ59cEgjtnh28nuU1Jz0rOTWMhd98Kav7LMDV/LCPoghKj/Dw9XELEa8pNCe5Xr1
	ULMBlYKGtHvRJN9Wl81+euH91pHkT2pVkEONR4JfpfQmAqjsjlk4xX7z7cIkdk0ahrR9
	CdaQaHKM2BZzeUK33Lgzf95HUOfR3jNaRo8XQVVHicWKju2ScZoO2MN5ZCD31mnm1WiT
	FsGjWDB+I6O3JfnU4RMzA4G3uww0pWy5m1T24DjNrfkF1klsTRsyAo/b0l18uuHxnGmb
	EakAwcWIQwZW64gQjfpbXsp1hMQgd7K1K6Zff+GUUsFheXnOgFKt/yveZn5pVMVnOfmF
	V9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=xoPefLaGNughgaXsjyvR7yp2W0a/rKfW0IGZOQy6V1Q=;
	b=jx2VEtD9RlADBymHLwNjdr4dMG7Viw2bH1+QEh031Cygg3jweoYOPKfOxYWxKOUgkq
	+WxXgMEmvetXROkWtgr2sPAcDnx7HKPX48Ei1/fgC+//bRYHiOY9Y54WzWYKMZfJa6Eq
	ZLblieXK1VsSNWVEeVWzogYc43VcjkAOYulO2MLC+jSvXB0NX2VVpIt27GBFkhWZ3xu6
	YvetaXfl4ENb2Au9paggj6oFBQv9n7UjoRaEgmDxBZHOklXdkUyrAboiJ72408QW1eCQ
	ES4EgFvhv31mVjM9WmYCaOvS1ZuUUUSvD+hm+OPJNk4wT8JDW2wKYsWd3MoD3NpdxZ6X
	htPA==
X-Gm-Message-State: AJcUukd26kfhh8sYNA6AkzkoIS+YR5hZhaSobqbygIRYV3/cXEu0h4p8
	8ffemQ5fjieOD5nEfn7eWfKlIusjoa1h8Vmspy7K9CnA
X-Google-Smtp-Source: ALg8bN4ATLZvpnYNSn8GQm3C8VYzSRSs4PYhaJrPIRhakq+IZ6O57qTnZYMZpfNZ9mOdCzf1V6ufv6re3WHTEWc/BZM=
X-Received: by 2002:a81:a87:: with SMTP id 129mr18355891ywk.195.1545924324913; 
	Thu, 27 Dec 2018 07:25:24 -0800 (PST)
MIME-Version: 1.0
From: sungwon kim <sungwon.pino@gmail.com>
Date: Fri, 28 Dec 2018 00:25:13 +0900
Message-ID: <CAE7Z+X0fWR4LtY+iCPGqsGX8atqK+W42SL+MCha1jcjtyt-DHg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gdb-cross-canadian: Add bison-native for gdb-cross-canadian
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
X-List-Received-Date: Thu, 27 Dec 2018 15:25:24 -0000
Content-Type: multipart/alternative; boundary="0000000000003c76d4057e028eac"

--0000000000003c76d4057e028eac
Content-Type: text/plain; charset="UTF-8"

Got errors when building SDK. Unable to find bison.
To fix this issue add bison-native.

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
+DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext
bison-native \
            virtual/${HOST_PREFIX}gcc-crosssdk
virtual/${HOST_PREFIX}binutils-crosssdk virtual/nativesdk-libc"

 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
-- 
2.17.1

--0000000000003c76d4057e028eac
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Got errors when building SDK. Unable to find bison.<b=
r></div><div>To fix this issue add bison-native.</div><div><br></div><div>S=
igned-off-by: pino-kim &lt;<a href=3D"mailto:sungwon.pino@gmail.com" target=
=3D"_blank">sungwon.pino@gmail.com</a>&gt;</div><div>---</div><div>=C2=A0me=
ta/recipes-devtools/gdb/gdb-cross-canadian.inc | 2 +-</div><div>=C2=A01 fil=
e changed, 1 insertion(+), 1 deletion(-)</div><div><br></div><div>diff --gi=
t a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtool=
s/gdb/gdb-cross-canadian.inc</div><div>index 475e4f08ef..4977a66c32 100644<=
/div><div>--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc</div><div>=
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc</div><div>@@ -5,7 +5=
,7 @@ SUMMARY =3D &quot;GNU debugger (cross-canadian gdb for ${TARGET_ARCH}=
 target)&quot;</div><div>=C2=A0PN =3D &quot;gdb-cross-canadian-${TRANSLATED=
_TARGET_ARCH}&quot;</div><div>=C2=A0BPN =3D &quot;gdb&quot;</div><div>=C2=
=A0</div><div>-DEPENDS =3D &quot;nativesdk-ncurses nativesdk-expat nativesd=
k-gettext \</div><div>+DEPENDS =3D &quot;nativesdk-ncurses nativesdk-expat =
nativesdk-gettext bison-native \</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 virtual/${HOST_PREFIX}gcc-crosssdk virtual/${HOST_PREFIX}binutil=
s-crosssdk virtual/nativesdk-libc&quot;</div><div>=C2=A0</div><div>=C2=A0GD=
BPROPREFIX =3D &quot;--program-prefix=3D&#39;${TARGET_PREFIX}&#39;&quot;</d=
iv><div class=3D"gmail-yj6qo gmail-ajU" style=3D"outline:none;padding:10px =
0px;width:22px;margin:2px 0px 0px"><div id=3D"gmail-:5c" class=3D"gmail-ajR=
" tabindex=3D"0" style=3D"background-color:rgb(232,234,237);border:none;cle=
ar:both;line-height:6px;outline:none;width:24px;border-radius:5.5px"><img c=
lass=3D"gmail-ajT" src=3D"https://ssl.gstatic.com/ui/v1/icons/mail/images/c=
leardot.gif" style=3D"background: url(&quot;https://www.gstatic.com/images/=
icons/material/system/2x/more_horiz_black_20dp.png&quot;) 50% 50% / 20px no=
-repeat; height: 11px; opacity: 0.54; width: 24px;"></div></div><span class=
=3D"gmail-HOEnZb gmail-adL"><font color=3D"#888888"><div>--=C2=A0</div><div=
>2.17.1</div></font></span></div>

--0000000000003c76d4057e028eac--
