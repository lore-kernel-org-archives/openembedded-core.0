Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 232AE6E367
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:40:11 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 14:40:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="442543556"
Received: from ssaevars-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.232])
	by orsmga001.jf.intel.com with ESMTP; 21 Jan 2014 14:39:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 21 Jan 2014 22:39:44 +0000
Message-ID: <3477416.rr5kvlOrkS@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <1390342998.874.122.camel@ted>
References: <1390306673-9822-1-git-send-email-paul.eggleton@linux.intel.com>
	<1390342998.874.122.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] conf/bitbake.conf: default HOMEPAGE to blank instead of unknown
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
X-List-Received-Date: Tue, 21 Jan 2014 22:40:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 January 2014 22:23:18 Richard Purdie wrote:
> On Tue, 2014-01-21 at 12:17 +0000, Paul Eggleton wrote:
> > The default value for HOMEPAGE of "unknown" has been in place since the
> > early OE-Classic days, but it doesn't really make sense - "unknown" is
> > not a valid URL and it just means we have to explicitly check for this
> > hardcoded string if we're displaying the value in some form of UI, such
> > as Toaster. There is some code in the unmaintained oelint.bbclass to
> > check for this value, presumably on the assumption that the recipe will
> > explicitly set it to "" if there really isn't a homepage, but looking at
> > recipes in OE-Core and meta-oe suggests that we haven't been using this
> > convention for some time (with one exception in the latter) and it's
> > rather uncommon these days to have no URL to associate with a recipe.
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  meta/conf/bitbake.conf | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > index 57668e1..4fb6a1c 100644
> > --- a/meta/conf/bitbake.conf
> > +++ b/meta/conf/bitbake.conf
> > @@ -241,7 +241,7 @@ This package contains documentation."
> > 
> >  LICENSE = "INVALID"
> >  MAINTAINER = "OE-Core Developers
> >  <openembedded-core@lists.openembedded.org>"> 
> > -HOMEPAGE = "unknown"
> > +HOMEPAGE = ""
> 
> Perhaps we just shouldn't set it at all in bitbake.conf and let recipes
> elect to set it?

Maybe, but I think that alone isn't necessarily enough because then converting 
the value to a string gives you "None" (and this is what happens with the rpm 
backend).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

