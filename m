Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QQ5U8-0000Ea-Fw for openembedded-core@lists.openembedded.org;
	Sat, 28 May 2011 00:26:25 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RMNJ9a007340
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 23:23:19 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 07192-03 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 23:23:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4RMNEJ8007334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2011 23:23:14 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1306531463.3120.124.camel@lenovo.internal.reciva.com>
References: <cover.1306530446.git.sgw@linux.intel.com>
	<8046a9b60d086b3f82c0733ecbf24785066625e4.1306530446.git.sgw@linux.intel.com>
	<1306531463.3120.124.camel@lenovo.internal.reciva.com>
Date: Fri, 27 May 2011 23:23:07 +0100
Message-ID: <1306534987.27470.307.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] xserver: force to use libdl
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
X-List-Received-Date: Fri, 27 May 2011 22:26:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-27 at 22:24 +0100, Phil Blundell wrote:
> On Fri, 2011-05-27 at 14:09 -0700, Saul Wold wrote:
> > From: Yu Ke <ke.yu@intel.com>
> > 
> > [YOCTO #737]
> > 
> > The AC_CHECK_FUNC([dlopen], [], AC_CHECK_LIB([dl], [dlopen], DLOPEN_LIBS="-ldl"))
> > macro seems not work well in ppc arch, so this patch force the DLOPEN_LIBS="-ldl"
> > 
> 
> That's a bit of a weird report.  Do we know why it doesn't work?  I
> guess we don't care all that much about Solaris targets, but equally I
> can't think of any reason why ppc should be special.

Seconded. I'd like to see the config.log of that failing on ppc...

Cheers,

Richard



