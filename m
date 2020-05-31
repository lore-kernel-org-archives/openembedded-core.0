Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web12.18672.1590943392113204012
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 09:43:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=Pi1wiC4Q;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=xw6n=7n=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 49Zkd81fd4z4s;
	Sun, 31 May 2020 18:43:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1590943388;
	bh=CvWDKzbwyWUOKjJoF0cZKm2NlN/0EaKXNPxDuXCEayA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pi1wiC4QWoSXd9wlKPdHdkYY1khcLY62dXDPN8E1B0dDRs9ECnpPO+EHSCne8nyCe
	 +gASpNDm9WK2P32RekgaF0zhhfIGNU/NtOuIsarRTsazIHSIA4dj3tyztu4ICeE7RM
	 1ZdUWjsFiEds0YUrI0dZEUvIdFWPyEaW+l13vRC/8HMrEOeqj/CtKhiAGJ6do5S3y0
	 AIvjDwDXf6i0T3EF0c2P25FR03dysirPtyBr75mMATiOtZnYQ2KIdbKyODKE1OCx3m
	 07v/8UCkS0bXVfLM/MiOnyfkj3slwpM9Jip4EHpiweb/GA2aQ0h8NvKCKgnW8XNSfX
	 lqFXNE5L6OjQgwyDonW8EFUEfbpcgM7ymSI4HCVphQQEgF3KeQlWD7/bSCLVVkTtp/
	 BLgmVJa+HHZNPARr2XEe1XKMYc0jVL19h2X7qtcyslpUhKr7cg1nOot5YItURSicQF
	 sZUmx23i3K3StSMpVeHi1ninxmAmFitT6clZoW5AN+MxxvHssBcipuFxZVDENvC9+c
	 iQA6t3kl7EM0UYd0BrCzDw4dyoX1pRzaRYJYBIUetqakkcEMaesc1RfsS8Zso5fxr2
	 tCAC7W/WjRT4pMBpg6z6TrZ6lcyKNdNRNnCiKXzxFAofal9DIuyVHCiLZYJAEvN/5r
	 kl898edsj0Ib7VvTliDReyjU=
Date: Sun, 31 May 2020 19:43:05 +0300
From: "Adrian Bunk" <bunk@stusta.de>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 46/70] rng-tools: upgrade 6.9 -> 6.10
Message-ID: <20200531164305.GC12011@localhost>
References: <20200531155254.10283-1-alex.kanavin@gmail.com>
 <20200531155254.10283-46-alex.kanavin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200531155254.10283-46-alex.kanavin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun, May 31, 2020 at 05:52:30PM +0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  ...d9ce64f132e463b9091d0536913ddaf11516.patch | 42 +++++++++++++++
>  ...6a5fd4efde8ef569b358e19b1fcbc7d0d938.patch | 51 +++++++++++++++++++
>...

Please use "git format-patch" for creating meaningful filenames.

Thanks
Adrian
