Return-Path: <nathan@nathanrossi.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 289CA6FF97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 04:29:40 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id tt10so57252851pab.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 20:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=tnqjeFw9mwdVzqL2AYKQtKCoFHc9tM6wkcT5wM6jk+o=;
	b=NoJ40lONGw+ik69dScmORiGdClqlIbexKeXmg8ef09tVggz5S/b4MY3ii97W25U399
	sZW7nCM8z+WDu7EK8xMBTFfvLlag4vjZOu5BDe5u0TAEUNVb6t9/B81QxMnE2mOM4iDB
	rGwULiQcgummzPMqZ7opbVmeJKOZqXfq1L3Gtlel53Btcg1o64BHFJkyWF8a7tHokyJm
	SEe5K5x5LscJLChzafSMyh32rlIeWneM2/HHMYqCDAwyKAz2n3W/15KjC5cBBqbqY4vv
	4m585MXHVpSZ6JXM3GgDdiuWOobi5ymcCPERnSPEWYGmGZ610qEsT2vpig2Oj0nNMUqB
	NFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=tnqjeFw9mwdVzqL2AYKQtKCoFHc9tM6wkcT5wM6jk+o=;
	b=hCaylVzEjZ0qKiO2P19cyfSoW2QpD2NG0k/w+uftHinwoXAocYh/FthSZeY1GgcG1u
	cCjgcsujzh0qmsl6xEYOrD+v/typeiGKjchRD9NeCSAdS4R6ei15d4WH61dzEGnuXKmk
	2W/kZou7FB308ZmF4jpy/0DQYbnh7NFLy5VbH5PzNgKIvkY8C1MuF1/kadHcUKc2B0+f
	QmMR2IDLIvYMaRRbKZXjFyOgz5BylvNOueQ5eMiVrdN2lY0D6TLYd3bDkTD3ITC8S1HO
	uEJS0mMTlC2kOL+XaRyubIYbcdSWdPPn4DqX5EV/GvF97SC2CKdXpFG+ELvMtIXnDjhi
	TP0g==
X-Gm-Message-State: AD7BkJJSEGg51sQTnsi3IT0VhnO3J9aqh0ngYn3Z4t+puqkFuF4mIHtdUiTAZfT0mDgQ5Q==
X-Received: by 10.66.235.129 with SMTP id um1mr342920pac.17.1457584181797;
	Wed, 09 Mar 2016 20:29:41 -0800 (PST)
Received: from nathanbox.home.gateway ([101.162.5.44])
	by smtp.gmail.com with ESMTPSA id
	zu10sm1573742pab.31.2016.03.09.20.29.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Mar 2016 20:29:40 -0800 (PST)
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 14:29:31 +1000
Message-Id: <1457584171-9122-1-git-send-email-nathan@nathanrossi.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] gcc: Disable libitm for MicroBlaze
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
X-List-Received-Date: Thu, 10 Mar 2016 04:29:42 -0000

Disable libitm as it is not supported on MicroBlaze.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
This patch is based on master-next, so that it cleanly applies on top of
the nios2 change.
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 312103c..d4cfe08 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -16,6 +16,7 @@ RUNTIMELIBITM_mipsel = ""
 RUNTIMELIBITM_mips64 = ""
 RUNTIMELIBITM_mips64el = ""
 RUNTIMELIBITM_nios2 = ""
+RUNTIMELIBITM_microblaze = ""
 
 RUNTIMETARGET = "libssp libstdc++-v3 libgomp libatomic ${RUNTIMELIBITM} \
     ${@bb.utils.contains_any('FORTRAN', [',fortran',',f77'], 'libquadmath', '', d)} \
-- 
2.7.0


