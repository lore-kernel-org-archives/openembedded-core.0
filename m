Return-Path: <danismostlikely@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3E78379C3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 15:23:08 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id b4-v6so34644167qtc.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 08:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ytLECjqyxSilsCuTtr6SRVZ80Qi7S5rny/Iz24gCfAk=;
	b=mOOBUNRFoMhNhsmYRZtjFOw3uC16zPWorsYnDRTel8Xrr47JXVTo/y1Soa2MADN54F
	qpNTXStOKPvw8rXwAkGaCEp0efATW1NbgIggQYnvqqrsxb9XZlYKSXbCFADUd+Kqi800
	upEeuhF6LgheA5+lkqq6GxAtmnvzsPMqyGExNGdM8xSiIpy6I3Z0xI11Ad9adIGsBKla
	virhyfefk4tl/Csig8rD3ec0sO+Qfwrf/YZezB0tNCCj6xO2V//uD2QG3DMqsi1Wmim3
	9wnWUo8Ta4IuP8voXLjwcoUuxHBpprAS1wC3rPOLduKEnE8CgJ0DU1pr9VtcFrKmqi2Q
	G9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ytLECjqyxSilsCuTtr6SRVZ80Qi7S5rny/Iz24gCfAk=;
	b=CfItQg1I7XJsgrRy5ZKGfjKjPmpA30bj4wTes4PQuoDi/ewTtfAxuWa6e7hZLBrCY7
	qK4FJZznY68a2sA7SXOrKmyCmI2ZQe6JNCQR0ejkhkd+CuoT9xNCEGYhv/l2Qs/UP4R9
	CnS7SCf7agDKnsQ9BynbME8HTf7r6wgYcjw+JPQJtmmqb3pO0tuz9wCbsJ/mB5ccfQ0S
	oWvehJa/IF51h4AlUp1FpeNAfipK+huDtxNg3phujMLCBVq/Ir39qWIM9svzVjnjObT1
	V3dDIxU68HxQK8kQnbeourpB4h2jzxh08Ip/+Ojnqk8Am4jct3ZEh17yCm5Ho40M1AnR
	yh1Q==
X-Gm-Message-State: ABuFfogO7Q09EsW8FdkyyYqp2RUhGD5OFmZMha4SzTk80uMdLGmi601c
	fEUii/mV+ysDKB81KliAkHh79fMx
X-Google-Smtp-Source: ACcGV63XT/Que04Gaw03+/A0wFaerhBr3BKOFLkPhQXHMwGvyfqyj2I0k0OJ4ZWv4z0mES71QCHHbw==
X-Received: by 2002:ad4:4312:: with SMTP id c18mr30493414qvs.59.1539876189558; 
	Thu, 18 Oct 2018 08:23:09 -0700 (PDT)
Received: from mediabox.local (204-83-204-143.prna.hsdb.sasknet.sk.ca.
	[204.83.204.143]) by smtp.gmail.com with ESMTPSA id
	p3-v6sm16572265qtp.55.2018.10.18.08.23.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Oct 2018 08:23:08 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Oct 2018 09:22:15 -0600
Message-Id: <20181018152215.23525-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.19.0-dev
MIME-Version: 1.0
Subject: [PATCH v2] util-linux: alternatify cal, rev, and ionice
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
X-List-Received-Date: Thu, 18 Oct 2018 15:23:09 -0000
Content-Transfer-Encoding: 8bit

From: Dan McGregor <dan.mcgregor@usask.ca>

These are also provided by toybox in its default configuration,
and can be turned on in busybox.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-core/util-linux/util-linux.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 3d8b3ff592c..2f99e8409f5 100644
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
     dmesg kill more mkswap blockdev pivot_root \
     hexdump last lastb logger mesg renice wall \
     setsid chrt flock utmpdump eject nologin taskset fallocate \
-    fsfreeze nsenter \
+    fsfreeze nsenter cal rev \
 "
 
 ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
@@ -218,8 +218,10 @@ ALTERNATIVE_LINK_NAME[more] = "${base_bindir}/more"
 ALTERNATIVE_LINK_NAME[mkswap] = "${base_sbindir}/mkswap"
 ALTERNATIVE_LINK_NAME[blockdev] = "${base_sbindir}/blockdev"
 ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
+ALTERNATIVE_LINK_NAME[cal] = "${bindir}/cal"
 ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
 ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
+ALTERNATIVE_LINK_NAME[rev] = "${bindir}/rev"
 ALTERNATIVE_LINK_NAME[fsfreeze] = "${sbindir}/fsfreeze"
 ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
 
@@ -293,8 +295,8 @@ ALTERNATIVE_LINK_NAME[mountpoint] = "${base_bindir}/mountpoint"
 ALTERNATIVE_util-linux-unshare = "unshare"
 ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
 
-ALTERNATIVE_util-linux-switch-root = "switch_root"
-ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
+ALTERNATIVE_util-linux-ionice = "ionice"
+ALTERNATIVE_LINK_NAME[ionice] = "${bindir}/ionice"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.19.0-dev


