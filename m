Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6E68F6E630
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Nov 2017 01:08:35 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 06 Nov 2017 17:08:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,355,1505804400"; d="scan'208";a="172326067"
Received: from skho-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.44])
	by fmsmga005.fm.intel.com with ESMTP; 06 Nov 2017 17:08:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 07 Nov 2017 14:08:28 +1300
Message-ID: <2487574.aZ8hiqvxQI@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <CAJ86T=V5NqFrFr-dBQsOrJuz_Oewbfd-9RQdyM93UBDOqU+32A@mail.gmail.com>
References: <CAEg-Je9nrUypvdDyTXMDTqgv9qBB_R0VSA_hzs6pswkzPJgr7Q@mail.gmail.com>
	<5121452.M8NYrTEKNB@peggleto-mobl.ger.corp.intel.com>
	<CAJ86T=V5NqFrFr-dBQsOrJuz_Oewbfd-9RQdyM93UBDOqU+32A@mail.gmail.com>
MIME-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Releases of BitBake to package for Fedora?
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
X-List-Received-Date: Tue, 07 Nov 2017 01:08:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 7 November 2017 12:27:07 PM NZDT Andre McCurdy wrote:
> On Mon, Nov 6, 2017 at 11:18 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Tuesday, 7 November 2017 8:16:06 AM NZDT Andre McCurdy wrote:
> >> On Mon, Nov 6, 2017 at 3:33 AM, Burton, Ross <ross.burton@intel.com> 
wrote:
> >> > The bitbake API isn't really stable and has a reasonable amount of 
change,
> >> > so if you were to package it then there's a good chance it would be out 
of
> >> > date within six months and people who wanted to use the latest oe-core
> >> > release against the packaged bitbake would hit API version errors.  The
> >> > recommended usage is to bundle in some way bitbake and the metadata
> >> > (combo-layer, submodules, repo, whatever).
> >> >
> >> > As such there are no tarballs.  There are branches for each version and
> >> > commits where the version is bumped, if you're really determined to
> >> > package a snapshot.
> >>
> >> If there's no realistic hope of (or need for) using bitbake standalone
> >> then maybe it's time to move bitbake into oe-core?
> >
> > Well, there are folks out there using bitbake with their own (non-OE)
> > metadata,
> 
> Are any of those projects public? I'd be interested to see how that's
> being done.

The main one I am aware of being active in recent times is Isar:

  https://github.com/ilbers/isar
  https://www.youtube.com/watch?v=GHHOxrtYBMc

There have been others mentioned on the bitbake mailing list over time but I 
don't recall any others that were public.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

