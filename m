Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CEFFD6FD80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jun 2014 09:33:28 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5I9XMDY004717; Wed, 18 Jun 2014 10:33:22 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Hgl6T8TLYx5d; Wed, 18 Jun 2014 10:33:22 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5I9XKRF004707
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 18 Jun 2014 10:33:21 +0100
Message-ID: <1403083994.2104.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 18 Jun 2014 10:33:14 +0100
In-Reply-To: <CADkTA4NzmohFfDh1h9dobBEVC+CRum1-AeFQABVSV6O4NBi34w@mail.gmail.com>
References: <cover.1403016995.git.bruce.ashfield@windriver.com>
	<1403043506.2104.4.camel@ted> <53A0DB50.7020402@windriver.com>
	<CADkTA4NzmohFfDh1h9dobBEVC+CRum1-AeFQABVSV6O4NBi34w@mail.gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/5] linux-yocto: 3.4, 3.10 and 3.14 updates
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jun 2014 09:33:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-06-17 at 21:08 -0400, Bruce Ashfield wrote:
> On Tue, Jun 17, 2014 at 8:20 PM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
> > On 2014-06-17, 6:18 PM, Richard Purdie wrote:
> >>
> >> On Tue, 2014-06-17 at 11:26 -0400, Bruce Ashfield wrote:
> >>>
> >>> Richard/Saul,
> >>>
> >>> Here are my collect stable updates to 3.4 -> 3.14. Build and boot sanity
> >>> passed here, but with three versions being updated, its a lot of build
> >>> testing :)
> >>>
> >>> I also have an update for NAND support on the mpc8315e reference board,
> >>> which allows us to shake out flash filesystem issues. I'll follow up
> >>> with a meta-yocto-bsp change to enable the changes there as well.
> >>
> >>
> >> I merged these two series and we've started seeing:
> >>
> >> https://autobuilder.yoctoproject.org/main/builders/nightly-deb/builds/119
> >>
> >> which is a 3.14 kernel lttng-modules failure on the autobuilder :(
> >>
> >> Are we missing an update to lttng?
> >
> >
> > I reproduced the breakage with a fresh tree. I'll fire off a patch tonight
> > with any amount of luck :)
> >
> 
> No luck needed. lttng 2.4.1-stable already has a fix, once my build completes
> against 3.10, I'll send the SRCREV update.

Much appreciated, thanks!

Richard


