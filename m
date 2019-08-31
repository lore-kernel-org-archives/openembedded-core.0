Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
	[209.85.222.65])
	by mail.openembedded.org (Postfix) with ESMTP id 49FEB6B436
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 20:45:19 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id s15so95239uaq.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 13:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EOdj7gkmCL55Qmld6i6jkuOhq3GgAw7ZqMGt7B7k4j0=;
	b=YqtBy6XLn9QpHicXV3i15z/qe2EzKd/8G8MLZInfGfJcmXVoMnioHBDfiFGHG7wcqn
	rZcFv81pdjh0VL4W3oIVxn9sipvF70Y5lUy+FApJ7yoWaaultlIgKJq7ywdnYfRyBfBT
	PbuW22mG6X7NaneWkf/4MQIU9r9zyrbIn8h07MpBf4A//zN4IOd9SI7Ydj1AvLpgKRKm
	JUDolF8sb/0D7GEypA7VU5jZwJN8a9FzZpWawruw1FJ2x0QUAuBFj0/G9VK9kznFUibY
	+mf8wb5Pc5zieG4Zh+5jEgEz8oZ2B5gbxUUsXAEw8kgdr59zfk9TeTr3sUaI0ZKOHGJG
	nQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EOdj7gkmCL55Qmld6i6jkuOhq3GgAw7ZqMGt7B7k4j0=;
	b=TKn7iDMyQ/EazKgfRyR2RZjAVl40AHkrZ4Qk/kpfgWoJybPTDDlpDPxWS5J2y3Zl9D
	ZPgXlO8cTPtKiqOUEkNisfnQJBQWEgsKfeNtOq0umrcI5kMKuBGC4zPoaF3PnLM9DgF3
	ds28aW8+m+LskcX0/BKc0Y0ewn68Z+r8mbVVb+Xqj+NiPDjyqP7PQr6c4GFqs3Mj90h+
	dqTL2uvNm2mCs4U2jshJRNhIt5cNJYxZrAHW9trk5WztejhkqtYU6X4NGnDh+kTBcBoN
	HCbDiGWYCGDPfYvfsiU8rZXjtSmBBt3Quc1OIrbretM6Dqr1meSnjmzJPN49a8nqW7ZJ
	/4Ug==
X-Gm-Message-State: APjAAAV1YLFHRiARlmE6OY9deoGQRkqCqFb8L4crCw0Ylp7TGgKmcLNB
	MUwQT0E/OVLFfW7tu7qHIt12A1xCF2J0+qP/el0=
X-Google-Smtp-Source: APXvYqxj0HJ5+U5zGnxwFxmQ6WQXaXkMopHJVIEHyiIRtMXVi/pAXiI3WRwQjMRW6qpGV66UcAxVSPvPBfiT3zoAq2s=
X-Received: by 2002:ab0:30c7:: with SMTP id c7mr1786862uam.99.1567284320069;
	Sat, 31 Aug 2019 13:45:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAHtQpK5qiC-i-nouQjbk-CToV-Z-jbN-vKZ7Zk0DOtwQC3SUYQ@mail.gmail.com>
	<CAJ86T=Wz=CpQsZgo4C62RUOGAyWVcJe5OZqX_eQFEbbdZkkjWw@mail.gmail.com>
	<20190831121850.GA4729@localhost>
	<CAHtQpK4c_g=+Z1tr2TTdM82vUrhQ1MRE6iThVK3qBBFgQBr_Lw@mail.gmail.com>
	<CAJ86T=VjgG0m4s0XFMGAqD9qLiyfeHO+urYEP+LWY47AcCLboQ@mail.gmail.com>
In-Reply-To: <CAJ86T=VjgG0m4s0XFMGAqD9qLiyfeHO+urYEP+LWY47AcCLboQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 31 Aug 2019 13:45:08 -0700
Message-ID: <CAJ86T=We25KygPhU6+G=ogeYX7xe-kytLaSMp9TFaUGnxoynUw@mail.gmail.com>
To: Andrey Zhizhikin <andrey.z@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: FETCHCMD drop breaks build when append is used (from patch b259bd31eb)
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
X-List-Received-Date: Sat, 31 Aug 2019 20:45:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 31, 2019 at 1:24 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Sat, Aug 31, 2019 at 11:07 AM Andrey Zhizhikin <andrey.z@gmail.com> wrote:
> > On Sat, Aug 31, 2019 at 2:18 PM Adrian Bunk <bunk@stusta.de> wrote:
> > > Disallowing appends could cause huge problems for a user or layer that
> > > has to append local options (e.g. proxy) building a recipe like libedit
> > > that has to change the User-Agent.
>
> Clearly we need to have a solution for libedit. I don't see it's
> related to user or layer specific issues of setting a password or a
> proxy though.
>
> There seem to be three independent cases where appending to the
> fetcher commands in bitbake.conf has been used:
>
> 1) Setting usernames/passwords for private mirrors, sstate servers,
> etc. For that I believe the recommended solution is .netrc. Not only
> is putting passwords on the command line a bad idea in general, but it
> also won't work consistently for fetchers where download() and
> checkstatus() are implemented differently - e.g. for wget, download()
> calls wget (and therefore respects FETCHCMD_wget) but checkstatus() is
> implemented directly in python (and ignores FETCHCMD_wget completely).
> To see the effects, try setting up a password protected http or https
> sstate server... it will work if you put your credentials in .netrc
> but not if you add them to FETCHCMD_wget.
>
> 2) Configuring a proxy server for users behind a firewall. For that I
> believe the recommended solution is the various *_proxy environment
> variables?
>
> 3) Forcing a custom User-Agent. I don't know what the best solution is
> here but it feels like the wget fetcher should either handle this
> internally (e.g. set a more compatible User-Agent by default?
> Automatic retries with various User-Agents?) or provide a documented
> API which specifically sets the User-Agent in cases where the default
> really does need to be over-ridden.
>
> In the end the bitbake fetchers are abstractions and if users need to
> force their own options directly into the final command line (ie
> bypassing the abstraction) then it suggests the abstraction is
> incomplete. It feels like a slippery slope if we start to encourage or
> rely on doing that.

It looks like the User-Agent workaround for libedit might not be
needed any more anyway...

  wget http://thrysoee.dk/editline/libedit-20190324-3.1.tar.gz

works fine for me ( User-Agent: Wget/1.17.1 (linux-gnu) )

