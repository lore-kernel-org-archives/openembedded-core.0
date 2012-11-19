Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1TaT6g-0004fQ-Ia
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 16:17:54 +0100
Received: (qmail 15783 invoked by uid 1003); 19 Nov 2012 15:03:51 -0000
Received: from unknown (HELO ?192.168.1.105?)
	(philip@opensdr.com@96.240.166.19)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	19 Nov 2012 15:03:51 -0000
Message-ID: <50AA4A56.5010301@balister.org>
Date: Mon, 19 Nov 2012 10:03:50 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121016 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <12301427.Yf0uchSh3U@helios>
	<20121119155657.620d6dbe@gnutoo-desktop>
In-Reply-To: <20121119155657.620d6dbe@gnutoo-desktop>
Cc: Denis 'GNUtoo' Carikli <gnutoo@no-log.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] OE-Classic recipe migration status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2012 15:17:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/2012 09:56 AM, Denis 'GNUtoo' Carikli wrote:
> On Sun, 11 Nov 2012 19:11:28 +0000
> Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
>
>> Hi all,
>>
>> Whilst the OE-Core-based layer landscape has grown quite a bit over
>> the last year and we now have a wealth of clean and up-to-date
>> recipes, I've heard a few people commenting that we've still lost
>> quite a few recipes along the way. Nobody who did make that comment
>> has seemed to be able to be specific about what they thought we were
>> missing however, so I figured it would be worth trying to determine
>> exactly which recipes are only available in OE-Classic.
>>
>> With the help of some scripts I've produced a list of the recipes,
>> made some notes and categorised some of them. I've published the list
>> on the wiki (unfortunately I had to split it into two pages since it
>> was too large to put into one):
>>
>>   http://www.openembedded.org/wiki/OE-Classic_Recipes_A-I
>>   http://www.openembedded.org/wiki/OE-Classic_Recipes_J-Z
>>
>> I don't know much about a lot of these recipes, so if you can help to
>> fill in the gaps particularly by marking the obsolete ones as such or
>> adding other comments, that would be great. Either edit the pages
>> directly or make your comments here and I'll merge them.
> Having the following software would be nice:
> * 0xffff,0xffff-native //used for flashing the n900 and for interacting
>    with the n900 NAND partition(decoding what's on an MTD partition such
>    as wifi calibration, MAC address etc...)
> * abiword plugins
> * accelges : gesture recognition for the openmoko freerunner (gta02)
> * asterisk recipes? could still be usefull...
> * batctl	//for mesh networking
> * batmand	//for mesh networking
> * wscan,dvb*	//for looking at dvb-t, some of my devices have USB
> host.
> * ekiga //would be nice for VOIP
> * fennec //renamed to firefox mobile?
> * flashrom //could be definitely usefull to flash BIOS from embedded
>    devices, I cross compiled it by hand for now, devices that have SPI
>    can flash SPI BIOS chips, such as the bug 2.0 or the rasberry pi
> * geoclue // could be usefull if it can uses gpsd
> * gnash //usefull to see flash animations even if now there is html5
>    for youtube
> * gnuchess //nice chess engine but a bit too hard.
> * gnumeric //should be very nice. like ooo/libreoffice calc.
> * gst-ducati // would be really usefull for omap4.
> * gst-player? //isn't it gst-123 or something like that in the new oe?
> * intone-video //would be nice, like intone which is an efl music
>    player but for video.
> * irssi //nice command line IRC client.
> * linphone //VOIP client, no VOIP client seem present in the new oe.
> * mpd-alsa, mpc, // do we have mpd in the new oe? if so that's nice.
>    what about graphical clients?
> * mumudvb //would be nice, for straming dvb.
> * nmap //nice for nmap -sP (for finding IP of local computers).
> * openbmap-logger //same kind of softwaer than cellhunter(see below)
> * privoxy //a proxy that can filter request, usefull for anonimizing
>    the connection or with tor.
> * sflphone-common  //is slfphone in the new oe?
> * tesseract //could be usefull for making apps that uses a camera and
>    recognize text?
> * totem
> * tor //anonymity network.
> * tshark,wireshark //usefull for debugging modem protocol in some
> phones.
>
> Games(All the free games that don't require 3d if possible):
> * abuse (arcade game)
> * bzflag? doesn't it require 3d acceleration?
> * bzflag-server? is it required for bzflag?
> * cellhunter //not really a game, it's rather a tool for mapping cell
> * crimsonfields
>    towers with the freerunner, would be nice to have.
> * freedoom // free software data (.wad) for the game named doom.
> * frozen-bubble
> * openttd* //train simulation
> * opentryan
> * rocksndiamonds
> * supertux,supertux-qvga
> * wordwarvi //great game
> * xboard //also need a chess engine such as gnuchess or another one
> * prboom  ??? //not in the list, but probably not in the newer oe
>    either. doom game.
>
>
> Misc comments:
> * Aurora is in meta-smartphone I think.
> * Eukrea uses barebox in its layers.
> * We have a generic compat wireless that has almost all modules in the
>    new oe.
> * concierge is an osgi implementation that was used in the buglabs bug
>    1.x and not used anymore in the buglabs bug 2.x
> * emacs-x11 is already in the new oe, under the name of emacs(yes it
>    works with X11).
> * fso2-demo-image //obsolete, probably doesn't work anymore because of
> zhone
> * fso2-console-image //available in meta-fso
> * fso-console-image //replaced by fso2-console-image
> * gnuradio-image //probably in meta-ettus?


Images should be kept out or to a minimum of mete-oe. Unless they really 
work on a number of machines.

Philip

> * gpsd-device-config //obsolete?
> * linux-bug //kernel too old but no replacement, a 2.6.30 exist without
>    display and only serial is in mainline.
> * linux-leviathan //obsolete, was for htc dream but got renamed.
> * lowpan-tools //seem usefull for the nanonote and it's lowpan sdio
>    card. what's the status of the nanonote in the new oe? was there a
>    layer somewhere on some git hosting websites?
> * madwifi-ng //obsoleted by the ath5k driver
> * mokonnect //obsoleted by iliwi
> * msmcomm-specs, palmpre-audio-scripts  //palm pre got dropped by
> freesmartphone and msmcommd was the deamon that talked to its modem
> * remoko* // uses bluez3, bluetooth mouse,keyboard,etc...
>    implementation.
> * sms-sentry //don't work anymore, need to be updated to the new
>    freesmartphone API, usefull for finding the position of your lost
>    phone.
> * tichy // not tested but may be really old...for the openmoko
> * wesnoth-wvga // wesnoth-wvga is the equivalent of wesnoth in the new
>    oe, and the old "wesnoth" is a sub wvga version, which is dropped
>    upstream.
> * xfce46-image,xfce-image there is an xfce image in angstrom in the
>    newer oe.
>
> Denis.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


