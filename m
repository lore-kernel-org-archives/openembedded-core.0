Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 22EA575045
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 18:43:18 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id b14-v6so5776066pls.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 11:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=G95+e1PVQ8sKRjIEw4mvtB3xpzVH6EneRKAMKt1p/iM=;
	b=Z9sqpSc4n8cFInM4eozZLM0mPnrP4Zi4FaI0ymm7f4QBrHdMCGb9/Q115I89L13HIi
	kQZWsPV8+xNSQVH5BSyzLjTEyIUA+bmFF8orj4TE8OQCCH30Gsj6g3QFr8OebM/bZ0RF
	Iz8v186PD2VI1k9tIZBKcXWZxWjv3di2K/RoxEW6HTMZM2IV8EY5tFeQ4injrMjqCohS
	qI2TVnnKQNJYIJdqqHk8FpFUDJLSotC8WwbaC0d8c3AjMgoV+V9Jv3/5Sgq+G+cY/Xl3
	LbUyKqTkJBluvv0dgzWInEDrFrHwhsm1AJsgFKKQ3mfamGkQt3fIUBPFHiZlHTe9YuXY
	eOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=G95+e1PVQ8sKRjIEw4mvtB3xpzVH6EneRKAMKt1p/iM=;
	b=jMp8tvdOyQuATF3+Q3AXNW9nkdC0T+YGVhnjJDkCujN9Y0wQZ3w0ruPXSIglCK8xAc
	qVyMV9SO0sl47A2JnZATVyCvnFNXKgOpR/jDQiTIeVKfXby4rNNE75/m1SA3wsWMFV87
	R+DDNFdXlUO4mxwfcm/ff+dqBEkfu+Bh1vuEw9CvYKwVJZqynlDM7L7PgaheW1jszev/
	JUfwehy1tc5xyugDJzHGer5wmeO815WUYxSMMBzvXVlkwbvkitFFmK5h0ftMuHjE0MYr
	sak3FLfdaD+G8Ru0upHiVq+N+61DLxECKVsY+x2DeESU1UR1s2vQSqz9KYaldGtZ0aPC
	UCqA==
X-Gm-Message-State: APt69E3XlngI08VdTqgtWIEh/BDN4N1UEl+YB4h/rjldhlxLsCgmFze/
	vNHC9CRV6a6Qrgy9r2j/O4myXA==
X-Google-Smtp-Source: ADUXVKLgGcI8ZPnPIHxnZWfLmTQnpG6kgeSyBpboItzAKEnO2uS96GOoA7AwfmvU16ywfPrMd5dJxg==
X-Received: by 2002:a17:902:b20d:: with SMTP id
	t13-v6mr3342161plr.121.1529088199114; 
	Fri, 15 Jun 2018 11:43:19 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm18167337pfg.94.2018.06.15.11.43.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 15 Jun 2018 11:43:18 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 11:43:12 -0700
Message-Id: <1529088192-991-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] bitbake.conf: drop FETCHCMD, GITDIR, etc fetcher over-rides
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
X-List-Received-Date: Fri, 15 Jun 2018 18:43:18 -0000

Following recent updates to the bitbake, the fetchers should now all
contain safe and correct defaults for the subdirectory within DL_DIR
to use and the base fetch command to run. It's no longer necessary
for bitbake.conf to specify these values.

This is cleanup which was originally proposed in 2012:

  http://lists.openembedded.org/pipermail/openembedded-core/2012-July/064224.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 3b2ef9f..8588684 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -349,12 +349,6 @@ CACHE = "${TMPDIR}/cache${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('M
 # The persistent cache should be shared by all builds
 PERSISTENT_DIR = "${TOPDIR}/cache"
 LOG_DIR = "${TMPDIR}/log"
-CO_DIR = "${DL_DIR}"
-CVSDIR = "${CO_DIR}/cvs"
-SVNDIR = "${CO_DIR}/svn"
-GITDIR = "${CO_DIR}/git2"
-BZRDIR = "${CO_DIR}/bzr"
-HGDIR = "${CO_DIR}/hg"
 
 STAMPS_DIR ?= "${TMPDIR}/stamps"
 STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
@@ -661,12 +655,6 @@ SRC_URI[vardepsexclude] += "\
 #  export DEBIAN_MIRROR = "http://ftp.de.debian.org/debian/pool"
 #     into your local.conf
 
-FETCHCMD_svn = "/usr/bin/env svn --non-interactive --trust-server-cert"
-FETCHCMD_cvs = "/usr/bin/env cvs"
-FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 --passive-ftp --no-check-certificate"
-FETCHCMD_bzr = "/usr/bin/env bzr"
-FETCHCMD_hg = "/usr/bin/env hg"
-
 SRCDATE = "${DATE}"
 SRCREV ??= "INVALID"
 AUTOREV = "${@bb.fetch2.get_autorev(d)}"
-- 
1.9.1


