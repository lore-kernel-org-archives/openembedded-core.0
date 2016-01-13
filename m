Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0350B6080F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 12:04:32 +0000 (UTC)
Received: by mail-pf0-f172.google.com with SMTP id e65so80714724pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 04:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc:content-type;
	bh=euZ1KF5LAEXJKJ+N0iw0o0v8e0NbRiQ72XVA0mO+K8U=;
	b=yVH37hUQp8R+lvzb+qyaIa+WAYv9cat8lQLCV0V1JJSOxUq04F5gV3KqEPnZnmzpax
	it6LNuSNVVtq2+HSFS2pqNIpMbdm9dKwisKIFqI2Wg1qIpjSaZdloq4WHwiv6lSFXHDZ
	qnhN9wEhTVWKlwXeV5hVVUf6yPaywZ9BG+4e/K/DapwxjPlZVdYPcQwdBQ24hlpbGX7N
	6R5X4nTOkAU9cbbMzqzo2Fo7Il+jgUpNZbb1Wrhyz1wlr8lsL8482MZF0i/3v0M3Pw9T
	CGR3c3fL+ONyP5NzQ6j5TpJ5WBOcg4znI+/JJRKMCTkj6ex7UDVwCg66j+x3K3riodBy
	3gDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=euZ1KF5LAEXJKJ+N0iw0o0v8e0NbRiQ72XVA0mO+K8U=;
	b=AgBdb5lz9sXHlE12sdG5ijj+Hnjak5Gvb0h/csB3V9LgW10R8snLIIgLQ5MQT1cSw8
	+B7wlX98GJzc8jTwqlUrk7gtQe+xQ7bVWtRxG5Ne3PL1XLYresG+u8SsabqKpndnsQwL
	goofaYqSz4iaYCdKEJbgyrutrhe7qLtDB8xO5NWVb8WpExZZMZDJSc+mvv5AYIemvQUM
	LrNX2uwo3HNSZ8wUvhc2XzuETlJLO32QPvAusbbrjzlv3WH2LlXCMxFekeFb1NpI1Muc
	g0hOC5wouWRBch7wwxrSK37U7zhYREpDxErTm7pSJsbQ676hgt9pFZ1rdnLglM79PEkk
	BTaw==
X-Gm-Message-State: ALoCoQlmR3fz4OzDRnOx48FXBS3lQO0Xz2L4wn1lvLTnLe4kJsbLL4d/LAjqlb4gpbmqLuZqcheUo01ZR4hjw8ZdB1TUf7zyPQ==
X-Received: by 10.98.42.83 with SMTP id q80mr7493534pfq.1.1452686673304;
	Wed, 13 Jan 2016 04:04:33 -0800 (PST)
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com.
	[209.85.220.54]) by smtp.gmail.com with ESMTPSA id
	kw10sm2319973pab.0.2016.01.13.04.04.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jan 2016 04:04:31 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f54.google.com with SMTP id uo6so341539578pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 04:04:31 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.66.232.74 with SMTP id tm10mr141971846pac.128.1452686671358; 
	Wed, 13 Jan 2016 04:04:31 -0800 (PST)
Received: by 10.66.72.229 with HTTP; Wed, 13 Jan 2016 04:04:31 -0800 (PST)
In-Reply-To: <1452656212-9836-1-git-send-email-marex@denx.de>
References: <1452656212-9836-1-git-send-email-marex@denx.de>
Date: Wed, 13 Jan 2016 10:04:31 -0200
X-Gmail-Original-Message-ID: <CAP9ODKr1iOkB-n7yfyOGk0dYnuni1V5=84k1CK1eG+TPFsFLuA@mail.gmail.com>
Message-ID: <CAP9ODKr1iOkB-n7yfyOGk0dYnuni1V5=84k1CK1eG+TPFsFLuA@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.01 release
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
X-List-Received-Date: Wed, 13 Jan 2016 12:04:33 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 13, 2016 at 1:36 AM, Marek Vasut <marex@denx.de> wrote:
> Upgrade U-Boot to latest version and drop upstreamed patches.
>
> Repair configuration of U-Boot during build. It is no longer
> possible to run "make foomachine" in U-Boot. Instead, it is
> necessary to do "make foomachine_defconfig ; make". Fix this
> in u-boot.inc and u-boot-fw-utils*.bb .

Please drop this config suffix, from u-boot.inc. The config value
should be used as is and the respective BSP ought to be fixed to
change _config to _defconfig.

Apart from that, it seems fine. As suggested by Khem, please post it
with rename detection so we can double check it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

