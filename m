Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 75F9B6CF14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:00:07 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id w7so1907889lbi.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 07:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=IqcTZCMkBzA/PEz/2FGjDlMVE9sp8sYwrtKA6OHSPA8=;
	b=d4d0SrY8IA7qscoZnXMGVFUNzwNDG6B/fyebsf78NDZaXk6CItv0kltULq/w9xcB3R
	YfjmUBsDTKZ5X5VrJvZWU8JL1Gt1MUzPW48d1h6Cq7sU7Q4Ar0S5fKtqAgnf+Kr/bQty
	fMwebQ6jDXn6pbB7jvV46kshcmtV2ABFYiWLa+1/xD2bpM5j466nfszaDjPPaitp4sM8
	yYor9ZtyT8E6Xz6/8Sh8ZKPpNOmrDGakKhzbW4g4XIpAA/upn9HP/kxeDKZFM2Va433c
	iZA8OH+oSw6+ceasivgAtMXqJRIsOlwXaNZLNY38fdehsrw/EYNs+0HFDwnrqwmUJ+wC
	QdKw==
X-Received: by 10.112.168.170 with SMTP id zx10mr7453313lbb.0.1382018408490;
	Thu, 17 Oct 2013 07:00:08 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id b6sm74835988lae.0.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 07:00:07 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 1CC14400F86; Thu, 17 Oct 2013 15:59:57 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 15:59:43 +0200
Message-Id: <1382018386-25389-9-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 08/11] ossp-uuid: Add nativesdk in BBCLASSEXTEND
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
X-List-Received-Date: Thu, 17 Oct 2013 14:00:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
index b6304f0..4bc151f 100644
--- a/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
+++ b/meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb
@@ -55,4 +55,4 @@ FILES_uuid = "${bindir}/uuid"
 FILES_${PN} = "${libdir}/libossp-uuid.so.16*"
 FILES_${PN}-dev += "${bindir}/uuid-config"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


