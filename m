Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RW4Ha-000145-3l
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 11:54:26 +0100
Received: by bkbzv15 with SMTP id zv15so1518074bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 02:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=NXi4x+yThHRzFEI3eBaCfDkNXrvlgHfI7p+G4EdTqEM=;
	b=q0mqmN3EfAoxp9g5cMcLwG5EiNfKcROS1hZOtwvUqZs9b2AQ9zs48qEIaoZG8pagGq
	TA7Syrqkwqr2JLxbwcANH2HbOcp9fKQK1NUynrHAEqoehrRfYqCQtBleY2oYibHGuJ0M
	7C037apo/7ci0nhX9VuoWTGTHhlPuGlmPn410=
MIME-Version: 1.0
Received: by 10.205.129.148 with SMTP id hi20mr6161975bkc.25.1322736464926;
	Thu, 01 Dec 2011 02:47:44 -0800 (PST)
Received: by 10.223.73.197 with HTTP; Thu, 1 Dec 2011 02:47:44 -0800 (PST)
Date: Thu, 1 Dec 2011 11:47:44 +0100
Message-ID: <CAGiJk9dH=1aV-YFkcr8aAkNsMq+dM4625FuOJHF_et4bYBPA+A@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: RFC: On-screen- / virtual-keyboard
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
X-List-Received-Date: Thu, 01 Dec 2011 10:54:26 -0000
Content-Type: text/plain; charset=UTF-8

Hi,
some devices like the Nokia N900 or the OpenPandora provide a hardware
keyboard,
other devices need USB keyboards to operate, but how could a user
input text into a touchscreen-only device?


#1. The situation

Portable devices with a touchscreen usually provide virtual keyboards,
looking around in OE-dev and OE-Core,
there is illume-keyboard but i doubt it can be used with XFCE that easily.

To tell the user that he has to buy a (small) hardware keyboard to use
a touchscreen device isn't an "appropriate" solution,
if you know what I mean ;)



#2. What was already discovered

There are plenty of virtual keyboards out there, for example:
-gok (gnome on-screen keyboard) [1]
-kvkbd (kde virtual keyboard) [2]
-illume-keyboard (e17 enlightenment on-screen-keyboard add-on) [3]
-onboard (generic on-screen keyboard) [4]
-(Qt) Colibri (in application virtual keyboard) [5]
-(Qt/Gtk2/Gtk3) Maliit (in application virtual keyboard) [6]


But they all have some limitations:
Either they only work with one window manager, or they don't have
support for different keyboard layouts.
In application keyboards have major drawbacks too, the user can't
enter text into other applications (eg. terminals).

The onboard virtual keyboard needs GObject-Introspection which is
somehow cumbersome to build (or did someone succeed to build it?).



#3. What is needed

Most likely suitable would be a virtual keyboard that can be used
across distributions (or at least within OE-Core),
and it should work independent from the window manager.

Using a virtual keyboard (library / plug-in) that is bound to the code
of the applications would also be possible, but it is very limiting.


Of course the keyboard needs some functionality, like switching the
keyboard layout to the preferred localization, resizing properly, it
should look "nice".
The best would be, if the keyboard features usability enhancements,
something like: The user can see the button that he pressed hovering
above his finger or the like (just these "iWhatever" features).

If the user needs to use a pen for the keyboard, that would be no problem.
But if the user has to re-type every second letter because of an
unusable layout, then I would prefer to ship speech recognition
software :)
(on a mobile phone I could just do that, but on "industrial" devices
it would not be accepted that easily).



#4. Working towards the solution

Porting onboard could work out well, but GObject-Introspection is not
that trivial.

If you have any other idea, or know about any software that would be
interesting, it would help much.
There is no problem if the software is incomplete / currently in
active development, or in a beta stage.
(As long as it is already usable).



#5. Appendix

[1] gok: http://www.gok.ca/
[2] kvkbd: http://kde-apps.org/content/show.php?content=94374
[3] illume: http://wiki.openmoko.org/wiki/Illume
[4] onboard: https://launchpad.net/onboard
[5] colibri: https://projects.developer.nokia.com/colibri (note: site
currently in maintenance)
[6] maliit: https://wiki.maliit.org/Main_Page

-- 
Regards
Samuel


