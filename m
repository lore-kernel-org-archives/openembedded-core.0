Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 51A187D6BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Apr 2019 15:38:06 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id d201so14676768iof.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Apr 2019 08:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=MyBVBCzTKDD9UDS25u8Ul6EeaK4EtqKb1i2TgshbYjY=;
	b=Vw8JHJIy527s2I2UpaXNgWLGsj93LHF5esQudwrZdkp6Pcfh7TCsw1M7FNtJUZl3nc
	eYENFx9tIbuDNCpzz+O789EfT+tL9I6nIHCMcIQole/cQz839w+eg56BWsRNGO11TuVO
	4tJOjTTMMtY3iGmkJdKC6yp40MVJmnQFKXKx3Cg1rWYwJGWrYPHedkEBpyL8FLLvXP6x
	DL4MeE6XxZQK23aiNMy9spYHLR94Fta7Rttjmg8f8E4mYRszfNJGwb/nLqIDCsVCmQNT
	r7cTNWtAQP9ECDxWMo1VIb6RuHwtYmSauzl3vACJHjxVTzo0c5cvsBHETk9EZ6Z6s0Ix
	ez2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=MyBVBCzTKDD9UDS25u8Ul6EeaK4EtqKb1i2TgshbYjY=;
	b=YUBQUMZ997lllsJ5wUrNFPkHDzOFlm2nCvTSqxOiyIqihxH/cvL6K+mNTMXX1TQF8w
	vbO0oM6x6FWxlHm5VuI/FhbiQWADV5vU3nEqzkFSIhVKAIgNRaLibIf6P7JxuwbhDsmJ
	nsba08JVGXKgoCvaMjwTTy2kCH6+aP0hcIPuH5YgLKOge2B7CvIgb6/dPIIxGKvjLMZ6
	cPt9AKHAI53x6cDLhtDGWAz27sM+n4LsmsdKfX0zfwUTn4b3k7IhCVYhDkjlxNTOzfdg
	7YHXRErQpKy9/WJB3MqCrYXN5ChYueFCszXroG0x13fLDhSRnT9g+WEt/dE1PuGNv2j4
	wT0w==
X-Gm-Message-State: APjAAAWGbNmH714wfRXCkRxJIxIrUyT/IYa49Pg86RH6R0bXzACIlQYp
	iTZJ+BXpqlItZuUr+FFTlfBSAw+u224=
X-Google-Smtp-Source: APXvYqwFXEY7Oi2P6vmRSbzHi+nMM+/9hkMyWjJxeBWGW72KLO5dlAUCLiJoPsw+FkR1CTZdocL5Jw==
X-Received: by 2002:a6b:b797:: with SMTP id
	h145mr16591020iof.190.1554824287431; 
	Tue, 09 Apr 2019 08:38:07 -0700 (PDT)
Received: from localhost.localdomain
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	y24sm12376510iol.8.2019.04.09.08.38.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Apr 2019 08:38:06 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Date: Tue,  9 Apr 2019 11:37:56 -0400
Message-Id: <c2cf27fcb6b08549a218606df39bc037d70d247e.1554824014.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1554824014.git.bruce.ashfield@gmail.com>
References: <cover.1554824014.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/7] linux-yocto/5.0: tweak qemuarm -tiny configuration
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
X-List-Received-Date: Tue, 09 Apr 2019 15:38:07 -0000
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Tweaking the qemuarm -tiny configuration so it will boot to a
prompt. There are still some remaining issues (like hvc console
warnings), but this is much better than a silent boot, or boot
hang like we previously had.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.0.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
index 9c0dbcf4ba..adffe4e9f8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.0.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "06e1ff79ea9efef052404ee1989cae038b28e954"
-SRCREV_meta ?= "bf8eb7d888f05965789dec325e84a3dce8011712"
+SRCREV_meta ?= "f0b575cda6d03540ff8da2f70421f13a08f34a5e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.0;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
index c692ce75c5..49c69c4b57 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.0.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "b0477279877bb2b5cca6ec49c64e931901ff2022"
 SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_meta ?= "bf8eb7d888f05965789dec325e84a3dce8011712"
+SRCREV_meta ?= "f0b575cda6d03540ff8da2f70421f13a08f34a5e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.0.bb b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
index 8474b500cd..82bbbd616a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.0.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.0.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
 SRCREV_machine_qemux86-64 ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
 SRCREV_machine_qemumips64 ?= "2468c20c15477ebe5ecd73c0e0162d7432149318"
 SRCREV_machine ?= "3df4aae6074e94e794e27fe7f17451d9353cdf3d"
-SRCREV_meta ?= "bf8eb7d888f05965789dec325e84a3dce8011712"
+SRCREV_meta ?= "f0b575cda6d03540ff8da2f70421f13a08f34a5e"
 
 # remap qemuarm to qemuarma15 for the 5.0 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1


