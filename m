Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 269777BFBA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 11:47:59 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id a62so8571220wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 03:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=0Wid2TwalxMAX9ZG3ZRr4egayG7h7aar/eet8C7r30I=;
	b=aivlbstnnprGvXafCr62Mzau2PCNHhh7rmofPUuAuRYCcgckKEpCNf6VymCRNREYJ7
	ATMpACYH8J2hfewrgM9mRE+zvlou9WImfcPXG5vWaOn0DpThChGavwXE0Cji5E4SoLMX
	VBc8sPJqvgYcVKPuL7kRwZQEKtQTvTjb3q2Uc3mVaQFJKrnZfFSQCAhh9mj/JCketbVV
	poJpPGhO95ZtsCUmbYjjL5AEiBejk8oTfT4C6Hvh8FHJTsn9cDQEVMx2WrOXf/oikV1G
	WnAMo0uKj3wX4PBcPq+t13tneJkpQUA9YdChB/fUt8GtMOp6sjnOCWCSG/pAeTZREP3s
	Q4ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=0Wid2TwalxMAX9ZG3ZRr4egayG7h7aar/eet8C7r30I=;
	b=ZlfcrJdfpXbw8mt/TZAFeItVEZjnhOrl48VW28YLqjAdI0HFIYhjW/Kt6NwbFCfrn4
	MPfqIryMQtojbcxmgyucTYi4Z4CW4Pgp9aed4lv8L/7VcxO+YlUu6Ef0IUflmotGB62Q
	63Utb9cG/KhBrPWW9g5/Dwf4whml+0ZU+k9B7rxNaoMQhJrCjCaUjOUwPl8KMUnx6AS8
	S9qt/SvUb4AS+0x23ubnLlge5jTgzJ6pLpGH4+LDj5y5BMyTIvq21aaEF6DBwZY/lfo1
	c9c8B/zsZHI6odhyHu1oGMqgFO/NmCZV68RQ/YtPNtEO/M0JavYEph5PD/eyPuOmpdG2
	aZ+w==
X-Gm-Message-State: AJcUukdycyOOR0QX7plFgBTfaXCAjug6Krdq5RjxoDL1MiuGrbW/5Tss
	A5pnBAh61duCbtCagAKvRlR44dhxRHI=
X-Google-Smtp-Source: ALg8bN7PI+NdmIWS4vCq/vv01WAZzxogQcJG8ZoV9lJjrVP1lup9k2Vs3dXuXCyPyOAeWYzhFgPyYw==
X-Received: by 2002:a1c:a401:: with SMTP id n1mr12126416wme.101.1547466480362; 
	Mon, 14 Jan 2019 03:48:00 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	b12sm13590015wmj.3.2019.01.14.03.47.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 03:47:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 11:47:57 +0000
Message-Id: <20190114114757.5293-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] strace: add lost Upstream-Status
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
X-List-Received-Date: Mon, 14 Jan 2019 11:48:00 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch b/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
index b17dcb1d466..becee79d1a2 100644
--- a/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
+++ b/meta/recipes-devtools/strace/strace/0001-tests-sigaction-Check-for-mips-and-alpha-before-usin.patch
@@ -12,6 +12,7 @@ Fixes
 | ../../strace-4.18/tests/sigaction.c:177:36: error: 'struct_set_sa {aka struct set_sa}' has no member named 'restorer'
 |  # define SA_RESTORER_ARGS , new_act->restorer
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 ---
-- 
2.11.0


