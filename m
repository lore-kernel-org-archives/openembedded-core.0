Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
	[209.85.166.48])
	by mail.openembedded.org (Postfix) with ESMTP id BA0CA7CDC5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 16:37:24 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id p17so10730657iol.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Mar 2019 08:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=drLqCX2lgpiQJf86GHe/stPx4CzmDz8rGh+CKDjwTR4=;
	b=LMct5PflRQVXq20PPbrGAi9nAGkBieb15ZFwRM+LgDJ/rlQ9UkcxmO1OUn3lzeBtWS
	meoBdrforj0PcL3G8rtzFDQjg+aZtdfTwIpgowL1yMShLYzCdIL/kG2/8vdElniyfTap
	OlL0cxc22Z8sbeY5A2Xg+LUTaZFM1YkYBI/J+dDjGq0zfiDgJ172pyQNZtOQAEAZc9yK
	g4HmG2T9p0m934jH7CNBGHu+jiYKI26COI859T3brJWNGPD8wdYOEgHSoNb2rJEJb1EX
	BFRLuqPJm9+Iz0pl8C99TUj1GZ71EXPH3nryexyT3mwh5VdGnwo52lrONXocdMBdDmrC
	fnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=drLqCX2lgpiQJf86GHe/stPx4CzmDz8rGh+CKDjwTR4=;
	b=QlGQGQ3AgcglPCQTk7kqiGWIimyAt5E5bfeWGEPk9+GiD5M5wLGX0Kk8T/GJcYIXjZ
	ZzhLvU3ZXhLtwyGVbg/zW1iYxXAEeLXz5AFt1E49aLyPbPZWTsWi5NrrW8LbHdnL1DNn
	nQxBLCQA0idjQHgS51rrFckiyF+Q1QK9d7whknWlaJ90Vd7RuEYf4ELraCOoSAHb/RQb
	xA2/6GuFPsraB/BEZSn6Jc3T/Qa3CpwhEe/T12elL1oU4emJY1CpVd/JcEXGo5BUcJL5
	xzyrB6527cFpRAdmbfvD36T7XEAJRcT48ZnDnVfayCtkwdhzshOIhU5Okdx6dmV5imUk
	0oog==
X-Gm-Message-State: APjAAAUytcRGR3JWTD0EjkYStfZOK0Bo4HTKGezFqzsKrQ6+mXDKDecq
	B6Q9sRFT18ond2rpXg98Yx0=
X-Google-Smtp-Source: APXvYqzeW+3zQYHaTieliFjiyGgy9UEUPDjMYx2lpYS0LksWdyQi1SWeqYLF4F7UzFwDo4KXOrJNjw==
X-Received: by 2002:a6b:b7cf:: with SMTP id h198mr3758407iof.175.1551890245676;
	Wed, 06 Mar 2019 08:37:25 -0800 (PST)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.116.254.195]) by smtp.gmail.com with ESMTPSA id
	x191sm1072550itb.8.2019.03.06.08.37.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Mar 2019 08:37:24 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Wed,  6 Mar 2019 11:37:14 -0500
Message-Id: <d9fd94147eb9a444f2a71a191d9e11eb0f6901e1.1551889557.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1551889557.git.bruce.ashfield@gmail.com>
References: <cover.1551889557.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] machine: bump preferred version to 5.0
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
X-List-Received-Date: Wed, 06 Mar 2019 16:37:25 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/x86-base.inc | 2 +-
 meta/conf/machine/qemuarm.conf         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index c29279209b..686f938233 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "4.18%"
+PREFERRED_VERSION_linux-yocto ??= "5.0%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarm.conf b/meta/conf/machine/qemuarm.conf
index a544312627..f3a4997491 100644
--- a/meta/conf/machine/qemuarm.conf
+++ b/meta/conf/machine/qemuarm.conf
@@ -17,5 +17,5 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
 QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
-PREFERRED_VERSION_linux-yocto ??= "4.18%"
+PREFERRED_VERSION_linux-yocto ??= "5.0%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
-- 
2.19.1


