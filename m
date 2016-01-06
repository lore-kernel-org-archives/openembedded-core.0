Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 2673C6FFCD;
	Wed,  6 Jan 2016 00:01:44 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 05 Jan 2016 16:01:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,526,1444719600"; d="scan'208";a="24225933"
Received: from nanoar-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.248])
	by fmsmga004.fm.intel.com with ESMTP; 05 Jan 2016 16:01:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 06 Jan 2016 13:01:33 +1300
Message-ID: <2007809.DSH5DR9lFx@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.2.8-300.fc23.x86_64; KDE/4.14.14; x86_64; ;
	)
In-Reply-To: <A374083C-8331-42F2-A3F5-9D5EB49538F7@gmail.com>
References: <CAMKF1sqAGXMFx9re3YgB1u9aLPGRT9KRCR-0Drux=4P5igirWw@mail.gmail.com>
	<CAJTo0LbB02LR=6Yyy0-3=Hg1tjcdX=DmMKN2MEJqctnvi5n0Kg@mail.gmail.com>
	<A374083C-8331-42F2-A3F5-9D5EB49538F7@gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] [RFT] glibc 2.23
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
X-List-Received-Date: Wed, 06 Jan 2016 00:01:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tue, 05 Jan 2016 13:08:31 Khem Raj wrote:
> > On Jan 5, 2016, at 8:17 AM, Burton, Ross <ross.burton@intel.com> wrote:
> > 
> > On 4 January 2016 at 19:00, Khem Raj <raj.khem@gmail.com> wrote:
> >> I have done OE-Core only clean world builds for all Qemu machines
> >> without a single build failure and
> >> runtime boot tested.
> > 
> > I threw this at the autobuilder and glibc failed to build on one of the
> > runs:
> > 
> > http://errors.yoctoproject.org/Errors/Details/26057/
> 
> Thanks Ross, what MACHINE did you build for ?

It's right there in the error report on the right hand side - genericx86.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

