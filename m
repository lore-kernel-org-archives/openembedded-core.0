Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 9672B71B69
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 13:04:22 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id a70so15628247oib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 05:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=ThPfczVASbHxdLuJzZUGjIWUIGNIWAog8e+ahhFVDGI=;
	b=EOcoXr3Zq8AKmvgvl9SZ9YdAtdR1ra37ipYtCWr1QBmYdo21GRHIlnImLJcR4/5wK2
	sbTRJFvarqWRkyT6LcPrGcQXv6sC24170PN9Q9dw+Qt3IGdbKDHVgoBBHXM1P4Na0I2Z
	1VGIoULs9hEefbi4S0xn32RKRfTERIzbjFL0OYVXoBjB5ybdWIoccMHHI7LgR9A2l0BW
	DLXtdTBz2x2jfFIsToz6B+onj4LWncX/Gmy27K2h5a/fmY/qoNg9cMGePwbJusr57DYn
	7nPRVg4bQkfAsbL4Glni+7p7nEH/FUy9Bvjop9Fl2efr1eA3c2eW/GyIHmkVBMWHiAOW
	5pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=ThPfczVASbHxdLuJzZUGjIWUIGNIWAog8e+ahhFVDGI=;
	b=n+/sEjMbi5WWOsVqlq9VQJxaUI2MuHvElGxROdHnyc4jSF5ied3tS3xbuYMUWBgRsf
	tVOZnr27Ibb+P7OoyfXzqbGSG9lvARzPS8Fx2XAuvVrFfCPwuy3OB0YK+a7N+CCMYmyY
	VyTBhAaGSPDdTPT4JMbfadoLgKQFkjT0CNCNMEAhXEpnFm9uhVnsJzfWQ65Ye7i1yG2W
	rFt3yEOSvq/+fPa1KqQFfW56WqF7OU+ld1NUrINLL+9rPM6V/JVOTF1weWDneu4kk/bi
	cPpKf8h/dHzkFUV9v/WKDd/rjNrzK9h2usHjkeIXxwH/vYNzIUWwuueRaa+hft5Glc46
	8E2g==
X-Gm-Message-State: AKwxytcaeZ/Utzeyzj46lIFAQVNM9JCjq+VSmSmTjMw5y7XCEo52Mfk8
	U9HyfNn+78sMGrE0vdacP1zZPumY
X-Google-Smtp-Source: ACJfBouY7AazHVWYQcnNHcG05PJF4zEtGiDHi4jxx8+J6LQ2+KP7DHVZjBE9GIcC4MR3caa7zGWb1A==
X-Received: by 10.202.49.200 with SMTP id x191mr2921745oix.197.1516280663333; 
	Thu, 18 Jan 2018 05:04:23 -0800 (PST)
Received: from mail-ot0-f176.google.com (mail-ot0-f176.google.com.
	[74.125.82.176])
	by smtp.gmail.com with ESMTPSA id 74sm2431648otv.28.2018.01.18.05.04.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 18 Jan 2018 05:04:22 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f176.google.com with SMTP id s3so19979754otc.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 05:04:22 -0800 (PST)
X-Received: by 10.157.7.164 with SMTP id 33mr3039517oto.276.1516280661614;
	Thu, 18 Jan 2018 05:04:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.38.102 with HTTP; Thu, 18 Jan 2018 05:04:20 -0800 (PST)
In-Reply-To: <20180118123804.2465-2-ross.burton@intel.com>
References: <20180118123804.2465-1-ross.burton@intel.com>
	<20180118123804.2465-2-ross.burton@intel.com>
Date: Thu, 18 Jan 2018 11:04:20 -0200
X-Gmail-Original-Message-ID: <CAP9ODKoV0Np+YvymtsTihv7pUp5Lpcbkt2=8=ffpGzEOzwo5Ug@mail.gmail.com>
Message-ID: <CAP9ODKoV0Np+YvymtsTihv7pUp5Lpcbkt2=8=ffpGzEOzwo5Ug@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cmake: use Ninja by default
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
X-List-Received-Date: Thu, 18 Jan 2018 13:04:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 18, 2018 at 10:38 AM, Ross Burton <ross.burton@intel.com> wrote:
> This changes the cmake class to use Ninja instead of Make by default.
>
> If a recipe is broken with Ninja then the recipe can set OECMAKE_GENERATOR="Unix
> Makefiles" to change back to Make.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>



-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

