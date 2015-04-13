Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1459473D38
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 16:46:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 13 Apr 2015 09:46:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,571,1422950400"; d="scan'208";a="708224947"
Received: from padice-mobl5.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.3.91])
	by fmsmga002.fm.intel.com with ESMTP; 13 Apr 2015 09:46:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 13 Apr 2015 17:46:03 +0100
Message-ID: <2445584.6Z3eITqUyt@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.4 (Linux/3.18.9-200.fc21.x86_64; KDE/4.14.6; x86_64; ; )
In-Reply-To: <20150413162828.GJ2330@jama>
References: <cover.1428939870.git.paul.eggleton@linux.intel.com>
	<abe2d51f35b85dcbbd43c61d9309bfd7e38d3244.1428939870.git.paul.eggleton@linux.intel.com>
	<20150413162828.GJ2330@jama>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] classes/package: clarify installed-vs-shipped message
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
X-List-Received-Date: Mon, 13 Apr 2015 16:46:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 13 April 2015 18:28:28 Martin Jansa wrote:
> On Mon, Apr 13, 2015 at 04:44:52PM +0100, Paul Eggleton wrote:
> > Based on the number of times I've had to explain it over the years it
> > seems that a lot of new users don't immediately realise what is meant
> > by "shipped" here (nor should we expect them to) so let's at least
> > mention packaging and briefly tell the user what they need to do. (I was
> > going to go into more detail in the message, but there is really more
> > detail than can be covered succinctly here.)
> > 
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> > 
> >  meta/classes/package.bbclass | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > index 5558d0d..9790e9d 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -1132,12 +1132,13 @@ python populate_packages () {
> > 
> >                  unshipped.append(path)
> >      
> >      if unshipped != []:
> > -        msg = pn + ": Files/directories were installed but not shipped"
> > +        msg = pn + ": Files/directories were installed but not shipped in
> > any package:"> 
> >          if "installed-vs-shipped" in (d.getVar('INSANE_SKIP_' + pn, True) 
or "").split():
> >              bb.note("Package %s skipping QA tests: installed-vs-shipped"
> >              % pn)
> >          
> >          else:
> >              for f in unshipped:
> >                  msg = msg + "\n  " + f
> > 
> > +            msg = msg + "\nPlease either set FILES such that these items
> > are packaged, or alternatively delete them within do_install"
> We should also mention the possibility to fix Makefile.am,
> CMakeLists.txt, ... not to install them in first place.

This is the sort of thing I was alluding to in the commit message, I'd rather 
not get into too many specifics, or the message is going to end up very long 
indeed covering all of the things you need to pay attention to. That kind of 
thing is much better covered in the documentation.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

