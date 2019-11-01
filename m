Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CED5E7FCC0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 20:12:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 474YJW5BzTz65;
	Fri,  1 Nov 2019 21:12:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572639148;
	bh=sqiC0bsw+AmaZzos8me7XJnCkVRYCjPwvvxf8y9cXX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JhVhkr1AZaHsJA54NotXjeQ01KfQ4lYKJ6pWRLebwg0HyBbGFkJCH9TN9LU65H8pl
	Lkb0nk7nenBk7ezu2xAte27oIDF9oiMLYebyMSH8Dj2RqJcH4AbzRl+HaKPOqmGp50
	2V1hQrTCi5MIVAKmIf0oyusUylRyExGyyekD7N7JXsHYXe+xlMMcvxXqYVeiSh7gZw
	SivWE9GjIgyIoo5XkQiClfFZDx0pYrajBmLF/xXS+2viMruUqfoiuktqhKd4bRnNvA
	QCNYcKjOAAY+dy1dbKCTxjkdcMzGNqfwl5nbKTYivOuyEsaALuPlitGfr91yUIxoP5
	9MyWu8dBCqk+AhpKVWaQAQvb7ESDhFsE4pawW7xrTYL9SdspCHYrE6XHHmYDloxVql
	kiEnMiuK06LIIwVG9JhKJztctM3W5EV6JYW80WrZkR7NR3oH+JNKJ/51xgVLSdezkR
	C3jAS5QnJicyw2odrSPrWT3XzEVNnVZP5mPrfJNn3kuoJMtPEQOEqolpg2h0Qzed3/
	J5f8AW9bK71ZzQZ7HTSvjfmb3KlEtjblnVE7iySENkZGGzagud2ABnLcoUPHbH3321
	ReI7QRYzVP8We9ZP8DwY94onbH4vNWUcfXQIT3MetWDrXzqnNGf28CJxwjgiS7KQpV
	GBVsXUdD2Zz3tyqvaJDIbADw=
Date: Fri, 1 Nov 2019 22:12:25 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Ruslan Bilovol <ruslan.bilovol@gmail.com>
Message-ID: <20191101201225.GA1826@localhost>
References: <20191101184638.31898-1-ruslan.bilovol@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191101184638.31898-1-ruslan.bilovol@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] [PATCH] Provide users with project support status
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
X-List-Received-Date: Fri, 01 Nov 2019 20:12:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Nov 01, 2019 at 07:46:38PM +0100, Ruslan Bilovol wrote:
> When OE/Yocto project goes through its lifecycle, there
> is no any way to identify where it is other than go
> to a Yocto wiki and look at current status.

The status in the wiki can be updated.

> Moreover, change from maintained to community maintained
> end EOLing happens silently so users not always know
> about that.
> 
> This patch aims to remove this gap. The status should
> be changed so users can clearly identify at which point
> it is now:
>  Development -> Stable -> Community supported -> End Of Life
> 
> It is now printed during the build.
>...

What is printed is the status at the point in the
(sometime distant) past when a release was made.

It is not uncommon for hardware to come with an example BSP based
on an older release like for example Yocto 2.0.3 (sic) today.

The Yocto 2.0.3 release shipped as part of this distribution would
never print "End Of Life".

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


