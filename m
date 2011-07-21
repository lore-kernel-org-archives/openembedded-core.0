Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qjpmy-0004LY-85 for openembedded-core@lists.openembedded.org;
	Thu, 21 Jul 2011 11:43:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6L9dM9l031556
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 10:39:22 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30977-04 for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 10:39:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p6L9dDWh031550
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jul 2011 10:39:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20110721061111.GD3443@jama.jama.net>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
	<4E277049.6020308@gmail.com> <4E2778DF.4040001@mentor.com>
	<20110721061111.GD3443@jama.jama.net>
Date: Thu, 21 Jul 2011 10:39:07 +0100
Message-ID: <1311241147.2344.74.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/10] Small fixes
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
X-List-Received-Date: Thu, 21 Jul 2011 09:43:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-21 at 08:11 +0200, Martin Jansa wrote:
> On Wed, Jul 20, 2011 at 05:54:55PM -0700, Tom Rini wrote:
> > On 07/20/2011 05:18 PM, Khem Raj wrote:
> > > On 07/20/2011 02:06 PM, Martin Jansa wrote:
> > >> Fixes for recipes using intltool, distributions not having locales
> > >> support in libc and distutils fix
> > >>
> > >> The following changes since commit
> > >> 0d03800caffc2341b74190d38f7a372223c89f4c:
> > >>
> > >>    lsbsetup_1.0.bb: Change the hardcoded /usr/lib to support multilib
> > >> (2011-07-20 15:43:43 +0100)
> > >>
> > >> are available in the git repository at:
> > >>    git://git.openembedded.org/openembedded-core-contrib jansa/pull
> > >>   
> > >> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=jansa/pull
> > >>
> > >>
> > >> Martin Jansa (10):
> > >>    tcmode-default: set preferred version also for (e)glibc-locale
> > >>    eglibc-package: don't fail without localedef/gconv
> > >>    intltool: inherit perlnative
> > >>    polkit: inherit perlnative
> > >>    shared-mime-info: inherit perlnative
> > >>    xkeyboard-config: inherit perlnative
> > >>    avahi: inherit perlnative
> > >>    vte: inherit perlnative
> > > 
> > > I guess all inherit perlnative patches can me squashed into one
> > 
> > Or not done? :)
> 
> I still see this issue, with
> http://patches.openembedded.org/patch/8069/
> applied.

I'm wondering if a better approach to fixing this might be to change
intltool.m4 so where it says AC_PATH_PROG(INTLTOOL_PERL, perl), it says
AC_PATH_PROG(INTLTOOL_PERL, nativeperl) instead, at least in the
sysroot.

Another option would be a class that did:

DEPENDS =+ "intltool"
export INTLTOOL_PERL = "nativeperl"

although I think I prefer correcting the intltool m4 macro slightly
more. Or do we just add the export to the core in bitbake.conf or
autotools.bbclass?...

Cheers,

Richard




