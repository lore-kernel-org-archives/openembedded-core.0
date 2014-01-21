Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 20F296E367
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:22:37 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 21 Jan 2014 14:22:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,697,1384329600"; d="scan'208";a="462504684"
Received: from ssaevars-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.232])
	by fmsmga001.fm.intel.com with ESMTP; 21 Jan 2014 14:22:36 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 21 Jan 2014 22:22:20 +0000
Message-ID: <2497684.SfSpzyn7iv@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.8-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <2733074.aO9SOLRWn4@peggleto-mobl5.ger.corp.intel.com>
References: <1390306673-9822-1-git-send-email-paul.eggleton@linux.intel.com>
	<52DEF00C.20608@linux.intel.com>
	<2733074.aO9SOLRWn4@peggleto-mobl5.ger.corp.intel.com>
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
X-List-Received-Date: Tue, 21 Jan 2014 22:22:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 21 January 2014 22:12:13 Paul Eggleton wrote:
> Hi Saul,
> 
> On Tuesday 21 January 2014 14:09:16 Saul Wold wrote:
> > On 01/21/2014 04:17 AM, Paul Eggleton wrote:
> > > The default value for HOMEPAGE of "unknown" has been in place since the
> > > early OE-Classic days, but it doesn't really make sense - "unknown" is
> > > not a valid URL and it just means we have to explicitly check for this
> > > hardcoded string if we're displaying the value in some form of UI, such
> > > as Toaster. There is some code in the unmaintained oelint.bbclass to
> > > check for this value, presumably on the assumption that the recipe will
> > > explicitly set it to "" if there really isn't a homepage, but looking at
> > > recipes in OE-Core and meta-oe suggests that we haven't been using this
> > > convention for some time (with one exception in the latter) and it's
> > > rather uncommon these days to have no URL to associate with a recipe.
> > > 
> > > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > > ---
> > > 
> > >   meta/conf/bitbake.conf | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index 57668e1..4fb6a1c 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -241,7 +241,7 @@ This package contains documentation."
> > > 
> > >   LICENSE = "INVALID"
> > >   MAINTAINER = "OE-Core Developers
> > >   <openembedded-core@lists.openembedded.org>">
> > > 
> > > -HOMEPAGE = "unknown"
> > > +HOMEPAGE = ""
> > 
> > This seems to have caused a couple of problems with shadow-securetty,
> > updaterc and depmodwrapper.
> > 
> > There may be more.
> 
> Can you perhaps be more specific as to what the problem is?

Oh, I see, rpmbuild blows up with URL blank. Great :/

Let's hold off on this one for now because fixing one or two recipes isn't going 
to cover it.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre

