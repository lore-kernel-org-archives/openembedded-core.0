Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8FE72E0B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:29 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id eu11so10897252pac.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=GDbDkP36/8Nd+b0QonqcbKglsEnPcLfH1apVVQD9OZo=;
	b=RoBn2lQtBeIa70AbwK9teWl0r7REmw1mxhPCfthJuNDvyHge4CrjJC+jEAT4Jnxjqc
	Kg4ETQJGHErBL48AgaHAKRN4921pVlhX/3+2Z11sXgJ1vIMZ8V4Iwg2E8DPdW0CWGSBU
	KvzA4lGo23ZAK1IVNDeqWzW0hzP/I3ERvlPahNzrM1uCUuD7hIwHpX8bIpZnfCr9JdFk
	5ZosTFj419AGemSuBKV+01tBn0vvFJ7YbCf7Y83FNpw+yw7AdSD+hLC2E6aou48B1Qv2
	xBc3F5DBsvZp4R0zP+OMbn7snI0JqcxDbbZdR57wvERbPDlkkQnJNkvpFqd2YyqactRG
	yuYg==
X-Received: by 10.70.93.97 with SMTP id ct1mr6714930pdb.71.1423152330496;
	Thu, 05 Feb 2015 08:05:30 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:29 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:46 -0800
Message-Id: <4ea04f4dede1ad9bdd7e241daaffcfa5e426808e.1423150740.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 38/61] bind: fix typo chown->chmod
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:29 -0000

From: Ting Liu <ting.liu@freescale.com>

(From OE-Core rev: a6ee74222b43d0bb7fe9ef0072ede78f82a5e446)

Signed-off-by: Ting Liu <ting.liu@freescale.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/bind/bind/conf.patch           | 2 +-
 meta/recipes-connectivity/bind/bind/generate-rndc-key.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-connectivity/bind/bind/conf.patch
index 2785c6a..432c874 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -261,7 +261,7 @@ diff -urN bind-9.3.1.orig/init.d bind-9.3.1/init.d
 +	modprobe capability >/dev/null 2>&1 || true
 +	if [ ! -f /etc/bind/rndc.key ]; then
 +	    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
-+	    chown 0640 /etc/bind/rndc.key
++	    chmod 0640 /etc/bind/rndc.key
 +	fi
 +	if [ -f /var/run/named/named.pid ]; then
 +	    ps `cat /var/run/named/named.pid` > /dev/null && exit 1
diff --git a/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
index c2e88bf..db20127 100644
--- a/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
+++ b/meta/recipes-connectivity/bind/bind/generate-rndc-key.sh
@@ -3,5 +3,5 @@
 if [ ! -s /etc/bind/rndc.key ]; then
     echo -n "Generating /etc/bind/rndc.key:"
     /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
-    chown 0640 /etc/bind/rndc.key
+    chmod 0640 /etc/bind/rndc.key
 fi
-- 
1.9.1


