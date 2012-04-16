Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SJoLV-0000UE-CR for openembedded-core@lists.openembedded.org;
	Mon, 16 Apr 2012 18:00:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3GFoeS2001566
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:50:40 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00569-08 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:50:35 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3GFoX5i001560
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2012 16:50:34 +0100
Message-ID: <1334591435.616.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Apr 2012 16:50:35 +0100
In-Reply-To: <4F8C2EA9.5090100@windriver.com>
References: <4F847380.6000401@windriver.com>
	<4F8489DE.1050905@opendreambox.org> <4F8C24CB.3080607@opendreambox.org>
	<4F8C2EA9.5090100@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: MIPS vs MIPS32 tunings -- summary and questions
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
X-List-Received-Date: Mon, 16 Apr 2012 16:00:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-16 at 22:37 +0800, Robert Yang wrote:
> 
> On 04/16/2012 09:55 PM, Andreas Oberritter wrote:
> > On 10.04.2012 21:28, Andreas Oberritter wrote:
> >> I'm fine with either way that restores mips/mipsel for mips32 targets
> >> *before the release*, because the online update feeds broke and all
> >> packages had to be built again from scratch.
> >
> > Richard, can you please state your opinion about this issue?
> >
> > The mips package feed (e.g. qemumips) is now broken since weeks. Can I
> 
> I'm a little confused with this, I've just done a build with
> MACHINE = "qemumips", both build and runqemu worked well.

Builds will work fine however the package architecture for mips32
changes from "mipsel" to "mips32el" which broken things for people with
existing package feeds.

Cheers,

Richard



