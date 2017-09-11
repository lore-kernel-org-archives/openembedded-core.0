Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2968773097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 10:49:33 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id j141so23371462ioj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 03:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WzL7TBofd1YvnNULT1S6rOGkdjueE/UnadHwTKSC+/c=;
	b=IMzPKiffd3MSX1Ycu5nP+APyS+DZQ6hl2jdxABOYjHrZ6F3AkkgTq8VPJPmmgzs8PG
	oaSWln3grI3GVHpupbjIZ8PnDSolEnngK1ReaLL+p+K8FXsXQEih3mtpTmoZz4RRNKiU
	PVFRanPn0wuJRkYQ4gRy8DwXPmbOlyoiMyj2PpTF41Yo2McxQrkOCCtDGiUBYVyr/IYO
	35E/wBU/8/MRd9rpeA/zG2mxNLZzH9Ljb+IU5s/HQVGdRYEV13MJ95dV+SIU8sCUVDws
	ELuRG2THKb/HCDfI8rhnv5m35EM0OtMAGsPsqfaod3YqJvUAFwxg7P66/l/NEDa/p8tp
	/WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WzL7TBofd1YvnNULT1S6rOGkdjueE/UnadHwTKSC+/c=;
	b=ahNYCMCQiRYD4pia+0rIcqcDUSJ8CuO9+WjFjuqAU0Dh5thAg6yeaMhINi7rSQYVHg
	8w+dSNEIiIzTO9J9gWVB3v0JXWka2AIH6eAQ2k+WMEkqF0ejLl7Sa+oE5M6hZ3ImGcgV
	6Y6TPnloUF6uQlyrnwUYV9NlH5SOnfvcnIqGdbjELGEEEW5dWG8zIsGx7W1QGmn2jBJY
	rfqbZiOCeHqamG7hHEJh/NjV2NL6dP7QZz1+ZD2ACRpCYVB/KV14ayGIcuWV5qV5FVwX
	tYQ9aAQzQIxT510wZ4495a7c7xIaAxuV+gFFYrpQbG+PPv+KfxDCtqCxPytOd7yKpAUm
	UbRw==
X-Gm-Message-State: AHPjjUht0Wyl5+uVZN+Jbynzgz3Sur9lhYszORhkyzCBPjHOphfC4Y8U
	Eo94b1Een/5o0h0+SdUk4d5El3OSfKO6
X-Google-Smtp-Source: AOwi7QD7QcZfc+enz2f9ZSewi6AM7pnpqvgugzOg0WCNSBlmKNS0mu5OzXx1EExKm4SiOegm1cka5AZwgVYTDtdoJuQ=
X-Received: by 10.107.135.72 with SMTP id j69mr1128205iod.210.1505126975223;
	Mon, 11 Sep 2017 03:49:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Mon, 11 Sep 2017 03:49:14 -0700 (PDT)
In-Reply-To: <2feb5110b30e3b9c7c2f18248018880cf67f82e5.1505122056.git.liezhi.yang@windriver.com>
References: <cover.1505122056.git.liezhi.yang@windriver.com>
	<2feb5110b30e3b9c7c2f18248018880cf67f82e5.1505122056.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Sep 2017 11:49:14 +0100
Message-ID: <CAJTo0LZkeHb_oa0eBnoVVCMxOE7f_DTCdqEQaFer1YRLiM8kSw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] runqemu: default qemumips memory to 256M
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
X-List-Received-Date: Mon, 11 Sep 2017 10:49:34 -0000
Content-Type: multipart/alternative; boundary="001a113f8e70b3510d0558e7ae9b"

--001a113f8e70b3510d0558e7ae9b
Content-Type: text/plain; charset="UTF-8"

On 11 September 2017 at 10:28, Robert Yang <liezhi.yang@windriver.com>
wrote:

