Return-Path: <dvhart@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1F00E60167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jul 2014 16:15:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 21 Jul 2014 09:15:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,702,1400050800"; d="scan'208";a="573146509"
Received: from dvhart-mac01.jf.intel.com (HELO [10.24.5.55]) ([10.24.5.55])
	by fmsmga002.fm.intel.com with ESMTP; 21 Jul 2014 09:15:52 -0700
User-Agent: Microsoft-MacOutlook/14.4.3.140616
Date: Mon, 21 Jul 2014 09:16:01 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <CFF28A91.9D412%dvhart@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] kernelshark: Remove trace-cmd from the
	kernelshark package
References: <7ebd83d37f946d8f169e4bec7e00bfeed6cc6408.1405724512.git.dvhart@linux.intel.com>
	<CFF27DBC.9D3CA%dvhart@linux.intel.com>
	<1405956772.22985.99.camel@ted>
In-Reply-To: <1405956772.22985.99.camel@ted>
Mime-version: 1.0
Cc: california.l.sullivan@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernelshark: Remove trace-cmd from the kernelshark package
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
X-List-Received-Date: Mon, 21 Jul 2014 16:16:01 -0000
Content-type: text/plain;
	charset="US-ASCII"
Content-transfer-encoding: 7bit

On 7/21/14, 8:32, "Richard Purdie" <richard.purdie@linuxfoundation.org>
wrote:

>On Mon, 2014-07-21 at 08:21 -0700, Darren Hart wrote:
>> On 7/18/14, 16:01, "Darren Hart" <dvhart@linux.intel.com> wrote:
>> 
>> >Fixes [YOCTO 6550]
>> >
>> >Images installing both trace-cmd and kernelshark would fail with:
>> >
>> >error: file /usr/bin/trace-cmd conflicts between attempted installs of
>> >kernelshark-1.2+git0+7055ffd37b-r3.core2_32 and
>> >trace-cmd-1.2+git0+7055ffd37b-r3.core2_32
>> >
>> >This patch removes ${bindir}/trace-cmd from the install prior to
>> >packaging, as is already done with the ${datadir}.
>> >
>> >Reported-by: California Sullivan <california.l.sullivan@intel.com>
>> >Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> >(cherry picked from commit eb08ae8f729ef77329892d19b23ddfdaa7953de0)
>> 
>> Apologies for the cherry-picked line, that shouldn't have appeared here.
>> Please remove prior to merge. I can resubmit if that is preferred.
>
>Too late, its in...

Yeah, I saw that. My apologies, that was sloppy and unacceptable. I'll
correct this going forward.

-- 
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation




