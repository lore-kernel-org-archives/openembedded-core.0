Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id B9DCD71DEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 12:17:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 21 Feb 2017 04:17:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,189,1484035200"; d="scan'208";a="936389093"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 21 Feb 2017 04:17:37 -0800
Date: Tue, 21 Feb 2017 14:19:19 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170221121918.GA27554@mbabyjoh-desk.ger.corp.intel.com>
References: <1486735300-3408-1-git-send-email-maxin.john@intel.com>
	<CAJTo0La+yHGLse_kzxAqOkzk3eea-YdcRPaRWQACPcec8-yR8w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0La+yHGLse_kzxAqOkzk3eea-YdcRPaRWQACPcec8-yR8w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Cristian Iorga <cristian.iorga@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] curl: add ptest
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
X-List-Received-Date: Tue, 21 Feb 2017 12:17:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

>On Tue, Feb 21, 2017 at 12:41:10AM +0000, Burton, Ross wrote:
>>On 10 February 2017 at 14:01, Maxin B. John <maxin.john@intel.com> wrote:
>>
>> +RDEPENDS_${PN}-ptest += "make bash sudo perl perl-module-cwd perl-module-ipc-open2 \
>
>The ptest needing sudo is moderately scary and also suggests that it can't be ran in an
>automated test harness.  What does this need sudo for?

That was a lousy mistake from my side (needs "su" to run some ssh tests as normal user). 
Will update and send the new version without "sudo" dependency.

>  Ross

Warm Regards,
Maxin

