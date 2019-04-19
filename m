Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id 292467D280
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Apr 2019 02:57:32 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id p23so3468601iol.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Apr 2019 19:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=R2ilW70vZlPCd/8HYAWWgUVBl7lzxHC97A22RFv0YV0=;
	b=StzQdOoaleC0siO3MHVGvIzTGE24vdmfFU55pFtlg5Br/w0LM8C/HpB9HPQsIOY57T
	AGZNnS/GlquA6MczMRjPlOxsqBVJZqFIShyJbW/XJdEFL9viKK36yKjp/1/xDplFH4gg
	bgUkStFT8ScJbaA/8CLw6iFYeVA1OKJR+2bXmeWpExo/CCW9xO19WwFAdmoyoCObw3zZ
	s56nLYUghqhN4qMtZAyF4eP3vt+O+Cn9JjqU8DNIb0Te+PEqg3kkzmg+J8fL3+70naAJ
	GK6iudEX9k8xF5OZQ8CyWy0Kiw/UkR+yuF9MKZLdNHPdIBc0+f6pP8Mk17ztPti/A8q/
	b/EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=R2ilW70vZlPCd/8HYAWWgUVBl7lzxHC97A22RFv0YV0=;
	b=Udch9eyvdqy1JtwSlgFPTKfq5OY8XbGkVCJc7fTS8iqpaFrDpAsNEdZ2fZui5u/CaX
	nMOGipXLG4pRbpQep0B+DCQoYmj/4F3U4mnrjIdkbz8XuQa9hGA0FWU5NmwEEcRFXSmA
	mPnudvBXEw7py6nxIAJsxWLi42yBfoqP22pasqh8Fy2tCw1LCJYomXtRLitohgnRHDVr
	u9FPUvvoHie84gTjjcyymxsBHYY825P6AG753oA+T3W5MH2jxCahR9EFu95TmxzzjlXu
	Ow8NtP7taUXA7S0oc7MAeYmAjUNRGCeOHTdVbQwsnsa4fjsezBlLxCz0gRddnBfO/Ik/
	LSlw==
X-Gm-Message-State: APjAAAXkVo9YtULNeDN8Ipy7i2KEbvCaK4EurthENIR87v4LI3gmEYis
	8/9CJFjGCwfjc+nZARLfU9jafj/XBnQ=
X-Google-Smtp-Source: APXvYqwqrOTLaB4QdUaLVxOSYpJVTkZYe3v60Yq0xEwozrEF4CTEy4WS1Fw1XK12NrwQKGyS64NZSw==
X-Received: by 2002:a6b:700a:: with SMTP id l10mr1137424ioc.270.1555642653785; 
	Thu, 18 Apr 2019 19:57:33 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	137sm1796885ita.22.2019.04.18.19.57.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 18 Apr 2019 19:57:32 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Apr 2019 21:57:16 -0500
Message-Id: <20190419025718.15348-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 0/2] resulttool improvements
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
X-List-Received-Date: Fri, 19 Apr 2019 02:57:33 -0000
Content-Transfer-Encoding: 8bit

Implements 2 improvements to resulttool:
 1) Result files can be loaded over http or https
 2) Adds a new subcommand to extract logs from result data

Joshua Watt (2):
  resulttool: Load results from URL
  resulttool: Add log subcommand

 scripts/lib/resulttool/log.py         | 56 +++++++++++++++++++++++++++
 scripts/lib/resulttool/merge.py       |  8 ++--
 scripts/lib/resulttool/regression.py  |  6 +--
 scripts/lib/resulttool/report.py      |  2 +-
 scripts/lib/resulttool/resultutils.py | 23 +++++++++--
 scripts/lib/resulttool/store.py       |  4 +-
 scripts/resulttool                    |  2 +
 7 files changed, 87 insertions(+), 14 deletions(-)
 create mode 100644 scripts/lib/resulttool/log.py

-- 
2.20.1


