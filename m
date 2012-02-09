Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RvdJm-0007zV-Bl for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 00:22:23 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q19NEFwV022426;
	Thu, 9 Feb 2012 23:14:15 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21447-10; Thu,  9 Feb 2012 23:14:11 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q19NE8I3022414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 9 Feb 2012 23:14:09 GMT
Message-ID: <1328829256.10451.28.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 09 Feb 2012 23:14:16 +0000
In-Reply-To: <20120209223044.GF10322@jama.jama.net>
References: <20120201151531.BE60410330@opal>
	<20120201153742.GA6969@jama.jama.net>
	<4F344389.7060005@linux.intel.com>
	<20120209223044.GF10322@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [oe-commits] Saul Wold : opkg-utils: convert to git repo at git.yoctoproject.org
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
X-List-Received-Date: Thu, 09 Feb 2012 23:22:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-02-09 at 23:30 +0100, Martin Jansa wrote:
> On Thu, Feb 09, 2012 at 02:07:05PM -0800, Saul Wold wrote:
> > On 02/01/2012 07:37 AM, Martin Jansa wrote:
> > > On Wed, Feb 01, 2012 at 03:15:31PM +0000, git@git.openembedded.org wrote:
> > >> Module: openembedded-core.git
> > >> Branch: master
> > >> Commit: b44717c29c4f50917570039adf896680d24bb216
> > >> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=b44717c29c4f50917570039adf896680d24bb216
> > >>
> > >> Author: Saul Wold<sgw@linux.intel.com>
> > >> Date:   Tue Jan 31 10:27:53 2012 -0800
> > >>
> > >> opkg-utils: convert to git repo at git.yoctoproject.org
> > >>
> > >> The svn.openmoko.org site seems to have become unstable, make a copy
> > >> and convert to git at git.yoctoproject.org to preserve history
> > >>
> > >> [YOCTO #1867]
> > >>
> > >> Signed-off-by: Saul Wold<sgw@linux.intel.com>
> > >>
> > >> ---
> > >>
> > >>   .../{opkg-utils_svn.bb =>  opkg-utils_git.bb}       |   10 +++++-----
> > >>   1 files changed, 5 insertions(+), 5 deletions(-)
> > >>
> > >> diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > >> similarity index 82%
> > >> rename from meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> > >> rename to meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > >> index 9702131..d2dfda6 100644
> > >> --- a/meta/recipes-devtools/opkg-utils/opkg-utils_svn.bb
> > >> +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > >> @@ -6,11 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> > >>                       file://opkg.py;beginline=1;endline=18;md5=15917491ad6bf7acc666ca5f7cc1e083"
> > >>   RDEPENDS_${PN} = "python"
> > >>   RDEPENDS_${PN}_virtclass-native = ""
> > >> -SRCREV = "4747"
> > >> -PV = "0.1.8+svnr${SRCPV}"
> > >> -PR = "r7"
> > >> +SRCREV = "002d29bc605d7c2d02e4cf20a43c5277c15f5597"
> > >> +PV = "0.1.8+git${SRCPV}"
> > >
> > > Should this be +git or +gitr?
> > >
> > I believe that ultimately it should be +git, but we can't just changes 
> > these as it will cause the PV to go backwards.  I would suggest that as 
> > we move forward and PV's get updated we can move to +git instead of 
> > +gitr for oe-core
> 
> Why +git when we have +svnr not +svn? and both systems call it revision?

In svn, the syntax was always "rXXX" so you could tell it was a revision
that was being referred to rather than something else (e.g. a date) and
the convention carried to the version naming. In git, its kind of
obvious its the hash but in some cases we've carried the "r" along.

> Wouldn't it be more consistent to use +gitr and then also we wouldn't
> have this problem with PV going backwards..
> 
> I've another 137 recipes with +gitr in meta-smartphone where I'm not
> going to wait for PV change..

I'm tempted to recommend "git" and let "gitr" die out, it looks like
some kind of special version of git and doesn't add anything. Its not
wrong but its not particularly useful either. The point about PV going
backwards is a pain and is the main thing stopping me suggesting we just
use "git" everywhere right now...

Cheers,

Richard



