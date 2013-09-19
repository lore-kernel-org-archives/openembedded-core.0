Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 94B3A60664
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 10:03:45 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hq15so7682576wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2013 03:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=XG46USd5XB3V02PNme4Ny8Woggg0vA7T1pygHw8Dd50=;
	b=LsyTDpJxzFuzWR9M/QRnrpEItszQm9KK9NpJ5H2LjttVY7TufbwDhQ/oiUt6HSV2MS
	XeDO5Qdp5og5pitDuqx6EWk/moub0mEUbBdLTRkLAFQduRsHXdZB6KrvrG+9o1mEiYzD
	x+9qvedO9evXnPdJwew9SpuNHBADOHgQIpE4jKzTVngs0m8ROgXNRE7ebTTgcdOxdUDU
	vmlaO5baM3QaRn/SUn3ZoD+JEwe/a5mQLrv64Qwg3+tRnEp2ag46xONQHaHJUka35qlf
	5SB9qr1qDU858QLSoIgxZErdFIKlpTGyFMfHL/qhVS+wELtNLCgJ6JMjUmTBH5k++ljh
	E+xw==
X-Gm-Message-State: ALoCoQkxCZ8nep3s9xKdA/1gEL8fUFe/DFZG0L8QCucDMVZvrqs90o/sbub+RofrkG6/OHsc6mId
X-Received: by 10.180.9.203 with SMTP id c11mr627314wib.64.1379585026701;
	Thu, 19 Sep 2013 03:03:46 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id b11sm17597275wik.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 03:03:46 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2013 11:03:42 +0100
Message-Id: <1379585023-26278-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] bitbake.conf: define WORKDIR in terms of BASE_WORKDIR
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
X-List-Received-Date: Thu, 19 Sep 2013 10:03:46 -0000

To make it easier to move WORKDIR, define it using the new variable
BASE_WORKDIR, which is the root of the work directory.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/bitbake.conf |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 58d0c20..47d2171 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -339,7 +339,8 @@ HGDIR = "${CO_DIR}/hg"
 STAMPS_DIR ?= "${TMPDIR}/stamps"
 STAMP = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
 STAMPCLEAN = "${STAMPS_DIR}/${MULTIMACH_TARGET_SYS}/${PN}/*-*"
-WORKDIR = "${TMPDIR}/work/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
+BASE_WORKDIR ?= "${TMPDIR}/work"
+WORKDIR = "${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}/${PN}/${EXTENDPE}${PV}-${PR}"
 T = "${WORKDIR}/temp"
 D = "${WORKDIR}/image"
 S = "${WORKDIR}/${BP}"
-- 
1.7.10.4


