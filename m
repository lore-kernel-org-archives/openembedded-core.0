Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DD345771E3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 22:57:12 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id x125so4410683pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 14:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=pJ1RjnYMtrnjBrH8CGHbQy6OJ+BpFYIBN6gWdNKQBJ0=;
	b=yt38zdTZ8+xk03Yj6EAR0RG9vY4tb195iys/EHK4IutCtiplplynIP5DJ4qbU8mZyw
	9zj4vCi7r4azB+nHg12mtvr5GUNeAMqg0+NOrX6u36kKdXBV9o14UhRJeKS4/bhrf52+
	3+sUHPmAPLF/G18EBnuxzDqbgdObl+Z44qptAHHc8s2pIu19+vgqoW2+A32lSWnA5RW5
	LXjLk77EmX+zISDWa9/TMvzVGO543JPI4h03mfy4aAcT7cm3RXSvSuneXAvDa+iUsv/A
	kXI37//zAqn+gBOyq652NxhwoGp10yNroMLOF4pKBI/KG2r86BI8+YEc2U+b3V6fQppS
	ddlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=pJ1RjnYMtrnjBrH8CGHbQy6OJ+BpFYIBN6gWdNKQBJ0=;
	b=Rfjm7QdbcI5gsS2SsOSFknm/m9j68YYHuPcZZUZ/OJ9ucC+5XSsbSkO2vTh5hDWNIg
	9DbOGFFXVxIV2diZ2U0GrbB59D3W6iLtrRnjAfwOgCN5bYVIST9bwnyM1+F2omYRdRJK
	AkpZpGLLbFmS8FrGU4J8WB6aIYrmHW+ED8SyUZ2iOzk0iPhhFfz/A95byylPCY0K5Acg
	24lIAxHDGnoybvPOfI73i3OMYi5hduItuYutkB8rtTB8N1tC0G8VrSLgP5ETKzl+IZ7x
	FXyzo7HUcDsN0vkVDTlTtiszycKJwIQdQ4MDJJev8fCKcmO3X6daky8OK7KSy18HSTSY
	cGAg==
X-Gm-Message-State: AG10YOQk0udDEhLZvbSFxnF/hIIgvYVDUvG3kRDTYlM8vFL9qXGm1nuxmLc7MszcPFBuGw==
X-Received: by 10.98.72.135 with SMTP id q7mr17121072pfi.151.1454108233844;
	Fri, 29 Jan 2016 14:57:13 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	l21sm22557869pfi.63.2016.01.29.14.57.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 14:57:12 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 29 Jan 2016 14:57:06 -0800
Message-Id: <cover.1454108117.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/2][jethro] Jethro-next openssl security fixes
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
X-List-Received-Date: Fri, 29 Jan 2016 22:57:16 -0000

please consider these two openssl security issues for the next jethro update

The following changes since commit d2afba471039f94cf251f40298a51dbd640d4e93:

  qemu: Security fix CVE-2015-7295 (2016-01-29 12:31:19 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro_qemu_sec
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro_qemu_sec

Armin Kuster (2):
  openssl: Security fix CVE-2015-3197
  openssl: Security fix CVE-2016-0701

 .../openssl/openssl/CVE-2015-3197.patch            |  63 +++++++++
 .../openssl/openssl/CVE-2016-0701_1.patch          | 102 ++++++++++++++
 .../openssl/openssl/CVE-2016-0701_2.patch          | 156 +++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |   3 +
 4 files changed, 324 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3197.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_1.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2016-0701_2.patch

-- 
2.3.5


