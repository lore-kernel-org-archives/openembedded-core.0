Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5FAFE77042
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 20:35:25 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id n128so4224816pfn.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 12:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=nbhNPlc2ez0g+HgvETH4Am3lCRQ3nI68XQqsXdbDvZY=;
	b=Xwg+Jt+CGT0zX78vmgDp9XZP2uPA0kkrQETSircPvuT02Ry6JRadeebVV+acETUqHe
	N3Isv8AqjVDvOzQV4fIS5pdzeqEig3VemiVoJivCENVGsQVKGzqJbVaDZTCuUDrjr2A9
	hZinbUvoh1CDuW3KJq0/qP/c6PtN6tjyNgdY+yZo3nyt409YVXt+bRtzRZaW7vtn6izy
	gq6bKetsDqx0co5fEa9i4UICQR+2eQwYZ5B3X/jxkAVXqfE34DSSmuxbsjlCLFVRjHHR
	plxViVgeGqlbvn7ym1iaOSZ1NOhvu4aVGP9xGJNjFrJUH6sMZ24byfqY669RvwPlbeIn
	cjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nbhNPlc2ez0g+HgvETH4Am3lCRQ3nI68XQqsXdbDvZY=;
	b=YcQtxsgXWoC+66mswsvc36dOLeKZ2hhnuBjLvq4u2XVad9Tb4UOHaTCQANBuuQJs4G
	9uute2JFNfmn3fusvXaAl+lNmqioeKdwUgUxYuSZiUSz+7qc1kRQ6QvpNq0H+OE0LkwM
	/3xTIycvjGv1tr/Wy67V4eru++pPThdPLQhZ9QBddvBS6XET/g0+Z6DA0GF13YdWRhxc
	4F7MnSbwqtXkGoTts6Cca3JmElLBWABBYMHCz5jwg0e0IVPxK0bweHvU71okyOEWK1rT
	ex6OJRHvApHAB5v5GwdST865BzJaNMTIjal4nUWP1vEWZtyUukFdZitOR6PHPqYJwJZv
	JBDg==
X-Gm-Message-State: AG10YOQTnrfoAPPyItxEZ3xLGvVvdtIvEDQsvqfB6yMHtHCCWr6hcsi7cZXXbvRv+UXg0A==
X-Received: by 10.98.15.82 with SMTP id x79mr16720722pfi.52.1454099726009;
	Fri, 29 Jan 2016 12:35:26 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id r80sm858016pfi.9.2016.01.29.12.35.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 12:35:24 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	liezhi.yang@windriver.com
Date: Fri, 29 Jan 2016 12:35:15 -0800
Message-Id: <cover.1454099596.git.akuster@mvista.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 0/6][Jethro] Jethro-next qemu security fixes
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
X-List-Received-Date: Fri, 29 Jan 2016 20:35:25 -0000

From: Armin Kuster <akuster@mvista.com>

please consider these changes for the next Jethro update.
(resend using diff email addr)

The following changes since commit 2fb7ee2628e23d7efc9b041bb9daae7c4a8de541:

  bitbake: toaster: make runbuilds loop (2016-01-25 16:29:16 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akuster/jethro_qemu_sec
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akuster/jethro_qemu_sec

Armin Kuster (6):
  qemu: Security fix CVE-2015-8504
  qemu: Security fix CVE-2015-7504
  qemu: Security fix CVE-2015-7512
  qemu: Security fix CVE-2015-8345
  qemu: Security fix CVE-2016-1568
  qemu: Security fix CVE-2015-7295

 .../qemu/qemu/CVE-2015-7295_1.patch                | 63 +++++++++++++++++++
 .../qemu/qemu/CVE-2015-7295_2.patch                | 58 +++++++++++++++++
 .../qemu/qemu/CVE-2015-7295_3.patch                | 52 +++++++++++++++
 .../recipes-devtools/qemu/qemu/CVE-2015-7504.patch | 56 +++++++++++++++++
 .../recipes-devtools/qemu/qemu/CVE-2015-7512.patch | 44 +++++++++++++
 .../recipes-devtools/qemu/qemu/CVE-2015-8345.patch | 73 ++++++++++++++++++++++
 .../recipes-devtools/qemu/qemu/CVE-2015-8504.patch | 51 +++++++++++++++
 .../recipes-devtools/qemu/qemu/CVE-2016-1568.patch | 46 ++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.4.0.bb           |  8 +++
 9 files changed, 451 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7295_1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7295_2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7295_3.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7504.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-7512.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-8345.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2015-8504.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2016-1568.patch

-- 
2.3.5


