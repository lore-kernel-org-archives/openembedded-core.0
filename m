Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8FACA731D3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:24 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id l68so11567062wml.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=zC76wztoOmjgTYScptfLTH9iRBHCw3gx9q1Lgvi/jiU=;
	b=wjQN9WEEenbkkp5szd75laBcGYXfjyscRcykWRqAPYUwqYhoJC36X1DKLqNTi0457H
	iQHZawnkBOtSBNRPn/XQzBpEqpGDae+eRGSaMtGR2JkBZtR9t2DaHSNQLYKuVcMUHWLc
	boqK64gdVUm673+4blRc/2vu3zzS1Cr0QYN5jS2wz0m7EuOA3pzMwacVINf9sW4AljT2
	7oHP/IhOncfXRmr8Dh9CXMBKvt0d21lY+xJ9vnEoVeFAzkFswLafhfoWmWHDJdiYV0f+
	/kPHP8DkRKO6Gu6W7OEPB5x9L5T2nUamIloJqidNeMC81afPXseRZGVd03tZp5dwqGKd
	cAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=zC76wztoOmjgTYScptfLTH9iRBHCw3gx9q1Lgvi/jiU=;
	b=Yxsf82j5O8TDtga1K92PIMOjjJY8s9SQcosvL4FJH6LrW+yPuWrKSr8HbNcKMZH7Dq
	BhxSzkFmgyJRzA3ib4k0LCPCmuU8ycQmkrYGIAcL5BksdNzhnWC03v0A100pzt6fH81n
	uccePOvZylS7pdjEqQiqTAd+cFgWlfSljFqccJ525gL4nbdvNnXxwhNG61OdrxZcsoQi
	+SMaXLqn5eDhtk95vNU8ZgBNMiyPJl8OZJOVp3xi0Vz/8aS8RVmSH7pqfw2LmVVs1aGr
	lx67uWNTW4XWW2269v9d++xIl4RdIrtyDNFZeswcSDnVTABR2ILtEyaRwkUmMBDjC8TZ
	DQXA==
X-Gm-Message-State: AD7BkJJYsl/MPJOTSGK4TnigkiGGZaMLiO9DeNXhN5LUnZIqWMs05oUPT1eNFj2Rv2emAg==
X-Received: by 10.28.148.142 with SMTP id w136mr13924493wmd.90.1457896525194; 
	Sun, 13 Mar 2016 12:15:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:23 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:37 +0100
Message-Id: <279258a47b146a58e245d1ebcb77ca4ceda27a33.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 39/42] dpkg: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:24 -0000

* SYSTEMD_UNITDIR var is not present in the file, it can be safely removed

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-devtools/dpkg/dpkg.inc | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg.inc b/meta/recipes-devtools/dpkg/dpkg.inc
index 3d9e7e3..1f7f5d1 100644
--- a/meta/recipes-devtools/dpkg/dpkg.inc
+++ b/meta/recipes-devtools/dpkg/dpkg.inc
@@ -52,13 +52,12 @@ do_install_append () {
 	fi
 
 	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','false','true',d)};then
-		install -d ${D}${systemd_unitdir}/system
-		install -m 0644 ${WORKDIR}/dpkg-configure.service ${D}${systemd_unitdir}/system/
+		install -d ${D}${systemd_system_unitdir}
+		install -m 0644 ${WORKDIR}/dpkg-configure.service ${D}${systemd_system_unitdir}/
 		sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
 			-e 's,@SYSCONFDIR@,${sysconfdir},g' \
 			-e 's,@BINDIR@,${bindir},g' \
-			-e 's,@SYSTEMD_UNITDIR@,${systemd_unitdir},g' \
-			${D}${systemd_unitdir}/system/dpkg-configure.service
+			${D}${systemd_system_unitdir}/dpkg-configure.service
 	fi
 }
 
-- 
2.7.1


