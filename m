Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBE677DB7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 14:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490969254; x=1522505254; h=from:to:subject:date:message-id;
	bh=t1EzBPRn94XYziyA1sCC8+u5+FHKWcFvb+2Dsci//4A=;
	b=LmoiTyo3cfk5g0mm6g87JzKawc9gtKhPRLbchK66RV59TRIFG1dZiQSO
	DEVUpDlzZ1hF+K9kWc2lKEL62GRhag==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Mar 2017 07:07:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,252,1486454400"; d="scan'208";a="1129337588"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 31 Mar 2017 07:07:31 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Mar 2017 17:07:28 +0300
Message-Id: <20170331140730.27171-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 0/2] Tools for visualizing build performance test results
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
X-List-Received-Date: Fri, 31 Mar 2017 14:07:32 -0000

This patchset implements two new scripts for analyzing and reporting build
performance test results. The first script is a tool that is able to generate
test reports from build perf test data stored in a Git repository. Both
plain text and html output formats are supported. The second script is a helper
for converting these (HTML) reports into a format suitable for emails and
sending them.


The following changes since commit 49772e1a1f291d1cacce27b381009dbb441c483e:

  distutils3.bbclass: Fix path to python for scripts (2017-03-31 10:09:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/buildperf/scripts
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/buildperf/scripts



Markus Lehtonen (2):
  scripts: add oe-build-perf-report script
  scripts/contrib: add oe-build-perf-report-email

 scripts/contrib/oe-build-perf-report-email.py      | 266 +++++++++++
 scripts/lib/build_perf/__init__.py                 |  31 ++
 scripts/lib/build_perf/html.py                     |  19 +
 scripts/lib/build_perf/html/measurement_chart.html |  50 ++
 scripts/lib/build_perf/html/report.html            | 209 ++++++++
 scripts/lib/build_perf/report.py                   | 342 +++++++++++++
 scripts/lib/build_perf/scrape-html-report.js       |  56 +++
 scripts/oe-build-perf-report                       | 531 +++++++++++++++++++++
 8 files changed, 1504 insertions(+)
 create mode 100755 scripts/contrib/oe-build-perf-report-email.py
 create mode 100644 scripts/lib/build_perf/__init__.py
 create mode 100644 scripts/lib/build_perf/html.py
 create mode 100644 scripts/lib/build_perf/html/measurement_chart.html
 create mode 100644 scripts/lib/build_perf/html/report.html
 create mode 100644 scripts/lib/build_perf/report.py
 create mode 100644 scripts/lib/build_perf/scrape-html-report.js
 create mode 100755 scripts/oe-build-perf-report

-- 
2.10.2


