Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id C3C1160634
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 13:41:05 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id r21so3892145edq.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 05:41:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Mlb60JCVVjJNk1SxFDuWBRr0cIkFwp4LPZQRoK/ognA=;
	b=VmqEIYvdpmXh3KCPPY+vnidYP9N5iP1pk3/EODPeQhuXkXOmlXr7j8XtvCeaG9CUxg
	GMipy+O5mczWetjrqgLVSIqHu1SIqTOygakj34JLi3CqG5AoQRmzNQR1e+offJOO/FY/
	SkvANn4Qb8ev5Kdir11WMAjhp9hJen5HED8tg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Mlb60JCVVjJNk1SxFDuWBRr0cIkFwp4LPZQRoK/ognA=;
	b=JNm9c2ZeWG6mk1hjpqqy3nUgtlXStrvIIIWAFNgZiLXtCJxlyvglt5j8fXRGdtvEHS
	QQV8RxILNxg9WnHQOCTLU4zeVAy0RPlisKDjVBf+4BIAgSRieZHqkizltVQ8C5B/we1m
	mgQZtVzIfokNz9ei91MgR6YTRMwDxQnbrZcoM5QirrXeZgiOxxkpjiTLZXkTbiD8jxg5
	8jMaZz+jUDHYjSqlaEWSllodLjWFXvo37WofFDWQxwKD/GzdHRDuJE4lWlX/U7tD8SJw
	BKvXlVZb5NPpVq5YHU94nQM5U47+E1Kb2DAjrzq5hQXtMqUe2axbYX/W2Zooj+eWWEVC
	rkWA==
X-Gm-Message-State: APjAAAWIt9KKBXd9x5qDQMpP+Wz9gEewqVxNNXljUy+FE7K1wFJLzyg5
	YysIf+/k5GPJNDO6Plgul7TUk9RAs/4=
X-Google-Smtp-Source: APXvYqyrQjGZOLOV6IcA6gsSYmbekZ6PJVa/zL9xzIRlpc5V7zG2/f7oyJa5lXgzpFpEfjNpdfgsJg==
X-Received: by 2002:adf:f382:: with SMTP id m2mr4243731wro.163.1580376085171; 
	Thu, 30 Jan 2020 01:21:25 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z19sm5341732wmi.35.2020.01.30.01.21.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 30 Jan 2020 01:21:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jan 2020 09:21:23 +0000
Message-Id: <20200130092123.8400-1-richard.purdie@linuxfoundation.org>
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:12 -0000
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


