Return-Path: <andreas.kling@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4EEB274CFB
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jul 2018 07:28:52 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id a18-v6so14668219qtj.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2018 00:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=e1YSG/MMoH/LzEQn1u0oLgbBHXJAxh1S8a3SqHvvbY0=;
	b=Rj17jMXTovNCuYMV0ejeydfzLq4cZx8VYDHNBZ56CWNyrP5dg3B4kNTYvwiNfMBkVp
	CeWrYc0/ygKeAfazWl0n4D9rLi9GN7fcvckZGqEqwZYp3vfqmrUOlCl5sYYuSWH9YdoL
	GYsJJA71jZ+yhzIzikrxcrkVnC5ncn9HTGUf0+o5NV/YhxXpY6pIjImCe+clkRU1UwrF
	B8iB9uVuP5b1VfQaryN/OaaVUIbv/Qrdik8mwoqrq4c6JNHvwYkhKBQIb9BaziaTE8Ke
	4OaBC15V4mFTB6/faNPldV3UVufKiKlou6IgByZNCCBqYpBDqboGqnis2NmrOFJdJR9x
	bp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=e1YSG/MMoH/LzEQn1u0oLgbBHXJAxh1S8a3SqHvvbY0=;
	b=RdxRBY/OffZOZXkvRtMFyKs6GE+k15jD+gRbKV/WEyeApdeO4nqDgHLab9eJBhz8Eb
	/trzDeAGRLS3Ri522wBXeKxIjMKOqAXTR/W2vBsIQzUjL2eXxT8wdbmlEM817Aadu3S8
	edkHg6+0YRL3ZOEcLXaK5UW3Kzj7VHv2lZEAs/Et43RkaBNxGEHypUm+6Zg/imeHhlZf
	j5cbXu2cO3tCa6kYymNGhGtnVpbay35ImhJ2CwPIJKKMbHLon/86UWNepdQcTBszzpHb
	RUXiPucZwvPCZxGjwcjiyvS0R2BiBiaepuLP9k9n4VUxo2uyYqJGkz/tQJPwkaCKFo0d
	WsVQ==
X-Gm-Message-State: APt69E3Um4qmxGPP/UPR9LQuZajTp1JwM9s4PP+JxM0SOTab9gqDeNPG
	Xaa6fLZvYjDNB0CloFD59zflcp6NOUUg8Zb70SW48A==
X-Google-Smtp-Source: AAOMgpfMBN55ZlyYoWDulgNaimkYmd6Q1tD3H9fc5PUfYRYun1JKOFHk+V2amgAG4UARGzHqrczMn5MnU4bGnakqRfo=
X-Received: by 2002:ac8:2f28:: with SMTP id
	j37-v6mr18360718qta.103.1531121333219; 
	Mon, 09 Jul 2018 00:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <20180707122840.31909-1-andreas.kling@gmail.com>
	<65520c34-cddd-860f-84a4-e2bc0c0c1daa@windriver.com>
In-Reply-To: <65520c34-cddd-860f-84a4-e2bc0c0c1daa@windriver.com>
From: Andy <andreas.kling@gmail.com>
Date: Mon, 9 Jul 2018 09:28:41 +0200
Message-ID: <CAE-gg=4RS4B7OE8oKQzJu87nU0hjGzXoWcd=+6rLzs_q4v=6xg@mail.gmail.com>
To: Qi.Chen@windriver.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] systemd: fix missing path separator in firmware-path
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
X-List-Received-Date: Mon, 09 Jul 2018 07:28:52 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Chen,


Am Mo., 9. Juli 2018 um 05:13 Uhr schrieb ChenQi <Qi.Chen@windriver.com>:
>
> Hi Andreas,
>
> I'm OK with this patch.
>
> I'm interested in your environment. Could you please give me some more
> details about why you need this userspace firmware loading mechanism?
>
> I'm upgrading systemd to 239, and I'm going to remove this option in 239.
> The reason is that systemd's minimal kernel requirement is 3.13, and
> userspace firmware loading is needed before kernel 3.7. I just checked
> 237, its minimal requirement is also 3.13.
>
> The userspace firmware loading support has been removed from udev for
> several years. It's said that using userspace firmware loading is slow,
> and kernel has been able to do this for a long time.
>
> So could you please give me some details about your environment? Is
> there some compelling reason to use userspace firmware loading
> mechanism? This would help me to check if we should keep local patches
> with more details updated in them.
>
> Best Regards,
> Chen Qi
>
>
>
> On 07/07/2018 08:28 PM, andreas.kling@gmail.com wrote:
> > From: Andy Kling <andreas.kling@peiker-cee.de>
> >
> > udev fails to load firmware for CONFIG_FW_LOADER_USER_HELPER
> > systemd-udevd[158]: did not find firmware file 'xxx'
> >
> > function builtin_firmware currently assumes FIRMWARE_PATH ends with "/"
> > fixing the path passed to meson allows the firmware loader to succeed.
> > systemd-udevd[145]: writing '/lib/firmware/xxx'
> >
> > Signed-off-by: Andy Kling <andreas.kling@peiker-cee.de>
> > ---
> >   meta/recipes-core/systemd/systemd_237.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
> > index 3efca33e73..8ff049160b 100644
> > --- a/meta/recipes-core/systemd/systemd_237.bb
> > +++ b/meta/recipes-core/systemd/systemd_237.bb
> > @@ -185,7 +185,7 @@ EXTRA_OEMESON += "-Dnobody-user=nobody \
> >                     -Drootlibdir=${rootlibdir} \
> >                     -Drootprefix=${rootprefix} \
> >                     -Dsysvrcnd-path=${sysconfdir} \
> > -                  -Dfirmware-path=${nonarch_base_libdir}/firmware \
> > +                  -Dfirmware-path=${nonarch_base_libdir}/firmware/ \
> >                     "
> >
> >   # Hardcode target binary paths to avoid using paths from sysroot
>
>

yes I would wish not to use the user helper, but it is what I get currently.
What are the alternatives? I'm investigating those, unfortunately with
low priority.
- Move everything to modules so it gets loaded after rootfs is mounted
- Builtin firmware into the kernel
- Provide an initramfs with the required bits

I found https://www.kernel.org/doc/html/v4.17/driver-api/firmware/index.html
quite helpful.
User helper is not the common case anymore, udev removed the support
for quite some time now.
So I do not get firmware loaded for builtin modules in an image "out
of the box" without further invest.
What is the common way in yocto today if one has concerns about size,
speed or something?

Kind regards

