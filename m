Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id D3FB06BF66
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 15:32:13 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id y10so3608276wgg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Sep 2013 08:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=fORdSPrVljuRwTVlL0eU7dQtWCVd+MHtmECXMvc/GDo=;
	b=dP4ooOEUlIy0Hwb4e3mdMfsA85e83WVLFUeqfj5OrId7csCpLPus4TuwMRahIv1TQc
	MXTxJfKIaRdYNMcI5rC3fu694Ih+rtGQNmLPXWCk7k622C2/IliuLDxdWgGJZAobohCV
	7F3khKr8vq9MtNRdWFI38RFhUopYOzYAOrKeEV7os9Sr6e73HcOa6zcxNXrq08Y5jy6R
	r8h/rxf/1f9dQF4nzsyO1Jd1JXjC8z2+cqhiSTWFnh/HMR4QavIM9SB4cdESgHFCitfp
	TTpKVrAPrGzq2OQHbdbbDOChm/bPfn2FB+PP+8QpxCqtKUqqzXERWuDAjVOfYVGyKdkO
	p3oQ==
X-Gm-Message-State: ALoCoQnCLdcrFAcu0UILR29VjVWPg5/pt5xF+J3kVAISpbTfuJRhD5mJje7x34BBceiWXc0WeTqN
X-Received: by 10.194.170.133 with SMTP id am5mr6017408wjc.42.1378135933906;
	Mon, 02 Sep 2013 08:32:13 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	eb3sm18983655wic.10.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 02 Sep 2013 08:32:13 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Sep 2013 16:32:07 +0100
Message-Id: <1378135927-6796-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] waf.bbclass: add waf build system class
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
X-List-Received-Date: Mon, 02 Sep 2013 15:32:14 -0000

Add a new build system class for waf.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/waf.bbclass |   15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/classes/waf.bbclass

diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
new file mode 100644
index 0000000..c17ae08
--- /dev/null
+++ b/meta/classes/waf.bbclass
@@ -0,0 +1,15 @@
+EXTRA_OEMAKE ?= ""
+
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


