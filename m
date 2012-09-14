Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TCV0w-0003aZ-RP for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 14:28:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8ECGHKF011294;
	Fri, 14 Sep 2012 13:16:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 10921-05; Fri, 14 Sep 2012 13:16:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8ECGAA1011288
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Fri, 14 Sep 2012 13:16:11 +0100
Message-ID: <1347624973.13596.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ml@communistcode.co.uk
Date: Fri, 14 Sep 2012 13:16:13 +0100
In-Reply-To: <50531E8A.8000307@communistcode.co.uk>
References: <50531E8A.8000307@communistcode.co.uk>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Nothing provides libxcb-*
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Sep 2012 12:28:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-14 at 13:09 +0100, Jack Mitchell wrote:
> I am trying to use the package libxcb-xfixes in a recipe however when I 
> add 'libxcb-xfixes' to DEPENDS I get the error that nothing provides 
> libxcb-xfixes however the libxcb package clearly has it in the PACKAGES 
> variable
> 
> recipes-graphics/xcb/libxcb.inc:PACKAGES =+ "libxcb-composite 
> libxcb-damage libxcb-dpms libxcb-glx \
> recipes-graphics/xcb/libxcb.inc: libxcb-randr libxcb-record 
> libxcb-render libxcb-res \
> recipes-graphics/xcb/libxcb.inc: libxcb-screensaver libxcb-shape 
> libxcb-shm libxcb-sync \
> recipes-graphics/xcb/libxcb.inc: libxcb-xevie libxcb-xf86dri 
> libxcb-xfixes libxcb-xlib \
> recipes-graphics/xcb/libxcb.inc: libxcb-xprint libxcb-xtest libxcb-xv 
> libxcb-xvmc \
> recipes-graphics/xcb/libxcb.inc: libxcb-dri2"
> 
> I have also tried using others in this package list to no avail, can 
> anybody comment on how I should be using these packages?

You're mixing up the build time and runtime namespaces. You would add
DEPENDS = "libxcb" or RDEPENDS_${PN}-xxx = "libxcb-xfixes". 

DEPENDS is build time and you use PN

RDEPENDS/RRECOMMENDS/R* is runtime and values from PACKAGES

Cheers,

Richard








