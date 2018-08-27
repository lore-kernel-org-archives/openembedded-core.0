Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 25FB360721
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 22:53:48 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7RMrkqP007912
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Mon, 27 Aug 2018 23:53:47 +0100
Message-ID: <dc1b2b47e117450598f727ba00d07a718a62109a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 27 Aug 2018 23:53:46 +0100
In-Reply-To: <ae4e34f935b088807fac73bed99cb586a8d0223f.camel@linuxfoundation.org>
References: <20180807144843.26064-1-richard.purdie@linuxfoundation.org>
	<CA+chaQc7p5Q2iknW+3mVKm6jSxo0E4GJuNYLPBrRYkC29mzD5w@mail.gmail.com>
	<ae4e34f935b088807fac73bed99cb586a8d0223f.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Add sstate usage summary to the build
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
X-List-Received-Date: Mon, 27 Aug 2018 22:53:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-08-27 at 23:47 +0100, richard.purdie@linuxfoundation.org
wrote:
> On Fri, 2018-08-24 at 23:24 +0200, Martin Jansa wrote:
> > This is nice addition, but maybe it would be worth explaining
> > somewhere what these numbers actually mean.
> > 
> > e.g. my current build shows:
> > Sstate summary: Wanted 181 Found 39 Missed 142 Current 279 (21%
> > match, 69% complete)

I should add that with a bit of experience you can learnt to interpret
these.

A build with a ~20% match often means the do_populate_lic sstate
matched and nothing else did. That means there is a fair amount of work
to be done.

On the other hand, the 69% is fairly positive as a large chunk of the
build is already complete.

I'm basing this just on having watched a few builds on the
autobuilder...

Cheers,

Richard

