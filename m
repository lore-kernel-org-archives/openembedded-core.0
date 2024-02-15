Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B1CC54E41
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:32:32 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.20173.1708018346239553647
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 09:32:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=U24h35k9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=r5q13CZm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018dadd3ab73-43567c2b-5530-4202-876f-26aeff213456-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=mAV8qGDfuBVxomGu2MOihPoWVY2ycjeoqBIa/NaAfA8=;
	b=U24h35k9BD8PnEwUGYYvmBIswpqYBQGqkh9DoVIFaYtsT4tHLyPHxxMkiTU/+j3v
	kYIXzvaWhJkX5DTQHv0PnUWwZYY68dggrNVgIOP7bNfPmuoGgaThyCSvwzT1kwTYKfC
	e5IhTr2VLI4akY7cPJMZ2RIjw9g8B+nAfPzUwnTA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1708018347;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=mAV8qGDfuBVxomGu2MOihPoWVY2ycjeoqBIa/NaAfA8=;
	b=r5q13CZm3a4RY4awNDxlsgxUUV+xJBmqRxMD2j2kXU/l+UB4LThIwyMC8tyvKmBb
	jdsnSMGuIyKntQUYXsbpHABGamHOI5J4Zl6Pmow3c3ug9nQEYYIltmAt1LHn3MJd4iB
	PiuSEcxfmwFSb6/fTCMyHSfXw26l1m9aBBKVdpaU=
Content-Type: multipart/mixed; boundary="===============5338195927350388867=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-plugins-base: upgrading to 1.22.10 SUCCEEDED
Message-ID: <0101018dadd3ab73-43567c2b-5530-4202-876f-26aeff213456-000000@us-west-2.amazonses.com>
Date: Thu, 15 Feb 2024 17:32:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.02.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 17:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195659

--===============5338195927350388867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-plugins-base* to *1.22.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-plugins-base-upgrade-1.22.9-1.22.10.patch
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
From 7388293dca68bbdd55dc160d977bcf94d56d7e28 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Feb 2024 15:00:24 +0000
Subject: [PATCH] gstreamer1.0-plugins-base: upgrade 1.22.9 -> 1.22.10

---
 ...et-caps-from-src-pad-when-query-caps.patch | 12 +++++------
 ...parse-enhance-SSA-text-lines-parsing.patch | 20 +++++++++----------
 ...iv-fb-Make-sure-config.h-is-included.patch | 10 ++++------
 ...b => gstreamer1.0-plugins-base_1.22.10.bb} |  2 +-
 4 files changed, 19 insertions(+), 25 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.9.bb => gstreamer1.0-plugins-base_1.22.10.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
index d5d9838372..34c99ded42 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch
@@ -1,13 +1,14 @@
-From f9d48cd85ee68207733b1b91a00453462c33524a Mon Sep 17 00:00:00 2001
+From 63fe5a7b4ef70e2c490bad3b0838329935a8d77c Mon Sep 17 00:00:00 2001
 From: zhouming <b42586@freescale.com>
 Date: Wed, 14 May 2014 10:16:20 +0800
-Subject: [PATCH 1/4] ENGR00312515: get caps from src pad when query caps
+Subject: [PATCH] ENGR00312515: get caps from src pad when query caps
 
 https://bugzilla.gnome.org/show_bug.cgi?id=728312
 
 Upstream-Status: Pending
 
 Signed-off-by: zhouming <b42586@freescale.com>
+
 ---
  gst-libs/gst/tag/gsttagdemux.c | 13 +++++++++++++
  1 file changed, 13 insertions(+)
@@ -16,10 +17,10 @@ Signed-off-by: zhouming <b42586@freescale.com>
 diff --git a/gst-libs/gst/tag/gsttagdemux.c b/gst-libs/gst/tag/gsttagdemux.c
 old mode 100644
 new mode 100755
-index f545857..62d10ef
+index 173da37..2b7f34c
 --- a/gst-libs/gst/tag/gsttagdemux.c
 +++ b/gst-libs/gst/tag/gsttagdemux.c
-@@ -1777,6 +1777,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
+@@ -1796,6 +1796,19 @@ gst_tag_demux_pad_query (GstPad * pad, GstObject * parent, GstQuery * query)
        }
        break;
      }
@@ -39,6 +40,3 @@ index f545857..62d10ef
      default:
        res = gst_pad_query_default (pad, parent, query);
        break;
--- 
-2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
index e453a500c9..c922aadede 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-ssaparse-enhance-SSA-text-lines-parsing.patch
@@ -1,7 +1,7 @@
-From f587861bbe12ad0b10370f835592746aafedbf56 Mon Sep 17 00:00:00 2001
+From 7bf9525528c8f4a47413d7f82214d76f95f0c5f6 Mon Sep 17 00:00:00 2001
 From: Mingke Wang <mingke.wang@freescale.com>
 Date: Thu, 19 Mar 2015 14:17:10 +0800
-Subject: [PATCH 2/4] ssaparse: enhance SSA text lines parsing.
+Subject: [PATCH] ssaparse: enhance SSA text lines parsing.
 
 some parser will pass in the original ssa text line which starts with "Dialog:"
 and there's are maybe multiple Dialog lines in one input buffer.
@@ -9,6 +9,7 @@ and there's are maybe multiple Dialog lines in one input buffer.
 Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=747496]
 
 Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
+
 ---
  gst/subparse/gstssaparse.c | 150 +++++++++++++++++++++++++++++++++----
  1 file changed, 134 insertions(+), 16 deletions(-)
@@ -17,10 +18,10 @@ Signed-off-by: Mingke Wang <mingke.wang@freescale.com>
 diff --git a/gst/subparse/gstssaparse.c b/gst/subparse/gstssaparse.c
 old mode 100644
 new mode 100755
-index c849c08..4b9636c
+index d6fdb9c..5ebe678
 --- a/gst/subparse/gstssaparse.c
 +++ b/gst/subparse/gstssaparse.c
-@@ -262,6 +262,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
+@@ -270,6 +270,7 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
   * gst_ssa_parse_push_line:
   * @parse: caller element
   * @txt: text to push
@@ -28,7 +29,7 @@ index c849c08..4b9636c
   * @start: timestamp for the buffer
   * @duration: duration for the buffer
   *
-@@ -271,27 +272,133 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
+@@ -279,27 +280,133 @@ gst_ssa_parse_remove_override_codes (GstSsaParse * parse, gchar * txt)
   * Returns: result of the push of the created buffer
   */
  static GstFlowReturn
