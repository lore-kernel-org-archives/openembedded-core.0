Received: from mail-pb0-f41.google.com ([209.85.160.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U7aFy-0007z3-PA
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Feb 2013 00:36:42 +0100
Received: by mail-pb0-f41.google.com with SMTP id um15so1894278pbc.14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 15:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=yzoJyTkabyZpDeSDk/J0jSqdtr5ZAjCQ/h2DAwhx318=;
	b=e2C27xRGw2p/L1KB2uOGvhhMYD585mYvp4JbItJe6UCtl5BVs/4yz/eNk8mvU5FUVQ
	eGrgAP+0AAwfM8UTuK91xaVhm5valD3KR5MVj13pabMhXGKp4UWa0ECUVPuhhY4qj5B+
	F0mWEC06C2tduviQPePnu284FzrEwFlgO4BXNofi2nc2fYreWJmXj0Jsf141vpwY24Wq
	omtuxr73Cbc8QCxpnYJiKbMBj7YhjyUDbxPDu5FmJB12h3VLbRDCGjZ2kwtDIK/AWSBK
	SMjBDn0E7FGEO3nJTTge91yXYG51D5DWf9lJMOgmqpKG6VoC2bL5FUf4h/Uc7avNa4Xt
	aQjQ==
X-Received: by 10.68.196.168 with SMTP id in8mr16031098pbc.61.1361229613738;
	Mon, 18 Feb 2013 15:20:13 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id eh5sm15792234pbc.44.2013.02.18.15.20.11
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 Feb 2013 15:20:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Feb 2013 00:20:11 +0100
Message-Id: <1361229611-32214-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] sanity: check_path_length: replace tab with 8 spaces
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
X-List-Received-Date: Mon, 18 Feb 2013 23:36:45 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 22a89ea..94c6ce3 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -226,7 +226,7 @@ def check_create_long_filename(filepath, pathname):
 
 def check_path_length(filepath, pathname, limit):
     if len(filepath) > limit:
-	return "The length of %s is longer than 410, this would cause unexpected errors, please use a shorter path.\n" % pathname
+        return "The length of %s is longer than 410, this would cause unexpected errors, please use a shorter path.\n" % pathname
     return ""
 
 def check_connectivity(d):
-- 
1.8.1.2



