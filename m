Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 04A39607F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 11:53:13 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id n61so30923709qte.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 04:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=X6jRatraFSD0QB/AZO6RSZxXP/3qPP/loezqx+rq73o=;
	b=D5qPotRWJTg+tHceIVVR8x+P4ZW9ly6nc2AobI8PNDVrs98a2xmyHxn/b+yfShiTXm
	ypbhLQ8JU1XTJws99KN4sknSLefcgixhMyBgqbThOmRpFTpgmnyGE3LPRh3qpM3JU6Ij
	kyXv7KPrZb0Ca55Y/K/L/1OoHCKV/ZBbbhSywnUCVbAHYaaST7qoQT7ZEPV6b2S+F5A1
	8DYtwqX2eLXJpWZR2XynM3oo2I8o+i1Las58+wVlSMrCPol0kTBbvVEL6BQ96ZftUxqa
	EGI5xm3eWwqwGITDuyHwwXdpGPieL/WblbVctfW0OXbSFBvRhKx2zOCGGBXFhPBOuM2J
	I68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=X6jRatraFSD0QB/AZO6RSZxXP/3qPP/loezqx+rq73o=;
	b=InqXTBJW2Sj2vrW/X6RnyKgiBixMZ9zetE7iFCqPIxIIMbMkHBd7MzpDNo9tMRcKAI
	O8juE58ILwfmqtj+BquD4dOI60GZfQeoSSCnxnRyXdZpGkn4eatX1dms+pKDPomiLlEQ
	NwJ/jB5SWsJ9z/jg46XeajeXX4cw5nDs6ocdnHRTRqaiG22oRCIaTJ+JWMv0HexPIwl5
	pi+u/Ll8Ynyz3h8y45VoCq46FG8k4FN6PNSVSYoIUQ+yPB6S1srcSe4ccv2AU4HOtzv+
	SEz7X09HRjw1VX3bnFb6KOJ3dpLkkBAK68049+Nx/a+fDufu+tZzF64X/8MfccR+14j2
	obVQ==
X-Gm-Message-State: AMCzsaX3HyQI2BHKZw+WZptvMOyoyYSzz2nugnFFIuljx+nK5z1Yio7Q
	rLRBDgOUHx3lF7T/t59Zap98Qi3p
X-Received: by 10.129.117.5 with SMTP id q5mr199836ywc.116.1508154794447;
	Mon, 16 Oct 2017 04:53:14 -0700 (PDT)
Received: from mail-oi0-f49.google.com (mail-oi0-f49.google.com.
	[209.85.218.49]) by smtp.gmail.com with ESMTPSA id
	l66sm3495195ywd.98.2017.10.16.04.53.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 04:53:13 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f49.google.com with SMTP id m198so24625389oig.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 04:53:13 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+SfNkXL/AChBUIT3dWyNy1s0X6MBqDTETdl9KNrh4ZbPHFA5JUkIFFoFQnVfMmEX1b3qwPy1fexUVcqRCwI5lE=
X-Received: by 10.157.66.5 with SMTP id q5mr210038ote.357.1508154792810; Mon,
	16 Oct 2017 04:53:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.56.216 with HTTP; Mon, 16 Oct 2017 04:53:12 -0700 (PDT)
In-Reply-To: <CAJ86T=Wr_u_x8Zn2n5SX2C8dyO1vbpMFX=3ufZA8X_gtG53p6w@mail.gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
	<20171014154858.35123-6-raj.khem@gmail.com>
	<06c9bf77-9781-f521-c450-c46f985c7dd3@gmail.com>
	<CAJ86T=Wr_u_x8Zn2n5SX2C8dyO1vbpMFX=3ufZA8X_gtG53p6w@mail.gmail.com>
Date: Mon, 16 Oct 2017 09:53:12 -0200
X-Gmail-Original-Message-ID: <CAP9ODKp1H_netdtLEs_thSGNJRfcOETwU6O+b4zfHe+ZSg=w2A@mail.gmail.com>
Message-ID: <CAP9ODKp1H_netdtLEs_thSGNJRfcOETwU6O+b4zfHe+ZSg=w2A@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] gcc6: Upgrade to 6.4
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
X-List-Received-Date: Mon, 16 Oct 2017 11:53:14 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Oct 15, 2017 at 5:06 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Sat, Oct 14, 2017 at 10:21 PM, akuster808 <akuster808@gmail.com> wrote:
>> why do we continue to maintain 2 versions of gcc?
>
> Probably the same reason why Buildroot continues to maintain 4
> versions of gcc, it's useful for end users.
>
>   https://git.buildroot.net/buildroot/tree/package/gcc

We keep all user space and toolchain up to date so upgrading the GCC
is straightforward.  That said the gcc cannot vary from one machine to
another so if a vendor wants to use an old release, it can be done
using their distro.

I am against maintaining two GCC versions as it increases the amount
of testing needed. Instead I'd prefer to have clang merged on oe-core
instead and easy its adoption / test.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

