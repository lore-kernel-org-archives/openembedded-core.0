Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RVsMY-0000G3-Q2
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 23:10:47 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 30 Nov 2011 14:04:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,272,1320652800"; d="scan'208";a="42669066"
Received: from unknown (HELO envy.home) ([10.255.12.165])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Nov 2011 14:04:05 -0800
Message-ID: <4ED6A859.3080300@linux.intel.com>
Date: Wed, 30 Nov 2011 14:04:09 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <e7ca852c4e673a6b32be203109a704202aeace3a.1322689519.git.darren@dvhart.com>
	<d66f152cffd363fe56c6f58e9559288020524d83.1322689519.git.darren@dvhart.com>
	<9AF2AA1C-18ED-477E-86BF-E31899BDE666@dominion.thruhere.net>
In-Reply-To: <9AF2AA1C-18ED-477E-86BF-E31899BDE666@dominion.thruhere.net>
X-Enigmail-Version: 1.3.3
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] grub: Use COMPATIBLE_MACHINE
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
X-List-Received-Date: Wed, 30 Nov 2011 22:10:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11/30/2011 01:57 PM, Koen Kooi wrote:
> 
> Op 30 nov. 2011, om 22:49 heeft Darren Hart het volgende
> geschreven:
> 
>> From: Darren Hart <dvhart@linux.intel.com>
>> 
>> Drop the anonymous python block in favor of the much simpler 
>> COMPATIBLE_MACHINE mechanism.
> 
> minor nit: when I read the subject my first thought was "please
> use COMPATIBLE_HOST instead", but the actual patch is doing the
> right thing. Could you please amend the commit summary to has HOST
> instead of MACHINE?

Thanks for the catch Koen!

I've rebased and pushed this series to the same location:

http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/commit/?h=cleanup&id=46d4be3925dec1c9b6fd228b0fd603e8f2416ed5


- -- 
Darren "Dufus" Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJO1qhZAAoJEKbMaAwKp364fxwH/0/8mhWaZkm3xu8+PRZxpCle
8lSiLZ8unO4qfUtXdXG96tlAHWlhAQfl1y3Zo4EoKcXoiSnV6rQX67nFrRnUAdge
+E0uLYYJlLQUa9Yrbt8NbuR7TktiP28AK9/An7ljk/hNbyDEQQDTDwac02IhJmaC
rBc1L3P/c6LuiN8hqCdZu4OXfahMndMkK3lzXaU0TVddfNr5o+jYiPmDRL9Dn0/W
b75ogSHpKAzHhFEsOf563DPpdfagiz2e0B4t6SMBIxRDcgHQHmNIo6lvjfDfzFYc
e7B3rA3nmWnHctkrDjs4GTO5wecfO1Xj31bpsPX6C7jW4f0BKrmdpk+PV/TGeUA=
=Ingz
-----END PGP SIGNATURE-----


