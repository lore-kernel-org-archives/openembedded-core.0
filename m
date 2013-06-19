Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 2A689601DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 10:18:40 +0000 (UTC)
Received: from cpc6-cmbg17-2-0-cust487.5-4.cable.virginmedia.com
	([86.30.57.232] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UpFTM-0007IC-Bz; Wed, 19 Jun 2013 12:18:40 +0200
Message-ID: <1371637119.6580.86.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 19 Jun 2013 11:18:39 +0100
In-Reply-To: <51C0CA73.7090606@windriver.com>
References: <51C0CA73.7090606@windriver.com>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] eglibc / glibc and option-groups being deprecated?
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
X-List-Received-Date: Wed, 19 Jun 2013 10:18:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-06-18 at 16:00 -0500, Mark Hatle wrote:
> Recently on the eglibc mailing list there has been a discussion about removing 
> the option groups.  See: http://www.eglibc.org/archives/patches/msg01268.html
> 
> For folks who don't know what option-groups are, it's a patch that went into 
> eglibc a number of years ago that allows you to disable various components 
> (effectively altering the API) in order to shrink the size of glibc.

I'd be quite happy to see that functionality go away.  It's never been
very obvious to me that it solves any particularly important real-world
problem, and it introduces a maintenance/complexity burden both for
eglibc itself and for its users (who can no longer rely on given
functionality being available; see our DISTRO_LIBC_FEATURES thing for
example).

p.



