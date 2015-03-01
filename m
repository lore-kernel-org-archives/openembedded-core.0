Return-Path: <alexandre.belloni@free-electrons.com>
Received: from mail.free-electrons.com (down.free-electrons.com
	[37.187.137.238])
	by mail.openembedded.org (Postfix) with ESMTP id 6763771637
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Mar 2015 21:34:53 +0000 (UTC)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id E418E496; Sun,  1 Mar 2015 22:34:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	mail.free-electrons.com
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT,
	URIBL_BLOCKED shortcircuit=ham autolearn=disabled version=3.4.0
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id AAB7C494;
	Sun,  1 Mar 2015 22:34:53 +0100 (CET)
Date: Sun, 1 Mar 2015 22:34:52 +0100
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20150301213452.GI4094@piout.net>
References: <CAOMwXhNqbCGVZiJ3GCbjboiHrMVbC1aQ9Pd65xPzbmBjFSHVUg@mail.gmail.com>
	<CAJTo0LZgVSK-7tWuO0ByNZqwtwseY-fgLp2Dquu6Nj-4j9AVsw@mail.gmail.com>
	<B0C68756-9FE4-459F-9DFE-753106847A87@dominion.thruhere.net>
	<CAOMwXhMDOma1N73M5n64G2T-FaH+Zevo2r8baenFsX9EZiFa5Q@mail.gmail.com>
	<CAJTo0LYuTsUkt8E0oTn0CGG+JFQhM67eCAHBRiX8W_1Fw67ErQ@mail.gmail.com>
	<CAOMwXhNqH76QKt9hsqpeOeRTBjKUix4e0GCy8PZVkrjCdm+OAA@mail.gmail.com>
	<20140321143939.GI3726@jama>
	<CAOMwXhO3q3ZWmJ3mc==FV=S3t9fa7of9+449KGjQt4v=FQ=RRA@mail.gmail.com>
	<CAOMwXhOtSitBvR=v0AVJbcK8HBsfxsU-4wrEkBd=tjX-UhEX1g@mail.gmail.com>
	<CAOMwXhMFK_cjS0i07rXUnoCy+2Mq-E7zzaZeHKk-vy3k6DMxEA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhMFK_cjS0i07rXUnoCy+2Mq-E7zzaZeHKk-vy3k6DMxEA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add init script (sysv) support for busybox's ntpd
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
X-List-Received-Date: Sun, 01 Mar 2015 21:34:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 01/03/2015 at 13:48:11 +0000, Laszlo Papp wrote :
> I finally decided to get this patch another go, even though still no
> busybox daemon has LSB headers, but I would need to ask for some prime
> example of LSB headers that I can start off with. Could anyone please
> provide me a good example for that from the Yocto project? Thanks.
> 

What about:

### BEGIN INIT INFO
# Provides:          ntpd
# Required-Start:    $network
# Required-Stop:     $network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: NTP daemon
# Description:       Network Time Protocol (NTP) is a networking
#                    protocol for clock synchronization 
### END INIT INFO

See
http://www.linuxbase.org/betaspecs/lsb/LSB-Core-generic/LSB-Core-generic/initscrcomconv.html


-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

