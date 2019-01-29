Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by mail.openembedded.org (Postfix) with ESMTP id 56C8360074
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 22:33:55 +0000 (UTC)
Received: by mail-lj1-f196.google.com with SMTP id q2-v6so18973437lji.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Jan 2019 14:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NZclKKbhBIpFbsc1A8tX/36JLLIWvzd/ve/2/Ciq/1I=;
	b=jqBcGDBTIZUWx/5k3NCbJcIZ7/H+pvmUeZ1uAYvfHbizUiLfUHaAmpONxWE2f9mlu2
	11iL5Vv9sjdY0778twhLcs61Yv5aQRGM3G/WwNSaDuKMJWtIRzhvCl20j8QlPC5q44q3
	ShCnrPyT2hdTbIq9nam5YCfL9QmvqToaw7JjdYmYjrFm8LUKZcfwB7QptC1FZXNoEX/W
	vRFVDeuvOdmMHnsfzt8vgeUNSa9ViB349TvTMqQjSMydDJGr/rLl2re65bN0GP3Uil2e
	Afv5TJm2btaZL4CkdvzZWvHXDjOCQ2QXLzOJZ7qH2bCLvyCo8qo89f01k2ldViRmjtH8
	kd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=NZclKKbhBIpFbsc1A8tX/36JLLIWvzd/ve/2/Ciq/1I=;
	b=kFzAet8sCIKH0matTCcixGISW5LfTvBDXPk1UektuHAkS0Ywlr9tR+bm2Wlu7aT9JG
	W6XOV373OFRrsiO9RwpwWrZH0zSAYDjHavH6Skf8TLEm+bVa55tcWLRn9NFR3JCm2+E3
	p/SnCtOFPNvPTdg4DYhGh9P1hjEmv94ZRcmM1B0Eq4KEDVZnOeYthZ/qcVJyQ0t3Dbud
	xStXc6McvYusGOxM1o2MI3ygaKUMnCrBC8sgyaAgpGj0YwM4m+MvkJMliLYCcHc6BWTJ
	4vsn+J8L1/4uwnFX0aPeLwe61hN42pvyIcXWqQ2hX8Do52ROLrjqbsCnbhITeJPqlBYi
	2OtQ==
X-Gm-Message-State: AJcUukd13RPAiaTPgVYZPkF3XaUYx3BWPCorVjuEVvIBk4mhdxvGlgKn
	nQp0JveDiZoTJ/sn8TCqiVaMdyNwdLE=
X-Google-Smtp-Source: ALg8bN64cN0pkUVX/g8XTC7GWBYzKPD3Umg/3CDe7Fhu5dMzSr4CzppASGTaSuaFNW39mSh0A4HPhw==
X-Received: by 2002:a2e:8e8e:: with SMTP id
	z14-v6mr19027448ljk.84.1548801235219; 
	Tue, 29 Jan 2019 14:33:55 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
	[37.247.29.68]) by smtp.gmail.com with ESMTPSA id
	b69sm3840278lfl.28.2019.01.29.14.33.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Jan 2019 14:33:53 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2019 23:32:55 +0100
Message-Id: <20190129223255.1254-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] bitbake.conf: Add seq to HOSTTOOLS
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
X-List-Received-Date: Tue, 29 Jan 2019 22:33:55 -0000
Content-Transfer-Encoding: 8bit

This fixes detecting available signals when configuring perl.
(cnf/configure_sigs.sh)

Without this, running aclocal prints warnings about missing signals,
which can be further demonstraded by running

  perl -le 'print for keys %SIG'

Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/conf/bitbake.conf     | 2 +-
 meta/conf/site.conf.sample | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ab00ac2f06..8e6dab908a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -483,7 +483,7 @@ HOSTTOOLS += " \
     fgrep file find flock g++ gawk gcc getconf getopt git grep gunzip gzip \
     head hostname id install ld ldd ln ls make makeinfo md5sum mkdir mknod \
     mktemp mv nm objcopy objdump od patch perl pod2man pr printf pwd python2 \
-    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed sh sha256sum \
+    python2.7 python3 ranlib readelf readlink rm rmdir rpcgen sed seq sh sha256sum \
     sleep sort split stat strings strip tail tar tee test touch tr true uname \
     uniq wc wget which xargs \
 "
diff --git a/meta/conf/site.conf.sample b/meta/conf/site.conf.sample
index a4c2f9feed..5164fedf63 100644
--- a/meta/conf/site.conf.sample
+++ b/meta/conf/site.conf.sample
@@ -26,7 +26,7 @@ SCONF_VERSION = "1"
 # If you wish to use certain hosts without the proxy, specify them in NO_PROXY.
 # See the script for details on syntax. The script oe-git-proxy uses some tools
 # that may not be included on HOSTTOOLS, thus  add them manually through
-# HOSTTOOLS += "getent seq"
+# HOSTTOOLS += "getent"
 
 # Uncomment this to use a shared download directory
 #DL_DIR = "/some/shared/download/directory/"
-- 
2.20.1


