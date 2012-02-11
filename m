Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Rw5LZ-0000rC-Lo
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 06:18:06 +0100
Received: by wibhq7 with SMTP id hq7so2451150wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 21:09:59 -0800 (PST)
Received: by 10.180.83.72 with SMTP id o8mr6997517wiy.22.1328936999121;
	Fri, 10 Feb 2012 21:09:59 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id da8sm7434681wib.6.2012.02.10.21.09.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 21:09:58 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
Date: Sat, 11 Feb 2012 06:09:52 +0100
Message-Id: <54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQlLNr3jH0rwghADy7Sj4z9O9CHClt0iQmPf81wMIJf3G695RTSF/iHOzdz6xIjZ42c3c0XD
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
X-List-Received-Date: Sat, 11 Feb 2012 05:18:06 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 11 feb. 2012, om 06:05 heeft Steve Sakoman het volgende geschreven:

> On Tue, Feb 7, 2012 at 6:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Tue, Feb 7, 2012 at 4:19 PM, Saul Wold <sgw@linux.intel.com> =
wrote:
>>>=20
>>> Can you verify if you have a .la file in you sysroot?
>>=20
>>=20
>> No its not there and thats the point we probably should learn to live
>> with out it
>> actually one of radical ideas I have is to get rid of all .la files =
in
>> OE completely
>> right now python modules e.g.  have them and thats wrong since they =
never use it
>> and there are other packages like that.
>=20
> FWIW, after a pull of oe-core today that included the zlib update I am
> getting similar failures on meta/recipes-gnome/gtk+/gtk+_2.24.8.bb:
>=20
> | /bin/grep: =
/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la:
> No such file or directory
> | /bin/sed: can't read
> /media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la: No such
> file or directory
> | arm-poky-linux-gnueabi-libtool: link:
> `/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la' is not a
> valid libtool archive
> | make[4]: *** [libgdk-x11-2.0.la] Error 1


It works if you -c cleansstate on a bunch of recipes, pango, cairo, =
fontconfig, gtk+, etc=


