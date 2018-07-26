Return-Path: <rsalveti@rsalveti.net>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id CBD3978C29
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 14:35:03 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id f18-v6so1364152lfc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 07:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rsalveti-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BXhXAL/E2tBxpwyQHU9Nsdb0XFRaLThBd+g6ZNiW3j0=;
	b=txsNi+dB91CVhWHJ0JZr0QRXypp9Cps8d1R6AZb97Jp9XDuc5SP78HmZhzAREfYbM8
	z+2LMpvMckmuzhk0M5TJFgnk/60IizJ5q+8mIHqBaeGP0Kg3I1GvhptVQUkY5G+p3fvL
	GsdOttmVYoJ8dTcwpAAPVTxyB7slN3lNrTQXY30y20+BpEADLs6WiYqoUCOHg0V//N1c
	Phrw+DkrH+QLRI0vsU3gZesYVbb8AeJEmsLWtkuHu88026QzLNAejF8v/nZR+nS3BESG
	1z13E7F+L1WePI+AKt8NG9toQsEKQPn3qjlYWRy7h++ReWn4f0VJqgWiIOJikIgtjeYk
	Ys2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BXhXAL/E2tBxpwyQHU9Nsdb0XFRaLThBd+g6ZNiW3j0=;
	b=eVryKKVIR1VrVnvyDH+GgsJmuCIWBNRG3fPyhm8SsKZX1OFI5DUtqrwZre3H2BnG4K
	Tw8lolxx3Xv+3LJmi1sycwfQMVKMfy+j2L4rHYZJ3w9oKTrHm2SH+Uc2NatFSMIn5/Qg
	GxwLMnCvPNC7if7Xc9Vbu6Y/ysxgWjnXw+e9qLo6VHK3JA8z0Mupb0G0B6oiGV5lSok3
	aDbmmIfNloimMVhc0EfxXa9qOKY1MerSAFF0ahjkecG5vHRoqZO+FHI4xIRuyCcJ4dy7
	xZzlhU5DXkI6YSBLHmMpkuOQ2kp7aVJGTWKsQfG6tWRUbcO5JjONq+YYqY7/6D7O2/Oa
	kgvw==
X-Gm-Message-State: AOUpUlHt+XC2hW6PzHj8M3di23K1JcUXtRVUm9h2HRAxj3xSgVUDnmMT
	zgGdvHS5WZwsD7CK7RQEfbW1RNd7FqKoUqIg8X8mnWyOGlk=
X-Google-Smtp-Source: AAOMgpc0j0SL4VOiKtTzaZAZ4HCrATr72J27t0GulDbI7n44kFPyK0CKXgH/vpqsIahiMBTRP+SW5BzGPGypADE3GSw=
X-Received: by 2002:a19:dedb:: with SMTP id
	i88-v6mr1682323lfl.26.1532615704269; 
	Thu, 26 Jul 2018 07:35:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a19:c505:0:0:0:0:0 with HTTP; Thu, 26 Jul 2018 07:34:23
	-0700 (PDT)
In-Reply-To: <105601ae-614a-5d9b-3822-598b009f8859@windriver.com>
References: <cover.1531792805.git.Qi.Chen@windriver.com>
	<29d24bb7dc5de1ae18398b5754b675fdf9b9fdf3.1531792805.git.Qi.Chen@windriver.com>
	<CAHYQr0pwkuE6B1CcN2TLhJ=YyXDHQH0v-SV7ejxL+05ifnmbMQ@mail.gmail.com>
	<105601ae-614a-5d9b-3822-598b009f8859@windriver.com>
From: Ricardo Salveti <rsalveti@rsalveti.net>
Date: Thu, 26 Jul 2018 11:34:23 -0300
Message-ID: <CAHYQr0ore5yKbuV9AQ_1QamDVjZCA_x4Ja6RSjQevBmEi5M0Rw@mail.gmail.com>
To: ChenQi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] systemd: upgrade to 239
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
X-List-Received-Date: Thu, 26 Jul 2018 14:35:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 26, 2018 at 2:50 AM, ChenQi <Qi.Chen@windriver.com> wrote:
> On 07/26/2018 07:05 AM, Ricardo Salveti wrote:
>> I noticed that reboot stopped working locally as I had busybox
>> installed together with systemd, and the busybox version ended up
>> being used as it was provided via update-alternatives.
>>
>> Looking for possible similar broken links, I found that
>> update-alternatives ended up pointing reboot, halt and poweroff to the
>> busybox binary instead of systemctl. Should we revert the changes and
>> bring back update-alternatives for them?
>
> I think the correct direction to fix this problem is to make busybox only
> provide init utilities (reboot, halt, etc) when init manager is set to
> busybox.
>
> We current have in busybox recipe's SRC_URI:
>            ${@["",
> "file://init.cfg"][(d.getVar('VIRTUAL-RUNTIME_init_manager') == 'busybox')]}
> \
>
> I think the init utilities should be moved to init.cfg.
>
> Please check my logic to see if you can agree with it.
> We have two facts here.
> 1. Init utilities (reboot, halt, etc.) are tightly bond to the specific
> implementation of PID 1.
> 2. We only allow one PID 1 in our image. (VIRTUAL-RUNTIME_init_manager).
> So we can conclude from the above two facts that it does not make much sense
> to have multiple providers of init utilities while we only allow one PID 1
> provider on image.

Seems correct to move the init utilities to init.cfg even without the
update-alternatives change then.

> After all, we are using update-*alternatives*, things that this mechanism
> manages are supposed to generally serve as alternatives to each other.
>
> Best Regards,
> Chen Qi

Cheers,
-- 
Ricardo Salveti de Araujo

