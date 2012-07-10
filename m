Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SogDP-0007T0-He for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 21:35:19 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6AJO48R020384;
	Tue, 10 Jul 2012 20:24:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19561-02; Tue, 10 Jul 2012 20:24:00 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6AJNuxB020377
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 10 Jul 2012 20:23:57 +0100
Message-ID: <1341948237.1294.11.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 20:23:57 +0100
In-Reply-To: <CAMKF1sqrf_hPLpYhY-sJzVBx5pHrV8_VWF9+6OjzKo5+Qqa+qQ@mail.gmail.com>
References: <1341927124.24837.8.camel@ted>
	<CAEsOVNf0SDnxATQog_8Li1oeK6wkqhVH+m=Bt=L0bBbR02B05Q@mail.gmail.com>
	<1341935849.1294.2.camel@ted>
	<alpine.DEB.2.02.1207101433580.3587@oneiric>
	<CAMKF1sqrf_hPLpYhY-sJzVBx5pHrV8_VWF9+6OjzKo5+Qqa+qQ@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: bitbake.conf: Add git-native to ASSUME_PROVIDED
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
X-List-Received-Date: Tue, 10 Jul 2012 19:35:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-07-10 at 11:52 -0700, Khem Raj wrote:
> On Tue, Jul 10, 2012 at 11:35 AM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
> >
> >   my opinion, which is mine, is to add a script someone can run that
> > tells them what appears to be safe to override from their current
> > distro.  that way, it's entirely optional and the developer deals with
> > the output at their own risk.
> 
> who determines the safeness ? thats what double QA RP mentioned is

If a script says its safe, the bug reports will come in about the script
being broken.

Most -native dependencies are either essential (perl, python, dbus,
autoconf, automake, libtool, gmp, mpc, mfpr) or trivial. The ones that I
really dislike are the ones that hold up the critical path of the build
(i.e. libc/toolchain).

git-native is now falling into this category. subversion-native used to
be an issue but is rapidly being consigned to the history books.

So bang for buck, git-native makes sense, most other -native
dependencies are required at this point. The only two I'd "safely" put
in an ASSUME_PROVIDED locally and off the top of my head are flex/bison
at this point and those are questionable with some known API gotchas.
We've even had problems with things like tar recently. Hard to believe
but true and we have the bug reports to prove it.

Cheers,

Richard





