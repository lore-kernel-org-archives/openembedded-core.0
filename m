Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RW4T5-00027k-2W
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 12:06:19 +0100
Received: by bkbzv15 with SMTP id zv15so1529897bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 02:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=uhpW51jFcN0Zcdzb+YZIwaGnjXa6MGh/hKhrgv/JRLE=;
	b=gzST54i73jokWKJ/QyWttno+ikofO02J3U5WyKil1ccuvK8TJVfn6EpEyoKGHYJT0s
	U9F9s1HmZwhQegEBepfKry+qB3nZG/UrTA14wljwQARFfc+JCdy0lT5ehzCyl+z6lNrk
	T2Lf68g8sN7HK7jxcd7kRFajWMOh05JM4HmEo=
MIME-Version: 1.0
Received: by 10.204.152.83 with SMTP id f19mr6775037bkw.90.1322737177905; Thu,
	01 Dec 2011 02:59:37 -0800 (PST)
Received: by 10.223.73.197 with HTTP; Thu, 1 Dec 2011 02:59:37 -0800 (PST)
In-Reply-To: <528C3B90-90CF-48F7-AD32-0200B1F16F82@dominion.thruhere.net>
References: <CAGiJk9dH=1aV-YFkcr8aAkNsMq+dM4625FuOJHF_et4bYBPA+A@mail.gmail.com>
	<528C3B90-90CF-48F7-AD32-0200B1F16F82@dominion.thruhere.net>
Date: Thu, 1 Dec 2011 11:59:37 +0100
Message-ID: <CAGiJk9e1hij=EsWo8=nTmZxNjvptXMGjFRumKSJ3mKYf6-t3QA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
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
X-List-Received-Date: Thu, 01 Dec 2011 11:06:19 -0000
Content-Type: text/plain; charset=UTF-8

2011/12/1 Koen Kooi <koen@dominion.thruhere.net>:
>
> Op 1 dec. 2011, om 11:47 heeft Samuel Stirtzel het volgende geschreven:
>
>> Hi,
>> some devices like the Nokia N900 or the OpenPandora provide a hardware
>> keyboard,
>> other devices need USB keyboards to operate, but how could a user
>> input text into a touchscreen-only device?
>>
>>
>> #1. The situation
>>
>> Portable devices with a touchscreen usually provide virtual keyboards,
>> looking around in OE-dev and OE-Core,
>> there is illume-keyboard but i doubt it can be used with XFCE that easily.
>>
>> To tell the user that he has to buy a (small) hardware keyboard to use
>> a touchscreen device isn't an "appropriate" solution,
>> if you know what I mean ;)
>>
>>
>>
>> #2. What was already discovered
>>
>> There are plenty of virtual keyboards out there, for example:
>> -gok (gnome on-screen keyboard) [1]
>> -kvkbd (kde virtual keyboard) [2]
>> -illume-keyboard (e17 enlightenment on-screen-keyboard add-on) [3]
>> -onboard (generic on-screen keyboard) [4]
>> -(Qt) Colibri (in application virtual keyboard) [5]
>> -(Qt/Gtk2/Gtk3) Maliit (in application virtual keyboard) [6]
>
> Don't forget matchbox-keyboard and matchbox-keyboard2 :)

Right I forgot about it, sorry.

So the new list is as follows:

#2. What was already discovered

There are plenty of virtual keyboards out there, for example:
-gok (gnome on-screen keyboard) [1]
-kvkbd (kde virtual keyboard) [2]
-illume-keyboard (e17 enlightenment on-screen-keyboard add-on) [3]
-onboard (generic on-screen keyboard) [4]
 -(Qt) Colibri (in application virtual keyboard) [5]
-(Qt/Gtk2/Gtk3) Maliit (in application virtual keyboard) [6]
-matchbox-keyboards (matchbox wm virtual keyboard) [7]

#5. Appendix

[1] gok: http://www.gok.ca/
[2] kvkbd: http://kde-apps.org/content/show.php?content=94374
[3] illume: http://wiki.openmoko.org/wiki/Illume
[4] onboard: https://launchpad.net/onboard
[5] colibri: https://projects.developer.nokia.com/colibri (note: site
currently in maintenance)
[6] maliit: https://wiki.maliit.org/Main_Page
[7] matchbox-keyboard: http://matchbox-project.org/ (note: the site
seems to currently get reworked, so I got no direct link)


-- 
Regards
Samuel


