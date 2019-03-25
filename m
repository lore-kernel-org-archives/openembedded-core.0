Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id 9E1817C6EE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 10:13:04 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id p10so9412070wrq.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2019 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=lDwb4Zzz1s8b3FnwnaAMvQOkAbyRIJ9hKnZxoH9ksdc=;
	b=fZLlUHVqyZnEPO9QMVM3DfYmZJ5DhUMIeEZzFh6cikT4k55TVRr3BRVb0cFN4uwGvd
	K4/XPRpQG5e2CXmkaSw2boKMhZ/I7k1Ljxb/Xrk9WEJ0Dgz/Gf2H2NUUpTxnFgiwgTV/
	aJr9C+4nTJqh/2K+NGsCsG3FdavGJUNWhgwEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=lDwb4Zzz1s8b3FnwnaAMvQOkAbyRIJ9hKnZxoH9ksdc=;
	b=oip1DoOA6lX7AGFgInNZ0RIX0MW8r7CFfxQA5/OPGVHo8nTwWLTbpdpXgh4p5vH98R
	VEFcCLZ9hEaTKhZn/q1/FbNjhutSDxgk4tzvN0sJxU9qFZSLHh4a6JDr04BmoPe/x+FB
	XfiZoMdD7rjx6XKG5GoY3i4o4QQCyWDrr1NweOwxU2eK+TjkgJ2gi4pTHxd4/Lt86Crl
	rlv5+JU0TPEIzKCZ9/9UwhBP6R6g5L3m2q0TOF6NVBK4nPwj+o+xn2RkhBgjRtksa50v
	bGzo9A6muZXv+V9v0nG/7hYhWsVqx2r4Jwfo0ax1xo+08xbdnUF/c/kp91idEEoOngFM
	mbTg==
X-Gm-Message-State: APjAAAUxgK2gPtWtpsva7PzPv8C9/eKmPN44bpRdqvkzH7d3185UQFUr
	x1T2ai/zgv88QkaTTBJJjMmldA==
X-Google-Smtp-Source: APXvYqzDD5/aBrhBsmB9bw659/IOh8nzxrUA3nTP3zrQMxuT2Yw5twpXNxgWdKMKpjOu+TmOdQ6OOQ==
X-Received: by 2002:adf:f7d0:: with SMTP id a16mr8230319wrq.94.1553508785279; 
	Mon, 25 Mar 2019 03:13:05 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z9sm18732827wmf.12.2019.03.25.03.13.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 25 Mar 2019 03:13:04 -0700 (PDT)
Message-ID: <516633b3f2bd6632acfd305e98e1cd5ba89be580.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Hardik Padhariya <hardik.padhariya@encore-research.co>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 25 Mar 2019 10:13:03 +0000
In-Reply-To: <000e01d4e2d1$15d3c7b0$417b5710$@encore-research.co>
References: <000e01d4e2d1$15d3c7b0$417b5710$@encore-research.co>
User-Agent: Evolution 3.32.0-1 
MIME-Version: 1.0
Subject: Re: Unknown host error while building abiword
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
X-List-Received-Date: Mon, 25 Mar 2019 10:13:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-03-25 at 11:37 +0530, Hardik Padhariya wrote:
> We are using Yocto krogoth 2.1.1 for imx6ul evaluation kit
> "mx6ul_14x14_evk".

krogoth is quite elderly now and hadn't had security updates for a
while.
 
> While building the abiword tool using “bitbake abiword” command we
> are facing the following issue.
>  
> “
> ERROR: Fetcher failure: Fetch command failed with exit code 128,
> output:
> fatal: unable to connect to git.gnome.org:
> git.gnome.org[0: 209.132.180.168]: errno=No route to host
> git.gnome.org[1: 209.132.180.180]: errno=No route to host
>  

gnome migrated their git services to git lab so the urls changed. You
should ideally update to a newer release of yocto. Failing that,
configure a source mirror which has the needed sources from several
years ago.

Cheers,

Richard


