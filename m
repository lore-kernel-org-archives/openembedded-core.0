Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 912A56FC43
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 09:59:27 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Jul 2014 02:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,723,1400050800"; d="scan'208";a="460808149"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.44])
	by azsmga001.ch.intel.com with ESMTP; 24 Jul 2014 02:59:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	"Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 24 Jul 2014 10:59:20 +0100
Message-ID: <2044916.qXQu2pyie7@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CAJTo0LZOnTtA_mrFMMTR-TtXwUeQYSECQ2utjwzkNZdMWXCrtA@mail.gmail.com>
References: <alpine.LFD.2.11.1407240509150.1086@localhost>
	<CAJTo0LZOnTtA_mrFMMTR-TtXwUeQYSECQ2utjwzkNZdMWXCrtA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Mention package_tar packaging in local.conf.sample
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
X-List-Received-Date: Thu, 24 Jul 2014 09:59:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 24 July 2014 10:16:02 Burton, Ross wrote:
> On 24 July 2014 10:10, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > +#  - 'package_tar' for tarball packages
> > +# E.g.: PACKAGE_CLASSES ?= "package_rpm package_deb package_ipk
> > package_tar"
> package_tar is pretty limited (no dependencies, so images don't work)
> - is there a good reason to keep it around?  If we're going to delete
> it, now is the time to do it...

I've really not heard of anyone using it recently. I have at least kept it 
working over the last little while, and it might possibly be useful on a 
limited basis if you want the output of certain recipes to be in the form of a 
tarball; without dependencies though as you say it's of no use beyond that. 
I'd be fine with dropping it as well if it's simply not going to be used.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

