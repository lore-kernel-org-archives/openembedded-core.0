Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 47BBA6B389
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 13:18:24 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Sep 2013 06:18:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,923,1371106800"; d="scan'208";a="403010003"
Received: from unknown (HELO helios.localnet) ([10.252.123.194])
	by fmsmga002.fm.intel.com with ESMTP; 17 Sep 2013 06:18:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: JC <jc@vtkloud.com>
Date: Tue, 17 Sep 2013 14:18:17 +0100
Message-ID: <2046387.NLfZYpzpll@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CANyK_8dVMs0gt59z7fL0Woa-zjKW2M6p+qczQBBjJXSibhsNQg@mail.gmail.com>
References: <1379416979-10333-1-git-send-email-jc@vtkloud.com>
	<CANyK_8dVMs0gt59z7fL0Woa-zjKW2M6p+qczQBBjJXSibhsNQg@mail.gmail.com>
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
X-List-Received-Date: Tue, 17 Sep 2013 13:18:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 17 September 2013 14:07:01 Paul Barker wrote:
> On 17 September 2013 12:22, JC <jc@vtkloud.com> wrote:
> > From: JC Verdie <jc.verdie@innotis.org>
> > 
> > Signed-off-by: JC Verdie <jc.verdie@innotis.org>
> 
> Couple of tips on the commit message:
> 
> First line of the commit message should be "libao: add version 1.1.0"
> or similar and should be and fairly short, put the link to the source
> within the body of the commit message and possibly reference the
> author of the recipe you're copying this from if you can.

Right. A few other things:

1) Since nothing in OE-Core needs this at the moment, this should really be 
added to meta-multimedia (within the meta-openembedded repository) and sent to 
the openembedded-devel mailing list marked with [meta-multimedia] in the 
subject.

2) Please use ${BP} in SRC_URI rather than ${P} so that multilib builds can 
work

3) It would be nice to have SUMMARY and HOMEPAGE set in the recipe (and 
possibly also DESCRIPTION if you have a longer description).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

