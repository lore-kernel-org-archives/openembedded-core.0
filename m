Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
	by mail.openembedded.org (Postfix) with ESMTP id 61B6C7F5BE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 18:03:14 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 681222E895F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Aug 2019 13:03:15 -0500 (CDT)
Date: Thu, 1 Aug 2019 13:03:13 -0500
From: Seebs <seebs@seebs.net>
To: <openembedded-core@lists.openembedded.org>
Message-ID: <20190801130313.6325bb87@seebsdell>
In-Reply-To: <20190801175545.63356-1-jason.wessel@windriver.com>
References: <20190801175545.63356-1-jason.wessel@windriver.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: Re: [PATCH] pseudo: Upgrade to latest to fix openat() with a directory symlink
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
X-List-Received-Date: Thu, 01 Aug 2019 18:03:14 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Aug 2019 10:55:45 -0700
Jason Wessel <jason.wessel@windriver.com> wrote:

> Many thanks to Peter Seebach for fixing the problem in the pseudo code
> to use the same logic which was already there for the
> AT_SYMLINK_NOFOLLOW.

Special credit goes to Past Seebs, who thoughtfully made the parser
for wrapfuncs flexible enough that `flags=flags|O_NOFOLLOW` would work.

-s

