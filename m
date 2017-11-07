Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 1D74F78426
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 09:39:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Nov 2017 01:39:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,357,1505804400"; d="scan'208";a="1240739769"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga002.fm.intel.com with ESMTP; 07 Nov 2017 01:39:49 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id 6E9895801E1;
	Tue,  7 Nov 2017 01:39:48 -0800 (PST)
Date: Tue, 7 Nov 2017 10:27:25 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Tom Rini <trini@konsulko.com>
Message-ID: <20171107082725.lzsbsnqrypbm525v@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <1506015977-16858-1-git-send-email-trini@konsulko.com>
	<20171010210149.GE12015@bill-the-cat>
	<20171020131505.GG12015@bill-the-cat>
	<20171103125150.GA32663@bill-the-cat>
	<20171106100829.nqhna6hugyqe636k@linux.intel.com>
	<20171106124417.GF32663@bill-the-cat>
MIME-Version: 1.0
In-Reply-To: <20171106124417.GF32663@bill-the-cat>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: NeoMutt/20170421 (1.8.2)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] wic: When using --use-uuid make sure that we update the fstab with PARTUUID
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
X-List-Received-Date: Tue, 07 Nov 2017 09:39:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 06, 2017 at 07:44:17AM -0500, Tom Rini wrote:
> > Can you rebase your patchset on top of current master?
> 
> Yes, OK.
> 
> > It would be also nice to get this functionality covered by tests.
> 
> OK, but what part of oe-selftest, and how exactly?  Can one easily check
> the resulting fstab?

Sorry for not mentioning it. You can look at wic oe-selftest test cases
in meta/lib/oeqa/selftest/cases/wic.py

To check image fstab you can boot image in qemu (see test cases
starting with 'test_qemu' for the reference). This way you can also
check if partition uids match fstab entries.

P.S. Another idea is to extending 'wic cp' or implement 'wic cat'. All ingredients are
already in the wic code, so it shouldn't be too hard.

--
Regards,
Ed

