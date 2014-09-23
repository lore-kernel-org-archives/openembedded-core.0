Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 081F065FFC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NJ9Iut007641; Tue, 23 Sep 2014 20:09:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gUzMzS-lc7iR; Tue, 23 Sep 2014 20:09:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s8NJ9GZj007638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 23 Sep 2014 20:09:17 +0100
Message-ID: <1411499359.15825.59.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Date: Tue, 23 Sep 2014 20:09:19 +0100
In-Reply-To: <4258812.nj1qq677CN@comp-006-thk>
References: <1411385721-22264-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1411385721-22264-10-git-send-email-maciej.borzecki@open-rnd.pl>
	<20140923183113.GC2480@denix.org> <4258812.nj1qq677CN@comp-006-thk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	Tom Zanussi <tom.zanussi@linux.intel.com>,
	Otavio Salvador <otavio@ossystems.com.br>, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 9/9] beaglebone.conf: add IMAGE_BOOT_FILES
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
X-List-Received-Date: Tue, 23 Sep 2014 19:09:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-09-23 at 21:04 +0200, Maciej Borzecki wrote:
> On Tuesday 23 of September 2014 14:31:13 Denys Dmytriyenko wrote:
> > On Mon, Sep 22, 2014 at 01:35:21PM +0200, Maciej Borzecki wrote:
> > > Set IMAGE_BOOT_FILES to list of files that end up in boot
> > > partition. This in turn is used by wic to generate a bootable SD card
> > > image.
> > > 
> > > Signed-off-by: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
> > > Signed-off-by: Maciek Borzecki <maciek.borzecki@gmail.com>
> > 
> > Acked-by: Denys Dmytriyenko <denys@ti.com>
> > 
> > But meta-yocto-bsp is not part of openembedded-core...
> 
> Right, thanks for pointing that out. I did not want to cross post and some of 
> the patches depend on one another. Is yocto-bsp more applicable for this one 
> or just yocto ML?

It should be the poky list but in this case I'll take care of it (I just
put it into master-next of meta-yocto).

Cheers,

Richard


