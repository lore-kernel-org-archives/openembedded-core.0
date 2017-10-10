Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id C219D60557
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 14:58:40 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id d28so2780197pfe.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=+VuSHvfECci0A5ddkwkxAkLKWZUeo2xZSIuosv30sLs=;
	b=HPaFEg8Q83989dclrKQfYzuHecp3Og+Plvznm7tFoYNCj9jh5p0Zez0k+MTY6N82l8
	J4X1g95KHATr9Xy9D4MIt3QsrnEMHpfhU1wdgi2jzw+oMnHj2NcItNhKCD8DkUu2xrLS
	dxJ2Z4VaByMDG0Ylnqr8FgJ9KThCMTzjo4r/89IaIxanh1m2yIw72uSU0CCfDm2Eu68b
	w2t5jxtK94Wgbzx/P6SN1QaWjS22gXDH2J5JqkpQ5JrUXK9OBlQEqmiHotOX4A/8eVo5
	GXXh6VY8i5EpyYrTorO2KDjVeU1KCXYL4sPzy1qO6UA8CErgB3vtOSkan863RidokMgA
	r8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=+VuSHvfECci0A5ddkwkxAkLKWZUeo2xZSIuosv30sLs=;
	b=o4AnwUM1gf7bT1E1JpwLIvpLhGJujEHpnHPPLohmeGBDv/QSd4qK6eRaq0IUzAj9I4
	Nwbqh69kFx7yD/7P/YbdfGEQ//+whAggucG8Nbb+Pio4+IXQ1k7KppR7UnHpqdmhXPRf
	fsvbicLu8CrTMnHo6QlfLdY0bEKW11AABvlt27eXdy8cmr2XY+AS3skBv7fEvtJdYDaQ
	lWhr50SbBxS/N8UWep9GldcT2/6YHvIh0Acstg4MI9ol6UAP4s3ZBhCTEBzDzA4E7kc4
	PTGPtLhigo777gSxs2ZljI6eg+Ae5/Q6VTAeAJ7yb5oksnRryur1Cbb01PA+GrhAF+ZT
	Oqxw==
X-Gm-Message-State: AMCzsaW4rs85lcd7FbaUS6Pdj+0/CnROflnupPmUfJ0A5WElmmhOouOw
	lDf5ignWkMj2THFvL4B/8rnuyQ==
X-Google-Smtp-Source: AOwi7QAP8E5Bnql8/NCYbwuS8Nav5f2huLjhyRYxsk7HOG5iMOpc8Q8/BXWrZq2HvAmGNnLfkH37/A==
X-Received: by 10.98.138.6 with SMTP id y6mr13874767pfd.149.1507647521892;
	Tue, 10 Oct 2017 07:58:41 -0700 (PDT)
Received: from ?IPv6:2601:202:4001:9ea0:285d:9f92:b7c0:627f?
	([2601:202:4001:9ea0:285d:9f92:b7c0:627f])
	by smtp.gmail.com with ESMTPSA id
	f11sm14855159pgp.48.2017.10.10.07.58.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 10 Oct 2017 07:58:41 -0700 (PDT)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-core@lists.openembedded.org
References: <20171006121259.5817-1-git@andred.net>
From: akuster808 <akuster808@gmail.com>
Message-ID: <2518c75b-b1b1-cd16-213b-94cea6f3abee@gmail.com>
Date: Tue, 10 Oct 2017 07:58:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20171006121259.5817-1-git@andred.net>
Subject: Re: [pyro] some backported patches
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
X-List-Received-Date: Tue, 10 Oct 2017 14:58:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Andre


On 10/06/2017 05:12 AM, André Draszik wrote:
> Hi,
>
> Can these fixes/patches from master please be applied to pyro.
I have integrated this series into my stagging. I ran into a build
issue. I need to sort out if this came in with this set of other
backports I have pending.

regards,
Armin
>
>
> Cheers,
> Andre'
>


