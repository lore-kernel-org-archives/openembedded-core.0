Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D8A776012C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 01:38:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 18 Apr 2016 18:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,504,1455004800"; d="scan'208";a="957860863"
Received: from sadnan1-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.175.36])
	by orsmga002.jf.intel.com with ESMTP; 18 Apr 2016 18:38:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Denys Dmytriyenko <denis@denix.org>
Date: Tue, 19 Apr 2016 13:38:23 +1200
Message-ID: <1922089.IxRdTHIprx@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.6-301.fc23.x86_64; KDE/4.14.18; x86_64; ;
	)
In-Reply-To: <20160419010127.GK16135@denix.org>
References: <20160418221455.GJ16135@denix.org>
	<1968586.YaUkzg8nud@peggleto-mobl.ger.corp.intel.com>
	<20160419010127.GK16135@denix.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Package management DB in old-style SDK
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
X-List-Received-Date: Tue, 19 Apr 2016 01:38:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 18 Apr 2016 21:01:27 Denys Dmytriyenko wrote:
> On Tue, Apr 19, 2016 at 10:35:29AM +1200, Paul Eggleton wrote:
> > Hi Denys,
> > On Mon, 18 Apr 2016 18:14:55 Denys Dmytriyenko wrote:
> > > I'm still using the old-style SDK (meta-toolchain) for our products due
> > > to some code customizations in it and some of our use cases rely on the
> > > opkg package management database being present in sysroots, so packages
> > > can be manipulated in SDK with opkg command. It appears that
> > > /var/lib/opkg is now empty and the package database is no longer
> > > supplied with the SDK.
> > > 
> > > I know about the new-style populate_sdk and the even newer Extensible
> > > SDK, but not yet ready to convert our old use cases to that. Since there
> > > were lots of changes around the way SDKs work in OE-Core in the past
> > > couple releases, I'm failing to find the change that causes opkg DB to
> > > be missing from the old style SDK. I'll appreciate any pointers in
> > > helping me debug and/or fix this issue with my SDKs. Thanks.
> > 
> > As far as ipk is concerned I think it was this commit:
> >   http://cgit.openembedded.org/openembedded-core/commit/?id=c8e0ec2da9ad4c
> >   e1c103966906a85f68c15400dd> 
> > Unfortunately it wasn't made optional.
> 
> Thanks, Paul!
> 
> Unfortunately, the change is in the library, which is quite difficult to
> override in another layer...
> 
> Will there be any objections for making that change optional with the
> default being like it is now, but with the ability to restore the old way
> with a variable?

As long as we make it have the same effect across the three different package 
managers, no objection from me at least. Thinking about it we could even make 
it switch based on package-management being in SDKIMAGE_FEATURES and then it 
would be consistent with how it works for images as well.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

