Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C1CA371AE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jan 2017 02:10:51 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 17 Jan 2017 18:10:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,247,1477983600"; d="scan'208";a="214594640"
Received: from jayyinch-mobl6.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.188.18])
	by fmsmga004.fm.intel.com with ESMTP; 17 Jan 2017 18:10:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Date: Wed, 18 Jan 2017 15:10:44 +1300
Message-ID: <2668960.BEK5IJKGgR@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.8.13-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84C2FCC058@ALA-MBA.corp.ad.wrs.com>
References: <007BD92917A2324FA403BCF9A464CF84C2FCC058@ALA-MBA.corp.ad.wrs.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: SRCPV and git
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
X-List-Received-Date: Wed, 18 Jan 2017 02:10:52 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Joe,

On Wed, 18 Jan 2017 01:07:15 Slater, Joseph wrote:
> I believe that SRCPV for a git SRC_URI always contains the string AUTOINC. 
> This could be considered wrong, or just misleading, since SRCREV can be set
> to a sha.  I think I might have brought this up in the past, but I cannot
> remember if there is some reason to retain the AUTOINC unconditionally.

I'll just paste this FAQ link - not that I'd expect anyone to have found this 
since it's still an unofficial FAQ, just to save me typing out the same thing:

  https://wiki.yoctoproject.org/wiki/Technical_FAQ#Why_is_bitbake_showing_.22AUTOINC.22_in_the_version_for_some_recipes.3F

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

