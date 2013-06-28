Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id 29F796A4E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:04:26 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id um15so2748635pbc.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=AtRGgNfdrovjy0XhCuelSCLmX+N6CNQuoik750yh4As=;
	b=CqzPJAXvVt9hrqOkYQdti8buQdvwaUmpiZ9wZQLQOW8RUV7ZBX2XN5z8sVh2/EzPF6
	YQAFcDKx3oPLieEx3FPtC2bZU6aNRcMV++h8oEx5xn21OEQf6SC2I3c1lZy958HSk2z3
	slwuSbiYXGR8aXopF7hqFSyzM2apCEubiJZBOGYk7LskPb469yMAfjwSx6QqLvPGNGNA
	kvsqYSCTZs7H/7Eu5XFuw1SIA6x7Gavh8m2Iovwtn9htS6/Sf9IinMSREr6Utn3jkd1z
	ni4fpJf30AZpGBL2FnVq9K3TqYpjMcLUT+shxbAPSvXU1bLJQ5seIzbDgO0EP342lcQW
	CJPA==
X-Received: by 10.68.28.232 with SMTP id e8mr13515167pbh.94.1372457067525;
	Fri, 28 Jun 2013 15:04:27 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	re16sm10723745pac.16.2013.06.28.15.04.26 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:04:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 15:03:47 -0700
Message-Id: <6687ea1de146dbf33e5047f8f91f384eee9783c4.1372456294.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
References: <4da336aceedb08e21f23fed08fede84eec15ad7b.1372456294.git.raj.khem@gmail.com>
In-Reply-To: <cover.1372456294.git.raj.khem@gmail.com>
References: <cover.1372456294.git.raj.khem@gmail.com>
Subject: [PATCH 02/24] python3native.bbclass: Add python3 abstraction class
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
X-List-Received-Date: Fri, 28 Jun 2013 22:04:26 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/python3native.bbclass |    7 +++++++
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
1.7.9.5


