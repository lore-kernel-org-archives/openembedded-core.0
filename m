Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 850BA78B70
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 15:40:53 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id k3-v6so11227326iog.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 08:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lFlGr/1Sv6k9pIbYf7lOzH6G9FqTNUhGLyXlfUZ1aW4=;
	b=UGd3rNWXFt3lF/EIEXCGcuPUk6UYDg6vCKpN59GreZ21blk48T4NL/1AvkuOGPTfK6
	cy+sY9Ie3ES2RapJ9pxY+ap1YE0OQs6q5RrQ93xxHFdnKUfvrBp1APANwXWdkReJQcwV
	54dMIRSPHq/1H9yv8xym+w8zlIFSsfqYz3FxVqp3yr/lG//6+mkjzjFHe9hmuuzJVk/q
	1NLB54eOpzU0RMvFEaj3lZ8sQN7uzL2ih0mqKYDEKrRVVGAY0JnhmyZySncXtCK7jRqy
	TVFyd1iTXUotUwPCOSefdS986I3m30rCCm+IUToX83v30nQFkqt7kyP4lD4aE24aU2XE
	zMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lFlGr/1Sv6k9pIbYf7lOzH6G9FqTNUhGLyXlfUZ1aW4=;
	b=hoTzN1Ey0WzATnkcSNUMUlZH4K+bwUV6IQg4012mUnO4eHbs3U8Oa8FplMKlsJCc5T
	3fdHP7auIV8qnpotZjjX9HIKJvhUtGk/fRWECivDX5y+d8Ox+n9K52WRalr9P4uC7xP1
	nlLaHNTDzGGQj0m56L5DvLXXzBuR7Pr5oNfLSG/tRVJDVMCd2CUrSUniCidbEpdxXvyK
	5zSHeAFfKWo7NIQ95/wfy3VtRY+04DJMR6NS6imoinS/tqMpyZ52FuhpEpfMMWiNkLbU
	OE8MekOB1DNr2ehrZzmGsyqwGG6q1Dnp412y5V9MQvFkBl/ZCXuqLzrBLbjkySzMrER1
	KTQQ==
X-Gm-Message-State: AOUpUlF9dQzGov4AUozLDx55KC40dTE1kZBPv6I+aNezgLM2/TynagpX
	F24nMNeRH/VZfO93AJ4Di72wPLoT
X-Google-Smtp-Source: AAOMgpd8r3o02KjbIL0N/9xRxPO3eikaIpoPHJUeYJii5qBlqqdlIpEti8AZdV+iBExnrfRrsLwzjg==
X-Received: by 2002:a6b:9bd1:: with SMTP id
	d200-v6mr9615101ioe.147.1530891654555; 
	Fri, 06 Jul 2018 08:40:54 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	v190-v6sm3663726itc.30.2018.07.06.08.40.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 06 Jul 2018 08:40:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri,  6 Jul 2018 10:40:18 -0500
Message-Id: <20180706154018.28658-3-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180706154018.28658-1-JPEWhacker@gmail.com>
References: <20180706154018.28658-1-JPEWhacker@gmail.com>
Subject: [PATCH 3/3] classes/sstate: Remove unused argument
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
X-List-Received-Date: Fri, 06 Jul 2018 15:40:54 -0000

Removes an unused argument to pstaging_fetch()

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/sstate.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index a78d07c41d3..5a0722567a5 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -300,7 +300,7 @@ def sstate_installpkg(ss, d):
     sstatepkg = d.getVar('SSTATE_PKG') + '_' + ss['task'] + ".tgz"
 
     if not os.path.exists(sstatepkg):
-        pstaging_fetch(sstatefetch, sstatepkg, d)
+        pstaging_fetch(sstatefetch, d)
 
     if not os.path.isfile(sstatepkg):
         bb.note("Staging package %s does not exist" % sstatepkg)
@@ -635,7 +635,7 @@ def sstate_package(ss, d):
 
     return
 
-def pstaging_fetch(sstatefetch, sstatepkg, d):
+def pstaging_fetch(sstatefetch, d):
     import bb.fetch2
 
     # Only try and fetch if the user has configured a mirror
-- 
2.17.1


