Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 838756D05E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 18:36:31 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id e53so857505eek.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2014 10:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=OggVjOCLHJqpuZPLOmi0Ncb7PLvzc/9P92eWsghmmGU=;
	b=ZYnI/hTDWdpafgoeNvce2JIbbQgmcfGiM3KgeogPnBS6TVkKClI+61hslEXwXq3tS0
	9Uaol4cl5JKPp8MVtnteefzBMgWTkxBIBaAXcEEO4vuVjjoD2CP3XAgjcmmCv/fXeRp4
	sQKbYIdWAa2XZpqtTdFBFc22jQtm2Le6dlGnMgaAUiu3e7I65uYXYVsrzebE0U4Pgp4s
	AC2DOoAT05wlPCnVPXfO0J+v0yhgFYyMzBZFXybuHbPa396VjocHvI3/hs3CLWKfeLA0
	2Nq/anslviyKiqNAM9o7iaRZVuS0WOqwr7kyGSvsSww7bOl4fhpJ0M/Pf81Hg/AKoHow
	/9Wg==
X-Received: by 10.15.63.78 with SMTP id l54mr6181241eex.39.1389206192234;
	Wed, 08 Jan 2014 10:36:32 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	p45sm191648922eeg.1.2014.01.08.10.36.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Jan 2014 10:36:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 19:36:35 +0100
Message-Id: <f2898d7f1377da58a36653e4053f84db688e174d.1389206129.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
In-Reply-To: <cover.1389206129.git.Martin.Jansa@gmail.com>
References: <cover.1389206129.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1389206129.git.Martin.Jansa@gmail.com>
References: <cover.1389206129.git.Martin.Jansa@gmail.com>
Subject: [dora][PATCH 2/4] eglibc-initial.inc: Drop duplicate include
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
X-List-Received-Date: Wed, 08 Jan 2014 18:36:32 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There is little point in including the file twice so lets not. The
main recipe already included it.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/eglibc/eglibc-initial.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-core/eglibc/eglibc-initial.inc
index 83b1d2c..0f0e1cd 100644
--- a/meta/recipes-core/eglibc/eglibc-initial.inc
+++ b/meta/recipes-core/eglibc/eglibc-initial.inc
@@ -1,5 +1,3 @@
-require eglibc-common.inc
-
 DEPENDS = "linux-libc-headers virtual/${TARGET_PREFIX}gcc-initial"
 PROVIDES = "virtual/${TARGET_PREFIX}libc-initial"
 
-- 
1.8.5.2


