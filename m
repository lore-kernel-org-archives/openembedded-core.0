Return-Path: <mihaix.lindner@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 523816AEA2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 17:33:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jul 2013 10:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1021,1363158000"; d="scan'208";a="362143220"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 08 Jul 2013 10:34:31 -0700
Received: from [10.237.105.37] (unknown [10.237.105.37])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 82E086A4093
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 10:33:29 -0700 (PDT)
Message-ID: <1373304800.2546.57.camel@mlindnex-mobl1.ger.corp.intel.com>
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 08 Jul 2013 20:33:20 +0300
Organization: Intel OTC
X-Mailer: Evolution 3.6.4 
Mime-Version: 1.0
Subject: RFC: oe-selftest script to run automated tests against bitbake tools
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
X-List-Received-Date: Mon, 08 Jul 2013 17:33:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello all,

The idea of "oe-selftest" would be to have an extra method of testing to
cover what's not addressed by sanity tests, bitbake-selftest or image
run-time testing. More information and some example tests are posted in
the related bug, here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4740

Before starting any work on this, maybe we can gather some thoughts,
comments, here or in the bugzilla entry, something in the lines of what
kind of tests should it run or not, what would be the usage scenario,
etc.

Thanks,
Mihai



