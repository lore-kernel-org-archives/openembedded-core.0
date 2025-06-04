Return-Path: <florian.glaser@ifm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CF5C5B552
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 07:19:08 +0000 (UTC)
Subject: [PATCH] gtk+: add missing libdrm dependency #scarthgap
To: openembedded-core@lists.openembedded.org
From: florian.glaser@ifm.com
X-Originating-Location: =?UTF-8?B?RMO8c3NlbGRvcmYsIE5vcnRoIFJoaW5lLVdlc3RwaGFsaWEsIERF?= (147.161.229.75)
X-Originating-Platform: Linux Chrome 137
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 04 Jun 2025 00:19:01 -0700
Message-ID: <UObH.1749021541734030637.WDPL@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="XCmgIEkFf44hda7xJ3YP"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 07:19:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217842

--XCmgIEkFf44hda7xJ3YP
Content-Type: multipart/alternative; boundary="uekfNvPpHSDblwB60HWo"

--uekfNvPpHSDblwB60HWo
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

This patch backports a fix from the "styhead" branch to the "scarthgap" bra=
nch. It addresses #15513 "gtk+: add missing libdrm dependency".

Patch:
From 41f7eb15fa9189b1cf2c0d862e6e4ca2e5a4e2fc Mon Sep 17 00:00:00 2001
From: Andrew Fernandes <andrew@fernandes.org>
Date: Thu, 13 Jun 2024 12:54:27 -0700
Subject: [PATCH] gtk+: add missing libdrm dependency

