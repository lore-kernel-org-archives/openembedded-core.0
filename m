Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 16948601F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 10:37:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 19 May 2016 03:37:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,334,1459839600"; d="scan'208";a="970306234"
Received: from jlock-mobl2.ger.corp.intel.com ([10.252.30.141])
	by fmsmga001.fm.intel.com with ESMTP; 19 May 2016 03:37:04 -0700
Message-ID: <1463654223.8266.11.camel@linux.intel.com>
From: Joshua G Lock <joshua.g.lock@linux.intel.com>
To: Robert Yang <liezhi.yang@windriver.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 19 May 2016 11:37:03 +0100
In-Reply-To: <573D917C.4090002@windriver.com>
References: <573C0726.3040402@windriver.com>
	<CA+chaQdJPWncYizZAKZ8MHOCqYRn+oKGcDuPhKVoepQhKh+LwQ@mail.gmail.com>
	<573C21EE.8040104@windriver.com> <20160518092029.GA2579@jama>
	<573C365D.3070407@windriver.com> <20160518101556.GB2579@jama>
	<573D260D.2020909@windriver.com> <573D2EAF.9010602@windriver.com>
	<1463651156.4578.113.camel@linuxfoundation.org>
	<573D917C.4090002@windriver.com>
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 19 May 2016 10:37:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-05-19 at 18:12 +0800, Robert Yang wrote:
> 
> On 05/19/2016 05:45 PM, Richard Purdie wrote:
> > Users are free to set their own policies, the system was designed
> > to do
> > that. If WindRiver wants to have a much more permissive policy, I'm
> > more than happy for them to do so.
> Thanks, frankly speaking, not only WindRiver wants this. After cloud
> computing and virtualization gets hot, more and more users want to
> customize their own images (for saving disk space, memory and
> security
> reason), oe/yocto is very good at customizing images, so more and
> more people try to use it to build their own distros, where live
> upgrades becomes very important.
> 

The desire for this is well understood, which is why work began on the
packagefeed-stability class. 

Paul's initial effort is solid and works for simple cases, I had a
brief look at it and tried to identify some of the issues and wrote
some minor patches (for things like versioned depends and copying all
packages for a recipe as soon as a difference is found) but
unfortunately I haven't had time to finish the work.

The main piece we're missing is to define tests (in the test suite) to
validate the class works as expected with each of the package backends
and through those tests identify areas where it doesn't work (and of
course fix them).

Regards,

Joshua

https://bugzilla.yoctoproject.org/show_bug.cgi?id=8318



