Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 22C7A7885A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 19:23:42 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id f135so2375914oib.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 11:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=47Ny72sTHxPXmPSjwrAm/V7kkS7xeKjEJ/bEK16c3BY=;
	b=dfAzG6GrB1x94p7+pMpanQuZsAucTyddCP6YM27z8yxc4HutYCTrfhCEgk4FDtwwme
	FFIi6JpAwYSVoVXuGoJET5jzR/uYcvptWjQ/iq547iTcp47WP8UNh1knzDR1KHSOgEp4
	ZXwDukDJR0icOJ1e/lizgEfAy/u9zN83eIQ+gFv2eFnQCLx5o4/afm6I9SkUbSFq9joM
	msyafmhsxJOM+bnT55biterSz68ZKpCfVbavTfwJzbrlf88O2y4LFLRHYnennQVA4pB1
	QKZN0WzuTkpuSqiOom8EG/SXx83+/D2EuBiWQLuNEQkxAecC9lQ2lXDvlcl+Q6ofaCDM
	CQ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=47Ny72sTHxPXmPSjwrAm/V7kkS7xeKjEJ/bEK16c3BY=;
	b=I6dSdC/MmJxCnpVEL329jtkFa++l3sBBAjBFI5O7PL5A7mbiJt12Xr3TQwOHC0cz/4
	qScXL+YLQbCfiq+9tqRNqd+ICDdE4x8HF/br3F/KPQvAfsjD89LOl0rp1cq37h/az4TA
	uVdR9HaPEDMmPvcbhqOfK79Z0PvdQ69+qocjjZZEk7ZIj7GlHYZME70TJOUySjmO6IhP
	9hfQO5RdOR/5KPCg7xsMuqQ1F28/t+aK7bDRAsSL0Cl6OKeC5IJAaoWHxqRimwVXqd2H
	0aPVVqBXQzuHkMtEOGhSdUG1IPsH1mMXkZmuBObCmnMy3L1eTB3zr1w0TXNw1t635fHt
	gD7Q==
X-Gm-Message-State: AJaThX4Pv4Q2uK4+9bgSpsZ4jZwaN4b5S2qcibw0Nhosth8X2b6pSIgE
	UVL8YT4MozI0yfqm/gyrz0sRhToy
X-Google-Smtp-Source: AGs4zMaq7AKvevMMwokGczxby8ud9/of/PGeP3EpPwoPqbhB8WnuxwRYb5lSib8Y6IC8RnGsA94zmA==
X-Received: by 10.202.106.68 with SMTP id f65mr2000852oic.95.1510946623616;
	Fri, 17 Nov 2017 11:23:43 -0800 (PST)
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com.
	[209.85.218.49])
	by smtp.gmail.com with ESMTPSA id t35sm1954143otd.6.2017.11.17.11.23.42
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 11:23:42 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f49.google.com with SMTP id a75so2371892oib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 11:23:42 -0800 (PST)
X-Received: by 10.202.102.207 with SMTP id m76mr1892365oik.68.1510946622070;
	Fri, 17 Nov 2017 11:23:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Fri, 17 Nov 2017 11:23:41 -0800 (PST)
In-Reply-To: <20171117175142.2642-2-stefan@agner.ch>
References: <20171117175142.2642-1-stefan@agner.ch>
	<20171117175142.2642-2-stefan@agner.ch>
Date: Fri, 17 Nov 2017 17:23:41 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr0ZAk-SsSQwj0WW04HoaA-GCWDfzNUSBxA2twu_J5dBg@mail.gmail.com>
Message-ID: <CAP9ODKr0ZAk-SsSQwj0WW04HoaA-GCWDfzNUSBxA2twu_J5dBg@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH 2/4] openssl10: fix runtime errors with Thumb2 when using binutils 2.29
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
X-List-Received-Date: Fri, 17 Nov 2017 19:23:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 17, 2017 at 3:51 PM, Stefan Agner <stefan@agner.ch> wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>
> When compiling OpenSSL with binutils 2.29 for ARM with Thumb2 enabled
> crashes and unexpected behavior occurs. E.g. connecting to a OpenSSH
> server using the affected binary fails with:
>   ssh_dispatch_run_fatal: Connection to 192.168.10.171 port 22: incorrect signature
>
> Backport upstream bugfix:
> https://github.com/openssl/openssl/issues/4659
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

