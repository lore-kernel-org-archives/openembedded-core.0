Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id F305B71AAD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 03:46:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 30 Oct 2016 20:46:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,573,1473145200"; d="scan'208";a="1061603938"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by fmsmga001.fm.intel.com with ESMTP; 30 Oct 2016 20:46:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Oct 2016 16:45:58 +1300
Message-ID: <2141657.IdrglOmXLR@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.9-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1552039.tK8Y5jYAKD@peggleto-mobl.ger.corp.intel.com>
References: <20161029194615.19954-1-raj.khem@gmail.com>
	<CAMKF1sriW41+1MTxTuBHQAbeR+b0LM65fkuUDRL-HapKSLze0A@mail.gmail.com>
	<1552039.tK8Y5jYAKD@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] boost: Fix SRC_URI checksums
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
X-List-Received-Date: Mon, 31 Oct 2016 03:46:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Mon, 31 Oct 2016 16:27:15 Paul Eggleton wrote:
> On Sun, 30 Oct 2016 10:39:34 Khem Raj wrote:
> > On Sun, Oct 30, 2016 at 9:40 AM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > On Sat, 2016-10-29 at 12:46 -0700, Khem Raj wrote:
> > >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > 
> > > Why, what happened?
> > 
> > I haven't checked in detail but after the recent master commits my
> > builds started to fail with checksum errors.
> > since it was happening on two different machines I though it might
> > have been over sight.
> 
> We need to be extremely cautious changing the SRC_URI checksums when there's
> a mismatch, otherwise we might as well not have them at all. The SRC_URI
> checksums definitely were changed when the last update was done, so this
> doesn't appear to be a case where they accidentally weren't updated.
> 
> Alex, any idea what's happened here? Do you have the originals from when you
> did the upgrade?

Hmm, it seems we aren't the only ones to have hit this:

  http://osdir.com/ml/blfs-dev/2016-10/msg00013.html

That said, I still don't think we should blindly trust the latest archives 
until we're sure of what the differences are.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

