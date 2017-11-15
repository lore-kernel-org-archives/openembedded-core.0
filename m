Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 309F678696
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 20:37:16 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id l138so6841806oib.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=gLtiT4B1V7ZD5I3Ud7ovmeGdbwyNtAtZoj9BLZoLLaw=;
	b=SmsHtHMYxtuHbXiHIA5idrdSfMqPaTPCmPvJOWNS0+7GTp9M5ICwY0vsOTRs7aTQWo
	ugpeCmEAf3lABCGjjUVHhHQ7QzgbvcTZJQdbKsJZHFiUeG6klG0qjS5/X6yIKiM5cNoh
	mEYy9n0/oYql+G0jRUHT5ed53T6pwcESKqJiCK2xaEUGaWseYOzP+xbMp9gAurlUVQaN
	NdAVihZAAIThzTpNt05x+DelPCsWvOHB0b5tJoOOnqYJLVWmk8QvzYCKwfWB080+R5xv
	2mEfJOIGNGY79gFVabMeMNvVut8rI8hPRPqFqVsMzW4LW0chrBZkBnDXBCq92icpk0bj
	0Zdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=gLtiT4B1V7ZD5I3Ud7ovmeGdbwyNtAtZoj9BLZoLLaw=;
	b=eqnhbd5DGmbR+BlFe930dfnntKGs89TC0ZEKfhN6q8jkEQVsNsTxko3wgDY2kSAS1c
	ri+mlAUjZZ9iQ+UrcV/VSzjymu3nCUdnHJ0ITNW7gJPe1XUxai1hBmGAgC5BNE3cIR7N
	alrfQmoJXRni7a18TNPSJcAxP6S/uK3rjl8z/ZufdSTMmSe92ReF5Znca4DxliKRBrg3
	XQhAidzLs2imLXi2paN88FkpVD7SiqdoAT5DzPfJCZXxm5psSGUCAxPJx8hlzu2gKT/T
	BIss7XW2XQOzmeJPC/2VsyBKgaEJImZ8pD2u2zzoIuEqkhFMvcTmCrsiHjxSZGjptGeL
	AbVA==
X-Gm-Message-State: AJaThX7r3dPRlPi7hXbU02KNQ8GIg3mxaGqjs0+11TX5G4DJU0HUtYG9
	LZCK6dI7CIzUThwzJ6+g8qqIqM18
X-Google-Smtp-Source: AGs4zMYo040o8KUm57lNIPhdTy9qrMV+l3ynizLEgaX7gHNmEgA3igTVjn1sa8jwjZPBnjGFo0v8DQ==
X-Received: by 10.202.64.85 with SMTP id n82mr9956118oia.346.1510778237247;
	Wed, 15 Nov 2017 12:37:17 -0800 (PST)
Received: from mail-oi0-f53.google.com (mail-oi0-f53.google.com.
	[209.85.218.53])
	by smtp.gmail.com with ESMTPSA id v29sm1848281otf.2.2017.11.15.12.37.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 15 Nov 2017 12:37:16 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f53.google.com with SMTP id n16so7872227oig.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 12:37:15 -0800 (PST)
X-Received: by 10.202.55.132 with SMTP id e126mr10437544oia.216.1510778235646; 
	Wed, 15 Nov 2017 12:37:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Wed, 15 Nov 2017 12:37:15 -0800 (PST)
In-Reply-To: <20171114195619.30923-2-javier.viguera@digi.com>
References: <20171114195619.30923-1-javier.viguera@digi.com>
	<20171114195619.30923-2-javier.viguera@digi.com>
Date: Wed, 15 Nov 2017 18:37:15 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoW7rQPc_fE9tm9ydfiz9ZdawE+b9yQEu4pTkHX=pSmow@mail.gmail.com>
Message-ID: <CAP9ODKoW7rQPc_fE9tm9ydfiz9ZdawE+b9yQEu4pTkHX=pSmow@mail.gmail.com>
To: Javier Viguera <javier.viguera@digi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [morty backport][PATCH 1/2] tcf-agent: kill with USR2 in systemd stop
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
X-List-Received-Date: Wed, 15 Nov 2017 20:37:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 14, 2017 at 5:56 PM, Javier Viguera <javier.viguera@digi.com> wrote:
> From: Martin Kelly <mkelly@xevo.com>
>
> tcf-agent ignores SIGTERM, so upstream uses USR2 instead. This issue was noticed
> by Jan Kiszka and Brian Avery around the same time:
>
> https://patchwork.openembedded.org/patch/139546/
> https://patchwork.openembedded.org/patch/139560/
>
> However, these patches fixed only the init scripts, not the systemd service
> file. This patch fixes the systemd file.
>
> Signed-off-by: Martin Kelly <mkelly@xevo.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>


Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Please also queue this for rocko backport. It seems a good fix.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

