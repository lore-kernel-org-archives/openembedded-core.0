Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RLIJw-0004ab-QH for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 18:40:20 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1HYDxa004177;
	Tue, 1 Nov 2011 17:34:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03502-02; Tue,  1 Nov 2011 17:34:08 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA1HY2k2004165
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 1 Nov 2011 17:34:04 GMT
Message-ID: <1320162583.15387.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <187337B8-18D1-4D7D-926C-EE015A8CD801@dominion.thruhere.net>
References: <326c1a05ec310abcb0ec8363bcbe952c05fdf9fb.1319665176.git.julian.pidancet@gmail.com>
	<187337B8-18D1-4D7D-926C-EE015A8CD801@dominion.thruhere.net>
Date: Tue, 01 Nov 2011 15:49:43 +0000
Mime-Version: 1.0
X-Mailer: Evolution 3.2.1- 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Julian Pidancet <julian.pidancet@gmail.com>
Subject: Re: [PATCH v2] Give coreutils a chance to build the df utility
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
X-List-Received-Date: Tue, 01 Nov 2011 17:40:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-01 at 15:21 +0100, Koen Kooi wrote:
> Op 26 okt. 2011, om 23:41 heeft Julian Pidancet het volgende geschreven:
> 
> > The coreutils configure script is unable determine how to get free
> > space from the Operating System when cross-compiling.
> > This changes caches the result of the "statfs2_bsize" test for the
> > coreutils configure script.
> > Both glibc and uclibc defines statfs as a two-argument function
> > and uses a struct statfs containing a f_bsize field. That's why
> > the fu_cv_sys_stat_statfs2_bsize variable has to be defined for
> > both libcs.
> > 
> > Signed-off-by: Julian Pidancet <julian.pidancet@gmail.com>
> > ---
> > meta/recipes-core/coreutils/coreutils_8.14.bb |    2 +-
> > meta/site/common-glibc                        |    3 +++
> > meta/site/common-uclibc                       |    3 +++
> > 3 files changed, 7 insertions(+), 1 deletions(-)
> 
> 
> A bit late, but this is missing a PR bump, could you please send a followup patch to fix that?

I've pushed a PR bump for this myself since it saves me tracking the
issue any further.

Cheers,

Richard



