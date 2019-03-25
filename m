Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 438FC60248
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 23:07:39 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id q206so7301297pgq.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 16:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=y1ErJaVsShfMbzN96+hWNICtjUUo7gCGzU2UGTvo1yE=;
	b=aEmV1MmbLEoy6k9b3hLwyb1UGh/z6Ftx5PmGEHngMavT+pUFfigSY4stgPTz9hJxdo
	TL/drXZckTv64yR8eorx1IK283vzzGvT1W53uFz3+KWb8fIKXE3SIdmyScNwsaplMRgU
	LA6Rkfb242YX0PHy/YbWL37jIqMYbsF6UwLl3PTd7Hqd9u5u87LiyDz6xt4Fkl0qqx0W
	zf/Xln1e9cvsWcf7cdwnT4f/Eydjos3HaGuWAEwawhZ3vsSP2LliPGm2LUBPIrWAaZm1
	tTOJYmoftbYYmgyGGJhjoiEys9hn92eCDaTz+H8YLFywzUTmgEthvGj3ImN3Wd2azz6l
	Cgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:content-transfer-encoding
	:content-language;
	bh=y1ErJaVsShfMbzN96+hWNICtjUUo7gCGzU2UGTvo1yE=;
	b=pvoWw2HKzJP4dbyJy1AMNk9dFPYrakGPrlZY9/11SueCbB2842GvQJcfZ1zNvE4/wm
	Vxox6oWP97oxwsdEFBAzc8OSRgdaYmFOawSDUNi0st2shRZKRtJuV2be1YV2CN4jZ5yk
	+Y5dcxMU5PHIGDfKEiuMjcoXAV28dfAK/92jVrAgS66+7JbZ2kOxQcTuJLj3w7cx15ET
	jK0ed1u1F+1kEyR//M/ElgVVpKi/Y1fMouiB/swi2Nn/rLeLKqGHPZkTaJ1DQwxKQlEX
	nU1IpVPMP28NTj6HlGCc18m7QVxzOEKmFlzS17tQTJ3ZaHsh807/st02ao3MG+lcrryj
	dJ0g==
X-Gm-Message-State: APjAAAUt14ZloVMBbhhs/2t8ihoQ97yCjJGoUmNAH2nqDe+2gsXj2S5Z
	7rEIdXBXzJ8m2sAQwKoYH0szUOC5
X-Google-Smtp-Source: APXvYqzC3OaVkivin1My1M30nd4VTBSNPGDTspD+Acv6xKZqx/GtBngRL+Ejx9OCRoLYAM01bsLxvQ==
X-Received: by 2002:a62:4d45:: with SMTP id a66mr629746pfb.250.1553555260033; 
	Mon, 25 Mar 2019 16:07:40 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:3dea:ddac:f0ad:db91?
	([2601:202:4180:c33:3dea:ddac:f0ad:db91])
	by smtp.gmail.com with ESMTPSA id
	k1sm15341862pfo.121.2019.03.25.16.07.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Mar 2019 16:07:35 -0700 (PDT)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <c0e7c451-8e86-bab9-3b19-185dbaae486d@gmail.com>
Date: Mon, 25 Mar 2019 16:07:33 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
Subject: thud][Pull request]
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
X-List-Received-Date: Mon, 25 Mar 2019 23:07:39 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please consider these for the next thud release.


The following changes since commit b79bd7c77635ed45509dfc288c2ca7a2dcf1cc67:

  libpam: libpamc is licensed under its own BSD-style licence
(2019-03-22 14:40:46 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core thud-next

for you to fetch changes up to c48c37a436b3ebfe4d8ca5d12e97a0cdff0e20a1:

  scripts/wic: Be consistent about how we call bitbake (2019-03-24
22:49:54 +0000)

----------------------------------------------------------------
Mazliana (2):
      scripts/resulttool: enable manual execution and result creation
      resulttool/manualexecution: To output right test case id

Richard Purdie (9):
      resulttool: Improvements to allow integration to the autobuilder
      resulttool/resultutils: Avoids tracebacks for missing logs
      resulttool/store: Handle results files for multiple revisions
      resulttool/report: Handle missing metadata sections more cleanly
      resulttool/report: Ensure test suites with no results show up on
the report
      resulttool/report: Ensure ptest results are sorted
      resulttool/store: Fix missing variable causing testresult corruption
      oeqa/utils/gitarchive: Handle case where parent is only on origin
      scripts/wic: Be consistent about how we call bitbake

Yeoh Ee Peng (4):
      resulttool: enable merge, store, report and regression analysis
      resulttool/regression: Ensure regressoin results are sorted
      scripts/resulttool: Enable manual result store and regression
      resulttool/report: Enable roll-up report for a commit

 meta/lib/oeqa/files/testresults/testresults.json   |  40 +++++
 meta/lib/oeqa/selftest/cases/resulttooltests.py    |  94 ++++++++++
 meta/lib/oeqa/utils/gitarchive.py                  |   4 +-
 scripts/lib/resulttool/__init__.py                 |   0
 scripts/lib/resulttool/manualexecution.py          | 142 +++++++++++++++
 scripts/lib/resulttool/merge.py                    |  42 +++++
 scripts/lib/resulttool/regression.py               | 192
+++++++++++++++++++++
 scripts/lib/resulttool/report.py                   | 150 ++++++++++++++++
 scripts/lib/resulttool/resultutils.py              | 131 ++++++++++++++
 scripts/lib/resulttool/store.py                    |  99 +++++++++++
 .../resulttool/template/test_report_full_text.txt  |  44 +++++
 scripts/resulttool                                 |  93 ++++++++++
 scripts/wic                                        |  16 +-
 13 files changed, 1034 insertions(+), 13 deletions(-)
 create mode 100644 meta/lib/oeqa/files/testresults/testresults.json
 create mode 100644 meta/lib/oeqa/selftest/cases/resulttooltests.py
 create mode 100644 scripts/lib/resulttool/__init__.py
 create mode 100755 scripts/lib/resulttool/manualexecution.py
 create mode 100644 scripts/lib/resulttool/merge.py
 create mode 100644 scripts/lib/resulttool/regression.py
 create mode 100644 scripts/lib/resulttool/report.py
 create mode 100644 scripts/lib/resulttool/resultutils.py
 create mode 100644 scripts/lib/resulttool/store.py
 create mode 100644
scripts/lib/resulttool/template/test_report_full_text.txt
 create mode 100755 scripts/resulttool