@@ -173,7 +174,7 @@ index c849c08..4b9636c
    GST_LOG_OBJECT (parse, "Text : %s", t);
  
    if (gst_ssa_parse_remove_override_codes (parse, t)) {
-@@ -309,13 +416,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse, gchar * txt,
+@@ -317,13 +424,22 @@ gst_ssa_parse_push_line (GstSsaParse * parse, gchar * txt,
    gst_buffer_fill (buf, 0, escaped, len + 1);
    gst_buffer_set_size (buf, len);
    g_free (escaped);
@@ -200,7 +201,7 @@ index c849c08..4b9636c
  
    ret = gst_pad_push (parse->srcpad, buf);
  
-@@ -335,6 +451,7 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
+@@ -343,6 +459,7 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
    GstClockTime ts;
    gchar *txt;
    GstMapInfo map;
@@ -208,7 +209,7 @@ index c849c08..4b9636c
  
    if (G_UNLIKELY (!parse->framed))
      goto not_framed;
-@@ -352,13 +469,14 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
+@@ -360,13 +477,14 @@ gst_ssa_parse_chain (GstPad * sinkpad, GstObject * parent, GstBuffer * buf)
    /* make double-sure it's 0-terminated and all */
    gst_buffer_map (buf, &map, GST_MAP_READ);
    txt = g_strndup ((gchar *) map.data, map.size);
@@ -224,6 +225,3 @@ index c849c08..4b9636c
  
    if (ret != GST_FLOW_OK && GST_CLOCK_TIME_IS_VALID (ts)) {
      GstSegment segment;
--- 
-2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
index 2af83ff8b9..a605533be8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-viv-fb-Make-sure-config.h-is-included.patch
@@ -1,19 +1,20 @@
-From 153f3b83a3fed77785bd1420bed8bbafa2d791b3 Mon Sep 17 00:00:00 2001
+From 2b07840122bc2e83bd23dad59aa80d9479f2e1e4 Mon Sep 17 00:00:00 2001
 From: Carlos Rafael Giani <crg7475@mailbox.org>
 Date: Tue, 21 May 2019 14:01:11 +0200
-Subject: [PATCH 3/4] viv-fb: Make sure config.h is included
+Subject: [PATCH] viv-fb: Make sure config.h is included
 
 This prevents build errors due to missing GST_API_* symbols
 
 Upstream-Status: Pending
 
 Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
+
 ---
  gst-libs/gst/gl/gl-prelude.h | 4 ++++
  1 file changed, 4 insertions(+)
 
 diff --git a/gst-libs/gst/gl/gl-prelude.h b/gst-libs/gst/gl/gl-prelude.h
-index 05e1f62..96ce5e6 100644
+index 85fca5a..946c729 100644
 --- a/gst-libs/gst/gl/gl-prelude.h
 +++ b/gst-libs/gst/gl/gl-prelude.h
 @@ -22,6 +22,10 @@
@@ -27,6 +28,3 @@ index 05e1f62..96ce5e6 100644
  #include <gst/gst.h>
  
  #ifdef BUILDING_GST_GL
--- 
-2.28.0
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb
index 980766c74b..d4b69b103f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "fac3e0dd2d8e9370388b34bf8c21b89d5f63bc3cfc12cd7fdc8fc6c1cba03334"
+SRC_URI[sha256sum] = "843a3a2da28e1ee6aeea56dd2be9bffcc3b4bbcd0f974eba4abfc3aa31f0399c"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.42.0


--===============5338195927350388867==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-plugins-base-upgrade-1.22.9-1.22.10.patch"

RnJvbSA3Mzg4MjkzZGNhNjhiYmRkNTVkYzE2MGQ5NzdiY2Y5NGQ1NmQ3ZTI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRmViIDIwMjQgMTU6MDA6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlOiB1cGdyYWRlIDEuMjIuOSAtPiAxLjIyLjEwCgotLS0K
IC4uLmV0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fwcy5wYXRjaCB8IDEyICsrKysr
LS0tLS0tCiAuLi5wYXJzZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2ggfCAy
MCArKysrKysrKystLS0tLS0tLS0tCiAuLi5pdi1mYi1NYWtlLXN1cmUtY29uZmlnLmgtaXMtaW5j
bHVkZWQucGF0Y2ggfCAxMCArKysrLS0tLS0tCiAuLi5iID0+IGdzdHJlYW1lcjEuMC1wbHVnaW5z
LWJhc2VfMS4yMi4xMC5iYn0gfCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25z
KCspLCAyNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIve2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yMi45LmJiID0+IGdzdHJlYW1lcjEu
MC1wbHVnaW5zLWJhc2VfMS4yMi4xMC5iYn0gKDk4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAxLUVO
R1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNoIGIv
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJh
c2UvMDAwMS1FTkdSMDAzMTI1MTUtZ2V0LWNhcHMtZnJvbS1zcmMtcGFkLXdoZW4tcXVlcnktY2Fw
cy5wYXRjaAppbmRleCBkNWQ5ODM4MzcyLi4zNGM5OWRlZDQyIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAx
LUVOR1IwMDMxMjUxNS1nZXQtY2Fwcy1mcm9tLXNyYy1wYWQtd2hlbi1xdWVyeS1jYXBzLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYXNlLzAwMDEtRU5HUjAwMzEyNTE1LWdldC1jYXBzLWZyb20tc3JjLXBhZC13aGVuLXF1
ZXJ5LWNhcHMucGF0Y2gKQEAgLTEsMTMgKzEsMTQgQEAKLUZyb20gZjlkNDhjZDg1ZWU2ODIwNzcz
M2IxYjkxYTAwNDUzNDYyYzMzNTI0YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNjNm
ZTVhN2I0ZWY3MGUyYzQ5MGJhZDNiMDgzODMyOTkzNWE4ZDc3YyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IHpob3VtaW5nIDxiNDI1ODZAZnJlZXNjYWxlLmNvbT4KIERhdGU6IFdlZCwg
MTQgTWF5IDIwMTQgMTA6MTY6MjAgKzA4MDAKLVN1YmplY3Q6IFtQQVRDSCAxLzRdIEVOR1IwMDMx
MjUxNTogZ2V0IGNhcHMgZnJvbSBzcmMgcGFkIHdoZW4gcXVlcnkgY2FwcworU3ViamVjdDogW1BB
VENIXSBFTkdSMDAzMTI1MTU6IGdldCBjYXBzIGZyb20gc3JjIHBhZCB3aGVuIHF1ZXJ5IGNhcHMK
IAogaHR0cHM6Ly9idWd6aWxsYS5nbm9tZS5vcmcvc2hvd19idWcuY2dpP2lkPTcyODMxMgogCiBV
cHN0cmVhbS1TdGF0dXM6IFBlbmRpbmcKIAogU2lnbmVkLW9mZi1ieTogemhvdW1pbmcgPGI0MjU4
NkBmcmVlc2NhbGUuY29tPgorCiAtLS0KICBnc3QtbGlicy9nc3QvdGFnL2dzdHRhZ2RlbXV4LmMg
fCAxMyArKysrKysrKysrKysrCiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKQEAg
LTE2LDEwICsxNywxMCBAQCBTaWduZWQtb2ZmLWJ5OiB6aG91bWluZyA8YjQyNTg2QGZyZWVzY2Fs
ZS5jb20+CiBkaWZmIC0tZ2l0IGEvZ3N0LWxpYnMvZ3N0L3RhZy9nc3R0YWdkZW11eC5jIGIvZ3N0
LWxpYnMvZ3N0L3RhZy9nc3R0YWdkZW11eC5jCiBvbGQgbW9kZSAxMDA2NDQKIG5ldyBtb2RlIDEw
MDc1NQotaW5kZXggZjU0NTg1Ny4uNjJkMTBlZgoraW5kZXggMTczZGEzNy4uMmI3ZjM0YwogLS0t
IGEvZ3N0LWxpYnMvZ3N0L3RhZy9nc3R0YWdkZW11eC5jCiArKysgYi9nc3QtbGlicy9nc3QvdGFn
L2dzdHRhZ2RlbXV4LmMKLUBAIC0xNzc3LDYgKzE3NzcsMTkgQEAgZ3N0X3RhZ19kZW11eF9wYWRf
cXVlcnkgKEdzdFBhZCAqIHBhZCwgR3N0T2JqZWN0ICogcGFyZW50LCBHc3RRdWVyeSAqIHF1ZXJ5
KQorQEAgLTE3OTYsNiArMTc5NiwxOSBAQCBnc3RfdGFnX2RlbXV4X3BhZF9xdWVyeSAoR3N0UGFk
ICogcGFkLCBHc3RPYmplY3QgKiBwYXJlbnQsIEdzdFF1ZXJ5ICogcXVlcnkpCiAgICAgICAgfQog
ICAgICAgIGJyZWFrOwogICAgICB9CkBAIC0zOSw2ICs0MCwzIEBAIGluZGV4IGY1NDU4NTcuLjYy
ZDEwZWYKICAgICAgZGVmYXVsdDoKICAgICAgICByZXMgPSBnc3RfcGFkX3F1ZXJ5X2RlZmF1bHQg
KHBhZCwgcGFyZW50LCBxdWVyeSk7CiAgICAgICAgYnJlYWs7Ci0tLSAKLTIuMjguMAotCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBs
dWdpbnMtYmFzZS8wMDAyLXNzYXBhcnNlLWVuaGFuY2UtU1NBLXRleHQtbGluZXMtcGFyc2luZy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYXNlLzAwMDItc3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBh
dGNoCmluZGV4IGU0NTNhNTAwYzkuLmM5MjJhYWRlZGUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDItc3Nh
cGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlLzAwMDIt
c3NhcGFyc2UtZW5oYW5jZS1TU0EtdGV4dC1saW5lcy1wYXJzaW5nLnBhdGNoCkBAIC0xLDcgKzEs
NyBAQAotRnJvbSBmNTg3ODYxYmJlMTJhZDBiMTAzNzBmODM1NTkyNzQ2YWFmZWRiZjU2IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA3YmY5NTI1NTI4YzhmNGE0NzQxM2Q3ZjgyMjE0ZDc2
Zjk1ZjBjNWY2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWluZ2tlIFdhbmcgPG1p
bmdrZS53YW5nQGZyZWVzY2FsZS5jb20+CiBEYXRlOiBUaHUsIDE5IE1hciAyMDE1IDE0OjE3OjEw
ICswODAwCi1TdWJqZWN0OiBbUEFUQ0ggMi80XSBzc2FwYXJzZTogZW5oYW5jZSBTU0EgdGV4dCBs
aW5lcyBwYXJzaW5nLgorU3ViamVjdDogW1BBVENIXSBzc2FwYXJzZTogZW5oYW5jZSBTU0EgdGV4
dCBsaW5lcyBwYXJzaW5nLgogCiBzb21lIHBhcnNlciB3aWxsIHBhc3MgaW4gdGhlIG9yaWdpbmFs
IHNzYSB0ZXh0IGxpbmUgd2hpY2ggc3RhcnRzIHdpdGggIkRpYWxvZzoiCiBhbmQgdGhlcmUncyBh
cmUgbWF5YmUgbXVsdGlwbGUgRGlhbG9nIGxpbmVzIGluIG9uZSBpbnB1dCBidWZmZXIuCkBAIC05
LDYgKzksNyBAQCBhbmQgdGhlcmUncyBhcmUgbWF5YmUgbXVsdGlwbGUgRGlhbG9nIGxpbmVzIGlu
IG9uZSBpbnB1dCBidWZmZXIuCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9i
dWd6aWxsYS5nbm9tZS5vcmcvc2hvd19idWcuY2dpP2lkPTc0NzQ5Nl0KIAogU2lnbmVkLW9mZi1i
eTogTWluZ2tlIFdhbmcgPG1pbmdrZS53YW5nQGZyZWVzY2FsZS5jb20+CisKIC0tLQogIGdzdC9z
dWJwYXJzZS9nc3Rzc2FwYXJzZS5jIHwgMTUwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0KICAxIGZpbGUgY2hhbmdlZCwgMTM0IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9u
cygtKQpAQCAtMTcsMTAgKzE4LDEwIEBAIFNpZ25lZC1vZmYtYnk6IE1pbmdrZSBXYW5nIDxtaW5n
a2Uud2FuZ0BmcmVlc2NhbGUuY29tPgogZGlmZiAtLWdpdCBhL2dzdC9zdWJwYXJzZS9nc3Rzc2Fw
YXJzZS5jIGIvZ3N0L3N1YnBhcnNlL2dzdHNzYXBhcnNlLmMKIG9sZCBtb2RlIDEwMDY0NAogbmV3
IG1vZGUgMTAwNzU1Ci1pbmRleCBjODQ5YzA4Li40Yjk2MzZjCitpbmRleCBkNmZkYjljLi41ZWJl
Njc4CiAtLS0gYS9nc3Qvc3VicGFyc2UvZ3N0c3NhcGFyc2UuYwogKysrIGIvZ3N0L3N1YnBhcnNl
L2dzdHNzYXBhcnNlLmMKLUBAIC0yNjIsNiArMjYyLDcgQEAgZ3N0X3NzYV9wYXJzZV9yZW1vdmVf
b3ZlcnJpZGVfY29kZXMgKEdzdFNzYVBhcnNlICogcGFyc2UsIGdjaGFyICogdHh0KQorQEAgLTI3
MCw2ICsyNzAsNyBAQCBnc3Rfc3NhX3BhcnNlX3JlbW92ZV9vdmVycmlkZV9jb2RlcyAoR3N0U3Nh
UGFyc2UgKiBwYXJzZSwgZ2NoYXIgKiB0eHQpCiAgICogZ3N0X3NzYV9wYXJzZV9wdXNoX2xpbmU6
CiAgICogQHBhcnNlOiBjYWxsZXIgZWxlbWVudAogICAqIEB0eHQ6IHRleHQgdG8gcHVzaApAQCAt
MjgsNyArMjksNyBAQCBpbmRleCBjODQ5YzA4Li40Yjk2MzZjCiAgICogQHN0YXJ0OiB0aW1lc3Rh
bXAgZm9yIHRoZSBidWZmZXIKICAgKiBAZHVyYXRpb246IGR1cmF0aW9uIGZvciB0aGUgYnVmZmVy
CiAgICoKLUBAIC0yNzEsMjcgKzI3MiwxMzMgQEAgZ3N0X3NzYV9wYXJzZV9yZW1vdmVfb3ZlcnJp
ZGVfY29kZXMgKEdzdFNzYVBhcnNlICogcGFyc2UsIGdjaGFyICogdHh0KQorQEAgLTI3OSwyNyAr
MjgwLDEzMyBAQCBnc3Rfc3NhX3BhcnNlX3JlbW92ZV9vdmVycmlkZV9jb2RlcyAoR3N0U3NhUGFy
c2UgKiBwYXJzZSwgZ2NoYXIgKiB0eHQpCiAgICogUmV0dXJuczogcmVzdWx0IG9mIHRoZSBwdXNo
IG9mIHRoZSBjcmVhdGVkIGJ1ZmZlcgogICAqLwogIHN0YXRpYyBHc3RGbG93UmV0dXJuCkBAIC0x
NzMsNyArMTc0LDcgQEAgaW5kZXggYzg0OWMwOC4uNGI5NjM2YwogICAgR1NUX0xPR19PQkpFQ1Qg
KHBhcnNlLCAiVGV4dCA6ICVzIiwgdCk7CiAgCiAgICBpZiAoZ3N0X3NzYV9wYXJzZV9yZW1vdmVf
b3ZlcnJpZGVfY29kZXMgKHBhcnNlLCB0KSkgewotQEAgLTMwOSwxMyArNDE2LDIyIEBAIGdzdF9z
c2FfcGFyc2VfcHVzaF9saW5lIChHc3RTc2FQYXJzZSAqIHBhcnNlLCBnY2hhciAqIHR4dCwKK0BA
IC0zMTcsMTMgKzQyNCwyMiBAQCBnc3Rfc3NhX3BhcnNlX3B1c2hfbGluZSAoR3N0U3NhUGFyc2Ug
KiBwYXJzZSwgZ2NoYXIgKiB0eHQsCiAgICBnc3RfYnVmZmVyX2ZpbGwgKGJ1ZiwgMCwgZXNjYXBl
ZCwgbGVuICsgMSk7CiAgICBnc3RfYnVmZmVyX3NldF9zaXplIChidWYsIGxlbik7CiAgICBnX2Zy
ZWUgKGVzY2FwZWQpOwpAQCAtMjAwLDcgKzIwMSw3IEBAIGluZGV4IGM4NDljMDguLjRiOTYzNmMK
ICAKICAgIHJldCA9IGdzdF9wYWRfcHVzaCAocGFyc2UtPnNyY3BhZCwgYnVmKTsKICAKLUBAIC0z
MzUsNiArNDUxLDcgQEAgZ3N0X3NzYV9wYXJzZV9jaGFpbiAoR3N0UGFkICogc2lua3BhZCwgR3N0
T2JqZWN0ICogcGFyZW50LCBHc3RCdWZmZXIgKiBidWYpCitAQCAtMzQzLDYgKzQ1OSw3IEBAIGdz
dF9zc2FfcGFyc2VfY2hhaW4gKEdzdFBhZCAqIHNpbmtwYWQsIEdzdE9iamVjdCAqIHBhcmVudCwg
R3N0QnVmZmVyICogYnVmKQogICAgR3N0Q2xvY2tUaW1lIHRzOwogICAgZ2NoYXIgKnR4dDsKICAg
IEdzdE1hcEluZm8gbWFwOwpAQCAtMjA4LDcgKzIwOSw3IEBAIGluZGV4IGM4NDljMDguLjRiOTYz
NmMKICAKICAgIGlmIChHX1VOTElLRUxZICghcGFyc2UtPmZyYW1lZCkpCiAgICAgIGdvdG8gbm90
X2ZyYW1lZDsKLUBAIC0zNTIsMTMgKzQ2OSwxNCBAQCBnc3Rfc3NhX3BhcnNlX2NoYWluIChHc3RQ
YWQgKiBzaW5rcGFkLCBHc3RPYmplY3QgKiBwYXJlbnQsIEdzdEJ1ZmZlciAqIGJ1ZikKK0BAIC0z
NjAsMTMgKzQ3NywxNCBAQCBnc3Rfc3NhX3BhcnNlX2NoYWluIChHc3RQYWQgKiBzaW5rcGFkLCBH
c3RPYmplY3QgKiBwYXJlbnQsIEdzdEJ1ZmZlciAqIGJ1ZikKICAgIC8qIG1ha2UgZG91YmxlLXN1
cmUgaXQncyAwLXRlcm1pbmF0ZWQgYW5kIGFsbCAqLwogICAgZ3N0X2J1ZmZlcl9tYXAgKGJ1Ziwg
Jm1hcCwgR1NUX01BUF9SRUFEKTsKICAgIHR4dCA9IGdfc3RybmR1cCAoKGdjaGFyICopIG1hcC5k
YXRhLCBtYXAuc2l6ZSk7CkBAIC0yMjQsNiArMjI1LDMgQEAgaW5kZXggYzg0OWMwOC4uNGI5NjM2
YwogIAogICAgaWYgKHJldCAhPSBHU1RfRkxPV19PSyAmJiBHU1RfQ0xPQ0tfVElNRV9JU19WQUxJ
RCAodHMpKSB7CiAgICAgIEdzdFNlZ21lbnQgc2VnbWVudDsKLS0tIAotMi4yOC4wCi0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1
Z2lucy1iYXNlLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRj
aCBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYXNlLzAwMDMtdml2LWZiLU1ha2Utc3VyZS1jb25maWcuaC1pcy1pbmNsdWRlZC5wYXRjaApp
bmRleCAyYWY4M2ZmOGI5Li5hNjA1NTMzYmU4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZS8wMDAzLXZpdi1mYi1N
YWtlLXN1cmUtY29uZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2UvMDAwMy12aXYtZmIt
TWFrZS1zdXJlLWNvbmZpZy5oLWlzLWluY2x1ZGVkLnBhdGNoCkBAIC0xLDE5ICsxLDIwIEBACi1G
cm9tIDE1M2YzYjgzYTNmZWQ3Nzc4NWJkMTQyMGJlZDhiYmFmYTJkNzkxYjMgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIDJiMDc4NDAxMjJiYzJlODNiZDIzZGFkNTlhYTgwZDk0NzlmMmUx
ZTQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDYXJsb3MgUmFmYWVsIEdpYW5pIDxj
cmc3NDc1QG1haWxib3gub3JnPgogRGF0ZTogVHVlLCAyMSBNYXkgMjAxOSAxNDowMToxMSArMDIw
MAotU3ViamVjdDogW1BBVENIIDMvNF0gdml2LWZiOiBNYWtlIHN1cmUgY29uZmlnLmggaXMgaW5j
bHVkZWQKK1N1YmplY3Q6IFtQQVRDSF0gdml2LWZiOiBNYWtlIHN1cmUgY29uZmlnLmggaXMgaW5j
bHVkZWQKIAogVGhpcyBwcmV2ZW50cyBidWlsZCBlcnJvcnMgZHVlIHRvIG1pc3NpbmcgR1NUX0FQ
SV8qIHN5bWJvbHMKIAogVXBzdHJlYW0tU3RhdHVzOiBQZW5kaW5nCiAKIFNpZ25lZC1vZmYtYnk6
IENhcmxvcyBSYWZhZWwgR2lhbmkgPGNyZzc0NzVAbWFpbGJveC5vcmc+CisKIC0tLQogIGdzdC1s
aWJzL2dzdC9nbC9nbC1wcmVsdWRlLmggfCA0ICsrKysKICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspCiAKIGRpZmYgLS1naXQgYS9nc3QtbGlicy9nc3QvZ2wvZ2wtcHJlbHVkZS5oIGIv
Z3N0LWxpYnMvZ3N0L2dsL2dsLXByZWx1ZGUuaAotaW5kZXggMDVlMWY2Mi4uOTZjZTVlNiAxMDA2
NDQKK2luZGV4IDg1ZmNhNWEuLjk0NmM3MjkgMTAwNjQ0CiAtLS0gYS9nc3QtbGlicy9nc3QvZ2wv
Z2wtcHJlbHVkZS5oCiArKysgYi9nc3QtbGlicy9nc3QvZ2wvZ2wtcHJlbHVkZS5oCiBAQCAtMjIs
NiArMjIsMTAgQEAKQEAgLTI3LDYgKzI4LDMgQEAgaW5kZXggMDVlMWY2Mi4uOTZjZTVlNiAxMDA2
NDQKICAjaW5jbHVkZSA8Z3N0L2dzdC5oPgogIAogICNpZmRlZiBCVUlMRElOR19HU1RfR0wKLS0t
IAotMi4yOC4wCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjIuOS5iYiBiL21ldGEvcmVjaXBlcy1tdWx0
aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEuMjIuMTAuYmIKc2lt
aWxhcml0eSBpbmRleCA5OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1wbHVnaW5zLWJhc2VfMS4yMi45LmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFzZV8x
LjIyLjEwLmJiCmluZGV4IDk4MDc2NmM3NGIuLmQ0YjY5YjEwM2YgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcGx1Z2lucy1iYXNlXzEu
MjIuOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVy
MS4wLXBsdWdpbnMtYmFzZV8xLjIyLjEwLmJiCkBAIC0xMSw3ICsxMSw3IEBAIFNSQ19VUkkgPSAi
aHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtcGx1Z2lucy1iYXNlL2dz
dC1wbHVnaW5zLWJhCiAgICAgICAgICAgIGZpbGU6Ly8wMDAzLXZpdi1mYi1NYWtlLXN1cmUtY29u
ZmlnLmgtaXMtaW5jbHVkZWQucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMi1zc2FwYXJz
ZS1lbmhhbmNlLVNTQS10ZXh0LWxpbmVzLXBhcnNpbmcucGF0Y2ggXAogICAgICAgICAgICAiCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZmFjM2UwZGQyZDhlOTM3MDM4OGIzNGJmOGMyMWI4OWQ1ZjYz
YmMzY2ZjMTJjZDdmZGM4ZmM2YzFjYmEwMzMzNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4NDNh
M2EyZGEyOGUxZWU2YWVlYTU2ZGQyYmU5YmZmY2MzYjRiYmNkMGY5NzRlYmE0YWJmYzNhYTMxZjAz
OTljIgogCiBTID0gIiR7V09SS0RJUn0vZ3N0LXBsdWdpbnMtYmFzZS0ke1BWfSIKIAotLSAKMi40
Mi4wCgo=

--===============5338195927350388867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-adder: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-allocators-typelib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-alsa: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app-typelib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-app: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-apps: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audio-typelib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioconvert: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiomixer: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiorate: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audioresample: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-audiotestsrc: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-compositor: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: FILELIST: removed "/usr/lib/.debug/libgstpbutils-1.0.so.0.2209.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2209.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2209.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2209.0 /usr/lib/.debug/libgstgl-1.0.so.0.2209.0 /usr/lib/.debug/libgstapp-1.0.so.0.2209.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2209.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2209.0 /usr/lib/.debug/libgsttag-1.0.so.0.2209.0 /usr/lib/.debug/libgstfft-1.0.so.0.2209.0 /usr/lib/.debug/libgstriff-1.0.so.0.2209.0 /usr/lib/.debug/libgstallocators-1.0.so.0.2209.0", added "/usr/lib/.debug/libgstallocators-1.0.so.0.2210.0 /usr/lib/.debug/libgstgl-1.0.so.0.2210.0 /usr/lib/.debug/libgstrtsp-1.0.so.0.2210.0 /usr/lib/.debug/libgstvideo-1.0.so.0.2210.0 /usr/lib/.debug/libgstapp-1.0.so.0.2210.0 /usr/lib/.debug/libgstrtp-1.0.so.0.2210.0 /usr/lib/.debug/libgstfft-1.0.so.0.2210.0 /usr/lib/.debug/libgsttag-1.0.so.0.2210.0 /usr/lib/.debug/lib
 gstpbutils-1.0.so.0.2210.0 /usr/lib/.debug/libgstsdp-1.0.so.0.2210.0 /usr/lib/.debug/libgstriff-1.0.so.0.2210.0 /usr/lib/.debug/libgstaudio-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dbg: PKGSIZE changed from 18026256 to 18026880 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-dev: PKGSIZE changed from 5875249 to 5875268 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-doc: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-encoding: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gio: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-gl-typelib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glegl-typelib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glwayland-typelib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-glx11-typelib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-af: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-az: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-bg: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ca: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-cs: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-da: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-de: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-el: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-en-gb: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eo: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-es: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-eu: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fi: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fr: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-fur: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-gl: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hr: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-hu: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-id: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-it: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ja: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ka: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lt: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-lv: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nb: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-nl: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-or: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pl: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-pt-br: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ro: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-ru: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sk: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sl: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sq: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sr: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-sv: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-tr: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-uk: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-vi: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-locale-zh-cn: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-meta: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ogg: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-opengl: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-overlaycomposition: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pango: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbtypes: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-pbutils-typelib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-playback: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rawparse: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtp-typelib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-rtsp-typelib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-sdp-typelib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-src: PKGSIZE changed from 13874944 to 13875053 (+0%)
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-staticdev: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-subparse: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tag-typelib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-tcp: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-theora: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-typefindfunctions: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-video-typelib: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videoconvertscale: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videorate: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-videotestsrc: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-volume: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-vorbis: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-ximagesink: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base-xvimagesink: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/gstreamer1.0-plugins-base: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.22.9.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch" to "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-1.22.10.tar.xz file://0001-ENGR00312515-get-caps-from-src-pad-when-query-caps.patch file://0003-viv-fb-Make-sure-config.h-is-included.patch file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILES: removed "/usr/lib/libgstallocators-1.0.so.0.2209.0", added "/usr/lib/libgstallocators-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2209.0", added "/usr/lib/libgstallocators-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILES: removed "/usr/lib/libgstapp-1.0.so.0.2209.0", added "/usr/lib/libgstapp-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2209.0", added "/usr/lib/libgstapp-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILES: removed "/usr/lib/libgstaudio-1.0.so.0.2209.0", added "/usr/lib/libgstaudio-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2209.0", added "/usr/lib/libgstaudio-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILES: removed "/usr/lib/libgstfft-1.0.so.0.2209.0", added "/usr/lib/libgstfft-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2209.0", added "/usr/lib/libgstfft-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILES: removed "/usr/lib/libgstgl-1.0.so.0.2209.0", added "/usr/lib/libgstgl-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2209.0", added "/usr/lib/libgstgl-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILES: removed "/usr/lib/libgstpbutils-1.0.so.0.2209.0", added "/usr/lib/libgstpbutils-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2209.0", added "/usr/lib/libgstpbutils-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILES: removed "/usr/lib/libgstriff-1.0.so.0.2209.0", added "/usr/lib/libgstriff-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2209.0", added "/usr/lib/libgstriff-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILES: removed "/usr/lib/libgstrtp-1.0.so.0.2209.0", added "/usr/lib/libgstrtp-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2209.0", added "/usr/lib/libgstrtp-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILES: removed "/usr/lib/libgstrtsp-1.0.so.0.2209.0", added "/usr/lib/libgstrtsp-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2209.0", added "/usr/lib/libgstrtsp-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILES: removed "/usr/lib/libgstsdp-1.0.so.0.2209.0", added "/usr/lib/libgstsdp-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2209.0", added "/usr/lib/libgstsdp-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILES: removed "/usr/lib/libgsttag-1.0.so.0.2209.0", added "/usr/lib/libgsttag-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2209.0", added "/usr/lib/libgsttag-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: PV changed from "1.22.9" to "1.22.10"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILES: removed "/usr/lib/libgstvideo-1.0.so.0.2209.0", added "/usr/lib/libgstvideo-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2209.0", added "/usr/lib/libgstvideo-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PKGV changed from 1.22.9 [default] to 1.22.10 [default]
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: PV changed from "1.22.9" to "1.22.10"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2209.0 to libgstallocators-1.0.so.0.2210.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2209.0 to libgstapp-1.0.so.0.2210.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2209.0 to libgstaudio-1.0.so.0.2210.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2209.0 to libgstfft-1.0.so.0.2210.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2209.0 to libgstgl-1.0.so.0.2210.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2209.0 to libgstpbutils-1.0.so.0.2210.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2209.0 to libgstriff-1.0.so.0.2210.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2209.0 to libgstrtp-1.0.so.0.2210.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2209.0 to libgstrtsp-1.0.so.0.2210.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2209.0 to libgstsdp-1.0.so.0.2210.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2209.0 to libgsttag-1.0.so.0.2210.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2209.0 to libgstvideo-1.0.so.0.2210.0
  /usr/lib/libgstallocators-1.0.so.0.2209.0 moved to /usr/lib/libgstallocators-1.0.so.0.2210.0
  /usr/lib/libgstapp-1.0.so.0.2209.0 moved to /usr/lib/libgstapp-1.0.so.0.2210.0
  /usr/lib/libgstaudio-1.0.so.0.2209.0 moved to /usr/lib/libgstaudio-1.0.so.0.2210.0
  /usr/lib/libgstfft-1.0.so.0.2209.0 moved to /usr/lib/libgstfft-1.0.so.0.2210.0
  /usr/lib/libgstgl-1.0.so.0.2209.0 moved to /usr/lib/libgstgl-1.0.so.0.2210.0
  /usr/lib/libgstpbutils-1.0.so.0.2209.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2210.0
  /usr/lib/libgstriff-1.0.so.0.2209.0 moved to /usr/lib/libgstriff-1.0.so.0.2210.0
  /usr/lib/libgstrtp-1.0.so.0.2209.0 moved to /usr/lib/libgstrtp-1.0.so.0.2210.0
  /usr/lib/libgstrtsp-1.0.so.0.2209.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2210.0
  /usr/lib/libgstsdp-1.0.so.0.2209.0 moved to /usr/lib/libgstsdp-1.0.so.0.2210.0
  /usr/lib/libgsttag-1.0.so.0.2209.0 moved to /usr/lib/libgsttag-1.0.so.0.2210.0
  /usr/lib/libgstvideo-1.0.so.0.2209.0 moved to /usr/lib/libgstvideo-1.0.so.0.2210.0
Changes to packages/x86_64-linux/gcc-cross-x86_64 (sysroot):
  /sysroot-providers/virtual_x86_64-poky-linux-g++ was added
  /sysroot-providers/virtual_x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-cpp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-13.2.0 was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-dump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-tool was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-lto-dump was added
  /usr/libexec/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/cc1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/cc1plus was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/collect2 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/g++-mapper-server was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/fixincl was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/fixinc.sh was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/mkheaders was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld.gold was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcp1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcp1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/liblto_plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/lto1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/lto-wrapper was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/gengtype was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/strip was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ld.gold was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/x86_64-poky-linux/gcc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/adxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/ammintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxbf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxcomplexintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxfp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxtileintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx5124fmapsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx5124vnniwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512cdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512dqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512erintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512fintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512fp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512pfintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vldqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxneconvertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxvnniint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxvnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/bmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/bmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/bmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cet.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cldemoteintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/clflushoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/clwbintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/clzerointrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cmpccxaddintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cpuid.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cross-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/emmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/enqcmdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/f16cintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include-fixed was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include-fixed/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/float.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/fma4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/fmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/fxsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/gfniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/hresetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/ia32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/immintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/iso646.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/keylockerintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/lwpintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/lzcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mm3dnow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mm_malloc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/movdirintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mwaitintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mwaitxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/nmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/pconfigintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/pkuintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/pmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/popcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/prfchiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/prfchwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/quadmath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/quadmath_weak.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/raointintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/rdseedintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/rtmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/serializeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/sgxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/shaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/smmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdalign.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdatomic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdbool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stddef.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdfix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdint-gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdnoreturn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/syslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/tbmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/tmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/uintrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/unwind.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/vaesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/varargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/waitpkgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/wmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/x86gprintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/x86intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xopintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsavecintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsaveintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsaveoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsavesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xtestintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/fixinc_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/include/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/macro_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/mkheaders.conf was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/gtype.state was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ada was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/addresses.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/align.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/all-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ansidecl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/array-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/asan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/attribs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/auto-host.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/auto-profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/backend.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/basic-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/b-header-vars was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/bitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtins.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtin-types.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/bversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/calls.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ccmp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfganal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfghooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cgraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cif-code.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/collect2.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/collect-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/color-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/conditions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/configargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/elfos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/biarch64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/convert.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/coretypes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/coverage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/contracts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cp-trait.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/operators.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cppdefault.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cpplib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cselib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ctfc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/d was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/data-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ddg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/debug.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/defaults.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/df.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dfp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/digraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dojump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dominance.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/domwalk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/double-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dump-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dumpfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/edit-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/errors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/escaped_string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/et-forest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/except.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/explow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/expmed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/file-find.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/filenames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fixed-value.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/flag-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fold-const.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/function-abi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcov-io.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcse-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/generic-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gengtype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/genrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gensupport.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ggc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-infer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimplify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/glimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graphds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graphite.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graphviz.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gsstruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gsyms.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hashtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-table.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hosthooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hwint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ifcvt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/inchash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/incpath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/input.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-addr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-attr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-codes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-modes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/internal-fn.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/internal-fn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/intl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ira.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ira-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/is-a.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/langhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lcm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/libiberty.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/limitx.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/limity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/line-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lra-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lto-compress.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/m2 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/m2/m2-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/machmode.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/machmode.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/make-unique.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/md5.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/memmodel.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/memory-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mem-stats.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mode-classes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mux-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/objc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/obstack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-expand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-general.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-offload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/options.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opt-problem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opts-jobserver.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/output.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/passes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pass-instances.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pass_manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin-version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pointer-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/poly-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/predict.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/prefix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/print-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/print-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/profile-count.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/read-md.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/real.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/realmpfr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/recog.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regcprop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/reg-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regrename.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/reload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/resource.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtlanal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl-error.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtlhash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sanitizer.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sched-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/selftest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sel-sched.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sese.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/signop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sparseset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/spellcheck.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sreal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/statistics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/stmt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/stor-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/stringpool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/substring-locations.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/system.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-globals.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-insns.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/targhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/timevar.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/timevar.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tm_p.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tm-preds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/toplev.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tracer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/trans-mem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-affine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-check.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-eh.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-nested.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-pass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-sra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/treestruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tristate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tsystem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/typeclass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ubsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/valtrack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-prof.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-range-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-range-storage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-relation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/varasm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vr-values.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/wide-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/xcoff.h was added
  /sysroot-providers/virtual_x86_64-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-cpp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-13.2.0 was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-dump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-tool was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-lto-dump was removed
  /usr/libexec/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/cc1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/cc1plus was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/collect2 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/g++-mapper-server was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/fixincl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/mkheaders was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ld.gold was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcp1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/liblto_plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/lto1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/lto-wrapper was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/gengtype was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/strip was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ld.gold was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/x86_64-poky-linux-musl/gcc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/adxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/ammintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxbf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxcomplexintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxfp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxtileintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512cdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512dqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512erintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512fintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512pfintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxneconvertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxvnniint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxvnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/bmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/bmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/bmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cet.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cldemoteintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/clflushoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/clwbintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/clzerointrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cmpccxaddintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cpuid.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cross-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/emmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/enqcmdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/f16cintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include-fixed was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include-fixed/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/float.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/fma4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/fmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/fxsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/gfniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/hresetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/ia32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/immintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/iso646.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/keylockerintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/lwpintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/lzcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mm3dnow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mm_malloc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/movdirintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mwaitintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mwaitxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/nmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/pconfigintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/pkuintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/pmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/popcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/prfchiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/prfchwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/quadmath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/quadmath_weak.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/raointintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/rdseedintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/rtmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/serializeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/sgxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/shaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/smmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdalign.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdatomic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdbool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stddef.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdfix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdint-gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdnoreturn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/syslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/tbmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/tmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/uintrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/unwind.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/vaesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/varargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/waitpkgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/wmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/x86gprintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/x86intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xopintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsavecintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsaveintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsavesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xtestintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/fixinc_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/include/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/macro_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/gtype.state was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ada was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/addresses.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/align.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/all-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/array-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/asan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/attribs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/auto-host.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/backend.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/basic-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/b-header-vars was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/bitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtins.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/bversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/calls.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ccmp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfganal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cgraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cif-code.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/collect2.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/color-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/conditions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/configargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/biarch64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/convert.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/coretypes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/coverage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/contracts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cp-trait.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cpplib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cselib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ctfc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/d was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ddg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/debug.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/defaults.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/df.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dfp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/digraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dojump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dominance.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/domwalk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/double-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dump-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/edit-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/errors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/et-forest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/except.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/explow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/expmed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/file-find.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/filenames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/flag-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fold-const.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/function-abi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/generic-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gengtype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/genrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gensupport.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ggc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-infer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimplify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/glimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graphds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graphite.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graphviz.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gsyms.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hashtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-table.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hwint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/inchash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/incpath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/input.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/intl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ira.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ira-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/is-a.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/langhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lcm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/libiberty.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/limitx.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/limity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/line-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lra-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/m2 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/m2/m2-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/machmode.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/machmode.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/make-unique.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/md5.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/memmodel.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/memory-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/objc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/obstack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-general.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/options.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opts-jobserver.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/output.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/passes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/poly-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/predict.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/prefix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/print-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/profile-count.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/read-md.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/real.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/recog.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regcprop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regrename.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/reload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/resource.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sched-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/selftest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sese.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/signop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sparseset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sreal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/statistics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/stmt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/stringpool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/system.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-globals.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-insns.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/targhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/timevar.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/timevar.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tm_p.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/toplev.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tracer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-check.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/treestruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tristate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tsystem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/typeclass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ubsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/valtrack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-prof.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-range-storage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-relation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/varasm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vr-values.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/wide-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/xcoff.h was removed

--===============5338195927350388867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstallocators-1.0: FILELIST: removed "/usr/lib/libgstallocators-1.0.so.0.2209.0", added "/usr/lib/libgstallocators-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstapp-1.0: FILELIST: removed "/usr/lib/libgstapp-1.0.so.0.2209.0", added "/usr/lib/libgstapp-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstaudio-1.0: FILELIST: removed "/usr/lib/libgstaudio-1.0.so.0.2209.0", added "/usr/lib/libgstaudio-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstfft-1.0: FILELIST: removed "/usr/lib/libgstfft-1.0.so.0.2209.0", added "/usr/lib/libgstfft-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstgl-1.0: FILELIST: removed "/usr/lib/libgstgl-1.0.so.0.2209.0", added "/usr/lib/libgstgl-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstpbutils-1.0: FILELIST: removed "/usr/lib/libgstpbutils-1.0.so.0.2209.0", added "/usr/lib/libgstpbutils-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstriff-1.0: FILELIST: removed "/usr/lib/libgstriff-1.0.so.0.2209.0", added "/usr/lib/libgstriff-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtp-1.0: FILELIST: removed "/usr/lib/libgstrtp-1.0.so.0.2209.0", added "/usr/lib/libgstrtp-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstrtsp-1.0: FILELIST: removed "/usr/lib/libgstrtsp-1.0.so.0.2209.0", added "/usr/lib/libgstrtsp-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstsdp-1.0: FILELIST: removed "/usr/lib/libgstsdp-1.0.so.0.2209.0", added "/usr/lib/libgstsdp-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgsttag-1.0: FILELIST: removed "/usr/lib/libgsttag-1.0.so.0.2209.0", added "/usr/lib/libgsttag-1.0.so.0.2210.0"
packages/core2-64-poky-linux/gstreamer1.0-plugins-base/libgstvideo-1.0: FILELIST: removed "/usr/lib/libgstvideo-1.0.so.0.2209.0", added "/usr/lib/libgstvideo-1.0.so.0.2210.0"
Changes to packages/core2-64-poky-linux/gstreamer1.0-plugins-base (sysroot):
  /usr/lib/libgstallocators-1.0.so.0 changed symlink target from libgstallocators-1.0.so.0.2209.0 to libgstallocators-1.0.so.0.2210.0
  /usr/lib/libgstapp-1.0.so.0 changed symlink target from libgstapp-1.0.so.0.2209.0 to libgstapp-1.0.so.0.2210.0
  /usr/lib/libgstaudio-1.0.so.0 changed symlink target from libgstaudio-1.0.so.0.2209.0 to libgstaudio-1.0.so.0.2210.0
  /usr/lib/libgstfft-1.0.so.0 changed symlink target from libgstfft-1.0.so.0.2209.0 to libgstfft-1.0.so.0.2210.0
  /usr/lib/libgstgl-1.0.so.0 changed symlink target from libgstgl-1.0.so.0.2209.0 to libgstgl-1.0.so.0.2210.0
  /usr/lib/libgstpbutils-1.0.so.0 changed symlink target from libgstpbutils-1.0.so.0.2209.0 to libgstpbutils-1.0.so.0.2210.0
  /usr/lib/libgstriff-1.0.so.0 changed symlink target from libgstriff-1.0.so.0.2209.0 to libgstriff-1.0.so.0.2210.0
  /usr/lib/libgstrtp-1.0.so.0 changed symlink target from libgstrtp-1.0.so.0.2209.0 to libgstrtp-1.0.so.0.2210.0
  /usr/lib/libgstrtsp-1.0.so.0 changed symlink target from libgstrtsp-1.0.so.0.2209.0 to libgstrtsp-1.0.so.0.2210.0
  /usr/lib/libgstsdp-1.0.so.0 changed symlink target from libgstsdp-1.0.so.0.2209.0 to libgstsdp-1.0.so.0.2210.0
  /usr/lib/libgsttag-1.0.so.0 changed symlink target from libgsttag-1.0.so.0.2209.0 to libgsttag-1.0.so.0.2210.0
  /usr/lib/libgstvideo-1.0.so.0 changed symlink target from libgstvideo-1.0.so.0.2209.0 to libgstvideo-1.0.so.0.2210.0
  /usr/lib/libgstallocators-1.0.so.0.2209.0 moved to /usr/lib/libgstallocators-1.0.so.0.2210.0
  /usr/lib/libgstapp-1.0.so.0.2209.0 moved to /usr/lib/libgstapp-1.0.so.0.2210.0
  /usr/lib/libgstaudio-1.0.so.0.2209.0 moved to /usr/lib/libgstaudio-1.0.so.0.2210.0
  /usr/lib/libgstfft-1.0.so.0.2209.0 moved to /usr/lib/libgstfft-1.0.so.0.2210.0
  /usr/lib/libgstgl-1.0.so.0.2209.0 moved to /usr/lib/libgstgl-1.0.so.0.2210.0
  /usr/lib/libgstpbutils-1.0.so.0.2209.0 moved to /usr/lib/libgstpbutils-1.0.so.0.2210.0
  /usr/lib/libgstriff-1.0.so.0.2209.0 moved to /usr/lib/libgstriff-1.0.so.0.2210.0
  /usr/lib/libgstrtp-1.0.so.0.2209.0 moved to /usr/lib/libgstrtp-1.0.so.0.2210.0
  /usr/lib/libgstrtsp-1.0.so.0.2209.0 moved to /usr/lib/libgstrtsp-1.0.so.0.2210.0
  /usr/lib/libgstsdp-1.0.so.0.2209.0 moved to /usr/lib/libgstsdp-1.0.so.0.2210.0
  /usr/lib/libgsttag-1.0.so.0.2209.0 moved to /usr/lib/libgsttag-1.0.so.0.2210.0
  /usr/lib/libgstvideo-1.0.so.0.2209.0 moved to /usr/lib/libgstvideo-1.0.so.0.2210.0
Changes to packages/x86_64-linux/gcc-cross-x86_64 (sysroot):
  /sysroot-providers/virtual_x86_64-poky-linux-g++ was added
  /sysroot-providers/virtual_x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-c++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-cpp was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-13.2.0 was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ar was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-nm was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc-ranlib was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-dump was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcov-tool was added
  /usr/bin/x86_64-poky-linux/x86_64-poky-linux-lto-dump was added
  /usr/libexec/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/cc1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/cc1plus was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/collect2 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/g++-mapper-server was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/fixincl was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/fixinc.sh was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/mkheaders was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/mkinstalldirs was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ld.gold was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcc1.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcp1plugin.so.0.0.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcp1plugin.so.0 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/libcp1plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/liblto_plugin.so was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/lto1 was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/lto-wrapper was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/gengtype was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/strip was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ar was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-as was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-cpp was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-gcc was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ld.bfd was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ld was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ld.gold was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-nm was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-objcopy was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-objdump was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-ranlib was added
  /usr/libexec/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/x86_64-poky-linux-strip was added
  /usr/lib/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/bfd-plugins was added
  /usr/lib/x86_64-poky-linux/bfd-plugins/liblto_plugin.so was added
  /usr/lib/x86_64-poky-linux/gcc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/adxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/ammintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxbf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxcomplexintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxfp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/amxtileintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx5124fmapsintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx5124vnniwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bf16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bf16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bitalgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512bwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512cdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512dqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512erintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512fintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512fp16intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512fp16vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512ifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512ifmavlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512pfintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmi2vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vbmivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vlbwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vldqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vnnivlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vp2intersectintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vp2intersectvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vpopcntdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avx512vpopcntdqvlintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxifmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxneconvertintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxvnniint8intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/avxvnniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/bmi2intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/bmiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/bmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cet.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cldemoteintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/clflushoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/clwbintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/clzerointrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cmpccxaddintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cpuid.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/cross-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/emmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/enqcmdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/f16cintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include-fixed was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include-fixed/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/float.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/fma4intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/fmaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/fxsrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/gfniintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/hresetintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/ia32intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/immintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/iso646.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/keylockerintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/lwpintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/lzcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mm3dnow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mm_malloc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/movdirintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mwaitintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/mwaitxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/nmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/pconfigintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/pkuintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/pmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/popcntintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/prfchiintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/prfchwintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/quadmath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/quadmath_weak.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/raointintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/rdseedintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/rtmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/serializeintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/sgxintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/shaintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/smmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdalign.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdatomic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdbool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stddef.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdfix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdint-gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/stdnoreturn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/syslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/tbmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/tmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/tsxldtrkintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/uintrintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/unwind.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/vaesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/varargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/vpclmulqdqintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/waitpkgintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/wbnoinvdintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/wmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/x86gprintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/x86intrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xmmintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xopintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsavecintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsaveintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsaveoptintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xsavesintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/include/xtestintrin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/fixinc_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/include/limits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/include/README was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/macro_list was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/install-tools/mkheaders.conf was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/gtype.state was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ada was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ada/gcc-interface was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ada/gcc-interface/ada-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/addresses.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/align.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/alloc-pool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/all-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ansidecl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/array-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/asan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/attr-fnspec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/attribs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/auto-host.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/auto-profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/backend.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/basic-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/bb-reorder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/b-header-vars was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/bitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtin-attrs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtins.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/builtin-types.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/bversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/calls.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ccmp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-common.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-objc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-pragma.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-family/c-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfganal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgbuild.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgexpand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfg-flags.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfghooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgloopmanip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cfgrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cgraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cif-code.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/collect2-aix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/collect2.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/collect-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/color-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/conditions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/configargs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/elfos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/glibc-stdint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/gnu-user.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/att.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/biarch64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/gnu-user64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/gnu-user-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386-isa.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/i386-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/linux64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/linux-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/stringop.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/unix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/x86-64.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/i386/x86-tune.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/initfini-array.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/linux-android.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/linux-protos.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/config/vxworks-dummy.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/convert.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/coretypes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/coroutine-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/coverage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/contracts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cp-trait.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cp-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cp-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/cxx-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/name-lookup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/operators.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cppbuiltin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cppdefault.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cpplib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cp/type-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/cselib.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ctfc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/c-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/d was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/data-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dbgcnt.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dbgcnt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ddg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/d/d-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/debug.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/defaults.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/df.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dfp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-client-data-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-color.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-event-id.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-metadata.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-spec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/diagnostic-url.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/digraph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dojump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dominance.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/domwalk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/double-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dump-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dumpfile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dwarf2asm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dwarf2ctf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/dwarf2out.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/edit-context.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/emit-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/errors.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/escaped_string.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/et-forest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/except.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/explow.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/expmed.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fibonacci_heap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/file-find.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/filenames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/file-prefix-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fixed-value.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/flag-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fold-const-call.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/fold-const.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/function-abi.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc-plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc-rich-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcc-symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcov-counter.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcov-io.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcse-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gcse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/generic-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gengtype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/genrtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gensupport.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ggc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ggc-internal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-array-bounds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-expr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-match.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-predicate-analysis.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-cache.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-edge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-fold.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-gori.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-infer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-path.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-range-trace.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-ssa-warn-access.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-ssa-warn-restrict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimple-walk.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimplify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gimplify-me.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/glimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gomp-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graphds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graph.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graphite.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/graphviz.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gsstruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gsyms.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gsyslimits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gtm-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/gtype-desc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hard-reg-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-map-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-set.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hashtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-table.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/highlev-plugin-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hosthooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hosthooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hw-doloop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/hwint.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ifcvt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/inchash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/incpath.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/input.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-addr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-attr-common.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-attr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-codes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-config.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-constants.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-flags.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-modes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-modes-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/insn-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/internal-fn.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/internal-fn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/intl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/int-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-fnsummary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-icf-gimple.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-icf.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-modref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-modref-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-param-manipulation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-predicate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-prop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-reference.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ipa-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ira.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ira-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/is-a.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/iterator-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/langhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/langhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lcm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/libiberty.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/limitx.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/limity.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/line-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/linux.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/loop-unroll.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lower-subreg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lra-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lto-compress.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lto-section-names.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/lto-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/m2 was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/m2/m2-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/machmode.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/machmode.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/make-unique.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/md5.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/memmodel.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/memory-block.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mem-stats.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mem-stats-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mode-classes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/mux-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/objc was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/objc/objc-tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/obstack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/obstack-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-expand.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-general.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-low.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-offload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/omp-simd-clone.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs-libfuncs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optabs-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optinfo-emit-json.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/optinfo.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/options.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opt-problem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opts-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opts-jobserver.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/opt-suggestions.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ordered-hash-map.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/output.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/passes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pass-instances.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pass_manager.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin-api.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/plugin-version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pointer-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/poly-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/poly-int-types.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/predict.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/predict.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/prefix.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/print-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/print-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/profile-count.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/profile.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/range-op.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/read-md.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/read-rtl-function.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/real.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/realmpfr.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/recog.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regcprop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/reg-notes.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regrename.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/regs.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/reload.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/resource.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtlanal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl-error.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtlhash.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtlhooks-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl-iter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtl-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/rtx-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/run-rtl-passes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/safe-ctype.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sanitizer.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sbitmap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sched-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/selftest-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/selftest.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/selftest-rtl.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sel-sched-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sel-sched.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sel-sched-ir.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sese.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/shortest-paths.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/shrink-wrap.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/signop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sparseset.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/spellcheck.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/spellcheck-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/splay-tree-utils.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sreal.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ssa-iterators.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/statistics.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/stmt.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/stor-layout.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/streamer-hooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/stringpool.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/substring-locations.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symbol-summary.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symtab-clones.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symtab.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/symtab-thunks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/sync-builtins.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/system.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-def.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-globals.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-hooks-macros.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/target-insns.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/targhooks.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/timevar.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/timevar.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tm_p.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tm-preds.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/toplev.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tracer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/trans-mem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-affine.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-cfgcleanup.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-cfg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-check.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-chrec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-core.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-data-ref.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-dfa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-diagnostic.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-dump.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-eh.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-hasher.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-hash-traits.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-if-conv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-inline.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-into-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-iterator.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-logical-location.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-nested.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-object-size.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-outof-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-parloops.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-pass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-phinodes.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-scalar-evolution.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-sra.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-address.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-alias-compare.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-alias.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-ccp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-coalesce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-dce.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-dom.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-dse.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-live.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop-ivopts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop-manip.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-loop-niter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-math-opts.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssanames.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-operands.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-propagate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-reassoc.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-sccvn.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-scopedtables.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-strlen.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-ter.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-threadedge.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-ssa-threadupdate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-stdarg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-streamer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/treestruct.def was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-switch-conversion.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-vectorizer.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tree-vrp.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tristate.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/tsystem.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/typeclass.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/typed-splay-tree.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/ubsan.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/valtrack.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-pointer-equiv.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-prof.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-query.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-range.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-range-pretty-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-range-storage.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/value-relation.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/varasm.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vec.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vec-perm-indices.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vector-builder.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/version.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vmsdbg.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vr-values.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/vtable-verify.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/wide-int-bitmask.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/wide-int.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/wide-int-print.h was added
  /usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/13.2.0/plugin/include/xcoff.h was added
  /sysroot-providers/virtual_x86_64-poky-linux-musl-g++ was removed
  /sysroot-providers/virtual_x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-c++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-cpp was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-g++ was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-13.2.0 was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ar was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-nm was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcc-ranlib was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-dump was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-gcov-tool was removed
  /usr/bin/x86_64-poky-linux-musl/x86_64-poky-linux-musl-lto-dump was removed
  /usr/libexec/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/cc1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/cc1plus was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/collect2 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/g++-mapper-server was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/fixincl was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/fixinc.sh was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/mkheaders was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/mkinstalldirs was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ld.gold was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcc1.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcp1plugin.so.0.0.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcp1plugin.so.0 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/libcp1plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/liblto_plugin.so was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/lto1 was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/lto-wrapper was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/gengtype was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/strip was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ar was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-as was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-cpp was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-gcc was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ld.bfd was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ld was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ld.gold was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-nm was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-objcopy was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-objdump was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-ranlib was removed
  /usr/libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/x86_64-poky-linux-musl-strip was removed
  /usr/lib/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins was removed
  /usr/lib/x86_64-poky-linux-musl/bfd-plugins/liblto_plugin.so was removed
  /usr/lib/x86_64-poky-linux-musl/gcc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/adxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/ammintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxbf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxcomplexintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxfp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/amxtileintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx5124fmapsintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx5124vnniwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bf16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bf16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bitalgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512bwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512cdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512dqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512erintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512fintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512fp16intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512fp16vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512ifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512ifmavlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512pfintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmi2vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vbmivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vlbwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vldqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vnnivlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vp2intersectintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vp2intersectvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vpopcntdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avx512vpopcntdqvlintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxifmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxneconvertintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxvnniint8intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/avxvnniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/bmi2intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/bmiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/bmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cet.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cldemoteintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/clflushoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/clwbintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/clzerointrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cmpccxaddintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cpuid.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/cross-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/emmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/enqcmdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/f16cintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include-fixed was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include-fixed/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/float.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/fma4intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/fmaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/fxsrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/gfniintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/hresetintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/ia32intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/immintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/iso646.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/keylockerintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/lwpintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/lzcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mm3dnow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mm_malloc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/movdirintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mwaitintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/mwaitxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/nmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/pconfigintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/pkuintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/pmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/popcntintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/prfchiintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/prfchwintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/quadmath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/quadmath_weak.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/raointintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/rdseedintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/rtmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/serializeintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/sgxintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/shaintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/smmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdalign.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdatomic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdbool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stddef.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdfix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdint-gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/stdnoreturn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/syslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/tbmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/tmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/tsxldtrkintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/uintrintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/unwind.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/vaesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/varargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/vpclmulqdqintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/waitpkgintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/wbnoinvdintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/wmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/x86gprintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/x86intrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xmmintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xopintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsavecintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsaveintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsaveoptintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xsavesintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/include/xtestintrin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/fixinc_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/include/limits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/include/README was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/macro_list was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/install-tools/mkheaders.conf was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/gtype.state was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ada was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ada/gcc-interface was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ada/gcc-interface/ada-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/addresses.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/align.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/alloc-pool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/all-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ansidecl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/array-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/asan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/attr-fnspec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/attribs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/auto-host.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/auto-profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/backend.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/basic-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/bb-reorder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/b-header-vars was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/bitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtin-attrs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtins.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/builtin-types.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/bversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/calls.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ccmp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-common.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-objc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-pragma.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-family/c-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfganal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgbuild.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgexpand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfg-flags.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfghooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgloopmanip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cfgrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cgraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cif-code.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/collect2-aix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/collect2.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/collect-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/color-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/common/config/i386/i386-cpuinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/conditions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/configargs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/elfos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/glibc-stdint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/gnu-user.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/att.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/biarch64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/gnu-user64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/gnu-user-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-isa.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/i386-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/linux64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/linux-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/stringop.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/unix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/x86-64.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/i386/x86-tune.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/initfini-array.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/linux-android.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/linux-protos.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/config/vxworks-dummy.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/convert.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/coretypes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/coroutine-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/coverage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/contracts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cp-trait.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cp-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cp-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/cxx-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/name-lookup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/operators.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cppbuiltin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cppdefault.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cpplib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cp/type-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/cselib.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ctfc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/c-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/d was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/data-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dbgcnt.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dbgcnt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ddg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/d/d-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/debug.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/defaults.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/df.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dfp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-client-data-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-color.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-event-id.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-metadata.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-spec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/diagnostic-url.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/digraph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dojump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dominance.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/domwalk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/double-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dump-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dumpfile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dwarf2asm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dwarf2ctf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/dwarf2out.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/edit-context.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/emit-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/errors.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/escaped_string.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/et-forest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/except.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/explow.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/expmed.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fibonacci_heap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/file-find.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/filenames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/file-prefix-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fixed-value.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/flag-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fold-const-call.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/fold-const.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/function-abi.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc-plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc-rich-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcc-symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcov-counter.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcov-io.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcse-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gcse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/generic-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gengtype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/genrtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gensupport.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ggc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ggc-internal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-array-bounds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-expr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-match.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-predicate-analysis.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-cache.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-edge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-fold.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-gori.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-infer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-path.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-range-trace.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-ssa-warn-access.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-ssa-warn-restrict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimple-walk.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimplify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gimplify-me.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/glimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gomp-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graphds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graph.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graphite.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/graphviz.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gsstruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gsyms.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gsyslimits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gtm-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/gtype-desc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hard-reg-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-map-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-set.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hashtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-table.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/highlev-plugin-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hosthooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hosthooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hw-doloop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/hwint.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ifcvt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/inchash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/incpath.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/input.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-addr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-attr-common.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-attr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-codes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-config.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-constants.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-flags.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-modes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-modes-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/insn-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/internal-fn.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/internal-fn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/intl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/int-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-fnsummary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-icf-gimple.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-icf.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-modref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-modref-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-param-manipulation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-predicate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-prop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-reference.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ipa-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ira.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ira-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/is-a.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/iterator-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/langhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/langhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lcm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/libiberty.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/limitx.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/limity.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/line-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/linux.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/loop-unroll.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lower-subreg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lra-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lto-compress.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lto-section-names.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/lto-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/m2 was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/m2/m2-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/machmode.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/machmode.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/make-unique.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/md5.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/memmodel.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/memory-block.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mem-stats.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mem-stats-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mode-classes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/mux-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/objc was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/objc/objc-tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/obstack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/obstack-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-expand.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-general.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-low.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-offload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/omp-simd-clone.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs-libfuncs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optabs-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optinfo-emit-json.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/optinfo.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/options.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opt-problem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opts-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opts-jobserver.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/opt-suggestions.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ordered-hash-map.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/output.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/passes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pass-instances.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pass_manager.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin-api.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/plugin-version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pointer-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/poly-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/poly-int-types.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/predict.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/predict.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/prefix.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/print-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/print-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/profile-count.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/profile.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/range-op.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/read-md.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/read-rtl-function.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/real.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/realmpfr.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/recog.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regcprop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/reg-notes.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regrename.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/regs.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/reload.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/resource.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtlanal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl-error.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtlhash.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtlhooks-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl-iter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtl-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/rtx-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/run-rtl-passes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/safe-ctype.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sanitizer.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sbitmap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sched-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/selftest-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/selftest.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/selftest-rtl.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sel-sched-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sel-sched.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sel-sched-ir.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sese.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/shortest-paths.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/shrink-wrap.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/signop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sparseset.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/spellcheck.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/spellcheck-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/splay-tree-utils.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sreal.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ssa-iterators.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/statistics.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/stmt.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/stor-layout.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/streamer-hooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/stringpool.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/substring-locations.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symbol-summary.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symtab-clones.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symtab.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/symtab-thunks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/sync-builtins.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/system.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-def.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-globals.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-hooks-macros.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/target-insns.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/targhooks.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/timevar.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/timevar.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tm_p.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tm-preds.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/toplev.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tracer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/trans-mem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-affine.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-cfgcleanup.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-cfg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-check.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-chrec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-core.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-data-ref.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-dfa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-diagnostic.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-dump.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-eh.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-hasher.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-hash-traits.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-if-conv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-inline.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-into-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-iterator.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-logical-location.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-nested.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-object-size.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-outof-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-parloops.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-pass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-phinodes.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-scalar-evolution.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-sra.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-address.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-alias-compare.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-alias.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-ccp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-coalesce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dce.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dom.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-dse.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-live.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-ivopts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-manip.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-loop-niter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-math-opts.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssanames.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-operands.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-propagate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-reassoc.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-sccvn.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-scopedtables.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-strlen.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-ter.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-threadedge.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-ssa-threadupdate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-stdarg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-streamer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/treestruct.def was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-switch-conversion.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-vectorizer.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tree-vrp.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tristate.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/tsystem.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/typeclass.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/typed-splay-tree.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/ubsan.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/valtrack.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-pointer-equiv.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-prof.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-query.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-range.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-range-pretty-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-range-storage.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/value-relation.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/varasm.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vec.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vec-perm-indices.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vector-builder.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/version.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vmsdbg.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vr-values.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/vtable-verify.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/wide-int-bitmask.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/wide-int.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/wide-int-print.h was removed
  /usr/lib/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/13.2.0/plugin/include/xcoff.h was removed

--===============5338195927350388867==--

