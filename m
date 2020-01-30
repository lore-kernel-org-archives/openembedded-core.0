Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE5D60207
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:31:56 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id dc19so3594033edb.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 04:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Mlb60JCVVjJNk1SxFDuWBRr0cIkFwp4LPZQRoK/ognA=;
	b=CyhyUAVs+noNZGAzrthct84L7BcDVupmzADgqDvxRITGCtnWSVrIbEXnmys/XW9TJH
	RDeBMksyto7Km0xuXynfdd1m3aOrbIa02hxweptNeGrDGEjN37n7j/rz1pPp0Eg9Qlfk
	wrTrOsC3iuWcNJg+FPKnMIuAdLzz2E+9iidIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Mlb60JCVVjJNk1SxFDuWBRr0cIkFwp4LPZQRoK/ognA=;
	b=HkdcfxySeK3PVvNEdZNuDaA7nd4UWUzULxuQy/xJxJZTMx5bOe8wr2tb8PUnSNAlWS
	2IX88ZKBL8NTx15J4tezDXe7z51GKkxunfAFWirDqj3PRfxhAQZlR8S5rVfLpE/wskwk
	2YJR/82eDy1vTAaAskvt3CKempOU+bDwD6+J1TdA/f0XqcelaCTBhIvompR3OjT792za
	G3/4Y0PZCkBDN8D1sJw/sepYFFOHjwUjpBanmRYAjeCskIAzAWeh6aUZZBSoZgXNREjC
	X8JoB4tf0o/8p7KDq9hfi1yAV5E6LhLCe+sOsd+tShQebP+ObQHg3ykI3KRUArfh/Xb+
	RNDw==
X-Gm-Message-State: APjAAAUrv+6g7D5zcune1TmbEkaN0QlOs+O77QwcgjFgUPjj6fxPi8dv
	l2TogYwWMDoOUcd5JJXc2kwouOwpqcg=
X-Google-Smtp-Source: APXvYqw9kecIy/Wn7iH1045x3B2ZQEBF87aeKnV89uBi82LjL0eUDittmZleVEypaUqa36rOzxehmA==
X-Received: by 2002:adf:fc0c:: with SMTP id i12mr1462031wrr.74.1580342476931; 
	Wed, 29 Jan 2020 16:01:16 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z3sm4931877wrs.94.2020.01.29.16.01.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 16:01:16 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jan 2020 00:01:15 +0000
Message-Id: <20200130000115.506-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] MEMORIAM: Add recognition for contributors no longer with us
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
X-List-Received-Date: Thu, 30 Jan 2020 12:31:56 -0000
Content-Transfer-Encoding: 8bit

Its sad to have this but as the project ages, also perhaps inevitable.
Besides their contributions, remember them here.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 MEMORIAM | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 MEMORIAM

diff --git a/MEMORIAM b/MEMORIAM
new file mode 100644
index 00000000000..0b3ce4670fc
--- /dev/null
+++ b/MEMORIAM
@@ -0,0 +1,5 @@
+Some project contributors who are sadly no longer with us:
+
+Greg Gilbert (treke) - Ahead of his time with licensing
+Thomas Wood (thos) - Creator of the original sato
+Scott Rifenbark (scottrif) - Our long standing techwriter whose words live on
-- 
2.20.1


