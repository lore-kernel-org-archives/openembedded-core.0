Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 397666612D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 17:10:59 +0000 (UTC)
Received: from [2a00:14f0:e04c:51ac:d546:989e:f847:6d3b] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1akxAQ-0006yw-6m; Tue, 29 Mar 2016 19:10:58 +0200
Message-ID: <1459271456.3476.211.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Dragomir Daniel <daniel.dragomir@windriver.com>, raj.khem@gmail.com, 
	richard.purdie@linuxfoundation.org, mark.hatle@windriver.com
Date: Tue, 29 Mar 2016 18:10:56 +0100
In-Reply-To: <56FAA65F.9060300@windriver.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net> <56FAA65F.9060300@windriver.com>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Tue, 29 Mar 2016 17:11:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-03-29 at 18:59 +0300, Dragomir Daniel wrote:
> 
> arch-arm8a.inc add now support for armv8-A processors which support 2
> states:
> 32-bit and 64-bit states. It makes more sense to have support for
> both states
> in the same inc file because both refer to the same arch. 

OK.  And I assume you feel this is a greater benefit than having the
32-bit ARMv8 bits in a single file that could be shared by ARMv8-R and
ARMv8-M, right?

> So, you say that we should not use aarch32 and aarch64 for armv8a,
> but to use something like armv8a64 and armv8a32?

That would be my preference, but of course it's not my decision to
make.

p.


