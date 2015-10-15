Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id D761A770EC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 11:51:36 +0000 (UTC)
Received: from cpc5-cmbg17-2-0-cust97.5-4.cable.virginm.net ([86.30.112.98]
	helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1Zmh4K-0005E0-66; Thu, 15 Oct 2015 13:51:36 +0200
Message-ID: <1444909889.5251.68.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Oct 2015 12:51:29 +0100
In-Reply-To: <20151015113146.GB2588@jama>
References: <AEAA8709-CF45-4759-BDEF-24201C0B19DE@gmail.com>
	<1444906192.5251.63.camel@pbcl.net> <20151015113146.GB2588@jama>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ARM: handle missing thumb suffix
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
X-List-Received-Date: Thu, 15 Oct 2015 11:51:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-10-15 at 13:31 +0200, Martin Jansa wrote:

> It's package architecture for binary feeds with -mtune=arm926ejs and
> it
> can be built with or without -mthumb, that's why packages can be
> built
> in arm926ejse or arm926ejste package feed.

Yes, I understand that.  But the point is that there doesn't seem to be
any good reason to distinguish those two cases by PACKAGE_ARCH, any
more than we use separate PACKAGE_ARCH values for binaries built with 
-O2, or -fpie, or any number of other options.

ARM926EJ-S, by definition, can execute both ARM and Thumb code so there
is no meaningful situation where arm926ejse binaries might be usable
yet arm926ejste ones are not.  

p.


