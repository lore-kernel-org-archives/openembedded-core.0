Return-Path: <raj.khem@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id B88F2731CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 18:00:23 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id 65so12706655otq.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 10:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZBuCLSPVtRKz7QTsuv1KRfdyX0Zmw6kmi6A5mOFmLHM=;
	b=n/01RpFH/boXDj1woon5Bi3LtoVvaM7DwMsipbXj3TKfVCe24s2QkY2pLP2euXOgCd
	pgk2fMhl8SeUFlGjGq6gIlq9lr8wI69fjnUaatCMahMZMAUDr7EgCCvM2VRCHin4ddaz
	EjLVTTqeRYXV+TCdHvXhclBdR9uU8/lZma6KC7U7/uXF8vIeN1tJRtoGr2EUPIPU5N//
	SNWu5XqoJeoaxg6iIqrbHF0YCqkh0I2nYIXuoYF3o+UZSOpBlOMrdWHqrJrng23YgdU6
	t+zuYpe5n2sD6vfJiEdQ/EscQXX5guzBZNP4y9R847hpAKdPDFF/FEua4mcJE9J6HOhH
	y0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZBuCLSPVtRKz7QTsuv1KRfdyX0Zmw6kmi6A5mOFmLHM=;
	b=G6IkEIFDQ3T3jXHvCkfaQeY/JkS2RKo52sFJf5HF+qFcn9WUt+La2KEVY374TX3yFQ
	uk6fnDhJfTpO5OxW1g4soWyznp2kZ0IFDoo2LS4qo13Pbo/2mTudSUZd4uLS+uGx/FBK
	nm5F7qN+3mq2oXh+cPqmOKFAM4hMXOYYDuiN67CFIzXBggOm3BQ3jebOSF9h0c4VnjQA
	RhNV68LE+Y3xlr0KDuDTdTyj8M4fXfKUkVuVZof7PuNnsjKMePplF/A7naa71fGULLjU
	HTML/5Bj2cIuc+U7d80gkKE0GeMsjvIyXjbwhjhhJzITPTi4++yYAAXE5cfvj4ekTp5x
	/dbw==
X-Gm-Message-State: AMke39mCgyjN5RS2JoPy0adxVU7p1SyzGGgs1xLTIWeGUrHCbDrE/8EfbSCp1RFi/Dk3RQ==
X-Received: by 10.99.65.67 with SMTP id o64mr27968197pga.119.1487008823975;
	Mon, 13 Feb 2017 10:00:23 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	s21sm15995127pgg.65.2017.02.13.10.00.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Feb 2017 10:00:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Feb 2017 10:00:10 -0800
Message-Id: <20170213180012.14077-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH 1/3] musl: Update to latest
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
X-List-Received-Date: Mon, 13 Feb 2017 18:00:25 -0000

here is shortlog

* d6601f0a avoid unbounded strlen in gettext functions
* dbbb3734 fix use of uninitialized pointer in gettext core
* 01e6bbec fix bindtextdomain logic error deactivating other domains
* 6894f847 fix spurious EINTR errors from multithreaded set*id, etc.
* 1f53e7d0 fix crashes in x32 __tls_get_addr
* 27b3fd68 fix crash from corrupted tls module list after failed dlopen
* 809ff8cf treat base 1 as an error in strtol-family functions
* 786fda87 fix getopt[_long] clobbering of optopt on success
* 150747b4 reduce impact of REG_* namespace pollution in x86[_64] signal.h

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index e9b9fef601..5e293cfc13 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "769f53598e781ffc89191520f3f8a93cb58db91f"
+SRCREV = "d6601f0af0452b218d247cb47513fc9cd6bbf2e2"
 
 PV = "1.1.16+git${SRCPV}"
 
-- 
2.11.1


