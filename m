Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0734E6BF4E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 16:38:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2014 08:34:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,535,1389772800"; d="scan'208";a="461272552"
Received: from mcmahond-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.208])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2014 08:38:40 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 16:38:39 +0000
Message-ID: <19353110.0dHagEzKPJ@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.3-201.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <5014991.yOqVctVWSl@helios>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
	<52C0CDD6.4030904@windriver.com> <5014991.yOqVctVWSl@helios>
MIME-Version: 1.0
Cc: Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 01/38] *-basic: rename to *-standardlinux
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
X-List-Received-Date: Mon, 24 Feb 2014 16:38:45 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 30 December 2013 12:59:26 Paul Eggleton wrote:
> On Monday 30 December 2013 09:35:18 Robert Yang wrote:
> > I'm afraid that the standardlinux maybe a little confused with
> > linuxstdbase, bu I don't have any better idea about it.
> 
> You could be right. I've thought for a long time about renaming this and
> haven't been able to come up with anything better. On the other hand, in our
> current configuration we are actually using the basic/standardlinux
> packagegroup as part of our LSB images; although that might not be the
> right thing to continue doing - LSB probably ought to be independent.
> 
> FWIW, let's consider this particular patch as RFC, maybe someone else has a
> better idea of what to name it. I am very much convinced that "basic" is not
> the right name though.

So, has anyone got any better ideas for the name of core-image-basic and 
packagegroup-core-basic?

The idea is that these are meant to contain things that you might have on a 
more traditional or full-featured Linux system. Somehow "-traditionallinux" 
doesn't really work either.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

