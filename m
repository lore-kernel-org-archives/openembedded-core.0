Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 11A7960043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 11:11:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 18 Aug 2015 04:11:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,701,1432623600"; d="scan'208";a="770949886"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 18 Aug 2015 04:11:10 -0700
Message-ID: <55D31322.60908@linux.intel.com>
Date: Tue, 18 Aug 2015 14:12:34 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <CAP9ODKqHNtENns2SOk-C9S2hh1weyf15=n1V8Rxgs+Rh5rMJGw@mail.gmail.com>
	<CAJTo0Layj-AXfYMmvqjZ-ASSDx_PptbysS7tUiGDLAyPjLGN5A@mail.gmail.com>
	<CAJ86T=WJiNC5fJj+Vgj=4T-dS+E9_CvTw79nFLVuFETxrp1qdw@mail.gmail.com>
	<1436601450.3310.27.camel@linuxfoundation.org>
	<55BA134F.9010908@linux.intel.com>
	<CAJ86T=UHTjTA7S_4EV66VEUoaRhYmaYveVcfxbqzVJsxZ4s6dg@mail.gmail.com>
	<55BB5F06.4010901@linux.intel.com>
	<CAMKF1srWcMoRui4kqRY5vCdLd-SPQ+EMihTci=NUghHsnGiBqQ@mail.gmail.com>
	<55C477AE.8030308@balister.org>
	<55C4A405.6050209@linux.intel.com> <20150818075409.GA2458@jama>
In-Reply-To: <20150818075409.GA2458@jama>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
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
X-List-Received-Date: Tue, 18 Aug 2015 11:11:32 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/18/2015 10:54 AM, Martin Jansa wrote:

> Now we see a lot of upgrades in oe-core which are done by people just
> because "package upgrade report" says it's possible and the upgrade is
> tested mostly by autobuilder (which doesn't exersize any "extra" layers
> and runtime-test coverage is very low) - so in the end many of these
> "good to have" upgrades are breaking some other components which aren't
> upgraded so often or breaking/changing runtime behavior and only couple
> months later someone who is actually using them will report that.

The alternative isn't great either. Older, out-of-date software tends to 
require more effort to backport security fixes and prevent bitrot (maybe 
as much effort as would be spent simply updating it to latest versions). 
Or if no one does the backporting then you have an insecure software stack.

Then, when gigantic, must-have updates happen, they take forever to 
prepare, review, (rebase, update, review)* and merge, they're met with 
more resistance, and cause even more breakage and pain in the other 
layers than if the same thing would have been achieved via small, 
incremental updates.

Test automation is being worked on, so when that is in place, then 
rolling, small updates approach will be clearly superior.

Regards,
Alex

