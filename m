Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.6479.1602529732666225339
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 12:08:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 740312E8922;
	Mon, 12 Oct 2020 14:08:51 -0500 (CDT)
Date: Mon, 12 Oct 2020 14:08:49 -0500
From: "Seebs" <seebs@seebs.net>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] pseudo: Fix statx function usage
Message-ID: <20201012140849.69cf09fc@seebsdell>
In-Reply-To: <20201007162018.3187947-2-richard.purdie@linuxfoundation.org>
References: <20201007162018.3187947-1-richard.purdie@linuxfoundation.org>
	<20201007162018.3187947-2-richard.purdie@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 Oct 2020 17:20:18 +0100
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> +There is magic in the posts where specific variable names have
> specific +magic. For that magic to work, "path" needs to be used not
> "pathname" as +is currently there. Fix this, which fixes path issues
> on systems using +statx (Ubuntu 20.04 in particular).

So, usually if "pathname" is used, it's intentional to suppress the
special magic behavior. Usually, but not always. In this case, the man
page does use "pathname" and sometimes that means it's just a cut and
paste error.

My man page also says there's no glibc wrapper for statx, making me
slightly surprised that a wrapper for it is needed/relevant.

-s
