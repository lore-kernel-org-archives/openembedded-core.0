Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay.synopsys.com [198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id 76651798D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 14:26:13 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id BB4A910C1BA9;
	Fri, 21 Sep 2018 07:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537539974; bh=P0BH2l34PLxhZWi9PCOby8SeFf3e9TtJwfXt3UT5ewY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EmJ3PL3pwaXf3KPsGn1H0XSCIKJkQSnrOMzwbacwaAITq+B90WwrqCH4I1BpEWn9V
	CyFskRu+nHwXt3DUZhxWacBU6YJ/06HxRWZPFbsVM53JWhYLOvK+tkaUG9ENL2D+4H
	qC8ISdyBLemo4P/6kec38zHw3DI3uOPIGKiDgkZ+OCwNAQIDiiTPnYpGkth8m+f9Us
	4bkdp4mal93q8qPCGsSjYlbFGHehS9ZtCKnnVm/Td2G61te0xd5+0gXOBRCPEr+2zb
	rtP5JxuS0Vtq75FpnSV529ivjwC5qT33x+78O7ixnA2V63tecWg+SFPTWal26gq83S
	zMg2Pn79qu4gw==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 5E5B35CCE;
	Fri, 21 Sep 2018 07:26:13 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Sep 2018 17:26:00 +0300
Message-Id: <20180921142608.36203-2-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180921142608.36203-1-abrodkin@synopsys.com>
References: <20180921142608.36203-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH v3 1/9] siteinfo: Define data for ARC
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
X-List-Received-Date: Fri, 21 Sep 2018 14:26:13 -0000

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---

No changes in v3.

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


