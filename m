Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QcmPD-0008Mg-Pm for openembedded-core@lists.openembedded.org;
	Sat, 02 Jul 2011 00:41:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MbxmT021874
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 23:37:59 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21610-07 for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2011 23:37:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p61MbsiL021868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jul 2011 23:37:54 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <8E04AE3A-0304-4771-A3F9-C00EA0451205@dominion.thruhere.net>
References: <cover.1309503939.git.anders@chargestorm.se>
	<cf740fbc1c5f26487e14e8959cfc13f085ff95ff.1309503939.git.anders@chargestorm.se>
	<D041C15B-428E-432D-996B-EF7356B38E29@dominion.thruhere.net>
	<201107011352.08558.anders@chargestorm.se>
	<8E04AE3A-0304-4771-A3F9-C00EA0451205@dominion.thruhere.net>
Date: Fri, 01 Jul 2011 23:37:32 +0100
Message-ID: <1309559852.20015.568.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v4 7/8] task-base: remove modutils reference.
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
X-List-Received-Date: Fri, 01 Jul 2011 22:41:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-01 at 14:05 +0200, Koen Kooi wrote:
> Op 1 jul 2011, om 13:52 heeft Anders Darander het volgende geschreven:
> 
> > 
> > * Koen Kooi Koen Kooi <koen@dominion.thruhere.net> [07/01/11 09:20 AM]:
> >> Op 1 jul 2011, om 09:06 heeft Anders Darander het volgende geschreven:
> >>> Also remove the other kernel24 references.
> >>> Make everything dependent on kernel26 default.
> >> 
> >> Since there will be only one of each, can we just completely scrap there
> >> variables and put the items directly in the tasks?
> > 
> > Sure, we could do that.
> > 
> > One question though, how should I treat 
> > 
> > RRECOMMENDS_task-base-kernel26 = "\
> >    kernel-module-nls-utf8 \
> >    kernel-module-input \
> >    kernel-module-uinput \
> >    kernel-module-rtc-dev \
> >    kernel-module-rtc-proc \
> >    kernel-module-rtc-sysfs \
> >    kernel-module-rtc-sa1100 \
> >    kernel-module-unix"
> > 
> > from task-base.bb? Should that part just be new, general
> > RRECOMMENDS = "\
> >    kernel-module-nls-utf8 \
> >    kernel-module-input \
> >    kernel-module-uinput \
> >    kernel-module-rtc-dev \
> >    kernel-module-rtc-proc \
> >    kernel-module-rtc-sysfs \
> >    kernel-module-rtc-sa1100 \
> >    kernel-module-unix"?
> > 
> > I guess that's the right thing, and I'll create a new pull request with that 
> > merged into the last patch.
> 
> The above is what I had in mind, but I do question the need for
> rtc-sa1100 in task-base, that should be in the machine.conf as
> MACHINE_EXTRA_RRECOMMENDS or so. But that is outside the scope of this
> patch I guess.

Agreed, rtc-sa1100 shouldn't be there and I don't know how that
happened :/. I'll take patches to resolve that.

Cheers,

Richard



