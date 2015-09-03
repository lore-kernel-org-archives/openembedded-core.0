Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3A45276FF2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 21:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t83LdFJ1026662; Thu, 3 Sep 2015 22:39:15 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mlcF31whuF0l; Thu,  3 Sep 2015 22:39:15 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t83Ld1Fr026645
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 3 Sep 2015 22:39:12 +0100
Message-ID: <1441316341.24871.141.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 03 Sep 2015 22:39:01 +0100
In-Reply-To: <584C7C63-C980-48F9-AFCF-8F18E8C8E442@gmail.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
	<CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
	<1441282288.24871.113.camel@linuxfoundation.org>
	<CADkTA4N7yd=iNEJh4dY8Mdt75j25RV8LgCQAqsZ8zRw_h=o1wg@mail.gmail.com>
	<CAMKF1sp=Hiwt=oYfFy8Mhj4TMXj3x3Tykmg6mNLLtyEXV+TVwQ@mail.gmail.com>
	<1441312024.24871.135.camel@linuxfoundation.org>
	<584C7C63-C980-48F9-AFCF-8F18E8C8E442@gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Joe Slater <jslater@windriver.com>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>
Subject: Re: [PATCH 1/2] ifupdown: import recipe
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
X-List-Received-Date: Thu, 03 Sep 2015 21:39:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2015-09-03 at 14:15 -0700, Khem Raj wrote:
> > On Sep 3, 2015, at 1:27 PM, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Thu, 2015-09-03 at 13:22 -0700, Khem Raj wrote:
> >> On Thu, Sep 3, 2015 at 5:20 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >>>> To put this another way, I think it is probably reasonable that we
> >>>> should be able to build an image from OE-Core with basic functionality
> >>>> like networking without busybox?
> >>> 
> >>> That's what I'd support. If everything you need for the functionality with busy
> >>> box is in oe-core, to me, it doesn't make sense to go outside core to get that
> >>> same functionality without busybox.
> >> 
> >> irrespective of this change. I see yet another configuration with this
> >> into OE-core, overall OE-Core should get smaller
> >> and case does not sound convincing to me. You dont want to use busybox
> >> in a fairly large image which has other GPLv2 software in
> >> it. Thats fine but doesnt look like a common usecase to me
> > 
> > Nobody mentioned GPLv2, that isn't relevant here.
> 
> I assumed thats one reason to not include it. I am trying to understand reasoning to
> not include busybox. Or is is just because its a poster child for litigations.

The litigation issues surrounding it certainly don't do it any favours,
but the main issue is that if busybox is there, we're not seen as a
"proper/full" linux.

> > I have heard OE being dismissed since it can't produce an image without
> > busybox in it. The implication is we can't build "big" Linux, only small
> > embedded things. The pieces we need busybox for are tiny and should be
> > easy to replace (like this does).
> 
> as we include other alternative providers, they get preference over busybox applets
> even if busybox is part of it.

The problem is some people don't want any busybox.

> > So I can see a fairly compelling argument for OE-Core to be able to
> > generate a busybox free image with standard functionality just from a PR
> > perspective. From what I gather we have people willing to test and
> > maintain it too…
> 
> PR I see. I was searching for technical reasons.

Well, its technical but related to the image of the project too. Can
OE-Core today produce a "standard linux desktop" type "full" featured
filesystem? I cannot honestly say it can due to this reason, busybox has
to be there. There are some people who do discount OE because of this.
This isn't new, I remember Marcin amongst others working on this. We're
close, but close doesn't mean we can answer "yes" to the question and I
think it would be nice to be able to do so clearly.

Cheers,

Richard


