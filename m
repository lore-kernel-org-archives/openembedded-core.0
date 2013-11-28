Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 836736D77B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2013 10:17:20 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Nov 2013 02:17:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,790,1378882800"; d="scan'208";a="443617031"
Received: from unknown (HELO helios.localnet) ([10.252.122.17])
	by orsmga002.jf.intel.com with ESMTP; 28 Nov 2013 02:17:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chris Larson <clarson@kergoth.com>
Date: Thu, 28 Nov 2013 10:17:09 +0000
Message-ID: <1438663.kjvipZjc12@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CABcZANmBnxydmGn6OstDVu4TAB1urdN5teb2fAP6z02W5C38fQ@mail.gmail.com>
References: <cover.1385571298.git.stefanx.stanacar@intel.com>
	<CABcZANmBnxydmGn6OstDVu4TAB1urdN5teb2fAP6z02W5C38fQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Script and layer for running tests
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
X-List-Received-Date: Thu, 28 Nov 2013 10:17:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Chris,

On Wednesday 27 November 2013 11:42:06 Chris Larson wrote:
> On Wed, Nov 27, 2013 at 10:08 AM, Stefan Stanacar <
> stefanx.stanacar@intel.com> wrote:
> > This series adds an oe-selftest script, some modules and a new layer
> > meta-selftest.
> > which are meant to help in writing tests (using python unittest) for
> > various
> > bitbake tools/scripts as well as simple output checks or do
> > complete builds with different options (with the emphasis that everything
> > checked
> > is done outside of bitbake context, just like a human would do.) For more
> > details,
> > please see YOCTO #4740.
> 
> Will this have its own repository like all the other poky integrated
> layers? It really should, in my opinion.

It really needs to stay in the same place as the tests that rely on it; they 
can't work without it. It might be suggested that the tests should go 
elsewhere with them; but I don't think that would make sense - we want people 
to be able to run these tests easily if they make changes to OE-Core to check 
if they have caused any regressions.

If you have a look at the layer, there's not a lot in it, and I wouldn't 
expect a lot to be added in future. One possible change would be to just have 
the layer created on the fly in some temporary directory by the tests 
themselves, rather than having it in the repository; on the other hand it does 
make it a bit more difficult to look into outside of the test environment.

Thoughts?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

