Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 31E5E60107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 17:39:11 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZzTAt-0008GO-3Q; Thu, 19 Nov 2015 18:39:11 +0100
Message-ID: <1447954750.1472.88.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 17:39:10 +0000
In-Reply-To: <a84d885d2235edef7159fffa522fe0f41a6d623e.1447952784.git.raj.khem@gmail.com>
References: <a13855998ddc7628c374b810079d9c1e1ee7a213.1447952784.git.raj.khem@gmail.com>
	<a84d885d2235edef7159fffa522fe0f41a6d623e.1447952784.git.raj.khem@gmail.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH 03/13] gdb: Fix build with musl
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
X-List-Received-Date: Thu, 19 Nov 2015 17:39:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2015-11-19 at 17:10 +0000, Khem Raj wrote:
> This is a patch that has been submitted upstream as well

Shouldn't it have an Upstream-Status header saying that?

p.

> 
index 0000000..1302330
> --- /dev/null
> +++ b/meta/recipes-devtools/gdb/gdb/0001-Use-exported-definitions-of
> -SIGRTMIN.patch
> @@ -0,0 +1,52 @@
> +From 2f97e89e9e4e5797d0d973e1d05c1f44c46b4912 Mon Sep 17 00:00:00
> 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Fri, 5 Jun 2015 20:21:38 -0700
> +Subject: [PATCH] Use exorted definitions of SIGRTMIN
> +
> +Define W_STOPCODE if not defined already
> +
> +__SIGRTMIN is internal to glibc and other libcs e.g. musl
> +may not provide them
> +
> +Fixes
> +https://sourceware.org/bugzilla/show_bug.cgi?id=13012
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> 


