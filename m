Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RW4Oh-0001sL-L2 for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 12:01:49 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1At6KL013725
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 10:55:06 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13608-02 for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Dec 2011 10:55:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pB1Asw7t013712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Dec 2011 10:54:59 GMT
Message-ID: <1322736907.17484.106.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 01 Dec 2011 10:55:07 +0000
In-Reply-To: <CAGiJk9dH=1aV-YFkcr8aAkNsMq+dM4625FuOJHF_et4bYBPA+A@mail.gmail.com>
References: <CAGiJk9dH=1aV-YFkcr8aAkNsMq+dM4625FuOJHF_et4bYBPA+A@mail.gmail.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Thu, 01 Dec 2011 11:01:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-12-01 at 11:47 +0100, Samuel Stirtzel wrote:
> Hi,
> some devices like the Nokia N900 or the OpenPandora provide a hardware
> keyboard,
> other devices need USB keyboards to operate, but how could a user
> input text into a touchscreen-only device?
> 
> 
> #1. The situation
> 
> Portable devices with a touchscreen usually provide virtual keyboards,
> looking around in OE-dev and OE-Core,
> there is illume-keyboard but i doubt it can be used with XFCE that easily.
> 
> To tell the user that he has to buy a (small) hardware keyboard to use
> a touchscreen device isn't an "appropriate" solution,
> if you know what I mean ;)
> 
> 
> 
> #2. What was already discovered
> 
> There are plenty of virtual keyboards out there, for example:
> -gok (gnome on-screen keyboard) [1]
> -kvkbd (kde virtual keyboard) [2]
> -illume-keyboard (e17 enlightenment on-screen-keyboard add-on) [3]
> -onboard (generic on-screen keyboard) [4]
> -(Qt) Colibri (in application virtual keyboard) [5]
> -(Qt/Gtk2/Gtk3) Maliit (in application virtual keyboard) [6]

OE-Core also includes matchbox-keyboard as part of sato. Its not perfect
but worth including in your list...

Cheers,

Richard



