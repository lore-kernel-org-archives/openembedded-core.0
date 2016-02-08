Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6BB73286
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 10:21:13 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id l127so901474iof.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 02:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nUbwiW+Jpfv6IxZvHe/J4n+ARy4NWufVpeYM6v6aSJ0=;
	b=nHxI6g5fT6UbZUhmUAB8PoqiIC4OXRSji3WYKZCuYctKpyJCjPfryekdAACoLCy1Ir
	UyXZl7+x1PpceZgkN+Ri+a7A1kJRCxLkB3HTolHkx1ff8L+U7zDCki+vUfgCX28mfOW1
	NyFAqO2hbUMbjOHDsaQTAERPgx6jRzBvF4wFAxS0MeOb1Mo4mxqRDlqgTsm19w2Ct2K6
	6FE/IDdvZwQgHGr8HWSWuMeyuBMZLaZx21r5Vgffphg+PXhBZJF0jPAmQERemehiq37O
	Fo76sE5KT1FQsUau4VIA83WYvlbN9oH5HQhLlsNcg6I2LLaIpYQClkEXEOm1qq6W3RJN
	FP5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=nUbwiW+Jpfv6IxZvHe/J4n+ARy4NWufVpeYM6v6aSJ0=;
	b=ZKsTtv6fZHFzsBstadKupm9pV6iAFVNZsQJD+NzqXIaj8SoAg91yLG8xhxLOdCrHc/
	LwZfE0FiMNugqutqR9FA1kh4GYp9b4CRL7W8cX0+X6tFMfdQnvg/H3zcybgwwjDELxnM
	5eGxPIMktcECN/yrpjG8KLLPqWXrS5+IKAPHdQo7e9vZz540Ys2JesthSvOA+dRR5Vft
	nItW2y/xveT7GnxlRe5NeXTEmYDI4w2UUCByjkh6M9ZGmvHT7aM3Bq73TysB7ab/FJkB
	w8pBzX3Vm1pOhZO+38t/3z1U8//pqD8Ef+HJ0lGMYjVZYEZuSD+Ns9DE/brLPSlOrERy
	ovlw==
X-Gm-Message-State: AG10YOQOuk60doUyKcVWk0qOxL6FKDOy963YE2Kb44O0vISyBNXJIXCnDNrjmB9SeLQE02JL6F4DnUjbbFg1uA==
MIME-Version: 1.0
X-Received: by 10.107.3.220 with SMTP id e89mr25021499ioi.99.1454926874542;
	Mon, 08 Feb 2016 02:21:14 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 8 Feb 2016 02:21:14 -0800 (PST)
In-Reply-To: <1454926183-22439-4-git-send-email-maciej.borzecki@open-rnd.pl>
References: <1454926183-22439-1-git-send-email-maciej.borzecki@open-rnd.pl>
	<1454926183-22439-4-git-send-email-maciej.borzecki@open-rnd.pl>
Date: Mon, 8 Feb 2016 11:21:14 +0100
Message-ID: <CALbNGRREKAXAW_0Z1e-_y21G477u9DrfKuAL8Sf1GL=ErDNi2Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Maciek Borzecki <maciek.borzecki@gmail.com>
Subject: Re: [PATCH 3/6] systemd: extend PACKAGECONFIG flags
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
X-List-Received-Date: Mon, 08 Feb 2016 10:21:16 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 8, 2016 at 11:09 AM, Maciej Borzecki
<maciej.borzecki@open-rnd.pl> wrote:
> We currently ship a rather full-blown setup of system. Very few
> configuration knobs are actually exposed through PACKAGECONFIG
> flags. This patch adds new PACKAGECONFIG flags for some finer tuning of
> systemd's functionality. By default most of functionality is disabled,
> with exeception of:
By disabling all those you kill huge amount of functionality by
default - which at least my images need. Could you choose default as
is and cut down your images please.

Andreas

