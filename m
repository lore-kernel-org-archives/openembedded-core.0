Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
	[209.85.217.66])
	by mail.openembedded.org (Postfix) with ESMTP id DFB8F7D711
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 18:12:49 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id 2so70393512vso.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 11:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SLfs5NINNHIh8uP3Gs1wTkxBYeVUvYI0EV7rqbBiwo8=;
	b=M4NzsY3GcfNUecjyTTu8ft0VzyUD4k9HTHgf/1MZM1x30pQoPUgMQc9Jq2vPDtiNWE
	dJTbcXTN0RLOgDy7F/3kyZGpjzRGnsNiafiZfNRiYBE0jLwNLfHn8W0uEZdOQEJ/P7s5
	dCC9dSnBdqZEnf5mAKkiql0VSi0lmZ1g8aX89WtD0zg4Q6rRYL82J6mKM18hbfAT8e6H
	UbyY4KWPKBaz7vlGiPVIomu9vsHMqX6KDEbhOsjo65h0ep/pZ5OyU9zLVoQeTmnDK9oe
	ku9H3KvpMKDqmAA8yLNZONRFPjcImHzn4sdvLkZCdDXzdApzTyGmjcIjoblA/0LLmnH0
	2xHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SLfs5NINNHIh8uP3Gs1wTkxBYeVUvYI0EV7rqbBiwo8=;
	b=dLuKG4euwVOuwgPL4brxgv98lQWUlWLEWT/4RCVfTn35AKT/Iq7lvqHArBMFNsmRrp
	b5aCoJHcLCR05lrfF9okj09ZcJpWKO4zdmfvQVM6TPdB9yI8L9fHMDvAemNI46Ndv8qO
	YhjzypR19fxcLDodGBiSTD/USXZLvtRyqODx8d7qTYvoiwp3jDqjzZs3S2Bl7TzL1LcG
	gOyW5eEFEeVfuVMC9gzk7bB1LfqjCdo03865yOSvdqO/tIMbUcgoD9EEESfqs3rM1tZ2
	uOJcC+1R8g2GAHiBHuB501tvI18J76Z5gCYhV+8Z/f2jqasTR5/CSeEpB86PU6XUJlsB
	23/w==
X-Gm-Message-State: APjAAAXtWm9omF0wKE6w5L/rrfJjbRVnXxid9Esl+olhuVJIOliOk0cn
	IeDJjkXjYi5DGJmqi2l37ZjXgSLBsd7YVKyTywceFA==
X-Google-Smtp-Source: APXvYqz61dOJbiOgT1owuQwk3MgZQQ5hGxazv3yo06L4wQY3BjEwkH/c+RoeuOPnt/SQaruAUiZbQmcYXcD4kNoIRB4=
X-Received: by 2002:a67:e2d8:: with SMTP id i24mr4517623vsm.11.1565633570613; 
	Mon, 12 Aug 2019 11:12:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1534791421.git.raj.khem@gmail.com>
	<2c5a62b8c4afe40ff2c0fbe2263e9c96d40b63d7.1534791421.git.raj.khem@gmail.com>
In-Reply-To: <2c5a62b8c4afe40ff2c0fbe2263e9c96d40b63d7.1534791421.git.raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 12 Aug 2019 11:12:38 -0700
Message-ID: <CAJ86T=UNpjZTn4NE1z7QYg5O4LmEihiA=vXF6gKg-8tSPBJ5jA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] gdb: Alias rpl_stat to stat() on musl
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
X-List-Received-Date: Mon, 12 Aug 2019 18:12:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 20, 2018 at 12:00 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Use CPPFLAGS instead of CFLAGS since there is C++ compiler being used for somefiles
>
> Fixes
> gdb/gdbserver/../../../gdb-8.1.1/gdb/gdbserver/../common/common-utils.c:419: undefined reference to `rpl_stat'
> | collect2: error: ld returned 1 exit status
> | make[4]: *** [Makefile:414: libinproctrace.so] Error 1
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/gdb/gdb_8.1.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/gdb/gdb_8.1.1.bb b/meta/recipes-devtools/gdb/gdb_8.1.1.bb
> index 84ab08ce93..c6eac84dd8 100644
> --- a/meta/recipes-devtools/gdb/gdb_8.1.1.bb
> +++ b/meta/recipes-devtools/gdb/gdb_8.1.1.bb
> @@ -26,4 +26,4 @@ EOF
>                 chmod +x ${WORKDIR}/python
>         fi
>  }
> -CFLAGS_append_libc-musl = " -Drpl_gettimeofday=gettimeofday"
> +CPPFLAGS_append_libc-musl = " -Drpl_gettimeofday=gettimeofday -Drpl_stat=stat"

rpl_stat() is a wrapper for stat, so by forcefully redefining rpl_stat
to stat you create a local stat() function which recurses
infinitely... which causes obvious runtime problems (e.g. gdbserver
crashes on startup).

Simply removing these additional CPPFLAGS fixes the runtime issues for
me (and doesn't trigger the original build failure so presumably
something has changed since the patch was originally created...).

