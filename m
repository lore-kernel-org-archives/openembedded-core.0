Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id 8042871CA2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Dec 2016 06:48:36 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id b35so8978599uaa.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2016 22:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Kme5Q0c4PGB8OWU9BJS+eWlfW7r0T91UI1ai1WywfD8=;
	b=ojEL7GBbeoEH3ozIMaHTFaINHqy7TvpixdgUzouySH4trrdwXLg9+l90rT/XhU3PNO
	1cZMPhvCKrZddr1xGh4v6cprEBfee+hyUw0I8qli26UKS6UyTaXvBshfC5uq8eE/mYEi
	Lvp7Id4kClsZIIerBHiUrqWGtQXAQzOcMgS7IX24gqcGnqrQCpkoWjKjQDB0ZyPoqDAX
	uBjpkROaoUwNrCelDhryNnysaRP/qJQfNrm5YAP8VvsyZKAQ29eRK3LJs1mAZvUZ7bb0
	Q0TYn0Yu9yIzn0OyaXMz/8TFlLzy+L+zzESg4O16iu9Bbe++KbIsQQw5WlixCg3Bnmt2
	MuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Kme5Q0c4PGB8OWU9BJS+eWlfW7r0T91UI1ai1WywfD8=;
	b=g3Rrx72f4Gzd5Qm/0VanZre3UTWMSctCSInV0Hi87nFGK+1Sch0ETsSaa/WHmT70QP
	3fbP5N3Ft/fOAd3mjr68gha2Fa0ubB0EZYots7ePs0Gg7Yx/6slAavK8qvBifcUOg/+7
	osCMhTA/hsdheBoXMDOAwpsyqQreR8XQV9lFOcYA/n8GuFRKtv4qGCNdvNr+NP8Ybsvu
	UiYMVuxW+MXG7v9sjKX1SYiqmj4HHWj5+v+aXA1mEZBx3eJ7JMmN16tvZkf2TZzQvBSb
	jfIoQ3NvJvvG0015QKHzi2YU+ZHL9qjGvaVyCorIP2XoHNTUqfoLN8wj5slZ1O+jL+2Z
	hWAQ==
X-Gm-Message-State: AKaTC00LyRgtWBapxjFXQ/HZ53wsW+Vw016OKmk7W5oetjd6m9vETbzgLNZFtw5skavEcNTQo2clXAZjhPXAkA==
X-Received: by 10.159.32.99 with SMTP id 90mr51162067uam.138.1481266118368;
	Thu, 08 Dec 2016 22:48:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Thu, 8 Dec 2016 22:48:07 -0800 (PST)
In-Reply-To: <20161208190327.221469-1-mark.hatle@windriver.com>
References: <20161208190327.221469-1-mark.hatle@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 8 Dec 2016 22:48:07 -0800
Message-ID: <CAMKF1sphGgZP8-3DoPi+1Wv3DV6yDOAQW0Z5dNX=QFy16deLXA@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: Enable backtrace from abort on ARM
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
X-List-Received-Date: Fri, 09 Dec 2016 06:48:37 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Dec 8, 2016 at 11:03 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> +do_configure_append_arm () {
> +       echo "CFLAGS-abort.c = -funwind-tables" >> ${B}/configparms
> +       echo "CFLAGS-raise.c = -funwind-tables" >> ${B}/configparms
> +}

perhaps using  -fasynchronous-unwind-tables is better. can you try that out ?

