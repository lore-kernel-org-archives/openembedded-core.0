Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1C2B57D9F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 13:49:56 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id z4so16241789itc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Apr 2019 06:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ENlJjqjcEfbNPhJHaEV2szu5GMVpxCKGVDsSpKZS+EI=;
	b=xsUebTP7FU4GS/PQf2FL2xHnSoPz8ul/iXRVZGQw9+zaxusLrHqT2O2H+INsXLXNod
	SCTaBIhdjYeRNfUss2zyW/xHyCCMEqjORwEXHVs9Typ9xQSkZEUeS5TQiwADYubkdTLH
	DMgTmmXc0HhInf6VSp5vCn2UQ5usiVskYyKnuh6FRxWSEf0VoNOJj8grn4+HP108ihdI
	0LWHC9Fv8EW566WG02k4DBG9/hELPxkXMcTzb20tcrXaK6DIZH9TZLPQCwP95gCPwC3X
	GuNIQB4hQLfX9HS8dZheH1NfUN+HlAwa3ER1xbWhZQKJDpN4fCTdFKcyb02+4yutTXRu
	2c2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ENlJjqjcEfbNPhJHaEV2szu5GMVpxCKGVDsSpKZS+EI=;
	b=Aej6W/H7v1cnhWlV6y0OtIjAAhYjgLr9aTiUzXqKpz7ao73HRUyOc2fnUowZ/WnWHZ
	oiRu87owsN50ftuJKUGbYmfZfMUdxLbWpHy46qNAKl1uUmHgyHZSOExxf4V9/8POhOpy
	EuzVAZYXW9wupcXwgS6duu0KryYwPb5HcryUEnDFiWEstHq6AW1oNJYfm5HkQVjg5Lae
	2eLgye7YpDjG4oTJ4I7oPE/vWAxjDaUm/JbGBKgh/0lWZf//7b30bj/Nk7IqyVSKH7hg
	TM1D+LTdgSL8foq3zU5yg4k/eDGHwKqWLqS93J5nwFQWt5LwNxLBvTo4+/Cl0DpvW7aE
	QElw==
X-Gm-Message-State: APjAAAUf1pVg7ucue5rTeN+5HPzzooqZba1FKYfT7xqx59Jr+AmHwEfi
	Jyui1bOuNBmU5KEN5zQtMpJshpsrJN4qbdqUuYqSmCM1
X-Google-Smtp-Source: APXvYqwXEwzj+8cDv5gXCRxIbyHTMee3P6/F19vqKhoVesJS6rsGcC8hB4iDqH3W5MnfTvbUIJGJKrKtZOcr0eAIgQA=
X-Received: by 2002:a24:5ccf:: with SMTP id
	q198mr19911705itb.130.1556545797175; 
	Mon, 29 Apr 2019 06:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
	<d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
	<CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
	<a45f59b03312a7693bd5d4e4ae04c600@basmevissen.nl>
	<CALbNGRT_FRQfA0jpP7DHsFOxnt97JW-KEjyGXOkW9V2w+Ujgyw@mail.gmail.com>
	<CALbNGRR_YxL=+u7Kc5x8OiTXLFhRjqK_jp53xB5Q_9WZS-rZ+Q@mail.gmail.com>
In-Reply-To: <CALbNGRR_YxL=+u7Kc5x8OiTXLFhRjqK_jp53xB5Q_9WZS-rZ+Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Apr 2019 14:49:45 +0100
Message-ID: <CAJTo0LY-Bi=+jScLhTVB1tiX3PYJ7WX82cx8+vF976impPCFMA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte-native: reduce c++ requirements from c++17 -> c++11
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
X-List-Received-Date: Mon, 29 Apr 2019 13:49:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Apr 2019 at 14:48, Andreas M=C3=BCller <schnitzeltony@gmail.com>=
 wrote:
> So I see two ways to go:
>
> 1. set vte-native requirements to c++14. That worked here with
> CXXFLAGS_append_class-native =3D " --std=3Dc++14" but looking into logs o=
f
> centos 7 there are several '--std=3Dgnu++11'. Have no idea where they
> come from so chances are high this patch is going fail with c++14.
> 2. revert vte back to 0.52.2 and forget the idea to get recent
> gnome-terminal back in near future. That requires vte 0.56.1 and was
> the reason I sent the update here.

3. Don't use vte in qemu when building under virgl.  The gtk
PACKAGECONFIG turns on vte support unconditionally but from glancing
at the qemu code that isn't a requirement.

Ross

