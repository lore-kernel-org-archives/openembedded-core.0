Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1CCC001DF
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 22:29:24 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.1789.1691015360853451949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 15:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout11.t-online.de (Postfix) with SMTP id 5928CD18;
	Thu,  3 Aug 2023 00:29:18 +0200 (CEST)
Received: from [192.168.0.109] ([24.134.105.89]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qRKLD-0FT8aW0; Thu, 3 Aug 2023 00:29:16 +0200
Date: Thu, 03 Aug 2023 00:29:09 +0200
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCH 1/2] webkitgtk: upgrade 2.40.2 -> 2.40.5
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <LSBSYR.605OD6VIH5OO@t-online.de>
In-Reply-To: <CANNYZj8aoo6gh1amU2pOBC+jZj_=psDtYs5YZeaLLHaNT0prFg@mail.gmail.com>
References: <20230802150801.2607-1-f_l_k@t-online.de>
	<CANNYZj8aoo6gh1amU2pOBC+jZj_=psDtYs5YZeaLLHaNT0prFg@mail.gmail.com>
X-Mailer: geary/44.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-i5gtPG1LS7UaE6HZ8byW"
X-TOI-EXPURGATEID: 150726::1691015356-CD6279BF-30E065F4/0/0 CLEAN NORMAL
X-TOI-MSGID: e60ae318-c370-4161-a913-368d2a72c048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 22:29:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185441

--=-i5gtPG1LS7UaE6HZ8byW
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

Yes, I checked that as well. I'm sorry I didn't comment in more detail.

