Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id BA0FD7D0B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 23:28:21 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id z9so1025507pgu.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 16:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=to:from:subject:openpgp:autocrypt:message-id:date:user-agent
	:mime-version:content-transfer-encoding:content-language;
	bh=SxqpEcT+/1FP99wlyUFkrpSxDF50gJkXITDiVX5JNrs=;
	b=YHBiTytDWLzFKJCcezy/fbM75Yn54txLzYjOEtDMyrqwNUjkGBVEd7XdXg5MA+8rFZ
	fEXGsNx4sqQcsKRnI8XBv4hHzFtxhnjupRiaFULJByyKxQr2tVV4nwSdHMnS8m5CDxIG
	42AjinCa9OOD3r22K+nF50iXEftjrVIcEi1Euafl22hnmI9DT6oshfyppqVpdHQKy2Xj
	mn0Ua9vninOxkwfh9ddysrtpWEskEcuzXnVHedD/2C6SCPFIRQdPDp2ZqnBo5QEgcwoQ
	iIUFENPlOWCaWL295xGYm5Y/fq65AUKr1reh6kLOpUVnRW1kGBB/gbkzwgnnV/PGfKPw
	LBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:content-transfer-encoding
	:content-language;
	bh=SxqpEcT+/1FP99wlyUFkrpSxDF50gJkXITDiVX5JNrs=;
	b=bNY0AxVAtDMs0hhl7odMtl+HShhPe8SQY+7mq4XR1WQkQpRS76E1+oWZ2F2u35g/xC
	X+q5N4V0V7Mg4HQ/abfFDuOPLp856xtcRpPbdY6h6DVjZMD7B0GcbomgxHdxmawpjY3C
	3KxWKu4W9Iylmda966rxG6JKG1E2fN7LoHv2vieY+NCoJKuWMtGbjzytgkAbtvxMO0nL
	wlRGtvy/4oxPR4fC9uKgVBXJnpWwZrZ8HW1gLguJGA0KgDs1O9z2sLszi7MiD8+GA0Lo
	EDasTLCNLwte3HuHKsuBRUvlw/6HEROXx/TScDquXt3E+RBYnyLaT+erFpi6caeCU8rM
	l25g==
X-Gm-Message-State: APjAAAUsCkho+BuTN/8qJZ8Aoo7ZPDoY1P53uV8c8pQrWaZ8yQeZs1qS
	N41oEr8RcvXsrbm2FhUaxml/48kZ
X-Google-Smtp-Source: APXvYqxONBk1rOXyiu5dO2rgvS+nU5DT+tud//9jErwixKFkEjT/Da5PIXH4qJoDiorVzbLBbc5aHg==
X-Received: by 2002:aa7:80c8:: with SMTP id a8mr27134749pfn.193.1553556502676; 
	Mon, 25 Mar 2019 16:28:22 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:3dea:ddac:f0ad:db91?
	([2601:202:4180:c33:3dea:ddac:f0ad:db91])
	by smtp.gmail.com with ESMTPSA id
	u15sm25359510pfm.163.2019.03.25.16.28.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Mar 2019 16:28:21 -0700 (PDT)
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <8332bd4b-0c7e-bb71-2a7f-16446676f728@gmail.com>
Date: Mon, 25 Mar 2019 16:28:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
Subject: sumo][Pull request
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
X-List-Received-Date: Mon, 25 Mar 2019 23:28:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Please consider these changes for the next sumo release.


The following changes since commit 4af5a794497746629a35726ce515556b53d40da9:

  lttng-tools: update to 2.9.11 (2019-03-24 18:39:35 -0700)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core sumo-next

for you to fetch changes up to 94a3ca85d30fc957f8f01a216a75342be49f9143:

  oe-build-perf-report/gitarchive: Move common useful functions to
library (2019-03-25 23:12:08 +0000)

----------------------------------------------------------------
Mazliana (2):
      scripts/resulttool: enable manual execution and result creation
      resulttool/manualexecution: To output right test case id

Richard Purdie (13):
      resulttool: Improvements to allow integration to the autobuilder
      resulttool/resultutils: Avoids tracebacks for missing logs
      resulttool/store: Handle results files for multiple revisions
      resulttool/report: Handle missing metadata sections more cleanly
      resulttool/report: Ensure test suites with no results show up on
the report
      resulttool/report: Ensure ptest results are sorted
      resulttool/store: Fix missing variable causing testresult corruption
      oe-build-perf-report: Allow branch without hostname
      oe-build-perf-report: Allow commits from different branches
      oe-build-perf-report: Improve branch comparision handling
      oe-build-perf-report: Fix missing buildstats comparisions
      scripts/oe-git-archive: Separate out functionality to library function
      oe-build-perf-report/gitarchive: Move common useful functions to
library

Yeoh Ee Peng (4):
      resulttool: enable merge, store, report and regression analysis
      resulttool/regression: Ensure regressoin results are sorted
      scripts/resulttool: Enable manual result store and regression
      resulttool/report: Enable roll-up report for a commit

 meta/lib/oeqa/files/testresults/testresults.json   |  40 ++++
 meta/lib/oeqa/selftest/cases/resulttooltests.py    |  94 ++++++++
 meta/lib/oeqa/utils/gitarchive.py                  | 244
+++++++++++++++++++++
 scripts/lib/resulttool/__init__.py                 |   0
 scripts/lib/resulttool/manualexecution.py          | 142 ++++++++++++
 scripts/lib/resulttool/merge.py                    |  42 ++++
 scripts/lib/resulttool/regression.py               | 192 ++++++++++++++++
 scripts/lib/resulttool/report.py                   | 150 +++++++++++++
 scripts/lib/resulttool/resultutils.py              | 131 +++++++++++
 scripts/lib/resulttool/store.py                    |  99 +++++++++
 .../resulttool/template/test_report_full_text.txt  |  44 ++++
 scripts/oe-build-perf-report                       | 124 ++++-------
 scripts/oe-git-archive                             | 166 +-------------
 scripts/resulttool                                 |  93 ++++++++
 14 files changed, 1314 insertions(+), 247 deletions(-)
 create mode 100644 meta/lib/oeqa/files/testresults/testresults.json
 create mode 100644 meta/lib/oeqa/selftest/cases/resulttooltests.py
 create mode 100644 meta/lib/oeqa/utils/gitarchive.py
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


