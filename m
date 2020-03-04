Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5083C616A9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2020 10:29:11 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id s24so1806701iog.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Mar 2020 02:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=kg2bwPpX7myx/XrphGy3VI7pGLJhRjZKaVmak8AXEV0=;
	b=d+zVfwC0FEWhika6lwBgd4pS3i/4eG5M0ZkkDBVdzWcIUC/9HNv72oAqI85rILTwJJ
	4B9xRDG6CPkM1oPddYYLPeyYzKRa5wbwsBa9xOT7E+Ikr+mdH4HJmOXvpze+bQbGsy87
	OJ8AVrJXSi5pEHnXCDOaMHlJjYkKNztUge4QqYHY5RwlUbBh+O4E0PY7ef0S+y9wyKba
	RyiDBszHEWvWzTsd417GFzgoiRDqIgJ1XKPXIBhkdsh1Jl56/D6nxB4Ju8hoIkszBtIl
	020Zglcxyfua1yFVL2UlNs92Z0bq85bVwT2t/IykNLQny6gMVwHKo/vOIbqZVEvk6UW5
	jnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=kg2bwPpX7myx/XrphGy3VI7pGLJhRjZKaVmak8AXEV0=;
	b=UkG9E0HcJzuB8mYfG3WXb/CpUcu/UjzNMB0li9N3QwS2wrlTXZfrwjzzQGU2Ma+byU
	Gpz1cXNP6Q/XJ0jRKme4UcKe8h9l9hmkBM/p1H53hQPaeIPTqQLcxKWCEQ4QxZgr2EiG
	TlkP/jm148xBcmCdvbY+BN9d4nvLwl+3jIDH7tNBompVIx4wCPiP0LnXkfXtJwOZCJpM
	KaVTXrq7RTrt8kDPm0LeVqIk8w3WuRP71/7HWZyIGprqUVYXtFHylLMCPgCkTh1m4xlR
	mfU9Mql808Nk3IUUmGnT0v3LsqfxW1/u7xl1C8dTH5RkdxCepPwd9eNDBimcA/XS4LD8
	JKuA==
X-Gm-Message-State: ANhLgQ2VAJcCKjqIiz9UX9GQyLBIpIZkSt7IBZQyNsfsFoqJnKPnsWbV
	Lw4MmFIfttocJ1PBG4wbCpuBTVVesK5TFLQAeVNEpg==
X-Google-Smtp-Source: ADFU+vvOujPgO3a4cKB4Ymx+r1fedqyHJ7LuaWlktCTss1+g6skSABtFyzLWHPpxVi8hBFpOKh5dF1VlJmUpf5Bg370=
X-Received: by 2002:a5d:87ca:: with SMTP id q10mr1679510ios.192.1583317751980; 
	Wed, 04 Mar 2020 02:29:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:f487:0:0:0:0:0 with HTTP;
	Wed, 4 Mar 2020 02:29:11 -0800 (PST)
From: JH <jupiter.hce@gmail.com>
Date: Wed, 4 Mar 2020 21:29:11 +1100
Message-ID: <CAA=hcWQK3auVqLAYVYc-rKfgPE=VnbmnYMzqtOMjWKfOwYbPeA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Meta Freescale <meta-freescale@yoctoproject.org>,
	Yocto discussion list <yocto@yoctoproject.org>
Subject: Does Yocto / OE build u-boot image for u-boot configs in #define CONFIG_EXTRA_ENV_SETTINGS?
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
X-List-Received-Date: Wed, 04 Mar 2020 10:29:11 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I created recipes-bsp and an appended file u-boot-imx_2018.03.bbappend
to build a customized imx6ullevk image, I added my configures in
#define CONFIG_EXTRA_ENV_SETTINGS in mx6ullevk.h, it built the
u-boot-ram.imx and u-boot-nand.imx, I tried uuu to store
u-boot-ram.imx to the  =customized imx6ullevk board, all settings in
CONFIG_EXTRA_ENV_SETTINGS were lost, set nothing in u-boot. It did not
seem that Yocto / OE built the u-boot correctly and properly, what I
could be missing?

Thank you.

Kind regards,

- jh

