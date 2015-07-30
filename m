Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 3366D763E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 16:19:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id C9A3D609156
Message-ID: <1438273196.3455.25.camel@collabora.co.uk>
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 17:19:56 +0100
In-Reply-To: <CAP9ODKrUcnyNQSfevaHLFcW63tjb3pDN4AvHmfoQOjvuLe4+cg@mail.gmail.com>
References: <CAP9ODKrUcnyNQSfevaHLFcW63tjb3pDN4AvHmfoQOjvuLe4+cg@mail.gmail.com>
X-Mailer: Evolution 3.16.4 (3.16.4-2.fc22) 
Mime-Version: 1.0
Subject: Re: [for-fido] Backport for perf - support for 4.1 kernels
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
X-List-Received-Date: Thu, 30 Jul 2015 16:19:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi!

On Wed, 2015-07-29 at 17:57 -0300, Otavio Salvador wrote:
> Hello,
> 
> Is it possible for you to cherry-pick OE-Core:46f8420 for Fido? We 
> got
> one board using 4.1 kernel and it fails badly.

That seems reasonable. I think that would mean we'll also want 00608cf
?

I've put both in my joshuagl/fido-next[1] branch for testing.

Cheers,

Joshua

1. http://cgit.openembedded.org/openembedded-core-contrib/log/?h=joshua
gl/fido-next

> It is in use in master since April and had no change since its
> inclusion so it is fairly safe.
> 
> Regards,
> 
> -- 
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

