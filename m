Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 481556093B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 15:40:48 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id g4-v6so1036354iti.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 08:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=+trBofdMAT2sxpw6aqP0VYjqu0JG35OT5uTSZfCBaDc=;
	b=g8L+e25IdPB1iZILhoq71/dm7/IeNhWwMaGiWgqFBtoLd+AFbgc7HkiVl1xqOXmiO5
	sAOFiE7q9ykYuRwmgzVbJlOBNV6i7QX5ZnuhJYgmN8tkNIPHTm7iCENXR9E6RF+W0VHu
	kOCTsMosF3E56U4j2qG5CYcRIhetl8Lx/onP1lqf/vdiT+Hz8T+xPUvgu5Bvfzmns+3S
	W0ZA6+B4NJFVOTFitkGDAxZIKzunOsHGSkkgsfjlWG1D59Ey4Pd8DMuYdyIoPzTJb+la
	9syaIw6ycnZAgxwrasOdp4gxFKsnL8kDvWEho0J/IztY8CY3bhYYaNGLq86zi9XktKKE
	gTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=+trBofdMAT2sxpw6aqP0VYjqu0JG35OT5uTSZfCBaDc=;
	b=IVs+eC0ePD5WeRvNvPmalEHLY9DErxKH2TlnJBo0bOQuu+fnvszimXW4Dy5WVtFPS4
	7wZDd30i9JAQWI8JtCKwOMlfVNlfEO8nGNbT5UPxNsHzMQnHjE0hisFRChXbw2vG609w
	Vi2mzHFF8Nc2oA4U14wQEQ6SdNbQ5/F7/JgKWXVm/5UfDmsnk9lcQ1ejy1yKryieC61t
	5JKqBizGXoj7JRPlBiEJkAgBbmoZ9qxk0et6qphPN9lodLEIQxDQBYvxOMLhrs/upS+B
	327wEPgOTAgAxdBU6GqfLb9ume60awoMfiQkdxoufIh5MnBDKqNAGrhst978h5V/L0Kg
	fMCg==
X-Gm-Message-State: APt69E0E4366reWR3zFh/FmTyfYDHeokaVUrb+xsJCuop5o62bqQLPfo
	Fxgwl0x31J+ysVHLeh+zKpzREX7a
X-Google-Smtp-Source: AAOMgpfbOabsf80lE1L7anQtHouuUXgZ84/KYDSz7oPQFw30MVr2kPZaG30NUJeSaYYpWZKiavO9KQ==
X-Received: by 2002:a02:3407:: with SMTP id
	x7-v6mr8970156jae.110.1530891648894; 
	Fri, 06 Jul 2018 08:40:48 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	v190-v6sm3663726itc.30.2018.07.06.08.40.48
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Jul 2018 08:40:48 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri,  6 Jul 2018 10:40:16 -0500
Message-Id: <20180706154018.28658-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 1/3] sstatesig: Remove trailing whitespace
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
X-List-Received-Date: Fri, 06 Jul 2018 15:40:48 -0000

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oe/sstatesig.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 0aa577d44d2..5dcc2f5cd6d 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -45,7 +45,7 @@ def sstate_rundepfilter(siggen, fn, recipename, task, dep, depname, dataCache):
 
     # allarch packagegroups are assumed to have well behaved names which don't change between architecures/tunes
     if isPackageGroup(fn) and isAllArch(fn) and not isNative(depname):
-        return False  
+        return False
 
     # Exclude well defined machine specific configurations which don't change ABI
     if depname in siggen.abisaferecipes and not isImage(fn):
-- 
2.17.1


