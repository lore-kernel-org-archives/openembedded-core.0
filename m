Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 963A67F45C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 16:06:38 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id t6so15039010ios.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 09:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=tlf8W1z5uJ4pvogSs1HUI46Rv4YiIx5z5SYk9OjX0Rc=;
	b=u2ScyPiXNg3dFsQEZACAURzVeJC+03rhSeARAxHV9FYc8+qeJcmt8adMaX9k7SgAxJ
	3FCZ7y4ovZWhl6L+4Z26tIC/Nh88J1C+vRfx2pDsdesWQcur6C6hGcfZS2LRZ6U+o3Ii
	/aykOJkKymUVWCU1wMQu7wg7x1sgj/cLGlbKJqZixWkEAvlbj7Tl1s1c/K9WnUyXaTUF
	psT3QykbrdKeUFCRBkrfZOkpgODxthbkGbFQ44w2rBdWWJs0AFoMVKKWOOhrpfqDxnvm
	uVKQiqt8FJ+NrNaWutSjap48dqV+kElpuzFHvVAtc+RvQonqDMI1+9lS2ziae6yBaxf9
	+3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=tlf8W1z5uJ4pvogSs1HUI46Rv4YiIx5z5SYk9OjX0Rc=;
	b=bkhQlA7xmS9DsN2+xW0+Lo8d/CN8fnCnHezRYmQYrRLE2Bvt3lxN/MBu/08cUJtPZC
	23qvRJEJB0LylEOmEkdKISG6gVozIpMD8OTfcEYQp+9rbCdLrF+qfI3TA+rJHwipS+W7
	6D6sMeXImWom61xxL/+posWFCjbmDEt0IKBCTmDtpvuMpIh4WVczkX6Gm9I6+InqgcPW
	+/OjlX4WQgf+GYjagFMpKGjscPJj1u1x9Ts4lS05obN8W57Ak5in4fNOY5oSeW6LOpzc
	n79Frvo+7a/4UeenjFwGm9VoYSpr5qX/SUF8XHKJPI1UYJQ77bd0mP+5fysPkQOMkkQ9
	q1Kg==
X-Gm-Message-State: APjAAAWS4AFTh9c9VIz4IGQStf02UkOCGFRCUOZbzJ3NSff+0H8Rc5rf
	xwqquekbB57WHVsikoG2Qj0=
X-Google-Smtp-Source: APXvYqwcUuZG1BMHRBy5J2t0F8MJSBQ+aY1YMHM+fU8qcXUcunI/l8SYNBaYJoE3WY3fSPMO2O68/A==
X-Received: by 2002:a05:6602:22ce:: with SMTP id
	e14mr19305916ioe.290.1567181199457; 
	Fri, 30 Aug 2019 09:06:39 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id p3sm4514672iom.7.2019.08.30.09.06.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 30 Aug 2019 09:06:38 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Fri, 30 Aug 2019 12:06:32 -0400
Message-Id: <943af858a366e496dba4221e5cdb6eb7326fdc32.1567181039.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1567181039.git.bruce.ashfield@gmail.com>
References: <cover.1567181039.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] qemu: bump linux-yocto preferred version to 5.2
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
X-List-Received-Date: Fri, 30 Aug 2019 16:06:38 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/conf/machine/include/x86-base.inc | 2 +-
 meta/conf/machine/qemuarmv5.conf       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/x86-base.inc b/meta/conf/machine/include/x86-base.inc
index 686f938233..0227f3c289 100644
--- a/meta/conf/machine/include/x86-base.inc
+++ b/meta/conf/machine/include/x86-base.inc
@@ -18,7 +18,7 @@ SERIAL_CONSOLES ?= "115200;ttyS0"
 # kernel-related variables
 #
 PREFERRED_PROVIDER_virtual/kernel ??= "linux-yocto"
-PREFERRED_VERSION_linux-yocto ??= "5.0%"
+PREFERRED_VERSION_linux-yocto ??= "5.2%"
 
 #
 # XSERVER subcomponents, used to build the XSERVER variable
diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
index 1c21d3342d..fb4789fdac 100644
--- a/meta/conf/machine/qemuarmv5.conf
+++ b/meta/conf/machine/qemuarmv5.conf
@@ -17,7 +17,7 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,115200 console=tty"
 QB_OPT_APPEND = "-show-cursor -usb -device usb-tablet"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND += "-object rng-random,filename=/dev/urandom,id=rng0 -device virtio-rng-pci,rng=rng0"
-PREFERRED_VERSION_linux-yocto ??= "5.0%"
+PREFERRED_VERSION_linux-yocto ??= "5.2%"
 QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
 
 KMACHINE_qemuarmv5 = "qemuarm"
-- 
2.19.1


