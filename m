Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rpurdie@rpsys.net>) id 1RnI0X-0004kE-RO
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 00:00:02 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0HMqOAO012854
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 22:52:24 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12196-06 for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 22:52:20 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0HMqHxo012848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 22:52:18 GMT
Message-ID: <1326840736.2529.1.camel@ted>
From: Richard Purdie <rpurdie@rpsys.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 17 Jan 2012 22:52:16 +0000
In-Reply-To: <CAPhnLPDgJpgmAWoc_QGJfgV-gmZBQPpWtY8T3LKe-T_bp6532g@mail.gmail.com>
References: <cover.1326831402.git.nitin.a.kamble@intel.com>
	<b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
	<4F15EB93.9090301@linux.intel.com>
	<CAPhnLPDgJpgmAWoc_QGJfgV-gmZBQPpWtY8T3LKe-T_bp6532g@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/5] bdwgc: new recipe for autogen
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jan 2012 23:00:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-01-17 at 14:20 -0800, Flanagan, Elizabeth wrote:
> On Tue, Jan 17, 2012 at 1:43 PM, Saul Wold <sgw@linux.intel.com> wrote:
> > On 01/17/2012 12:30 PM, nitin.a.kamble@intel.com wrote:
> >>
> >> From: Nitin A Kamble<nitin.a.kamble@intel.com>
> >>
> >> This recipe is needed by guile.
> >> And guile is needed for autogen.
> >>
> >> Signed-off-by: Nitin A Kamble<nitin.a.kamble@intel.com>
> >> ---
> >>  meta/recipes-support/bdwgc/bdwgc_20110107.bb |   38
> >> ++++++++++++++++++++++++++
> >>  1 files changed, 38 insertions(+), 0 deletions(-)
> >>  create mode 100644 meta/recipes-support/bdwgc/bdwgc_20110107.bb
> >>
> >> diff --git a/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> >> b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> >> new file mode 100644
> >> index 0000000..1aaa5b8
> >> --- /dev/null
> >> +++ b/meta/recipes-support/bdwgc/bdwgc_20110107.bb
> >> @@ -0,0 +1,38 @@
> >> +SUMMARY = "A garbage collector for C and C++"
> >> +
> >> +DESCRIPTION = "The Boehm-Demers-Weiser conservative garbage collector can
> >> be\
> >> + used as a garbage collecting replacement for C malloc or C++ new. It
> >> allows\
> >> + you to allocate memory basically as you normally would, without
> >> explicitly\
> >> + deallocating memory that is no longer useful. The collector
> >> automatically\
> >> + recycles memory when it determines that it can no longer be otherwise\
> >> + accessed.\
> >> +  The collector is also used by a number of programming language\
> >> + implementations that either use C as intermediate code, want to
> >> facilitate\
> >> + easier interoperation with C libraries, or just prefer the simple
> >> collector\
> >> + interface.\
> >> +  Alternatively, the garbage collector may be used as a leak detector for
> >> C\
> >> + or C++ programs, though that is not its primary goal.\
> >> +  Empirically, this collector works with most unmodified C programs,
> >> simply\
> >> + by replacing malloc with GC_malloc calls, replacing realloc with
> >> GC_realloc\
> >> + calls, and removing free calls."
> >> +
> >> +HOMEPAGE = "http://www.hpl.hp.com/personal/Hans_Boehm/gc/"
> >> +SECTION = "devel"
> >> +LICENSE = "custom"
> >
> > What's custom?  Is this the correct LICENSE name to use here?
> > Beth comments?
> 
> custom is certainly not correct. This one isn't a particularly easy one.
> 
> openSuSE says BSD-3-Clause. This isn't actually true from what I'm
> seeing. It looks to me more like:
> 
> LICENSE = "MIT & FSF-Unlimited & GPL-2.0"
> 
> linux_threads.c and Makefile.am appear to be MIT.
> 
> "Several files supporting GNU-style builds are copyrighted by the Free
> Software Foundation, and carry a different license from that given
> below." I would assume that that is FSF-Unlimited.
> 
> The main portion of the license is MIT.
> 
> It does mention that there are some GPL code in here:
> 
> "A few of the files needed to use the GNU-style build procedure come with
> slightly different licenses, though they are all similar in spirit.  A few
> are GPL'ed, but with an exception that should cover all uses in the
> collector.  (If you are concerned about such things, I recommend you look
> at the notice in config.guess or ltmain.sh.)"
> 
> ltmain.sh is GPL-2.0. Is it distributed in the package? If so, then I
> would add it to LICENSE.

ltmain.sh is from libtool and is a build time tool used by *many* of our
recipes. I don't think that one needs to be mentioned in LICENSE, or if
it does, we have much bigger problems than this recipe.

Cheers,

Richard



