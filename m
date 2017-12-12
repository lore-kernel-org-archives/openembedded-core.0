Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f172.google.com (mail-wr0-f172.google.com
	[209.85.128.172])
	by mail.openembedded.org (Postfix) with ESMTP id F1A267883F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 02:09:02 +0000 (UTC)
Received: by mail-wr0-f172.google.com with SMTP id x49so19492767wrb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 18:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dxGa4mLfhoKxP+QUApsr36ewwz3AV7myXETNGpICwMI=;
	b=rcWJDEh7UfNIpvtj43jGg7qd75eJuGP7QxCwYqGDRQe1oFXMBER+MumvWnUpueNz/4
	YUub3nxdyoPt9Ot00y5E7gAvEe/x3be8HpIQw9ZK+WpPTXQrLwzJOwlJCNRmdhINneJ4
	GwCPCvWLVneBWenATY5Zs1uqdvHf1awpu0+Q5n6ZC57HLtrBI/XObWnYN5MkxWCHcdYu
	0qxMq2aD8m63y2Giphz8zjH1M2rkEqxp6yrtjmioxJKiHN8R2tLmgBTvzG0re0k7sVBL
	CPN9pKEyJRPX1YMDYdcyS41FauqrcrVtqW5r8dlyoGd5E5BZQLzxmLkvy/Bv7/TE3PWz
	LOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dxGa4mLfhoKxP+QUApsr36ewwz3AV7myXETNGpICwMI=;
	b=ttDfHEBZ+6Nt9vPw5dTCkUNvwN4jOK1spZHvYKQ9/FChaVj0tAOiGBfRmMLMw7xTAi
	bK79aA9F2DZ8tTlOzLKWFy0jFtWaMocwwzKa4kc/w+M2rCh17RDs9JeRYpj5V0Hkl+lt
	TyvQzNBi/5JgWihEz4n2e0oFDitd0Nw280Tzf9wi+68guSEoR6tM6xGb0YeaibkTaRN7
	sBVSAxtujlnF61z+x2Fopq2a/eNc7fr/HWjHdd/FXbn98vSLwYGmz96xt028Uo/1TjP6
	45uzE7QTcClrYFgIIwdAfi0sj3vR9xhNQKFb+fEu/i50xLrLQL0MdA0EVJp4XUeVaH4P
	sQtw==
X-Gm-Message-State: AKGB3mIiK1mutX034o7LZ85u7DnMh4QHRHrMJwXsOHGehKfdoSgIOPCi
	u31xxLSFym08qRkyyGptiNN5A3fzEgOPi1Vsusno4Q==
X-Google-Smtp-Source: ACJfBovfcSVz+21xIQC3Sa7HzUIJ4bYIBtV/UqjAaGvLYEPHsysRGcNMc+B/wJAVjrq+cAgZiloZL2jhegP65y/b6Bk=
X-Received: by 10.223.176.194 with SMTP id j2mr1999496wra.62.1513044543626;
	Mon, 11 Dec 2017 18:09:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Mon, 11 Dec 2017 18:09:03 -0800 (PST)
In-Reply-To: <CAJ86T=UFGsp0-TDdS8WAEOwr1Xc8aUH0DYv3qh21LcV6TDKxaA@mail.gmail.com>
References: <1510293271-32407-1-git-send-email-armccurdy@gmail.com>
	<e03ac54c-11c9-2546-a622-c21169979cc5@windriver.com>
	<CAJ86T=UFGsp0-TDdS8WAEOwr1Xc8aUH0DYv3qh21LcV6TDKxaA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 11 Dec 2017 18:09:03 -0800
Message-ID: <CAJ86T=UvJkhT6bnBdViyHoxhtoLRDL4Wbc+zGUHqNbjrdUiOMw@mail.gmail.com>
To: Yi Zhao <yi.zhao@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: create wheel sysuser group offline
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
X-List-Received-Date: Tue, 12 Dec 2017 02:09:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2017 at 11:36 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Thu, Dec 7, 2017 at 10:44 PM, Yi Zhao <yi.zhao@windriver.com> wrote:
>> =E5=9C=A8 2017=E5=B9=B411=E6=9C=8810=E6=97=A5 13:54, Andre McCurdy =E5=
=86=99=E9=81=93:
>>>
>>> The default systemd-tmpfiles config file expects to be able to create
>>> files etc belonging to the wheel system group. Currently the wheel
>>> group is created at run time by systemd-sysusers, but that doesn't
>>> happen if systemd-sysusers is disabled (as it currently is by default
>>> when building with musl libc).
>>
>> For sysvinit, we follow the Debian rule which doesn't have wheel group i=
n
>> the system. Should we have to break this rule for systemd? Is this neces=
sary
>> to use this group in systemd?
>
> The default systemd-tmpfiles config file expects to be able to create
> files etc belonging to the wheel system group. Unless we patch or
> over-ride the default systemd-tmpfiles config file to change that then
> yes, the wheel group appears to be necessary for systemd.

Ping.

This is needed for rocko (assuming systemd with musl is expected to
work with rocko?) so unless there are still strong objections I
recommend merging as-is.

More significant re-work (e.g. preventing systemd-tmpfiles from being
enabled without systemd-sysusers or patching systemd to remove any
dependency on the wheel group) would not be suitable for rocko, so
should be considered separately.

