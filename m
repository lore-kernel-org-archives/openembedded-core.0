Return-Path: <Sebastian.Suesens@baslerweb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CFACCA47C
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 12:41:46 +0000 (UTC)
Subject: [PATCH 3/3] [PATCH] [master] xwayland.weston-start: adaption of
  X11-unix folder
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?U8O8c2VucywgU2ViYXN0aWFu?= <Sebastian.Suesens@baslerweb.com>
X-Originating-Location: Ahrensbok, Schleswig-Holstein, DE (84.140.242.110)
X-Originating-Platform: Linux Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 13 Jun 2022 05:41:39 -0700
Message-ID: <cfH1.1655124099360048295.Mv2i@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qlcXhfs6FeDamJUYRy3l"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 12:41:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166841

--qlcXhfs6FeDamJUYRy3l
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

changed permission of X11-unix to 775
changed owner of X11-unix to root:video

Signed-off-by: ssuesens <sebastian.suesens@baslerweb.com>
---
meta/recipes-graphics/wayland/weston/xwayland.weston-start | 3 ++-
1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston/xwayland.weston-start b/m=
eta/recipes-graphics/wayland/weston/xwayland.weston-start
index db384b1a53..342ac8d129 100644
--- a/meta/recipes-graphics/wayland/weston/xwayland.weston-start
+++ b/meta/recipes-graphics/wayland/weston/xwayland.weston-start
@@ -1,5 +1,6 @@
#!/bin/sh

if type Xwayland=C2=A0 >/dev/null 2>/dev/null; then
- mkdir -p /tmp/.X11-unix
+ mkdir -m 775 -p /tmp/.X11-unix
+ chown root:video /tmp/.X11-unix
fi
--
2.25.1

--qlcXhfs6FeDamJUYRy3l
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>changed permission of X11-unix to 775</div>
<div>changed owner of X11-unix to root:video</div>
<div>&nbsp;</div>
<div>Signed-off-by: ssuesens &lt;sebastian.suesens@baslerweb.com&gt;</div>
<div>---</div>
<div>&nbsp;meta/recipes-graphics/wayland/weston/xwayland.weston-start | 3 +=
+-</div>
<div>&nbsp;1 file changed, 2 insertions(+), 1 deletion(-)</div>
<div>&nbsp;</div>
<div>diff --git a/meta/recipes-graphics/wayland/weston/xwayland.weston-star=
t b/meta/recipes-graphics/wayland/weston/xwayland.weston-start</div>
<div>index db384b1a53..342ac8d129 100644</div>
<div>--- a/meta/recipes-graphics/wayland/weston/xwayland.weston-start</div>
<div>+++ b/meta/recipes-graphics/wayland/weston/xwayland.weston-start</div>
<div>@@ -1,5 +1,6 @@</div>
<div>&nbsp;#!/bin/sh</div>
<div>&nbsp;</div>
<div>&nbsp;if type Xwayland&nbsp; &gt;/dev/null 2&gt;/dev/null; then</div>
<div>-<span style=3D"white-space: pre;"> </span>mkdir -p /tmp/.X11-unix</di=
v>
<div>+<span style=3D"white-space: pre;"> </span>mkdir -m 775 -p /tmp/.X11-u=
nix</div>
<div>+<span style=3D"white-space: pre;"> </span>chown root:video /tmp/.X11-=
unix</div>
<div>&nbsp;fi</div>
<div>--&nbsp;</div>
<div>2.25.1</div>

--qlcXhfs6FeDamJUYRy3l--

