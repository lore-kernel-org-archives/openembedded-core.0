Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5C8E960088
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Oct 2015 18:57:10 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Oct 2015 11:57:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,183,1444719600"; d="scan'208";a="669750081"
Received: from unknown (HELO swold-mobl.jf.intel.com) ([10.254.23.93])
	by orsmga003.jf.intel.com with ESMTP; 22 Oct 2015 11:57:10 -0700
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
From: Saul Wold <sgw@linux.intel.com>
Message-ID: <56293186.9090501@linux.intel.com>
Date: Thu, 22 Oct 2015 11:57:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1445281177-3309-1-git-send-email-armccurdy@gmail.com>
Cc: "dvhart@linux.intel.com" <dvhart@linux.intel.com>
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
X-List-Received-Date: Thu, 22 Oct 2015 18:57:12 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Hi Andre,


On 10/19/2015 11:59 AM, Andre McCurdy wrote:
> Andre McCurdy (5):
>    tune-corei7.inc: fix PACKAGE_EXTRA_ARCHS_tune-corei7-32 typo

This change makes sense and addresses an issue.

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

