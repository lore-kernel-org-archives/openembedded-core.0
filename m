Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id DA33960116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 16:50:56 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 77so523288479ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 08:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=T0hpP/qnZUPlWnWEjVXri5OSHZ4kteTJsh9GB4LlJZ0=;
	b=SzibGvXXofUAL/wimt6LlLK1G7cRRTxXKdPmj0aGjDUaT7YuyJl1yphpOTaEvC291K
	fuSdtjGcM01W6Y0RmFCAo+6QwvEjdZjBeHSqisat6xsxxaxZ1hay7/vYdLFJmJ6D6k9u
	GPN69ZrOPF9Gp+TefYYt8cZM0jQ4i3SkknKIO1s5iGiNulR/Iz7Y/5c0yG49+lN3p1sm
	4pSITknUu4aOajuLyz0Rgo8DYIAJvcqB7jiwsqIe7dwd/EDVQVAVVkYSjlHGzbHO+Rx7
	IHFJb5qFpb3yeDIhXt4PKpxApR7qfDjuEPks9xRIweFa7j+qYQCZsF6FOAhH0WQAvF+U
	2F0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=T0hpP/qnZUPlWnWEjVXri5OSHZ4kteTJsh9GB4LlJZ0=;
	b=dCugQEj0tMm87HifjPhJF1S+XcMKfiKcMPVr9+Lk0olTw8aIQHJXWMGbWNKbOYVUkM
	DjxlejXYnC5zQANxX5rwJv0PJondc45SV10Ex3WY6bRIu109N28SMAhrRAT5L8hvp+Bz
	DC8+K6jKw+z/vZFmyXd6qaK0lGcmM4oD5hResO88yTpc2zGWNqlpJZvYlL+xTVZfXAjK
	zTdE6lKn+z0JtG+PZQS03WsP6fUloc4mwVzwPZjuFLpLW1sBt6jDRYH+Caj7PMsp6KXO
	qyAMpFbj09WVLe+x8QoTT/okei/reo83x+t9lEN+8KIGoB455YKkRx6xpPgthJSLmDIa
	YLvg==
X-Gm-Message-State: ALoCoQk0SeoEAt213ke6+sspbJZVKKRmbGA5hYPLXM2TQ40RlvlRM9dAmlZmZc7RITkgPRF07GhV8VAdsvuu1UowqXMGUCUc7RQIDbmdfH803quCnuCn0fk=
X-Received: by 10.107.164.161 with SMTP id d33mr20662565ioj.148.1453135856946; 
	Mon, 18 Jan 2016 08:50:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 18 Jan 2016 08:50:37 -0800 (PST)
In-Reply-To: <569D1781.200@windriver.com>
References: <1453130337-8044-1-git-send-email-otavio@ossystems.com.br>
	<569D1781.200@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Jan 2016 16:50:37 +0000
Message-ID: <CAJTo0LZQ+oDM0gatYwmWOi8YV=mpud+M5VWE4fEYbMCqFPCh-g@mail.gmail.com>
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] slang: Add dependency on ncorses
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
X-List-Received-Date: Mon, 18 Jan 2016 16:50:57 -0000
Content-Type: multipart/alternative; boundary=001a1141c97690638605299e8e28

--001a1141c97690638605299e8e28
Content-Type: text/plain; charset=UTF-8

On 18 January 2016 at 16:49, Randy MacLeod <randy.macleod@windriver.com>
wrote:

> Please fix typo in shortlog:
>
> s/ncorses/ncurses/
>

I fixed this when I pulled it into mut.

Ross

--001a1141c97690638605299e8e28
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 January 2016 at 16:49, Randy MacLeod <span dir=3D"ltr">&lt;<a href=3D=
"mailto:randy.macleod@windriver.com" target=3D"_blank">randy.macleod@windri=
ver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:a02" class=3D"a3s" style=3D"overflow:hidden">Please fix typo in shortlog:<=
br>
<br>
s/ncorses/ncurses/<br></div></blockquote></div><br>I fixed this when I pull=
ed it into mut.</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Ross</div></div>

--001a1141c97690638605299e8e28--
