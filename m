Return-Path: <seebs@seebs.net>
X-Greylist: delayed 541 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 18 Nov 2018 18:51:25 UTC
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 2783A607A5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Nov 2018 18:51:25 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 044EC2E8925;
	Sun, 18 Nov 2018 12:42:23 -0600 (CST)
Date: Sun, 18 Nov 2018 12:42:13 -0600
From: Seebs <seebs@seebs.net>
To: Jens Rehsack <sno@netbsd.org>
Message-ID: <20181118124213.3967fb6d@seebsdell>
In-Reply-To: <20181118183646.28185-1-sno@netbsd.org>
References: <20181118183646.28185-1-sno@netbsd.org>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] pseudo: fix link of sqlite3 using pkg-config
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
X-List-Received-Date: Sun, 18 Nov 2018 18:51:25 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 18 Nov 2018 19:36:46 +0100
Jens Rehsack <sno@netbsd.org> wrote:

> +	for sqlite_link_opt in $(pkg-config sqlite3 --libs --static)

Ugh, but yeah, I think this is probably needed. I'm a bit concerned
about libsqlite3 ending up with readline included, that really seems
like something that should only be ending up in the sqlite3 binary, not
in the library?

None of this affects client side (libpseudo doesn't get linked
against sqlite3), so it shouldn't cause problems for other programs. So
this looks good to me.

Sorry about the delay in getting to things, I am sorta swamped lately.

-s

