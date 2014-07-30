Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 031EE70246;
	Wed, 30 Jul 2014 14:12:07 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6UEC4aM020677; Wed, 30 Jul 2014 15:12:04 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eF9YLRD1zPcd; Wed, 30 Jul 2014 15:12:03 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6UEBxmx020479
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 30 Jul 2014 15:12:01 +0100
Message-ID: <1406729519.13346.145.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Jul 2014 15:11:59 +0100
In-Reply-To: <20140730140502.GP16445@jama>
References: <20140703164708.452165036A@opal.openembedded.org>
	<20140718205012.GT2433@jama> <20140730093244.GK16445@jama>
	<1406726908.13346.135.camel@ted> <20140730140502.GP16445@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Cristian Iorga : qemu: fix qemu-native pkg-config paths
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jul 2014 14:12:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-07-30 at 16:05 +0200, Martin Jansa wrote:
> On Wed, Jul 30, 2014 at 02:28:28PM +0100, Richard Purdie wrote:
> > On Wed, 2014-07-30 at 11:32 +0200, Martin Jansa wrote:
> > 
> > I'm assuming in your case, you probably either don't have or care about
> > SDL at all, or you have sdl-config available?
> 
> Correct, it's just build server where I'll never use runqemu to run the
> image, but I need to build usable qemu-native to generate read-only
> images (e.g. for fontcache.bbclass).

Ok, fair enough. We should be able to make this work then.

> > So what really needs to happen here is that running the command needs to
> > become non-fatal as far as I can tell?
> 
> Yes, non-fatal and if possible deterministic (AFAIK this whole block could be
> included in PACKAGECONFIG contains "sdl" conditional and applied only
> when /bin/pkg-config or /usr/bin/pkg-config exists)

That is a step beyond the patch I've sent, it would be a nice
improvement though.

> There was also request to provide libsdl-native
> http://patchwork.openembedded.org/patch/63477/
> 
> then qemu-native could just build this libsdl-native as dependency for
> PACKAGECONFIG sdl instead of assuming that the host system has
> undeclared libsdl-native dependency. 

Its very hard to make a libsdl-native work properly when you consider
things like GL which is why I'd really prefer to ignore libsdl-native if
we can. I certainly do not want the bugs about GL support being broken
in it which are where this leads :(

Cheers,

Richard


