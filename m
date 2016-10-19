Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B36BF6E65F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 19:52:18 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP; 19 Oct 2016 12:52:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,367,1473145200"; d="scan'208";a="21372938"
Received: from jkursms-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.184.45])
	by fmsmga006.fm.intel.com with ESMTP; 19 Oct 2016 12:52:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 20 Oct 2016 08:52:15 +1300
Message-ID: <1542758.b0vWq7N0OP@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.7-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <alpine.LFD.2.20.1610191541370.14839@localhost.localdomain>
References: <alpine.LFD.2.20.1610191112240.15586@ca624034.mitel.com>
	<2130816.2i4mC23lpe@peggleto-mobl.ger.corp.intel.com>
	<alpine.LFD.2.20.1610191541370.14839@localhost.localdomain>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: how can i ask to keep all the generated "nativesdk" rpms?
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
X-List-Received-Date: Wed, 19 Oct 2016 19:52:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 19 Oct 2016 15:42:27 Robert P. J. Day wrote:
> On Thu, 20 Oct 2016, Paul Eggleton wrote:
> > On Wed, 19 Oct 2016 15:32:25 Robert P. J. Day wrote:
> > > On Thu, 20 Oct 2016, Paul Eggleton wrote:
> > > > On Wed, 19 Oct 2016 11:27:05 Robert P. J. Day wrote:
> > > > > On Wed, 19 Oct 2016, Robert P. J. Day wrote:
> > > > > >   not sure how dumb a question this is, but as i was doing a basic
> > > > > >   OE
> > > > > > 
> > > > > > build, i saw the growing number of "nativesdk" rpms piling up
> > > > > > under
> > > > > > tmp/deploy/rpm/x86_64_linux, and wanted to examine a couple of
> > > > > > them
> > > > > > later, but after the sysroot was (i assume) populated with all of
> > > > > > these rpms, that entire directory was deleted.
> > > > > > 
> > > > > >   is there a switch to preserve that directory? thanks.
> > > > >   
> > > > >   oh, wait, i think i found it:
> > > > > SDKIMAGE_FEATURES += "package-management"
> > > > > 
> > > > > does that look right?
> > > > 
> > > > No, it doesn't. That's for turning on package management database in
> > > > the
> > > > SDK, which is not quite the same thing. The fact that those rpms are
> > > > disappearing is a separate issue.
> > > > 
> > > > Are you using rm_work?
> > > > 
> > >   no. and are you sure you're reading the above correctly? i'm not
> > > 
> > > saying
> > > 
> > >   IMAGE_FEATURES += "package-management"
> > 
> > Yep, I understood.
> > 
> > > i was reading this:
> > > 
> > > https://patchwork.openembedded.org/patch/120705/
> > > 
> > > but perhaps i'm just misinterpreting what i'm reading.
> > 
> > Right - that patch makes the preservation of the package management
> > database (what it refers to as the "packaging data") conditional. That
> > code does nothing with the packages themselves.
> 
>   i'm about to create a new project directory as a test ... is there
> any configuration i should do to try to preserve all those nativesdk
> rpm files?

I am not aware of any configuration that should control the presence or 
absence of those files. As far as I'm concerned, if they are disappearing and 
you're not doing anything to delete them, that's a bug.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

