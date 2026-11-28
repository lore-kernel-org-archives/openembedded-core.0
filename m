Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1194.1795890492969631993
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Nov 2026 10:28:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=bAUoEEyz;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38699cf08dfso11892861eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 10:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795890492; x=1796495292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QMN+36/g5jEqshLxiA6tt0D03kEeu3567353Iyh2Nto=;
        b=bAUoEEyzfz3DtwTMWm31Koeu3iBupVOmutKMBpzU/NCDMq+P3Ics/Fptjf+ZGtZISk
         J1Vtkf73NgtXgNQ5slzsQXRe3Mfy1MIthgCJEG+L2OFPhDp6urb3CeKnpurFFeIRUFMR
         Yi8/65Q6Nf2tolBhULVCaVae1jFB0KINl46E9Um2zpYymlyj1v2sdCtKr112soUb9kih
         oaJjykG7ygOLSbBPgLnkcLcmz6psqXIKOmOhAb+fYg0RbN+bUhlLkzcqWRWo0wuZmPsq
         xmDWFbNhXnWMvQV72nmqBcLGs8++WlQSI7Lhv0e0N4TqneBXinQmT76+CbliOTcMtgyK
         4MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890492; x=1796495292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QMN+36/g5jEqshLxiA6tt0D03kEeu3567353Iyh2Nto=;
        b=YjRWtuWB4G0qvWjOUKRLI7VjMVECznlHpC+mjrsdGArHed3TjYuHOMwvMPMctrSQsI
         UgNSjIGGwbASZ3CVzM3TUY3fL920N3sp4W1+KTIcJJXkJRG9lHzEU8QgNSzMCtzyocrS
         hBNRIOw2W6GSQLPFZOEtcNKRF0de73iymHIgWcTudukUnyriwvESlhA98l3CujOCvvSz
         jTdS14Iow7SNhmCx2VVLED1GOckdPesyD20k/J6EAJXmLEwPDpPSX6B7yGfFGPUSUJHJ
         c/5dTP2PrQGzjBubz0T3zf60Dx1NJaalcwyfAM7KXyg4kq3tbrs7uHh6r03PiM2FFT4k
         Kheg==
X-Gm-Message-State: APuU4Z8399dILWc74HM4uA3ufZipFdZa+RbXN/4Cm/lAIPdhc193YiaS
	qFR2QEumhRN+1ToHcJ8bqGnak/fI/TBZ0xTeCM0TKcsaxawT9K1bl1tFQR/3G57S
X-Gm-Gg: AZFdTZeCCtEgehD0ySgd6WUii1JXMu9JMkDw7PywdcFaoMwQEyDq23b65fASEVW5dVW
	HFJi33tGKRNTXc+XmqFT62MDLHaqRMQLXyww2MCtksAYkxpsrk16Wr0IJ3QMfBl7OwxUX9M0qFj
	bduO1ZVynUaW5k7gGajFfZajFYZEEt0nCE19i6v7xAvDZ36nOA5d2Jab43hdnSoqFdm8WCw7b2w
	Ty0L1Xv61Ew1i5w0wWi4mNAtLhlIGuxats+F2ZMMVUqrE08FOuggDAKTejdkuIEO+7PrRgpADDN
	A38l3ZXJsTmOB54/SY7MNlHr9BID/xuzAkg3/tCWHJ4RmOKhOzGUefOS13WxOtLyADtwNceHb8/
	HlB6mnSmX9bnBsVYrS8xlUvkZN87b7dR4wcnRWoTNnQKgBxg3/oro9Xu7vDLV+kc+gV5TFYYnPZ
	o1puZ4Ctu2q0uTQ+kpI6J7UtRljvU/LHEot0qqUT5eMOVmpINIWL9zHDUmqJXYDEruHPHRMhAbd
	itzTIRVUfFSqE7bTYphgpChI4mPSp/2c/h02tONLOVic2DMVjsvaOw7UabrebL0Te65g97bhIOJ
	fjvkfw75X9M5TRUcqPUH2KtdG0llo8z2jjU0s8mOP+nl62vou8bcwm/+VxRAZulUYECttejV3dU
	DF7PxJPuHZsbkWzoV8dqZRYMTd0XQL6KDF+xA3nOFq8j3mh9lEU/lb1duy5YGNm6/iqwtEnRJWy
	3wXeZjo0jF2gaE1Vj3pSEHwI6K1vdTRhsKMm9cTH0JxZbhQyBuOVf+HwfSAC2j+Vni95w7EP4cl
	xuj9ffvA5PYUnRn8lQFwjvxzAm3zMjlutIcsXT5OTpCJhFDBfxdVJ/4gAIJTG0VGx2boVq5VLWg
	LH0Y
