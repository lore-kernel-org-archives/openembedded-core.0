Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3777977DAF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 10:25:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Oct 2017 03:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,386,1503385200"; d="scan'208";a="1231277114"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 16 Oct 2017 03:25:34 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20171013141832.24325-1-alexander.kanavin@linux.intel.com>
	<077b5862-bb57-8447-4cca-5301740ff945@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c4d752b8-c0c5-bfd7-ca5b-e7958a9f31f3@linux.intel.com>
Date: Mon, 16 Oct 2017 13:22:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <077b5862-bb57-8447-4cca-5301740ff945@windriver.com>
Subject: Re: [PATCH] prelink: fix upstream version check
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
X-List-Received-Date: Mon, 16 Oct 2017 10:25:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/13/2017 05:56 PM, Mark Hatle wrote:
> On 10/13/17 9:18 AM, Alexander Kanavin wrote:
>> Instead of reporting that we can update to a bogus version
>> report that upstream version is not known.
> 
> You do know that there are release branches for prelink right?
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/prelink-cross/refs/heads
> 
> cross_prelink and master are both 'release' quality branches.
> 
> Anything put there is a new version.
> 
> 
> There is nothing for us to 'tag', since there are no formal versions.
> 
> 
> Should be easy enough for the system to compare the SRCREV to the top of
> cross_prelink.  If they don't match, an upgrade is needed.

The system currently supports only comparing tags, not comparing 
commits. I've filed a bug for it long time ago:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=8133

and no progress happened. In the meantime, for projects where commit == 
release, the best we can do is to mark them as 'upstream version cannot 
be established'. For prelink, also an exclusion of a bogus tag is 
needed, so you, as the maintainer, won't get reminders to update to it.

Alex


