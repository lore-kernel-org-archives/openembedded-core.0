Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4577D8DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 14:52:19 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id a190so6258973ite.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 07:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/xKgg/StCqfZQDbC5WWP8xU6JtJQj+34GXRtaMUW/qQ=;
	b=LJsNnNKsNpt525BZ0eIV/s/W0zal0PBDbZ668qYqq7Zq3x+/IKJbkLfcdPNFAzGd/B
	5hD6f90exzcA6fE6sQW7FJ26tv+tXbXuQ9OIPVQYxlu24lV2DJLA9o8MEOcSDB5P9s7q
	3whDR/O5zzF/9DJyTjVIHbu6IMHpbsSepECskYSZxQNfPc3Kq4lQ/TJsAebvsxmHBcge
	b6ydMTJt3JWj2YIqjfiypL3UnfyepiQlWYNQnN3+dKtRG/tIIJ1sDw8qFp76bSFn3WXf
	EbQruKBWFVhyaaolhiPzmDOiwObqRrfkqVqw06/kXWSeGDpO78XX+uJ6g6QvhUyeqt+s
	ittw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/xKgg/StCqfZQDbC5WWP8xU6JtJQj+34GXRtaMUW/qQ=;
	b=ogW52AZtBPSwIPy84sHJEKBz6wO7HlMXlblGi9CZwJ9RuLV7TEiDqaUDA6EStC6fC1
	ItytTo7XpT8RKOVYEQ7/bTRAU4PPYW3Kfn4y9oEwxZpw/qTduw1m2FvuWnazwcF9hN/F
	43ojvy+8fVqy1VaWTaLT3DkEnEvql5tLqkju7Cz7570SXFstq+qvWv3dBXunw799yN7X
	GUmk4rTLhp7MRxiA4dVxTBs0eJzn3rZkVIL+HHzdt0JFfRhrqxPRVw1mBGXWlY+3O5CW
	zmPXmXrsy4JC+kZ1cjt/86AkY//eAhFvnzywovj7mhTqlVOfIdZ3Ohegv7WKnQmsk+9v
	92gA==
X-Gm-Message-State: APjAAAWcd2/MY/t7mpbQgyVxg5h2OeupoJK8mv6z8Eggem/MP83LsPLM
	nUVrOqBlmA5NBm4PjcujJdo=
X-Google-Smtp-Source: APXvYqwye5PyMugwT519Tg+81uXQ7S/lDOyE8JCVQfg57GBfh3Y7J+dxx2yZoE71Epy87wYC7OEFhA==
X-Received: by 2002:a02:ca4a:: with SMTP id i10mr22531698jal.70.1556290340471; 
	Fri, 26 Apr 2019 07:52:20 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id t24sm4625947ioc.1.2019.04.26.07.52.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 Apr 2019 07:52:19 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 26 Apr 2019 10:52:14 -0400
Message-Id: <cover.1556289910.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: (small) consolidated pull request
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
X-List-Received-Date: Fri, 26 Apr 2019 14:52:20 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Richard,

This pull request is really about the TCP fix that we need for the ptest
timeouts / hangs that you were seeing.

I also had one config tweak, and a -rt cleanup that are worth merging
as well.

Cheers,

Bruce


The following changes since commit 244cbcce0ecc4691a9ddfb0a44dc487ff7af0670:

  utils/multiprocess_launch: Improve failing subprocess output (2019-04-26 10:09:08 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto-rt/4.19: fix merge conflict in lru_drain
  linux-yocto/5.0: port RAID configuration tweaks from master
  linux-yocto/5.0: integrate TCP timeout / hang fix

 .../linux/linux-yocto-rt_4.19.bb               |  2 +-
 .../recipes-kernel/linux/linux-yocto-rt_5.0.bb |  4 ++--
 .../linux/linux-yocto-tiny_5.0.bb              |  6 +++---
 meta/recipes-kernel/linux/linux-yocto_5.0.bb   | 18 +++++++++---------
 4 files changed, 15 insertions(+), 15 deletions(-)

-- 
2.19.1


