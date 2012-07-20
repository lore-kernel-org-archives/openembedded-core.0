Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsFa5-0001df-As for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 17:57:29 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KFk7j1013255
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:46:07 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10396-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:46:03 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KFjuMU013249
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 16:45:58 +0100
Message-ID: <1342799160.21788.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 16:46:00 +0100
In-Reply-To: <20120720151751.GH3534@jama.jama.net>
References: <20120720093208.GD3534@jama.jama.net>
	<1342792561.21788.17.camel@ted> <20120720151751.GH3534@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Yocto style guide change proposal
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
X-List-Received-Date: Fri, 20 Jul 2012 15:57:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-20 at 17:17 +0200, Martin Jansa wrote:
> On Fri, Jul 20, 2012 at 02:56:01PM +0100, Richard Purdie wrote:
> > On Fri, 2012-07-20 at 11:32 +0200, Martin Jansa wrote:
> > > Now we have horrible mixture of whitespaces (tabs and space) only in 
> > > recipe files, because yocto style guide recommends tabs in shell
> > > functions. So if recipe has e.g. do_install_append as well as
> > > populate_packages_prepend (not so uncommon combination as tabs fixing
> > > patches show), then according to yocto style guide it should look like
> > > this:
> > > 
> > > do_install_append() {
> > > 	foo
> > > }
> > > python populate_packages_prepend () {
> > >     libdir = bb.data.expand('${libdir}', d)
> > >     do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
> > > }
> > > 
> > > especially with default tab width 8 spaces it's ugly and because it
> > > is inconsistent, many devs used spaces in shell functions too. Now when
> > > someone accidentaly use tab also in python function it will show warning
> > > or fail to parse. Some devs are using mix of tabs and spaces even on the
> > > same line (e.g. to indent SRC_URI multiline entries).
> > 
> > We've said tabs for shell functions for *years*. I'm sure if I were to
> > look at the mailing list archives, that would be clear.
> 
> Is new developer supposed to read all mailing list archives few years
> back? Or can we assume that he will google for style guide? Note about
> tabs was added to yocto style guide by Saul 21:05, 7 April 2011 and even
> now it says:
> "Use spaces for indentation as developers tends to use different amount
> of spaces per one tab."
> So tabs should be used already only in shell tasks, not for multiline
> variables etc..

Hence my proposal we sort this out and effectively remove the Yocto
style guide...

Cheers,

Richard



