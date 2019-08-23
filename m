Return-Path: <armccurdy@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 575B77F37D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 20:52:34 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id 4so6200721pld.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Aug 2019 13:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=E6DQYFtNdYu7xqop8XQ8L9n5/Ol10JvfYUIpzq50A08=;
	b=gOHzRYRv278pesmjixXF6pEiT9soxRSzbLRk+6WYrJLwrR1aAVgRXswELZI16sRbES
	7CAcKTEGLXTZm2OcjzbosZHFBJEKEeGo8ZT9si3+w9OaXpx9mkDkXEGSBD5xNQwJAoX7
	2W9ua59VbDkfJGdbe8V3zTu/+rfr6GpuvVX62tKQk0meNla68LSD2R5jdU4hCQKoFDK/
	EMgM2bkKOvF2TLtjpZA6vGeCvN1Ct1OvbvKvZ/CVo2x0bsFEOcSuTz+9EQGR09/W+Fwf
	7jevgZE5BUbKNnHoEN2Nvkg3cwul3sbJ/vDntYTniDv3q5aEvX9FpU7aCj7rCUKSsfZr
	OmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=E6DQYFtNdYu7xqop8XQ8L9n5/Ol10JvfYUIpzq50A08=;
	b=ICio114aDlEtjTDxqV0TyAM1cT1QhUO24bgt5oqOgrqtrop2h+XEBi/nkERGBoeQJz
	RzwpG1jWwPP47udOuEWNRe00H5vcBpZ0FsMQARzRDkp7TN12Q9Em5qTf+HHVzX8JSb4C
	gOVHA2DjD1E8BMyxKn/KK2JaHsK5BMm7VQC95wM7hCQQ7CNPhTh60griF1RY8pe9GbZT
	/UHYYybBSs4SDXl+a0TNwQuDMNEbVEYOsQ/akM4n6iWGIdi66yh2yZZweqdX1XJy7baJ
	78OwZNPB3YnMmxiUpIG24BClAF1jlQiH3VoaOSu+BYS2k19+rBg6NyN/8D6T1mWI5igT
	REGw==
X-Gm-Message-State: APjAAAWVvMinIus2HvogAIwjFP0ETsEZcPa3MqdERzHR3KIA9OWhSLmO
	4Z8hSj/9tdzY0lIPEweQ/jGjpZjc
X-Google-Smtp-Source: APXvYqxyMoGDQi8f85YyFc3pPmj3a7263BbDQH9X2F+w6i2LB2weXB7uwh00gJXcGETO5fAxyMpo8A==
X-Received: by 2002:a17:902:8204:: with SMTP id
	x4mr6826414pln.37.1566593555024; 
	Fri, 23 Aug 2019 13:52:35 -0700 (PDT)
Received: from localhost.localdomain ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id h9sm2688314pgh.51.2019.08.23.13.52.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Aug 2019 13:52:34 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2019 13:51:32 -0700
Message-Id: <1566593504-21918-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 01/13] bitbake.conf: drop FETCHCMD, GITDIR, etc fetcher over-rides
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
X-List-Received-Date: Fri, 23 Aug 2019 20:52:34 -0000

This completes cleanup originally proposed in 2012:

  http://lists.openembedded.org/pipermail/openembedded-core/2012-July/064224.html

Current versions of bitbake have "sane" default fetcher commands
so it's no longer necessary for bitbake.conf to over-ride them.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1311e6b..a0a7f49 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -360,12 +360,6 @@ CACHE = "${TMPDIR}/cache${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('M
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
@@ -676,12 +670,6 @@ SRC_URI[vardepsexclude] += "\
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


