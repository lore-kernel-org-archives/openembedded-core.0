Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 53986612E5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 11:10:36 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 19 May 2016 04:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,334,1459839600"; d="scan'208";a="970325170"
Received: from ooichins-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.35])
	by fmsmga001.fm.intel.com with ESMTP; 19 May 2016 04:10:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 May 2016 23:10:31 +1200
Message-ID: <3642953.uHYOfRu805@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.9-300.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1463654223.8266.11.camel@linux.intel.com>
References: <573C0726.3040402@windriver.com> <573D917C.4090002@windriver.com>
	<1463654223.8266.11.camel@linux.intel.com>
MIME-Version: 1.0
Subject: Re: PRServer's problem
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
X-List-Received-Date: Thu, 19 May 2016 11:10:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 19 May 2016 11:37:03 Joshua G Lock wrote:
> On Thu, 2016-05-19 at 18:12 +0800, Robert Yang wrote:
> > On 05/19/2016 05:45 PM, Richard Purdie wrote:
> > > Users are free to set their own policies, the system was designed
> > > to do
> > > that. If WindRiver wants to have a much more permissive policy, I'm
> > > more than happy for them to do so.
> > 
> > Thanks, frankly speaking, not only WindRiver wants this. After cloud
> > computing and virtualization gets hot, more and more users want to
> > customize their own images (for saving disk space, memory and
> > security
> > reason), oe/yocto is very good at customizing images, so more and
> > more people try to use it to build their own distros, where live
> > upgrades becomes very important.
> 
> The desire for this is well understood, which is why work began on the
> packagefeed-stability class. 
> 
> Paul's initial effort is solid and works for simple cases, I had a
> brief look at it and tried to identify some of the issues and wrote
> some minor patches (for things like versioned depends and copying all
> packages for a recipe as soon as a difference is found) but
> unfortunately I haven't had time to finish the work.
> 
> The main piece we're missing is to define tests (in the test suite) to
> validate the class works as expected with each of the package backends
> and through those tests identify areas where it doesn't work (and of
> course fix them).
> 
> Regards,
> 
> Joshua
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=8318

Also as I believe I mentioned in my RFC (IIRC) whilst it does basically work I 
was not exactly impressed by the build-compare tool's error handling, there 
were errors produced during some of my runs and yet the script itself 
succeeded, which gives me less confidence about the results. I haven't looked 
to see if there's a new version upstream that is improved in this regard 
though, and even if there isn't we do have the option of patching it ourselves 
(and sending the fix upstream, naturally).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

