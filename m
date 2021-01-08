Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web10.1832.1610121703541532698
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Jan 2021 08:01:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id BC4362E891B;
	Fri,  8 Jan 2021 10:01:41 -0600 (CST)
Date: Fri, 8 Jan 2021 10:01:39 -0600
From: "Seebs" <seebs@seebs.net>
To: "Ross Burton" <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH][pseudo 4/7] Fix some memory leaks
Message-ID: <20210108100139.66ce149d@seebsdell>
In-Reply-To: <20210108140640.1069133-4-ross.burton@arm.com>
References: <20210108140640.1069133-1-ross.burton@arm.com>
	<20210108140640.1069133-4-ross.burton@arm.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

For reference, I believe the rationale on these originally was "none of
these functions happen repeatedly, in general, and the extra complexity
and potential to get the logic wrong isn't appealing", but I don't
think I object to these.

-s
