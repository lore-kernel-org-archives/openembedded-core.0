Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7BB52784D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 10:11:47 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id r68so17358854wmr.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 02:11:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=X4eNhi0J6az6N+4g8k3kB2tGGqlzxzZznS64diybSqc=;
	b=Z/8ImZrePXlRxHmLe9b2+jMnQnBWt4/ceGwA7O9OwjgxlwPy7SlGTUg6v8hlW5hQjk
	A9xaTt8NRiwRMUjko1aSw5sdaBxltVXpCErdAtTgfqByNhvdXNTyPWvb81QFeHu20WsH
	W+Er5OJAafDQHjVBY6z1d5b2J2eHk71XkLrmqQ52Ei3OpI7B0dZLPl4we38mxeugPnXB
	xlfZcVczYbDTl5U/pB1m+iwnNX17FY3mYQr8avJmV5f/NO2EeTK1d7J1MvISL7Kp/0iR
	wyGlBGPPqckPB0AXyimdInLsUxk3oRgxzaIzKNQxQ5smA83AG68lijpfUGVf/nzQsSg6
	5wag==
X-Gm-Message-State: AJaThX4VjVyF6nAp0LAroJzRKw+pZl5hFAMz83LLa+L9wK1s/PKwA6Mj
	jRBf158ZSrbpkD1JrzpOKDAJWMVl
X-Google-Smtp-Source: AGs4zMaeaq4MNXs71jU0aeJhIQwRAhdCZGBPCGBuzKyI6O8EGf1403x+4M5q0kRQaHCFrk2h2w7/7w==
X-Received: by 10.80.144.248 with SMTP id d53mr16176407eda.234.1510654307858; 
	Tue, 14 Nov 2017 02:11:47 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	88sm13621313edq.49.2017.11.14.02.11.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Nov 2017 02:11:46 -0800 (PST)
Message-ID: <1510654305.4049.60.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 10:11:45 +0000
In-Reply-To: <1510668898-21058-2-git-send-email-shashwatx.pandey@intel.com>
References: <1510668898-21058-1-git-send-email-shashwatx.pandey@intel.com>
	<1510668898-21058-2-git-send-email-shashwatx.pandey@intel.com>
X-Mailer: Evolution 3.26.1-1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/1] Image_types: use ustar format in cpio command
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
X-List-Received-Date: Tue, 14 Nov 2017 10:11:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-11-14 at 22:14 +0800, Shashwat Pandey wrote:
> Using ustar format due to ROOTFS size exceeding issue.
> Ustar supports up to 8GB.
> Where as newc support up to 4GB.
> 
> [YOCTO #11674]

Do recent kernels actually support ustar for initramfs? I thought it only
supported newc? My 4.9 kernel certainly still only mentions newc...

Cheers,
Andre'


