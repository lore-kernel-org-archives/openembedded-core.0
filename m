Return-Path: <andrey.z@gmail.com>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9A8437F331
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 18:04:03 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id c3so9996449wrd.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Aug 2019 11:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vOzmAGLD8EzfJ12VS8yIRPpeQ1I8HOwD94rk3ah3dCY=;
	b=qbTXmVcxDtSrTRXOtRQ0XkdodegsbDXZIXZkbua1/SNhtVdbO11BijdBYv04Z/aVOh
	nl3LKk1jOBVegruwOv6GkWtA09nnRVdE5byOZoQec7xWHvTICQixgK5J5hBGaOAQoEX9
	yRd1cd+wf/T/wQVpdf75dvTLZ50uFa7xEOD1wk8zGcXAgILSGk8Vehd/K0aqAzuNuJvE
	AXs+GOPUmdppv0S0aEDrqI7AkXv7BmcoAi25LMirks759eGF68NAeXzuvlbP3umeZBG+
	SlKP3g0KtzLHocKQ4XA9SbfD3q72D+Q+bWF4ArepjOWEH1JzBIX8Jl713YsQvt6rT5Iz
	FOiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vOzmAGLD8EzfJ12VS8yIRPpeQ1I8HOwD94rk3ah3dCY=;
	b=WkH/7dwT73TxcTJ4iaMSR0F0NhTw5J15WnYEJHZpZmz2U7v5dLwX/gGaEZhcIa61Fi
	TTw3myeUw5Zwn9YGomJQOWo+hjuMtGeKs1qT0ptn/PXZVwmPS27pJe9unQzAoHUiFFNc
	ltw5nhBtdtUykRmIAK3F5m9VjHVa00oCukiarkhklf0hJuRHn6xx3aopJmosL+963IH0
	PkcHtjNzo3biRzposWkfRxHyQOXrFpWTz8UwwL83uQuY+vxx3FwWFFpiagfyW0hJ8Ys+
	F0uxJzmHYkJfdsJy6X13Nn8pjFhU7Ue7awqDJ3CwzDBz0Yyno1ifm+IHAPd0D7AhoXjh
	OPTg==
X-Gm-Message-State: APjAAAVScMvbXAF3rozGRGst8Cvl+CC4aD/c/dSzHfjhT/7aP2X5Vls4
	GCJ24K8SVGa+0b5TALOhdfDDhR7XlftaOyz7pyo=
X-Google-Smtp-Source: APXvYqx8EhMhXCxO0YnuhoTTbvEQIQVRI8Q6Xv/jEvTyUeiyepLjkpD1XF77tjL29vTB1F6PVLJQ2IVXeaheCTj4kZ8=
X-Received: by 2002:a5d:634c:: with SMTP id b12mr17085292wrw.127.1567274644444;
	Sat, 31 Aug 2019 11:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAHtQpK5qiC-i-nouQjbk-CToV-Z-jbN-vKZ7Zk0DOtwQC3SUYQ@mail.gmail.com>
	<CAJ86T=Wz=CpQsZgo4C62RUOGAyWVcJe5OZqX_eQFEbbdZkkjWw@mail.gmail.com>
In-Reply-To: <CAJ86T=Wz=CpQsZgo4C62RUOGAyWVcJe5OZqX_eQFEbbdZkkjWw@mail.gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Sat, 31 Aug 2019 20:03:53 +0200
Message-ID: <CAHtQpK64Q0JS2ScJ60K2swSjSiYO=xdmGyBVhrBNX2-bcEskWw@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: FETCHCMD drop breaks build when append is used (from patch b259bd31eb)
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
X-List-Received-Date: Sat, 31 Aug 2019 18:04:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 30, 2019 at 4:41 PM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> I think for the specific case of usernames and passwords the advice
> would be to put them in .netrc etc rather than trying to append to the
> fetcher command lines (but mainly for security reasons rather than
> this issue).

This I do agree, but it is only related to the username/passwd
combination for a local user to perform a local fetch. Sometimes
however this append might be needed for authentication tokens for
CI/CD systems running in containers. In this case it would be quite
tricky to do it via .netrc (IMHO).

>
>
> One answer could be that modifications of the fetcher command lines
> should be done by completely defining them rather than appending. I'm
> not sure how reasonable that is though.

I believe in this case we would fall back to the original solution,
where defaults were defined in bitbake.conf file.

>
> In the end the approach to fixing this depends on whether appending to
> the default fetcher commands is considered valid usage or not... and I
> don't know the answer to that.

I guess the best course of action should be to check whether appends
are introduced in the fetcher class and use them if they are. This
need to be confirmer with BItbak people though.

-- 
Regards,
Andrey.