X-Received: by 2002:a05:7300:6d03:b0:381:9b9c:6140 with SMTP id 5a478bee46e88-3856fd5bf5emr38446883eec.23.1795890492053;
        Sat, 28 Nov 2026 10:28:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm79205638eec.13.2026.11.28.10.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:28:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [PATCH] nss-myhostname: Remove the recipe
Date: Sat, 28 Nov 2026 10:28:08 -0800
Message-ID: <20261128182808.1484263-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 28 Nov 2026 18:28:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251505
Content-Type: text/plain; charset="utf-8"

nss-myhostname 0.3 was released in 2011 and the project was merged into
systemd, which builds the same NSS module as libnss-myhostname through
its myhostname PACKAGECONFIG and updates nsswitch.conf itself. Nothing
in oe-core depends on the standalone recipe, which was only usable on
glibc systems without systemd.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../nss-myhostname/nss-myhostname_0.3.bb      | 31 -------------------
 2 files changed, 32 deletions(-)
 delete mode 100644 meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 62de04001e..eddfaca84c 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -572,7 +572,6 @@ RECIPE_MAINTAINER:pn-nfs-utils = "Peyman Jahangirlou <peyman.jahangirlou@windriv
 RECIPE_MAINTAINER:pn-nghttp2 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-ninja = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-npth = "Unassigned <unassigned@yoctoproject.org>"
-RECIPE_MAINTAINER:pn-nss-myhostname = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-numactl = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-ofono = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-openmp = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb b/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
deleted file mode 100644
index 9e41c5b9ed..0000000000
--- a/meta/recipes-support/nss-myhostname/nss-myhostname_0.3.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Name Service Switch module for resolving the local hostname"
-DESCRIPTION = "plugin for the GNU Name Service Switch (NSS) functionality of \
-the GNU C Library (glibc) providing host name resolution for the locally \
-configured system hostname as returned by gethostname(2)."
-HOMEPAGE = "http://0pointer.de/lennart/projects/nss-myhostname/"
-LICENSE = "LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2d5025d4aa3495befef8f17206a5b0a1"
-
-SRC_URI = "http://0pointer.de/lennart/projects/nss-myhostname/nss-myhostname-${PV}.tar.gz \
-           "
-
-SRC_URI[sha256sum] = "2ba744ea8d578d1c57c85884e94a3042ee17843a5294434d3a7f6c4d67e7caf2"
-
-inherit autotools features_check
-
-COMPATIBLE_HOST:libc-musl = 'null'
-
-# The systemd has its own copy of nss-myhostname
-CONFLICT_DISTRO_FEATURES = "systemd"
-
-pkg_postinst:${PN} () {
-	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
-		-e 's/\(^hosts:.*\)\(\<files\>\)\(.*\)\(\<dns\>\)\(.*\)/\1\2 myhostname \3\4\5/' \
-		-i $D${sysconfdir}/nsswitch.conf
-}
-
-pkg_prerm:${PN} () {
-	sed -e '/^hosts:/s/\s*\<myhostname\>//' \
-		-e '/^hosts:/s/\s*myhostname//' \
-		-i $D${sysconfdir}/nsswitch.conf
-}
