Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0B4B9787DE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 17:16:37 +0000 (UTC)
Received: by mail-ot0-f174.google.com with SMTP id y11so4493808otg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 09:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=UIGfBXgN+llI7OJa+/KPF0QH6yJdiR9B32A1lH0RsXQ=;
	b=WuHQ+oO7oocKumluHlWxGGMSuptdW7TX5W1uxKKORfxvXMj+lWBhnvBNnx/UaXGDBY
	CvTuwxewiA50FgQnwwU9JhEGOSYbb9iWZDhkUpNM55I2GBq7bpW/5YNWSwiFkur4E2JU
	cOPKVt4YkFgUldm0vBA5JptO/y6K4xiq6BD7qusNpc9RRzuKxfgpbBijlerBt/ec1lpn
	9pQ85EmaRrAT7T5CYw2O9Jv1IVLrHsUFzYYPRItGqZcy6Z+hRHBhpIVZQfhaGR3JZJOL
	9Fhy1m+Mqyyqi+lWqjTlZkvRuZ281dfEPiogbkt2itGYU0tzf0KOJ0V7PZeqFneD1T3m
	tR0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=UIGfBXgN+llI7OJa+/KPF0QH6yJdiR9B32A1lH0RsXQ=;
	b=JqYZO069GhZ9DB2vpoRkbE1EaH73Ba/wlG3bTAs78C2354hxBxczVipid/q5jSUSNZ
	lmf/xoiyevALznv84uKVfoeHU3NXvEbAmo5My0Z4mizlSeety8bj8Q9bAxXdb665UdYH
	T7WV/M5UrBcL8WcTpcGFKj1kpvVRMWsgEVxKLKPSOjdJjvaX6Oyx6q4paaImHUKPSM7X
	3mJgqBYLuUoT2XynWQ/IM+WtogCL6AmUyNF/0AObCxM9BjShF8CKJqBgrsnCU0sw5TJH
	yaLfVNwl67nbd3yZXDLR+iE3ZimfvUPHhrQOo8IiW3pXdC6x+M/xbjyGeVmfCeAp7Bxe
	gBxA==
X-Gm-Message-State: AElRT7GbW5AfNCuPoobz2YeGkk4X+AVP2zvLFHB/6nvKd2iLnVLGHZfN
	uYq2G7eT0vDiEbN3vG6bJwhsLwgS
X-Google-Smtp-Source: AG47ELvXl3vWHboUSmNoDFUEro0E4Av+TdDdefaPiFt/0TBzY0t+YceTcQXzc7Lop8cls2zzI/EH+Q==
X-Received: by 10.157.90.5 with SMTP id v5mr1762321oth.349.1519751798543;
	Tue, 27 Feb 2018 09:16:38 -0800 (PST)
Received: from mail-ot0-f169.google.com (mail-ot0-f169.google.com.
	[74.125.82.169])
	by smtp.gmail.com with ESMTPSA id o8sm52872ota.23.2018.02.27.09.16.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Feb 2018 09:16:37 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f169.google.com with SMTP id m22so4452477otf.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Feb 2018 09:16:37 -0800 (PST)
X-Received: by 10.157.66.4 with SMTP id q4mr11371077ote.327.1519751796733;
	Tue, 27 Feb 2018 09:16:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.80.129 with HTTP; Tue, 27 Feb 2018 09:16:36 -0800 (PST)
In-Reply-To: <20180227123634.2812-1-matt@madison.systems>
References: <20180227123634.2812-1-matt@madison.systems>
Date: Tue, 27 Feb 2018 14:16:36 -0300
X-Gmail-Original-Message-ID: <CAP9ODKpB38Kpfj3EUdGNM+dL_A0VM03mP0isV4Vg_0DZ8Jw14w@mail.gmail.com>
Message-ID: <CAP9ODKpB38Kpfj3EUdGNM+dL_A0VM03mP0isV4Vg_0DZ8Jw14w@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 0/8] go1.10 update and misc improvements
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
X-List-Received-Date: Tue, 27 Feb 2018 17:16:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 27, 2018 at 9:36 AM, Matt Madison <matt@madison.systems> wrote:
> New in v2:
>     * Fixed Upstream-Status line in go patches
>     * Added GOTMPDIR to do_configure[dirs]
>
> Updates to the go recipes and bbclasses for go1.10, which
> moves the bulk of the toolchain bootstrap and build out
> of the 'make.bash' script and to the 'dist' tool.  This
> required a rework of the patches.
>
> go1.10 introduces significant changes to the go build
> tool as well, requiring some further patches to make
> it work for OE builds.
>
> See https://golang.org/doc/go1.10 for a complete list
> of new features and changes.
>
> Following the update are some cleanup/improvement
> patches.

I tested those patches and they are working fine. I pinged Matt
specifically about one patch that seems that could be simplified. So
please wait until we get back on this before merging it.

If possible to put this on MUT so we see if any issue is raised up,
it'd be good as well :-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

