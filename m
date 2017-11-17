Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f175.google.com (mail-ot0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id 47C6778838
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 19:23:00 +0000 (UTC)
Received: by mail-ot0-f175.google.com with SMTP id v15so2891548ote.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 11:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=LPdnWf6FutPOOeB9PMItwUzCaPySVPX0XKEHuNzcocI=;
	b=h7jeP0Z19ZGxJTAu52DwmjnmJOF4MyEHliVthVf/O/sUVvrtPd/9itAaHGIBUO7z/y
	dRsNeQJQtCDjaWix7uRkwHOwIQgF8VkSM8+vni3QpfGdYchPtmm1bCpkxdKxTGHqEhhs
	7elXpaPC2BOKxdg0XpXTOUVvznitXH6nyfH4+7coa3bhZps3zW7vgsa6O6xnPVjWxerI
	rR9p70HyCiUVLf/eQ4+yLIG2JSlen9+cvb3ogNKek3hsvbD4VVdITzO2jsVm69yKEtTg
	Y4FIH/rl+6HpDO1ZnWByRNLF1OrJaQagUOR5Q0RiK0enj5npUXi9lYGk1MsHGOWpmnZu
	08GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=LPdnWf6FutPOOeB9PMItwUzCaPySVPX0XKEHuNzcocI=;
	b=Bn4tSTY5QUhHokwJh3GWOMLu+MWf3JtnIOcD6ycTASz0HAZc3wiQwMwgKh3l0J7QJS
	B9RyuZ4ytm53exNhuPMqbKmOYrupqCvHBLAbv+tN+UPRtqDpGHGvJj7ioXTmnjMna2sO
	e2LOhvHcYvAs6cWKgceQ3m1QeJs08rgQWpHFU4SuYXBZTnRaNMTy9AclYl/gX6z73XH/
	JIpTgUi/POoWQHYbUsoB9Xksk+kLcOnOCZpFpRQKMmX09tuoWk3n1CDWIqUkNGow0FPa
	u7vG+s5XGAf7XFjg0qw1t5k8EqY08+iSp3Bzyj1xqI/Ylf6Vlt1qnF0m/yA00tdSqf/z
	gq0g==
X-Gm-Message-State: AJaThX4KeHmLTtVQ4aHs9rM0Z29na70z/0rfj0V6wvA1I+sjDlxtpMlL
	Ft06LwBMVQHQHJ+ScLF4gD/EDbw6
X-Google-Smtp-Source: AGs4zMbbAg9CIB7mpvGzKGfnmW/ixwvJXLRYuYo9l6wH2xlPBJloFUpUMpDO3ZoeFvaWzyNJeYtAjQ==
X-Received: by 10.157.63.218 with SMTP id i26mr2035851ote.72.1510946581841;
	Fri, 17 Nov 2017 11:23:01 -0800 (PST)
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com.
	[209.85.218.54])
	by smtp.gmail.com with ESMTPSA id t90sm506477ota.79.2017.11.17.11.23.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Nov 2017 11:23:00 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f54.google.com with SMTP id h81so2352465oib.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 11:23:00 -0800 (PST)
X-Received: by 10.202.55.132 with SMTP id e126mr2139163oia.216.1510946580069; 
	Fri, 17 Nov 2017 11:23:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Fri, 17 Nov 2017 11:22:59 -0800 (PST)
In-Reply-To: <20171117175338.48565-1-stefan@agner.ch>
References: <20171117175338.48565-1-stefan@agner.ch>
Date: Fri, 17 Nov 2017 17:22:59 -0200
X-Gmail-Original-Message-ID: <CAP9ODKrbKbuiMp8BGfaVi1DyNjS-YgR7f_m3m0sR9D1pent19g@mail.gmail.com>
Message-ID: <CAP9ODKrbKbuiMp8BGfaVi1DyNjS-YgR7f_m3m0sR9D1pent19g@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] openssl10: Upgrade 1.0.2l -> 1.0.2m
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
X-List-Received-Date: Fri, 17 Nov 2017 19:23:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 17, 2017 at 3:53 PM, Stefan Agner <stefan@agner.ch> wrote:
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Deals with two CVEs:
> * bn_sqrx8x_internal carry bug on x86_64 (CVE-2017-3736)
> * Malformed X.509 IPAddressFamily could cause OOB read (CVE-2017-3735)
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

