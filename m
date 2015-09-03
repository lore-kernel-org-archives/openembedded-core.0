Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 39D947423D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Sep 2015 20:27:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t83KRKqq023876; Thu, 3 Sep 2015 21:27:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mVppO2ZaCXdH; Thu,  3 Sep 2015 21:27:19 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t83KR49F023844
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 3 Sep 2015 21:27:15 +0100
Message-ID: <1441312024.24871.135.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 03 Sep 2015 21:27:04 +0100
In-Reply-To: <CAMKF1sp=Hiwt=oYfFy8Mhj4TMXj3x3Tykmg6mNLLtyEXV+TVwQ@mail.gmail.com>
References: <1441143270-27322-1-git-send-email-jslater@windriver.com>
	<1441143270-27322-2-git-send-email-jslater@windriver.com>
	<CAP9ODKp5sMLAB1ohdVPAPZrDeUCjfSGuLVF-VU53BsvzHX29mg@mail.gmail.com>
	<55E74986.1030703@windriver.com>
	<CAP9ODKpx4niWDNDy4t2SUf7xwz5ShoZMsivtM6_qA3o-kBo5AA@mail.gmail.com>
	<1441282288.24871.113.camel@linuxfoundation.org>
	<CADkTA4N7yd=iNEJh4dY8Mdt75j25RV8LgCQAqsZ8zRw_h=o1wg@mail.gmail.com>
	<CAMKF1sp=Hiwt=oYfFy8Mhj4TMXj3x3Tykmg6mNLLtyEXV+TVwQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 03 Sep 2015 20:27:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-09-03 at 13:22 -0700, Khem Raj wrote:
> On Thu, Sep 3, 2015 at 5:20 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> >> To put this another way, I think it is probably reasonable that we
> >> should be able to build an image from OE-Core with basic functionality
> >> like networking without busybox?
> >
> > That's what I'd support. If everything you need for the functionality with busy
> > box is in oe-core, to me, it doesn't make sense to go outside core to get that
> > same functionality without busybox.
> 
> irrespective of this change. I see yet another configuration with this
> into OE-core, overall OE-Core should get smaller
> and case does not sound convincing to me. You dont want to use busybox
> in a fairly large image which has other GPLv2 software in
> it. Thats fine but doesnt look like a common usecase to me

Nobody mentioned GPLv2, that isn't relevant here.

I have heard OE being dismissed since it can't produce an image without
busybox in it. The implication is we can't build "big" Linux, only small
embedded things. The pieces we need busybox for are tiny and should be
easy to replace (like this does).

So I can see a fairly compelling argument for OE-Core to be able to
generate a busybox free image with standard functionality just from a PR
perspective. From what I gather we have people willing to test and
maintain it too...

Cheers,

Richard



