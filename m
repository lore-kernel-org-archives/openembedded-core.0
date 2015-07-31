Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 19865765C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jul 2015 14:31:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VEV6tE009249; Fri, 31 Jul 2015 15:31:06 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id i7wAU5dG8BTR; Fri, 31 Jul 2015 15:31:06 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t6VEUq5L009242
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 31 Jul 2015 15:31:03 +0100
Message-ID: <1438353052.22462.80.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Fri, 31 Jul 2015 15:30:52 +0100
In-Reply-To: <CAP9ODKo=-GW32HqzO3ewzNi+YYL8U-Gcp8zAx9xKCs+vrYkb5w@mail.gmail.com>
References: <cover.1438161068.git.liezhi.yang@windriver.com>
	<5755146.lYtmNt1cvb@peggleto-mobl.ger.corp.intel.com>
	<55B8A89A.6050406@windriver.com> <1438170429-sup-8609@axis.com>
	<CAP9ODKob+TVBpb1jrzVueZT0w2DQpP5X0YBAwy-RFEoh615rHw@mail.gmail.com>
	<1438239812-sup-93@axis.com> <55B9CD93.1000902@windriver.com>
	<1438244164-sup-163@axis.com>
	<CAP9ODKo=-GW32HqzO3ewzNi+YYL8U-Gcp8zAx9xKCs+vrYkb5w@mail.gmail.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] bitbake.conf: add GITHUB_GIT
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
X-List-Received-Date: Fri, 31 Jul 2015 14:31:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-07-30 at 08:34 -0300, Otavio Salvador wrote:
> On Thu, Jul 30, 2015 at 5:32 AM, Olof Johansson <olof.johansson@axis.com> wrote:
> > Excerpts from Robert Yang's message of 2015-07-30 09:09:07 +0200:
> >> PREMIRRORS is for all the recipes/protocols ?
> >
> > No, PREMIRRORS is quite expressive, for instance:
> >
> > PREMIRRORS = " \
> >   https?$://downloads.example.org$/.*   http://mirror.example.com/ \n \
> > "
> >
> > This should only premirror downloads.example.com files, fetched via http
> > or https. See the bitbake fetcher's uri_replace method in
> > bitbake/lib/bb/fetch2/__init__.py for the implementation.
> 
> Yes, you can.
> 
> But the mirrors scheme allows for, for example, map it for git:// and
> https:// protocols without changing the recipes.
> 
> I am in favor of consistency here and having a unique var for github helps.

I came to review this as Ross pulled it into mut and I reached the same
conclusion as Olof here. We have PREMIRRORS, we can also exclude
networks from the fetcher and therefore have a ton of ways of rewriting
this already.

Yes, we do want standardisation, but all the urls look standardised to
me already. 

IMO, we want to see less of these global variables, not more. There once
was a time when they might have been useful but the fetcher is pretty
good about dealing with this now so lets not complicate this more than
we need to.

Cheers,

Richard



