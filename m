Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7BD0273243
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Sep 2015 09:21:14 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZZbZ3-0001E2-QD; Wed, 09 Sep 2015 11:21:14 +0200
Message-ID: <1441790471.31676.13.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Juro Bystricky <juro.bystricky@intel.com>
Date: Wed, 09 Sep 2015 10:21:11 +0100
In-Reply-To: <1441761543-10979-1-git-send-email-juro.bystricky@intel.com>
References: <1441761543-10979-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: richard.purdie@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel-arch.bbclass: Allow 'baremetal' CPUs
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
X-List-Received-Date: Wed, 09 Sep 2015 09:21:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-09-08 at 18:19 -0700, Juro Bystricky wrote:
> Avoid "ERROR: cannot map <cpu> to a linux kernel architecture"
> Not being able to map a CPU to a kernel architecture should not be treated as
> an error when building baremetal toolchains for CPU <cpu> which does not have
> a kernel source tree.

Why is map_kernel_arch() even being invoked for a baremetal
configuration?  That sounds like it is the real bug here.

p.



