Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A0B1D75D2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 08:41:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jul 2015 01:41:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,399,1432623600"; d="scan'208";a="755374944"
Received: from ndelough-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.2.173])
	by fmsmga002.fm.intel.com with ESMTP; 03 Jul 2015 01:41:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org, akuster808 <akuster808@gmail.com>
Date: Fri, 03 Jul 2015 09:41:51 +0100
Message-ID: <1744996.JjukX86N4O@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.0.6-200.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <20150703070716.GA21416@ad.chargestorm.se>
References: <cover.1435497302.git.akuster808@gmail.com>
	<55956F2C.2040301@gmail.com>
	<20150703070716.GA21416@ad.chargestorm.se>
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: [PATCH 1/2] nettle: update package to 3.1.1 version.
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
X-List-Received-Date: Fri, 03 Jul 2015 08:41:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 03 July 2015 09:07:16 Anders Darander wrote:
> * akuster808 <akuster808@gmail.com> [150702 19:05]:
> > The current version of nettle 2.7 has one file that is GPL v3.
> > mini-gmp.*
> > 
> > so the license for 2.7 should be updated IMHO. So wont that put us in the
> > same boat as the upgrade?
> 
> Ouch, that's no good!
> 
> Ideally, we should look at that file and see for how long it's been part
> of nettle. If it's just for a short time, maybe we could go back to a
> point in time just prior to the inclusion (or license change) of that
> file.
> 
> Has it been like this for far too long, well, then we either have to see
> what impact this has on non-GPLv3 builds...
> 
> One option, depending on the age etc, could be to check if it's possible
> to get that single file re-licensed. Short-term, we have to fix the
> license and backport that fix to all supported versions that are
> affected, even though that might introduce regressions in images around
> the world...

We also ought to poke upstream because as far as I can tell they have not 
noted the addition of this differently licensed source in any of the license 
notices shipped with it (other than in the added GPLv3 source files themselves, 
of course).

Armin, is that something you'd be able to take care of?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

