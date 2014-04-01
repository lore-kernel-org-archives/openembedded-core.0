Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id AD7C66E9A0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 19:34:32 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s31JYRQw012859; Tue, 1 Apr 2014 20:34:28 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GQQZV2aAeARH; Tue,  1 Apr 2014 20:34:27 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s31JYK9T012854
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 1 Apr 2014 20:34:23 +0100
Message-ID: <1396380855.2910.34.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Tue, 01 Apr 2014 20:34:15 +0100
In-Reply-To: <533AFEE9.6050001@windriver.com>
References: <8672BB614B4CCA40A6B3BDD6FD82050B575445A7@COSNADEXC13.usr.ingenico.loc>
	<1396374241.5879.50.camel@phil-desktop.brightsign>
	<1396374515.5879.54.camel@phil-desktop.brightsign>
	<1396374702.2910.27.camel@ted> <533AFEE9.6050001@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: image.bbclass: USE_DEVFS is now useless
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
X-List-Received-Date: Tue, 01 Apr 2014 19:34:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-01 at 13:01 -0500, Mark Hatle wrote:
> On 4/1/14, 12:51 PM, Richard Purdie wrote:
> > On Tue, 2014-04-01 at 18:48 +0100, Phil Blundell wrote:
> >> Also note that the default for USE_DEVFS was (and is) 1, so the lack
> >> of this check is actually causing a difference in the default
> >> behaviour.  If there's no appetite for reinstating the USE_DEVFS
> >> mechanism per se then it seems like it would be a good idea to make
> >> the default IMAGE_DEVICE_TABLE be blank in order to restore the
> >> previous default of no /dev in the rootfs.
> >>
> >> At present you get a somewhat arbitrary-seeming smattering of devices
> >> from meta/files/device_table-minimal.txt, including such anachronisms
> >> as /dev/ttySA0 and /dev/apm_bios.  It's hard to imagine that anybody
> >> actually wants this stuff in their rootfs in this day and age.
> >
> > Can we kill apmd at the same time? Please? :)
> 
> Isn't this still used on some ARM and MIPS targets?  (they emulate apm for basic 
> power management.)

Its not gone as far as I know but whether we need the userspace portion,
I'm not so sure, it just does suspend/resume event notifuication afaik
these days and I doubt much uses that now. The battery interfaces were
long since replaced with proper sysfs ones.

Cheers,

Richard


