Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QHwpD-0000r5-5G for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 13:34:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45BVqDr010417
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 May 2011 12:31:52 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10001-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  5 May 2011 12:31:48 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p45BViOt010411
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 May 2011 12:31:45 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTik0nb-ZsqLCnAoXzRr6BLKBUk3cew@mail.gmail.com>
References: <cover.1304515719.git.ke.yu@intel.com>
	<BANLkTik0nb-ZsqLCnAoXzRr6BLKBUk3cew@mail.gmail.com>
Date: Thu, 05 May 2011 12:31:43 +0100
Message-ID: <1304595103.20791.21.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/1] poky-default-revisions: move SRCREV to every recipe
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
X-List-Received-Date: Thu, 05 May 2011 11:34:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-05-04 at 11:39 -0400, Bruce Ashfield wrote:
> On Wed, May 4, 2011 at 10:05 AM, Yu Ke <ke.yu@intel.com> wrote:
> > From: Yu Ke <ke.yu@intel.com>
> >
> > move the SRCREV from poky-default-revisions.inc to its corresponding recipe,
> > in this case, those non poky distro can also use its SRCREV.
> >
> > Pull URL: git://git.pokylinux.org/poky-contrib.git
> >  Branch: kyu3/srcrev-recipe
> >  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/srcrev-recipe
> >
> > Thanks,
> >    Yu Ke <ke.yu@intel.com>
> > ---
> >
> >
> > Yu Ke (1):
> >  poky-default-revisions: move the SRCREV to recipe file
> >
> >  meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb |    1 +
> >  .../recipes-graphics/clutter/table_git.bb          |    1 +
> >  meta-demoapps/recipes-graphics/clutter/tidy_git.bb |    1 +
> 
> <snip>
> 
> >  meta/recipes-kernel/blktrace/blktrace_git.bb       |    2 +
> >  meta/recipes-kernel/dtc/dtc_git.inc                |    2 +
> >  .../kern-tools/kern-tools-native_git.bb            |    1 +
> >  .../linux-firmware/linux-firmware_git.bb           |    1 +
> >  .../linux-libc-headers-yocto_git.bb                |    1 +
> >  .../recipes-kernel/linux/linux-yocto-stable_git.bb |   12 ++
> >  meta/recipes-kernel/linux/linux-yocto_git.bb       |   14 ++\
> 
> Would it be possible to get direct cc on changes to the linux-yocto
> recipes ? I didn't expect this and it is causing me a bit of pain at
> the moment. A direct cc' would have helped, since I would have
> preferred to stage the change in with my other items.

Sorry about that. Hopefully everyone agrees the end result is worth it
though as we're rid of that central file finally :)

Cheers,

Richard



