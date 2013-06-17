Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 7968F60819
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 11:15:16 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UoXP2-00034c-Lo; Mon, 17 Jun 2013 13:15:16 +0200
Message-ID: <1371467716.6580.23.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 17 Jun 2013 12:15:16 +0100
In-Reply-To: <1371467178.20823.103.camel@ted>
References: <cover.1371447869.git.Qi.Chen@windriver.com>
	<fd86333f362b5ce34f7d2f2e60d03a4477ff8eeb.1371447869.git.Qi.Chen@windriver.com>
	<1371464233.6580.3.camel@phil-desktop.brightsign>
	<1371464893.20823.100.camel@ted>
	<1371466771.6580.14.camel@phil-desktop.brightsign>
	<1371467178.20823.103.camel@ted>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 9/9] tinylogin: remove recipe
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
X-List-Received-Date: Mon, 17 Jun 2013 11:15:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-06-17 at 12:06 +0100, Richard Purdie wrote:
> The plan (and I believe what this series does) is to have two busybox
> binaries, one is suid (as small a subset as we really need) and the
> other is not and hence this hopefully goes some way to reassuring people
> about that.

Partly, but that's only half the problem.  My recollection from when I
last looked at this is that it was actually quite straightforward to
convince yourself by inspection of the code that busybox is indeed
dropping setuid privs almost immediately for applets that don't need it,
so the risk of having things like /bin/cat unexpectedly running as
setuid is probably fairly low.  (However, there are other minor reasons
why having the primary busybox binary as setuid is sometimes
inconvenient so I agree that splitting the setuid portions out makes
sense.)

What's harder. given the way that the code is structured, is to get a
clear view of which lines of source might end up being invoked by one of
the setuid applets and to determine whether this has changed from one
busybox release to the next.

p.



