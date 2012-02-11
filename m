Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rw8Pm-0002Pq-E7
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 09:34:38 +0100
Received: by wgbdr13 with SMTP id dr13so3104095wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Feb 2012 00:26:31 -0800 (PST)
Received: by 10.180.78.6 with SMTP id x6mr7644619wiw.18.1328948791340;
	Sat, 11 Feb 2012 00:26:31 -0800 (PST)
Received: from [212.238.107.45] (ip212-238-107-45.hotspotsvankpn.com.
	[212.238.107.45])
	by mx.google.com with ESMTPS id q2sm8131848wiy.7.2012.02.11.00.26.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 11 Feb 2012 00:26:30 -0800 (PST)
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
	<54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
	<CAMKF1spbXwjnn8v0xaNMmm2XC8M24j5vk1XWAQE8BOEGNaR7JA@mail.gmail.com>
In-Reply-To: <CAMKF1spbXwjnn8v0xaNMmm2XC8M24j5vk1XWAQE8BOEGNaR7JA@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <5642862E-0EFA-4BCF-AFD7-8F88F391D83F@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9A405)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 11 Feb 2012 09:26:17 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlW9+N/lxgE211wWYe7dhxSah4MgVYoq3iEZimqnDN4Hc60VZDT3KcRrIqyX7wLHfKsnTOn
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Sat, 11 Feb 2012 08:34:38 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 11 feb. 2012 om 09:15 heeft Khem Raj <raj.khem@gmail.com> het volgende ge=
schreven:

> On Fri, Feb 10, 2012 at 9:09 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>>=20
>> Op 11 feb. 2012, om 06:05 heeft Steve Sakoman het volgende geschreven:
>>=20
>>> On Tue, Feb 7, 2012 at 6:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Tue, Feb 7, 2012 at 4:19 PM, Saul Wold <sgw@linux.intel.com> wrote:
>>>>>=20
>>>>> Can you verify if you have a .la file in you sysroot?
>>>>=20
>>>>=20
>>>> No its not there and thats the point we probably should learn to live
>>>> with out it
>>>> actually one of radical ideas I have is to get rid of all .la files in
>>>> OE completely
>>>> right now python modules e.g.  have them and thats wrong since they nev=
er use it
>>>> and there are other packages like that.
>>>=20
>>> FWIW, after a pull of oe-core today that included the zlib update I am
>>> getting similar failures on meta/recipes-gnome/gtk+/gtk+_2.24.8.bb:
>>>=20
>>> | /bin/grep: /media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la:=

>>> No such file or directory
>>> | /bin/sed: can't read
>>> /media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la: No such
>>> file or directory
>>> | arm-poky-linux-gnueabi-libtool: link:
>>> `/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la' is not a
>>> valid libtool archive
>>> | make[4]: *** [libgdk-x11-2.0.la] Error 1
>>=20
>>=20
>> It works if you -c cleansstate on a bunch of recipes, pango, cairo, fontc=
onfig, gtk+, etc
>=20
> yeah libtool is very hard to get rid of see how many of files in your
> sysroot has zlib.la added to other .la files. You need to clean all
> those
>=20
> I wrote a small script which grepped oe-core for occurrence of all
> zlib.la in *.la files in sysroot
> and then dumps the ipks content to figure out which package provided
> that .la then bumped PRs of those recipes which were providing those
> ipks.
> unfortunately this script was in tmdir and got deleted.

rpmdebs Will break during do_rootfs, no time to look into that, ipk works



>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


