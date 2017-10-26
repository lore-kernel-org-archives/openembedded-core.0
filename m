Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D720971D79
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Oct 2017 08:05:37 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Oct 2017 01:05:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,434,1503385200"; d="scan'208";a="167817749"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2017 01:05:36 -0700
To: "Huang, Qiyu" <huangqy.fnst@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1508900374-23806-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<21a0f200-b746-c896-a8c5-76e6a5e4c2ff@linux.intel.com>
	<97F7C8E70D26E94FA7E05578493F65C61C7367AA@G08CNEXMBPEKD03.g08.fujitsu.local>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2063dc07-4a32-1561-94e1-554a22944329@linux.intel.com>
Date: Thu, 26 Oct 2017 11:05:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <97F7C8E70D26E94FA7E05578493F65C61C7367AA@G08CNEXMBPEKD03.g08.fujitsu.local>
Subject: Re: [PATCH v3] libnl: 3.2.29 -> 3.4.0
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
X-List-Received-Date: Thu, 26 Oct 2017 08:05:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/26/2017 10:04 AM, Huang, Qiyu wrote:
> Well, from the new Makefile.am file,I can't find the related content about this patch.
> 
> And in the fix-pktloc_syntax_h-race.patch, the description is like this:
> libnl has progressed to 0.3.2 and there does not appear to be any "make -j" issues with this build after my limited testing on that newer version.
> 
> so we can assume this issue is fixed upstream
> 
> So, I think deleting this patch will not cause the problem.

That's fine, thanks for looking. Can you resend once more and include 
the information into the commit message please? Something like "upstream 
has refactored the makefiles, and the problematic code is now absent".


Alex

