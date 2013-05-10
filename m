Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UaoSL-0001m6-Oi
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 16:37:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 May 2013 07:19:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,648,1363158000"; d="scan'208";a="335530897"
Received: from unknown (HELO helios.localnet) ([10.255.12.234])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2013 07:19:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 15:19:48 +0100
Message-ID: <3510834.JaFUepN7Uz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CABcZAN=Hs5B5Eq8iJs=+caTFBV+xLwQbjdo+2tp68MKTS5qqvw@mail.gmail.com>
References: <cover.1368116511.git.paul.eggleton@linux.intel.com>
	<edbe33f45ad5f07beb7ffdc38bb95f424bb2ab3a.1368116511.git.paul.eggleton@linux.intel.com>
	<CABcZAN=Hs5B5Eq8iJs=+caTFBV+xLwQbjdo+2tp68MKTS5qqvw@mail.gmail.com>
MIME-Version: 1.0
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: [PATCH 1/2] classes/image: show an error on invalid IMAGE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 May 2013 14:38:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 09 May 2013 15:49:18 Chris Larson wrote:
> On Thu, May 9, 2013 at 9:24 AM, Paul Eggleton <paul.eggleton@linux.intel.com
> > wrote:
> > 
> > If the user specifies an invalid feature in IMAGE_FEATURES, show an
> > error during parsing. Valid IMAGE_FEATURES are drawn from
> > PACKAGE_GROUP_ definitions, COMPLEMENTARY_GLOBS and a new 'validitems'
> > varflag on IMAGE_FEATURES (so that additional non-package group features
> > can be added elsewhere.)
> > 
> > Implements [YOCTO #3308].
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> Hmm, maybe we should add this sort of valid item in a list checking to
> typecheck.bbclass, or enhance the list type in oe.types to do it there, so
> we'd have a general mechanism for this.

Good idea, I'll look into this.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


