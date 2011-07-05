Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qe2xS-0005eA-30 for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:34:22 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65AUX3S029805
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 11:30:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29515-06 for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2011 11:30:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p65AUOd3029798
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jul 2011 11:30:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <D937CAB3-BFAC-46CD-8E33-67635EFBC215@dominion.thruhere.net>
References: <D937CAB3-BFAC-46CD-8E33-67635EFBC215@dominion.thruhere.net>
Date: Tue, 05 Jul 2011 11:29:54 +0100
Message-ID: <1309861794.20015.685.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: kernel.bbclass ERROR: QA Issue: Architecture did not match (40 to 62)
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
X-List-Received-Date: Tue, 05 Jul 2011 10:34:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 22:47 +0200, Koen Kooi wrote:
> I'm going to be mailing out the errors I'm setting with the reinstated insane.bbclass, here are the first ones:
> 
> ERROR: QA Issue: Architecture did not match (40 to 62) on /work/archos5it-angstrom-linux-gnueabi/linux-omap-archos-2.6.27.10-omap1-r101/packages-split/kernel-misc/kernel/scripts/kconfig/conf.o
> ERROR: QA Issue: Architecture did not match (40 to 62) on /work/archos5it-angstrom-linux-gnueabi/linux-omap-archos-2.6.27.10-omap1-r101/packages-split/kernel-misc/kernel/scripts/kconfig/zconf.tab.o
> ERROR: QA Issue: Architecture did not match (40 to 62) on /work/archos5it-angstrom-linux-gnueabi/linux-omap-archos-2.6.27.10-omap1-r101/packages-split/kernel-misc/kernel/scripts/kconfig/kxgettext.o
> 

FWIW, I think the kernel.bbclass fix I added addressed these ones
(amongst others).

Cheers,

Richard



