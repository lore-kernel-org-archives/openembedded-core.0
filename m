Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id C69D46EADD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2014 16:56:51 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 14 Feb 2014 08:56:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,845,1384329600"; d="scan'208";a="475322717"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.123.241])
	by fmsmga001.fm.intel.com with ESMTP; 14 Feb 2014 08:56:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Matthieu CRAPET <Matthieu.CRAPET@ingenico.com>
Date: Fri, 14 Feb 2014 16:56:23 +0000
Message-ID: <1971639.OmqiE8xRoy@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.12.10-300.fc20.x86_64; KDE/4.12.2; x86_64; ;
	)
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B57540E22@COSNADEXC13.usr.ingenico.loc>
References: <1392395660-28806-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<8672BB614B4CCA40A6B3BDD6FD82050B57540E22@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v1] recipes: convert remaining SUMMARY/DESCRIPTION	cosmetic issues
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
X-List-Received-Date: Fri, 14 Feb 2014 16:56:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Matthieu,

Thanks for looking at this.

On Friday 14 February 2014 16:42:33 Matthieu CRAPET wrote:
> Few explanations ;) Seen in:
> https://wiki.yoctoproject.org/wiki/Janitors
> 
> Didn't find any opened bugtracker.
> 
> These recipes are "pending", i.e. 80 < len(SUMMARY) < 95:
> 
> meta/recipes-support/libunistring/libunistring_0.9.3.bb
> meta/recipes-devtools/devel-config/nfs-export-root.bb
> meta/recipes-devtools/autogen/autogen-native_5.18.2.bb
> 
> Should I translate them to DESCRIPTION ?

If you add a shorter SUMMARY at the same time, sure. Having a reasonable 
SUMMARY is more important than DESCRIPTION, IMO.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

