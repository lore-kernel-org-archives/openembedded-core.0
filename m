Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.121.1601399134032495373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2020 10:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 0A9672E8936;
	Tue, 29 Sep 2020 12:05:32 -0500 (CDT)
Date: Tue, 29 Sep 2020 12:05:29 -0500
From: "Seebs" <seebs@seebs.net>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/4] pseudo: Ignore mismatched inodes from the db
Message-ID: <20200929120529.2bac3172@seebsdell>
In-Reply-To: <cef99332d290dc2fb0c39b8fa3ee022b64674ee6.camel@linuxfoundation.org>
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
	<20200928133803.2741507-2-richard.purdie@linuxfoundation.org>
	<20200928091341.3eebf87c@seebsdell>
	<19cfd5621921a2cf1f19be76bf216c7ac42b2e4e.camel@linuxfoundation.org>
	<20200928105617.11183951@seebsdell>
	<cef99332d290dc2fb0c39b8fa3ee022b64674ee6.camel@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Sep 2020 22:42:18 +0100
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> It helps to know that! I wasn't sure if you'd hate the path filtering.

It was on my to-do list at one point to be able to denote "the pseudo
filesystem" in some way and just politely ignore everything outside it.
And, possibly, switch to keeping paths relative to it in some way.

But it looked very expensive, and honestly one of the things it was
waiting on was my vague belief that what pseudo really needs is to
switch to using length-prefixed strings so it can stop constantly
calling strlen.

-s
