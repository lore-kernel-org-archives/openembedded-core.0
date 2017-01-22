Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f194.google.com (mail-ua0-f194.google.com
	[209.85.217.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7FFAE71B32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jan 2017 21:31:28 +0000 (UTC)
Received: by mail-ua0-f194.google.com with SMTP id d5so11864115uag.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jan 2017 13:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VAujp9I3Mxz7rfwEpLHIP4HE9djFvPP0Szn8cYIkaK0=;
	b=G6CV67oGPpM++EOa+BLa6ISFVyHECF2dg74az6h2G7YdrHkiLMqwh8GMH4KLzw3vOZ
	Z4fhzY8J8nEBL2/R6B9OLLnIaMf3dFLneWZ4MBBr3525wIrMGWG2ep5Udn/BB0RcmkbG
	zAz/fd/SxAm/AYViyDhclSc9v4vowdAyTLmlYunlqQzQ/XgElin5Jw3tukakL1Z6MKSF
	dguc/mKUoK/yOWBibw+zOY4D4MGOxbA6LZcy3iqTGeDsA+aLfAfwU5UIDU+wpLNI32nQ
	euu7CEyW5wunK2Tm0pUjiZy88EdxJehJ3Qj/KGOMcH/rEYjIBiJxveOD5weieqcF2x4o
	uQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VAujp9I3Mxz7rfwEpLHIP4HE9djFvPP0Szn8cYIkaK0=;
	b=GffDO/C+1cu7Qy6s0E9DdJ6vtOFP6ee+d620C4Cs2y0WNTuWZT0Fu1unRQA6ajQ0zy
	14q4v+uG0T8VzxryrNNCj02fJ9CnrayFdPgyKOuodKdlOMtKYbiI0N9flziSBMeQSamA
	BTHpQueI8AHzRSPjvoHKli99eok64PDa5jP/+PDxhp9bFAuVJayrbGTcIGgJoNQgLCxR
	T/JVcSsZN4gcF+PC91TywGBMIT0GDe0FX1Vbz5wlVyAEeGuArT7N8yt8Hnw02i97p0Dr
	5jDNuzQgi8q6/JR/KMJroNPbix0y/cPHQv9IxVWyzOlduTX/HPDWNAV8GndanwVwrsgy
	E7yA==
X-Gm-Message-State: AIkVDXK5Apc4jOL7OJ1Afjpf/s9wXg+IMnI1v+TL7Y86D7ksdMS8USn/a8PSPQgkUSFjadzL758KfnuMUzXLiQ==
X-Received: by 10.176.66.66 with SMTP id i60mr13786429uai.131.1485120688506;
	Sun, 22 Jan 2017 13:31:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Sun, 22 Jan 2017 13:30:58 -0800 (PST)
In-Reply-To: <CAJTo0Lapvqydn_Yv8Cqg5tqYwgZDN299sWc3Pu-EQH1Ja6K5oQ@mail.gmail.com>
References: <1484264021-28569-1-git-send-email-sgw@linux.intel.com>
	<CAJTo0Lapvqydn_Yv8Cqg5tqYwgZDN299sWc3Pu-EQH1Ja6K5oQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 22 Jan 2017 13:30:58 -0800
Message-ID: <CAMKF1srpzZGPQTQFrpK1XHnkCqHyZu+GQ7+=dWRd4JOWQ2CEAw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] xserver-xorg: Enable glamor by default
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
X-List-Received-Date: Sun, 22 Jan 2017 21:31:32 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 17, 2017 at 2:47 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 12 January 2017 at 23:33, Saul Wold <sgw@linux.intel.com> wrote:
>>
>> To enable glamor, we need to also enable both dri3 and xshmfence as
>> dependencies.
>
>
> Of course musl's lack of lazy loading bits xserver again:
>
> [     8.655] (EE) Failed to load
> /usr/lib/xorg/modules/drivers/modesetting_drv.so: Error relocating
> /usr/lib/xorg/modules/drivers/modesetting_drv.so: glamor_set_screen_pixmap:
> symbol not found
>
> xserver-xf86-config has a config fragment that loads a set of modules on
> startup if musl is enabled, I'm guessing glamoregl should be on that list?
>

add it to preloaded modules in .conf file.

