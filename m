Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by mail.openembedded.org (Postfix) with ESMTP id 775817C71B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 13:44:39 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id w25so16461096otm.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:references:in-reply-to:date:message-id:subject:to
	:cc; bh=6O591ajbi5kFQESXB8l7E+kt8TB0UBsbj6FjnNgWkn0=;
	b=YO4w8PSm3XjiVcbBzNa2Qb2PZaDYWIMwodgspL78e1zXHddbDi1TIdQtp+rM2veXgN
	hyZ7yjawWhES9Da04LwrM5wRHG+sMRPJyCbcYR/ACTwaQVhWyrq4L0kmdNcc2iVRzGu8
	LJ3EXll2lDAuWi6mJSPOo2MuKyjoSSFexXcIZa+f1jYewRLhEJIx6MC6SO0wcqR5VJgu
	yA6KWCxa2oZ3mi8ja1e2jGPA+WMPddh5Fyq3a7FNDamG64GNm3y2chpjXL4YhSV2dzEL
	5O0052460H/Y53Z7Pnr5+2FQBiAyGAXqDTUCypbsUFIzrkx9MCHA3dg4fr/oEEYoj9Rv
	nqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:references:in-reply-to:date
	:message-id:subject:to:cc;
	bh=6O591ajbi5kFQESXB8l7E+kt8TB0UBsbj6FjnNgWkn0=;
	b=faUxNUnQ9L9tAVRAnQE08cJfELw1W7MSDBRgmOxUsg+mTw4iAZj0sfebDQfGm7VtXY
	hQxzKZz0u5vr+m9fhWds6U7acLE9hmiC8OqpXwnhZWVUockEES0D0Yidf2AkEMyEUtJA
	9vHuAW6Fum1q/vCdtACtITivdF/eORdxKpnE46t1QisdiwWiSV/IY/zXI/gPbzAOdX/N
	BZ/8ET/5rEsAngwNDvpmggczjLJr8VxIkyWks/H4XLjONyMwiWpspAmxyTOlzQWz2Sac
	WsIi8yp/LJ6tdL2UapNvaFfNwbvP5lha7unSMBnGnzup2XDqZQfBIq+n00tHdFdRurob
	UWVg==
X-Gm-Message-State: AHQUAubca1nGYKTRKW4VFvB4/4HOn6LlGXmqftVYLTvp5R5BsWO6RXtA
	eoyv5mi6aD+bjI0JUoVJl2TyM7EmKg2Kew==
X-Google-Smtp-Source: AHgI3Ib1mBcgDcv5RwnpO2NN9Jjs8SARNzByEJWA1T1k0iSsezYsfKTmyxnITPWdpuQ3mYmfkfZPQw==
X-Received: by 2002:a9d:c61:: with SMTP id 88mr5985970otr.335.1550238280230;
	Fri, 15 Feb 2019 05:44:40 -0800 (PST)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com.
	[209.85.210.45])
	by smtp.gmail.com with ESMTPSA id d11sm714957otp.18.2019.02.15.05.44.39
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Feb 2019 05:44:39 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot1-f45.google.com with SMTP id 98so16613025oty.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 05:44:39 -0800 (PST)
X-Received: by 2002:aca:ecd5:: with SMTP id k204mr5479920oih.153.1550238278841;
	Fri, 15 Feb 2019 05:44:38 -0800 (PST)
MIME-Version: 1.0
References: <20190212054754.2801-1-raj.khem@gmail.com>
	<20190212054754.2801-3-raj.khem@gmail.com>
In-Reply-To: <20190212054754.2801-3-raj.khem@gmail.com>
Date: Fri, 15 Feb 2019 11:44:27 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoZoL7avYWkVTihunZXdZ5AJ9NPv6N3nL=Uk1geN+Vr4g@mail.gmail.com>
Message-ID: <CAP9ODKoZoL7avYWkVTihunZXdZ5AJ9NPv6N3nL=Uk1geN+Vr4g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 3/3] image_types.bbclass: Set memory usage limit and CPU threads for xz
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
X-List-Received-Date: Fri, 15 Feb 2019 13:44:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 12, 2019 at 3:48 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> when building with opkg backend and huge packages e.g. chromium/llvm all
> going in parallel, memory pressure causes xz to catapult with
>
> do_package_write_ipk: Failed to create package, opkg-build failed with: xz: (stdin): Cannot allocate memory
>
> since there are many tasks going on in parallel, xz adds to memory pressure
> and it wants it all, put an upper limit for memory xz can use
>
> We add a variable XZ_MAXRAM with 30% of RAM limit and can be customized
> if builders have more memory one can set it like

The commit log refers to the wrong variable name, it seems.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

