Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7F210605BA
	for <openembedded-core@openembedded.org>;
	Thu, 21 Jul 2016 20:03:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jul 2016 13:03:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,400,1464678000"; d="scan'208";a="1026595594"
Received: from yctb04.ostc.intel.com ([10.54.69.58])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2016 13:03:36 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@openembedded.org
Date: Thu, 21 Jul 2016 12:02:04 +0000
Message-Id: <1469102526-48920-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 2.5.1
Subject: Enable xml output in OeTest class for report consumers
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
X-List-Received-Date: Thu, 21 Jul 2016 20:03:42 -0000


You can take a look at the bug 9682[1] where tests and sample logs are attached.
This patch assumes the xmlrunner[2] module in the system where oe-selftest will
run. if the xmlrunner is not there, it will default to unittest.

As it is now, it will change partially the text output format of the command
line but a bug will be filed for fixing that up. Reason being that is better
to fix it at the xmlrunner than recreating the functions to fix it. See the
summary of changes at the bug's attachments.

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=9682
[2] https://github.com/xmlrunner/unittest-xml-reporting

