Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id EA1966010D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 17:31:29 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1Zz6Zt-0007GQ-Oa; Wed, 18 Nov 2015 18:31:30 +0100
Message-ID: <1447867889.1472.63.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 18 Nov 2015 17:31:29 +0000
In-Reply-To: <20151118172053.GF2213@jama>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
	<e58d22785b2a1d629653c2f6ba32e26e4eb8ffa6.1447757562.git.Martin.Jansa@gmail.com>
	<1447864714.1472.54.camel@pbcl.net> <20151118165158.GE2213@jama>
	<1447866323.1472.58.camel@pbcl.net> <20151118172053.GF2213@jama>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 11/16] arch-armv7ve: add tune include for armv7ve and use it from cortexa7 and cortexa15
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
X-List-Received-Date: Wed, 18 Nov 2015 17:31:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-11-18 at 18:20 +0100, Martin Jansa wrote:
> So to get rid of -march we'll have to either
> 
> 1) check in arch-armv7a.inc if TUNE_FEATURES also contains some
> TUNE_FEATURE which will append -mcpu
> 2) don't include armv7a TUNE_FEATURE in TUNE_FEATURES_tune
> -cortexa15t,
> but the MACHINEOVERRIDES is still useful in many cases
> 3) use TUNE_CCARGS_remove to remove -march when adding -mcpu
> 4) rework whole tune files even more (probably by introducing another
> variable which will hold just one of -march,-mcpu,-mtune and gets
> appended to TUNE_CCARGS).

Or 5) just overwrite TUNE_CCARGS in tune-cortexa15.inc after including
arch-armv7a.inc, rather than appending to it.  

But personally I would be inclined to do (2) and add the appropriate
MACHINEOVERRIDES (which I think is just "armv7a" in practice) by steam
in tune-cortexa15.inc.

p.


