Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E423C54F31
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:17 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1270.1710522011396654442
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MwDQisWi;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=owLKdwpw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e430e9fdd-8a2733fe-9644-4f2e-9254-e13ed00e56c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522015;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=yev8Oenx+L63vEy7qSVaSKQ0HIWNHodZl90rfbvRAA4=;
	b=MwDQisWiPOgy3hlO0ny1Nh3ytfSPth5f6JNgqAPK3vB5BDgI0I4yd0LrqAzkCNYM
	Ba+feAdlQYd+7XB3EFxBTzu+KFOYMigVl0Qc+N8CwOOxsmk9DZAItBBcV4kAUlxUtkE
	RqNTO0z00zEs7X/NhG1Yx6tLBYT7l2qDrPsJ1vnU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522015;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=yev8Oenx+L63vEy7qSVaSKQ0HIWNHodZl90rfbvRAA4=;
	b=owLKdwpwcrGZK0P4w/IooU7kjKbXBzWnYL+L8wmDwHCvBsJ9usbhkpX7IXfTWKKl
	JJesxoY2gR7g0zO+dYSQh7J0RpN33VlYRJXL5p3e6Y4yV0rIBSj4B6RlzwWH7JkSg3B
	qfEgkA9LaCxtmGLL+jw98k9UkCYtT2b1ngc7PcZQ=
Content-Type: multipart/mixed; boundary="===============3898952600594908193=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-base: upgrading to 1.24.0 FAILED
Message-ID: <0101018e430e9fdd-8a2733fe-9644-4f2e-9254-e13ed00e56c7-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197232

--===============3898952600594908193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-base* to *1.24.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-base-upgrade-1.22.10-1.24.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 08743f39436a15afabd2e4668fb57cfc97a1c293 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 14:33:33 +0000
Subject: [PATCH] gstreamer1.0-plugins-base: upgrade 1.22.10 -> 1.24.0

---
 ...-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch | 5 ++---
 .../0002-ssaparse-enhance-SSA-text-lines-parsing.patch       | 5 ++---
 .../0003-viv-fb-Make-sure-config.h-is-included.patch         | 3 +--
 ...s-base_1.22.10.bb => gstreamer1.0-plugins-base_1.24.0.bb} | 2 +-
 4 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.10.bb => gstreamer1.0-plugins-base_1.24.0.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index 34c99ded42..e58f34615d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,4 +1,4 @@
-From 63fe5a7b4ef70e2c490bad3b0838329935a8d77c Mon Sep 17 00:00:00 2001
+From 5c48cae652eb444a4cb424ea61f5c6df23735000 Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
 Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
@@ -8,7 +8,6 @@ https://bugzilla.gnome.org/show_bug.cgi?id=728312
 Upstream-Status: Pending
 
 Signed-off-by: zhouming <b42586@freescale.com>
-
 ---
  gst-libs/gst/tag/gsttagdemux.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)
@@ -17,7 +16,7 @@ Signed-off-by: zhouming <b42586@freescale.com>
 diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
 old mode 100644
 new mode 100755
-index 173da37..2b7f34c
+index ef0ff90..53f05c8
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
 @@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index c922aadede..55595cd35a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,4 +1,4 @@
-From 7bf9525528c8f4a47413d7f82214d76f95f0c5f6 Mon Sep 17 00:00:00 2001
+From 322ae877ab45e2cdfba8ac656582b9dbb5245000 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
 Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
@@ -9,7 +9,6 @@ and there's are maybe multiple Dialog lines in one input buffer.
 Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=747496]
 
 Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
-
 ---
  gst/subparse/gstssaparse.c | 150 +++++++++++++++++++++++++++++++++----
  1 file changed, 134 insertions(+), 16 deletions(-)
@@ -18,7 +17,7 @@ Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
 diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
 old mode 100644
 new mode 100755
-index d6fdb9c..5ebe678
+index 42fbb42..2dab51c
 --- a/gst/subparse/gstssaparse.c
 +++ b/gst/subparse/gstssaparse.c
 @@ -270,6 +270,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index a605533be8..7ab725919d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,4 +1,4 @@
-From 2b07840122bc2e83bd23dad59aa80d9479f2e1e4 Mon Sep 17 00:00:00 2001
+From ac0bdf0c652eae35f8c7c45bfb324d69b87512e7 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
 Subject: [PATCH] viv-fb: Make sure config.h is included
