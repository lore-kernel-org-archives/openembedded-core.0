Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by mail.openembedded.org (Postfix) with ESMTP id B6B4061000
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:00:05 +0000 (UTC)
Received: by mail-lb0-f181.google.com with SMTP id x18so599016lbi.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 07:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=7ZDyAO9Df9sBf0qLeXkNUIoT/c7dp0jMQVs7FPrUCRY=;
	b=DGRI95p/QX29m5Ili2cGcTDyDS9fWIwbFX5Ht4I7CjQ41o1idI7swS8rT4PC0VloKg
	7DO+NaoU5t4antkQhN1sgriyFXXIRNCJ1KmZ3JTGY3nmqkLO4PEs/qcpoMmlwuiiUwRo
	mx9iSMz1ufzN2nTtprXl6BuZdje1HuQzuIXtT7Jf9VOYFbcSoxFXHRSjPWUE1wS/EjXg
	8KMnBM9HspZP1Pp0QNkiYVcuPuTYs/Rudp9paBMRZQC+3g/7vhaMaPB8pOQSM0hIfwbv
	Y3+3gYdb+Kam/Vyl6txjIJkD2+icUNIuBfXlcvWc69mh25UoPP060/1EWjAxNe2Qzy9O
	TflQ==
X-Received: by 10.112.168.3 with SMTP id zs3mr7583210lbb.2.1382018406699;
	Thu, 17 Oct 2013 07:00:06 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id vk8sm9291789lbb.0.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 07:00:06 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 0A926400F61; Thu, 17 Oct 2013 15:59:57 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 15:59:38 +0200
Message-Id: <1382018386-25389-4-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 03/11] beecrypt: Add nativesdk in BBCLASSEXTEND
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
X-List-Received-Date: Thu, 17 Oct 2013 14:00:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
index 7baf92e..0a8ff4b 100644
--- a/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
+++ b/meta/recipes-support/beecrypt/beecrypt_4.2.1.bb
@@ -33,4 +33,4 @@ FILES_${PN} = "${sysconfdir} ${libdir}/*.so.* ${libdir}/${BPN}/*.so.*"
 FILES_${PN}-dev += "${libdir}/${BPN}/*.so ${libdir}/${BPN}/*.la"
 FILES_${PN}-staticdev += "${libdir}/${BPN}/*.a"
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


