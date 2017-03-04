Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f170.google.com (mail-ua0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 9298E72F6C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  4 Mar 2017 10:17:05 +0000 (UTC)
Received: by mail-ua0-f170.google.com with SMTP id u30so3078345uau.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 Mar 2017 02:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yS0VhJ/Dz32vyzlSQ2dmCTA51B8UxoOdRb7DuJlJtgc=;
	b=hb01JUVWAjQNJqjWUcrx/mlaEkkfdRLmHRWgNuxshRrbASde89FG0JdRz8UclYP7bA
	XNA5An/tXFDLfYKvuVFFzXzKuZhFAZXincydGV4mrGQaUYyMIIYpRCHQxofOCShvZhEb
	ATSCVgC2WNp2xk6t7PTmfWxeJY6KnojLBohJrFHeiqy4780hbzFWxV4TrRC8P1ltuwPQ
	32TTsSZduwDnpwRMAxvfgsAiql63DADEpkx0mmiCT3xWa7Qf0r5JeekmXFU5zzwD/y5n
	KUhOmTlec5tx3jPGS6NzlykOhQIUGT+Yl3OrXMPiZYih9siVrMxwT7wuWA9Io4XWpC8G
	x7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yS0VhJ/Dz32vyzlSQ2dmCTA51B8UxoOdRb7DuJlJtgc=;
	b=DJdUyrIMDQTVlnJB3VEvjDmIFCDaacAdOv5ZjwiK68byY8ORTDdzPafUgwBINN6Wg+
	Mr6Bo/4X2nE/RWJK1y/Bor0ZO+akVPijRUdlPGv4Vw0Qiln7oe+AKmZYvaxA4z/PfUtC
	VVo7iuLeR20sh6eSCwYGCFLVQNLjox3DDAJtBcY+XhyRxYjVxRKT8JcfTX5KaWVD5MSx
	BrHJ+IqwssiNrbMW2R+ugzOET6SKbgjXZRX5PVDsAMu55u9NwINQ6cFF4Btq0coAqrc3
	1XxTEBwMU817azdlemlrFhWKAdFMSA/IusggvZdSxpYAWxrQaB43E8DvUxeCsUuSKhci
	3e2w==
X-Gm-Message-State: AMke39kV9f0m5bV5UlMw7U2Zgph/YI36EwLbfF3ov7CD1zc6jAj2kd3/Ogkvxzals1nFHY2GsoFDoWU5oMsXTw==
X-Received: by 10.159.37.144 with SMTP id 16mr3154854uaf.80.1488622626462;
	Sat, 04 Mar 2017 02:17:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.71.65 with HTTP; Sat, 4 Mar 2017 02:17:06 -0800 (PST)
In-Reply-To: <CA+chaQd3Py=fyCmnFkHoWaSHEWPxdppi0Y-UkaFEi8=14akh5A@mail.gmail.com>
References: <20170303213619.29944-1-schnitzeltony@googlemail.com>
	<20170303213619.29944-2-schnitzeltony@googlemail.com>
	<CA+chaQd3Py=fyCmnFkHoWaSHEWPxdppi0Y-UkaFEi8=14akh5A@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sat, 4 Mar 2017 11:17:06 +0100
Message-ID: <CALbNGRQV1fY1y58awKDG4otRLjEtixej0emvnQ5Vjvyx5535Zg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] aor: fix rss+perf+gold failure on do_compile_ptest_base
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
X-List-Received-Date: Sat, 04 Mar 2017 10:17:06 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 3, 2017 at 11:27 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Typo in summary, but thanks for taking care of this!
Although aor is close to apr I'll send out V2 today.

Andreas

