Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF7A6C91D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 17:39:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Sep 2013 10:39:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,925,1371106800"; d="scan'208";a="379615570"
Received: from unknown (HELO helios.localnet) ([10.252.123.194])
	by orsmga001.jf.intel.com with ESMTP; 17 Sep 2013 10:39:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: JC <jc@vtkloud.com>
Date: Tue, 17 Sep 2013 18:39:25 +0100
Message-ID: <1676874.raqzZUa4qa@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52386CA6.8070206@vtkloud.com>
References: <1379416979-10333-1-git-send-email-jc@vtkloud.com>
	<2046387.NLfZYpzpll@helios> <52386CA6.8070206@vtkloud.com>
MIME-Version: 1.0
Cc: JC Verdie <jc.verdie@innotis.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Integration of former (deprecated?) libao recipe from https://github.com/tworaz/oe-tworaz/blob/master/meta-jlime/recipes-support/libao/libao_1.1.0.bb
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
X-List-Received-Date: Tue, 17 Sep 2013 17:39:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 17 September 2013 10:52:22 JC wrote:
> On 17/09/2013 09:18, Paul Eggleton wrote:
> > Right. A few other things:
> > 
> > 1) Since nothing in OE-Core needs this at the moment, this should really
> > be added to meta-multimedia (within the meta-openembedded repository) and
> > sent to the openembedded-devel mailing list marked with [meta-multimedia]
> > in the subject.
> > 
> > 2) Please use ${BP} in SRC_URI rather than ${P} so that multilib builds
> > can work
> > 
> > 3) It would be nice to have SUMMARY and HOMEPAGE set in the recipe (and
> > possibly also DESCRIPTION if you have a longer description).
> 
> I sent a new one trying to comply with your reco. But I could not work
> on head anymore, since it's broken (at least for me). I'm afraid the
> patch appears to belong to "dylan" but I'm not a git guru enough to
> check how to commit it at the right place (I mean, I could simply use my
> non working git clone of HEAD and commit it untested but I'm not sure
> that's the way to go).
> 
> I'm not sure how to add the [meta-multimedia] tag to the git send-mail,
> also. Sorry for being dumb :(

It's not being dumb, we all had to go through this at some point :)

You just need to re-send your latest version using git-send-email with the 
--subject-prefix="meta-multimedia][PATCH" option to the openembedded-
devel@lists.openembedded.org mailing list rather than this one.

FWIW I did a quick build-test on top of master and it built successfully at 
least.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

