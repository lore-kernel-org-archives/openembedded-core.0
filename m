Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 3F8347987F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 20:42:45 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost3.synopsys.com [10.12.238.238])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 494C410C07A6;
	Thu, 20 Sep 2018 13:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537476166; bh=Fc1zAg3tl7GzIfAhpiscKPmgY5qDfKaq3tKG5U8xRcY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jGb6dZHNRXJ3Trlaz3XNpMKhcEfjMZBDrR63nzUX5Fvi+CTvPgMzew4byro+58tJb
	TxL7S//n9ipHf7EiQr9hxHkeLfRo28t2NmrvRBtuHhpHb4IdATOxAiYqf5XMiIT+90
	/C3QA1HsClwwJdJ3bjk8MZiQiBUvnx1UHXgyJ6QOz9HsYcjWgJJ/VaecReVZ15BfeB
	IeY0I2FrXI+tQj6fSL3AI9QV7hCPLSCFlZgJQvMsRMF9ymuBGBzLlh/0PVHQRDm4kH
	cGTpN7gtqrkCrYi7In9BCTM1GGEnV+5rrrTCXpoxHD1nfhezlXM+UM+FvZioJxRrWC
	Qt0SmfH0sRsNg==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 098073A48;
	Thu, 20 Sep 2018 13:42:44 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2018 23:42:24 +0300
Message-Id: <20180920204232.10583-2-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180920204232.10583-1-abrodkin@synopsys.com>
References: <20180920204232.10583-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v2 1/9] siteinfo: Define data for ARC
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
X-List-Received-Date: Thu, 20 Sep 2018 20:42:45 -0000

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

Changes v1 -> v2:
 * Merged changes in meta/classes/siteinfo.bbclass &
   meta/site/arc-common

 meta/classes/siteinfo.bbclass |  2 ++
 meta/site/arc-common          | 11 +++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 meta/site/arc-common

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 86bb853be2..dccf122b12 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -20,6 +20,8 @@ def siteinfo_data(d):
         "allarch": "endian-little bit-32", # bogus, but better than special-casing the checks below for allarch
         "aarch64": "endian-little bit-64 arm-common arm-64",
         "aarch64_be": "endian-big bit-64 arm-common arm-64",
+        "arc": "endian-little bit-32 arc-common",
+        "arceb": "endian-big bit-32 arc-common",
         "arm": "endian-little bit-32 arm-common arm-32",
         "armeb": "endian-big bit-32 arm-common arm-32",
         "avr32": "endian-big bit-32 avr32-common",
diff --git a/meta/site/arc-common b/meta/site/arc-common
new file mode 100644
index 0000000000..d3c721a8bb
--- /dev/null
+++ b/meta/site/arc-common
@@ -0,0 +1,11 @@
+# general
+ac_cv_alignof_guint32=4
+ac_cv_alignof_guint64=4
+ac_cv_alignof_unsigned_long=4
+
+# glib-2.0
+glib_cv_stack_grows=${glib_cv_stack_grows=no}
+glib_cv_uscore=${glib_cv_uscore=no}
+
+# startup-notification
+lf_cv_sane_realloc=${lf_cv_sane_realloc=yes}
-- 
2.16.2


