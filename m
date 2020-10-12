Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.7003.1602530853448811378
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 12:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 94CC52E8922;
	Mon, 12 Oct 2020 14:27:32 -0500 (CDT)
Date: Mon, 12 Oct 2020 14:27:30 -0500
From: "Seebs" <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/9] psuedo: Add tracking of linked files for fds
Message-ID: <20201012142730.1fbd4ad8@seebsdell>
In-Reply-To: <20201007101449.3132127-4-richard.purdie@linuxfoundation.org>
References: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
	<20201007101449.3132127-4-richard.purdie@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 Oct 2020 11:14:44 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> Where files are link()'d and one is unlink()'d, pseudo's fd mappings
> can become confused. Add a patch to try and improve this for the
> common usecases we see.

Hmm. I'm a bit ambivalent about this because the *intent* was at one
point that the fd mapping was to "the name used to open this", not
necessarily to any particular canonical name. On the other hand, this
seems like a good thing to be able to handle.

-s
