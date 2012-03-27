Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SCfoc-0002nC-0f for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 01:28:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2RNJbB7014581
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 00:19:37 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12274-05 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 00:19:33 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2RNJRT5014575
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2012 00:19:28 +0100
Message-ID: <1332890367.28414.187.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Mar 2012 00:19:27 +0100
In-Reply-To: <alpine.DEB.2.02.1203271734090.7770@oneiric>
References: <alpine.DEB.2.02.1203271734090.7770@oneiric>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: how much can bitbake tell me about my upcoming build?
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
X-List-Received-Date: Tue, 27 Mar 2012 23:28:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-03-27 at 17:48 -0400, Robert P. J. Day wrote:
> so, let's say i've decided to use oe-core to build a qemux86 image:
> 
> $ . oe-core/oe-init-build-env builds/qemux86
> 
> before i go *any* further (before i even decide which image i'm going
> to bake), how much can bitbake tell me about this configuration?
> 
>   i know
> 
> $ bitbake -e
> 
> can tell me my current environment, that's certainly useful.
> 
>   i can also use
> 
> $ bitbake -s
> 
> to show me the current and preferred versions of all packages (related
> strictly to the current MACHINE setting in local.conf, correct?)
> 
>   what other info can i get out of bitbake?  what about image-specific
> info?  is there a way to list the packages required for a given image?
> some equivalent of
> 
> $ bitbake -s core-image-sato
> 
>   what about a command that lists the available images without having
> to peruse the oe-core "images" directories?  and what about any of the
> other bitbake-related utilities?  i can see "bitbake-layers" being
> pretty useful.
> 
>   in short, without starting an actual build, how much information can
> i extract using bitbake and bitbake-related utilities?

Well, there are:

bitbake -g (and look at task-depends.dot)
bitbake -g -u depexp
bitbake core-image-sato -n (dry run)

which will give some interesting info.

> p.s.  one thing i'd like is to be able to ask how much source i would
> need to download for a given build before i start.  is there any way
> to do that?

Not that I'm aware of since the SRC_URIs don't say how big a download
is, nor are they ever likely to.

Cheers,

Richard



