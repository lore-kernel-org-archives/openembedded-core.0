Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f193.google.com (mail-io0-f193.google.com
	[209.85.223.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3364C731A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 20:53:15 +0000 (UTC)
Received: by mail-io0-f193.google.com with SMTP id d197so6475879ioe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 May 2016 13:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=xijfuuCFhB086XBKr6Kxo7ORYfIK3tRn3zKvze5Jhb0=;
	b=XFA35WD28KYO53hTW/RZgV4QA99pwkyNyiZwQh7RPvoxPn4ipdgpKy+f7u/yzIZRDJ
	sWEBu0RVYLL5A5Bq+LKTBaSLCaRNoI+TFx8arfKLvlge2x5MjjIqpaCMgsPcCj7gDWm1
	/9SJvKAD9rhhn0fPY2fgxFgp+sGPkAwMEerIzBCRvqxg9XQHlyvEJL99yrvakwRzUBmm
	2sc1tVbVdEtRALHUMikD0TtthL/ndgTTY0XdWtX2tZxE3LOtz+9j7J252VmKSR+aaMGV
	0Q4TKbaK/oEGao4GlqeEsRqNy4yuZtnlZsMVId45vfRauCuKfWdziUwk+Buev3NU1pQo
	oMSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=xijfuuCFhB086XBKr6Kxo7ORYfIK3tRn3zKvze5Jhb0=;
	b=tNPcpilUh6xsl/IQTroyYPrfRoYn4bzlZ49VedPfJ2XcgFxO+FmQcrnzm+g9xb1Ktl
	01wfhjnIbY1SXImf19RM5rFFCqskYQkz8k4JekJLH854MxjLRfg5x61Ll+WPQaCPp1TQ
	s5F2/gEX2LHJkdD0IaZlxE647LPIkq51Z0cuDUPdCDWuzAfu4M3rfHL/tQeDmLWWCl1p
	vgDBoaKl88NvUVceGJH5GnPZKE8EjINLCV+XjNDJUcVQG5N05+oom5uL/sX1Z+naRflM
	GiKvzV76mWvBTN/uIfGadE8kpu/wNfgY75vFqynSFqNbTj/2EIDdwTfNQ+kEjxrKWIqi
	CVeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=xijfuuCFhB086XBKr6Kxo7ORYfIK3tRn3zKvze5Jhb0=;
	b=S5u9tCVQ3c3VXiWCW4ONHlEPYk/7cCkw5MdW7sRfw+34K/FmdsgafM45VX+ONbiDsB
	CQyBZbS1SoJ93EPSg3sukE+bZBbehImblnQBiSCTDAx9gTzwyaMbFdUDuluLdBQRBHHh
	3FCBOWCcfoeRq3ztXZQHhN0KlY4mFVNxVRylicYEu8WIjezPqCMkyxFD4IIBKGwcvp++
	tJFvzqnhDUVTB0sS+e4w15kz4tM6qlrgBVmCEcD7d5ceEIjJZjcRbVAiOOvecy6eMLpn
	LiXJuYpoOwViqYdIOFkv0B9haUkF2/N7ueoIzjlXaF+0SFo6I0G2nvzYCXgDP/iEZD4O
	nWDQ==
X-Gm-Message-State: ALyK8tKs5isxjvg2QDEMmh4kjRKNUiicpRV2Wlp7F8XW4CAl49YYH+FmopOv3NLGLAlWHFXcjoyHe/ZPSKggxA==
X-Received: by 10.107.147.6 with SMTP id v6mr4086069iod.3.1464208524543; Wed,
	25 May 2016 13:35:24 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Wed, 25 May 2016 13:35:05 -0700 (PDT)
In-Reply-To: <CABcZAN=9ESYdYiGxzEZdyTbQPn0mEPe=2kzB8ZtLnzG8q7PEmQ@mail.gmail.com>
References: <cover.1464208170.git.chris_larson@mentor.com>
	<CABcZAN=9ESYdYiGxzEZdyTbQPn0mEPe=2kzB8ZtLnzG8q7PEmQ@mail.gmail.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Wed, 25 May 2016 13:35:05 -0700
X-Google-Sender-Auth: -lbwGP5Aj9gT4POQZ2jy4xEGm4Q
Message-ID: <CABcZANnRe1T2=cKgW_g8Sps2AFsdOVGt0WATYmOsAX+cnkohtg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/3] Deploy startup.nsh for wic's bootimg-efi plugin
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
X-List-Received-Date: Wed, 25 May 2016 20:53:19 -0000
Content-Type: multipart/alternative; boundary=94eb2c05be56fb8cc40533b09ca6

--94eb2c05be56fb8cc40533b09ca6
Content-Type: text/plain; charset=UTF-8

On Wed, May 25, 2016 at 1:33 PM, Christopher Larson <chris_larson@mentor.com
> wrote:

> On Wed, May 25, 2016 at 1:31 PM, Christopher Larson <kergoth@gmail.com>
> wrote:
>
>> From: Christopher Larson <chris_larson@mentor.com>
>>
>> Currently, wic EFI images don't end up with startup.nsh, so the user has
>> to
>> type in the correct bits into the EFI command-line, which isn't very
>> user-friendly. mkefidisk.sh in oe-core writes it for us, but we don't get
>> it
>> for wic images.
>>
>> Alter grub-efi.bbclass and gummiboot.bbclass to write it for the non-iso
>> case,
>> not only iso, so wic can grab and use it, and alter wic's bootimg-efi
>> plugin to
>> do so.
>
>
> I tested this with success on the MinnowMax board, but that's the only EFI
> device I have to test it on, so would appreciate testing from others on
> this, if possible.
>

I do think a better approach than this would be to make bootimg-efi
directly pull from DEPLOY_DIR_IMAGE rather than HDDDIR, since it duplicates
the bootloader config writing logic anyway, rather than using some but not
all the artifacts from image-live / HDDDIR. Either that, or it should stop
writing the bootloader config and rely entirely on the bbclass to set it
up. Currently it's partially one and partially the other, which isn't
ideal, in my opinion.

That said, I think this patch series is worthwhile for now, and we can
improve bootimg-efi further from there.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c05be56fb8cc40533b09ca6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, May 25, 2016 at 1:33 PM, Christopher Larson <span dir=3D"ltr">&lt;<=
a href=3D"mailto:chris_larson@mentor.com" target=3D"_blank">chris_larson@me=
ntor.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On Wed, May 25, 2016 at 1:31 PM, Christopher Larson <span dir=3D"l=
tr">&lt;<a href=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmai=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Christo=
pher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com" target=3D"_blank=
">chris_larson@mentor.com</a>&gt;<br>
<br>
Currently, wic EFI images don&#39;t end up with startup.nsh, so the user ha=
s to<br>
type in the correct bits into the EFI command-line, which isn&#39;t very<br=
>
user-friendly. mkefidisk.sh in oe-core writes it for us, but we don&#39;t g=
et it<br>
for wic images.<br>
<br>
Alter grub-efi.bbclass and gummiboot.bbclass to write it for the non-iso ca=
se,<br>
not only iso, so wic can grab and use it, and alter wic&#39;s bootimg-efi p=
lugin to<br>
do so.</blockquote><div><br></div></span><div>I tested this with success on=
 the MinnowMax board, but that&#39;s the only EFI device I have to test it =
on, so would appreciate testing from others on this, if possible.</div></bl=
ockquote></div><br>I do think a better approach than this would be to make =
bootimg-efi directly pull from DEPLOY_DIR_IMAGE rather than HDDDIR, since i=
t duplicates the bootloader config writing logic anyway, rather than using =
some but not all the artifacts from image-live / HDDDIR. Either that, or it=
 should stop writing the bootloader config and rely entirely on the bbclass=
 to set it up. Currently it&#39;s partially one and partially the other, wh=
ich isn&#39;t ideal, in my opinion.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">That said, I think this patch series is worth=
while for now, and we can improve bootimg-efi further from there.<br>-- <br=
><div class=3D"gmail_signature"><div dir=3D"ltr">Christopher Larson<br>kerg=
oth at gmail dot com<br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Main=
tainer - Tslib<br>Senior Software Engineer, Mentor Graphics</div></div>
</div></div>

--94eb2c05be56fb8cc40533b09ca6--
