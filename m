Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SV7UC-0004Cv-QQ for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 22:39:48 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4HKTiD6031262;
	Thu, 17 May 2012 21:29:44 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30695-06; Thu, 17 May 2012 21:29:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4HKTX8v031255
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 17 May 2012 21:29:34 +0100
Message-ID: <1337286572.7473.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 17 May 2012 21:29:32 +0100
In-Reply-To: <CAMKF1srxyZkjFe+aypM_X+Wgyd-8b1X664Y8jWQuPF=xijeg+w@mail.gmail.com>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<CAMKF1srxyZkjFe+aypM_X+Wgyd-8b1X664Y8jWQuPF=xijeg+w@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Thu, 17 May 2012 20:39:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-05-15 at 13:54 -0700, Khem Raj wrote:
> On Tue, May 15, 2012 at 2:32 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > The commit breaks pkgconfig and after discussing it with the kmod and udev maintainers the conclusion was reached that putting the libraries in /lib instead of /usr/lib is not supported.
> >
> > This reverts commit 6b74f2461735272bd950a4f060dab6e778a36f92.
> 
> while this is what I had initially it doesn't go well with kmod living in
> /sbin and accessing libraries from /usr due to our QA checks although
> I am all for simplifying it where we don't make this check at all.

I've had requests for it along with a commitment to fix it and patches.
If we decide we don't want this, fine and that will be the case if
patches are not forthcoming to fix the QA issues. I don't think we've
reached that point at this with that yet.

I've decided to accept this patch and "unbreak" meta-oe/udev at the
expense of screwing up OE-Core. I am however still deeply unhappy people
are trying to bypass OE-Core this way and then "blackmail" OE-Core using
breaking meta-oe as a reason. The whole systemd thing has been badly
handled and needs to get fixed properly. I am trying not to make a big
thing about that although I do feel provoked on other issues and its
hard to resist replying in kind.

Cheers,

Richard









