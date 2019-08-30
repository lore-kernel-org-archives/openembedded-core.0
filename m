Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vs1-f68.google.com (mail-vs1-f68.google.com
	[209.85.217.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6CD8D7997D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 12:33:34 +0000 (UTC)
Received: by mail-vs1-f68.google.com with SMTP id x20so4602279vsx.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 05:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RJl0vhRqvYsXS3VTPQoYpa96PTfpwDDTkxy0c+aGuw4=;
	b=oPSye4+DBF/VU+YbjvXKwKkjsmZbLH6WvvGhZ5YrmhFSgW1uN5krUNyaEkFN//wz5C
	6KYcwhz0qu9ziHNjhLB/xWAVsWeNGOkaN5X7n0FOjdM1c62YVKbccLKV7c2S48kPK2+i
	VCz2e2Kh64F1fumZPL3otD/+j9rX4Kw03F0Q20mu/63LLTHjuU7Eo91LrqxhxaKW9yxY
	+kAufR9CgYxMiVOjenEJAlUaMJZR8Rln7S+b63f/qYdbjfvUZ4hIlz5Frv5W180hAxqO
	WaaEIALMAGRFy6kBWD0A0KYaUqXYLrVU9/bUhdJ3pLWiFdNkVSB7e4NeSaqw80CqL5us
	3WdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RJl0vhRqvYsXS3VTPQoYpa96PTfpwDDTkxy0c+aGuw4=;
	b=NbFSF4aQJnj2a2jLnoVx5zwJSxyD0N8GqLREWYg1t7v0xIqaVSfEgwe628zwTQ/GmV
	HYCvMp8RfCQitPrHV1LChPQw3ypzsebAmHrzHMnaDSEktTlTY2bh5bn3SXW/YsnRpVag
	keLdbjfP5AUH9ffaYLjUCdqrzp7Ou1/FCI6oDor/onPkgCZCz0E0mv4enmA4dAHDr/GL
	mMCO6OkwiNT+EY0CDtQJOjoHldh6IphKmgD1D1mJYNej/g9MRNmXmEkpzjxYFCWXo3gG
	DhGTDpkTqX5vEHndbDXt3TNcRpQaspaSlzDkIyxfzv+EF4/ac91H1EiCuiTgeAJ7yJuf
	07iQ==
X-Gm-Message-State: APjAAAXtqMEs4qmsL0f4T+pnBo9UpYKvXfgsyORFzpNXjmY1HzM/I2PN
	bQ9JkX1D+nYZLZcC8R4mZW3GdyzdulWvc5weycklLw==
X-Google-Smtp-Source: APXvYqy+B91avCicYzoFxTkERqAGu/kj2Dt5S4ELtSPZkpU0vIQO05gnnzi94e3cZ6wY4j2cNsH6Fx5bOW+SIZOsgFI=
X-Received: by 2002:a67:fd66:: with SMTP id h6mr8723255vsa.83.1567168415375;
	Fri, 30 Aug 2019 05:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190828043639.9942-1-shohei.maruyama@cybertrust.co.jp>
	<CANNYZj80wCXerLr-L0zDuG3sShD52snqmG83ySN8cZXXUzT9PQ@mail.gmail.com>
	<f632b8d9d293b54fe63b308dea7684333e409456.camel@cybertrust.co.jp>
	<CANNYZj8Epz2FCE85HBL+uxDPVDMh7Gjr+vQUvN+GBfk_T--5kw@mail.gmail.com>
In-Reply-To: <CANNYZj8Epz2FCE85HBL+uxDPVDMh7Gjr+vQUvN+GBfk_T--5kw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 Aug 2019 14:33:24 +0200
Message-ID: <CANNYZj9hiMorPrJoF2GHiysO=3pLBv8oo6sPtyezqU8J8_uQBA@mail.gmail.com>
To: shohei.maruyama@cybertrust.co.jp
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] runqemu: Change to use -device virtio-gpu-pci instead of -vga virtio
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
X-List-Received-Date: Fri, 30 Aug 2019 12:33:34 -0000
Content-Type: multipart/alternative; boundary="000000000000b3a633059154d445"

--000000000000b3a633059154d445
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Aug 2019 at 13:38, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Fri, 30 Aug 2019 at 02:09, <shohei.maruyama@cybertrust.co.jp> wrote:
>
>> > Can you please look into why that error happens on arm, but not on
>> > x86? -vga virtio is the officially documented option, so I would
>> > rather use that everywhere.
>>
>> Accoding to
>> https://wiki.qemu.org/Documentation/Platforms/ARM#virt_machine_graphics
>> , we should use '-device virtio-gpu-pci' if given '-M virt' to qemu-
>> system-aarch64 or qemu-system-arm.
>>
>
> Thanks, I didn't know that the lists of supported graphical hardware
> differ between various machines.
>
> The patch makes sense then, I will test that it doesn't cause regressions
> on x86 with virgl and add it to my patchset.\
>

Unfortunately it does regress. The system crashes on boot. So this needs to
be addressed first.

You can reproduce via 'oe-selftest -r
runtime_test.TestImage.test_testimage_virgl_gtk'.

You probably should create an arm-specific qemuboot config file that suits
your usecase rather than try to tweak runqemu script to change settings
after the fact.

Alex

--000000000000b3a633059154d445
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 30 Aug 2019 at 13:38, Alexander K=
anavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex=
.kanavin@gmail.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"l=
tr">On Fri, 30 Aug 2019 at 02:09, &lt;<a href=3D"mailto:shohei.maruyama@cyb=
ertrust.co.jp" target=3D"_blank">shohei.maruyama@cybertrust.co.jp</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">&gt; Can you please look into why that error happens on ar=
m, but not on<br>
&gt; x86? -vga virtio is the officially documented option, so I would<br>
&gt; rather use that everywhere.<br>
<br>
Accoding to <br>
<a href=3D"https://wiki.qemu.org/Documentation/Platforms/ARM#virt_machine_g=
raphics" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu.org/Documen=
tation/Platforms/ARM#virt_machine_graphics</a><br>
, we should use &#39;-device virtio-gpu-pci&#39; if given &#39;-M virt&#39;=
 to qemu-<br>
system-aarch64 or qemu-system-arm.<br></blockquote><div><br></div><div>Than=
ks, I didn&#39;t know that the lists of supported graphical hardware differ=
 between various machines.</div><div><br></div><div>The patch makes sense t=
hen, I will test that it doesn&#39;t cause regressions on x86 with virgl an=
d add it to my patchset.\</div></div></div></blockquote><div><br></div><div=
>Unfortunately it does regress. The system crashes on boot. So this needs t=
o be addressed first.</div><div><br></div><div>You can reproduce via &#39;o=
e-selftest -r runtime_test.TestImage.test_testimage_virgl_gtk&#39;.</div><d=
iv><br></div><div>You probably should create an arm-specific qemuboot confi=
g file that suits your usecase rather than try to tweak runqemu script to c=
hange settings after the fact.<br></div><div><br></div><div>Alex<br></div><=
/div></div>

--000000000000b3a633059154d445--
