Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id BFB3B60236
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 15:07:27 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id n1-v6so30102366wrt.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 08:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HaBN2kFU4/cCwxM16sezacKs7fv2StjSjnduGr8Xes0=;
	b=Fcxydlzkj2co+DXiuxhEj/NPv9WbFEb7hXmvF+Mdp+61i04QJ4ZX/x5MGYz5lsyIR2
	WGKk+351tOSPthAtmONbCbg3atJsm40CgmloFcTywnznp1htnY9asQCD0LIgR1Kk3Vn9
	d8JlUKRMZdRx753nGjtnDbwRzRUopKcS5DaLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=HaBN2kFU4/cCwxM16sezacKs7fv2StjSjnduGr8Xes0=;
	b=oGDKKpZl5HrodncN05tKMpnWBf83Lz0p1BOvadu0c18Sux2mWjDhlKrTwzs+eswPA1
	NIgwmNH9QNCt+GFEnanv9Fpoikz0W7CgrB39f5xW/rtYl8mu+CbgtOnr+yX3+qK5jWT6
	ZABd9BsF9iT9wxjHu3CF0uUZXv4g8abcE7X3/PLSKigPYNCu9jgBA+Svz0P+x41eS7yW
	mFGYK8XRBw58dOgGdrpxnRzoPnhVbsWHwPU8ChJ18tzoIYLlFUFh4BH8UT8cR8WiW5g1
	cHmJM7lkYzGwAjzShXj2HPylm1/0+zalsqLE6ziwdltJrsNJ+9Jsvf9usxGvtW6j+LZ6
	W2Ag==
X-Gm-Message-State: ABuFfogUcogOjh79KytyvOjBu3aRsQoZ0dLJKNJYA9LRftdGl4u+wxdd
	Qh0d1wrCNvYDfGOxVzgL3V/u0w==
X-Google-Smtp-Source: ACcGV61X0rNmqx+JgHM1zWrDzUvMi5lXV8YAs8AeYEppwGYVu23taubgCKbKS4fCZ/oQHC3t8z+9Tw==
X-Received: by 2002:a5d:4d09:: with SMTP id
	z9-v6mr23620576wrt.298.1539788848141; 
	Wed, 17 Oct 2018 08:07:28 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	4-v6sm2499088wmt.16.2018.10.17.08.07.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Oct 2018 08:07:27 -0700 (PDT)
Message-ID: <40a5b6dd1386ea77070814f7ef7ad340cc2e9e62.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 17 Oct 2018 16:07:25 +0100
In-Reply-To: <CA+chaQcjv6-2v8oC25=7fapKKg5XapC21+6K1oN28Kk9MJF2zw@mail.gmail.com>
References: <20181015182128.13115-1-kamensky@cisco.com>
	<CAJTo0LYWG7O+VryaFi9r4kc5JagPtuynWHi9gV6nV+cLPUw+SQ@mail.gmail.com>
	<9f182627633f75c8383901510cc11e4b87349084.camel@linuxfoundation.org>
	<alpine.LRH.2.00.1810162250430.53155@sjc-ads-6991.cisco.com>
	<118f12f46497b3b4fda287b64c5e432afde9b6d9.camel@linuxfoundation.org>
	<CA+chaQcjv6-2v8oC25=7fapKKg5XapC21+6K1oN28Kk9MJF2zw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemtap: 3.3 -> 4.0
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
X-List-Received-Date: Wed, 17 Oct 2018 15:07:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-10-17 at 16:50 +0200, Martin Jansa wrote:
> There seems to be one more issue in current master (for which I
> haven't seen a fix in master-next or ML):
> 
> ERROR: systemtap-4.0-r0 do_package: QA Issue: systemtap:
> Files/directories were installed but not shipped in any package:
>   /lib
>   /lib/systemd
>   /lib/systemd/system
>   /lib/systemd/system/stap-exporter.service
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install.
> systemtap: 4 installed and not shipped files. [installed-vs-shipped]

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3b77e7b7852549dcfbc426d4ce258e6e857c0acd 
was supposed to fix that :(

Cheers,

Richard


