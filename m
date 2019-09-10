Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id AD62060111
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 21:45:20 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id e12so12180044oie.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 14:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=3nYhrXh5ykAqS74/Z7KsRs6ANHswCneAVDgb0LzWKIM=;
	b=sa1fR3irPUB6VDtj3CKRRn6f+0hQWs2TcWy8LVvtL7yfqVMXLjdU1O+mbiTepNk8/a
	O6+mNaUmTSv5pwXfPqC/LQEswX/vbQgk/Xs/TwbbNlaNpINxdix4XTXpVAvOrh7yIcDg
	sBE/YIwZXsMmr25bi58ssUGkzrm0F01G4bwae1ahFYa23junIRu3tpiW00Q297DUqYjQ
	hsNRbHpMQJzia2A1ytZDWxjgJJCO+vL+MFoOmxLoH1dt7i6539LTyS1zp1RkXIkja1vf
	+k0hJ9zPrndH4OtQeFWB5DGlNxOegdU2gRwIfCXNnuTxYkiu6/dvLVwYrKdaj7v0GyVt
	4wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=3nYhrXh5ykAqS74/Z7KsRs6ANHswCneAVDgb0LzWKIM=;
	b=Z7fEuGZgxjoAiRVFBrXe8oyeZih1dHRKxWld56t1CgOPWwzcLrdwfzNkZ1kKuBJwJH
	8EXFGqqnr5X3EwA8DyVHPhv/LTbCHdoJwiX58kTI15H+aD6k/oh7XCWpsinP+xqB0550
	E8DJ6lBOY1ufseHVkeulv7Po2Ap5PQuoDzlNU2TdlfgM1WHwTpxfYGcAbvT0lWEcn2MR
	c3x5chwwzdKp3x5OZzW8+vRdxqBOkxlu6nqXQ7kl2h9d5Dqb9ZlLIy50EDvIwU7V3cW7
	4CUqzyXmWQRck9XYzunZ8oNPqzGz1DuOlo7ZtJKehdMp2nKHVsG0bnZuKkaM2Gef7fMd
	fwNQ==
X-Gm-Message-State: APjAAAXv6UUE4PYlPjktC/m0PQ5jmTgm4TbjAFeKqHZA7KLk+iDm8IBc
	jinzSj5iackwbctqfxlfO0chnULCqyJHpA==
X-Google-Smtp-Source: APXvYqySAJqBpzImgMSWJwAzLrmqqsRSzszukZryWVF1wWXWd4p/OtY3tPqEdX9EoZLPWE20+fZhKQ==
X-Received: by 2002:a05:6808:48a:: with SMTP id
	z10mr1485574oid.129.1568151921076; 
	Tue, 10 Sep 2019 14:45:21 -0700 (PDT)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com.
	[209.85.210.42])
	by smtp.gmail.com with ESMTPSA id 93sm7637136ota.16.2019.09.10.14.45.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 10 Sep 2019 14:45:20 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f42.google.com with SMTP id s28so20518055otd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 14:45:20 -0700 (PDT)
X-Received: by 2002:a05:6830:20d2:: with SMTP id
	z18mr27533651otq.181.1568151919624; 
	Tue, 10 Sep 2019 14:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190910213750.1369567-1-raj.khem@gmail.com>
In-Reply-To: <20190910213750.1369567-1-raj.khem@gmail.com>
Date: Tue, 10 Sep 2019 18:45:07 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqXo6bapA_ZEFE3E-MP-1QOSpdGw8pEyy8+JAH333-taQ@mail.gmail.com>
Message-ID: <CAP9ODKqXo6bapA_ZEFE3E-MP-1QOSpdGw8pEyy8+JAH333-taQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston-init: Add possibility to run weston as non-root user
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
X-List-Received-Date: Tue, 10 Sep 2019 21:45:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 10, 2019 at 6:38 PM Khem Raj <raj.khem@gmail.com> wrote:
...
>  do_install() {
>         install -Dm755 ${WORKDIR}/init ${D}/${sysconfdir}/init.d/weston
> -       install -Dm0644 ${WORKDIR}/weston.service ${D}${systemd_system_unitdir}/weston.service
> -
> +       install -Dm0644 ${WORKDIR}/weston@.service ${D}${systemd_system_unitdir}/weston@.service

Not need, as it is done below.

> +       install -D -p -m0644 ${WORKDIR}/weston.ini ${D}${sysconfdir}/xdg/weston/weston.ini
> +
> +       # Install Weston systemd service and accompanying udev rule
> +       install -D -p -m0644 ${WORKDIR}/weston@.service ${D}${systemd_unitdir}/system/weston@.service

This is good. Replace ${systemd_unitdir}/system with ${systemd_system_unitdir}

> +       sed -i -e s:/etc:${sysconfdir}:g \
> +               -e s:/usr/bin:${bindir}:g \
> +               -e s:/var:${localstatedir}:g \
> +               ${D}${systemd_unitdir}/system/weston@.service
> +       install -D -p -m0644 ${WORKDIR}/71-weston-drm.rules \
> +               ${D}${sysconfdir}/udev/rules.d/71-weston-drm.rules
>         # Install weston-start script
>         install -Dm755 ${WORKDIR}/weston-start ${D}${bindir}/weston-start
>         sed -i 's,@DATADIR@,${datadir},g' ${D}${bindir}/weston-start
...


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

