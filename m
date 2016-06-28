Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 96F926FF4E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 18:30:02 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id c2so34149878vkg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 11:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=FDIUEkRf61KlHhJb5h0VtR2EOBrd77I/3ZziSnp+9c0=;
	b=r3Xwc0pirsiNgawDeGYqk0MAirnHADIg2Gv8eOhd8IxfWiW+p/BcKtVU1rECQLexz+
	mxACdSptl1Io57xvHOP6Tgc1WGLrODUgHg/1V8PhHbDBXOB3xLY/OzjADKxYME2k55j3
	ybPmQBRolciTtxKYfowdwNZwoZYYHNKRJQcaQO3cWS9uGxopjvVGuRQrpbr4R/eyVBiX
	jIkB00O356f6g14kR2Wd0dbMjxb29q33Wid26k6NgwK7i7siXc6bzxiIioPcEPbRcNLq
	MOlQG+Hj4KRUOj4yNVBbw1P1B/fFJqenwaD2+AFKC+Pws1PwOEttTSbTK2kY03Kz7pCg
	IM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=FDIUEkRf61KlHhJb5h0VtR2EOBrd77I/3ZziSnp+9c0=;
	b=lem8joJ4Nwb5odRuOlH1KeMBz/lAhlDEMcHO/jXc92UbwdS7yhRlNafD5Urt/WwuOe
	bWmXoV3Obrs0JdGhglaMd+dkBSI79pGa03DBVwLBh2cXy3fn1KXaloz/SbAACAELVOBj
	pw1heBByYdkUsw8Xdv/jAa5poxYjQnYnV5Km/NbfpwOn4uSbJORz+Rs+KD5ZO07XeLyT
	TOZg1n0EjaD6B1mQeDKJsDgwLycwwm3wUtpJi4BGpR65E+3gWLS+Vs+73lNrOcZnolYM
	3HjYihYwiBNx0YHZDqNd1GdUULXLglG7hOQ2ZUKSN7zloPvhh6i4QSgvimXfgfcWRhuA
	emRw==
X-Gm-Message-State: ALyK8tKjmpIA2T2xDQMUN8kswE8ZSUaIT+ZRfRgQciUWk/xLP3j0qWkT/DeVqVs7y9o6/A==
X-Received: by 10.176.67.99 with SMTP id k90mr1439712uak.152.1467138602814;
	Tue, 28 Jun 2016 11:30:02 -0700 (PDT)
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com.
	[209.85.213.43])
	by smtp.gmail.com with ESMTPSA id g4sm5385485vkb.3.2016.06.28.11.30.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Jun 2016 11:30:01 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-vk0-f43.google.com with SMTP id c2so34148596vkg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2016 11:30:01 -0700 (PDT)
X-Received: by 10.176.7.102 with SMTP id h93mr1320201uah.70.1467138601105;
	Tue, 28 Jun 2016 11:30:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.192.195 with HTTP; Tue, 28 Jun 2016 11:30:00 -0700 (PDT)
In-Reply-To: <20160628151225.11344-1-otavio@ossystems.com.br>
References: <20160628151225.11344-1-otavio@ossystems.com.br>
Date: Tue, 28 Jun 2016 15:30:00 -0300
X-Gmail-Original-Message-ID: <CAP9ODKojqk00JMZSu9ug-Kab6ZsBnsRUKvxpoYFbNdVV=XCgbg@mail.gmail.com>
Message-ID: <CAP9ODKojqk00JMZSu9ug-Kab6ZsBnsRUKvxpoYFbNdVV=XCgbg@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Avoid duplicating custom QEMU options for AArch64
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
X-List-Received-Date: Tue, 28 Jun 2016 18:30:04 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 28, 2016 at 12:12 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> When detecting the second serial availability we shouldn't append the
> custom QEMU options otherwise we will end duplicating those.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Please hold this patch; we found another problem and we will send a v2 for it.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

