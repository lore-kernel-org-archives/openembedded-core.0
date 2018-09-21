Return-Path: <nathan@nathanrossi.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 556087988E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 06:27:36 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id q5-v6so2007247pli.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 23:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=oqeKlMScOSA4AaaRiODCjeU+2PdwuLZLp4s6imr6Pug=;
	b=geTUdQmgU9/lXsl+ac8VPBFoiS4KnHaN8UCqg7mby009owViQajkEG79DM+umQSkdd
	sJdFmClXGzNSPmhxXRi+d8ZAn117CjX3QXOTA3V4vVNyDEY7vZXV01aEo2KPXUVrOc3U
	oMTHf18Q1qXXLFTM249T+NNN1D9poK5cZZuJjXCZQguFqf04PoeJyNr7eq+FDZgd1Rxx
	GZ7dE1hx3fLRTQqZhp8xuD4yh5o+gcA2IFs5GJZt90LI+EujQOMkPWeVkBIN4Q1EO8os
	jV7CwLPp1D2G78mE6L4p8vQGnEC/vKkwZDaYXH1wH5mT91KsgkgDMkIaSMy7omUDHPVO
	wTuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=oqeKlMScOSA4AaaRiODCjeU+2PdwuLZLp4s6imr6Pug=;
	b=sUVd9xMCnlKsKZqM+eJmYwOP9wyBNxhnXjuZjAvtjyk3lpNI29FHGLVQEEpe6jlnXC
	P8Vw9K4QObAQBNBLMhL0NraWaXy2wQEM7cfKEwSPxvcxwOqpXMCl0QMmnLEyASCDAjb1
	u+0Rkfzx7ThDQ7EoUUmamh40CpBsGKNJA5B64ColhkYvnMI982RMGY25Dc+Cai7YmDSN
	p8CjgLSMCM3FG4oJtKO7r7SKJze4ZBykcgJERl8oT24afoddfKZwLqqkPvAb42ygwwDv
	QMA+RhmWn/fC/J84fjcnNqrzIdJZ3aHdcgwSs7foCC0gSEPksUele0N9drJRFsdzFicg
	MJgQ==
X-Gm-Message-State: APzg51BSaohQTkAIaZMelKjKSjyh1kvPVzvZTrkDjZbR/U9c5Ys9kOeP
	g0N9JTVs9ctObY8YgZP6xZiomw==
X-Google-Smtp-Source: ANB0VdZfFb1S4xhf/KscqnqKzzoHOzxFuYG4gXZ05g82RuLdoBD8PuwgDklNf/mcaXKI295vMWqnIw==
X-Received: by 2002:a17:902:9a8a:: with SMTP id
	w10-v6mr41855410plp.14.1537511257419; 
	Thu, 20 Sep 2018 23:27:37 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.120.183])
	by smtp.gmail.com with UTF8SMTPSA id
	u83-v6sm74594731pfj.37.2018.09.20.23.27.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Sep 2018 23:27:37 -0700 (PDT)
Date: Fri, 21 Sep 2018 06:27:31 +0000
Message-Id: <20180921062731.5149-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/3] siteinfo.bbclass: Add LatticeMico32 architecture site info
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
X-List-Received-Date: Fri, 21 Sep 2018 06:27:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Add the basic architecture site info targets for the LatticeMico32
architecture. This architecture does not target Linux.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/siteinfo.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 86bb853be2..d6da55d668 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -30,6 +30,7 @@ def siteinfo_data(d):
         "i586": "endian-little bit-32 ix86-common",
         "i686": "endian-little bit-32 ix86-common",
         "ia64": "endian-little bit-64",
+        "lm32": "endian-big bit-32",
         "microblaze": "endian-big bit-32 microblaze-common",
         "microblazeeb": "endian-big bit-32 microblaze-common",
         "microblazeel": "endian-little bit-32 microblaze-common",
---
2.19.0

