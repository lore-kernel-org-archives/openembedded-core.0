Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 397B56E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 19:59:33 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZbZuV-00080Q-Gk; Mon, 14 Sep 2015 21:59:31 +0200
Message-ID: <1442260764.2948.90.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Mon, 14 Sep 2015 20:59:24 +0100
In-Reply-To: <1442245637-140022-1-git-send-email-mark.hatle@windriver.com>
References: <1442245637-140022-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] prelink: Move to latest release
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
X-List-Received-Date: Mon, 14 Sep 2015 19:59:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-09-14 at 10:47 -0500, Mark Hatle wrote:
> [YOCTO #8227]
> 
> The latest release has a fix for prelinking on ARM with recent binutils.
> 
> For more information on why the change was necessary, see:
> 
>   https://sourceware.org/ml/binutils/2014-06/msg00228.html

That link isn't particularly illuminating for someone not well versed in
the art of prelink.  I assume the significant thing is that the default
MAXPAGESIZE has changed for arm, but it's not entirely obvious why this
matters to prelink, what problem it caused, or what the change in
prelink is that fixes the problem.  Can you elaborate?

thanks

p.



