Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 458D175E80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 15:59:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 Oct 2015 08:59:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,187,1444719600"; d="scan'208";a="833527587"
Received: from fburke-mobl1.amr.corp.intel.com (HELO swold-mobl.jf.intel.com)
	([10.254.102.233])
	by orsmga002.jf.intel.com with ESMTP; 23 Oct 2015 08:59:41 -0700
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
From: Saul Wold <sgw@linux.intel.com>
Message-ID: <562A596B.50300@linux.intel.com>
Date: Fri, 23 Oct 2015 08:59:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
Subject: Re: [PATCH 0/5] tuning support for 1st and 2nd generation Intel Atom CPUs
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
X-List-Received-Date: Fri, 23 Oct 2015 15:59:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2015 11:59 AM, Andre McCurdy wrote:
> Andre McCurdy (5):
>    tune-corei7.inc: fix PACKAGE_EXTRA_ARCHS_tune-corei7-32 typo

This change makes sense

>    tune-bonnell.inc: support for first generation Intel Atom CPUs
>    tune-silvermont.inc: support for second generation Intel Atom CPUs
>    tune-atom.inc: include tune-bonnell.inc instead of tune-core2.inc
>    tune-corei7.inc: update comments regarding Silvermont support
>
I am not sure these make sense, it adds additional complexity to an 
already complex testing matrix.

Both the bonnell and silvermont tunes are fully part of their respective 
core* tune settings, there is no real need to become more specific. We 
know that newer code is starting to use intrinsics that can determine 
the correct extensions based on the CPU type.

I know you replied partly to RP's query, but is there something specific 
your trying to accomplish with these additional .incs that we don't 
already do and if so what?

Sau!
meta-intel maintainer

>   meta/conf/machine/include/tune-atom.inc       |  4 +--
>   meta/conf/machine/include/tune-bonnell.inc    | 35 ++++++++++++++++++++++++++
>   meta/conf/machine/include/tune-corei7.inc     |  6 ++---
>   meta/conf/machine/include/tune-silvermont.inc | 36 +++++++++++++++++++++++++++
>   4 files changed, 76 insertions(+), 5 deletions(-)
>   create mode 100644 meta/conf/machine/include/tune-bonnell.inc
>   create mode 100644 meta/conf/machine/include/tune-silvermont.inc
>


