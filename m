Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 0A5B878335
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Jun 2017 20:21:31 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 09 Jun 2017 13:21:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,319,1493708400"; d="scan'208";a="113074608"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 09 Jun 2017 13:21:31 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1497036762.git.pkj@axis.com>
	<dd1c3bd9721bab1b3f894f7cf44aa7168273b0a9.1497036762.git.pkj@axis.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cfb6081e-ee3c-9976-1a99-26a6614e4425@linux.intel.com>
Date: Fri, 9 Jun 2017 23:21:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <dd1c3bd9721bab1b3f894f7cf44aa7168273b0a9.1497036762.git.pkj@axis.com>
Subject: Re: [PATCH 13/13] package.bbclass: Restore functionality to detect RPM dependencies
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
X-List-Received-Date: Fri, 09 Jun 2017 20:21:32 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2017 10:34 PM, Peter Kjellerstedt wrote:
> During the transition to rpm4, rpmdeps-oecore was replaced with the
> standard rpmdeps. However, what no one noticed was that unless rpmdeps
> is given options, e.g., -P or -R, to tell it what it should output, it
> will not output anything. Thus, it would do all the work to determine
> the requirements, but would keep silent about it. And since no output
> from rpmdeps is expected unless there are requirements, there were no
> warnings indicating that everything was not working as expected.

Apologies for that, however, this is not tested in any of our 
autobuilder scenarios or otherwise, and if it's not tested, then it's 
not broken. :-)

I would recommend you add some kind of test to this patchset to make 
sure it doesn't happen again (for example, when I would update rpm to a 
new upstream release).


Alex


