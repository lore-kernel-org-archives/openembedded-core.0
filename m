Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 769627391A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 20:07:18 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id g62so46840766wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 12:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=GF2GWTJh75ZJKq9hSvZ79Xirxmnm494b9ymsTc42k3k=;
	b=qtUV0msVzUBIac4+bUkmZnTwTgtMVoC+/hrJoY0diPCvot1B3Gld8XEnb7oYncnOKR
	t8stLWSfYxFpBgJfdh0wbh6p5j+Aiow8seCCgjz3XC0fImnhVeK/juePeM8MkjTqJjEN
	Gj/Rl/5Zl9R8t6qMCmUBrJuRaP0nVawNArud47avoAgvrrFvkr15cYrBZutIdmxEYtbc
	c2sLhOF5PwfpsPreiE2F7JcN+tgppaicDPBU1S+53ur2xtR4I9tMG6B+vwp6OPiKx29O
	ELFUylURXTGvIKXvIA6R4gBXHyRxPpEH0Fe6L79Y0bXYN1kF/jUcWQFGAbJQ4zkDwTNx
	nVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=GF2GWTJh75ZJKq9hSvZ79Xirxmnm494b9ymsTc42k3k=;
	b=kfnNP3+CZqUuSFqDHfqhw1DmldDo6JhvHZvQmBMhTnkg7t17wXQ9tecSqskvTUbJUm
	UQ8PVnGDSqGRH7WcFmHjlZgT/UHETY3/j3A3C6ZK3YOJmgE3z4wimbWlfQgxynpvxy+a
	LGbAitoFYZNxbIXMJYBbql84z65Mq4rW5EKzTthrq0+YiCkgGLeQX335CVwHx2b+fH91
	19PFwAcYTWDIZKPgye8/MKi8ptTb/s4yXJH/n9MWh8CWUIZikx+8001qukc9iBAs5I+l
	3Ti69dro+a1VeyXb5XWjCtfJhoOWqSKsQ4H8/Ah2+3kDKoihUhXc5a26odX1HH00wpx0
	chVw==
X-Gm-Message-State: AG10YOQAz3qEwlgO3pvlwo3uWu9eNyS9+ztQSzglGRdHeHkF84sGIYG+CJ7NqxjnTaF5XohyBXNmxH/QQWh0oQ==
MIME-Version: 1.0
X-Received: by 10.28.187.134 with SMTP id l128mr435814wmf.61.1456430839161;
	Thu, 25 Feb 2016 12:07:19 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Thu, 25 Feb 2016 12:07:19 -0800 (PST)
In-Reply-To: <CAP9ODKqeD1qZe+Gf-LQoVbmAZrkGVgGDYFgQFGkniaiwTh25sQ@mail.gmail.com>
References: <CAP9ODKqeD1qZe+Gf-LQoVbmAZrkGVgGDYFgQFGkniaiwTh25sQ@mail.gmail.com>
Date: Thu, 25 Feb 2016 12:07:19 -0800
Message-ID: <CAJ86T=UvGuB4ndSvJc9FPkEw56HK4NUw2A9iGJotBqk7FfoJOg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: busybox not buildable when using armv7ahfb-neon tune
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
X-List-Received-Date: Thu, 25 Feb 2016 20:07:19 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 25, 2016 at 11:59 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> Hello folks,
>
> When building a target, with Big Endian enabled, busybox is failing to build.
>
> I reproduced the error with Jethro and master.
>
> Here goes a simplified log:
>
> http://termbin.com/1c8p
>
> Could someone shed a light on this?

I don't see any errors in the log?

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

