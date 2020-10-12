Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web12.6697.1602530500431270920
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 12:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id CCF342E8922;
	Mon, 12 Oct 2020 14:21:39 -0500 (CDT)
Date: Mon, 12 Oct 2020 14:21:37 -0500
From: "Seebs" <seebs@seebs.net>
To: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] pseudo: Fix statx function usage
Message-ID: <20201012142137.72207395@seebsdell>
In-Reply-To: <a2369d3c-ed7e-b03b-8538-aefe09008288@kernel.crashing.org>
References: <20201007162018.3187947-1-richard.purdie@linuxfoundation.org>
	<20201007162018.3187947-2-richard.purdie@linuxfoundation.org>
	<20201012140849.69cf09fc@seebsdell>
	<a2369d3c-ed7e-b03b-8538-aefe09008288@kernel.crashing.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2020 14:14:36 -0500
"Mark Hatle" <mark.hatle@kernel.crashing.org> wrote:

> I looked into this.  It appears (after pseudo was written, but) about
> 7 or so years ago, all of the man pages were re-written and the
> language was changed.

I don't think I originally intentionally synchronized it with man
pages, I just had the convention of special-casing "path", and then
started using "pathname" as a convention for "a name that holds a
path but we don't want to do the magic on it".

-s
