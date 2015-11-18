Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id ABFD760118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 16:36:05 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1Zz5iH-0007EQ-6h; Wed, 18 Nov 2015 17:36:05 +0100
Message-ID: <1447864564.1472.52.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 16:36:04 +0000
In-Reply-To: <018bb1afb653b342e39f2d9c7a14645913c554ae.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
	<018bb1afb653b342e39f2d9c7a14645913c554ae.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Subject: Re: [PATCHv2 09/16] cortexa{7,15,17}: add VFPv4 tunes
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
X-List-Received-Date: Wed, 18 Nov 2015 16:36:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-11-17 at 11:58 +0100, Martin Jansa wrote:
> * it was added only to hf cortexa7 in:
>   commit e97d152ca13556b41a236c1a4cfb11e77ff857d7
>   Author: Kristof Robot <krirobo@gmail.com>
>   Date:   Sun Jan 26 10:03:56 2014 +0100
> 
>       Add Cortex A7 support for NEONv2 & FPv4
> 
> * add it to softfp cortexa7 and both versions for cortexa15 and
>   cortexa17 tunes

I can't say I'm wildly thrilled about the combinatorial explosion of
tunes that differ only in a few letters.  Can't we just enable NEON and
VFPv4 under the existing cortex-a15 tune?  Those ISAs are both part of
the Cortex-A15 cpu, right?

Also...

> * we should also update Cortex-A7 and Cortex-A15, to use 
> -march=armv7ve,
>   but the problem is that oe-core has gcc-4.[89] and gcc-5.2 and gcc
> -4.8
>   doesn't support it yet, maybe we should do this change after gcc
> -4.8
>   is removed, for details see:
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57907

... this part of the commit message is superseded by the following
patch, right?

p.


