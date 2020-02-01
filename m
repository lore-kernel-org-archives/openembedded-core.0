Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4C38260BDB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2020 17:20:40 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 4so5144327pfz.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Feb 2020 09:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=a6rgnyfKfvuzkNjUTUqhhqFE69Y68rolz2CqTkwCGDI=;
	b=rtpmsyag8x4cjYOcEP4DFa4mZ3Y4AWNdkWEPmOhB6NwlZEpQ7D4SIFNDyfq9NL8nS8
	QVayl3S84IybLLSEaU3dVDUxewreVz/THqEd3TPFwC8D78kZCCTzsyLjwgH1ZCTMUiZa
	2shGZGmp0SYynAdEzBU16a/364Zq0wViVfjQ0Mphqc9dP8qNM2RRGoQpXq2fMMzpC4JA
	2AuegAeghTYM5BSMnvPlz0IbxIFK4IiSyAjvJI0NcV+1hOJeZ7krgS3DigShS/E1QnqO
	CKJ8uk1bY13U6SHcnG24o+CH50kmJOdC0bx0/2JGUWSJxWtkbQ3qWq0maz1VG+T/3bQ0
	D19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=a6rgnyfKfvuzkNjUTUqhhqFE69Y68rolz2CqTkwCGDI=;
	b=mTngNEe8+PIZlPVCnCIrB7HdhP/08DV9Z4W5IDVMyQZ9pkO0mfbz60Rg2VbBH7lQhK
	SwAqOEexTnIEOqe1bGOAuPwfO0a4+R4+lOfFk4ioiRzr3i89W5jRv62CxaIOnAr/+apX
	4+MPq6TUPmbIQ3jRlgkjtkyWyn8ynYqsqK+QIUiHgmxPE4fR1pn+yK6DY8tYhae74ZFw
	ZCU6BADLJnp7kbC+dBNmRMYZNYBxLbD8phyYCZLa/20NmKIfvbRq3ComigJ8gQWML7Qt
	MKEgAwLpRLlxkCzdsID7xxD4fGXEGY8MTj23BNd5IjMhkw/48R0vYzQUUMNOX/6vvGJ3
	FfLg==
X-Gm-Message-State: APjAAAXGz508Ksg/kGLbP13zGQwnhcUZrqewbryTnbtfp6BWdQ+f3VIz
	pxFcn300j/EbIZJb3cFNi6oTVl4ZbYU=
X-Google-Smtp-Source: APXvYqwXAlRNeiUZ7RrF3Nu9FRIfmS4n1qdisqCZMUFv8z3u4K8Ldj4sLaiGq6Ep+VAODuug+3MO+g==
X-Received: by 2002:a63:5848:: with SMTP id i8mr16106400pgm.438.1580577640902; 
	Sat, 01 Feb 2020 09:20:40 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5683])
	by smtp.gmail.com with ESMTPSA id
	g24sm14629402pfk.92.2020.02.01.09.20.40
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 01 Feb 2020 09:20:40 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Feb 2020 09:20:42 -0800
Message-Id: <cover.1580577515.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [PATCH 0/2] Update to final glibc 2.31
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
X-List-Received-Date: Sat, 01 Feb 2020 17:20:40 -0000
Content-Transfer-Encoding: 8bit

recognise ppc64le build host for uninative

The following changes since commit 18b6b2ae819cbf0ef3858944b4cd02ab74df6607:

  Adding memoriam to scottrif (2020-01-31 08:03:08 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib kraj/pu
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kraj/pu

Khem Raj (2):
  uninative: Recognise ppc64 host ldso
  glibc: Update to final 2.31 release

 meta/classes/uninative.bbclass              | 2 +-
 meta/conf/distro/include/tcmode-default.inc | 2 +-
 meta/recipes-core/glibc/glibc-common.inc    | 2 +-
 meta/recipes-core/glibc/glibc-version.inc   | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.25.0


