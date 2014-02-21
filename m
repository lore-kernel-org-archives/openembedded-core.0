Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9456E6F0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 13:57:01 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id e16so2367432lan.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 05:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=Yb7vj4dhu29MjtmxcZoqLBeqPEzgm3hsKTdcCFdvHkU=;
	b=b7ZMbglBULLO03ogAAvN95VfDfNGckC0fH0Od0kGRORBJUWjxm9zlJ4ihRVzJhC7TX
	Zeje+8wotTV/0PXTYJD2nW9h/V5Si8aNP6uK5X8aUP7J3GSEAkhs8sbjIMQO8MTmpsYd
	qta64GnZU6K9i8cQe/8OfrhlUcA2jLvIbT7QA+emwFa5X+RU3DJWheyZd+RhgajKQdir
	oY34csd6HbkZ9pnEJOBF2M/qBmf18z6d+l821bQGYrZ71AOwOpW9us5HjOB4/47z9kbp
	arXsqU54IAU7eEsQz5GqaepvSZb38WjtGc3fRrJB4HXPbWxLkzoiljxcx9Rya3tx0o5S
	S54Q==
X-Received: by 10.112.56.173 with SMTP id b13mr4156753lbq.77.1392991021571;
	Fri, 21 Feb 2014 05:57:01 -0800 (PST)
Received: from localhost (c-5eeaaaa4-74736162.cust.telenor.se.
	[94.234.170.164])
	by mx.google.com with ESMTPSA id cl5sm7754398lbb.14.2014.02.21.05.57.00
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 21 Feb 2014 05:57:00 -0800 (PST)
Received: by localhost (Postfix, from userid 1000)
	id 51F95B41181; Fri, 21 Feb 2014 14:56:58 +0100 (CET)
From: =?UTF-8?q?David=20Nystr=C3=B6m?= <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Feb 2014 14:56:57 +0100
Message-Id: <1392991017-3524-1-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] x264: SPE is not compatible with Altivec
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
X-List-Received-Date: Fri, 21 Feb 2014 13:57:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.c.nystrom@gmail.com>
---
 meta/recipes-multimedia/x264/x264_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/x264/x264_git.bb b/meta/recipes-multimedia/x264/x264_git.bb
index 5ebf885..782c26e 100644
--- a/meta/recipes-multimedia/x264/x264_git.bb
+++ b/meta/recipes-multimedia/x264/x264_git.bb
@@ -23,6 +23,7 @@ inherit lib_package pkgconfig
 X264_DISABLE_ASM = ""
 X264_DISABLE_ASM_armv4 = "--disable-asm"
 X264_DISABLE_ASM_armv5 = "--disable-asm"
+X264_DISABLE_ASM_e500v2 = "--disable-asm"
 
 EXTRA_OECONF = '--prefix=${prefix} \
                 --host=${HOST_SYS} \
-- 
1.8.3.2


