Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id 8C05F751D2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 10:54:31 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id a190so4046655ite.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 03:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZoNmZI7qNHDmEQhPSOBho9+TlEZ3OQSP3EbO8Hwt5dM=;
	b=pET00OtR1WxXhv/xPoiIjFcyubsbC+ffpsnV5uJOGAjdtD8pFNO4nGk3D3oSaG7xnh
	hq5UADt3qpmnOF47WGIlJRoK2/N+wifEPC2jgkNzNWkHn8g14HBOKLH0jfmoRIaal6SH
	a1gDGaJyA8WHC+ccJKoUQKcKGy3R1ucGrd8FCwe6iei0ZSr6FQyJnPF44fp6yptopvjm
	4AA3A76Ixg700kL4Dw5jaH9L6Fcz5ySdVkfAe9DGGWfpDVOiuxvtpoJn8uAWADdVXlPp
	uz1wtL+fRMMg5ntBy1IzXWR9r+giSKPph00TQUvxusEFoh1TFDRh/yrhizwOBJxRyhXV
	4OMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZoNmZI7qNHDmEQhPSOBho9+TlEZ3OQSP3EbO8Hwt5dM=;
	b=MkglDSSYRTr2QkEu2bnVkTP78Td9ub3QuQuiqwv7FqRgkzHugqaKBHYiMlmPVlJGPU
	Miz0i9fspQfScPi1616+2ZSMmdDc2xKVFsI4envcBqvVvu4hbHOT/T9IvFB1zNx66VrP
	LSZadJPKD86u8+x64+PpTTDWR/a/OZgFE6bb22mKyn4NGiiCz1IWp6SbsjQDq/CNUgq7
	qypK2SEYi6mfRpTTZ4f9MYB9qQE75QtN9+IZCA5M6VSlvfmTL8sgg8GnoFWsno+DR4o7
	Ve+9qCmOTqgNjf9F6oyLqCTjnm4RdVK2YA3oD33EtQnTuPF238icjKk7rD16HEJ+TNVu
	GMBg==
X-Gm-Message-State: APjAAAUPFve4Q0aQHL3xwjDV1HHXlWFI6PUzATy2C+UPdIhj7ticWINV
	ILeyHFu4YXwbT3d040026vUE//B0qFTvoYNVQwE=
X-Google-Smtp-Source: APXvYqxGijHzdT4/fy7LSae996+IrsGg1vqZlBJY7R1zOEQU1Jq2878skVnexjp8YdvCcyBJmxVJJMGiCuu2S5kUfQk=
X-Received: by 2002:a02:3846:: with SMTP id v6mr27243801jae.81.1557917672607; 
	Wed, 15 May 2019 03:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRT7NFoRN8EXYDiQ64+0g-bB=jvd7HcfUCRn+_26iRQX4Q@mail.gmail.com>
	<0ffc3e2e-2321-0edb-c90a-76225017472d@windriver.com>
In-Reply-To: <0ffc3e2e-2321-0edb-c90a-76225017472d@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 15 May 2019 12:54:19 +0200
Message-ID: <CALbNGRToT5fCwHNMzruzoJZDC34zymY52_uEmASqHQmacL2+Xw@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: output failed config.log
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
X-List-Received-Date: Wed, 15 May 2019 10:54:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, 2019 at 11:50 AM Hongxu Jia <hongxu.jia@windriver.com> wrot=
e:
>
> On 5/15/19 5:32 PM, Andreas M=C3=BCller wrote:
>
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -90,7 +90,11 @@ oe_runconf () {
>                 bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECON=
F} $@"
>                 if ! ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} =
${EXTRA_OECONF} "$@"; then
>                         bbnote "The following config.log files may provid=
e further information."
> -                       bbnote `find ${B} -ignore_readdir_race -type f -n=
ame config.log`
> +                       config_log=3D"`find ${B} -ignore_readdir_race -ty=
pe f -name config.log`"
> +                       bbnote "$config_log"
> +                       [ -e "$config_log" ] && cat "$config_log" | while=
 read line; do
> +                               bbnote "$line"
> +                       done
>                         bbfatal_log "configure failed"
>                 fi
>         else
> --
> 2.7.4
>
> That output is useful only sometimes and extremly verbose. I'd suggest
> to introduce a switch to enable/disable (even as newbie user I am able
> to find config.log). How about making autobuilder's WORKDIR
> accessible?
>
> The output only happens while do_configure failure, it does nothing when =
build succeed,
>
> while failure occurs, I believe related message is the more the better.
>
> The autobuilder is just an example, for community development, it is hard=
 to login
>
> others build host to debug issue, and we have to take time to reproduce i=
t
>
> if we could trace it with a simple glance from the log, why not
>
Errors are common at recipe creation. I am asking for a knob to
prevent me from scrolling through endless wallpapers (confg.logs can
be >> 100K) to find simple errors.

And it just works around an autobuilder hiding useful information,

My 2ct

Andreas

