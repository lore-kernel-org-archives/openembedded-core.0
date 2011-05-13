Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QKogW-0006oE-55 for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 11:29:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4D9Qacl014720
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 10:26:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14427-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 10:26:28 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4D9QP9D014708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 10:26:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=C-5rjKtd0675Y70VX+g4MdL64Uw@mail.gmail.com>
References: <cover.1305109178.git.leon@sidebranch.com>
	<687fb20407ee32261a840c9e475b489319d8ee62.1305109178.git.leon@sidebranch.com>
	<BANLkTi=C-5rjKtd0675Y70VX+g4MdL64Uw@mail.gmail.com>
Date: Fri, 13 May 2011 10:26:14 +0100
Message-ID: <1305278774.19606.29.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] siteinfo.bbclass: Add powerpc-linux-gnuspe.
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
X-List-Received-Date: Fri, 13 May 2011 09:29:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-05-12 at 20:50 -0700, Khem Raj wrote:
> On Wed, May 11, 2011 at 3:29 AM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
> > From: Leon Woestenberg <leon@sidebranch.com>
> >
> > Re-add powerpc-linux-gnuspe, from OpenEmbedded. Also adds support
> > to poky.conf so that minimal-core-image builds with DISTRO=poky,
> >
> 
> you need to rebase this patch on latest oe-core

I resolved the conflict when I merged this:

http://git.openembedded.net/cgit.cgi/openembedded-core/commit/?id=701a725d118c1a2edd1e54798d85e864b45e19a2

Cheers,

Richard



