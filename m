Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
	[209.85.221.196])
	by mail.openembedded.org (Postfix) with ESMTP id E57BD7E735
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 11:38:15 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id u203so1484281vku.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 04:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vyRdgdjLI4LRIUSueB5LALkH+I8fhihLib/CWWxUw+U=;
	b=Z0aLo8U4EHXLHPGTgBWYBsDxomDNKGbC+HZuYFO66CAl9FUm/kyNFAcASbZwzhQd6P
	4Zyjrm3/xYF05h39XTPeRL1aTTDX5PggOCBs0P858pjrSIarptgRXUeA11hWlA7RYFqJ
	tahjR+VdXKOCJfTg7zfacxkM4sSskZPlzZvwGdRkk4LGtxpkiRGkn4jok9AetYu/MF5X
	LmjX1IhsPSnqt8T7wvt+vVXa7skKX79seRZw1ncZhVR1wLYso+PGga0vC467jxclNan4
	cFWW1zxfaQ/RrUNAxiSHqP0a80aIkAGP3o+Ken0DnWNytOsJK2u5vS9ZYPaz/pEp0IrY
	4sJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vyRdgdjLI4LRIUSueB5LALkH+I8fhihLib/CWWxUw+U=;
	b=B06Zt2uIHgTcAC0Dp0gGe4raLOcKsW/d8izQXbdRr8uhwi1mxKbw/m9A8lvhYg9rOS
	77uroVGDClb73Kt3FCEgYthu9zmPkJ9v/J7cp1R8+tZp84v6g9SFPhBwfhWqw0/ZpGbX
	ih3UFgVpiFdLf7zNMsiF7HwIgMFTEEF5NzSiYBULvlApxIRQWAYEWutjFjkqL+J9NRsq
	SbWIzmp2ShWVT2qoXlYcORmDMTLMJfzTpAWXxcmLy23r2RlMNubGeHUcbWGTfQnP1VB+
	WGYfglqKGbkSXPZ3LqmJCepcrPvGfvdTGat22UZucUI5w9xUk6heRDU20jE7EzjCO+pI
	lVQQ==
X-Gm-Message-State: APjAAAUfQOboUVyqDuXmoVKRXBXR7tu9mU/VLi1/tNAjF+7KEJdh/Kuv
	d+0fiaCIiMh52p/wTUayZuyT+oW1oJb4jEQ9gqhNrw==
X-Google-Smtp-Source: APXvYqyrJjtqZDWmwR5IFN3bIcQ5cOQWPNkQSQQhSsgW9VbDyGIXfs0HqXRBrjtlgBeYH2rYf6AUheoIPe7OejUXjxg=
X-Received: by 2002:ac5:c290:: with SMTP id h16mr7791631vkk.59.1567165096678; 
	Fri, 30 Aug 2019 04:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190828043639.9942-1-shohei.maruyama@cybertrust.co.jp>
	<CANNYZj80wCXerLr-L0zDuG3sShD52snqmG83ySN8cZXXUzT9PQ@mail.gmail.com>
	<f632b8d9d293b54fe63b308dea7684333e409456.camel@cybertrust.co.jp>
In-Reply-To: <f632b8d9d293b54fe63b308dea7684333e409456.camel@cybertrust.co.jp>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 30 Aug 2019 13:38:05 +0200
Message-ID: <CANNYZj8Epz2FCE85HBL+uxDPVDMh7Gjr+vQUvN+GBfk_T--5kw@mail.gmail.com>
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
X-List-Received-Date: Fri, 30 Aug 2019 11:38:16 -0000
Content-Type: multipart/alternative; boundary="000000000000e4589e0591540ee7"

--000000000000e4589e0591540ee7
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Aug 2019 at 02:09, <shohei.maruyama@cybertrust.co.jp> wrote:

> > Can you please look into why that error happens on arm, but not on
> > x86? -vga virtio is the officially documented option, so I would
> > rather use that everywhere.
>
> Accoding to
> https://wiki.qemu.org/Documentation/Platforms/ARM#virt_machine_graphics
> , we should use '-device virtio-gpu-pci' if given '-M virt' to qemu-
> system-aarch64 or qemu-system-arm.
>

Thanks, I didn't know that the lists of supported graphical hardware differ
between various machines.

The patch makes sense then, I will test that it doesn't cause regressions
on x86 with virgl and add it to my patchset.

Alex

--000000000000e4589e0591540ee7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 30 Aug 2019 at 02:09, &lt;<a href=
=3D"mailto:shohei.maruyama@cybertrust.co.jp">shohei.maruyama@cybertrust.co.=
jp</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">&gt; Can you please look into why that error h=
appens on arm, but not on<br>
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
d add it to my patchset.</div><div><br></div><div>Alex<br></div></div></div=
>

--000000000000e4589e0591540ee7--
