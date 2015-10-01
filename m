Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id ACF11770A0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Oct 2015 15:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t91FbWLE022850; Thu, 1 Oct 2015 16:37:32 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F_CwJ8gYqAGU; Thu,  1 Oct 2015 16:37:32 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t91FbGT0022840
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 1 Oct 2015 16:37:27 +0100
Message-ID: <1443713835.14733.13.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 01 Oct 2015 16:37:15 +0100
In-Reply-To: <CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
References: <1443709445.14733.5.camel@linuxfoundation.org>
	<CAMKF1spovYNRYZQjaghtiRdJtgs3BxHqotiv-t7n2h0DStiiDA@mail.gmail.com>
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
X-List-Received-Date: Thu, 01 Oct 2015 15:37:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-01 at 07:28 -0700, Khem Raj wrote:
> On Thu, Oct 1, 2015 at 7:24 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Just a heads up for people that we've branched for release and that
> > jethro branches are now available. Bitbake branched as 1.28, I decided
> > to save bitbake 2.0 for another occasion.
> 
> what would be the occasion ?

Memory resident Bitbake? Toaster developments? Logging improvements? New
shell commands?

> this time lets branch consistently. Across different repositories
> please.

Bitbake is the only repo which doesn't use the branch codename. I did
write at length about how version numbers as branches would actually
cause much more pain than any problem they solve, bitbake is one of the
few exceptions to that given its a tool, not metadata and has a more
consistent history where the version number means something specific and
is actively used.

>   I would also suggest to not use codenames in branches
> but rather the numbered release. If we want to use codenames for
> branches then lets drop the numbered release names.

The number does have some uses, its really not that simple.

If we want to discuss this all again, so be it, but on the eve of
release really isn't the time to start it all again.

Cheers,

Richard


