Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6FABB6CFE5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:00:06 +0000 (UTC)
Received: by mail-lb0-f182.google.com with SMTP id p9so1960188lbv.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 07:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=MA1ClQszPyCDJ5zAUvU4LkOV0XGQBgm5vkgjOBlPlkg=;
	b=BDtvJ68hbHOYfg8x6XUfGAnniUz4maY1YQOpKmze2fNhOdHO2JTN2m/oEqMhAumm1U
	bX4GMiUTin8j/Wk+z8ujsnNJuglpvN5Rd552oKRaRIiwfptywNViM9P7t5zm9kYTx4tR
	FKh5hUwj4l9Q5agt26IwVfsJDtuHO7BhNkMTCror3JMGEejiTCy1U17r3IMBuEqXrRy8
	ZOjxNpVOHGOJcVTF19BDDQhOGPfKMvyPzPwLVptMaQ9H8Wo+Oow+kNOBzLWfXYiM0KS0
	1g4iPD7TUPCsT7crBISH5XyhDBsdcvtgib/wGXPjKe4LHaQ2tmKhTsCoDRrQJg1SH3gu
	LSCQ==
X-Received: by 10.152.9.36 with SMTP id w4mr2449108laa.34.1382018407735;
	Thu, 17 Oct 2013 07:00:07 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id
	ua4sm54977354lbb.17.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 07:00:06 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 01A474002F4; Thu, 17 Oct 2013 15:59:56 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 15:59:36 +0200
Message-Id: <1382018386-25389-2-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 01/11] popt: Add nativesdk in BBCLASSEXTEND
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
 meta/recipes-support/popt/popt_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
index aa4e379..32110f2 100644
--- a/meta/recipes-support/popt/popt_1.16.bb
+++ b/meta/recipes-support/popt/popt_1.16.bb
@@ -17,4 +17,4 @@ SRC_URI[sha256sum] = "e728ed296fe9f069a0e005003c3d6b2dde3d9cad453422a10d6558616d
 
 inherit autotools gettext
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.8.3.2


