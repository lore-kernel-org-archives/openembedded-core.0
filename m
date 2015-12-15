Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 49A3060116
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 20:16:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 15 Dec 2015 12:16:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,433,1444719600"; d="scan'208";a="841863248"
Received: from mhchui-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.146.121])
	by orsmga001.jf.intel.com with ESMTP; 15 Dec 2015 12:16:33 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 16 Dec 2015 09:16:30 +1300
Message-ID: <4098937.xBsQpXnxS0@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.6-301.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <CAJ86T=XkgyYditMnijXxWbQxqFMT-XR_-EZUOyLL17i=DcuGJg@mail.gmail.com>
References: <1450191753-13537-1-git-send-email-alexander.kanavin@linux.intel.com>
	<2403291.KqQCZxqk2K@peggleto-mobl.ger.corp.intel.com>
	<CAJ86T=XkgyYditMnijXxWbQxqFMT-XR_-EZUOyLL17i=DcuGJg@mail.gmail.com>
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: update to 3.11.0
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
X-List-Received-Date: Tue, 15 Dec 2015 20:16:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 15 Dec 2015 12:07:48 Andre McCurdy wrote:
> On Tue, Dec 15, 2015 at 9:26 AM, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > On Tue, 15 Dec 2015 17:28:59 Alexander Kanavin wrote:
> >> On 12/15/2015 05:25 PM, Martin Jansa wrote:
> >> >> +COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
> >> >> +COMPATIBLE_HOST_armv7a = 'arm.*-linux'
> >> > 
> >> > Can you add armv7ve as well?
> >> 
> >> Armv7ve support is not yet in master, so you'll have to add it later I'm
> >> afraid.
> > 
> > I think by policy we don't have any restrictions on architecture-specific
> > flags in OE-Core (at least, assuming they're reasonable).
> 
> If we're going to duplicate all _armv7a over-rides for _armv7ve then
> I'd vote to do so in a single patch series which fixes up the whole of
> oe-core rather than adding the over-rides one at a time amongst
> version updates etc.

Makes sense, but before doing that would it make sense to have a grouping 
override for all of them that can be used instead (where appropriate)?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

