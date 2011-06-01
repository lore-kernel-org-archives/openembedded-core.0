Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QRjjO-0001t2-De for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 13:36:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p51BXlXx003538;
	Wed, 1 Jun 2011 12:33:47 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 03221-04; Wed,  1 Jun 2011 12:33:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p51BXfqF003532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 1 Jun 2011 12:33:42 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTik53-52ZgiXAaYWsD82c9wfi6VUGQ@mail.gmail.com>
References: <BANLkTimJaw7oHSZws2JDY=PtjgpYd6YcuQ@mail.gmail.com>
	<BANLkTik53-52ZgiXAaYWsD82c9wfi6VUGQ@mail.gmail.com>
Date: Wed, 01 Jun 2011 12:33:24 +0100
Message-ID: <1306928004.27470.423.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [FIX] update mtd-utils to 1.4.4
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
X-List-Received-Date: Wed, 01 Jun 2011 11:36:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-01 at 13:30 +0200, Andrea Adami wrote:
> On Fri, Apr 22, 2011 at 10:44 AM, Andrea Adami <andrea.adami@gmail.com> wrote:
> > Hello,
> >
> > mtd-utils_1.4.1 is broken, in fact whole 1.4.X serie was plagued by
> > mtd alignment bug until 1.4.4.
> >
> > See: http://lists.infradead.org/pipermail/linux-mtd/2011-April/034599.html
> >
> > Updated in oe-dev with commit f8e1b7793ff5b02fd27ce886b34a57c6c2358239.
> >
> > Regards
> >
> > Andrea
> >
> 
> BUMP
> 
> I'll add that the recipe in oe-classic has a different, more grained, packaging
> 
> PACKAGES =+ "mkfs-jffs2 mkfs-ubifs"
> FILES_mkfs-jffs2 = "${sbindir}/mkfs.jffs2"
> FILES_mkfs-ubifs = "${sbindir}/mkfs.ubifs"
> 
> Please pick it in oe-core, thx

How about sending some patches? ;-)

Cheers,

Richard




