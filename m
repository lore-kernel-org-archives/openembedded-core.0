Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE7D7210C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 16:22:36 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id z10so3046241pdj.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 08:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=5rTc6yWSbPC70msz1XAEOTIRkP/TBmsoKfOpFLl4Po8=;
	b=vVrDEMxJ1PHqAMokV3sq4afLvsvrkhHONAx2k3+WXKzwePByuHtIj69THbbI5T/UqD
	KPpLxb+cpyqbv2ljqsigTEU/65yYGOeL3bAtAIMbOX+MLpp/DrR38MrfVNTDp3S6isuy
	cFlnqM3qdJHXO9AapVz3FdsqGjNRQxhzpfd9EG8PYzwWoOUTBX8fT7SQ0O6MUdY7ivL1
	eb3IhXk3Mspf6ehiyN9nQ6EmjzA3+QITTBjVawIzv1skxRqkyT9JpeKMJQpTulVJmkiq
	TBimuZJWJBjcOhmgWNf+lGTpJrQ2iBlX2drvqCRx+3lbloLmDH/Uis9EibscTXr549cb
	VPHA==
X-Received: by 10.70.59.65 with SMTP id x1mr53989823pdq.102.1417018957609;
	Wed, 26 Nov 2014 08:22:37 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id qn1sm4736673pdb.42.2014.11.26.08.22.35
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 26 Nov 2014 08:22:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 08:22:11 -0800
Message-Id: <10ec5b9f3a73f12b545c48f5c888b0db791278e1.1417018567.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
References: <2446d3e01b365793ce2886985212bf800d14846e.1417018567.git.akuster808@gmail.com>
In-Reply-To: <cover.1417018567.git.akuster808@gmail.com>
References: <cover.1417018567.git.akuster808@gmail.com>
Cc: Javier Viguera <javier.viguera@digi.com>
Subject: [PATCH 07/11] shadow-securetty: add ttyAM[0-3] serial ports
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
X-List-Received-Date: Wed, 26 Nov 2014 16:22:37 -0000

From: Javier Viguera <javier.viguera@digi.com>

Old version of the ARM AMBA serial port driver creates those device nodes.

(From OE-Core rev: fa17b9ea435f5c49e3bea56524152b21d915d464)

Signed-off-by: Javier Viguera <javier.viguera@digi.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-extended/shadow/files/securetty | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-extended/shadow/files/securetty b/meta/recipes-extended/shadow/files/securetty
index 7fecda1..ecc246f 100644
--- a/meta/recipes-extended/shadow/files/securetty
+++ b/meta/recipes-extended/shadow/files/securetty
@@ -9,6 +9,10 @@ ttyS2
 ttyS3
 
 # ARM AMBA SoCs
+ttyAM0
+ttyAM1
+ttyAM2
+ttyAM3
 ttyAMA0
 ttyAMA1
 ttyAMA2
-- 
1.9.1


