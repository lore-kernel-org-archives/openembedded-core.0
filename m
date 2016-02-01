Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 266D8601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Feb 2016 22:44:49 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aQNDE-0006Ay-0o; Mon, 01 Feb 2016 23:44:48 +0100
Message-ID: <1454366681.7421.37.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Randy MacLeod <randy.macleod@windriver.com>
Date: Mon, 01 Feb 2016 22:44:41 +0000
In-Reply-To: <56AFDAC5.9000008@windriver.com>
References: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
	<1453937316-1311-3-git-send-email-armccurdy@gmail.com>
	<56AFDAC5.9000008@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] glib-2.0: drop add-march-i486-into-CFLAGS-automatically.patch
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
X-List-Received-Date: Mon, 01 Feb 2016 22:44:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-01 at 17:23 -0500, Randy MacLeod wrote:
> Do you remember why this patch was needed?

The comments in the patch provide a fairly clear explanation of what
problem it was trying to solve.  But I agree with Andre that this cure
is in fact worse than the original disease.

In any case, the issue is probably moot because neither glibc nor musl
support cpus without cmpxchg any more.

p.



