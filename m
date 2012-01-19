Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RntaA-0006tA-Dk
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 16:07:18 +0100
Received: by wgbdt11 with SMTP id dt11so232923wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2012 06:59:39 -0800 (PST)
Received: by 10.180.19.97 with SMTP id d1mr44585976wie.12.1326985179119;
	Thu, 19 Jan 2012 06:59:39 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id g12sm66975230wiw.10.2012.01.19.06.59.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jan 2012 06:59:38 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <12179414.hR7YIgmyms@helios>
Date: Thu, 19 Jan 2012 15:59:32 +0100
Message-Id: <EF1D907B-459E-4770-8B6A-A46D0379F0FD@dominion.thruhere.net>
References: <1326978483.2511.68.camel@ted>
	<7BD299FF-ED9A-4C3C-9581-4EF9B8D89B25@dominion.thruhere.net>
	<12179414.hR7YIgmyms@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Buildhistory in action
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
X-List-Received-Date: Thu, 19 Jan 2012 15:07:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 19 jan. 2012, om 15:45 heeft Paul Eggleton het volgende geschreven:

> On Thursday 19 January 2012 15:37:38 Koen Kooi wrote:
>> If you want to see a longer history, have a look at
>> https://github.com/Angstrom-distribution/buildhistory/commits/master, =
I've
>> been using it heavily today when working on udev 177 which changed =
its
>> default filesystem layout. One thing to keep in mind:
>>=20
>> $ du -hs /data/ssd/OE/buildhistory/
>> 548M	/data/ssd/OE/buildhistory/
>=20
> Hmm, I wouldn't have expected it to be quite that large, but I guess =
it=20
> depends what you're doing with it, and I'd imagine given the number of =
builds=20
> you run you probably stress it more than most (which is good :). In =
the end=20
> 500M is just a drop in the bucket compared to the rest of TMPDIR...
>=20
>> I keep it on an SSD to avoid needing to wait a few minutes after =
every
>> bitbake invocation.
>=20
> Good advice :) It's also worth noting it will noticeably increase the=20=

> do_rootfs time (especially for RPM) and probably do_package as well.

The cloud9-image incremental build takes ~45 minutes with testlab and =
~120 minutes with testlab + buildhistory. The base 45 minutes are ~10 =
minutes redoing the opkg indices (as reported earlier) and the rest is =
just mkfs.ext2 being stupid when it comes to using 4GB /dev/loopN files =
for images.

regards,

Koen=


