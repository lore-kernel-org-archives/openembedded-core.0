Received: from mail.seebs.net (mail.seebs.net [162.213.38.76])
 by mx.groups.io with SMTP id smtpd.web11.7455.1586038412976103178
 for <openembedded-core@lists.openembedded.org>;
 Sat, 04 Apr 2020 15:13:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: seebs.net, ip: 162.213.38.76, mailfrom: seebs@seebs.net)
Received: from seebsdell (unknown [24.196.59.174])
	by mail.seebs.net (Postfix) with ESMTPSA id EB6D72E8925;
	Sat,  4 Apr 2020 17:13:31 -0500 (CDT)
Date: Sat, 4 Apr 2020 17:13:29 -0500
From: "Seebs" <seebs@seebs.net>
To: "Andre McCurdy" <armccurdy@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, OE Core mailing
 list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] pseudo: Force seccomp to return success when in fact doing nothing
Message-ID: <20200404171329.3398164c@seebsdell>
In-Reply-To: <CAJ86T=WehmnH33uDH0ZUHqAoRZaSpM_t5QCE2_p3a4obKF1ajg@mail.gmail.com>
References: <20200403215938.175657-1-richard.purdie@linuxfoundation.org>
	<CAJ86T=XabPQEn6xFeCwU9MLTPx50N86o6-HAyAAgu1r6UYWwCQ@mail.gmail.com>
	<df6f9b54bb244e0f3e893f0db330649eb6bdfbcb.camel@linuxfoundation.org>
	<CAJ86T=WehmnH33uDH0ZUHqAoRZaSpM_t5QCE2_p3a4obKF1ajg@mail.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 4 Apr 2020 14:32:03 -0700
"Andre McCurdy" <armccurdy@gmail.com> wrote:

> Also, since prctl() is Linux specific, it looks like this patch will
> make pseudo Linux specific. Is that OK? If so maybe worth making an
> official statement that OE is only supported for Linux hosts?

We have existing hooks for making things like this be in a
Linux-specific port directory. I don't think the Darwin port still
works; people asked me about it a lot, so I made it work and never
heard about it again. :)

-s
