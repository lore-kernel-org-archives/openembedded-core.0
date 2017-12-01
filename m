Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7E5FF77F76
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 20:13:44 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id l24so5107303pfj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Dec 2017 12:13:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QRn7sd9Ey7WqAztrultvyOPNZ3KEWfgmRM46UvWE+Co=;
	b=h+uv7lk28MPUxiHmkCNPwjbe/FN5XTfyTjRf432VkRWjVMT9cKJhYpm3vBgXHGp53z
	noB3ef8r0/G5qBv2BWZeuBBb1Y0y2HdUilP3gL/325clcd++33O4/ec6qBXMLxnes0SY
	QRLibxY18pSA3KZOZtrSFc767ImN5XaynSNWDCisjym4kxt3SiCb6Zt9Z8LyommJJacT
	GuQf+0DUOCR5fElQ0cQ8uBShSKLtHzYcjrhpIViK6szXx/L2E9w5+oQ1uZdeP+pPnkWT
	XMwE7GILtobSBVEVb8XKyv8cFdbp/jVVoRk2Pcz1ZLRJQzRDkwTFxlEk2lhtcsw8/VYJ
	jfkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QRn7sd9Ey7WqAztrultvyOPNZ3KEWfgmRM46UvWE+Co=;
	b=F2tg/SLC1KKZobgyVsjxOiyA8NKcKMz51Qql/7KX7aI6bdNhzj/M1JTNJRd+VOsSKI
	ne2QF/Glphksom3oj3B51qeLblfULUDhcnjyVeCwCWU9WIuBfqn5memev3Rdsv2cRdON
	KepnWV5tfStCwOBqbaPaHlpovTrApV/0zpobr9VBCzSeE1Nv4qSp7llJ6eF4phQjYv2m
	WSz48GQUq7Fy+2Ajt7RkIzElQ58QQbSy/CDkkTCUjhAliUjVrARqN8MEzvQsNybUAo8x
	UKXRva2Ky7OIhMVT+lQIawsdh4moAz6wctzInQUttJbr5w+hhM+qGDtJl2RFZRHzSG6v
	sNMw==
X-Gm-Message-State: AJaThX7asLgH6DmI2rI/4gnNYvrNl6LEnz5lLvfyxkKCyweoPIzHmi8N
	8rSSXDT4kMLQPJ9L765ACoLJFIrc2hdLyZMD6dw=
X-Google-Smtp-Source: AGs4zMb6uQiuLTxW1vXWLLXi7dFlhvkBRkSYS9uWxQhTrd2vCR8MVmCTqDvEcgfREYYlwTRQyQ7/NHqW2WzHTNX19R4=
X-Received: by 10.101.73.203 with SMTP id t11mr7005275pgs.446.1512159225524;
	Fri, 01 Dec 2017 12:13:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Fri, 1 Dec 2017 12:13:15 -0800 (PST)
In-Reply-To: <CAJ86T=UsiK40aCLw-4KeY3LdOCHKXw_r-h2NTwAG7QjA5kQfJQ@mail.gmail.com>
References: <1512073240-3830-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1soVy677jtDR5GNF-x7MdxVM7H=QhONKiZrgw9GgZp74=g@mail.gmail.com>
	<CAJ86T=VX0up-q-CSOafSno14+frTM3NxzwngffCkggMOTd6vCA@mail.gmail.com>
	<CAJTo0Lb4VsORo9110=Q8JSgQytcfoHpsRRSTWiJJ_BiPfYxvvA@mail.gmail.com>
	<CAJ86T=UsiK40aCLw-4KeY3LdOCHKXw_r-h2NTwAG7QjA5kQfJQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Dec 2017 12:13:15 -0800
Message-ID: <CAMKF1sowNmwhq__dZdYmV8RCuBpyLJKKAenkacLjE7jTR1WAUw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: prevent errors if do_install is run more than once
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
X-List-Received-Date: Fri, 01 Dec 2017 20:13:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 1, 2017 at 11:30 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Fri, Dec 1, 2017 at 3:07 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> Extend lnr to have a --force option?
>
> Is there ever a case where we want lnr to fail if the target already exists?
>
> There are plenty of existing examples in oe-core where rm is run
> before lnr (and in the cases where it's not, it's perhaps just a bug
> or an oversight).
>
> So I think either leave the v1 patch as-is and run rm before lnr in
> musl do_install as we already do elsewhere, or update lnr so that it
> unconditionally removes any pre-existing target?

I like Ross'es suggestion to modify lnr implementation as an
independent patch and
rebase your patch on top. Maybe a cleanup later to remove all rm cmds
that are used
before lnr

