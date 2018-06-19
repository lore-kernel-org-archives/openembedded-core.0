Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 499787550F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 13:13:47 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id 92-v6so22472321otw.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2018 06:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n8boW2G5L2PLBx1C/17uBzNsTD6pOBGloC7qvlXaDac=;
	b=txj1GY7HvQoxjjBTvSswvcWkMQEpCao99G82gr19L977sTuLJN020juePzdDX4GGn+
	BO31aqpgCi2lmheRNwZcFh6zKR5plztj2O9BCBwTJpkUvCZ3A5LxI72OWbcLLQvIJcVl
	jzvGaSM1f7BUxlEKn85+1RibR+ys1eftId+u6HYsGe7VvL622+gxMIerfsoWAwJlroGD
	YFfGYAlv7K4eQFvSChpBRc8vi/DFs4MzIsVaAznNeqqMeKgdctCq6owgADUWkeCjnws/
	Su0I9nLm8jFjcVjJNTCUwYlrxIkK81YKIpl6FwWqvijvFwDkG00A6g0JjFftSfozKPi6
	KvfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n8boW2G5L2PLBx1C/17uBzNsTD6pOBGloC7qvlXaDac=;
	b=NM4HGZTLK5GSf3x/fWoDwSVvhgkH8TZ169J9vYR/dtVEyJrOIj8+LM5X00go+UT1X6
	g6lDTxblcCepqDQ6ivnaRia0NLsxJVJzLbmL/SXn8k3qT502hDE3iWB/H6NqyCSW7VvO
	A6MkIQbUWrbVFNRGLmX9yJgmcKk1+mfRJEtMY/zbB+stfbiYRAfxid21lMbmd5U8KCHf
	W9naeCsM2qoAz8CIUQP41OpfdLgxipMW0oC85Zc9Ji8SUrcN8Fi9XwpB7Z6ggiQJr2m2
	Q83mOLtyoaZUvcRwGg8szXS0RFgGW9jtKUEUZENDliqYUYCrMrhin4dmrlSeevQG8K9j
	GweA==
X-Gm-Message-State: APt69E2TV+SPp+oiyVsNFiZTNqmd0pAtW70E6FMWXPDVI/JxjzO83co9
	BHlTijl7IqwBiwAh9qSBpTw4PfvqXIaG6KpJtwQ=
X-Google-Smtp-Source: ADUXVKJBIrutydtWwjhPNUh1mcHaT4NVfAaK8B3l483pZ3XChq13hTo2kHywjUO8iggZQWrYaioYokoWsGYwbWhC43Y=
X-Received: by 2002:a9d:55a5:: with SMTP id
	m34-v6mr9761141oth.358.1529414028249; 
	Tue, 19 Jun 2018 06:13:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90cd:0:0:0:0:0 with HTTP; Tue, 19 Jun 2018 06:13:47
	-0700 (PDT)
In-Reply-To: <CAJO0J4hDdQbK_2jzo_ehd0so1SjWnq2RgT5ESdg7JAfAc8Pvew@mail.gmail.com>
References: <20180619114512.11699-1-richard.purdie@linuxfoundation.org>
	<20180619114512.11699-3-richard.purdie@linuxfoundation.org>
	<CAJO0J4hDdQbK_2jzo_ehd0so1SjWnq2RgT5ESdg7JAfAc8Pvew@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Jun 2018 16:13:47 +0300
Message-ID: <CANNYZj_-_TYcU1ZHbesWPiMq-VXdQAcwPeLGGngk=bcQJmkOrQ@mail.gmail.com>
To: Paulo Neves <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] image/testimage: Rework auto image test execution
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
X-List-Received-Date: Tue, 19 Jun 2018 13:13:47 -0000
Content-Type: text/plain; charset="UTF-8"

2018-06-19 16:06 GMT+03:00 Paulo Neves <ptsneves@gmail.com>:
> I support this patch and I see that one of the problems in sumo is
> fixed, namely the HOSTTOOLS missing ip and ping.
> Even so there is one HOSTTOOLS that is missing, ifconfig. As far as I
> know the automatic network setup scripts of runqemu require ifconfig
> for 192.168.7.1 tap setting. Without ifconfig the virtual machine
> cannot be spawned.
>
> Also, given the lack of the HOSTTOOLS in the sumo version i have, how
> is this being tested?
>
> I also would like to discuss the possibility of testing u-boot in a
> virtual machine. I have a setup where I am able to pass to qemu,
> u-boot.bin as a bios file, and then I am able to boot from tftp
> enabled qemu network device. This allows for unification of test setup
> of virtualized and real target booting. Do you have any integration
> like this in the plans?

Paulo, I would recommend that you prepare the patches for all of these
things, and send them. Yocto is what you make it, don't expect things
to get fixed for you by other people.

Alex

