Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 887726AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 17:10:05 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 23 Jan 2015 09:10:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,454,1418112000"; d="scan'208";a="516681807"
Received: from ifranko-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.0.176])
	by orsmga003.jf.intel.com with ESMTP; 23 Jan 2015 09:03:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: akuster808 <akuster808@gmail.com>
Date: Fri, 23 Jan 2015 17:09:52 +0000
Message-ID: <3413995.sbGVsiYaB4@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <54C27F1C.2070606@gmail.com>
References: <54C1AE00.6010402@windriver.com>
	<CAP9ODKrqNOqQ1_d7iJRAcpNQgEbeNg=Ve1SLob1m2k2xZX4DkA@mail.gmail.com>
	<54C27F1C.2070606@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] About GPLv2's native recipe
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
X-List-Received-Date: Fri, 23 Jan 2015 17:10:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 23 January 2015 09:04:28 akuster808 wrote:
> On 01/23/2015 04:47 AM, Otavio Salvador wrote:
> > On Fri, Jan 23, 2015 at 12:12 AM, Robert Yang <liezhi.yang@windriver.com> 
wrote:
> >> We have several GPLv2 recipes such as m4-native_1.4.9.bb, while we also
> >> have GPLv3's m4-native_1.4.17.bb, I think that we can remove
> >> m4-native_1.4.9.bb if the target m4_1.4.9.bb builds well ?
> >> 
> >> I'd like to remove it because we don't build the lower native version by
> >> default, and we don't know whether it works or when it would fail.
> > 
> > I second this; not tested recipes are always good to remove.
> 
> Speaking of not tested, what about 'BLACKLISTED' recipes? is there a
> policy regarding how long to keep them around when they are in that state?

We don't blacklist recipes in OE-Core, so you'd have to address that question 
to Martin or other layer maintainers who do do that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

