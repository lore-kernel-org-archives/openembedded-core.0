Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id F1AAA7DE81
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 09:32:59 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id f22so1645535iol.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 May 2019 02:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8RpAOIJpEf5ozPDeXa2RxQZK9A1jsk3hUrbxK+jTMVw=;
	b=ffE8qaYflUs1zFEv005JDNxeDWt6wvagElSPCwJXPlqgv0lR1bLj+Uelc1+tRMWTQ2
	Pnkz1ZztHvMyY/fy4L09xQgAxwTHNnWVGAqd8XEGV+/EQrGhFRut4++L097SSTStiHiC
	QIGCWQdfp21ZSPtt0dHIU22+nFkbeDwgTEn7at1k+Shn75E6TZNxCWcjAdcxVmMaOV23
	LSr4rdzBg8BRLJs8zGd6zm0TcNvlx1lNOlwSSjJH7+IsF6sogcijVGmozCUqM4c7/I7j
	0FUhvLKFbmKByOoHtbtc/Au3UHNcx+pUFt/BiQdoP/O6ggG8Gf5s4aWxPN68JkNStzyZ
	5goA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8RpAOIJpEf5ozPDeXa2RxQZK9A1jsk3hUrbxK+jTMVw=;
	b=q7ijZFUlIvTNQEv+1t3A4LqTipooBOTkTnmF5OLfVW/EL4Nj8/ufDUqqjclpG2vmdQ
	pU036MBvdxiZvWCldPs+9SqZY66JcswULueCefnBK6n/cfQ4WocrkfJ0H5JUojq+EwTM
	lrT92JDsHsPmJecBgzvma3jNd5nTRR4BTkFIzBokH8/g/dklDlhRyC/ugEvlmQ19M5fI
	XP2T8SAq6OYrgb5/9Seq0K7DoSZuTz8PBhKjFHMx090wmy7sFXJF8vzoYdpSNAJLWvLK
	OC6byHcDicj4Qmq8KEeoKfwdYl1eAPuFmf9plXruw25TkmGAT6px+hLyi2NGoExXFpSX
	GiNw==
X-Gm-Message-State: APjAAAWN2hjerGCOBeNIovCN1QbFpeBUcwpOELCeQSz+YdqphCroQi/B
	Ud8dzitrXoLpClCfLEUkoCFLQApN81UEVAZuRr87aw==
X-Google-Smtp-Source: APXvYqyJQeMrJgM3MZdIIwTHFmNagN4NkFt9V1e0BxRlCWniFNAAAIEdtlH/tYJe3Z01A6f/3bIQFQEJVUXjYyCo2V4=
X-Received: by 2002:a6b:740a:: with SMTP id s10mr20189916iog.99.1557912780790; 
	Wed, 15 May 2019 02:33:00 -0700 (PDT)
MIME-Version: 1.0
References: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 15 May 2019 11:32:49 +0200
Message-ID: <CALbNGRT7NFoRN8EXYDiQ64+0g-bB=jvd7HcfUCRn+_26iRQX4Q@mail.gmail.com>
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
X-List-Received-Date: Wed, 15 May 2019 09:33:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 15, 2019 at 11:23 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> If do_configure failed, output content of config.log
> to configure log, it is helpful to trace the do_configure
> failure on the build system which is hard to login.
> (such as autobuilder)
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/autotools.bbclass | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
> index 8768a6a..03cbe1b 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -90,7 +90,11 @@ oe_runconf () {
>                 bbnote "Running $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} $@"
>                 if ! ${CACHED_CONFIGUREVARS} $cfgscript ${CONFIGUREOPTS} ${EXTRA_OECONF} "$@"; then
>                         bbnote "The following config.log files may provide further information."
> -                       bbnote `find ${B} -ignore_readdir_race -type f -name config.log`
> +                       config_log="`find ${B} -ignore_readdir_race -type f -name config.log`"
> +                       bbnote "$config_log"
> +                       [ -e "$config_log" ] && cat "$config_log" | while read line; do
> +                               bbnote "$line"
> +                       done
>                         bbfatal_log "configure failed"
>                 fi
>         else
> --
> 2.7.4
>
That output is useful only sometimes and extremly verbose. I'd suggest
to introduce a switch to enable/disable (even as newbie user I am able
to find config.log). How about making autobuilder's WORKDIR
accessible?

Andreas

