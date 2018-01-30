Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 766F37885F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 07:09:32 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id n17so6529143pgf.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 23:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=EE41ngeGxZtxf4i+zjGn7M1BYbHz6yKebuMnM4MqE90=;
	b=XZfGhR9Pe9h4zgUx2mXHANUoqva5yDLClLknGbDSkx0gA3UGCT30jEoqIQcATVTt7t
	SUfhseIBjHiGzVeSX3I3PR2Tk3Y/k6vIwsQHKmd6zr1aBbZRVstoz0l+MzbvYWmvHYVh
	yjuAJjjaS0dNaVpfEYrDr3Wv61sFefgKXJCRxwX6PweXTDqqf4yKr368bz+YKs4O9ijK
	z9RdOzwqLvsZOf84xPDmzO9VVHFhxVdgjZZ6L9aEKnfklUN5dC6gmQLeQD4ENxzgWZMW
	zNCgx7JHy9XPyc7gZ5SaxomDWdhxBT+p0Chx1bfYGJ3Ure/BRtvK+D6q0HB9r1kV4156
	GjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=EE41ngeGxZtxf4i+zjGn7M1BYbHz6yKebuMnM4MqE90=;
	b=RpIJ1E9g4zNJr7/p24WWm64jgh+b63salLjBbkXKmnsp549yLQkHSTovoslzlYaW5G
	wEfeMUNUGx6hpvgjr5yKydyz5YT9lYOaWBuc4DfmyOTubZpUt67Ctbhj77vwR2Mnk83A
	ORzp7JFi1eeYhH5ugGnIZRJUrj2zGs6ok8NRqIkKk/LXKzS6/ynCjPm6qq3V8ozmRGPy
	4TBgrd15AfU6Jl0ugWMu4+Mt+eGtf1SxswGExlLRNTTsah1F/yl+AO7MFbXFmLNhVboQ
	QJKpbYDxyPnxy2xTA3P/b2Xo0rAoTrS3gz4c5OUBh2Ru6wEKkIKOJFTGgHnFvL2VKKyD
	KTeA==
X-Gm-Message-State: AKwxytcfmPO43sKOb6K+D+evdLYVSLnYHhBaqMc9JDMx/MwIaYl+ESNb
	Nh62Nrfx2rYDCCZ7Wo57XqnZvpRqUMsOQhttPCg=
X-Google-Smtp-Source: AH8x2254pXhskvFOYpsGwl0dLDGKhu/y2d73G8iH++8tCHkZzp2XKKUEcSEiLeqwCBu0XTZ1vNHjp7drgtKpnpE2Dac=
X-Received: by 10.98.156.71 with SMTP id f68mr29667261pfe.29.1517296173424;
	Mon, 29 Jan 2018 23:09:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.161.170 with HTTP; Mon, 29 Jan 2018 23:09:03 -0800 (PST)
In-Reply-To: <20180130050427.15542.79226@do.openembedded.org>
References: <cover.1517286478.git.raj.khem@gmail.com>
	<20180130050427.15542.79226@do.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jan 2018 23:09:03 -0800
Message-ID: <CAMKF1srjFo1qMX+gvvTzqeYQPon3D6TuGkU0scGHC_yu1xdGYA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFVwZGF0ZSB0byBiaW51dGlscyAyLjMwLCBnbGliYyAyLjI3IGluaXRpYXRlZCBmaXhlcywgbXVzbCB1cGRhdGUgKHJldjIp?=
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
X-List-Received-Date: Tue, 30 Jan 2018 07:09:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 29, 2018 at 9:04 PM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
>
> Series: Update to binutils 2.30, glibc 2.27 initiated fixes, musl update (rev2)
> Revision: 2
> URL   : https://patchwork.openembedded.org/series/10739/
> State : failure
>
> == Summary ==
>
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
>
>
> * Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence]
>   Suggested fix    Sign off the added patch file (meta/recipes-devtools/make/make/0002-glob-Do-not-assume-glibc-glob-internals.patch)
>

this has been fixed in pull branch

