Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id E93786BDDC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 11:57:57 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id 32so39590794ota.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 03:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=1cowTMOHdujedFPfYlcpbJU9EtiSHXmfB564aOkDt2E=;
	b=DITWu5o4YiKiJkTXZKdcsFE8EUkHjoKBE33/qnxqQn1fY5pur4t7RuNF2V2tR2Tlp7
	77LbMO05pecgNbE4tMLzWfmeNmA4H4P8/hend0X2BuR/W0JuZgZYRz2rT2OBkpiNyfY7
	gp4YdcQeJjR8vQhltG40spuh5INAAnK4h+NfS1HHB+7PXSd2rPGpPV31rQGus6YwB5cb
	ApCt7T9KMdHaxl11MLTFrwb1GhfVr0vEiJoW1exuKACzye370k7yI80NO5SeXTYdPT/c
	c5PJjea0QiSuwNp/NciMN856CM1/bHqCLV/nEYuLYFvDjPKgZc5oP2xONBdUsT9VXwtc
	L3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=1cowTMOHdujedFPfYlcpbJU9EtiSHXmfB564aOkDt2E=;
	b=lipZACyqkjeKG2gqXdNQNVGCR0qehNcPBaQ97awPawaT7asc2stnSwj4b6VtrNUdtJ
	C8qRMwloLIylfs6Pl8DYFxK4pkNT5OTl4JzgsdJ3x9qCqqOkh7Kg1bSCNvJR43X12oOS
	i0BenPjrYOCBOlzvEQRibqjmI2GBw/9YiK+jtekb0mthBLzXYHe6sMDOnwubJJPKjufd
	fx6kkdjs91x6zLOxbO7lh5fe4+Scr//hAOAKPn2gnCvGV+sPuuVqMKyi6D5TNucxtkBk
	w9iQFrNEGp0NzvZs0h1LcVU0GsfxDSgA5BeXIqaL2l8hvVe8EZL258zGPNdiek7VXd7X
	RyVQ==
X-Gm-Message-State: AHQUAubJw8PyXFWWijlfvPhQCMzHS1UGhWSimrjMJJqcgsAp/GDJ3mQY
	nxL4P23g08/GiWU+B7GkxtdixSqzPub59w==
X-Google-Smtp-Source: AHgI3IbgQUMpi+uGvZkUVMJfzpmTXNW6gMhRZGQfE4IX6DuVgfxfjNTcsDlmkIWk5SgeTNfIFGkrEg==
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr21185422oti.172.1550663878632;
	Wed, 20 Feb 2019 03:57:58 -0800 (PST)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com.
	[209.85.210.51])
	by smtp.gmail.com with ESMTPSA id e12sm3150849otr.1.2019.02.20.03.57.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Feb 2019 03:57:57 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f51.google.com with SMTP id i20so39765275otl.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 03:57:57 -0800 (PST)
X-Received: by 2002:a9d:70d4:: with SMTP id w20mr11726344otj.253.1550663877194;
	Wed, 20 Feb 2019 03:57:57 -0800 (PST)
MIME-Version: 1.0
References: <20190219165906.14377-1-fabio.berton@ossystems.com.br>
	<CAMKF1souMyUMczQ+-s_+W2Tomi=Q-7dj7Us1bwQ23rDS5CPx=Q@mail.gmail.com>
	<CANNYZj9Abo0ZeUVq7jgkHLc6rENns=GptXNHq9eN-j_rJ20noA@mail.gmail.com>
	<bd16855764cfba4d700e2be8c8ea7cecbf2dec9e.camel@linuxfoundation.org>
	<CANNYZj98LDCmKD2va9zX26OJCFhTS-jNs6=aikLrAx8VW-CNeA@mail.gmail.com>
In-Reply-To: <CANNYZj98LDCmKD2va9zX26OJCFhTS-jNs6=aikLrAx8VW-CNeA@mail.gmail.com>
Date: Wed, 20 Feb 2019 08:57:46 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoQFi=UbZHQPXmTCw5Sqb2oVcB9GxsrVk0Bet5GdL7gUA@mail.gmail.com>
Message-ID: <CAP9ODKoQFi=UbZHQPXmTCw5Sqb2oVcB9GxsrVk0Bet5GdL7gUA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] mesa: Update 18.1.9 -> 18.3.4
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
X-List-Received-Date: Wed, 20 Feb 2019 11:57:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 20, 2019 at 5:22 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 20 Feb 2019 at 08:58, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > > I guess xrandr needs to be in X11_DEPS, this was added in the
> > > original
> > > mega-patch, but overlooked in the split version.
> >
> > There were failures all over the autobuilder from this as well :(
>
> That's why I still think it would've been better just to test and
> merge the original all-in-one patch, with follow up patches if
> necessary. Doing this split and delaying meson into 19.0 is just more
> overhead and work for everyone.

Patches should be logical units and a "do all once" is wrong. We are
doing the fixes so it is not adding overhead.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

