Return-Path: <crg7475@mailbox.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id E23307E397
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 11:06:56 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id CB113A0194
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:06:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	references:in-reply-to:message-id:date:date:subject:subject:from
	:from:received; s=mail20150812; t=1558868808; bh=H0xf6Sb7wPwmYPQ
	oLp6Si0dYQAbn4FQRJsazUFQ2Kh0=; b=MVVTRYRte0MlfgqioazyxXLQVs+I7XV
	+sLB1FW6IUBPC0+PSgNgaYgxWllMM48wLsxolqvE/NG97ZQsWequyp1cC7IwEbzY
	bJzN3GT9VK/pEJizf2lIcfVG5ZEiLxb485ZoGr2g+3pzQHuxK8XNv3MUDQHrwuCY
	pV3fHT34b/gFRIeBNGzdzYbz3t3Z0ogtb9AJHO8L1ZZpA8qHp1dcqHEFgvwIK/gj
	QjIzKeoMKbXuId5Y19kph7Mc/cDAfjZj7JS1RcGL1sMOHCVeZ9mwVXH9KXX8rcm/
	rxSSdxnUqLEgGR1ifnA/olft46MHFdRy93pwWIrwfR0lmKucli24CnQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; 
	t=1558868817; h=from:from:sender:reply-to:subject:subject:date:date:
	message-id:message-id:to:to:cc:mime-version:content-type:
	content-transfer-encoding:in-reply-to:in-reply-to: references:references;
	bh=VE68cnz09IQLEcM00wrkKjyjxet2B6qpNRbPLhrGSC0=;
	b=pZyvAxTAsgAjHXkRnw0mV8exQIpLLl430ojmhYk8lzln435tsGc/DcklEUoRV8buNagtd+
	se5gRW092CCjPprRfM3nwYp+VvrJWwF5w4f/n3ha/+JT4+DnO+ihDp9ftrhNsF3W91Rr3K
	d3OwpaMgRgdUQe9q+NhiZbKiioWW2ZxiMaVW5g2Pqk86MJdhlOVvnjR5pgGEW+ern86L9/
	HaHlcpLbdqJkv49lAE1krKpF1MsPgK/RMiHajYmbcGP4W8jSQlv1kWBjTpGUfxylUR+osA
	uGbKwgll2JLhb8QKGUrFGvH9P8E545cILYntIFRkFyL0Kvc6rlAV6N84UFyTCQ==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
	[80.241.56.125]) (amavisd-new, port 10030) with ESMTP id qcKf_Yvprv73
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 May 2019 13:06:48 +0200 (CEST)
From: Carlos Rafael Giani <crg7475@mailbox.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 May 2019 13:06:39 +0200
Message-Id: <20190526110642.5341-8-crg7475@mailbox.org>
In-Reply-To: <20190526110642.5341-1-crg7475@mailbox.org>
References: <20190526110642.5341-1-crg7475@mailbox.org>
Subject: [PATCH 08/11] gstreamer1.0-vaapi: upgrade to version 1.16.0
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
X-List-Received-Date: Sun, 26 May 2019 11:06:57 -0000

Signed-off-by: Philippe Normand <philn@igalia.com>
Signed-off-by: Carlos Rafael Giani <crg7475@mailbox.org>
---
 .../0001-vaapsink-downgrade-to-marginal.patch                 | 4 ++--
 ...reamer1.0-vaapi_1.14.4.bb => gstreamer1.0-vaapi_1.16.0.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.14.4.bb => gstreamer1.0-vaapi_1.16.0.bb} (93%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch
index c861f3bed2..7945a923c9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi/0001-vaapsink-downgrade-to-marginal.patch
@@ -24,7 +24,7 @@ diff --git a/gst/vaapi/gstvaapi.c b/gst/vaapi/gstvaapi.c
 index 9a82454..4d94f2b 100644
 --- a/gst/vaapi/gstvaapi.c
 +++ b/gst/vaapi/gstvaapi.c
-@@ -210,7 +210,6 @@ plugin_init (GstPlugin * plugin)
+@@ -195,7 +195,6 @@ plugin_init (GstPlugin * plugin)
  {
    GstVaapiDisplay *display;
    GArray *decoders;
@@ -32,7 +32,7 @@ index 9a82454..4d94f2b 100644
  
    plugin_add_dependencies (plugin);
  
-@@ -235,10 +234,7 @@ plugin_init (GstPlugin * plugin)
+@@ -220,10 +219,7 @@ plugin_init (GstPlugin * plugin)
    gst_element_register (plugin, "vaapidecodebin",
        GST_RANK_PRIMARY + 2, GST_TYPE_VAAPI_DECODE_BIN);
  
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
similarity index 93%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
index 3896434104..4d7382a101 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.14.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.16.0.bb
@@ -13,8 +13,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.x
            file://0001-vaapsink-downgrade-to-marginal.patch \
            "
 
-SRC_URI[md5sum] = "2fae3442f5f23e7354a0c592bc7b9065"
-SRC_URI[sha256sum] = "ce18dbfe961c6a8d31270231686075586bf7a7df62b778c8e7f5ec148251d0a3"
+SRC_URI[md5sum] = "8c3f9ee3e47cbdb75a94f7183460b721"
+SRC_URI[sha256sum] = "4e7fce626ee0590dca74b5a8341d25bac76307945131a970b414fc5895f5171f"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-- 
2.17.1


