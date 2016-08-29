Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 7B6FC6E660
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 11:54:19 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 29 Aug 2016 04:54:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,596,1464678000"; d="scan'208";a="872162008"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2016 04:54:19 -0700
To: openembedded-core@lists.openembedded.org
References: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c88973ed-e7e3-e808-f57a-78dcc1dc53fb@linux.intel.com>
Date: Mon, 29 Aug 2016 14:52:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <1472436999-27335-1-git-send-email-mingli.yu@windriver.com>
Subject: Re: Review request 0/21: ltp: add libwww-perl-perl to RDEPENDS
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
X-List-Received-Date: Mon, 29 Aug 2016 11:54:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/29/2016 05:16 AM, mingli.yu@windriver.com wrote:
> The series add libwww-perl-perl to RDEPENDS for ltp as
> STPfailure_report.pl provided by ltp depends
> on LWP/Simple.pm which is provided by libwww-perl-perl

You are adding 20 new recipes, just to support something in a single 
perl script in a single project. Please investigate, what is that 
something, is it truly needed in oe-core context, and can it be 
disabled, patched out or rewritten so that it doesn't pull in this 
massive list of dependencies.

Alex


