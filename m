Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id A74CD61406
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 20:10:06 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id k7so10664485qth.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 12:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gRzFR6ZBCQxKRURUfsiajjXgjfRDEiO4u/S+kTSt5UY=;
	b=p5V11/gzgtp1R8Jc2PjCvv3OOBTAvn25fm8iyKn01kmre/2mdGFGLyRp+j9tTbPzg+
	jDclc7nkNvt7QZjuUQDoqolSbnwcowrH9CFhePZATxOQRHL5v9eOJ1apYb4gv/y5CsvJ
	HqO9xAjN39FaS+XR6NVfSU9Lw8nq4uaY/ot41LdggqwkjZ8jKF1XJkmCSvXx5ZAGujUF
	XIRKX67CmtpVtVml9zfWHYdl+TrUmZpXHlyPdOOjpU+hPY8KWvtAPSyZ1N/kjcSkiqqP
	5H0uM99XMe0SBF93CARBAHbtDXtY58DtVLuSN9mbS31LlPpshLttJ/ST4IBmkup+wObM
	pHUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gRzFR6ZBCQxKRURUfsiajjXgjfRDEiO4u/S+kTSt5UY=;
	b=g1fNMRely0vLQSMcE+frEIr+ylznp4TmnKuJVzWQ8iGXahJfPrGlZ65WkpEVOE9B3M
	L01kVLebHnCFNy6TC4iXzybBLUboDAdYnl7GSjLxV6U5OUoQLK4EfocQmOCoMbRwuzPj
	iDLF24g+0xuD0AoYFrrs3wQr3CTzs7Z9tL4/wC0aUf4RRSNP6giJisqaogBlaxxt+RoW
	SGFQm+ItIITChYilusUsDyX+BxfVQ8WPKnn4jgeo2VckSd2UHkW+h5vDsQ3vHfCPKcil
	eIe/zdj6VbhLvQDsNr/bafdjBoqCXioYfqa5U/zUtdIXQqMxWirk88CtaB9YHMnwoMnY
	UJhQ==
X-Gm-Message-State: APjAAAWKVLr2AQboPVtP7yfw/eAoVctyIo/iACJP/nUaG0H00DjXetN7
	kEwwNDb9W0Jf9bfAn9iOBWoHUOeGXKtfm9lnDxslM5Me
X-Google-Smtp-Source: APXvYqzhF7D3sfsBRH69xZfFr0dPhd9VIPJtZVyhljeMS5CIeeP1sft9cAI3Q9RCSPUA298aer97kXy52qbzZrTfi6g=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr10788918qtn.378.1581883807347;
	Sun, 16 Feb 2020 12:10:07 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-5-alex.kanavin@gmail.com>
	<CAMKF1sppws+PSjDojzi7+=p_UjEkEafGa1_WtRLCpqO_73nhGA@mail.gmail.com>
	<CANNYZj8W0A12inq_K3kiShN7dsU3tsTuOgh4LZAtP-QcUVDaXQ@mail.gmail.com>
In-Reply-To: <CANNYZj8W0A12inq_K3kiShN7dsU3tsTuOgh4LZAtP-QcUVDaXQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 16 Feb 2020 12:09:41 -0800
Message-ID: <CAMKF1so86RKsiAXC=vzpT0wu8E=jiFMzJsVBdGb7SQ2TKxBo6Q@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] weston-init: use the drm backend rather than fbdev one
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
X-List-Received-Date: Sun, 16 Feb 2020 20:10:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Feb 16, 2020 at 9:07 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sun, 16 Feb 2020 at 18:00, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Please specify what all qemu machines have been tested, since we do
>> not test weston images
>> runtime, this will silently break untested qemu machines.
>
>
> Autobuilder does test core-image-weston on qemux86_64 and that's where I verified the change.
>

qemuall, applies to other qemu machines for arm/aarch64/mips/ppc/riscv
as well, in recent past I knew
this change was needed for qemumips and qemuarm to boot
core-image-weston, I am not sure if
anything has changed since then. I think this change would need some
more testing.

> Alex
>
>>
>> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> > ---
>> >  meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini | 2 --
>> >  1 file changed, 2 deletions(-)
>> >  delete mode 100644 meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
>> >
>> > diff --git a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini b/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
>> > deleted file mode 100644
>> > index 17ebd7fdab..0000000000
>> > --- a/meta/recipes-graphics/wayland/weston-init/qemuall/weston.ini
>> > +++ /dev/null
>> > @@ -1,2 +0,0 @@
>> > -[core]
>> > -backend=fbdev-backend.so
>> > --
>> > 2.25.0
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

