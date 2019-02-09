Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 0E2A57C578
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Feb 2019 18:37:09 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id i145so16997842ita.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Feb 2019 10:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0dtW24k4R9eJf0+/guqFCmBLQqIzaFkZwKAVDwfx6Zg=;
	b=NJMjjKrp/x+Wl0vrmMNSYbhZE23E5SbwpMFZDzYI7h+WUk3bp1fXJ7HSAVBz9k93YZ
	XnJyBBmfHeKYTA4OwpHWXgliZPkitTdO2+P7BK7A2wt9l97j7+vNp/Inoh+RVk5tVlxy
	NSPD+P139QTf7HojkCQXOmoieLPOfryA2CbjUwrFBFXX+przY3uCVC4GkdzB58ow+kB+
	fnc/UwWXinovti3FNC1xDJ9LI17d/xPdH6uCsvZDfyJoJExbFfM+JFjo24FqvlfilM0n
	LcI47gaRXq3qFOrludj7SxKE8GCbi+OD15PrTjYj5+NjIrkQkbR2rx0WoCWD+FaWzPpX
	jRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=0dtW24k4R9eJf0+/guqFCmBLQqIzaFkZwKAVDwfx6Zg=;
	b=Qt67LYjmghbD69N6ey61DCYzi3ERX480WivaMomqGLATzGbQj8JLQBwE0N2wjMXoVt
	KGzzTZRV2YDNvUJcfqM/WTzlxgdyi358dqJycsq6dmmIGEacbzi6ez4a34qb5GS/LsI3
	HfZaa7lC9cCqkagfXQMVsmITeGmZJhCDo5aJpfgGy4wXXR+lMC9616geZCJJ7vAuypnL
	2BIhVneE3pRF/TE18w1vh927HAXLR80ZGnBvSrkQnGTz/gfODReZc4cim3ReTBHpbjiL
	lT5rAqBjKQ6gmHNjlRhPDM8OilRy59qK11qGzq+AUtBV68TuffPRArfA6fJY2UNTOhS2
	jSGQ==
X-Gm-Message-State: AHQUAuZqAyE+u2MxlK1uRWG/45fECVSDwOLHjx7x0r07cMA/reOa4yUu
	uKGNLBWKCNk0wHDZTbdBtOLgPpEarAlCcQ==
X-Google-Smtp-Source: AHgI3IapIw0Go7MlTn+ut5ifaCQ1REuthKA2jMRGTBZLVugtZHeLel06DInJ6Xj7dsaEfoQwlOrzGw==
X-Received: by 2002:a6b:e608:: with SMTP id g8mr11436715ioh.188.1549737430737; 
	Sat, 09 Feb 2019 10:37:10 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195])
	by smtp.gmail.com with ESMTPSA id h2sm2633643itk.0.2019.02.09.10.37.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Feb 2019 10:37:09 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Sat,  9 Feb 2019 18:37:04 +0000
Message-Id: <cover.1549737160.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: consolidated pull request
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
X-List-Received-Date: Sat, 09 Feb 2019 18:37:10 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Sending out my queued patches for linux-yocto. These are mostly for ARC
support, but there are also -stable updates pushed for 4.4/4.9 if anyone
is using those kernels. SRCREV patches for maintained branches will follow
for those changes.

Cheers,

Bruce

The following changes since commit c4f1276721a6e2ea5c4b5e536711072e037a2d7b:

  arch-armv7*.inc: Add Cortex vfpv4-d16 support (2019-02-08 23:15:32 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Alexey Brodkin (1):
  linux-yocto: Add dependency on libgcc for ARC

Bruce Ashfield (2):
  linux-yocto: tweak console boot check
  linux-yocto: add baseline ARC support

 .../linux/linux-yocto-rt_4.19.bb               |  4 ++--
 .../linux/linux-yocto-tiny_4.19.bb             |  6 +++---
 meta/recipes-kernel/linux/linux-yocto.inc      |  4 ++++
 meta/recipes-kernel/linux/linux-yocto_4.19.bb  | 18 +++++++++---------
 4 files changed, 18 insertions(+), 14 deletions(-)

-- 
2.19.1


