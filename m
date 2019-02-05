Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	by mail.openembedded.org (Postfix) with ESMTP id 236F27C2AA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Feb 2019 15:57:37 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id m17so2346341qki.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2019 07:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qIKpVXCgHBM5Ezr4y4mnjwx3i6HGwkp3scCgLSlPS1Y=;
	b=JXD4PGPhl++52TqA9RZg+x1SK0yRxaFYS2GuWoWT4I2Us1+6tBDig0mWDCZ021dUmt
	nyOkKkNSXYD0DdiZLLFEwpDZj0BX265do0zdQWfg01vkjeLTG3CVN/Rx8U/w6HqzP6Um
	rdq535N6zAJlzvyPM0+01xT7hp5kAILNkPBApjQbWWgftgVqa9TkDZzDS927nkiNj1GU
	uPGScbAAODBF+KYCSK/wi4nn7g62YKKjL7rx+C3rNGvdo8lblMda+LCvjjD3gFhrw8Pw
	QFbIaF1VPHjL9Nk//Hj7eamgfhz1GBnANX28rMB5KiaO1FXknGNKnvOqLTn1jaGogjDF
	k26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qIKpVXCgHBM5Ezr4y4mnjwx3i6HGwkp3scCgLSlPS1Y=;
	b=JiFvEHSxb1XKN4b2/1fMxhdF8HQGaNVJp4YkDQGNsc6iegOR832Wg2GFq6J7/+UYoI
	orjD9F/Y6mEWGnBkwEKyMyjTctny3wAKSco8XVIbFe3+tBC+HcZ8N4DqiePGElfp0vAE
	JsPHGawIOGtDlFb7TkqaZa3zqxF1DUnmHc+ga6j6Uw/EeQGqrvvmAecKrrM1F8h+Gda7
	zyJ1pADza7ioKYaAVZL+P39ChW7n+jAEzI3KuNvT5EJWpLLW7GWyS8Pq5a3L3/syPFga
	/1afK536g+lCxvzc3QCrqdPJgOi2EvE9++4uaNz2+aj8MbT3VsZyWJ6wMlzN21TP40ir
	HCmg==
X-Gm-Message-State: AHQUAub4auDb98ZkM1178OFAcaBXPg2huWhWlyxPwIxTnUIljVGCM2N9
	v8BGs1KMop/TaVpGVmw2IXnMiy8n2JtAsTI6vW0=
X-Google-Smtp-Source: AHgI3IZMa/vubFXhhjsfrdnlCNx+lF3+Rk6bsZE5wWNVx4lICxPf8kdPBbdlZBF0zZsP4lF4ItF7By5C2QrW1eYfQuQ=
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr3968870qkf.223.1549382258896; 
	Tue, 05 Feb 2019 07:57:38 -0800 (PST)
MIME-Version: 1.0
References: <20190205025727.1937-1-raj.khem@gmail.com>
	<c063995d478bf52b08936f2e70caa754d30f97ba.camel@linuxfoundation.org>
In-Reply-To: <c063995d478bf52b08936f2e70caa754d30f97ba.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Feb 2019 07:57:13 -0800
Message-ID: <CAMKF1sofq2bAt5UJ2q0NcBgatwZ256zrtJ6eHfk5BofC1WvRdg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/6] arch-armv8a.inc: add tune include for armv8
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
X-List-Received-Date: Tue, 05 Feb 2019 15:57:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 5, 2019 at 7:12 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2019-02-04 at 18:57 -0800, Khem Raj wrote:
> > From: ayaka <ayaka@soulik.info>
> >
> > There are some addtional instructions apart from bare armv8,
> > also there is armv8.1, armv8.2.
> >
> > Most the processor would support crc, except X-gene 1.
> >
> > Signed-off-by: Randy Li <ayaka@soulik.info>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/conf/machine/include/arm/arch-armv8.inc  |  1 -
> >  meta/conf/machine/include/arm/arch-armv8a.inc | 28
> > +++++++++++++++++++
> >  2 files changed, 28 insertions(+), 1 deletion(-)
> >  delete mode 100644 meta/conf/machine/include/arm/arch-armv8.inc
> >  create mode 100644 meta/conf/machine/include/arm/arch-armv8a.inc
>
> Renaming the file when other things use it causes failures:
>

my bad. I have been testing this with rpi3_64 and missed the qemuarm64
part, I sent a patch to use armv8a instead for qemuarm64, since thats
more used configuration when it comes to armv8

> https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/256/steps/7/logs/step1c
>
> Cheers,
>
> Richard
>

