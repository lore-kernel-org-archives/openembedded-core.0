Return-Path: <Alexey.Brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay4.synopsys.com [198.182.47.9])
	by mail.openembedded.org (Postfix) with ESMTP id E68A579664
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 21:35:20 +0000 (UTC)
Received: from mailhost.synopsys.com (mailhost1.synopsys.com [10.12.238.239])
	by smtprelay.synopsys.com (Postfix) with ESMTP id 80E4124E050D;
	Mon, 17 Sep 2018 14:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1537219797; bh=LlbnvlIojLb3BrDKmZPhkvLxIvn1xGTaWpsTC6vwLr0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I5bfSvDBKGyaOg8aM0kbXX7zBmaQy3wTj8C+74xua4+XB9p1zBHKXZwoDxq2uGKPW
	WvfIWc7t4Qr+xnKb4SNlS9XLgc7TQ0minUgt37njvsTf0t17erY/h4Oa8pqffmii7L
	jcvkDvED2q+mt47sfTvXJgNI6wh1uPUrNMgS9mjvumtyB//Cj8XtkzbiesecvByJ4q
	/Gffd3M5v0Y7ckEJCI/zyijeBoV64D2fsckPoLCPut7+gkkigo5vgr9rmzhku4RiIW
	72jJvuM5gt2+mlJ0wNAD5nUHHD3CuryhzY7DTfox5NsqxJhWKORGLRTksk5YgcZ9m6
	4nlBY13GCsTHg==
Received: from ru20arcgnu1.internal.synopsys.com
	(ru20arcgnu1.internal.synopsys.com [10.121.9.48])
	by mailhost.synopsys.com (Postfix) with ESMTP id 4140054DB;
	Mon, 17 Sep 2018 14:29:56 -0700 (PDT)
From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2018 00:29:35 +0300
Message-Id: <20180917212943.27237-3-abrodkin@synopsys.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180917212943.27237-1-abrodkin@synopsys.com>
References: <20180917212943.27237-1-abrodkin@synopsys.com>
Cc: linux-snps-arc@lists.infradead.org,
	Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: [PATCH 02/10] site: Add ARC linux
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
X-List-Received-Date: Mon, 17 Sep 2018 21:35:21 -0000

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
---
 meta/site/arc-linux | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/site/arc-linux

diff --git a/meta/site/arc-linux b/meta/site/arc-linux
new file mode 100644
index 0000000..d3c721a
--- /dev/null
+++ b/meta/site/arc-linux
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
1.8.3.1


