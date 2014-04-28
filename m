Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C4BAC6059B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Apr 2014 15:17:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Apr 2014 08:17:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,944,1389772800"; d="scan'208";a="529885535"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.52])
	by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2014 08:17:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Apr 2014 16:17:15 +0100
Message-ID: <8089728.HxKxkhHf8U@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.10-200.fc20.x86_64; KDE/4.12.4; x86_64; ;
	)
In-Reply-To: <1A02AEF1-091C-4766-9C84-34DDC0AC5FBD@dominion.thruhere.net>
References: <1373547110-11539-1-git-send-email-cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CEA2F51@IRSMSX105.ger.corp.intel.com>
	<1A02AEF1-091C-4766-9C84-34DDC0AC5FBD@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] xdg-utils: upgrade to 1.1.0-rc1
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
X-List-Received-Date: Mon, 28 Apr 2014 15:17:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 28 April 2014 16:45:06 Koen Kooi wrote:
> Op 28 apr. 2014, om 16:40 heeft Iorga, Cristian <cristian.iorga@intel.com> 
het volgende geschreven:
> > Hello Koen,
> > 
> > Care to go into details why exactly the version is wrong?
> 
> http://www.openembedded.org/wiki/Versioning_Policy
> 
> > In YP Dev Manual, my recipe is given as an example of correct naming:
> > http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#new-re
> > cipe-storing-and-naming-the-recipe Quote:
> > 
> > "Naming Your Recipe: When you name your recipe, you need to follow this 
naming convention:
> >     <basename>_<version>.bb
> > 
> > Use lower-cased characters and do not include the reserved suffixes -native, 
-cross, -initial, or -dev casually (i.e. do not use them as part of your 
recipe name unless the string applies). Here are some examples:
> >     cups_1.7.0.bb
> >     gawk_4.0.2.bb
> >     xdg-utils_1.1.0-rc1.bb"
> 
> And that's why I only read OE policy docs when working on OE.

It's not just OE policy, it's good practice - and hence we should fix the 
manual. To that end I have filed a bug:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=6243

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

