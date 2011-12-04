Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1RXImf-0006YI-Bd
	for openembedded-core@lists.openembedded.org;
	Sun, 04 Dec 2011 21:35:37 +0100
Received: by eekc50 with SMTP id c50so186033eek.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Dec 2011 12:28:52 -0800 (PST)
Received: by 10.14.9.163 with SMTP id 35mr495752eet.234.1323030530309; Sun, 04
	Dec 2011 12:28:50 -0800 (PST)
MIME-Version: 1.0
Sender: jay@jay-tech.ru
Received: by 10.213.9.144 with HTTP; Sun, 4 Dec 2011 12:28:28 -0800 (PST)
X-Originating-IP: [78.106.255.1]
In-Reply-To: <CAGiJk9e1hij=EsWo8=nTmZxNjvptXMGjFRumKSJ3mKYf6-t3QA@mail.gmail.com>
References: <CAGiJk9dH=1aV-YFkcr8aAkNsMq+dM4625FuOJHF_et4bYBPA+A@mail.gmail.com>
	<528C3B90-90CF-48F7-AD32-0200B1F16F82@dominion.thruhere.net>
	<CAGiJk9e1hij=EsWo8=nTmZxNjvptXMGjFRumKSJ3mKYf6-t3QA@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
Date: Sun, 4 Dec 2011 23:28:28 +0300
X-Google-Sender-Auth: eLu4OkupMq7JS6n_Z1M2smiQMtY
Message-ID: <CAJG6M_OAw=jfmJJzAc98_XSbcX8ki29Oz1G6zhk+3hSkQXSwdw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: On-screen- / virtual-keyboard
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
X-List-Received-Date: Sun, 04 Dec 2011 20:35:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/12/1 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> 2011/12/1 Koen Kooi <koen@dominion.thruhere.net>:
>>
>> Op 1 dec. 2011, om 11:47 heeft Samuel Stirtzel het volgende geschreven:
>>
>>> Hi,
>>> some devices like the Nokia N900 or the OpenPandora provide a hardware
>>> keyboard,
>>> other devices need USB keyboards to operate, but how could a user
>>> input text into a touchscreen-only device?
>>>
>>>
>>> #1. The situation
>>>
>>> Portable devices with a touchscreen usually provide virtual keyboards,
>>> looking around in OE-dev and OE-Core,
>>> there is illume-keyboard but i doubt it can be used with XFCE that easi=
ly.
>>>
>>> To tell the user that he has to buy a (small) hardware keyboard to use
>>> a touchscreen device isn't an "appropriate" solution,
>>> if you know what I mean ;)
>>>
>>>
>>>
>>> #2. What was already discovered
>>>
>>> There are plenty of virtual keyboards out there, for example:
>>> -gok (gnome on-screen keyboard) [1]
>>> -kvkbd (kde virtual keyboard) [2]
>>> -illume-keyboard (e17 enlightenment on-screen-keyboard add-on) [3]
>>> -onboard (generic on-screen keyboard) [4]
>>> -(Qt) Colibri (in application virtual keyboard) [5]
>>> -(Qt/Gtk2/Gtk3) Maliit (in application virtual keyboard) [6]
>>
>> Don't forget matchbox-keyboard and matchbox-keyboard2 :)
>
> Right I forgot about it, sorry.
>
> So the new list is as follows:
>
> #2. What was already discovered
>
> There are plenty of virtual keyboards out there, for example:
> -gok (gnome on-screen keyboard) [1]
> -kvkbd (kde virtual keyboard) [2]
> -illume-keyboard (e17 enlightenment on-screen-keyboard add-on) [3]
> -onboard (generic on-screen keyboard) [4]
> =A0-(Qt) Colibri (in application virtual keyboard) [5]
> -(Qt/Gtk2/Gtk3) Maliit (in application virtual keyboard) [6]
> -matchbox-keyboards (matchbox wm virtual keyboard) [7]
>
> #5. Appendix
>
> [1] gok: http://www.gok.ca/
> [2] kvkbd: http://kde-apps.org/content/show.php?content=3D94374
> [3] illume: http://wiki.openmoko.org/wiki/Illume
> [4] onboard: https://launchpad.net/onboard
> [5] colibri: https://projects.developer.nokia.com/colibri (note: site
> currently in maintenance)
> [6] maliit: https://wiki.maliit.org/Main_Page
> [7] matchbox-keyboard: http://matchbox-project.org/ (note: the site
> seems to currently get reworked, so I got no direct link)

My list of virtual keyboards includes also:
* xvkbd http://homepage3.nifty.com/tsato/xvkbd/
* qvkeyboard http://qt-apps.org/content/show.php/QVKeyboard?content=3D77983
* Florence http://florence.sourceforge.net/english.html
* GTKeyboard http://www.gnu.org/software/gtkeyboard/gtkeyboard.html
* Literki http://wiki.openmoko.org/wiki/Literki

And "hybrid" input methods:
* Dasher http://www.inference.phy.cam.ac.uk/dasher/
* QWO http://www.nongnu.org/qwo/

--=20
Yury Bushmelev


