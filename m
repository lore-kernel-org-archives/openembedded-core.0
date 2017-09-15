Return-Path: <seebs@seebs.net>
Received: from mail.seebs.net (mail.seebs.net [162.221.74.143])
	by mail.openembedded.org (Postfix) with ESMTP id 4057C77E4E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 23:10:20 +0000 (UTC)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 046672ADC93;
	Fri, 15 Sep 2017 18:10:21 -0500 (CDT)
Date: Fri, 15 Sep 2017 18:10:20 -0500
From: Seebs <seebs@seebs.net>
To: Will Page <Will.Page@ni.com>
Message-ID: <20170915181020.6a184e6a@seebsdell>
In-Reply-To: <20170915222700.GA15457@canismajor>
References: <20170915222700.GA15457@canismajor>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [pseudo][PATCH] Fix to fcntl guts to ignore flags that can be ORed into cmd
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
X-List-Received-Date: Fri, 15 Sep 2017 23:10:21 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 15 Sep 2017 15:27:00 -0700
Will Page <Will.Page@ni.com> wrote:

> The fcntl guts switch on "cmd" parameter to identify the fcntl
> command being issued, but isn't aware of the file creation flags that
> can be ORed in.

This is true. I was, in fact, not aware of those flags. Looks
reasonable.

-s

