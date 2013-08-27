Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3E62D6BBBE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:15:59 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so5133016pbb.33
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=YVfGOn9fQ/JsY2WqMDAqhsDD+5FyVEWP1AuSk0r4e9w=;
	b=nbnoIUNRGXAkzTSpY/nleQcAOUcbLUOyE4ewWHptVDfkOXfO3JFWiPtkajq5S5ngzM
	hY4CGdINNmb8fngZjO3Fw91MzpRI0LRWz6/WVcjVIDOGEcuuQAUL0rAuEs56USOP9rs7
	e020WIOtvYPyYFGopYu9c+IGAIFj2nT7cw+wIT5UbPNsSHocIxKaNOIk0kBDPS2h1Ed2
	YUNHCNKaPWssyfg5JC9/IEQyFCnUVrtX/ASCA/BPmN6lK7TS0LyldOXMNSX2YjUcOukO
	asrA1wreKk08Sg+cUvxVWvn9OUcRWGMT0N1YbWvROwekC5LusubOg3/4SjmGeOOoqLhj
	/4eQ==
X-Received: by 10.66.192.132 with SMTP id hg4mr22129079pac.84.1377623760321;
	Tue, 27 Aug 2013 10:16:00 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:15:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:02 -0700
Message-Id: <aca2d57ebb40b10dd3366a1af2ec2a8422e1d0e0.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 03/20] python3native.bbclass: Add python3 abstraction class
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
X-List-Received-Date: Tue, 27 Aug 2013 17:15:59 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/python3native.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta/classes/python3native.bbclass

diff --git a/meta/classes/python3native.bbclass b/meta/classes/python3native.bbclass
new file mode 100644
index 0000000..f86374f
--- /dev/null
+++ b/meta/classes/python3native.bbclass
@@ -0,0 +1,7 @@
+PYTHON_BASEVERSION = "3.3"
+
+inherit python-dir
+
+PYTHON="${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}"
+EXTRANATIVEPATH += "${PYTHON_PN}-native"
+DEPENDS += " ${PYTHON_PN}-native "
-- 
1.8.3.4