@@ -8,7 +8,6 @@ This prevents build errors due to missing GST_API_* symbols
 Upstream-Status: Pending
 
 Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
-
 ---
  gst-libs/gst/gl/gl-prelude.h | 4 ++++
  1 file changed, 4 insertions(+)
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb
index d4b69b103f..ec86067b89 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "843a3a2da28e1ee6aeea56dd2be9bffcc3b4bbcd0f974eba4abfc3aa31f0399c"
+SRC_URI[sha256sum] = "f33774129c437e2207034f8927af4cf7ed8c0f006a4602b5cde2823ec6c0cc07"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.42.0


--===============3898952600594908193==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-base-upgrade-1.22.10-1.24.0.patch"

RnJvbSAwODc0M2YzOTQzNmExNWFmYWJkMmU0NjY4ZmI1N2NmYzk3YTFjMjkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTQ6MzM6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlOiB1cGdyYWRlIDEuMjIuMTAgLT4gMS4yNC4wCgotLS0K
IC4uLi1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5w
YXRjaCB8IDUgKystLS0KIC4uLi8wMDAyLXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMt
cGFyc2luZy5wYXRjaCAgICAgICB8IDUgKystLS0KIC4uLi8wMDAzLXZpdi1mYi1NYWtlLXN1cmUt
Y29uZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2ggICAgICAgICB8IDMgKy0tCiAuLi5zLWJhc2VfMS4y
Mi4xMC5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjQuMC5iYn0gfCAyICstCiA0
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2VfMS4yMi4xMC5iYiA9PiBnc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjQuMC5iYn0gKDk4
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1w
YWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMt
ZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRjaAppbmRleCAzNGM5OWRlZDQyLi5lNThm
MzQ2MTVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNy
Yy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdl
dC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1ZXJ5LWNhcHMucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDYzZmU1YTdiNGVmNzBlMmM0OTBiYWQzYjA4MzgzMjk5MzVhOGQ3N2MgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDVjNDhjYWU2NTJlYjQ0NGE0Y2I0MjRlYTYxZjVjNmRmMjM3
MzUwMDAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiB6aG91bWluZyA8YjQyNTg2QGZy
ZWVzY2FsZS5jb20+CiBEYXRlOiBXZWQsIDE0IE1heSAyMDE0IDEwOjE2OjIwICswODAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIEVOR1IwMDMxMjUxNTogZ2V0IGNhcHMgZnJvbSBzcmMgcGFkIHdoZW4gcXVl
cnkgY2FwcwpAQCAtOCw3ICs4LDYgQEAgaHR0cHM6Ly9idWd6aWxsYS5nbm9tZS5vcmcvc2hvd19i
dWcuY2dpP2lkPTcyODMxMgogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAKIFNpZ25lZC1vZmYt
Ynk6IHpob3VtaW5nIDxiNDI1ODZAZnJlZXNjYWxlLmNvbT4KLQogLS0tCiAgZ3N0LWxpYnMvZ3N0
L3RhZy9nc3R0YWdkZW11eC5jIHwgMTMgKysrKysrKysrKysrKwogIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspCkBAIC0xNyw3ICsxNiw3IEBAIFNpZ25lZC1vZmYtYnk6IHpob3VtaW5n
IDxiNDI1ODZAZnJlZXNjYWxlLmNvbT4KIGRpZmYgLS1naXQgYS9nc3QtbGlicy9nc3QvdGFnL2dz
dHRhZ2RlbXV4LmMgYi9nc3QtbGlicy9nc3QvdGFnL2dzdHRhZ2RlbXV4LmMKIG9sZCBtb2RlIDEw
MDY0NAogbmV3IG1vZGUgMTAwNzU1Ci1pbmRleCAxNzNkYTM3Li4yYjdmMzRjCitpbmRleCBlZjBm
ZjkwLi41M2YwNWM4CiAtLS0gYS9nc3QtbGlicy9nc3QvdGFnL2dzdHRhZ2RlbXV4LmMKICsrKyBi
L2dzdC1saWJzL2dzdC90YWcvZ3N0dGFnZGVtdXguYwogQEAgLTE3OTYsNiArMTc5NiwxOSBAQCBn
c3RfdGFnX2RlbXV4X3BhZF9xdWVyeSAoR3N0UGFkICogcGFkLCBHc3RPYmplY3QgKiBwYXJlbnQs
IEdzdFF1ZXJ5ICogcXVlcnkpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9n
c3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAyLXNzYXBhcnNlLWVuaGFuY2Ut
U1NBLXRleHQtbGluZXMtcGFyc2luZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1T
U0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoCmluZGV4IGM5MjJhYWRlZGUuLjU1NTk1Y2QzNWEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcGx1Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJz
aW5nLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1w
YXJzaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA3YmY5NTI1NTI4YzhmNGE0NzQxM2Q3
ZjgyMjE0ZDc2Zjk1ZjBjNWY2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAzMjJhZTg3
N2FiNDVlMmNkZmJhOGFjNjU2NTgyYjlkYmI1MjQ1MDAwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQogRnJvbTogTWluZ2tlIFdhbmcgPG1pbmdrZS53YW5nQGZyZWVzY2FsZS5jb20+CiBEYXRlOiBU
aHUsIDE5IE1hciAyMDE1IDE0OjE3OjEwICswODAwCiBTdWJqZWN0OiBbUEFUQ0hdIHNzYXBhcnNl
OiBlbmhhbmNlIFNTQSB0ZXh0IGxpbmVzIHBhcnNpbmcuCkBAIC05LDcgKzksNiBAQCBhbmQgdGhl
cmUncyBhcmUgbWF5YmUgbXVsdGlwbGUgRGlhbG9nIGxpbmVzIGluIG9uZSBpbnB1dCBidWZmZXIu
CiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9idWd6aWxsYS5nbm9tZS5vcmcv
c2hvd19idWcuY2dpP2lkPTc0NzQ5Nl0KIAogU2lnbmVkLW9mZi1ieTogTWluZ2tlIFdhbmcgPG1p
bmdrZS53YW5nQGZyZWVzY2FsZS5jb20+Ci0KIC0tLQogIGdzdC9zdWJwYXJzZS9nc3Rzc2FwYXJz
ZS5jIHwgMTUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0KICAxIGZpbGUg
Y2hhbmdlZCwgMTM0IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQpAQCAtMTgsNyArMTcs
NyBAQCBTaWduZWQtb2ZmLWJ5OiBNaW5na2UgV2FuZyA8bWluZ2tlLndhbmdAZnJlZXNjYWxlLmNv
bT4KIGRpZmYgLS1naXQgYS9nc3Qvc3VicGFyc2UvZ3N0c3NhcGFyc2UuYyBiL2dzdC9zdWJwYXJz
ZS9nc3Rzc2FwYXJzZS5jCiBvbGQgbW9kZSAxMDA2NDQKIG5ldyBtb2RlIDEwMDc1NQotaW5kZXgg
ZDZmZGI5Yy4uNWViZTY3OAoraW5kZXggNDJmYmI0Mi4uMmRhYjUxYwogLS0tIGEvZ3N0L3N1YnBh
cnNlL2dzdHNzYXBhcnNlLmMKICsrKyBiL2dzdC9zdWJwYXJzZS9nc3Rzc2FwYXJzZS5jCiBAQCAt
MjcwLDYgKzI3MCw3IEBAIGdzdF9zc2FfcGFyc2VfcmVtb3ZlX292ZXJyaWRlX2NvZGVzIChHc3RT
c2FQYXJzZSAqIHBhcnNlLCBnY2hhciAqIHR4dCkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMtdml2LWZi
LU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDMtdml2LWZiLU1h
a2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaAppbmRleCBhNjA1NTMzYmU4Li43YWI3
MjU5MTlkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMt
aW5jbHVkZWQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMy12aXYtZmItTWFrZS1zdXJlLWNvbmZpZy5oLWlz
LWluY2x1ZGVkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyYjA3ODQwMTIyYmMyZTgzYmQy
M2RhZDU5YWE4MGQ5NDc5ZjJlMWU0IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhYzBi
ZGYwYzY1MmVhZTM1ZjhjN2M0NWJmYjMyNGQ2OWI4NzUxMmU3IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQ2FybG9zIFJhZmFlbCBHaWFuaSA8Y3JnNzQ3NUBtYWlsYm94Lm9yZz4KIERh
dGU6IFR1ZSwgMjEgTWF5IDIwMTkgMTQ6MDE6MTEgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gdml2
LWZiOiBNYWtlIHN1cmUgY29uZmlnLmggaXMgaW5jbHVkZWQKQEAgLTgsNyArOCw2IEBAIFRoaXMg
cHJldmVudHMgYnVpbGQgZXJyb3JzIGR1ZSB0byBtaXNzaW5nIEdTVF9BUElfKiBzeW1ib2xzCiBV
cHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIAogU2lnbmVkLW9mZi1ieTogQ2FybG9zIFJhZmFlbCBH
aWFuaSA8Y3JnNzQ3NUBtYWlsYm94Lm9yZz4KLQogLS0tCiAgZ3N0LWxpYnMvZ3N0L2dsL2dsLXBy
ZWx1ZGUuaCB8IDQgKysrKwogIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYXNlXzEuMjIuMTAuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIv
Z3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8xLjI0LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUK
cmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhc2VfMS4yMi4xMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLW11bHRpbWVk
aWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yNC4wLmJiCmluZGV4IGQ0
YjY5YjEwM2YuLmVjODYwNjdiODkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlh
L2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjIuMTAuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2Vf
MS4yNC4wLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIu
ZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1iYXNlL2dzdC1wbHVnaW5zLWJhCiAgICAg
ICAgICAgIGZpbGU6Ly8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMtaW5jbHVkZWQu
cGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1zc2FwYXJzZS1lbmhhbmNlLVNTQS10ZXh0
LWxpbmVzLXBhcnNpbmcucGF0Y2ggXAogICAgICAgICAgICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiODQzYTNhMmRhMjhlMWVlNmFlZWE1NmRkMmJlOWJmZmNjM2I0YmJjZDBmOTc0ZWJhNGFiZmMz
YWEzMWYwMzk5YyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmMzM3NzQxMjljNDM3ZTIyMDcwMzRm
ODkyN2FmNGNmN2VkOGMwZjAwNmE0NjAyYjVjZGUyODIzZWM2YzBjYzA3IgogCiBTID0gIiR7V09S
S0RJUn0vZ3N0LXBsdWdpbnMtYmFzZS0ke1BWfSIKIAotLSAKMi40Mi4wCgo=

