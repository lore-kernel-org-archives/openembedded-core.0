Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SB35t-0008LT-9Y for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 12:55:45 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NBknKt026126
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 11:46:49 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25941-02 for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 11:46:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2NBkd4t026120
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 11:46:40 GMT
Message-ID: <1332503202.9740.391.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 23 Mar 2012 11:46:42 +0000
In-Reply-To: <CAGiJk9evph+E_CzqN9iOAqAD9ypkcDvV9xj2LrkD1O05Dv=CbA@mail.gmail.com>
References: <1332339926-27043-1-git-send-email-s.stirtzel@googlemail.com>
	<4F6A2F2F.2090607@linux.intel.com>
	<FC6FAFAF-2C6E-4EF7-8AD9-D2C30D2114DD@dominion.thruhere.net>
	<CAGiJk9cw9KxmoPcmad1aR64vXaqKujUY7nH_pVePnfVPY-uedw@mail.gmail.com>
	<CDC69864-7475-4B3C-B966-C3B6CC67B8E7@dominion.thruhere.net>
	<CAGiJk9cUtvJn2uKRxBzP_0nvs78bYvEJ2JKsCx4HKdo1zxL9DA@mail.gmail.com>
	<4F6B4C0B.3030504@linux.intel.com>
	<CAAQYJAtjfhhckJOTo1dxit4S72wFQ5Jt+r4MMfN6-Qu-Bw=DOg@mail.gmail.com>
	<CAGiJk9evph+E_CzqN9iOAqAD9ypkcDvV9xj2LrkD1O05Dv=CbA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] giflib: Move to OE-Core
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
X-List-Received-Date: Fri, 23 Mar 2012 11:55:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-23 at 09:00 +0100, Samuel Stirtzel wrote:
> 2012/3/23 Andrea Adami <andrea.adami@gmail.com>:
> > On Thu, Mar 22, 2012 at 4:58 PM, Saul Wold <sgw@linux.intel.com> wrote:
> >> On 03/22/2012 02:41 AM, Samuel Stirtzel wrote:
> >>>
> >>> 2012/3/22 Koen Kooi<koen@dominion.thruhere.net>:
> >>>>
> >>>>
> >>>> Op 22 mrt. 2012, om 09:48 heeft Samuel Stirtzel het volgende geschreven:
> >>>>
> >>>>> 2012/3/21 Koen Kooi<koen@dominion.thruhere.net>:
> >>>>>>
> >>>>>>
> >>>>>> Op 21 mrt. 2012, om 20:42 heeft Saul Wold het volgende geschreven:
> >>>>>>
> >>>>>>> On 03/21/2012 07:25 AM, Samuel Stirtzel wrote:
> >>>>>>>>
> >>>>>>>> * This move will allow the testing of meta-kde for users without
> >>>>>>>> meta-openembedded.
> >>>>>>>>
> >>>>>>> So what other layers are using giflib?
> >>>>>>>
> >>>>>>> Your suggesting that we need to have it in oe-core so people don't
> >>>>>>> need to add the meta-openembedded layer when using meta-kde?
> >>>>>>>
> >>>>>>> I am just trying to get more data before making a decision.
> >>>>>>
> >>>>>>
> >>>>>> Let's put everything in oe-core!
> >>>>>
> >>>>>
> >>>>> Otherwise it would require to maintain a redundant copy of giflib in
> >>>>> meta-kde.
> >>>>
> >>>>
> >>>> I don't think you get the concept of layers and keeping non-core stuff
> >>>> out of oe-core.
> >>>
> >>>
> >>> How can it be that libpng is core stuff and libgif is not?
> >>>
> >> libpng is in oe-core because it is used by other parts of oe-core (Sato,
> >> GTK+, Gthumb, Cups, ...).  PNG is also more common that GIF because GIF had
> >> licensing issues in the past.
> >
> > All this seems to me unsatisfactory being that the above mentioned
> > 'parts of OE' should not even be in oe-core.
> > About the specific .gif, .png , etc. libs, those should be in a
> > meta-graphics layer or whatever you want to call it.
> 
> There is a layer called meta-multimedia, would giflib, libpng and the
> others fit into it?

I think people are focusing on libpng a little too much here.

libpng turns out to be an order of magnitude more important than giflib
due to the fact that pretty much any graphical UI uses them at this
point. To remove libpng from OE-Core we'd have to remove the X11 stack
and pretty much anything graphical (core gnome, QT and probably sdl and
directfb). That is not what we're trying to achieve in the core and not
in the best interests of OE.

giflib on the other hand is used more on the fringes of the system,
clearly demonstrated that we have a solid graphic core and don't need
it.

You can't just say "its a multimedia format so it belongs in
meta-multimedia" as you have to consider what depends on it and how
important it is in the overall web of dependencies.

I realise this situation is messy. Its a hard problem.

Cheers,

Richard






