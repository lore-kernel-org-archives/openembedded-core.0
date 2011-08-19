Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QuRll-0000F0-Sa for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 18:18:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JGDPfV030080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 17:13:25 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28745-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 17:13:17 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7JGD8c3030035
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 17:13:11 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E4E80C9.7010507@gmail.com>
References: <cover.1313700595.git.sgw@linux.intel.com>
	<5e892786b427b2049ddf0e660d57877e24f89385.1313700595.git.sgw@linux.intel.com>
	<1313745878.6733.259.camel@phil-desktop>
	<1313763965.13995.100.camel@rex> <4E4E80C9.7010507@gmail.com>
Date: Fri, 19 Aug 2011 09:13:06 -0700
Message-ID: <1313770386.13995.112.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [CONSOLIDATED PULL 15/32] conf, recipes: Redefine LINKER_HASH_STYLE
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
X-List-Received-Date: Fri, 19 Aug 2011 16:18:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-08-19 at 08:27 -0700, Khem Raj wrote:
> > Also, if mips doesn't support this, how is anything at all working at
> > the moment?
> 
> see last line in distro/include/tcmode-default.inc
> 
> TARGET_LINK_HASH_STYLE ?= 
> "${@['-Wl,--hash-style=gnu',''][bb.data.getVar('TARGET_ARCH', d, True) 
> in ['mips', 'mipsel', 'mips64', 'mips64el']]}"

So given that, why can't we just add TARGET_LINK_HASH_STYLE to gcc's
EXTRA_OECONF?

Cheers,

Richard



