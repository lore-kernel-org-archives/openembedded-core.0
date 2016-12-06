Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id A3ED771A68
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 18:07:09 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id h133so22909027ioe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Dec 2016 10:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=DvEC+YF+Vn0bmRlNrbD3GEtqZiSomPIYzehcaIMnpd0=;
	b=E0ay6u0xE94EF/kqZSokmwfB+Ym5B2RhLXTft44GwMv3zdQLgB+wQs29999J8yza9t
	MGiKHImLpI0r4FgCFBn1/wsJT7FNPHDMvE/Z6R2jtruP1n4NVkOSDZKiqQJS/De0J5vh
	mx117YbGFEqLYxYZPqMP1TuKr97cLTm/dDNBwLUTFlqEqh3ZImB3m1zXvRMl0edbTtJI
	XZ5njyD+PrE3+GdoRtXb/eIRS1eFZlZL5RD0Z+V+v8ODG4tHVTz5STYQJW2wWeC7fyJ0
	V53Qn0tPWREehC4tEPKu04bGQHiQ2bYRnDL/XJdUzaWZhKRQEFujnqxVOTzQ0lCizWkb
	MxXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DvEC+YF+Vn0bmRlNrbD3GEtqZiSomPIYzehcaIMnpd0=;
	b=AAIhHY98N7u3W1vtY1WJF4JF5+uU536oWw1OehdFR1DVm6xumaKS5PomDFyWUrxCQD
	vOhg2lxk8cym2b19TsyMFcFEfQ1KbNCHAtmk+KEex/xZswbgmF1Amd9QQBFdmrTlTLvv
	0M4SBxXJDlLi1d23WtDzAEsDRTNICk7ooPpiEhoLY1jkiUBC7gJYKbtI4e1OpW++JvuR
	QHHDpGMq8p7XS/An2RtDuKzn+DgzbjMw2wdqUlsdJl94pnTUbe9Z3WAQEuoJmW13S33C
	8WdMtUdTxnJJczMFvC57+DImLfjJRFg9HIP8gUeTg/SjILkeS54xtGYU30Qqyq3WbbTa
	EOpg==
X-Gm-Message-State: AKaTC02JCU2LWkmKqzTpAE8ME32PusdCYAZ0BEBfXiBEt2lr2Oj7NPDRPiqxPp/IIyvumQ==
X-Received: by 10.107.147.10 with SMTP id v10mr51842695iod.63.1481047630560;
	Tue, 06 Dec 2016 10:07:10 -0800 (PST)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	p140sm1816402itc.22.2016.12.06.10.07.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 10:07:10 -0800 (PST)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 12:06:40 -0600
Message-Id: <cover.1481043778.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.9.3
Subject: [morty][PATCH 0/2] Resolve gdb-cross-canadian dependency on imp
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
X-List-Received-Date: Tue, 06 Dec 2016 18:07:09 -0000

Add imp to python3-importlib. Make gdb-cross-canadian depend on
nativesdk-python3-importlib when python is enabled.

The following changes since commit c8d96b10ee3bc2eae0fd269d2564286fd0bc82ed:

  rm_work: Ensure we don't remove sigbasedata files (2016-11-16 10:34:34 +0000)

are available in the git repository at:

  git://github.com/gmccollister/openembedded-core morty-gdb-cross-canadian
  https://github.com/gmccollister/openembedded-core/tree/morty-gdb-cross-canadian

George McCollister (2):
  python-3.5-manifest: Add imp to importlib
  gdb-cross-canadian: Depend on nativesdk-python3-importlib

 meta/recipes-devtools/gdb/gdb-cross-canadian.inc     | 3 ++-
 meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

-- 
2.9.3


