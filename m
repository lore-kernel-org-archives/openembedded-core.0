Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SOs8a-000051-4r for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 17:03:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3UErwqq004511
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 15:53:58 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02742-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 15:53:54 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3UErq0K004505
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 15:53:53 +0100
Message-ID: <1335797635.7415.22.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 30 Apr 2012 15:53:55 +0100
In-Reply-To: <CAMKF1sriyONx1y3q7RMmi+oEztr_rx0VmLnLk3fLYE4NEq0vcg@mail.gmail.com>
References: <CAMKF1sq94g5aaYPQZ=UZtBT6iBxCMJ7ZrKer=gaCVoEjV=eWKA@mail.gmail.com>
	<1335451639.20130.18.camel@ted> <1335468645.20130.27.camel@ted>
	<1335474399.20130.35.camel@ted>
	<CAMKF1so6gABH-H9uZ2R4ppr6F-zT9GtPg7j5fThzQQjWXKkG4g@mail.gmail.com>
	<1335796919.7415.20.camel@ted>
	<CAMKF1sriyONx1y3q7RMmi+oEztr_rx0VmLnLk3fLYE4NEq0vcg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: gcc 4.7 + mips64 architecture support
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
X-List-Received-Date: Mon, 30 Apr 2012 15:03:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-30 at 07:47 -0700, Khem Raj wrote:
> On Mon, Apr 30, 2012 at 7:41 AM, Richard Purdie
> > FWIW, gcc 4.7 and eglibc 2.15 are now the default in master.
> 
> yay
> 
>  Test builds
> > were looking good until the autobuilder ran out of disk space on the
> > shared drive for sstate :(.
> 
> hopefully nothing new shows up
> 
> >
> > Only known unresolved failure so far is "DISTRO=poky-tiny bitbake
> > eglibc" which fails due to its cut down eglibc options.
> >
> 
> hmmm. Whats the error ?

http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/42/steps/shell_24/logs/stdio

Cheers,

Richard



