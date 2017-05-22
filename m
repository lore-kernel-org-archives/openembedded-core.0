Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 07ADD77F6B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 05:01:03 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id m17so70263403pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 May 2017 22:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=FngdPK0Yo7KYkFahpDgpoYN97V0YIbTgO2RaYhYkIT8=;
	b=g/4k4Jk4f2LptHFo5HMRsi8+q2Qnqoa8cFoQsVXzFCwuFoxSCuyUQrS2JeaXSr/oZ1
	+KMgyvrG9vNnHFPXR0/FpgG+aS/1OFDh2SJ8t193LzLs2c2hWLuLbBUed6v30oITY+d7
	ba0wBjLIN+ILlA/qY7/bdiZV/bhmDChxW2/iw8fzNVn+e21HIQypIbPGHQkWxAisz94U
	XlX1/Haniv34woxHZ1/vgoIqxDd2zLF9DKvyYP2KT5AQrsv9c6erXsOPiemxvWIJZPyR
	QNBdPOeLcr+yyxOCqZBVQjqB2Lp7x0GXC3s67FMVxvzd/h6iDtAxLGTtastk/6okHWZ0
	TSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=FngdPK0Yo7KYkFahpDgpoYN97V0YIbTgO2RaYhYkIT8=;
	b=ATRDWyKtUOfLcVswR9vDJz+RxGrioPIv8mg37TcjDfP1V4xvp2FFd2RKJAgkx/kkRX
	LocynvJuMg1/6myH5tphAYPO5lhJl1j3KHiXir2HDFUkOaW+CV43Ox9XEQXNsm09SHx5
	LxFJrbZD6jQk70Jvurvw/bZ+SS3dOGBQo78pyFkCNaIrIZ/zqzvoUPHjGGj5fITCXp5j
	lPZR5py8/DKrTBjD9WO3FI4n8FIpQyH6G3Hm3atAjk3o4IU5O8RG7/WuM6I0JBh2oLtY
	yLXR240DJw4hI0i/hjvk7FiI1I+qlJyc8Z4G96/+yQ3ONw3NLSQU017mSYAJHMBHg6N1
	oNMg==
X-Gm-Message-State: AODbwcDNKZdf9aYTwKxt0P1ANVgvNyq6PHnhKYKap3e0XcW7NArTXwRz
	E+yT8kcNy2psPveH
X-Received: by 10.98.138.150 with SMTP id o22mr23195989pfk.120.1495429264724; 
	Sun, 21 May 2017 22:01:04 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::63fb])
	by smtp.gmail.com with ESMTPSA id
	t13sm28839596pfa.126.2017.05.21.22.01.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 May 2017 22:01:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 May 2017 22:00:33 -0700
Message-Id: <20170522050042.42403-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20170522050042.42403-1-raj.khem@gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
Subject: [PATCH 06/15] libgcrypt: Do not restrict to ARM ISA
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
X-List-Received-Date: Mon, 22 May 2017 05:01:04 -0000

This works ok with thumb2 as well now a days
It was added in 2006
http://git.openembedded.org/openembedded/commit/?id=037b00e3d629962e8d2bc4fcc944c9ecf9a240be

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libgcrypt/libgcrypt.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt.inc b/meta/recipes-support/libgcrypt/libgcrypt.inc
index 84c1cc018b..3c7e89aa92 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt.inc
+++ b/meta/recipes-support/libgcrypt/libgcrypt.inc
@@ -47,6 +47,4 @@ PACKAGES =+ "dumpsexp-dev"
 FILES_${PN}-dev += "${bindir}/hmac256"
 FILES_dumpsexp-dev += "${bindir}/dumpsexp"
 
-ARM_INSTRUCTION_SET = "arm"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
2.13.0


