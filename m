Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f176.google.com (mail-ea0-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id D77E06E722
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 14:02:19 +0000 (UTC)
Received: by mail-ea0-f176.google.com with SMTP id h14so2188335eaj.21
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jan 2014 06:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=iEYcag8+dsiWkvYBdOPfIBuPXhm4zIEF7htsM9Ewic0=;
	b=ofBDN3j1QFfvW/VbtAkJR4qWI4rA14xx1EPZQ8rw6B5z0EKk6DMXvftZOex/QO5Szd
	2vy71F1WVWZirp6IOQRuO+0gczuD27/aPYHW6NgrZFmlSNIHRv8NiZomODlkQuSUONY8
	GLPKp22IskQ2BbT9JhFzy4pv9QUsDI1540IvE5kqW2RlN7uVCiT+3M1UsOuHmj2RfixZ
	0ZsH4vcW/bqEww+jx/RmpzF4bPUATh7A7G/u5tDVSbLixSuch3U57uQwbZnizZiuqm5Z
	UllGaCUUeMBqGrOP5V0T/LtTgGdVG47gCeA0D/KKZFhvst7zKDx102KXigWyViBPx6GK
	N4nw==
X-Received: by 10.14.32.132 with SMTP id o4mr8280609eea.14.1390053740528;
	Sat, 18 Jan 2014 06:02:20 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107]) by mx.google.com with ESMTPSA id
	j46sm35501232eew.18.2014.01.18.06.02.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jan 2014 06:02:20 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jan 2014 15:02:38 +0100
Message-Id: <cover.1390052619.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.2
Subject: [PATCH 0/2] sstate improvements
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
X-List-Received-Date: Sat, 18 Jan 2014 14:02:20 -0000

Include native/cross/nativesdk deps in target signatures to make sstate
reuse a bit safer.

Make allarch a bit more independent on TARGET_* variables.

The following changes since commit 8163854adf87ac42a8f08ee25685d0ce1efb4724:

  oe-selftest: separated the SStateBase and SStateTests in different modules (2014-01-16 12:18:44 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib jansa/sstate
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/sstate

Martin Jansa (2):
  sstatesig: include native/cross/nativesdk deps in target signatures
  allarch: Set empty TARGET_PREFIX and TARGET_FPU

 meta/classes/allarch.bbclass | 2 ++
 meta/lib/oe/sstatesig.py     | 4 ----
 2 files changed, 2 insertions(+), 4 deletions(-)

-- 
1.8.5.2


