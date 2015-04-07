Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2289360089;
	Tue,  7 Apr 2015 12:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t37CU5JX006588; Tue, 7 Apr 2015 13:30:05 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xqsH2-eUEt6j; Tue,  7 Apr 2015 13:30:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t37CTmj4006570
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Apr 2015 13:30:00 +0100
Message-ID: <1428409788.14020.461.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Tue, 07 Apr 2015 13:29:48 +0100
In-Reply-To: <552396CA.7060806@dresearch-fe.de>
References: <551143C5.90207@dresearch-fe.de>
	<1427195564.14020.31.camel@linuxfoundation.org>
	<552396CA.7060806@dresearch-fe.de>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: fetch race problem
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
X-List-Received-Date: Tue, 07 Apr 2015 12:30:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-04-07 at 10:35 +0200, Steffen Sledz wrote:
> Am 24.03.2015 um 12:12 schrieb Richard Purdie:
> >>> Is this a problem in oe-core too (or oe-classic only)?
> >>
> >> Any ideas how to avoid such errors?
> > 
> > In theory bitbake has locks on files in DL_DIR, even for git
> > repositories so it should only touch the repo with one fetch process at
> > a time even if multiple recipes reference the same thing.
> > 
> > There were some big fetcher reworks in more recent versions of bitbake.
> > For OE-Classic, I'm guessing you're using an older version. You could
> > try transplanting the modern fetcher core onto your older bitbake I
> > guess.
> 
> I do not feel competent enough to try this.
> 
> Is it possible (in oe-classic) to mark two or more recipes (or single stages) to run exclusive?

do_fetch[depends] += "xxx:do_fetch"

in one recipe would make it run after the fetch of the other recipe
(xxx) ...

I will say that oe-classic is dead at this point, its not something I'd
recommend people to be working with.

Cheers,

Richard




