Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id DFE116CFF2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 14:00:06 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id y6so1946431lbh.34
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 07:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=Wosb+R5OHOAqtqp43pmGNVUcqPmc+t+raFKtYPm/wJY=;
	b=xq+HuxNUXoDZHvAWLCRvmhZW3IsV2m/ycPlvmT8dN4uBDmPY1+8Huybci9I586FYmh
	6j3Te6PyexrPZNIf74yVVKF7i2J2uwctwXV+YUicV/effTm1wDO5e6rKNYIL4bdD0co9
	1oNOpK+HzJTB2bE4YywYG/38OHmQfpkbTK6DSvDCKSQTqA6zhOWtF99rmHgGSbrX6XBr
	JK3ayrMj0Kvdu7/q3yu7OO20PTjjZEq6KOD3PLTi8mvas1W0LsGVnCwpeKfVJ4MZExxI
	ajboxoQ8Ndcg155W0j/tsVemOJAFqWyZDWFCPlq6qaGvoG0Y88aocxC/y5M9pa98VWQA
	CH3g==
X-Received: by 10.152.20.1 with SMTP id j1mr103289lae.59.1382018408082;
	Thu, 17 Oct 2013 07:00:08 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id vo1sm55002525lbb.1.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Oct 2013 07:00:07 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 10231400F85; Thu, 17 Oct 2013 15:59:57 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Oct 2013 15:59:40 +0200
Message-Id: <1382018386-25389-6-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
References: <1382018386-25389-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 05/11] acl: Add nativesdk in BBCLASSEXTEND
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
 meta/recipes-support/attr/acl_2.2.51.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/attr/acl_2.2.51.bb b/meta/recipes-support/attr/acl_2.2.51.bb
index 1c40b00..dbe84bd 100644
--- a/meta/recipes-support/attr/acl_2.2.51.bb
+++ b/meta/recipes-support/attr/acl_2.2.51.bb
@@ -4,3 +4,5 @@ PR = "r3"
 
 SRC_URI[md5sum] = "3fc0ce99dc5253bdcce4c9cd437bc267"
 SRC_URI[sha256sum] = "06854521cf5d396801af7e54b9636680edf8064355e51c07657ec7442a185225"
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
1.8.3.2


