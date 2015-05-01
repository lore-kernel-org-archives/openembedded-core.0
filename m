Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7FD8673E1E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 May 2015 15:59:50 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 01 May 2015 08:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,351,1427785200"; d="scan'208";a="564881252"
Received: from sbkleing-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.27.246])
	by orsmga003.jf.intel.com with ESMTP; 01 May 2015 08:59:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 01 May 2015 16:59:50 +0100
Message-ID: <3858025.SnKaDLqU4I@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.6 (Linux/3.19.5-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <2485695.8j5bf1Bp03@peggleto-mobl.ger.corp.intel.com>
References: <cover.1430314621.git.paul.eggleton@linux.intel.com>
	<1430389061.9508.14.camel@linux.intel.com>
	<2485695.8j5bf1Bp03@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/6] recipetool: ensure git clone is a full clone when extracting
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
X-List-Received-Date: Fri, 01 May 2015 15:59:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 30 April 2015 11:26:34 Paul Eggleton wrote:
> > I just find the term "full clone" a bit misleading here. I somehow tend
> > to associate it with a mirrored clone / cloning all refs / cloning with
> > full history. Could the term used above be "independent clone" or
> > "standalone clone" or something?
> 
> Yep, sounds reasonable - I'll rename it in a v2.

Actually I'm thinking it's not worth sending a v2, I've just updated it on the 
branch since it's a straight rename.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

