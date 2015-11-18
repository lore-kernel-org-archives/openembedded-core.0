Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 153AB60118
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 16:38:35 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1Zz5kh-0007Eq-Ax; Wed, 18 Nov 2015 17:38:35 +0100
Message-ID: <1447864714.1472.54.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 18 Nov 2015 16:38:34 +0000
In-Reply-To: <e58d22785b2a1d629653c2f6ba32e26e4eb8ffa6.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
	<e58d22785b2a1d629653c2f6ba32e26e4eb8ffa6.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 18 Nov 2015 16:38:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-11-17 at 11:58 +0100, Martin Jansa wrote:
> * be aware that this -march value is available only in gcc-4.9 and
>   newer:
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=57907
> 

Can you clarify why this is an improvement?  The previous patch already
changed cortex-a15.inc to use -mcpu=cortexa15, which effectively
implies -march=armv7ve already (and works on all gcc versions) so I'm
not entirely sure what this second patch really buys you.

p.