> The qemumips or qemumips64 can't be boot with 512M.
>
> *Fixed when no QB_MEM is set:
>  - runqemu qemumips nographic core-image-minimal
> [    0.000000] Call Trace:
> [    0.000000] [<8011c010>] clear_page+0x0/0x128
> [    0.000000] [<8022b818>] get_page_from_freelist+0xa1c/0xb48
> [    0.000000] [<8022c00c>] __alloc_pages_nodemask+0xd8/0xf0c
> [    0.000000] [<8022ce58>] __get_free_pages+0x18/0x60
> [    0.000000] [<80118674>] setup_zero_pages+0x1c/0x98
> [    0.000000] [<80bd23e4>] mem_init+0x44/0x54
> [    0.000000] [<80bca964>] start_kernel+0x20c/0x4bc
> [    0.000000] [<80920090>] kernel_entry+0x0/0x40
> [    0.000000] Code: 00000000  00000000  00000000 <34860f80> cc9e0000
> cc9e0010  cc9e0020  cc9e0030  cc9e0040
> [    0.000000]
> [    0.000000] ---[ end trace 0000000000000000 ]---
> [    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
> [    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the
> idle task!
>

This only happens after removing the QB_MEM assignment
from qemuboot-mips.inc right?  It seems to be that handling
machine-specific quirks like this should be done in the machine
configuration instead of starting to have a maze of special cases in
runqemu again...

Ross

--001a113f8e70b3510d0558e7ae9b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 September 2017 at 10:28, Robert Yang <span dir=3D"lt=
r">&lt;<a href=3D"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezh=
i.yang@windriver.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left=
-color:rgb(204,204,204);padding-left:1ex">The qemumips or qemumips64 can&#3=
9;t be boot with 512M.<br>
<br>
*Fixed when no QB_MEM is set:<br>
=C2=A0- runqemu qemumips nographic core-image-minimal<br>
[=C2=A0 =C2=A0 0.000000] Call Trace:<br>
[=C2=A0 =C2=A0 0.000000] [&lt;8011c010&gt;] clear_page+0x0/0x128<br>
[=C2=A0 =C2=A0 0.000000] [&lt;8022b818&gt;] get_page_from_freelist+0xa1c/<w=
br>0xb48<br>
[=C2=A0 =C2=A0 0.000000] [&lt;8022c00c&gt;] __alloc_pages_nodemask+0xd8/<wb=
r>0xf0c<br>
[=C2=A0 =C2=A0 0.000000] [&lt;8022ce58&gt;] __get_free_pages+0x18/0x60<br>
[=C2=A0 =C2=A0 0.000000] [&lt;80118674&gt;] setup_zero_pages+0x1c/0x98<br>
[=C2=A0 =C2=A0 0.000000] [&lt;80bd23e4&gt;] mem_init+0x44/0x54<br>
[=C2=A0 =C2=A0 0.000000] [&lt;80bca964&gt;] start_kernel+0x20c/0x4bc<br>
[=C2=A0 =C2=A0 0.000000] [&lt;80920090&gt;] kernel_entry+0x0/0x40<br>
[=C2=A0 =C2=A0 0.000000] Code: 00000000=C2=A0 00000000=C2=A0 00000000 &lt;3=
4860f80&gt; cc9e0000=C2=A0 cc9e0010=C2=A0 cc9e0020=C2=A0 cc9e0030=C2=A0 cc9=
e0040<br>
[=C2=A0 =C2=A0 0.000000]<br>
[=C2=A0 =C2=A0 0.000000] ---[ end trace 0000000000000000 ]---<br>
[=C2=A0 =C2=A0 0.000000] Kernel panic - not syncing: Attempted to kill the =
idle task!<br>
[=C2=A0 =C2=A0 0.000000] ---[ end Kernel panic - not syncing: Attempted to =
kill the idle task!<br></blockquote><div><br></div><div>This only happens a=
fter removing the QB_MEM assignment from=C2=A0qemuboot-mips.inc right?=C2=
=A0 It seems to be that handling machine-specific quirks like this should b=
e done in the machine configuration instead of starting to have a maze of s=
pecial cases in runqemu again...<br></div><div><br></div><div>Ross</div></d=
iv></div></div>

--001a113f8e70b3510d0558e7ae9b--
