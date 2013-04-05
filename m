Received: from mail-wg0-f42.google.com ([74.125.82.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UO8zE-0003vk-BV
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Apr 2013 17:55:33 +0200
Received: by mail-wg0-f42.google.com with SMTP id k13so1893498wgh.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Apr 2013 08:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=wmrnqYSoIK7h/6qjAY/YeASGBjK3S/m+qOmR+ZuY5rM=;
	b=WluF1DqAMFLRxmqNQmFlQB5DxDo82MwDvMWcxCD6a7IkTTErAbjS8PshD+yXAplu7B
	vqppaPpYsRP/D37FzcT98Ua/ctDbqsxyeVQmcOLyLRZs6JdvROetNPZN8IIlH438c350
	AockYnOAlo6gM7j5VQf94niEuB9oCRKYoU8G1WW43mZSCx5iBk7TbIivEwBv32I5Wtax
	dFrszBPDN4nJTdRoDWQubRFBnrjAPIR3Tr2iLvbTFphAmL2LrkUbdtNz50TqZO+kvuDp
	yTcGWjY7uLb8Ohh34ila3hxXdq4w9hw9fGAQsgKTBXXTrEpDy8SQTwZjhcGwxRKWGN/z
	N9Xw==
X-Received: by 10.180.36.48 with SMTP id n16mr5220962wij.30.1365176298053;
	Fri, 05 Apr 2013 08:38:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id g4sm4950796wib.11.2013.04.05.08.38.16
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Apr 2013 08:38:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Apr 2013 16:35:30 +0100
Message-Id: <1365176132-17102-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1365176132-17102-1-git-send-email-ross.burton@intel.com>
References: <1365176132-17102-1-git-send-email-ross.burton@intel.com>
X-Gm-Message-State: ALoCoQl/NUTYKv2elE+SDmmM0kolJLpc9zdARDkX4+rTHgoOvVW6EodtyiNNHYja3I27vog21biv
Subject: [PATCH 2/4] connman_test.sh: show all processes when dumping ps
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Apr 2013 15:55:35 -0000

We know the grep failed because the error case is being executed, so don't do
the grep again when attempting to help diagnose the problem, as seeing the full
process list might be useful.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/qemuimage-tests/tools/connman_test.sh |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/qemuimage-tests/tools/connman_test.sh b/scripts/qemuimage-tests/tools/connman_test.sh
index 8ed8b8b..4c1e2f5 100644
--- a/scripts/qemuimage-tests/tools/connman_test.sh
+++ b/scripts/qemuimage-tests/tools/connman_test.sh
@@ -45,7 +45,7 @@ fi
 
 if [ $count -ne 1 ]; then
 	Target_Info "connmand has issue when running in background, Pls, check the output of ps"
-	${PS} | grep connmand
+	${PS}
 	exit 1
 fi
 
-- 
1.7.10.4



