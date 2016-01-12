Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id C42286FF72
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 09:42:45 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aIvTQ-0004g3-QV; Tue, 12 Jan 2016 10:42:45 +0100
Message-ID: <1452591757.1950.33.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 12 Jan 2016 09:42:37 +0000
In-Reply-To: <4E2CA517-1339-416B-832B-AB2EFF04CEE6@gmail.com>
References: <1452205752-6353-1-git-send-email-armccurdy@gmail.com>
	<1452205752-6353-4-git-send-email-armccurdy@gmail.com>
	<1452210004.2002.129.camel@pbcl.net>
	<4E2CA517-1339-416B-832B-AB2EFF04CEE6@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/4] libav.inc: duplicate armv7a over-rides for armv7ve
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
X-List-Received-Date: Tue, 12 Jan 2016 09:42:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-11 at 14:58 -0800, Khem Raj wrote:
> it came into ffmpeg circa 2008 and proliferated into related components primarily to support vectorization and neon
> which was quite nascent for ARM architecture in those days in gcc. Today if you were to configure libav with default options
> then it uses mainly -fomit-frame-pointer-O3 -fno-math-errno -fno-signed-zeros -fno-tree-vectorize
> 
> which is primarily -Ofast -fno-tree-vectorize

I think -fno-tree-vectorize is just there as a workaround for old
compilers.  It sounds like you're saying that ffmpeg basically just
wants "-Ofast", and by implication it wants this on all architectures.
So in that case there is no need for a FULL_OPTIMIZATION override on
arm, let alone armv7a specifically.

Whether ffmpeg ought to be forcing its own FULL_OPTIMIZATION at all
versus leaving it up to the distro is another question.  Personally I
think that individual recipes have no business setting those variables,
and ffmpeg is no exception, but I don't have a particularly strong
opinion either way.

p.



