Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 4A52F71AEB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 16:54:48 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1cRMAf-0005IL-Ku; Wed, 11 Jan 2017 17:54:47 +0100
Message-ID: <1484153684.3966.21.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jan 2017 16:54:44 +0000
In-Reply-To: <CAMKF1sqSWZzs=-q2FZh4az1vNcwV_CZx1iQktQV8fRR5s14qfw@mail.gmail.com>
References: <20170111035102.18447-1-raj.khem@gmail.com>
	<20170111035102.18447-2-raj.khem@gmail.com>
	<CAJTo0LZYiqp+b7hwsGaZDKbpwo4UPxyLLw7Eje1-Y5Fg-=Jwow@mail.gmail.com>
	<1484150216.3966.19.camel@pbcl.net>
	<CAMKF1sqSWZzs=-q2FZh4az1vNcwV_CZx1iQktQV8fRR5s14qfw@mail.gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] glibc: Upgrade to 2.25
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
X-List-Received-Date: Wed, 11 Jan 2017 16:54:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-01-11 at 08:21 -0800, Khem Raj wrote:
> 
> This is showing when executing target binaries in qemu here I
> believe. One
> workaround we could try is to use LD_PRELOAD of libpthread.so.0, that
> might get us over this error, but the issue still may manifest on
> target apps
> using libpng16 with other library pulling in libpthread

Yeah, we should just get the bug fixed (or temporarily revert the patch
in question) rather than applying our own hacks to work around it.  I
doubt libpng is the only library that uses longjmp and doesn't link
-lpthread.

I imagine it'd be fairly easy to generate a testcase, do you want to
have a go at that?

p.


