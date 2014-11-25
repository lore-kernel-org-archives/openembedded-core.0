Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E8A946AC82
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Nov 2014 18:34:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Nov 2014 10:34:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,456,1413270000"; d="scan'208";a="637942487"
Received: from justinda-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.255.13.149])
	by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2014 10:34:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 25 Nov 2014 18:34:25 +0000
Message-ID: <1525294.SMRPLqNxZN@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.3-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <CANyK_8c3FpjQ2p1sKtg3Gz7NJp6sC-74o8mZgziHtoOKAe3oOw@mail.gmail.com>
References: <cover.1416934753.git.paul.eggleton@linux.intel.com>
	<CANyK_8c3FpjQ2p1sKtg3Gz7NJp6sC-74o8mZgziHtoOKAe3oOw@mail.gmail.com>
MIME-Version: 1.0
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/7] Developer workflow improvements
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
X-List-Received-Date: Tue, 25 Nov 2014 18:34:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 25 November 2014 17:51:05 Paul Barker wrote:
> On 25 November 2014 at 17:28, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > I've been looking at how to make it easier for application and system
> > component developers to get their work done using the tools we provide,
> > and I believe this patchset is a piece of the solution. There's still a
> > number of other pieces to come, but this should be usable on its own.
> > ...
> > Comments/questions/suggestions welcome!
> 
> This sounds great and looks like it will make some regular tasks quite
> a bit easier!
> 
> One thing which may be useful within recipetool or devtool is a single
> command to create patch files (using `git format-patch`), put them
> into the relevant directory and add the file names to SRC_URI.
> Obviously this assumes the external source tree is a git repo and we
> can trace the local modifications back to either an external master
> branch or an initial state after extracting a source archive. I'm just
> thinking out loud here though, depends if other people think that work
> flow is common enough to be worth creating a shortcut for.

We've been thinking in this direction and it seems like a natural extension to 
me, and one that I do hope to add. The tricky part is as you say, reconciling 
the commits you have in the git tree with the patches you have in the recipe, 
particularly when the user might have modified one or more of those commits.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

