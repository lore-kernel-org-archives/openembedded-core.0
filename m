Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 950687F8BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 08:21:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 472Pgj11hhz4H;
	Tue, 29 Oct 2019 09:21:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572337297;
	bh=bJAcU9yUX+uQnN1daKQDUj9xALyHKqQhDAgS9qzZqAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZbsVj+ciDWJYg7fondZf4wsFAr3N87+xP7dgwA1xNmvRDmPMvB4SwS+wd0TYRYuul
	7FXP3IpgXtj7yxqaIpzS7ZcQB2LPtxKMdAyEslR79+rhu775Kz7oxf4RAkN9+jReJp
	wokp6EoZk6n3g8+2VX4m9tv7e2J3EjWgv28UowSwovQPSchV308M19VafGHFHL7TQF
	Obba9PEscgZvVlf9Fo1C3CrbUfHQw85nnD9kDnZx+JjJkdAv1Zvz0cZ732oFKcJYOd
	XFh7Fn/eljBjp05fC+zh9TPxUD0cOzZjpDfSAWMv6VxM3S//9q1116ZX8RSXLvJU63
	/CtPGDp5URlDjx63/3leC6agdVVtYDTOj10HAuY1jubtv9qQNp6fZV41d/ZdqvUKkh
	00gbIV5ISJ+4zYVHE1YUr48TXitsKdWpvWK5G9DTHPG//husGhA9JfOxnozfEfFO+e
	YgTyPqq0jbtQHju43RcSdUl7E7Bqq2j90YPFWufnduWLMVehghFvORZQP5Kb1AyQhM
	Z2Va6NwZneivRJrOqT+TiQELEkHpm9PfCak4hBs5wrImK/2Yrfy35SUqh/nE7IFhbq
	1f6GtnmoIFAilt9/2ZrhckiedCbmCnFK/j8Qhb6qN3WOwJ0YYzM14dSQlGFaedXnau
	VVpPQTtoXWgC+1DjKEJTabEw=
Date: Tue, 29 Oct 2019 10:21:34 +0200
From: Adrian Bunk <bunk@stusta.de>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20191029082134.GA23910@localhost>
References: <59fa53a1-7cbb-3f55-3b32-b2a41cf0a4d4@gmail.com>
MIME-Version: 1.0
In-Reply-To: <59fa53a1-7cbb-3f55-3b32-b2a41cf0a4d4@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Stable warrior decision
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
X-List-Received-Date: Tue, 29 Oct 2019 08:21:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Oct 29, 2019 at 05:53:41AM +0100, akuster808 wrote:
> I decided to mark the qemu virgl issue on FC30 as a known issue as we
> saw it fail in 2.7.1.
> 
> https://autobuilder.yocto.io/pub/releases/yocto-2.7.1.rc1/testresults/oe-selftest-fedora/testresults.json

Please revert the fedora-30 part of
http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/commit/?id=2fd2aea930253ec6d3bcdde25d02484c89586f79

It is not good to start claiming Fedora 30 would be a supported host 
distribution when there are known breakages.

> regards.
> Armin

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


