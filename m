Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 4A70D7EC95
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 17:42:49 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id C64222E895D;
	Fri,  2 Aug 2019 12:42:49 -0500 (CDT)
Date: Fri, 2 Aug 2019 12:42:46 -0500
From: Seebs <seebs@seebs.net>
To: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <20190802124246.27d4beca@seebsdell>
In-Reply-To: <20190802120733.4a24ca3f@seebsdell>
References: <20190801200354.119252-1-jason.wessel@windriver.com>
	<8934e4e0-aaf6-5eb6-5d1b-355063bee94a@windriver.com>
	<20190801185725.139cfa73@seebsdell>
	<f991e41b-39c6-a088-63aa-07553cae131b@windriver.com>
	<20190802120733.4a24ca3f@seebsdell>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] pseudo: Upgrade to latest to fix openat() with a directory symlink [NAK]
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
X-List-Received-Date: Fri, 02 Aug 2019 17:42:49 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 2 Aug 2019 12:07:33 -0500
Seebs <seebs@seebs.net> wrote:

> Note that there's no lstat, and no AT_SYMLINK_NOFOLLOW. Which is to
> say, these stats will be following the symlink even though O_NOFOLLOW
> was set. I can probably patch this in a bit.

Followup: Patch applied to master, but also in addition to fixing the
stat calls, I had to use `flags&O_NOFOLLOW` rather than
`flags|O_NOFOLLOW`.

I am sort of amazed at how much DIDN'T break right away with that one.

-s

