Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 51F7460C7B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 07:17:25 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id k7so6328624qth.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 23:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/HTmdUbrMJCeIlgh56e5RqumLxEXIsIFT2UqpLI0uuc=;
	b=i3R/PrvYD8D3HPt2/z3xQUbc5P+ByQv82vEQKY9Lp+gmqiEF3JrhJCCrQzjWVq0091
	1VJaLeFxdM3+pOihZH9dCHAJozaAqVh8KsSQW1yYTie50VL5t1NGpZerjv1zLjlyfj0S
	At77i5/1XMZe4ZXC1Sekt6fiF/rHOOk+yzgFCnompamEYqDFISC7wHy4bjIT44BDaqcs
	pvt1gdgfbIxvcLnNZKgT/iYgIqnowEu3E8VG+JbK6+L7Le/1c/X4VeTfFdQ57xYPLdEu
	J0rLq8uUKKPcJU3Yb3DUiO4VmiARxUdq5ty6i0Pwm+m6DLqKaPX86FhFG+fhmeLQNZHG
	mrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/HTmdUbrMJCeIlgh56e5RqumLxEXIsIFT2UqpLI0uuc=;
	b=nvZcZdNJ4Hd9INTiDKXI0RVyanMBeosKaCeOdlZT6lW0jjMJ1hVbgBSkclweeHTnMj
	RgykBwpXDhSd7LlVLJlhA0IicDdowXtupW6x85KL2io9PyeAMxhVzg1ulybX4kt1Lpfy
	JgLLuTCp+Sdvv/+gy2b3uwiNxnF6mMlnzw28E33LmRZdakpZ+7XsdYIPzHP59jCs+nGL
	NwGQVERuaNT9HjdaSpCsO98EdIFSq0DrlOu+WpAc0Cj1bxc43p0Vn8u84/W3VvP+FI69
	8k0z0AA9HRJcTHCu6HkHsKTopqtwUMPkvy6ifwHr5Mw4RUy6NwhpSe3t922NRG0RZB0O
	q7ig==
X-Gm-Message-State: APjAAAWEmrOKo0lpnThdlz3KSrgbhM1MUgY/BkLzNFVZlK08XgU/8mrq
	j526S2DyTWJbd0wp5yTeC1U0Ipfjq5z3qcn039Y=
X-Google-Smtp-Source: APXvYqy/sMRpTCeD/Scyrihbr1bLWlOBKe+zqJg0puRPSeDaR4wq01N4ZYuX3Thw+UXUYxo3E4bFXp90oIsCwSQhZFc=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr1459473qtn.378.1581664645856; 
	Thu, 13 Feb 2020 23:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20200213061649.102346-1-alex.kiernan@gmail.com>
	<6557ee9b5ee8375cc9e7ee79336975f2cd8c4468.camel@linuxfoundation.org>
In-Reply-To: <6557ee9b5ee8375cc9e7ee79336975f2cd8c4468.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 13 Feb 2020 23:16:58 -0800
Message-ID: <CAMKF1spmaJ1QWr1pod3eJGMWk2S1mADCd=t2LZeOq_L9PHv+YQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: upgrade v244.1 -> v244.3
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
X-List-Received-Date: Fri, 14 Feb 2020 07:17:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 13, 2020 at 3:40 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Thu, 2020-02-13 at 06:16 +0000, Alex Kiernan wrote:
> > Commits from v244-stable:
>
> I think this causes:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/1557
>
> (systemd-boot patch failures)

right
http://errors.yoctoproject.org/Errors/Details/390912/

>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

