Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id D3CD97899B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 14:27:41 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id h22-v6so2598944vke.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 07:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=K14tPVljY621D6jGGtKFtXIDtBNvV8VkCF+MnlHkih0=;
	b=rkwpZ/f4M8X42bHPx62zpn64GUyLRXU3xgQvgyOrV3iJ3EWrtQcqVmS3Z+LgFTF3o0
	Fw81IZoU8Y/otlCqWmnrrMNnP62GdOkCSND/d6zU5IVChKmMha5lOQmhLiPd41ol3XN0
	WRHQRXdjeO71dr8M1vgURR7I+OyxugrCNYTnrOP7nB5q/TlVhGvm1IvYNxo+Bm2LJpjt
	9EA2W99KBaoDeXf9432kgBq3M2GBOWJxQRzywlOzN4L85D3i9wZ583JX1+7YlNSExuFB
	tUW1yQAYejOAnoMyDSsRhKsDsokeHEMoJRvJYxT+i8rKVjtIM8OY8jl3JI5Zqa7COnOB
	IU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=K14tPVljY621D6jGGtKFtXIDtBNvV8VkCF+MnlHkih0=;
	b=MI/OBPwgTT2w522WTseZ0nol05lW2VaUJF8lhntmxw2z4JYXlPMSvFPWaMjMZMwr0g
	wi22uupHE1YcWD38X0LLTuZJjwEhmcEv49rWd/0nqX5Zx+r1jskzjRDEoDsCk6jKXzos
	6ja3o7qH+P9L09G/M6vwN1PiHuoQ0yUNZ+pu04dCnepeKJGQ34zqifN/kLb9YewihKUR
	heSecrT5BE2YW78aoftfCIAfABQm6l8Ivxnhk4hEElBKWQjFyb1P8w5WyOCua8v+KGLC
	BNrom1sT4Q4P1z8oAbalEk+hFiFaRGCQyfZKCNi/bYBWigmPOYDbT1R9fPptDBZsXiGA
	BOgg==
X-Gm-Message-State: AOUpUlEPzkeFEJfEaLAUR+ESWx7eg6mCuJSwdiGF2EvigQkCRgxgz7j1
	NWQM2/2q7F3EnokUSDhmVltrrmKTb9kOpS4PxNE=
X-Google-Smtp-Source: AAOMgpeN+ZHPWQW1L7fP1J6LVg7GV/nNx3KvONUQNwkA2ZYgePCejjU69TC/lCwGGviUpVERQQ/wDiXYMuY2nP4AlAU=
X-Received: by 2002:a1f:e605:: with SMTP id d5-v6mr3450805vkh.4.1531924062545; 
	Wed, 18 Jul 2018 07:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <20180717201021.1640-1-raj.khem@gmail.com>
	<CAJTo0LaufeWeBLdsY1XAt=XU-ifopVm64mqEUDUCiZSbwwCb1w@mail.gmail.com>
In-Reply-To: <CAJTo0LaufeWeBLdsY1XAt=XU-ifopVm64mqEUDUCiZSbwwCb1w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Jul 2018 07:27:31 -0700
Message-ID: <CAMKF1sotZc-6f0H5SKo=jySoVdPeXp+f-dP5Bacs+Cg39vf03w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Upgrade to 2.31 release branch
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
X-List-Received-Date: Wed, 18 Jul 2018 14:27:42 -0000
Content-Type: multipart/alternative; boundary="000000000000922a68057146dd9e"

--000000000000922a68057146dd9e
Content-Type: text/plain; charset="UTF-8"

Thanks! Yes I had tried that patch locally here and
It is the right one

On Wed, Jul 18, 2018 at 5:21 AM Burton, Ross <ross.burton@intel.com> wrote:

> Breaks grub-efi:
>
> DEBUG: Executing shell function do_mkimage
> grub-mkimage: error: relocation 0x4 is not implemented yet.
>
> Looks like
> http://git.savannah.gnu.org/cgit/grub.git/commit/util?id=842c390469e2c2e10b5aa36700324cd3bde25875
> ,
> i'll pick that in.
>
> Apart from that though, everything else built so I'll respin with this
> grub patch and then we get the selftests...
>
> Ross
>

--000000000000922a68057146dd9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Thanks! Yes I had tried that patch locally here and=
=C2=A0</div></div><div dir=3D"auto">It is the right one</div><div><br><div =
class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Jul 18, 2018 at 5:21 AM Burt=
on, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.burton@intel.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Breaks grub-efi:<br=
>
<br>
DEBUG: Executing shell function do_mkimage<br>
grub-mkimage: error: relocation 0x4 is not implemented yet.<br>
<br>
Looks like <a href=3D"http://git.savannah.gnu.org/cgit/grub.git/commit/util=
?id=3D842c390469e2c2e10b5aa36700324cd3bde25875" rel=3D"noreferrer" target=
=3D"_blank">http://git.savannah.gnu.org/cgit/grub.git/commit/util?id=3D842c=
390469e2c2e10b5aa36700324cd3bde25875</a>,<br>
i&#39;ll pick that in.<br>
<br>
Apart from that though, everything else built so I&#39;ll respin with this<=
br>
grub patch and then we get the selftests...<br>
<br>
Ross<br>
</blockquote></div></div>

--000000000000922a68057146dd9e--
