Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 9D81460017
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 21:06:24 +0000 (UTC)
Received: by pabxd6 with SMTP id xd6so27078463pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 14:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=Eq5q9O1Qd51cJIwjlTo032fq4FH71KVbO6X6R85fyjU=;
	b=avXCRyW5onf7ct4IHVlQDHwB9OKoK+Ip9t8DgGVmERVOE/FsBodvQgS0PHoDeilUtz
	DsN2/dgEh+Bj9Ba5vCBmaAY4BLeYzQxz1ULaMX7hqNN3SmEhEXs3GRjQA5oKCtBY9h3v
	1ffqKWqVSmRcrhWsAwhuIkASopU3kMYQ5UlvUoXut5A74iiuagqfhI9Gm9ltCicb18F0
	WRIPtd0JTkxv+z73lJ+VB2SEemL7iEldLXaM/uPk0Xl2IdoI20ycvFVl5EMsqwMuZwbd
	dpgF00mV8h6uwcojVyjTUTLqknrRQtIvUWyo00ZQJWnYSEP7xnT/nf7B+UUJG+E+7SM/
	BeOQ==
X-Gm-Message-State: ALoCoQmVWn9tD/p6W4U4woLb15HHV3PSoWOWk9u+6ke1yJ3PIN6OskVndrBvyPceRg1uAqk/9b5M
X-Received: by 10.66.97.65 with SMTP id dy1mr23369426pab.78.1438808784215;
	Wed, 05 Aug 2015 14:06:24 -0700 (PDT)
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com.
	[209.85.220.50])
	by smtp.gmail.com with ESMTPSA id y2sm3914879pdc.91.2015.08.05.14.06.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Aug 2015 14:06:23 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pabxd6 with SMTP id xd6so27078000pab.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Aug 2015 14:06:22 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.68.198.37 with SMTP id iz5mr23004133pbc.129.1438808782761;
	Wed, 05 Aug 2015 14:06:22 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 5 Aug 2015 14:06:22 -0700 (PDT)
In-Reply-To: <1438808330-21635-1-git-send-email-dv@pseudoterminal.org>
References: <1438808330-21635-1-git-send-email-dv@pseudoterminal.org>
Date: Wed, 5 Aug 2015 18:06:22 -0300
Message-ID: <CAP9ODKpxyYQQKZVVG5_iuS+500QEtbLdg=Hxjn3TgCi2ChoQJw@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-base: Enable pango packageconfig by default
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
X-List-Received-Date: Wed, 05 Aug 2015 21:06:27 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 5:58 PM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> There is no discernible reason why pango should be initially disabled,
> since the necessary dependency is already included in OE core
>
> Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

