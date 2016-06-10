Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f41.google.com (mail-vk0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 18D8D6E668
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 13:50:31 +0000 (UTC)
Received: by mail-vk0-f41.google.com with SMTP id g67so98028245vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 06:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=AcvQOTKMtzz1IDrnwcWsgjNvyZmLkUF/9Zt9vopiM8A=;
	b=11QeZdwZQi9dT/+veSZh19RjK2xRpBX7Ve87ap/WypjuWU6ef17V31pv3Fl180toMK
	Dk7NPeTpJiGiTSueHZ9YSQLiEAVj8gVRpJVRsQ5+AIeLUHUosKRkm8XFOrxLwNYolgE5
	jlMX+GgxBN0bIexJ1jcna1Eduv7+98tWcfPPK6/8XzBlg1/KZBA2MqM5zSKzSv9BwC4g
	8EzPDARXVk4PTSiOW0NtUg5Oi5/XYjL8lx8DoZyeCLkBHaTVhCzXiiwo2B8GtAm0MIm2
	V7epIbS7pBXqu9QCfGKZB1mjPFqQXrlm5Ld3FXrGBCnqE0D/kqTatyPsdmxyUJJCPwB8
	o8aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=AcvQOTKMtzz1IDrnwcWsgjNvyZmLkUF/9Zt9vopiM8A=;
	b=AP25O7St4LlyjDgfhX+QSgcVAfLqGNFDrIy5lresLin5AQ22vXDpWc/4RXj2uDY5qh
	i2Ao475hcyWPkw88slAhPvuLYWnmMicvTasA/pKPJvcAioM7XF99UaGNPnciHE6AE4VX
	uJDoSDk++M44TV8rj6mpMkDa6YrkR5U885HYv8jJYT+QB8/I5V4tdHzEy9krehf0NiLk
	dz2ftFPk4fdddozGP0AbDNL3B49xU/TdWyEf261IXjShsWi2wxT+TcrazYLKP9XSlWPc
	5mop75mwgWBCD67jivZeC1MNEQj/uf5sE2MULorY2JCVqRRzOeyb15DNgWl5bA9LzCOe
	HGsw==
X-Gm-Message-State: ALyK8tJeIyKfm/c5boAPNaN3E2VsCbjb75BH/39khCBBXiOAHnktFid18ufhlb0JjHw7Yw==
X-Received: by 10.31.183.20 with SMTP id h20mr887918vkf.0.1465566632266;
	Fri, 10 Jun 2016 06:50:32 -0700 (PDT)
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com.
	[209.85.213.43])
	by smtp.gmail.com with ESMTPSA id 68sm1375216uak.14.2016.06.10.06.50.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jun 2016 06:50:31 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f43.google.com with SMTP id e4so98127377vkb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jun 2016 06:50:30 -0700 (PDT)
X-Received: by 10.31.151.209 with SMTP id z200mr860021vkd.122.1465566630685;
	Fri, 10 Jun 2016 06:50:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.189.21 with HTTP; Fri, 10 Jun 2016 06:50:29 -0700 (PDT)
In-Reply-To: <1465513759-9629-1-git-send-email-tom.hochstein@nxp.com>
References: <1465513759-9629-1-git-send-email-tom.hochstein@nxp.com>
Date: Fri, 10 Jun 2016 10:50:29 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqryoUnN_5W2iDq6RYn9FX=nfJCahmOXbB+aYX+SiaOow@mail.gmail.com>
Message-ID: <CAP9ODKqryoUnN_5W2iDq6RYn9FX=nfJCahmOXbB+aYX+SiaOow@mail.gmail.com>
To: Tom Hochstein <tom.hochstein@nxp.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] weston: Fix bug causing the xwayland package to always be included
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
X-List-Received-Date: Fri, 10 Jun 2016 13:50:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 9, 2016 at 8:09 PM, Tom Hochstein <tom.hochstein@nxp.com> wrote:
> The xwayland package was always being built due to its inclusion in
> PACKAGE_BEFORE_PN. The effect was masked by making the RDEPENDS conditional.
>
> Now we make the PACKAGE_BEFORE_PN inclusion conditional and restore
> the xwayland RDEPENDS to unconditional.
>
> Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

