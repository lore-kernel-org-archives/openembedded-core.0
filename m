Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SHupF-0001RF-6s for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 12:30:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BALc5W006455
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 11:21:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06405-01 for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 11:21:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3BALVFl006449
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 11:21:32 +0100
Message-ID: <1334139691.10826.144.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2012 11:21:31 +0100
In-Reply-To: <cover.1334114318.git.otavio@ossystems.com.br>
References: <cover.1334114318.git.otavio@ossystems.com.br>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/3] Important fixes for rc3
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
X-List-Received-Date: Wed, 11 Apr 2012 10:30:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-04-11 at 03:19 +0000, Otavio Salvador wrote:
> The patches in this set are all important IMO and I do think they
> ought to be included.
> 
> The following changes since commit bde1744018afd4616e114b20ffdc21b9abddcedc:
> 
>   hello-mod: Move hello-mod from meta to meta-skeleton (2012-04-10 13:16:00 +0100)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/oe-core master
>   https://github.com/OSSystems/oe-core/tree/HEAD
> 
> Otavio Salvador (3):
>   connman: backport test script fixes
>   distrodata.bbclass: fix comment typo
>   flex: backport Debian patches to fix generated code warnings

A typo fix is not high priority for -rc3. Sending patches which you then
request me to manually fix up for -rc3 is a bit of a joke.

I'm actually seriously considering reverting the recent connman version
updates since they've totally broken connman-gnome and all the UI
connman integration. I appreciate this would upset some people so we're
going to try and fix connman-gnome but I'm not happy to be in this
position at this point in the release cycle. The test scripts are the
least of my worries to be quite honest.

Cheers,

Richard




