Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S2jeq-0004Er-DN
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Feb 2012 14:33:29 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 29 Feb 2012 05:24:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="112753723"
Received: from unknown (HELO helios.localnet) ([10.252.123.96])
	by azsmga001.ch.intel.com with ESMTP; 29 Feb 2012 05:24:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Feb 2012 13:24:56 +0000
Message-ID: <3783698.iMdhYanJlj@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <CAP9ODKpPUtNpV0Wc91kvehnf=1OpYtKdJ411-+kV8Z=GADOKiQ@mail.gmail.com>
References: <cover.1330520324.git.paul.eggleton@linux.intel.com>
	<9f75e5f43a30ed6e154f299ead955588c98de5c7.1330520324.git.paul.eggleton@linux.intel.com>
	<CAP9ODKpPUtNpV0Wc91kvehnf=1OpYtKdJ411-+kV8Z=GADOKiQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] More quoting fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Feb 2012 13:33:29 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 29 February 2012 10:19:33 Otavio Salvador wrote:
> On Wed, Feb 29, 2012 at 09:59, Paul Eggleton
> 
> <paul.eggleton@linux.intel.com> wrote:
> > -export VERBOSE=1
> > +export VERBOSE="1"
> 
> I fully agree with the change but here it doesn't raise a parser
> error. Isn't it expected to happen?

Yes, that has also been fixed in bitbake master.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


