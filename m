Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3A64560819
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jun 2013 10:59:33 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UoX9o-00033f-DP; Mon, 17 Jun 2013 12:59:32 +0200
Message-ID: <1371466771.6580.14.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 17 Jun 2013 11:59:31 +0100
In-Reply-To: <1371464893.20823.100.camel@ted>
References: <cover.1371447869.git.Qi.Chen@windriver.com>
	<fd86333f362b5ce34f7d2f2e60d03a4477ff8eeb.1371447869.git.Qi.Chen@windriver.com>
	<1371464233.6580.3.camel@phil-desktop.brightsign>
	<1371464893.20823.100.camel@ted>
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
X-List-Received-Date: Mon, 17 Jun 2013 10:59:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-06-17 at 11:28 +0100, Richard Purdie wrote:
> The thinking is therefore we should therefore create a replacement for
> it from busybox. People are nervous about making busybox entirely SUID
> but having some small subset of it seems like a reasonable compromise.

The difficulty with this in the past has always been that the way
busybox is structured makes it quite difficult to tell which parts of
the code might actually end up being executed in setuid context.  But
maybe that situation has improved now, I dunno.

p.



