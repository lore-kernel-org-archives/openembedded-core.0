Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8F8386BF81
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 15:33:17 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q57so3842246wes.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2013 08:33:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=HPHvlUoDPQql9pc8+1zHBykbDICdqIUhL7hzBvhcaZI=;
	b=GI0r4rdgZAOg9MgCNDdtyrMFtHmRCfz+7YAfkPT5s5ZlH63GpApCMwSZjwOgaxdh5I
	KcDPtdxU1QUHYeieRn15DL3P6XjGnVkV6CyUisLEAUH6sNnq1Xc74GveU2sQmhjwwLrq
	YwNwze9+9Ju+3IbCg1PTlrRMPxyMOq+1C33teqxXGkFvDvl9rwDoRBRGpIgvjwFMNUqf
	HqI0LuajvqDj9j9rOjZ2e6IDPH1krA8x1ogr8NHI+qL+3U3UEbA1fqhTqwOU4DnEpC+1
	H4iBKIR20FV7CNbFDUpsibqW9g6qrVPypUebHv/+5oylB5jUElZZu3daXb2aAilw40EN
	34fg==
X-Gm-Message-State: ALoCoQlLbtYfEGY5gtDFzxeeMZJB24K/DJKyppelJfyenIu1tkmDVtds6uF9vCh2ET93Nyd7thbJ
X-Received: by 10.180.80.71 with SMTP id p7mr14121664wix.48.1378135997965;
	Mon, 02 Sep 2013 08:33:17 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id li9sm18583509wic.4.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Sep 2013 08:33:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Sep 2013 16:33:10 +0100
Message-Id: <1378135990-7215-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH][V2] waf.bbclass: add waf build system class
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
X-List-Received-Date: Mon, 02 Sep 2013 15:33:17 -0000

Add a new build system class for waf.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/waf.bbclass |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta/classes/waf.bbclass

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
new file mode 100644
index 0000000..3a221e7
--- /dev/null
+++ b/meta/classes/waf.bbclass
@@ -0,0 +1,13 @@
+waf_do_configure() {
+	${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
+}
+
+waf_do_compile()  {
+	${S}/waf build ${PARALLEL_MAKE}
+}
+
+waf_do_install() {
+	${S}/waf install --destdir=${D}
+}
+
+EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
1.7.10.4


