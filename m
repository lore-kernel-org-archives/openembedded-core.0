Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
	[209.85.222.45])
	by mail.openembedded.org (Postfix) with ESMTP id B9C4C79F1B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 20:21:29 +0000 (UTC)
Received: by mail-ua1-f45.google.com with SMTP id d19so4880301uaq.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 12:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=t5GlssspC2JA3jFJesoktcvu025MNQbQflqxot5immk=;
	b=uaauX3R0atiFwbXDXof2r0vFabgetGn4YIKEDykS8ZYj7lDNTFojfhwpkILeL1js4J
	C7YcBWkmcOHNn3K3n0SIyLHpWJ59fLlSsJh7b8rRE8JKCZwlQITux2xihtake/VgoL89
	F0sr2y2Yc964jb+dZcW6BXzdtmVqXmvY6T7e9wqKJQF11fYOtOrgqcgognMJVGQP8cSs
	h2Al2hDSaljA8beXkM9MpzLmU2xWKyP1ltQ2bXcTOb7Bhujr/VceV7rqrcmjAY/PwAG/
	xiWPxpxG9XisQBxF2Zz3pSk8KkTRV6WQPyDuCRCZM40jV3ohT4IDKz+StRDxAe0/e5CT
	yFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=t5GlssspC2JA3jFJesoktcvu025MNQbQflqxot5immk=;
	b=A7B7BGgKM5H8GVttmI47PLJt5Ll5qA8m16YsaH+Sacl+U7uNNm6HW+SNgek0Z6KNtW
	TGpJAptQErD5xLhhoZ/RUXIkv2pBgbrXeMy5QZi4k0RdZ9NFewjZwaOxZc363epolKD8
	rX5SRPzzbhJguR2mHKJ1qH0BOnMp1f+XxGcMwAOGKuuEviZaB94hgd0Wgi8OTavJLXut
	B57n/ygLx/A0eTnrVEylneTiktYlx0r+t1RyQqtJnQKt6rVrKqDwqj2bDs0bF11j3LJ5
	hPniU7Ps13w0tbJwXUPku9OFMcAAIB18H2cMilHGvt0ol989Ld/y1ArTVlS4GBRdGbFS
	YxkA==
X-Gm-Message-State: AA+aEWbSYKTFi02HhHWmtOpiQNSVEWprwCIXi2Hu0FDGnOjxcS+Hk5nu
	X644aOavaJC5lejbEUp5DYq8UYibegfGgJpoLPw=
X-Google-Smtp-Source: AFSGD/VtWt3CpNLFpDJF9Iw7eSJQ6foC7sCaY/gXPCN69teLlH0vZuY0+6H5/Fm1+oq8kNXSK/QL1SupI0UIhtL6fFA=
X-Received: by 2002:ab0:550b:: with SMTP id t11mr7208339uaa.31.1545078090512; 
	Mon, 17 Dec 2018 12:21:30 -0800 (PST)
MIME-Version: 1.0
References: <CAKf6xputiV+k9m9p1dyhZG1d0wMQoWG5tCiZjpsVVu+bXp1X6A@mail.gmail.com>
	<08a89c71b2e3e0f4380325985541c55df00b94da.camel@linuxfoundation.org>
	<CAKf6xptMbAqnZ34ONNXLzQMjFoDjePH8dz3bXmiTMvoBMu4wsg@mail.gmail.com>
	<50b88771577229c99a2c9e26b6224a5f038e7bab.camel@linuxfoundation.org>
	<CAKf6xpt_RoLVg3ou2zKL2g=0GsjDXpCk73q83pmb4Reer9YgdA@mail.gmail.com>
	<a0e331f39da396ea39ea37539f6c1ea193b055b1.camel@linuxfoundation.org>
In-Reply-To: <a0e331f39da396ea39ea37539f6c1ea193b055b1.camel@linuxfoundation.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 17 Dec 2018 12:21:18 -0800
Message-ID: <CAJ86T=V-xs=M2DfsHHtOe=j77bqsn=MgMojue5mc=2ouwwTd+A@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: Mis-generation of shell script (run.do_install)?
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
X-List-Received-Date: Mon, 17 Dec 2018 20:21:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 17, 2018 at 6:44 AM <richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2018-12-15 at 20:19 -0500, Jason Andryuk wrote:
> > As far as I can tell, pysh is working properly - it's just the
> > bb_codeparser.dat which is returning the incorrect shellCacheLine
> > entry.  It seems like I have an md5 collision between a pyro core2-64
> > binutils do_install and core2-32 python-async distutils_do_install in
> > the shellCacheLine.  python-async's entry got in first, so that's why
> > binutils run.do_install doesn't include autotools_do_install - the
> > shellCacheLine `execs` entry doesn't include it.  Or somehow the
> > `bb_codeparser.dat` file was corrupted to have an incorrect `execs`
> > for the binutils do_install hash.
>
> That is rather worrying. Looking at the known issues with md5, I can
> see how this could happen though.

How do you see this could happen? By random bad luck?

Despite md5 now being susceptible to targeted attacks, the chances of
accidentally hitting a collision between two 128bit hashes is as
unlikely as it's always been.

  http://big.info/2013/04/md5-hash-collision-probability-using.html

"It is not that easy to get hash collisions when using MD5 algorithm.
Even after you have generated 26 trillion hash values, the probability
of the next generated hash value to be the same as one of those 26
trillion previously generated hash values is 1/1trillion (1 out of 1
trillion)."

It seems much more likely that there's a bug somewhere in the way the
hashes are used. Unless we understand that then switching to a longer
hash might not solve anything.

> I think this means we need to switch to a better hash mechanism. I've
> sent a patch changing this to sha256 on the bitbake list.
>
> We also probably need to change over the code in siggen for the sstate
> hashes too but one step at a time...
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

