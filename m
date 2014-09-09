Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 45A65605BD;
	Tue,  9 Sep 2014 13:02:29 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Sep 2014 05:56:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,491,1406617200"; d="scan'208";a="600221887"
Received: from mcorkery-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.35])
	by orsmga002.jf.intel.com with ESMTP; 09 Sep 2014 06:02:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bryan <just4tech83@gmail.com>
Date: Tue, 09 Sep 2014 14:02:25 +0100
Message-ID: <48633854.zRbls2qSnV@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-201.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <CAD2C2VTOgCMRsq4em2Bd0hQ4Nz2Zq=B2vXezAw7QXQmhkQOsRQ@mail.gmail.com>
References: <CAD2C2VTOgCMRsq4em2Bd0hQ4Nz2Zq=B2vXezAw7QXQmhkQOsRQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Backporting of latest recipes on oe-classic
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
X-List-Received-Date: Tue, 09 Sep 2014 13:02:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 09 September 2014 18:23:24 Bryan wrote:
>    We have some queries regarding OE-Classic.
> 1. Where can we find latest recipes for oe-classic. 

http://cgit.openembedded.org/cgit.cgi/openembedded/

That's as up-to-date as it gets. There might be other forked repositories 
floating around, but that is the last official one.

> Does oe-classic is still get updation for latest package support?

No, as discussed on IRC, OE-Classic is now unmaintained. OE-Core and layers on 
top of it should ideally be used instead.
 
> 2. How can we compile latest recipes of oe-core on oe-classic and ofcourse
> there bitbake version would be different.Basically, we can say we need to
> backport the recipe to classic.
> e.g. gtk+2.20.1 & above, glibc-2.11.3 & above

If you are determined to stay with OE-Classic I think you'd be better off just 
upgrading the recipes in OE-Classic - going backwards is going to be more 
painful.

Here's the only semi-related information we have, which is about migration in 
the other direction; it could be helpful in terms of providing pointers:

  http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

