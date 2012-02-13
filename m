Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RwwIS-000797-J2
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Feb 2012 14:50:24 +0100
Received: by pbcum15 with SMTP id um15so3630754pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 05:42:14 -0800 (PST)
Received: by 10.68.72.39 with SMTP id a7mr47611603pbv.96.1329140533573;
	Mon, 13 Feb 2012 05:42:13 -0800 (PST)
Received: from [192.168.250.124] ([108.60.121.130])
	by mx.google.com with ESMTPS id o7sm39937783pbq.8.2012.02.13.05.42.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 13 Feb 2012 05:42:12 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
Date: Mon, 13 Feb 2012 05:42:10 -0800
Message-Id: <60152733-3093-4B6D-8D98-517DEA75C5A2@dominion.thruhere.net>
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
	<20120213074852.GA3832@jama.jama.net>
	<CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkBdOFjfVRC0QtkVEYeKaDnWUeCa1QNztGdyWaD7bTxVbmyBPu+y0BFVtODDnvwbyRpDhkI
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
X-List-Received-Date: Mon, 13 Feb 2012 13:50:24 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 13 feb. 2012, om 05:23 heeft Steve Sakoman het volgende geschreven:

> On Sun, Feb 12, 2012 at 11:48 PM, Martin Jansa =
<martin.jansa@gmail.com> wrote:
>> On Sat, Feb 11, 2012 at 06:09:52AM +0100, Koen Kooi wrote:
>>>=20
>>> Op 11 feb. 2012, om 06:05 heeft Steve Sakoman het volgende =
geschreven:
>>>=20
>>>> On Tue, Feb 7, 2012 at 6:06 PM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>>> On Tue, Feb 7, 2012 at 4:19 PM, Saul Wold <sgw@linux.intel.com> =
wrote:
>>>>>>=20
>>>>>> Can you verify if you have a .la file in you sysroot?
>>>>>=20
>>>>>=20
>>>>> No its not there and thats the point we probably should learn to =
live
>>>>> with out it
>>>>> actually one of radical ideas I have is to get rid of all .la =
files in
>>>>> OE completely
>>>>> right now python modules e.g.  have them and thats wrong since =
they never use it
>>>>> and there are other packages like that.
>>>>=20
>>>> FWIW, after a pull of oe-core today that included the zlib update I =
am
>>>> getting similar failures on meta/recipes-gnome/gtk+/gtk+_2.24.8.bb:
>>>>=20
>>>> | /bin/grep: =
/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la:
>>>> No such file or directory
>>>> | /bin/sed: can't read
>>>> /media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la: No such
>>>> file or directory
>>>> | arm-poky-linux-gnueabi-libtool: link:
>>>> `/media/Work/yocto/tmp/sysroots/omap3-multi/usr/lib/libz.la' is not =
a
>>>> valid libtool archive
>>>> | make[4]: *** [libgdk-x11-2.0.la] Error 1
>>>=20
>>>=20
>>> It works if you -c cleansstate on a bunch of recipes, pango, cairo, =
fontconfig, gtk+, etc
>>=20
>> list for me
>>=20
>> evas ecore fsogsmd pidgin elementary fsodeviced fsoaudiod subversion
>> python-evas libsoup-2.4 libeflvala efreet fsotdld poppler fsosystemd
>> fsousaged fsonetworkd gtk+ python-gst emotion mysql5 libfsotransport
>> libfsobasics gd libgsm0710mux gst-plugins-base iksemel fsodatad
>> webkit-gtk fsodatad epdf librsvg curl libsexy libfsosystem orbit2
>> libfso-glib pango eeze libshr-glib farsight2 id3lib gst-plugins-good
>> gst-plugins-ugly libnice libgpewidget matchbox-panel-2 edbus vte =
ethumb
>> glib-networking libgisi libfsoresource edje libfsoframework gconf =
file
>> libglade json-glib ethumb libcroco gnome-keyring libsdl-image neon
>> qt4-x11-free python-pygobject msmcomm-specs gnome-keyring libphone-ui
>> shr-wizard matchbox-keyboard matchbox-panel-2
>>=20
>> And this isn't even on fully built feed :/.
>=20
> Indeed!  I gave up on trying to determine an exhaustive list and just
> blew away tmp and sstate and rebuilt everything -- including package
> repositories :-(
>=20
> We need to find a way to prevent or warn of disruptive changes like
> this zlib patch.  For those of us trying to make a living using Yocto,
> losing a day of productivity to things like this really stings.

A while ago there were 2 weeks with absolutely no breakage which I =
really liked. Then people can back from their xmas holidays....=


