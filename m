Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsDrc-0007xE-8T for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 16:07:28 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KDu5Yg012628
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 14:56:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09727-07 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 14:56:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6KDtv0e012622
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 14:55:59 +0100
Message-ID: <1342792561.21788.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 14:56:01 +0100
In-Reply-To: <20120720093208.GD3534@jama.jama.net>
References: <20120720093208.GD3534@jama.jama.net>
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
X-List-Received-Date: Fri, 20 Jul 2012 14:07:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-20 at 11:32 +0200, Martin Jansa wrote:
> Now we have horrible mixture of whitespaces (tabs and space) only in 
> recipe files, because yocto style guide recommends tabs in shell
> functions. So if recipe has e.g. do_install_append as well as
> populate_packages_prepend (not so uncommon combination as tabs fixing
> patches show), then according to yocto style guide it should look like
> this:
> 
> do_install_append() {
> 	foo
> }
> python populate_packages_prepend () {
>     libdir = bb.data.expand('${libdir}', d)
>     do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
> }
> 
> especially with default tab width 8 spaces it's ugly and because it
> is inconsistent, many devs used spaces in shell functions too. Now when
> someone accidentaly use tab also in python function it will show warning
> or fail to parse. Some devs are using mix of tabs and spaces even on the
> same line (e.g. to indent SRC_URI multiline entries).

We've said tabs for shell functions for *years*. I'm sure if I were to
look at the mailing list archives, that would be clear.

In summary, I agree we need to make the style guides consistent and have
one version of them. I disagree with spaces for everything though,m
particularly as we have said to use tabs for as long and many of the
recipes do this (certainly more than use spaces).

Cheers,

Richard



