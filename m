Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 6253C77D17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 11:47:57 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id m21so6227422pfj.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 04:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PNgl+rQJCEgjQbPV0RIDZyc4+bWEYI30PLooZfR4hhU=;
	b=SClzsLb6Bh091X9MNbA/fHKLnUwA/W3m6tenZemcOBlzZyH4B7R7EerA+Co4iptRRw
	UGtDTdKvwQh+8ooOwRp9H20YSS+q3wzsdWSyAlCThlefBFuRKsIbn2Q1A/XYGvKRNP4F
	S0x0VKkRKTO/FcO56g8OepXGP+vcVVCxMLQtuDBh6waJaIdlodi/YKZbSIrGjQjJ96ln
	Wg0U/gt9uR069jDflN8hPR4rLEBdYOwoHWRy5h4LXeMTIIbq054YyjyVtNwvJuGkzUge
	bCZvV8kPiG+5nLJDDb9+v4rA5BvTMjpPeXxgXxgonP+nhnf4NF8eZOMhL5H/VXT1TDGv
	6/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PNgl+rQJCEgjQbPV0RIDZyc4+bWEYI30PLooZfR4hhU=;
	b=qxcBGS1gL5HucO8yNXu7u3LYl+ufHATCR6uaNjvs6Zg/BZQNvN04dhrzqATiRaSRwJ
	LTpMU4woM8oNDfSf9+MC7KGGvRMFYTS8zn3vdRsgFUTdvbCy6MAhAqeIEGL99xXLWJiq
	FV/I6FgxQ33e0nQP3qVAG8Fkxhd+MnbufbDiQZuS7yQPhEUnfopkeJ82wPJsxG710Zte
	d+yDGQezRJtOGWLIhauGPjKD+JokL3RP3gLeREXllu4Vkw5Kz3w5ptBpeVlaSrowW/gJ
	DJP+f3z2KXC9BInsfFSQDD3fwb8I1evoMJw6rMAVALFjAJUvtTcL07T0f9Z489yIgO/L
	LPHw==
X-Gm-Message-State: AIVw113WUnFPJxrTlzn5v40hXz7Q8PJVMrJRhV5hj8q0+g0p6/6y1dY7
	YdpUvr80pwa3+ERW
X-Received: by 10.98.152.77 with SMTP id q74mr7166632pfd.40.1501242479014;
	Fri, 28 Jul 2017 04:47:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	n11sm38723302pgr.76.2017.07.28.04.47.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jul 2017 04:47:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jul 2017 04:47:16 -0700
Message-Id: <20170728114716.41389-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [PATCH 3/3] re2c: Transfer recipe from meta-oe and upgrade to 0.16
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
X-List-Received-Date: Fri, 28 Jul 2017 11:47:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ninja needs it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/re2c/re2c_0.16.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta/recipes-support/re2c/re2c_0.16.bb

diff --git a/meta/recipes-support/re2c/re2c_0.16.bb b/meta/recipes-support/re2c/re2c_0.16.bb
new file mode 100644
index 0000000000..cd84082021
--- /dev/null
+++ b/meta/recipes-support/re2c/re2c_0.16.bb
@@ -0,0 +1,15 @@
+SUMMARY = "Tool for writing very fast and very flexible scanners"
+HOMEPAGE = "http://re2c.sourceforge.net/"
+AUTHOR = "Marcus Börger <helly@users.sourceforge.net>"
+SECTION = "devel"
+LICENSE = "PD"
+LIC_FILES_CHKSUM = "file://README;beginline=180;md5=822830a2204aef353f2c489f62e02089"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
+"
+SRC_URI[md5sum] = "3bf508fabd52ed7334647d0ccb956e8d"
+SRC_URI[sha256sum] = "48c12564297641cceb5ff05aead57f28118db6277f31e2262437feba89069e84"
+
+BBCLASSEXTEND = "native"
+
+inherit autotools
-- 
2.13.3


