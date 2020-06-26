Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web12.1502.1593197889673247982
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 11:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 04C462E8951;
	Fri, 26 Jun 2020 13:58:08 -0500 (CDT)
Date: Fri, 26 Jun 2020 13:58:05 -0500
From: "Seebs" <seebs@seebs.net>
To: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [pseudo][PATCH 1/2] xattr: Fixed corrupting UID&GID when running setfacl -m on a directory
Message-ID: <20200626135805.1d7d5f0c@seebsdell>
In-Reply-To: <5f8a87af6dbd4b07323459cecc1bb7c149a4082d.camel@linuxfoundation.org>
References: <20200626094031.9975-1-johannes.beisswenger@cetitec.com>
	<20200626090553.6853a571@seebsdell>
	<49dc076b-16fd-cd82-5793-bbf2c2fc9adf@cetitec.com>
	<20200626103607.114d5711@seebsdell>
	<5f8a87af6dbd4b07323459cecc1bb7c149a4082d.camel@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 26 Jun 2020 18:33:39 +0100
"Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:

> There is one patch I'm not going to put there as looking at it, I
> suspect it needs reworking and really isn't upstreamable, I think the
> rest are appropriate given OE is one of pseudo's main users and can
> hence influence its development.
> 
> Hope that is ok with you seebs!

Seems reasonable to me. SOME DAY I will have free time. :P

-s