Fixes [YOCTO #15513]

When built without the wayland feature, gtk4 does not
build due to a missing explicit dependency on libdrm.

Signed-off-by: Andrew Fernandes <andrew@fernandes.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

[Backported from styhead branch: b32290d9bbcfccc9b85fa5acbeaee5d32d9a9091]
---
meta/recipes-gnome/gtk+/gtk4_4.14.1.bb | 1 +
1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb b/meta/recipes-gnome/gt=
k+/gtk4_4.14.1.bb
index 497be6805a..aae69271ac 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb
@@ -16,6 +16,7 @@ DEPENDS =3D " \
graphene \
harfbuzz \
jpeg \
+ libdrm \
libepoxy \
libpng \
librsvg \
--
2.25.1

Best regards,
Florian Glaser

--uekfNvPpHSDblwB60HWo
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi all,</div>
<div>&nbsp;</div>
<div>This patch backports a fix from the "styhead" branch to the "scarthgap=
" branch. It addresses #15513 "gtk+: add missing libdrm dependency".</div>
<div>&nbsp;</div>
<div>Patch:</div>
<div>
<div style=3D"color: #000000; background-color: #ffffff; font-family: 'Droi=
d Sans Mono', 'monospace', monospace; font-weight: normal; font-size: 14px;=
 line-height: 19px; white-space: pre;">
<div><span style=3D"color: #000000;">From 41f7eb15fa9189b1cf2c0d862e6e4ca2e=
5a4e2fc Mon Sep 17 00:00:00 2001</span></div>
<div><span style=3D"color: #000000;">From: Andrew Fernandes &lt;andrew@fern=
andes.org&gt;</span></div>
<div><span style=3D"color: #000000;">Date: Thu, 13 Jun 2024 12:54:27 -0700<=
/span></div>
<div><span style=3D"color: #000000;">Subject: [PATCH] gtk+: add missing lib=
drm dependency</span></div>
<br />
<div><span style=3D"color: #000000;">Fixes [YOCTO #15513]</span></div>
<br />
<div><span style=3D"color: #000000;">When built without the wayland feature=
, gtk4 does not</span></div>
<div><span style=3D"color: #000000;">build due to a missing explicit depend=
ency on libdrm.</span></div>
<br />
<div><span style=3D"color: #000000;">Signed-off-by: Andrew Fernandes &lt;an=
drew@fernandes.org&gt;</span></div>
<div><span style=3D"color: #000000;">Signed-off-by: Richard Purdie &lt;rich=
ard.purdie@linuxfoundation.org&gt;</span></div>
<br />
<div><span style=3D"color: #000000;">[Backported from styhead branch: b3229=
0d9bbcfccc9b85fa5acbeaee5d32d9a9091]</span></div>
<div><span style=3D"color: #000000;">---</span></div>
<div><span style=3D"color: #000000;"> meta/recipes-gnome/gtk+/gtk4_4.14.1.b=
b | 1 +</span></div>
<div><span style=3D"color: #000000;"> 1 file changed, 1 insertion(+)</span>=
</div>
<br />
<div><span style=3D"color: #000080;">diff --git a/meta/recipes-gnome/gtk+/g=
tk4_4.14.1.bb b/meta/recipes-gnome/gtk+/gtk4_4.14.1.bb</span></div>
<div><span style=3D"color: #000000;">index 497be6805a..aae69271ac 100644</s=
pan></div>
<div><span style=3D"color: #000080;">--- a/meta/recipes-gnome/gtk+/gtk4_4.1=
4.1.bb</span></div>
<div><span style=3D"color: #000080;">+++ b/meta/recipes-gnome/gtk+/gtk4_4.1=
4.1.bb</span></div>
<div><span style=3D"color: #000000;">@@ -16,6 +16,7 @@ DEPENDS =3D " \</spa=
n></div>
<div><span style=3D"color: #000000;"> graphene \</span></div>
<div><span style=3D"color: #000000;"> harfbuzz \</span></div>
<div><span style=3D"color: #000000;"> jpeg \</span></div>
<div><span style=3D"color: #098658;">+ libdrm \</span></div>
<div><span style=3D"color: #000000;"> libepoxy \</span></div>
<div><span style=3D"color: #000000;"> libpng \</span></div>
<div><span style=3D"color: #000000;"> librsvg \</span></div>
<div><span style=3D"color: #a31515;">-- </span></div>
<div><span style=3D"color: #000000;">2.25.1</span></div>
</div>
</div>
<div>&nbsp;</div>
<div>Best regards, &nbsp;<br />Florian Glaser</div>

--uekfNvPpHSDblwB60HWo--

--XCmgIEkFf44hda7xJ3YP
Content-Type: text/x-patch; name="0001-gtk-add-missing-libdrm-dependency.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-gtk-add-missing-libdrm-dependency.patch"

RnJvbSA0MWY3ZWIxNWZhOTE4OWIxY2YyYzBkODYyZTZlNGNhMmU1YTRlMmZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZXcgRmVybmFuZGVzIDxhbmRyZXdAZmVybmFuZGVzLm9y
Zz4KRGF0ZTogVGh1LCAxMyBKdW4gMjAyNCAxMjo1NDoyNyAtMDcwMApTdWJqZWN0OiBbUEFUQ0hd
IGd0ays6IGFkZCBtaXNzaW5nIGxpYmRybSBkZXBlbmRlbmN5CgpGaXhlcyBbWU9DVE8gIzE1NTEz
XQoKV2hlbiBidWlsdCB3aXRob3V0IHRoZSB3YXlsYW5kIGZlYXR1cmUsIGd0azQgZG9lcyBub3QK
YnVpbGQgZHVlIHRvIGEgbWlzc2luZyBleHBsaWNpdCBkZXBlbmRlbmN5IG9uIGxpYmRybS4KClNp
Z25lZC1vZmYtYnk6IEFuZHJldyBGZXJuYW5kZXMgPGFuZHJld0BmZXJuYW5kZXMub3JnPgpTaWdu
ZWQtb2ZmLWJ5OiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9u
Lm9yZz4KCltCYWNrcG9ydGVkIGZyb20gc3R5aGVhZCBicmFuY2g6IGIzMjI5MGQ5YmJjZmNjYzli
ODVmYTVhY2JlYWVlNWQzMmQ5YTkwOTFdCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3Rr
NF80LjE0LjEuYmIgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xNC4xLmJiIGIvbWV0YS9yZWNp
cGVzLWdub21lL2d0aysvZ3RrNF80LjE0LjEuYmIKaW5kZXggNDk3YmU2ODA1YS4uYWFlNjkyNzFh
YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjE0LjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjE0LjEuYmIKQEAgLTE2LDYgKzE2LDcg
QEAgREVQRU5EUyA9ICIgXAogICAgIGdyYXBoZW5lIFwKICAgICBoYXJmYnV6eiBcCiAgICAganBl
ZyBcCisgICAgbGliZHJtIFwKICAgICBsaWJlcG94eSBcCiAgICAgbGlicG5nIFwKICAgICBsaWJy
c3ZnIFwKLS0gCjIuMjUuMQoK

--XCmgIEkFf44hda7xJ3YP--

