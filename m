Return-Path: <danismostlikely@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id DA22C79B21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 21:22:38 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id u20-v6so2916557qkk.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 14:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Pr9NXEqNdaGiM9oEXWjYZXmQI0b+Jia6BM1Wt3efXbI=;
	b=V1hhxa7y7SRuTsgEV1SDBUbPNRBlKo7XmtnTHqHOxOmS0Fd7boManWwTatAEbSZkn2
	VGsENAmNfdkbmcrgmJAWbUb4K67yJGB5z32OvyA9qnyD5QucRjwTzl40U9maoLmPIUJD
	d89EA9FBIBoTjoOhn4s3Fi3s/XB+zzi5yolBl8GyTMAY7UEd+pEJ2H3tUYsbVnqahDaW
	L145K7R8FprW5PjTDJWSsgNXUqtBpg4uFdWzKOrqegFwGqlhzJttpWadfLvCRjjSPKXo
	CtlW9xCR6Bu5papH8jOZGKRFiWTujokXF00c7ESUEVqUm6clTDafpzB9/gQcyJGmMC/7
	NKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Pr9NXEqNdaGiM9oEXWjYZXmQI0b+Jia6BM1Wt3efXbI=;
	b=Fbnc315r25UvCbq5+q8fI6H22ZGLqQYSN+VdJUUwdqmAM9XD+yzdiqqyzPH2Vbqv9M
	D2KZMIXjIU1HEkJVfo9Sv6ITughYOtTJ47PTtI67eTFetl8nNPuqmtOYCkrwcjfKluQa
	Yv41TCLcxFi42EtO6uDDImcS2u70rtJ4KFGxvVl4M54N0tDtsSM0IuPeYHyLHNtGR43m
	os7skGwuBfrbd21vkkARQXhOAQtIGb4ssGCaBnFT+lzasbQyttUpKQsiR4NPV4Irpiiz
	Daou4AOiXHfmNbj/YtzKKNgVSZLaI4Zi8dB+MUG4QwaEwNYRmxtDB7h3JlfBbWXTLDBf
	Kckw==
X-Gm-Message-State: ABuFfojPPvhlOMeG+GFvhG1R146kBZjsy4S6hIAntjtD5lcNGxkGOago
	uWvWvyTzeOMAY4A6I2PJWhBUvjg3
X-Google-Smtp-Source: ACcGV61S74C/nQ266s7NQS7Q9sh6u3QJN77guMTdqxAmLp586Ez+Klh/8R037Hgils4EXIcN03BE9g==
X-Received: by 2002:a37:1a4a:: with SMTP id
	a71-v6mr26456988qka.252.1539811359347; 
	Wed, 17 Oct 2018 14:22:39 -0700 (PDT)
Received: from mediabox.local (204-83-204-143.prna.hsdb.sasknet.sk.ca.
	[204.83.204.143]) by smtp.gmail.com with ESMTPSA id
	h4-v6sm9799796qkg.95.2018.10.17.14.22.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Oct 2018 14:22:37 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Oct 2018 15:22:32 -0600
Message-Id: <20181017212235.8453-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.19.0-dev
MIME-Version: 1.0
Subject: [PATCH 1/4] util-linux: alternatify cal, rev, and ionice
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
X-List-Received-Date: Wed, 17 Oct 2018 21:22:39 -0000
Content-Transfer-Encoding: 8bit

From: Dan McGregor <dan.mcgregor@usask.ca>

These are also provided by toybox in its default configuration,
and can be turned on in busybox.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/util-linux/util-linux.inc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 60ac9c20064..35c67a8bd53 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -93,7 +93,7 @@ FILES_util-linux-findfs = "${sbindir}/findfs"
 FILES_util-linux-getopt = "${base_bindir}/getopt.${BPN}"
 FILES_util-linux-runuser = "${sbindir}/runuser"
 FILES_util-linux-prlimit = "${bindir}/prlimit"
-FILES_util-linux-ionice = "${bindir}/ionice"
+FILES_util-linux-ionice = "${bindir}/ionice.${BPN}"
 FILES_util-linux-su = "${bindir}/su.util-linux ${sysconfdir}/pam.d/su-l"
 CONFFILES_util-linux-su = "${sysconfdir}/pam.d/su-l"
 
@@ -209,7 +209,7 @@ ALTERNATIVE_${PN}  = " \
     dmesg kill more mkswap blockdev pivot_root switch_root \
     hexdump last lastb logger mesg renice wall \
     setsid chrt flock utmpdump eject nologin taskset fallocate \
-    fsfreeze nsenter \
+    fsfreeze nsenter cal rev \
 "
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
@@ -219,8 +219,10 @@ ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
 ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
 ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
+ALTERNATIVE_LINK_NAME[cal] = "${bindir}/cal"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
+ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
 ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
@@ -294,6 +296,9 @@ ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
 ALTERNATIVE_util-linux-unshare = "unshare"
 ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 
+ALTERNATIVE_util-linux-ionice = "ionice"
+ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
+
 BBCLASSEXTEND = "native nativesdk"
 
 python do_package_prepend () {
-- 
2.19.0-dev


