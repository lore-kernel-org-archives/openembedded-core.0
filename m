Return-Path: <alistair23@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id D420D7D3E3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 20:49:24 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id g7so10065453lfh.10
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Apr 2019 13:49:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=q9KNQTH+YGH7EEQlbVLt2ozMxR6XDdsXWJN23uM0G64=;
	b=b+/MDZyPOmZTj5L5k1PJScY/lbi8NUxe+AocxVyb3ZT4bYqJyAOXPclv10UG4TWwYv
	q6XVj/HRzkGZj7ChS8h3lzt1UC6nKh47vo0YL/9T9B02CMKj9CucwUfG5sWJDUCAAYEr
	s1b+25ek1XvqGRTM6qrVcNsNV5R4QePPBTxC6PY6pZcDcsdjz+ndsV8g6LQfWhaVkX5t
	pogGkxlrbvu4yDrD4drn0P7hGgnAYnPDu4LGyo19HYskkr9Mff5XpvLfHki2JLTzfxCk
	9kwnfnfhb088Ps6N9TVRpYfAJKcZegEeCkXXnKoKwfE1Nejd/8TcnnFSjx62yMSkhOQV
	Sbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=q9KNQTH+YGH7EEQlbVLt2ozMxR6XDdsXWJN23uM0G64=;
	b=ZZZ+3MSv+zesXZmTTg8e6B5vPQUC6V3f51fg/RXToIxKW5eErZIzsY7diCSAYVlROl
	8JHUUUIsagf4nAm6eksXTwUG9dyhNj3qUV1ahqd0pGZvbP3XMmX1nVzYF3lLcgQDE4o+
	6s08bYn8HuoQnR5JBGO7PRZuwvCWUiAhlwhJz3vfsuAF/uTtHV6vNTKpFGv/pftO8vlM
	SeCI163Gv9z+UvUI8T1uYoUvmqVNKODeaNmYwrS9OZK6OSpudztQ4rHRlNPw7lzUrVbx
	PlVdxFdM7Yq5pdK9pRA3pRz9aiuLxjo3hk75l8Yu3M4kcgBlm5BcQoGYZvn3RtnduFLL
	NmWQ==
X-Gm-Message-State: APjAAAWJII1b/6rA0FuzO/Hz9BBqWv7NkIRjJNY84lPeE9OMOcbkb4lE
	I5N2LpbYEjk3GUqx5YBqz69niNI8xQbyY0Snne9i2Ppm
X-Google-Smtp-Source: APXvYqxN+usu10FrVxERH7BkTPSH8ulB2LgQfftQFtiapwz3qkj/xuFnejrtZp/uuU4wnKRfCdU7mKe3VJrxbZ18qTI=
X-Received: by 2002:a19:7503:: with SMTP id y3mr34376607lfe.83.1555188565414; 
	Sat, 13 Apr 2019 13:49:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190412054625.9447-1-mike@foundries.io>
	<CAKmqyKPW93Z5ovf3kLe3VteXNEr0Z45YUNShakwcCN7bJvnG9Q@mail.gmail.com>
	<2cc02705-6ee2-cf74-1e87-7865b6d790b1@foundries.io>
In-Reply-To: <2cc02705-6ee2-cf74-1e87-7865b6d790b1@foundries.io>
From: Alistair Francis <alistair23@gmail.com>
Date: Sat, 13 Apr 2019 13:48:59 -0700
Message-ID: <CAKmqyKNkz0cYrPddfQocs66N8QBMHFGsn_fSpcrj3_j5kXGC6g@mail.gmail.com>
To: Michael Scott <mike@foundries.io>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-fitimage: support RISC-V
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
X-List-Received-Date: Sat, 13 Apr 2019 20:49:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 12, 2019 at 9:56 PM Michael Scott <mike@foundries.io> wrote:
>
>
> On 4/12/19 10:17 AM, Alistair Francis wrote:
> > On Thu, Apr 11, 2019 at 10:46 PM Michael Scott <mike@foundries.io> wrot=
e:
> >> Support RISC-V kernel image, using the "Image" target.
> >>
> >> This change allows RISC-V support for fitImage via the following
> >> flow: OpenSBI -> u-boot (as payload) -> Linux kernel (as fitImage
> >> with ramdisk and dtb).
> >>
> >> This was tested using QEMU RISC-V 64-bit.
> > Do you mind sharing how you tested this? I would be interested in
> > trying this as well.
> The current OE-based manifest for the Foundries.io Linux microPlatform
> is found here (v42):
> https://github.com/foundriesio/lmp-manifest
>
> However, I think you're interested in seeing the
> opensbi/u-boot/fit-image work for qemuriscv64, and that won't land until
> v43 (along with kernel 5.0.6 update).
>
> It should be ready in a few days.  I can send you a private ping then,
> if you'd like.

If you wouldn't mind that would be great! I'm interested in adding FIT
image OpenSBI -> u-boot -> Linux boot support to meta-riscv.

Alistair

>
> The documentation is here:
> https://docs.foundries.io/latest/reference/linux-building.html
>
> - Mike
>
> >
> > Alistair
> >
> >> Signed-off-by: Michael Scott <mike@foundries.io>
> >> ---
> >>   meta/classes/kernel-fitimage.bbclass | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kerne=
l-fitimage.bbclass
> >> index 2517d75746..2820ff9689 100644
> >> --- a/meta/classes/kernel-fitimage.bbclass
> >> +++ b/meta/classes/kernel-fitimage.bbclass
> >> @@ -10,6 +10,8 @@ python __anonymous () {
> >>           uarch =3D d.getVar("UBOOT_ARCH")
> >>           if uarch =3D=3D "arm64":
> >>               replacementtype =3D "Image"
> >> +        elif uarch =3D=3D "riscv":
> >> +            replacementtype =3D "Image"
> >>           elif uarch =3D=3D "mips":
> >>               replacementtype =3D "vmlinuz.bin"
> >>           elif uarch =3D=3D "x86":
> >> --
> >> 2.21.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> Michael Scott
> Embedded Software Engineer at Foundries.io
> "microPlatforms=E2=84=A2 for Connected Products"
> E: mike@foundries.io
> W: https://www.foundries.io
>

