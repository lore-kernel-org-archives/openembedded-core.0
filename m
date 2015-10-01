Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 52E897706C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t91Fgh7A023151; Thu, 1 Oct 2015 16:42:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dG5RnU11Hw8x; Thu,  1 Oct 2015 16:42:43 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t91FgSGu023144
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 1 Oct 2015 16:42:39 +0100
Message-ID: <1443714148.14733.17.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Thu, 01 Oct 2015 16:42:28 +0100
In-Reply-To: <CAP9ODKoL6bWh7Z9AYHLC-tzh6MbCtsPuEBf=-gYdbi7K0kABqQ@mail.gmail.com>
References: <1443709445.14733.5.camel@linuxfoundation.org>
	<CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
	<CAP9ODKoL6bWh7Z9AYHLC-tzh6MbCtsPuEBf=-gYdbi7K0kABqQ@mail.gmail.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Branched for release
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
X-List-Received-Date: Thu, 01 Oct 2015 15:42:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-01 at 11:41 -0300, Otavio Salvador wrote:
> I agree.
> 
> The mix between codenames and version numbers cause a lot of confusion
> for outsiders. We, involved with the project development can handle it
> (even though sometimes I ask myself if one codename is older or newer
> than another) but for outsiders it is deadly confusing.

As I've just replied to Khem, I posted a fairly comprehensive look at
all the possible options quite a while back, the last time people
complained. Basically, we can't win. We have slowly killed off all the
numbers that didn't have a purpose so we have one naming scheme and one
number that corresponds to it.

The only real exception is bitbake, which as tool with its own
release/versions, makes sense.

I'd also highlight that now is not the time to start changing the
release process.

Cheers,

Richard


