Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UKYIx-0001vH-6J
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 19:09:03 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 26 Mar 2013 10:52:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,913,1355126400"; d="scan'208";a="219101279"
Received: from unknown (HELO helios.localnet) ([10.255.13.152])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Mar 2013 10:52:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Tue, 26 Mar 2013 17:52 +0000
Message-ID: <6500457.3vgtoKXQDv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.1 (Linux/3.5.0-26-generic; KDE/4.10.1; i686; ; )
In-Reply-To: <1364318752.6320.27.camel@phil-desktop.brightsign>
References: <cover.1363156578.git.Qi.Chen@windriver.com>
	<5482882.4phbAeRO1n@helios>
	<1364318752.6320.27.camel@phil-desktop.brightsign>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rm_work.bbclass: inhibit rm_work per recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Mar 2013 18:09:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 26 March 2013 17:25:52 Phil Blundell wrote:
> This doesn't seem (at the risk of invoking an unintended metaphor)
> entirely black or white.  Maybe it should just be "RM_WORK_EXCEPTIONS"
> or something.

"exception" has another meaning to my mind. I've sent out a patch to change it 
to RM_WORK_EXCLUDE.

> Of course, you can get the same effect in your distro configuration by
> saying:
> 
> RM_WORK = "rm_work"
> RM_WORK_pn-icu-native = ""
> INHERIT += "${RM_WORK}"
> 
> so I must admit to being slightly ambivalent about whether the extra
> syntactic sugar is all that valuable.  

True, that works; I think having an explicit variable makes it easier to 
understand what's going on though and is a little harder to typo and have your 
work removed when you didn't want it to be ;)

> And then again you can always use rm_old_work instead. :-)

I'm sure this has come up before, but is rm_old_work something we ought to 
have in OE-Core?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


