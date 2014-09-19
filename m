Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C2EDE6FCE0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Sep 2014 16:42:48 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 19 Sep 2014 09:42:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,555,1406617200"; d="scan'208";a="602290684"
Received: from timevans-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.139])
	by fmsmga002.fm.intel.com with ESMTP; 19 Sep 2014 09:42:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Marek Vasut <marex@denx.de>
Date: Fri, 19 Sep 2014 17:42:14 +0100
Message-ID: <6249697.nqJ7MiLpN2@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.16.2-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <201409191827.30418.marex@denx.de>
References: <1411031735-14721-1-git-send-email-marex@denx.de>
	<CABcZANkxOj-8VhQvafT5cQP1TDfTmVn=MGDYygkUaxQNtwYezw@mail.gmail.com>
	<201409191827.30418.marex@denx.de>
MIME-Version: 1.0
Cc: Christopher Larson <clarson@kergoth.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] nativesdk-packagegroup-python: buildtools-tarball: Introduce NativeSDK package group
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
X-List-Received-Date: Fri, 19 Sep 2014 16:42:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Marek,

On Friday 19 September 2014 18:27:30 Marek Vasut wrote:
> On Friday, September 19, 2014 at 06:13:46 PM, Christopher Larson wrote:
> > On Fri, Sep 19, 2014 at 12:06 AM, Marek Vasut <marex@denx.de> wrote:
> > > On Thursday, September 18, 2014 at 03:30:11 PM, Richard Purdie wrote:
> > > > On Thu, 2014-09-18 at 11:15 +0200, Marek Vasut wrote:
> > > > > Introduce and use nativesdk-packagegroup-python , which contains all
> > > > > necessary python components for the native SDK. Make use of this
> > > > > package group in buildtools-tarball.bb immediatelly.
> > > > 
> > > > Specifically, isn't this the list of packages needed to run bitbake
> > > > and
> > > > its associated utils? "python" isn't therefore a particularly good
> > > > description of this package?
> > > 
> > > This is really just and only python packages, nothing else.
> > 
> > The fact that it only contains python packages doesn't mean it contains
> > all
> > python packages, or is somehow generic. It's a specific subset of python
> > modules used by bitbake.
> 
> OK, so uh, what would be the right solution here to make the toolchain
> usable? As I am no expert, I really don't know what to do now. Can you help
> please ?

There's clearly a bug here, adding a Python-using component does not mean you 
should have python in the SDK but that's what currently happens. There is a 
bug open now covering this, we will do our best to address it in a timely 
manner. (FWIW, I would have thought this issue has been present for some time 
rather than being a recent regression.)

In the mean time however you can work around it by adding 
nativesdk-python-modules (an existing meta-package) to your SDK via 
TOOLCHAIN_HOST_TASK.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

