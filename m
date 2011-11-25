Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RU5Tg-0004sF-R8 for openembedded-core@lists.openembedded.org;
	Sat, 26 Nov 2011 00:46:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPNe9Va009257;
	Fri, 25 Nov 2011 23:40:09 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08413-03; Fri, 25 Nov 2011 23:40:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pAPNdwjI009238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 25 Nov 2011 23:39:59 GMT
Message-ID: <1322264404.25382.4.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: McClintock Matthew-B29882 <B29882@freescale.com>, Patches and
	discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 25 Nov 2011 23:40:04 +0000
In-Reply-To: <CAEsOVNfoFW+3G-bSYiOy4p-Pa_bDShY_c3hutpA+THDO8hUrvg@mail.gmail.com>
References: <5ca10bdeed6e90862311b8417c0e6de353d1dc70.1322223227.git.julian.pidancet@gmail.com>
	<CAEsOVNfoFW+3G-bSYiOy4p-Pa_bDShY_c3hutpA+THDO8hUrvg@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: [PATCH v3] Introduce multiarch DISTRO_FEATURE
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
X-List-Received-Date: Fri, 25 Nov 2011 23:46:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-25 at 19:07 +0000, McClintock Matthew-B29882 wrote:
> On Fri, Nov 25, 2011 at 6:29 AM, Julian Pidancet
> <julian.pidancet@gmail.com> wrote:
> > This patch introduces a distro feature which enables gcc to produce
> > both 32bit and 64bit code, and enables binutils to operate on both
> > 32bit and 64bit binaries.
> >
> > v3: - Make get_gcc_multiarch_setting more elegant. Use a dictionnary
> > to store the config options and replace bb.data.getVar with d.getVar.
> >    - Remove i686 from the architecture list because it doesn't seem
> > to be a valid TARGET_ARCH any more in OE.
> >    - Configure gdb (gdb and gdb-cross) with --enable-64-bit-bfd if
> > multiarch DISTRO_FEATURE is present
> >
> > Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
> 
> I'm not sure if this is the correct spot to bring this up, but how
> should we go about building a 32-bit and 64-bit libgcc?

This is firmly in multilib territory as its not just libgcc but libc as
well and so it goes on.

One of the reasons I'm nervous of the patch you're replying to is that
people are now going to try and cross the two and we'll end up with a
mess :(.

Trying to build just libgcc from the gcc tree is a nightmare and when we
last tried it, caused no end of problems.

What specific problem are you trying to solve?

Cheers,

Richard





