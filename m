Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id 6852E77070
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 19:00:01 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so57024351igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 12:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jpbwBRDegZqvaXja40GLSgfeR7IRQPx82JijRPh9uME=;
	b=fpLoHEhqc2oMCyR/4B+HiAv3+bgMuH+3HQ74h1gXe9M9mZ/6B5Jed8xCLssGN6vcsD
	bt3yosBMIB68BxmxggsfeB+/o9uyJ54qp+EnmvOLuECvkiRLmZFjuFUkB+AE2S1XDU7T
	pUswic6rNfRX/pk4Y9hFWRoqcnvnGx+CccLPzvrc7CW6SInK2LOHYchJesnUGw7fd6Ph
	Ncy9Lns36ERO/t1CIUYwIEpAHvtMBcpD4SYPXHDbJbgOkxHrlLvrG7jeHag6xfRSTRpb
	WLy7Wbd3zfiwQVnbTjId5TL8MtNBZg0y1sNkfA/CaoJYWH3N13rCDLiBmHLMQa14iza+
	gRAQ==
X-Received: by 10.50.82.73 with SMTP id g9mr18826636igy.67.1445281202329;
	Mon, 19 Oct 2015 12:00:02 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	ot2sm8240489igb.17.2015.10.19.12.00.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 19 Oct 2015 12:00:01 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 11:59:37 -0700
Message-Id: <1445281177-3309-6-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
References: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/5] tune-corei7.inc: update comments regarding Silvermont support
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
X-List-Received-Date: Mon, 19 Oct 2015 19:00:02 -0000

Although still compatible, tune-corei7.inc is no longer the recommended
way to tune for Silvermont (which now has its own dedicated .inc file).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/machine/include/tune-corei7.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/tune-corei7.inc b/meta/conf/machine/include/tune-corei7.inc
index bea652f..13da46b 100644
--- a/meta/conf/machine/include/tune-corei7.inc
+++ b/meta/conf/machine/include/tune-corei7.inc
@@ -3,8 +3,8 @@
 #     Intel Core i7 CPU with 64-bit extensions, MMX, SSE, SSE2, SSE3, SSSE3, SSE4.1
 #     and SSE4.2 instruction set support.
 #
-# This tune is recommended for Intel Nehalem and Silvermont (e.g. Bay Trail) CPUs
-# (and beyond).
+# This tune is recommended for Intel Nehalem CPUs and beyond.
+# It is also compatible with second generation Silvermont Intel Atom CPUs.
 #
 DEFAULTTUNE ?= "corei7-64"
 
-- 
1.9.1


