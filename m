Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 3C5A8731B3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jan 2016 22:22:24 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aIONV-0001Mo-0V; Sun, 10 Jan 2016 23:22:25 +0100
Message-ID: <1452464539.1950.19.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Matthias Schiffer <mschiffer@universe-factory.net>
Date: Sun, 10 Jan 2016 22:22:19 +0000
In-Reply-To: <5692CD35.2060304@universe-factory.net>
References: <cover.1452248145.git.raj.khem@gmail.com>
	<CAJTo0Laga86qGDjuxoApENiqRS_j0-8cPLNfhs5J=QSdTZWOyg@mail.gmail.com>
	<CAMKF1srdBj0iSp0ursf8=_pD-bV8Bp81haj8EkOhe8n=xvHFfQ@mail.gmail.com>
	<5692CD35.2060304@universe-factory.net>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/53] musl fixes 3
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
X-List-Received-Date: Sun, 10 Jan 2016 22:22:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-01-10 at 22:29 +0100, Matthias Schiffer wrote:
> systemd has been relying on ln's -r (--relative) option for some time
> for similar reasons, but it's a fairly recent addition to ln, so I'm not
> sure if it's acceptable for OE. If not, adding a symlink helper based on
> python's os.path.relpath might be a good idea.

As a general rule, if it's not in POSIX (and I don't think "ln -r" is)
then we probably don't want OE to rely on it.  As far as I know, oe-core
doesn't currently require GNU ln to build.

p.



