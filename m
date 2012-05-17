Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SV80K-0006H6-VX for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 23:13:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4HL2urV031525;
	Thu, 17 May 2012 22:02:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30705-07; Thu, 17 May 2012 22:02:47 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4HL2hsg031513
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 17 May 2012 22:02:45 +0100
Message-ID: <1337288563.7473.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 17 May 2012 22:02:43 +0100
In-Reply-To: <0FEE2025-8E84-4CBB-8568-483A55233BD7@dominion.thruhere.net>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1srxyZkjFe+aypM_X+Wgyd-8b1X664Y8jWQuPF=xijeg+w@mail.gmail.com>
	<1337286572.7473.10.camel@ted>
	<0FEE2025-8E84-4CBB-8568-483A55233BD7@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
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
X-List-Received-Date: Thu, 17 May 2012 21:13:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-17 at 22:44 +0200, Koen Kooi wrote:
> Op 17 mei 2012 om 22:29 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> 
> > On Tue, 2012-05-15 at 13:54 -0700, Khem Raj wrote:
> >> On Tue, May 15, 2012 at 2:32 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >>> The commit breaks pkgconfig and after discussing it with the kmod and udev maintainers the conclusion was reached that putting the libraries in /lib instead of /usr/lib is not supported.
> >>> 
> >>> This reverts commit 6b74f2461735272bd950a4f060dab6e778a36f92.
> >> 
> >> while this is what I had initially it doesn't go well with kmod living in
> >> /sbin and accessing libraries from /usr due to our QA checks although
> >> I am all for simplifying it where we don't make this check at all.
> > 
> > I've had requests for it along with a commitment to fix it and patches.
> > If we decide we don't want this, fine and that will be the case if
> > patches are not forthcoming to fix the QA issues. I don't think we've
> > reached that point at this with that yet.
> > 
> > I've decided to accept this patch and "unbreak" meta-oe/udev at the
> > expense of screwing up OE-Core. I am however still deeply unhappy people
> > are trying to bypass OE-Core this way and then "blackmail" OE-Core using
> > breaking meta-oe as a reason. The whole systemd thing has been badly
> > handled and needs to get fixed properly.
> 
> What does systemd have to do with this?

Why does meta-oe has its own udev recipe? Is systemd related to that at
all?

>  This is about a broken commit breaking udev 182 for over a week.

OE-Core worked fine and the commit fixes QA warnings which are now back.

> If you have issues with systemd, send patches to meta-oe to fix it. Or
> at least bug reports that are more than the insinuations above. 

I looked in the README and followed that to other README files but
couldn't find any indication about what to do with bugs other than write
patches which I obviously don't have.

When will you be sending the patch to fix the QA warning your revert has
introduced? Yes this is a rhetorical question since I've seen your view
on this problem previously.

Cheers,

Richard




