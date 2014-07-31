Return-Path: <paul.betafive@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 36D1870896
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 21:38:13 +0000 (UTC)
Received: by mail-wi0-f177.google.com with SMTP id ho1so327105wib.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jul 2014 14:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C5XtSD+FjVQBAjD2IXtzVegW4hNfby9xOY7WPUDyhIk=;
	b=sXQvCuPUdVjpR9hUutkviJUPavzSvfCOb8uVERrtz6YZM+IRXRAcTF+HOUu8c6J9Ru
	6b1iHiqByPz/yIzurLB2vahViSH7KyPknhKmo1nX3a4laGS9DP/8VFZZTuPBbfQl+s+8
	gdL1WN4AJZNnqqFMJMxmPRPfKZVZL83VPei3Nn/43ISPY9QNRZZeah9gcHl046IRr3tw
	xGwnL72GCudCdK2fbVxUhZzTHk+U4pWPCDI3RWEQGrD0rEV/9zO2DBaC8Stud4Qq1Xpk
	8zwiJ3KvI8ho3BB1/pfUMBQEhQIg9+ExYV+VPg98lwfkOV+XkZTun5AcOMBlNCxzjqIq
	LF0g==
X-Received: by 10.194.103.38 with SMTP id ft6mr1407599wjb.18.1406842694153;
	Thu, 31 Jul 2014 14:38:14 -0700 (PDT)
Received: from localhost.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id
	wu6sm16048465wjb.46.2014.07.31.14.38.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 31 Jul 2014 14:38:13 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jul 2014 21:38:01 +0000
Message-Id: <1406842681-21669-2-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.0.3
In-Reply-To: <1406842681-21669-1-git-send-email-paul@paulbarker.me.uk>
References: <1406842681-21669-1-git-send-email-paul@paulbarker.me.uk>
Subject: [PATCH] opkg-utils: Update SRCREV
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
X-List-Received-Date: Thu, 31 Jul 2014 21:38:22 -0000

opkg-build now checks whether tar supports the '--format' option before using
'--format=gnu' so that packages can be build with both Busybox tar (no
'--format' option) and GNU tar (defaults to posix format unless told otherwise
on some distros).

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
index 2d16660..693c216 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
 PROVIDES += "virtual/update-alternatives"
 
-SRCREV = "d14458499af7dd41d8e424946c164961421b0ddb"
+SRCREV = "eae0d8fa44e8594aa90eadf06e5f4fbeef314509"
 PV = "0.1.8+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/opkg-utils"
-- 
2.0.3


