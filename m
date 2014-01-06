Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2D56560DFD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2014 16:15:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Jan 2014 08:15:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,613,1384329600"; d="scan'208";a="462362267"
Received: from unknown (HELO [10.255.12.53]) ([10.255.12.53])
	by orsmga002.jf.intel.com with ESMTP; 06 Jan 2014 08:15:01 -0800
Message-ID: <52CAD684.9000100@linux.intel.com>
Date: Mon, 06 Jan 2014 08:15:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Jacob Kroon <jacob.kroon@gmail.com>, 
	openembedded-core@lists.openembedded.org
References: <alpine.LFD.2.11.1401061314390.9209@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.11.1401061314390.9209@localhost.localdomain>
Subject: Re: Strange looking commit in oe-core, 4cee162c292915e
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
X-List-Received-Date: Mon, 06 Jan 2014 16:15:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/2014 04:25 AM, Jacob Kroon wrote:
> Hi,
>
> Just an observation from my side, I was looking at the recent commits
> in OE-Core and saw 4cee162c292915e68e8efcab68a31ba0e48105e9,
> "enchant: fix unrecognised option"
>
> The actual commit message doesn't seem to have anything to do with the
> actual patch. Perhaps it has been rebased and gone through some other
> massaging, the patch seems to make sense, at least to me, still it
> would be nice to always have sane commit messages.
>
I will take the blame for that one, not Robert's fault, this happened 
when I merged and rebased a change locally and did not realize it was a 
"do nothing" patch in the end, better final review on my part.

That line was moved in one of Paul's patches orignally.

Thanks for the reminder to be more watchful.

Sau!

> Regards
> Jacob

