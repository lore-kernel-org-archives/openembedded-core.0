Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1TeSXk-00066i-MA
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Nov 2012 16:30:42 +0100
Received: by mail-lb0-f175.google.com with SMTP id gg13so507861lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Nov 2012 07:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=KWoI+ZVcawPrPqYm4VidEH25JlN4JQvJzREJFfEXzA4=;
	b=LoIO/8BEn44ZIhjsfzPHbw3Z0X72N+kYNZ19H/d4Vx1hXgr5SRZgG14KyW8/C6LNJD
	jdgX4hJ6pUcAkpnwedNeMgw+z5ATFLBvDbcpuqFbnS4cfBlgdNP8eDUw1xxLuh62Vthq
	u5F5zUJoQHKo65r+skwpcuCsCIhTdjMI01UN8sXzstQzv3/MziJtlh3n2CYZxIA7RdLK
	6nxFmPQDNw0GsOlUVdEzEq8wXv8QcTyzSqMhETCGf4hQX0FjjnRRY77Q3Twi/7vfO5TW
	zMCUF3PXyQb2kfvWxbguqfRVHeKiSLyXn58s4E3zGjCrogC1+lyu4qotYhvms2pzXiCH
	Utbw==
Received: by 10.152.104.44 with SMTP id gb12mr1592362lab.11.1354288563558;
	Fri, 30 Nov 2012 07:16:03 -0800 (PST)
Received: from prime (a91-153-8-136.elisa-laajakaista.fi. [91.153.8.136])
	by mx.google.com with ESMTPS id b4sm2219704lbi.0.2012.11.30.07.16.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Nov 2012 07:16:03 -0800 (PST)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1TeSJr-0002zf-K4; Fri, 30 Nov 2012 17:15:59 +0200
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Nov 2012 17:15:42 +0200
Message-Id: <1354288544-10778-9-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1354288544-10778-8-git-send-email-cazfi74@gmail.com>
References: <1354288544-10778-1-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-2-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-3-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-4-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-5-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-6-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-7-git-send-email-cazfi74@gmail.com>
	<1354288544-10778-8-git-send-email-cazfi74@gmail.com>
Subject: [PATCH 08/10] uclibc: fix license segment md5sum boundary
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Nov 2012 15:30:52 -0000

Replaced incorrect "startline" with correct "beginline" for telling
where license segment in file begins. This change has no effect on
md5sum as license segments from the beginning of the file.

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 meta/recipes-core/uclibc/uclibc.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 707b14e..c25c4d1 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -12,7 +12,7 @@ LICENSE = "LGPLv2.1+"
 SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
-file://${S}/test/regex/testregex.c;startline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
+file://${S}/test/regex/testregex.c;beginline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
 INC_PR = "r8"
 
 require uclibc-config.inc
-- 
1.7.10.4



