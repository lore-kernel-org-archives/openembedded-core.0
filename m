Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 723A5734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 08:46:16 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2015 01:46:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,415,1437462000"; d="scan'208";a="548745450"
Received: from tlomotow-mobl.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.18.45])
	by FMSMGA003.fm.intel.com with ESMTP; 26 Aug 2015 01:46:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Date: Wed, 26 Aug 2015 09:46:14 +0100
Message-ID: <1481867.gp5o9Mtvqd@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.5-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <55DD7BAD.8040505@collabora.co.uk>
References: <1440521935.12105.438.camel@linuxfoundation.org>
	<55DD7BAD.8040505@collabora.co.uk>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] os-release: Exclude DATETIME from sstate signature
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
X-List-Received-Date: Wed, 26 Aug 2015 08:46:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 26 August 2015 09:41:17 Joshua Lock wrote:
> On 25/08/15 17:58, Richard Purdie wrote:
> > I'm torn over this, I can see someone wanting this to vary in each
> > build. What pushed me to believe its incorrect in its current form
> > is that it changes for every MACHINE build, making a complete mess
> > if you try and generate package feeds using it.
> 
> It's also worth pointing out that the BUILD_ID isn't included in the
> generated os-release file unless you add BUILD_ID to OS_RELEASE_FIELDS.
> 
> I'm personally not certain whether DATETIME makes sense as BUILD_ID a
> multi-MACHINE distro anyway.

Indeed, since you have to invoke bitbake multiple times, under those 
circumstances you probably ought to be pre-calculating the BUILD_ID and 
passing it into the build.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

