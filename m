Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id B0DC060167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 18:05:13 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id m14so1389423wev.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 10:05:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=zugck3sI3s8uHJI0bbIZNFIFTbRMv9p7eriiSjdp7iA=;
	b=OXnueMvuCjE/uPftC9Ed7dQuVlanHHZc+V5te9IftlDNKoticTIzgXEa+YIPb1QV7l
	H3skrBbzp/+G836t2kRSZqLO1CIu/cyvnXpzZE5kooEx1+2vCGGlkS09GzGlhe96nl4I
	svk6JN+fLAMCTl13XmfYuoaSV9wGNGn40REKPIpdt0WgFshgCfykpeQxh4jaMJZ5It6D
	9DlMCmwg+/ZaCYxqQ8ckYcOE2c4K5w7xOawbgD6QTupcnhxMKb6PHHQCn1K804yAglb2
	2RycBjEFn63Ep56Si+1IlmgiRX3eTm4EhI1/FYwkRAJVi4GXUrvWgblosZw94/lC39aJ
	U+YQ==
X-Gm-Message-State: ALoCoQmqkpLGzE2HPHAkiT4Zd86rrn++fUNST3tGRvevGnEbzROvZ/KUQUHGKFx+JmfBeDFz8B8u
X-Received: by 10.180.88.165 with SMTP id bh5mr109045242wib.77.1419962713970; 
	Tue, 30 Dec 2014 10:05:13 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	hl1sm28854285wjc.18.2014.12.30.10.05.12
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 10:05:13 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 18:04:02 +0000
Message-Id: <1419962645-26989-4-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
References: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 4/7] gstreamer1.0-plugins-good: upgrade to 1.4.5
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
X-List-Received-Date: Tue, 30 Dec 2014 18:05:18 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...-plugins-good_1.4.1.bb => gstreamer1.0-plugins-good_1.4.5.bb} |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.4.1.bb => gstreamer1.0-plugins-good_1.4.5.bb} (79%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bb
similarity index 79%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bb
index 05798cf..943ab60 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.4.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 SRC_URI += "file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
             file://decrease_asteriskh263_rank.patch \
 "
-SRC_URI[md5sum] = "eb3a3296b2f6009def1f5a09590ce767"
-SRC_URI[sha256sum] = "8559d4270065b30ed5c49b826e1b7a3a2bd5ee9a340ae745a2ae3f9718e4c637"
-S = "${WORKDIR}/gst-plugins-good-${PV}"
+SRC_URI[md5sum] = "eaf1a6daf73749bc423feac301d60038"
+SRC_URI[sha256sum] = "79b1b5f3f7bcaa8a615202eb5e176121eeb8336960f70687e536ad78dbc7e641"
 
+S = "${WORKDIR}/gst-plugins-good-${PV}"
-- 
1.7.10.4


