Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 712877E3F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 12:44:44 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id s7so1798472iob.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 05:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PeFfgMVuV4qyw6y/EWZYXYhW5TqMZaQ4vnIcB8GpWqI=;
	b=Nw3OLeR6Xpdyh6TaaLkme1OXlElhG+rzeJ7L1a9OHQG8yLd0HfXI/ETE0zOMqG0dBQ
	n15Sa88SEO1wbuhF3B27rlIZ3MIoo5yHz54u//2m5lyKEOJ5XpLcG+mCV/qlar3IEy6C
	oJ2WvBgwCrFlIl/mgPT/enkw3Q9FgblKiydtcTglU3S06nS/zr7S3U3hgTPjuFv2L9EH
	uj/459r0nHfWXBzGDJN4Yr0dcZeaykuImDyPKv0Jy3H3kVy7kK82YrwevMP1do2uxdD7
	swtIA39b5dFMDZbOxXbznZRRxtaAyHNMq9553gsCkEeqm9YriOWX1aN/EOCexL3sEmdI
	CJ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=PeFfgMVuV4qyw6y/EWZYXYhW5TqMZaQ4vnIcB8GpWqI=;
	b=gTY/RV1mfW8UWi8C0XxNjZ3BRNRfgLARuPQ4MDUybrSapDLWGC6beXIVKK2+JPWYOL
	kT7FmBgiIAH0o6VtuPvjb7TfDS7JDiyWZtNgB3UzBvFZ2mdFQ4hIyW1kw0xrEnTd9cLj
	kfW5cgqrgu3fakMmZq7SaW2RxzoztkA/sEftNsdShVCIVk0Qof/NkSlCByWlqTWMWaW3
	xKCS/uQFflnURkJO2KuiAw7+W0R2v2u2YEMJ0eZHJ/92/FhFPoYPGBUsNAZ/iFy4LPlm
	jv9QdGl51eok7Sz8ae4Qhkw7j9p6oj0NujeI2uvq9O4SOlBZ7PBGjQVKnqMm/pj0NHzc
	+hPA==
X-Gm-Message-State: APjAAAXb+Oygj8YWGb0LogT+zZqyOxeqymKCDidz0Q5GGDBIa9TY0W8e
	2dovIUzP7sn9b0vTXKhD+SU=
X-Google-Smtp-Source: APXvYqxwRvAEHTn3ayYY9QffD6weVXmJVs9bdfrAock/56cN4iho6cs836M3e+kiYhvJpbPrLTx5Iw==
X-Received: by 2002:a02:ab99:: with SMTP id t25mr22952557jan.113.1561380284923;
	Mon, 24 Jun 2019 05:44:44 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	q15sm10119321ioi.15.2019.06.24.05.44.43
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 24 Jun 2019 05:44:44 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Mon, 24 Jun 2019 08:44:40 -0400
Message-Id: <cover.1561379933.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] linux-yocto: (small) consolidated pull request
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
X-List-Received-Date: Mon, 24 Jun 2019 12:44:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

Just a couple of patches in this one, since I have a larger pull request
coming in the next while, but I wanted to get these out first.

I'm also really only doing this as a pull request so I can have a good
space to mention that I'll move forward from the 5.0 kernel shortly to
the fall release (most likely 5.2) and a bump of the LTS kernel version
near the same time (assuming it gets picked before the release windo.
Now we'll see if anyone reads these parts of the pull request.

The actual changes here aren't huge, one adds a basic zynqmp BSP that
works directly out of linux-yocto, and the other fixes a config warning
that was introduced with the SCSI ptest changes.

Armin: you'll want to grab this for warrior -stable if you've also
backported the ptest changes and scsi warning.

Cheers,

Bruce

The following changes since commit 50d272863d35e0f37df13577cd77f25c84a50c26:

  bitbake: tests/utils.py: add one more test cases for bb.utils.vercmp_string (2019-06-21 00:33:32 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (2):
  linux-yocto/5.0: bsp: add basic xilinx zynqmp support
  linux-yocto/5.0: make scsci-debug include scsci core configs

 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.19.1