On Wed, Aug 2 2023 at 07:42:53 PM +02:00:00, Alexander Kanavin=20
<alex.kanavin@gmail.com> wrote:
> 'Unneeded patches' is not a good phrase to use: it's better to say
> explicitly that the patches have been merged into the new release (or
> if there is some other reason they are not needed anymore). I had to
> go to upstream repo and check that, but I shouldn't have to.
>=20
> Alex
>=20
> On Wed, 2 Aug 2023 at 17:08, Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>> wrote:
>>=20
>>  - Remove unneeded patches
>>=20
>>      What=FFs new in the WebKitGTK 2.40.5 release?
>>      - Fix several crashes and rendering issues.
>>=20
>>      What=FFs new in the WebKitGTK 2.40.4 release?
>>      - Fix a bug in JavaScript reading variable arguments in a call.
>>=20
>>      What=FFs new in the WebKitGTK 2.40.3 release?
>>      - Make memory pressure monitor honor=20
>> memory.memsw.usage_in_bytes if exists.
>>      - Include key modifiers in wheel events.
>>      - Apply cookie blocking policy to WebSocket handshakes.
>>      - Remove accidental dependency on GLib 2.70.
>>      - Fix the build with BUBBLEWRAP_SANDBOX disabled.
>>      - Fix several crashes and rendering issues.
>>=20
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de=20
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   ...tCore-CMakeLists.txt-ensure-reproduc.patch | 28 -------------
>>   ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch | 41=20
>> -------------------
>>   ...ebkitgtk_2.40.2.bb =3D> webkitgtk_2.40.5.bb} |  5 +--
>>   3 files changed, 1 insertion(+), 73 deletions(-)
>>   delete mode 100644=20
>> meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMakeLists=
.txt-ensure-reproduc.patch
>>   delete mode 100644=20
>> meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0f7894=
bf4.patch
>>   rename meta/recipes-sato/webkit/{webkitgtk_2.40.2.bb =3D>=20
>> webkitgtk_2.40.5.bb} (96%)
>>=20
>>  diff --git=20
>> a/meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMakeLis=
ts.txt-ensure-reproduc.patch=20
>> b/meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMakeLis=
ts.txt-ensure-reproduc.patch
>>  deleted file mode 100644
>>  index bbe265059d..0000000000
>>  ---=20
>> a/meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMakeLis=
ts.txt-ensure-reproduc.patch
>>  +++ /dev/null
>>  @@ -1,28 +0,0 @@
>>  -From cd65e3d9256a4f6eb7906a9f10678c29a4ffef2f Mon Sep 17 00:00:00=20
>> 2001
>>  -From: Alexander Kanavin <alex@linutronix.de=20
>> <mailto:alex@linutronix.de>>
>>  -Date: Mon, 26 Jun 2023 14:30:02 +0200
>>  -Subject: [PATCH] Source/JavaScriptCore/CMakeLists.txt: ensure=20
>> reproducibility
>>  - of __TIMESTAMP__
>>  -
>>  -__TIMESTAMP__ refers to mtime of the file that contains it, which=20
>> is unstable
>>  -and breaks binary reproducibility when the file is generated at=20
>> build time. To ensure
>>  -this does not happen, mtime should be set from the original file.
>>  -
>>  -Upstream-Status: Submitted=20
>> [<https://github.com/WebKit/WebKit/pull/15293>]
>>  -Signed-off-by: Alexander Kanavin <alex@linutronix.de=20
>> <mailto:alex@linutronix.de>>
>>  ----
>>  - Source/JavaScriptCore/CMakeLists.txt | 1 +
>>  - 1 file changed, 1 insertion(+)
>>  -
>>  -diff --git a/Source/JavaScriptCore/CMakeLists.txt=20
>> b/Source/JavaScriptCore/CMakeLists.txt
>>  -index 43dc22ff..c2e3b1cd 100644
>>  ---- a/Source/JavaScriptCore/CMakeLists.txt
>>  -+++ b/Source/JavaScriptCore/CMakeLists.txt
>>  -@@ -159,6 +159,7 @@ add_custom_command(
>>  -     OUTPUT=20
>> ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
>>  -     MAIN_DEPENDENCY=20
>> ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in
>>  -     COMMAND ${PERL_EXECUTABLE} -pe=20
>> s/CACHED_TYPES_CKSUM/__TIMESTAMP__/=20
>> ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in >=20
>> ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
>>  -+    COMMAND touch -r=20
>> ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in=20
>> ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
>>  -             VERBATIM
>>  - )
>>  -
>>  diff --git=20
>> a/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0f78=
94bf4.patch=20
>> b/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0f78=
94bf4.patch
>>  deleted file mode 100644
>>  index 79da855ff4..0000000000
>>  ---=20
>> a/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0f78=
94bf4.patch
>>  +++ /dev/null
>>  @@ -1,41 +0,0 @@
>>  -From 4977290ab4ab35258a6da9b13795c9b0f7894bf4 Mon Sep 17 00:00:00=20
>> 2001
>>  -From: Diego Pino Garcia <dpino@igalia.com=20
>> <mailto:dpino@igalia.com>>
>>  -Date: Mon, 22 May 2023 19:58:50 -0700
>>  -Subject: [PATCH] [GLIB] Fix build error after 264196@main
>>  - <https://bugs.webkit.org/show_bug.cgi?id=3D256917>
>>  -
>>  -Reviewed by Michael Catanzaro.
>>  -
>>  -Variable BWRAP_EXECUTABLE is only defined when BUBBLEWRAP_SANDBOX=20
>> is
>>  -enabled.
>>  -
>>  -* Source/WTF/wtf/glib/Sandbox.cpp:
>>  -(WTF::isInsideUnsupportedContainer):
>>  -
>>  -Canonical link: <https://commits.webkit.org/264395@main>
>>  -Upstream-Status: Backport=20
>> [<https://github.com/WebKit/WebKit/commit/4977290ab4ab35258a6da9b13795c9=
b0f7894bf4>]
>>  -Signed-off-by: Alexander Kanavin <alex@linutronix.de=20
>> <mailto:alex@linutronix.de>>
>>  ----
>>  - Source/WTF/wtf/glib/Sandbox.cpp | 2 ++
>>  - 1 file changed, 2 insertions(+)
>>  -
>>  -diff --git a/Source/WTF/wtf/glib/Sandbox.cpp=20
>> b/Source/WTF/wtf/glib/Sandbox.cpp
>>  -index 7d84e830ab33e..9b07bb8cb5a9b 100644
>>  ---- a/Source/WTF/wtf/glib/Sandbox.cpp
>>  -+++ b/Source/WTF/wtf/glib/Sandbox.cpp
>>  -@@ -36,6 +36,7 @@ bool isInsideFlatpak()
>>  -     return returnValue;
>>  - }
>>  -
>>  -+#if ENABLE(BUBBLEWRAP_SANDBOX)
>>  - bool isInsideUnsupportedContainer()
>>  - {
>>  -     static bool inContainer =3D g_file_test("/run/.containerenv",=20
>> G_FILE_TEST_EXISTS);
>>  -@@ -64,6 +65,7 @@ bool isInsideUnsupportedContainer()
>>  -
>>  -     return inContainer && !supportedContainer;
>>  - }
>>  -+#endif
>>  -
>>  - bool isInsideSnap()
>>  - {
>>  diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb=20
>> b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
>>  similarity index 96%
>>  rename from meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
>>  rename to meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
>>  index a9391bfc99..7bf32e8610 100644
>>  --- a/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
>>  +++ b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
>>  @@ -13,11 +13,9 @@ SRC_URI =3D=20
>> "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>>             =20
>> file://0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch=20
>> <file://0001-findgobjectintrospection.cmake-prefix-variables-obta.patch/=
>=20
>> \
>>              file://reproducibility.patch=20
>> <file://reproducibility.patch/> \
>>              file://0d3344e17d258106617b0e6d783d073b188a2548.patch=20
>> <file://0d3344e17d258106617b0e6d783d073b188a2548.patch/> \
>>  -           file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch=20
>> <file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch/> \
>>  -          =20
>> file://0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch=20
>> <file://0001-source-javascriptcore-cmakelists.txt-ensure-reproduc.patch/=
>=20
>> \
>>              file://check-GST_GL_HAVE_PLATFORM_GLX.patch=20
>> <file://check-gst_gl_have_platform_glx.patch/> \
>>              "
>>  -SRC_URI[sha256sum] =3D=20
>> "96898870d994da406ee7a632816dcde9a3bb395ee5f344fcb3f3b8cc8a77e000"
>>  +SRC_URI[sha256sum] =3D=20
>> "7de051a263668621d91a61a5eb1c3771d1a7cec900043d4afef06c326c16037f"
>>=20
>>   inherit cmake pkgconfig gobject-introspection perlnative=20
>> features_check upstream-version-is-even gi-docgen
>>=20
>>  @@ -162,6 +160,5 @@ src_package_preprocess () {
>>               ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
>>               ${B}/WebCore/DerivedSources/*.cpp \
>>               ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
>>  -
>>   }
>>=20
>>  --
>>  2.41.0
>>=20
>>=20
>>=20
>>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185422):=20
> <https://lists.openembedded.org/g/openembedded-core/message/185422>
> Mute This Topic: <https://lists.openembedded.org/mt/100507379/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org=20
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-core/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-i5gtPG1LS7UaE6HZ8byW
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Yes, I checked that as well. I'm s=
orry I didn't comment in more detail.</div></div><div id=3D"geary-quote" di=
r=3D"auto"><br>On Wed, Aug 2 2023 at 07:42:53 PM +02:00:00, Alexander Kanav=
in &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type=3D"cite"><div =
class=3D"plaintext" style=3D"white-space: break-spaces;">'Unneeded patches'=
 is not a good phrase to use: it's better to say
explicitly that the patches have been merged into the new release (or
if there is some other reason they are not needed anymore). I had to
go to upstream repo and check that, but I shouldn't have to.

Alex

On Wed, 2 Aug 2023 at 17:08, Markus Volk &lt;<a href=3D"mailto:f_l_k@t-onli=
ne.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote>
 - Remove unneeded patches

     What=FFs new in the WebKitGTK 2.40.5 release?
     - Fix several crashes and rendering issues.

     What=FFs new in the WebKitGTK 2.40.4 release?
     - Fix a bug in JavaScript reading variable arguments in a call.

     What=FFs new in the WebKitGTK 2.40.3 release?
     - Make memory pressure monitor honor memory.memsw.usage_in_bytes if ex=
ists.
     - Include key modifiers in wheel events.
     - Apply cookie blocking policy to WebSocket handshakes.
     - Remove accidental dependency on GLib 2.70.
     - Fix the build with BUBBLEWRAP_SANDBOX disabled.
     - Fix several crashes and rendering issues.

 Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@=
t-online.de</a>&gt;
 ---
  ...tCore-CMakeLists.txt-ensure-reproduc.patch | 28 -------------
  ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch | 41 -------------------
  ...ebkitgtk_2.40.2.bb =3D&gt; webkitgtk_2.40.5.bb} |  5 +--
  3 files changed, 1 insertion(+), 73 deletions(-)
  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScr=
iptCore-CMakeLists.txt-ensure-reproduc.patch
  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6=
da9b13795c9b0f7894bf4.patch
  rename meta/recipes-sato/webkit/{webkitgtk_2.40.2.bb =3D&gt; webkitgtk_2.=
40.5.bb} (96%)

 diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore=
-CMakeLists.txt-ensure-reproduc.patch b/meta/recipes-sato/webkit/webkitgtk/=
0001-Source-JavaScriptCore-CMakeLists.txt-ensure-reproduc.patch
 deleted file mode 100644
 index bbe265059d..0000000000
 --- a/meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaScriptCore-CMakeL=
ists.txt-ensure-reproduc.patch
 +++ /dev/null
 @@ -1,28 +0,0 @@
 -From cd65e3d9256a4f6eb7906a9f10678c29a4ffef2f Mon Sep 17 00:00:00 2001
 -From: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de">alex@li=
nutronix.de</a>&gt;
 -Date: Mon, 26 Jun 2023 14:30:02 +0200
 -Subject: [PATCH] Source/JavaScriptCore/CMakeLists.txt: ensure reproducibi=
lity
 - of __TIMESTAMP__
 -
 -__TIMESTAMP__ refers to mtime of the file that contains it, which is unst=
able
 -and breaks binary reproducibility when the file is generated at build tim=
e. To ensure
 -this does not happen, mtime should be set from the original file.
 -
 -Upstream-Status: Submitted [<a href=3D"https://github.com/WebKit/WebKit/p=
ull/15293">https://github.com/WebKit/WebKit/pull/15293</a>]
 -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de=
">alex@linutronix.de</a>&gt;
 ----
 - Source/JavaScriptCore/CMakeLists.txt | 1 +
 - 1 file changed, 1 insertion(+)
 -
 -diff --git a/Source/JavaScriptCore/CMakeLists.txt b/Source/JavaScriptCore=
/CMakeLists.txt
 -index 43dc22ff..c2e3b1cd 100644
 ---- a/Source/JavaScriptCore/CMakeLists.txt
 -+++ b/Source/JavaScriptCore/CMakeLists.txt
 -@@ -159,6 +159,7 @@ add_custom_command(
 -     OUTPUT ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion=
.cpp
 -     MAIN_DEPENDENCY ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersio=
n.cpp.in
 -     COMMAND ${PERL_EXECUTABLE} -pe s/CACHED_TYPES_CKSUM/__TIMESTAMP__/ $=
{JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersion.cpp.in &gt; ${JavaScri=
ptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
 -+    COMMAND touch -r ${JAVASCRIPTCORE_DIR}/runtime/JSCBytecodeCacheVersi=
on.cpp.in ${JavaScriptCore_DERIVED_SOURCES_DIR}/JSCBytecodeCacheVersion.cpp
 -             VERBATIM
 - )
 -
 diff --git a/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b137=
95c9b0f7894bf4.patch b/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258=
a6da9b13795c9b0f7894bf4.patch
 deleted file mode 100644
 index 79da855ff4..0000000000
 --- a/meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258a6da9b13795c9b0f=
7894bf4.patch
 +++ /dev/null
 @@ -1,41 +0,0 @@
 -From 4977290ab4ab35258a6da9b13795c9b0f7894bf4 Mon Sep 17 00:00:00 2001
 -From: Diego Pino Garcia &lt;<a href=3D"mailto:dpino@igalia.com">dpino@iga=
lia.com</a>&gt;
 -Date: Mon, 22 May 2023 19:58:50 -0700
 -Subject: [PATCH] [GLIB] Fix build error after 264196@main
 - <a href=3D"https://bugs.webkit.org/show_bug.cgi?id=3D256917">https://bug=
s.webkit.org/show_bug.cgi?id=3D256917</a>
 -
 -Reviewed by Michael Catanzaro.
 -
 -Variable BWRAP_EXECUTABLE is only defined when BUBBLEWRAP_SANDBOX is
 -enabled.
 -
 -* Source/WTF/wtf/glib/Sandbox.cpp:
 -(WTF::isInsideUnsupportedContainer):
 -
 -Canonical link: <a href=3D"https://commits.webkit.org/264395@main">https:=
//commits.webkit.org/264395@main</a>
 -Upstream-Status: Backport [<a href=3D"https://github.com/WebKit/WebKit/co=
mmit/4977290ab4ab35258a6da9b13795c9b0f7894bf4">https://github.com/WebKit/We=
bKit/commit/4977290ab4ab35258a6da9b13795c9b0f7894bf4</a>]
 -Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix.de=
">alex@linutronix.de</a>&gt;
 ----
 - Source/WTF/wtf/glib/Sandbox.cpp | 2 ++
 - 1 file changed, 2 insertions(+)
 -
 -diff --git a/Source/WTF/wtf/glib/Sandbox.cpp b/Source/WTF/wtf/glib/Sandbo=
x.cpp
 -index 7d84e830ab33e..9b07bb8cb5a9b 100644
 ---- a/Source/WTF/wtf/glib/Sandbox.cpp
 -+++ b/Source/WTF/wtf/glib/Sandbox.cpp
 -@@ -36,6 +36,7 @@ bool isInsideFlatpak()
 -     return returnValue;
 - }
 -
 -+#if ENABLE(BUBBLEWRAP_SANDBOX)
 - bool isInsideUnsupportedContainer()
 - {
 -     static bool inContainer =3D g_file_test("/run/.containerenv", G_FILE=
_TEST_EXISTS);
 -@@ -64,6 +65,7 @@ bool isInsideUnsupportedContainer()
 -
 -     return inContainer &amp;&amp; !supportedContainer;
 - }
 -+#endif
 -
 - bool isInsideSnap()
 - {
 diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb b/meta/recipes-s=
ato/webkit/webkitgtk_2.40.5.bb
 similarity index 96%
 rename from meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
 rename to meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
 index a9391bfc99..7bf32e8610 100644
 --- a/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb
 +++ b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
 @@ -13,11 +13,9 @@ SRC_URI =3D "https://www.webkitgtk.org/releases/${BPN}-=
${PV}.tar.xz \
             <a href=3D"file://0001-FindGObjectIntrospection.cmake-prefix-v=
ariables-obta.patch">file://0001-FindGObjectIntrospection.cmake-prefix-vari=
ables-obta.patch</a> \
             <a href=3D"file://reproducibility.patch">file://reproducibilit=
y.patch</a> \
             <a href=3D"file://0d3344e17d258106617b0e6d783d073b188a2548.pat=
ch">file://0d3344e17d258106617b0e6d783d073b188a2548.patch</a> \
 -           <a href=3D"file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.pat=
ch">file://4977290ab4ab35258a6da9b13795c9b0f7894bf4.patch</a> \
 -           <a href=3D"file://0001-Source-JavaScriptCore-CMakeLists.txt-en=
sure-reproduc.patch">file://0001-Source-JavaScriptCore-CMakeLists.txt-ensur=
e-reproduc.patch</a> \
             <a href=3D"file://check-GST_GL_HAVE_PLATFORM_GLX.patch">file:/=
/check-GST_GL_HAVE_PLATFORM_GLX.patch</a> \
             "
 -SRC_URI[sha256sum] =3D "96898870d994da406ee7a632816dcde9a3bb395ee5f344fcb=
3f3b8cc8a77e000"
 +SRC_URI[sha256sum] =3D "7de051a263668621d91a61a5eb1c3771d1a7cec900043d4af=
ef06c326c16037f"

  inherit cmake pkgconfig gobject-introspection perlnative features_check u=
pstream-version-is-even gi-docgen

 @@ -162,6 +160,5 @@ src_package_preprocess () {
              ${B}/JavaScriptCore/PrivateHeaders/JavaScriptCore/*.h \
              ${B}/WebCore/DerivedSources/*.cpp \
              ${B}/WebKitGTK/DerivedSources/webkit/*.cpp
 -
  }

 --
 2.41.0


=20

</blockquote></div><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#185422): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/185422">https://lists.openembedded.org/g/openembedd=
ed-core/message/185422</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100507379/361=
8223">https://lists.openembedded.org/mt/100507379/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-core+owner@lists.openembedded.o=
rg">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a hre=
f=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-i5gtPG1LS7UaE6HZ8byW--


