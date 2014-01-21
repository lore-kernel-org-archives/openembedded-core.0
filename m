Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id C1F266E367
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2014 22:42:57 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s0LMgkvK005591; Tue, 21 Jan 2014 22:42:46 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wgkmV2pO1zMA; Tue, 21 Jan 2014 22:42:45 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s0LMgfiP005588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 21 Jan 2014 22:42:43 GMT
Message-ID: <1390344155.874.133.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Tue, 21 Jan 2014 22:42:35 +0000
In-Reply-To: <3477416.rr5kvlOrkS@peggleto-mobl5.ger.corp.intel.com>
References: <1390306673-9822-1-git-send-email-paul.eggleton@linux.intel.com>
	<1390342998.874.122.camel@ted>
	<3477416.rr5kvlOrkS@peggleto-mobl5.ger.corp.intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 21 Jan 2014 22:42:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-01-21 at 22:39 +0000, Paul Eggleton wrote:
> On Tuesday 21 January 2014 22:23:18 Richard Purdie wrote:
> > On Tue, 2014-01-21 at 12:17 +0000, Paul Eggleton wrote:
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
> > >  meta/conf/bitbake.conf | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> > > index 57668e1..4fb6a1c 100644
> > > --- a/meta/conf/bitbake.conf
> > > +++ b/meta/conf/bitbake.conf
> > > @@ -241,7 +241,7 @@ This package contains documentation."
> > > 
> > >  LICENSE = "INVALID"
> > >  MAINTAINER = "OE-Core Developers
> > >  <openembedded-core@lists.openembedded.org>"> 
> > > -HOMEPAGE = "unknown"
> > > +HOMEPAGE = ""
> > 
> > Perhaps we just shouldn't set it at all in bitbake.conf and let recipes
> > elect to set it?
> 
> Maybe, but I think that alone isn't necessarily enough because then converting 
> the value to a string gives you "None" (and this is what happens with the rpm 
> backend).

Lets fix the rpm backend then ;-)

Cheers,

Richard


