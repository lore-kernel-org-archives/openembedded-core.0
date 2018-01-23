Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 530CA78622
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:38:45 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id k15so767387oib.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 08:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=AttLO8doeIk2ZgR44shNpVEcU+Y/XmnxvLlFVakjIqM=;
	b=xRJQeUC7gzctrZrn71cot32xHaCn1mOspM97tmTEG6yOVBe7JaMkZi1glvJ5Du7nfj
	6LommQKIIvSWvJFYX7MkkHolN6Yk3Sst6C9Pex9d8xCda2n7X8pVi/tCimHGDmz7h10L
	Zhef0FEy6swuOWCZpz6cm1vwHEtjb5JP2H6LHRpZwMzKs8Pz95iFj10r6zNAxpTQsMHs
	H5gsVGamTTQhvMFZd71Jof8HUJH2mJo9bYs6EB+nxhJmvh3mMrGNgl3koadKHNUgWzjX
	gxRmbtnaju2FN1SmbymEg2A+zQWLD/BOz3Os90KtzSi750ybESHM7OquL9TGL2Z23KG3
	0pFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=AttLO8doeIk2ZgR44shNpVEcU+Y/XmnxvLlFVakjIqM=;
	b=DezQ3rJJheeaIjSf05gnd5Ft/37SKrS3XMERxc/lvbn2ksDyjTl9HmzRghg9sVpMQA
	8AVue5y5NPnts2V1pJaUcP/UymxdXrBoYs1PZdsiCj+1LOS/VJx6HWKRLqdsgCKDZmXy
	eDPpV04IHYzFN695ClkvNweN2Q6sNOfZerixeNkKZLz41Q2myitrlLK8+jHL/gIT4UM1
	Hw7W+PglV32OqaUVS2R6dsQc6ukAWsk6POZzUqckh9eLalVSrkrUSNEcyxpOkoYV55v8
	qFFjW7ubu5uWOLxFN+3hQ0pAArbaGVJh5xKpCr8nijkWR+R2kq264JdSK1+rDmg8hvHs
	KE1w==
X-Gm-Message-State: AKwxytdp+lj4ZUxTtEmWziv/RlIPXqFVF59hGyqkKQ6v/gYBy9cVB61h
	aaGGhLGk9uVFwtZ7MuEVrLACjlCi
X-Google-Smtp-Source: AH8x226hkIr8XpxqQg3O74O/USW8V0sqnd/13+QIiXQMW8IBqY2Frb9IMWmAfptQtCMZy6glIXhAaw==
X-Received: by 10.202.69.69 with SMTP id s66mr6642512oia.346.1516725526928;
	Tue, 23 Jan 2018 08:38:46 -0800 (PST)
Received: from mail-ot0-f174.google.com (mail-ot0-f174.google.com.
	[74.125.82.174])
	by smtp.gmail.com with ESMTPSA id m46sm313501otd.44.2018.01.23.08.38.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jan 2018 08:38:45 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f174.google.com with SMTP id a24so949483otd.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 08:38:45 -0800 (PST)
X-Received: by 10.157.85.18 with SMTP id l18mr4483335oth.177.1516725525204;
	Tue, 23 Jan 2018 08:38:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.92.130 with HTTP; Tue, 23 Jan 2018 08:38:44 -0800 (PST)
In-Reply-To: <20180123162136.11518-1-alex.stewart@ni.com>
References: <20180123162136.11518-1-alex.stewart@ni.com>
Date: Tue, 23 Jan 2018 14:38:44 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoMyvM-bAQLx23ATNQb3qgm_YTKr0jYKMy9H9MdcvtpCA@mail.gmail.com>
Message-ID: <CAP9ODKoMyvM-bAQLx23ATNQb3qgm_YTKr0jYKMy9H9MdcvtpCA@mail.gmail.com>
To: Alex Stewart <alex.stewart@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] recipes-core: breakout hwclock.sh from busybox
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
X-List-Received-Date: Tue, 23 Jan 2018 16:38:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 23, 2018 at 2:21 PM, Alex Stewart <alex.stewart@ni.com> wrote:
> * Move the hwclock.sh initscript from busybox into its own package and
>   recipe (hwclock-init). This script is generally useful for distros
>   that get their hwclock implementation from sources other than
>   busybox (like util-linux).
>
> :busybox/*
> * Remove the busybox-hwclock package, as it no longer has a purpose.
> * If busybox is configured to include hwclock, the busybox package will
>   RDEPEND on hwclock-init.
>
> :util-linux/*
> * util-linux-hwclock RDEPENDS on hwclock-init for its initscript.
>
> Signed-off-by: Alex Stewart <alex.stewart@ni.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Sorry for being picky about it but I think it was worth it. Thanks for
your patience :-)


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

