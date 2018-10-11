Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8822E60116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Oct 2018 22:20:14 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w9BMK5Ic021858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 11 Oct 2018 23:20:06 +0100
Message-ID: <e6055a6666e34411d73b753a8351cbff1dfe1a3a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yeoh Ee Peng <ee.peng.yeoh@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 11 Oct 2018 23:20:05 +0100
In-Reply-To: <1539250741-84490-1-git-send-email-ee.peng.yeoh@intel.com>
References: <1539250741-84490-1-git-send-email-ee.peng.yeoh@intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] oeqa/manual: transfer manual test cases from testopia to oeqa
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
X-List-Received-Date: Thu, 11 Oct 2018 22:20:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-11 at 17:39 +0800, Yeoh Ee Peng wrote:
> As part of the solution to replace Testopia, manual test cases
> need to be migrated to OEQA. These manual test case json files
> will serve two use cases.
> 
> Use case#1: as input to the future commandline-based manual test
> runner script, where this script will display actions and expected
> result information in user friendly text, then it will capture
> user input for test result and log, finally it will write test
> result and log into existing standardize test result json format
> from OEQA framework for automated tests.
> 
> Use case#2: QA will open and read these json file manually for
> planning manual test execution. Any reader interested in
> understanding manual test cases will open and read these files.

Thanks for this, I think this should clear up what manual test cases we
have on top of the other tests already in oeqa!

I've started making some small patches on top of this patch already
which remove things which I don't believe we need to run (such as
bitbake-selftest).

At this point I want everyone to be clear that the list in OE-Core is
the definitive list, not the list in testopia. I presume any further
test runs will use the data from OE-Core.

I'd also like to ask for people's help in reviewing the tests, pruning
any we don't need or that are obsolete and helping automate those we
can automate.

Cheers,

Richard


