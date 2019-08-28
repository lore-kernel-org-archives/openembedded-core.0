Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id EC2197F26A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 22:06:15 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id t14so1054564lji.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2019 15:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=h150ZsGQWJgDTkCcKQk4i/e5fFRw0XsEfTz4PTlBFL0=;
	b=qOnEBKyRetSw/YiQE6wjCfbv+BiouQqsMPeBmnYwFC54AcHKZtykK09HmSrSrKSVq9
	liZm6s/IiI+0A73cS42e6lGLl0T5FfuzZYJ9hLjsn69jFQoOSLiUpI0KK8JrU7NlIOih
	7ndd4tHGlgAa5vvlhtHkFqQzRqccDd6KXwIiz9pMfnsSRDEsM4EzLreQeYnV4UEQgJBI
	BlTFEeJhJVDiLjd74Op/HvyLKdS70gGyqVNBGJ4iaWdBD74oApGovx/EfURAHOeKTT2v
	4AS2D3kZamTrsXioMn5nCKoBAtuT/Xk1lSG43LvtBnGmg/+SkA/iMWSmINrJcBEnI8lU
	sGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=h150ZsGQWJgDTkCcKQk4i/e5fFRw0XsEfTz4PTlBFL0=;
	b=QB8edFh6nGy75TFq35PF5qTtVtEufytE3HkSxcm/pOTUyRZx84IKKe5CHSY0bsk2E3
	Yp8AUtFcvCx44ONI2IVV3zyAAh9fOJHeJ83fWiU6m/IfrsaPsouHoAkEibSQ7G+nBmZR
	Gpjp2NoOV1dnM8lmIp3th6/OOTDsAi2Fc77+TYhFT5V4Px2xMtQd1gYx19zKUw/K8IXY
	jTv/lgel+YTyUhFhquS+Z1HEylg2yXXKIVuNoBDb6pnZmsQNL9kZ0v9S8gmpx9Jq29dt
	UO4Yf3ebuDhIjCUUpprPuBct/9syhGj5jcqryvrGXs7jngr8VMCzkR/wPiPQt/Uqyx/a
	JDCQ==
X-Gm-Message-State: APjAAAVYdu/BRCkVSkEEm4VwMlaxtrauoKmuc3m8Hu1wBr05hQx3uKxK
	4xBNVDtNJEFcPmARD9OLX8FQ13b+HdD5J/a4co1jmDz0
X-Google-Smtp-Source: APXvYqzdG0I1zf3zRDvOgDSZfPr8OYz0NHjYx3DXUqozXO+S5hQtwbafbpfji+sIN8VMs1uWFnVanndft/SHUkx74Vw=
X-Received: by 2002:a05:651c:1111:: with SMTP id
	d17mr3233489ljo.87.1567029976231; 
	Wed, 28 Aug 2019 15:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1567019771.git.bruce.ashfield@gmail.com>
	<4f7fa357480ec0139aa809bed4a12c9aa7622d60.1567019771.git.bruce.ashfield@gmail.com>
	<20190828200536.GD3044@localhost>
	<CADkTA4MBTDFUam5xvwvc0KKO+fX7ZfmBYtoe6_ZdrnspJok7Rw@mail.gmail.com>
	<20190828215810.GF3044@localhost>
In-Reply-To: <20190828215810.GF3044@localhost>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 28 Aug 2019 18:06:04 -0400
Message-ID: <CADkTA4NbtkgR2LrZC+Srtn-BC+6q=7HQH9S7tbJ3H4u7=HQm7w@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/8] kernel-devsrc: remove python2 dependency
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
X-List-Received-Date: Wed, 28 Aug 2019 22:06:16 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 28, 2019 at 5:58 PM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Wed, Aug 28, 2019 at 04:11:43PM -0400, Bruce Ashfield wrote:
> >...
> > There's zero risk to these, and no reason to sit on them.
>
> What range of LTS kernels is covered by the "zero risk"?

It has nothing to do with LTS kernels.

Cheers,

Bruce

>
> > Bruce
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

