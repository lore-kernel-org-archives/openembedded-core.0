Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Sx1le-00029Y-OY for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 22:13:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72K1V6u010854
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Aug 2012 21:01:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 09592-01 for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2012 21:01:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q72K1Oiw010848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Aug 2012 21:01:25 +0100
Message-ID: <1343937686.9756.96.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 02 Aug 2012 21:01:26 +0100
In-Reply-To: <CAMKF1sr9SY=GLhKh61zzGNUZeqiAxxjFV8sZaYTki1EchVeKtA@mail.gmail.com>
References: <1343808455.9756.51.camel@ted>
	<CAMKF1sr9SY=GLhKh61zzGNUZeqiAxxjFV8sZaYTki1EchVeKtA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gcc-configure-target: Set native-system-header-dir for target gcc
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
X-List-Received-Date: Thu, 02 Aug 2012 20:13:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-01 at 08:09 -0700, Khem Raj wrote:
> On Wed, Aug 1, 2012 at 1:07 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Without this set, in the case host=target (which it does for on-target
> > gcc), the native header directory is set to the target sysroot with
> > no prefix. This means it would look for sdt.h on the build system
> > instead of in the target headers and this can lead to build failures
> > and is host contamination of the build.
> >
> > The correct fix is to explicitly set the native header directory to
> > the correct location and then the headers get detected correctly.
> 
> one concern I think is what will happen to gxxinclude dir if this is
> set. if it will become relative to native headers dir as well
> I think you have to try it out the compiler on target

I tested the target compiler and couldn't find any problem. I also
checked the output of strings on the gcc binaries/libs/headers and
couldn't spot anything nasty. I've therefore merged this but we should
keep it in mind in case of problems.

Cheers,

Richard