--===============3898952600594908193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1879 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-f14792a0fde9632a5a78343fef3a502e46379826"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:f14792a0fde9632a5a78343fef3a502e46379826"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 355 Local 343 Mirrors 0 Missed 12 Current 554 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 611 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 612 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 613 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 614 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 615 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 632 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 633 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_create_spdx_setscene)
NOTE: Running task 1144 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb:do_recipe_qa)
NOTE: Running task 1168 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb:do_write_config)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.52.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe orc-0.4.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 754 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_write_config: Succeeded
NOTE: recipe pango-1.52.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 772 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 783 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_24.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpng-1.6.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1292 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb:do_fetch)
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_24.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 793 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_create_spdx_setscene)
NOTE: Running setscene task 802 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_create_spdx_setscene)
NOTE: Running setscene task 803 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 816 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: recipe libpng-1.6.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.39.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.33-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1360 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.120-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.33-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 895 of 909 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libx11-1_1.8.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_unpack: Succeeded
NOTE: Running task 2351 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb:do_patch)
NOTE: Running task 2429 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2509 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_patch: Succeeded
NOTE: Running task 2510 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2511 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2512 of 2524 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.39.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_p
 opulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.52.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.33.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot', '
 /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.42.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/iso-codes/iso-codes_4.16.0.bb:do_po
 pulate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/orc/orc_0.4.38.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:nat
 ive:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'texinfo-dummy-native', 'xz', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib', 'gstreamer1.0', 'lib
 ogg', 'libpng', 'libtheora', 'libvorbis', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libffi', 'libpcre2', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'orc-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'wayland-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libcap-ng-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2
 c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Dexamples=disabled -Dnls=enabled -Ddoc=disabled -Dgl_api=opengl,gles2 -Dgl_platform=egl,glx -Dgl_winsys=egl,wayland,x11 -Dalsa=enabled -Dcdparanoia=disabled -Dgl-graphene=disabled -Dgl-jpeg=enabled -Dogg=enabled -Dopus=disabled -Dorc=enabled -Dpango=enabled -Dgl-png=enabled -Dqt5=disabled -Dtheora=enabled -Dtremor=disabled -Dlibvisual=disabled -Dvorbis=enabled -Dx11=enabled -Dxvideo=enabled -Dxshm=enabled...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/gst-plugins-base-1.24.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/build
