Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3833371AA6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 03:27:19 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP; 30 Oct 2016 20:27:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,573,1473145200"; d="scan'208";a="25570734"
Received: from mbi370x-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.185.81])
	by fmsmga005.fm.intel.com with ESMTP; 30 Oct 2016 20:27:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alexander.kanavin@linux.intel.com>
Date: Mon, 31 Oct 2016 16:27:15 +1300
Message-ID: <1552039.tK8Y5jYAKD@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.9-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAMKF1sriW41+1MTxTuBHQAbeR+b0LM65fkuUDRL-HapKSLze0A@mail.gmail.com>
References: <20161029194615.19954-1-raj.khem@gmail.com>
	<1477845629.23123.20.camel@linuxfoundation.org>
	<CAMKF1sriW41+1MTxTuBHQAbeR+b0LM65fkuUDRL-HapKSLze0A@mail.gmail.com>
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
X-List-Received-Date: Mon, 31 Oct 2016 03:27:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sun, 30 Oct 2016 10:39:34 Khem Raj wrote:
> On Sun, Oct 30, 2016 at 9:40 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Sat, 2016-10-29 at 12:46 -0700, Khem Raj wrote:
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > 
> > Why, what happened?
> 
> I haven't checked in detail but after the recent master commits my
> builds started to fail with checksum errors.
> since it was happening on two different machines I though it might
> have been over sight.

We need to be extremely cautious changing the SRC_URI checksums when there's a 
mismatch, otherwise we might as well not have them at all. The SRC_URI 
checksums definitely were changed when the last update was done, so this 
doesn't appear to be a case where they accidentally weren't updated.

Alex, any idea what's happened here? Do you have the originals from when you 
did the upgrade?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

