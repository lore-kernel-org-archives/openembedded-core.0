Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id F09246FFD3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 08:02:55 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aWg1f-0003Do-Sb; Fri, 19 Feb 2016 09:02:56 +0100
Message-ID: <1455868969.2039.44.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Gary Thomas <gary@mlbassoc.com>
Date: Fri, 19 Feb 2016 08:02:49 +0000
In-Reply-To: <56C6B83C.3040103@mlbassoc.com>
References: <56C6B83C.3040103@mlbassoc.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Recovering GCC 4.8
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
X-List-Received-Date: Fri, 19 Feb 2016 08:02:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-02-19 at 07:37 +0100, Gary Thomas wrote:
> | checking for suffix of object files... configure: error: in 
> `/local/p0381_2016-02-19/tmp/work/cortexa7hf-neon-amltd-linux-gnueabi/libgcc-initial/4.8.4-r0/gcc-4.8.4/build.arm-amltd-linux-gnueabi.arm-amltd-linux-gnueabi/libgcc':
> | configure: error: cannot compute suffix of object files: cannot compile
> | See `config.log' for more details.

I suspect you probably have some or other option set in CC or CFLAGS
that gcc-4.8 doesn't support.  What does it say in config.log?

p.



