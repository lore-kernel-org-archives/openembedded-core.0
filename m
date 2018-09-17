Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
	[209.85.210.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4849471E5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Sep 2018 01:14:24 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id e18-v6so9644269oti.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 18:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=dlKWJaGHboevsx/3G6onQnJphYfbSIFQoCWtNudwrQI=;
	b=a4ef17lxkNNuQlfXPPOhMvHm1XyMSbAVYzyouruzD8KyalZDr/qZNOy1wMfFeQOcEe
	rKQicHFkb7Kox99LIHSwKiVmA2hI8Wcen4XLczptNJrXc/tN52sbkeOaijko2dB6V8CY
	pv4f7d/pM4+XMAesaCNRqqgtpl2A+q0ozV6Ut0lFoJvDc3YdXsIQ84Mnkxkt8LqIiR4R
	k01WCy3ZPYyS57w9opX0aanPBxe7b2USsATrN2JdJQm5yWva3vzyDkrRq3hb98fK8trG
	SpQvYfkutNrB5sEhbC62cZ9il81Si7EDLJr4lqzSf+GlOnO0rt5yjtB65Mj8Dj+/qoxE
	Rbgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=dlKWJaGHboevsx/3G6onQnJphYfbSIFQoCWtNudwrQI=;
	b=JW5KcA+vZ0AtPj0mo7wLSLdxcUnPgZMSG7yal14qJUzmZzBxcf8kxPVttPfdIFtMR7
	Bl5C3Qgd8IWlST7NcSoHB1qOWCcwKlH0negigwY7Is8ofLMbnyfo5YvvX21D9WsxXiRA
	30jEsCf7jCxYhA1d587ZQ7YU1IH1a16oa1XvfigFZSzmH0/VJXYyG8W+E8PS8hDXS/gE
	v2RvOEC7ozuthKTtIgvvB2OtPm0stsDrMCxplItGDPzRae8v3S/VOWfUyqs2GMpmFoQY
	Nw9ho/nearF/WO3G6cbyN2ofGi9IaeAMN2ueZLSE6RxSX2KSts2E04WcuPqs5N7kp+eV
	enuQ==
X-Gm-Message-State: APzg51CM3miQR3fv0AAq9hER4zoZmhjkwb39OAZAoUUgkoDjY+YkBalX
	As9va/1dWG/QIeFtUYqAXeOEjE7iAZQUkA==
X-Google-Smtp-Source: ANB0VdYe+HRIuLEzYAAVQWl/ex/ZIiV0nvCA2dvmqvd8QG35Zbx/+x2YqQa6gsFGlIUjs0IrFAHhqQ==
X-Received: by 2002:a9d:2cfd:: with SMTP id
	e58-v6mr11448056otd.319.1537146864833; 
	Sun, 16 Sep 2018 18:14:24 -0700 (PDT)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com.
	[209.85.218.54]) by smtp.gmail.com with ESMTPSA id
	v24-v6sm4012079otf.33.2018.09.16.18.14.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Sep 2018 18:14:23 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f54.google.com with SMTP id r69-v6so17493737oie.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 18:14:22 -0700 (PDT)
X-Received: by 2002:aca:f045:: with SMTP id
	o66-v6mr16535658oih.8.1537146862498; 
	Sun, 16 Sep 2018 18:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20180916211625.18597-1-otavio@ossystems.com.br>
	<20180916211625.18597-4-otavio@ossystems.com.br>
In-Reply-To: <20180916211625.18597-4-otavio@ossystems.com.br>
Date: Sun, 16 Sep 2018 22:14:04 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoKv05L0=NVUnY7LamEbjsZwTgsAqnNokQr8KS64SThBQ@mail.gmail.com>
Message-ID: <CAP9ODKoKv05L0=NVUnY7LamEbjsZwTgsAqnNokQr8KS64SThBQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Marek Vasut <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>
Subject: Re: [PATCH 4/4] u-boot: Upgrade 2018.07 -> 2018.09
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
X-List-Received-Date: Mon, 17 Sep 2018 01:14:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 16, 2018 at 6:16 PM Otavio Salvador <otavio@ossystems.com.br> wrote:
>
> This upgrades U-Boot to 2018.09 release and drop the backported
> security fixes which are now included upstream.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

When I mentioned, on IRC, about this bump to Marek, he mentioned that
there is a regression on x86 being worked on upstream so this patch
should wait for this to be sorted out before we update it.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

