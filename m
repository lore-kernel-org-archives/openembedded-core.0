Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f47.google.com (mail-qa0-f47.google.com
	[209.85.216.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4CAA06EE47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 15:04:59 +0000 (UTC)
Received: by mail-qa0-f47.google.com with SMTP id j5so11661096qaq.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 07:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SwDhCquCexfxmQMHilLFd4UBgYWpnSlAoCi710IX8Pk=;
	b=U3x7dQXSVFViic1w7GXhgYBx0K/4jNZhyOj8hLyiZ7auJOMMX7TJT/d4gBRamAK4WB
	3IZemHPn2sPFXepFjBoUvp5zR00mSwD3bSupv0yW+qheOvANL9bEWdrG35TAaYnKl4z4
	4nRi5A2p6U/3lhDL5rOzrsZwNtz5/8Xtp0j6Mf1KaYEkd9DFSE4cU38/bw9YcrH6858N
	VKl9pXmQs/nxY74LuCdLNdzNU3Fs2lBam1ijD7xjpnLGhiQoktSSECIWHdi2BQ4b6DSz
	+wmmuc7V0r4z8LJaRchBgP65UuiAmZcMCN1C/N8H0rrbbuSJeCm2aYIJzDH6Fg3nBFEK
	xtaw==
X-Gm-Message-State: ALoCoQlSMZFvsxN52nwSKpOJa3N4Qh5+ZxGkZ2ZYtdvy66GgQQxY1bfcauW4veZhnmmzWtnp2Dy1
X-Received: by 10.140.42.54 with SMTP id b51mr46278624qga.87.1392131099646;
	Tue, 11 Feb 2014 07:04:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Tue, 11 Feb 2014 07:04:39 -0800 (PST)
In-Reply-To: <CAMKF1srNpswQ2doGgkAeHDHnS=JuK1E4MGKqjOYRbP+TK3qSVw@mail.gmail.com>
References: <cover.1392089446.git.raj.khem@gmail.com>
	<5eeeedfcaec0bd520449d7926da70085eb033991.1392089446.git.raj.khem@gmail.com>
	<CAJTo0LYuEX-3iYUVcwKu_pppBN5o9bPDSwaJ870zHr1uZ_mjCg@mail.gmail.com>
	<CAMKF1srNpswQ2doGgkAeHDHnS=JuK1E4MGKqjOYRbP+TK3qSVw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Feb 2014 15:04:39 +0000
Message-ID: <CAJTo0LaD4=NZTeLRKD=pOfi5sqGBVacKA-ObWmXkT0JbT2=Xwg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] systemd: Enable building microhttpd
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
X-List-Received-Date: Tue, 11 Feb 2014 15:05:00 -0000
Content-Type: text/plain; charset=UTF-8

On 11 February 2014 14:49, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Feb 11, 2014 at 2:43 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 11 February 2014 03:33, Khem Raj <raj.khem@gmail.com> wrote:
>>> +PACKAGECONFIG[microhttpd] = "--enable-microhttpd,,libmicrohttpd"
>>
>> There isn't a disabled option here,
>
> thats the default one can add --disable-microhttpd too

Please add it for clarity.

>  and you don't set PACKAGECONFIG to
>> enable it so in theory it's disabled by default.  Is this sufficiently
>> "core" to be in oe-core?  Alternatively we could have the
>> packageconfig blocks in oe-core but libmicrohttpd in meta-oe.
>
> I am fine either way. It just makes life harder for folks who don't use meta-oe
> but hopefully there are handful of them. I can resend remainder of
> patch to meta-oe

This was just the usual "is it core?" question for new recipes.
Anyone else have an opinion?

Ross

