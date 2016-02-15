Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB2573178
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Feb 2016 23:30:55 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aVSbX-0002Xr-BS; Tue, 16 Feb 2016 00:30:55 +0100
Message-ID: <1455579049.2039.22.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Ross Burton <ross.burton@intel.com>
Date: Mon, 15 Feb 2016 23:30:49 +0000
In-Reply-To: <1455558632-1397-1-git-send-email-ross.burton@intel.com>
References: <1455558632-1397-1-git-send-email-ross.burton@intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] lib/qa.py: raise ValueError if file isn't an ELF
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
X-List-Received-Date: Mon, 15 Feb 2016 23:30:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-02-15 at 17:50 +0000, Ross Burton wrote:
> Instead of raising a generic Exception that can't be handled specifically, raise
> a ValueError.

If what you want is an exception to mean "this file isn't actually ELF",
how about defining a new exception class InvalidElfError or something
and raising that?  ValueError still seems a bit vague for what you are
trying to do.

p.