| Build type: cross build
| Project name: gst-plugins-base
| Project version: 1.24.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/recipe-sysroot ld.bfd 2.42.0.20240216
| C compiler for the build machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the build machine: gcc ld.bfd 2.41.0.20230926
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| C++ compiler for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-g++ (GCC) 13.2.0")
| C++ linker for the host machine: x86_64-poky-linux-g++ -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/recipe-sysroot ld.bfd 2.42.0.20240216
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports link arguments -Wl,-z,nodelete: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Message: Disabling GLib cast checks
| Has header "dlfcn.h" : YES
| Has header "emmintrin.h" : YES
| Has header "inttypes.h" : YES
| Has header "memory.h" : YES
| Has header "netinet/in.h" : YES
| Has header "netinet/tcp.h" : YES
| Has header "process.h" : NO
| Has header "smmintrin.h" : YES
| Has header "stdint.h" : YES
| Has header "strings.h" : YES
| Has header "string.h" : YES
| Has header "sys/socket.h" : YES
| Has header "sys/stat.h" : YES
| Has header "sys/types.h" : YES
| Has header "sys/wait.h" : YES
| Has header "unistd.h" : YES
| Has header "winsock2.h" : NO
| Has header "xmmintrin.h" : YES
| Has header "linux/dma-buf.h" : YES
| Library m found: YES
| Checking for function "dcgettext" with dependency -lm: YES
| Checking for function "gmtime_r" with dependency -lm: YES
| Checking for function "localtime_r" with dependency -lm: YES
| Checking for function "lrintf" with dependency -lm: YES
| Checking for function "mmap" with dependency -lm: YES
| Checking for function "log2" with dependency -lm: YES
| Checking for size of "char" : 1
| Checking for size of "int" : 4
| Checking for size of "long" : 8
| Checking for size of "short" : 2
| Checking for size of "void*" : 8
| Compiler for C++ supports arguments -Waggregate-return: YES
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C++ supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C++ supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C++ supports arguments -Wundef: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C++ supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Wformat: YES
| Compiler for C++ supports arguments -Wformat: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C++ supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C++ supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C++ supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C++ supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Waddress: YES
| Compiler for C++ supports arguments -Waddress: YES
| Compiler for C supports arguments -Wno-multichar: YES
| Compiler for C++ supports arguments -Wno-multichar: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C++ supports arguments -Wvla: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Compiler for C++ supports arguments -Wpointer-arith: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency libdrm found: YES 2.4.120
| Run-time dependency x11 found: YES 1.8.7
| Run-time dependency gio-2.0 found: YES 2.78.4
| Run-time dependency gio-unix-2.0 found: YES 2.78.4
| Run-time dependency gmodule-no-export-2.0 found: YES 2.78.4
| Dependency gdk-pixbuf-2.0 skipped: feature examples disabled
| Dependency gtk+-3.0 skipped: feature examples disabled
| Dependency gtk+-x11-3.0 skipped: feature examples disabled
| Dependency gstreamer-1.0 found: NO found 1.22.10 but need: '>= 1.24.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-plugins-base-1.24.0/meson.build:362:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/temp/run.do_configure.2701162:176 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/temp/run.do_configure.2701162, line 176
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/temp/run.do_configure.2701162, line 165
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/temp/run.do_configure.2701162, line 154
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/temp/run.do_configure.2701162, line 189
NOTE: recipe gstreamer1.0-plugins-base-1.24.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2512 tasks of which 2502 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315143258.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315143258.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.24.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-plugins-base-1.24.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/temp/run.do_configure.2701162', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-plugins-base/1.24.0/temp/log.do_configure.2701162
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.0.bb:do_configure) failed with exit code '1'

--===============3898952600594908193==--

