Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4F45160119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 04:48:36 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 07 Jul 2016 21:48:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,327,1464678000"; d="scan'208";a="842573830"
Received: from jtsai-mobl5.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.253])
	by orsmga003.jf.intel.com with ESMTP; 07 Jul 2016 21:48:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 08 Jul 2016 16:48:33 +1200
Message-ID: <86352560.zLVpfW8Zur@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.5.7-202.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CAMKF1so-T0RKMU3Otsv56oP6ke=kxegb909vjETZo4ZnHwy6rw@mail.gmail.com>
References: <cover.1467849364.git.paul.eggleton@linux.intel.com>
	<4148817.v0aE1nWUOy@peggleto-mobl.ger.corp.intel.com>
	<CAMKF1so-T0RKMU3Otsv56oP6ke=kxegb909vjETZo4ZnHwy6rw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/6] lib/oe/patch: handle encoding differences in patch files
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
X-List-Received-Date: Fri, 08 Jul 2016 04:48:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wed, 06 Jul 2016 18:56:09 Khem Raj wrote:
> On Wed, Jul 6, 2016 at 6:45 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > On Wed, 06 Jul 2016 17:40:03 Khem Raj wrote:
> >> On Wed, Jul 6, 2016 at 4:57 PM, Paul Eggleton
> >> 
> >> <paul.eggleton@linux.intel.com> wrote:
> >> > With Python 3, the encoding of a file is significant; several recipes
> >> > in
> >> > OE-Core have patches which are not fully utf-8 decodable e.g. man,
> >> > lrzsz, and gstreamer1.0-libav, leading to errors when using devtool's
> >> > modify, upgrade or extract subcommands on these recipes. To work around
> >> > this, try reading the patch file as utf-8 first and if that fails try
> >> > latin-1 before giving up.
> >> 
> >> while this makes devtool robust. I think it will also be a good
> >> opportunity to inform
> >> the user/developer of the utf-8 non compliant file and may be a hint
> >> on how to fix it if possible
> > 
> > Sure, I could easily have it print a warning, but I'm not sure this is
> > going to be fixable for all cases. If the patch header is the source of
> > the non-UTF8 characters then it's easy, but what about if the code being
> > patched has non- UTF8 encoding? Surely in that case the patch has to
> > correspond?
> 
> yes if the patch is patching a non UTF code for some reason then that
> may not be flagged.

I'm not about to dissect the patch in this context just to give a warning 
though - either we succeed in decoding it or we don't. If we want to do so as 
a test on incoming patches, we could, though I suspect we have bigger fish to 
fry.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

