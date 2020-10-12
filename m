Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web11.6873.1602530541734641778
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 12:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 360262E8922;
	Mon, 12 Oct 2020 14:22:21 -0500 (CDT)
Date: Mon, 12 Oct 2020 14:22:19 -0500
From: "Seebs" <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/9] pseudo: Fix xattr segfault
Message-ID: <20201012142219.2eff2f35@seebsdell>
In-Reply-To: <20201007101449.3132127-5-richard.purdie@linuxfoundation.org>
References: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
	<20201007101449.3132127-5-richard.purdie@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  7 Oct 2020 11:14:45 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> +In the xattr handling functions, if result is NULL, which it can be 
> +with the path ignore code, there is a NULL pointer dereference and 
> +segfault. Everywhere else checks result first, this appears to just 
> +be an omission.

Good catch.

-s
