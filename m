Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web11.1097.1631203509320089520
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 09:05:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@seebs.net header.s=mail header.b=YQA7K5WJ;
 spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id 147AA2E8922;
	Thu,  9 Sep 2021 11:05:07 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=seebs.net; s=mail;
	t=1631203508; bh=f4b7dA4WT9y/twRauRX/oN7N3bNECnFcP/vTiuga404=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YQA7K5WJ0GbGwxwHIkXChgVfpRLNP5RSdKjw6sjsfhWUQvHlC5FQ/6Ttx6Au910aD
	 oUJVufHN1UMF35jm7Uxx062NmfFHveSm1Rp6epZCW8fUIpEKCQOdZvH8HeFyJ34bFn
	 M5Og+sDvunRDIDvzzuylO3rhH4IvzXzlJFCDrEnghFmPr73vogSqQqlk8HTyNbYGus
	 C9AnYiPo8+NSsL+sOwRwXz7YEbWNx3Nfa1rwXuAjvWFooatt2+Q3zRn84PrCQvBt23
	 bCikPonJlk9Ld8hqOdX8VgXUgCJ9Vfw91TSJID09O9Kweu4L4BFwNUnsGb7Z3wcktM
	 6WZkK7kqP9M9w==
Date: Thu, 9 Sep 2021 11:05:05 -0500
From: "Seebs" <seebs@seebs.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, Mike Crowe <mac@mcrowe.com>
Subject: Re: [PATCH 2/6] test-openat: Consider device as well as inode number
Message-ID: <20210909110505.4602b0ca@seebsdell>
In-Reply-To: <20210909153614.1225570-2-richard.purdie@linuxfoundation.org>
References: <20210909153614.1225570-1-richard.purdie@linuxfoundation.org>
	<20210909153614.1225570-2-richard.purdie@linuxfoundation.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  9 Sep 2021 16:36:10 +0100
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:

> It just so happens that my /home/mac and /home directories have the
> same inode number but on different filesystems.

Nice catch!

-s
