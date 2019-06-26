Return-Path: <franksinankaya@gmail.com>
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
	[209.85.222.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1BA967E6DD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 17:33:58 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id s22so2335000qkj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 10:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:subject:to:cc:references:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wf4YqZ5MVIblD8fc6KO49rwwbRRsryc3J9hthiTzy0w=;
	b=nlppqBgYmnNIhegVAleF/wJMlf40E2Br1W2Ioe1X0NrpyVMjIEuSopBvlP3gVzZ99c
	k0elT1dTWxA8ckucIkmblm6RubBLdY8JGQAKwT/a3BouNGokly/1arBQt1xzrmvl/ruj
	CL6CVDK9mtfGGabh4+4KWbd56IinPJP6tKpkRIdfdod0ZQmpTe/gLWZYRbMIQEAr5jwv
	4Lq9fM4EdgT5cgSjg4GlQKkdTvpiKjV4JIyUHQ0T8FcTVyDyJCn/Xg9rPCeBgbI4qEc0
	DcB6PVwMPXDdAKHVWeXESCTxe1VFq7X4w49N+mYD4gyiMyCrHxBJg5gZGyT/nOl4a1WL
	Cz6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:subject:to:cc:references:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=wf4YqZ5MVIblD8fc6KO49rwwbRRsryc3J9hthiTzy0w=;
	b=tOB3fuy/MKjv/QNfNO+R+xJuV/Gk7Tpi3nmdf/+wYUR28Uyma4Bovp16Vr6mCqcU+L
	/0vGh/pHNUcyXhQOj0pn8RCSBjHxnFrk1xw8dZKQvpuKk7rpxps6lal774AcHOTP/TQT
	oHw1c2urRqmSk05n63ajnLB483KZJbRjJz3bih2dgRPMaT56pJFdY8mQHydjClT3KW7d
	DxhwNacHwzuHAWEfLWs/dukssnT+76qX98sbcZ/mPNfVrzkh2j5Xwu8nK9YGEXRaSxUV
	sUGIaP95VuhaV+6NkOHm7UGXZrAtsFjsl9LCzdLM7UI18+3KQz8vYAhHIYk4XZz7100N
	bd+g==
X-Gm-Message-State: APjAAAUqc0I8ApcMHpTb0pRNeyMnAq5v2bETaiAqzYoRmwvpjh1IGToN
	gcbmaVi7AT4sTZjOyViMqaSTYFWk
X-Google-Smtp-Source: APXvYqzR9gSwZF6tN5rQRg8hrtsFXapawYeQnQ3hc/QszOMf5VcB8SLNBkLXVVwhtqcCzNj9R7n7+g==
X-Received: by 2002:a05:620a:16cc:: with SMTP id
	a12mr4876064qkn.256.1561570439680; 
	Wed, 26 Jun 2019 10:33:59 -0700 (PDT)
Received: from [10.84.150.60] ([167.220.148.60])
	by smtp.gmail.com with ESMTPSA id
	u63sm9281121qkh.85.2019.06.26.10.33.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jun 2019 10:33:57 -0700 (PDT)
Sender: Sinan Kaya <franksinankaya@gmail.com>
From: Sinan Kaya <Okaya@kernel.org>
X-Google-Original-From: Sinan Kaya <okaya@kernel.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, ChenQi <Qi.Chen@windriver.com>
References: <20190625221319.102643-1-okaya@kernel.org>
	<4fd505d8-8616-b2e7-da92-6b2be9e3616f@windriver.com>
	<CANNYZj_r7wXtZy2he3y_n5cCXagpWsc+nyheGATHYq3k-dUYvQ@mail.gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=okaya@kernel.org; keydata=
	mQENBFrnOrUBCADGOL0kF21B6ogpOkuYvz6bUjO7NU99PKhXx1MfK/AzK+SFgxJF7dMluoF6
	uT47bU7zb7HqACH6itTgSSiJeSoq86jYoq5s4JOyaj0/18Hf3/YBah7AOuwk6LtV3EftQIhw
	9vXqCnBwP/nID6PQ685zl3vH68yzF6FVNwbDagxUz/gMiQh7scHvVCjiqkJ+qu/36JgtTYYw
	8lGWRcto6gr0eTF8Wd8f81wspmUHGsFdN/xPsZPKMw6/on9oOj3AidcR3P9EdLY4qQyjvcNC
	V9cL9b5I/Ud9ghPwW4QkM7uhYqQDyh3SwgEFudc+/RsDuxjVlg9CFnGhS0nPXR89SaQZABEB
	AAG0HVNpbmFuIEtheWEgPG9rYXlhQGtlcm5lbC5vcmc+iQFOBBMBCAA4FiEEYdOlMSE+a7/c
	ckrQvGF4I+4LAFcFAlztcAoCGwMFCwkIBwIGFQoJCAsCBBYCAwECHgECF4AACgkQvGF4I+4L
	AFfidAf/VKHInxep0Z96iYkIq42432HTZUrxNzG9IWk4HN7c3vTJKv2W+b9pgvBF1SmkyQSy
	8SJ3Zd98CO6FOHA1FigFyZahVsme+T0GsS3/OF1kjrtMktoREr8t0rK0yKpCTYVdlkHadxmR
	Qs5xLzW1RqKlrNigKHI2yhgpMwrpzS+67F1biT41227sqFzW9urEl/jqGJXaB6GV+SRKSHN+
	ubWXgE1NkmfAMeyJPKojNT7ReL6eh3BNB/Xh1vQJew+AE50EP7o36UXghoUktnx6cTkge0ZS
	qgxuhN33cCOU36pWQhPqVSlLTZQJVxuCmlaHbYWvye7bBOhmiuNKhOzb3FcgT7kBDQRa5zq1
	AQgAyRq/7JZKOyB8wRx6fHE0nb31P75kCnL3oE+smKW/sOcIQDV3C7mZKLf472MWB1xdr4Tm
	eXeL/wT0QHapLn5M5wWghC80YvjjdolHnlq9QlYVtvl1ocAC28y43tKJfklhHiwMNDJfdZbw
	9lQ2h+7nccFWASNUu9cqZOABLvJcgLnfdDpnSzOye09VVlKr3NHgRyRZa7me/oFJCxrJlKAl
	2hllRLt0yV08o7i14+qmvxI2EKLX9zJfJ2rGWLTVe3EJBnCsQPDzAUVYSnTtqELu2AGzvDiM
	gatRaosnzhvvEK+kCuXuCuZlRWP7pWSHqFFuYq596RRG5hNGLbmVFZrCxQARAQABiQEfBBgB
	CAAJBQJa5zq1AhsMAAoJELxheCPuCwBX2UYH/2kkMC4mImvoClrmcMsNGijcZHdDlz8NFfCI
	gSb3NHkarnA7uAg8KJuaHUwBMk3kBhv2BGPLcmAknzBIehbZ284W7u3DT9o1Y5g+LDyx8RIi
	e7pnMcC+bE2IJExCVf2p3PB1tDBBdLEYJoyFz/XpdDjZ8aVls/pIyrq+mqo5LuuhWfZzPPec
	9EiM2eXpJw+Rz+vKjSt1YIhg46YbdZrDM2FGrt9ve3YaM5H0lzJgq/JQPKFdbd5MB0X37Qc+
	2m/A9u9SFnOovA42DgXUyC2cSbIJdPWOK9PnzfXqF3sX9Aol2eLUmQuLpThJtq5EHu6FzJ7Y
	L+s0nPaNMKwv/Xhhm6Y=
Message-ID: <5647f634-725a-fd9e-3b13-369095f4d415@kernel.org>
Date: Wed, 26 Jun 2019 13:33:57 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CANNYZj_r7wXtZy2he3y_n5cCXagpWsc+nyheGATHYq3k-dUYvQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v1] postinst-intercepts: check tool presence in intercept hooks
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
X-List-Received-Date: Wed, 26 Jun 2019 17:33:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Here is my investigation:

The intercepts are executed on QEMU during cross-compilation using
qemu-wrapper.

I see that the tools were built for the native architecture but
of course they do not exist on the target image and I have no
interest in pulling fonts and such into my image to make bitbake
happy.

DEBUG: Collected intercepts:
  poky/scripts/postinst-intercepts/update_font_cache
  poky/scripts/postinst-intercepts/update_gio_module_cache
  poky/scripts/postinst-intercepts/update_gtk_immodules_cache
  poky/scripts/postinst-intercepts/update_icon_cache
  poky/scripts/postinst-intercepts/update_pixbuf_cache
  poky/scripts/postinst-intercepts/update_udev_hwdb

I also see that other intercepts are doing the same folder/executable
checks.

What is so special about these?


On 6/26/2019 4:59 AM, Alexander Kanavin wrote:
> Yes, this looks suspicious to me as well. If the tools are absent you
> need to investigate why they are absent; skipping the tools execution is
> just sweeping the problem under the carpet, not fixing it.
> 
> Alex
> 
> On Wed, 26 Jun 2019 at 04:15, ChenQi <Qi.Chen@windriver.com
> <mailto:Qi.Chen@windriver.com>> wrote:
> 
>     Under which circumstances will the tools be absent?
>     And why do you check the existence of files for some the the existence
>     of directories for others?
> 
>     Best Regards,
>     Chen Qi
> 
>     On 06/26/2019 06:13 AM, Sinan Kaya wrote:
>     > do_rootfs: The postinstall intercept hook 'update_udev_hwdb'
>     > do_rootfs: The postinstall intercept hook
>     'update_gio_module_cache' failed
>     > do_rootfs: The postinstall intercept hook 'update_icon_cache' failed
>     > do_rootfs: The postinstall intercept hook 'update_icon_cache' failed
>     >
>     > Signed-off-by: Sinan Kaya <okaya@kernel.org <mailto:okaya@kernel.org>>
>     > ---
>     >   scripts/postinst-intercepts/update_font_cache    |  6 ++++--
>     >   .../postinst-intercepts/update_gio_module_cache  | 10 +++++++---
>     >   scripts/postinst-intercepts/update_icon_cache    | 16
>     +++++++++-------
>     >   scripts/postinst-intercepts/update_pixbuf_cache  |  5 ++++-
>     >   scripts/postinst-intercepts/update_udev_hwdb     |  6 ++++--
>     >   5 files changed, 28 insertions(+), 15 deletions(-)
>     >
>     > diff --git a/scripts/postinst-intercepts/update_font_cache
>     b/scripts/postinst-intercepts/update_font_cache
>     > index 3053c7065f4..954acbb41b2 100644
>     > --- a/scripts/postinst-intercepts/update_font_cache
>     > +++ b/scripts/postinst-intercepts/update_font_cache
>     > @@ -5,5 +5,7 @@
>     >   
>     >   set -e
>     >   
>     > -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E
>     ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache
>     --sysroot=$D --system-only ${fontconfigcacheparams}
>     > -chown -R root:root $D${fontconfigcachedir}
>     > +if [ -f $D${libexecdir}/${binprefix}fc-cache ]; then
>     > +     PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D -E
>     ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache
>     --sysroot=$D --system-only ${fontconfigcacheparams}
>     > +     chown -R root:root $D${fontconfigcachedir}
>     > +fi
>     > diff --git a/scripts/postinst-intercepts/update_gio_module_cache
>     b/scripts/postinst-intercepts/update_gio_module_cache
>     > index c87fa85db9e..e8483cb0bf5 100644
>     > --- a/scripts/postinst-intercepts/update_gio_module_cache
>     > +++ b/scripts/postinst-intercepts/update_gio_module_cache
>     > @@ -5,7 +5,11 @@
>     >   
>     >   set -e
>     >   
>     > -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
>     $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
>     > +if [ -f $D${libexecdir}/${binprefix}gio-querymodules ]; then
>     > +
>     > +     PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
>     $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
>     > +
>     > +     [ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
>     > +             chown root:root $D${libdir}/gio/modules/giomodule.cache
>     > +fi
>     >   
>     > -[ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
>     > -     chown root:root $D${libdir}/gio/modules/giomodule.cache
>     > diff --git a/scripts/postinst-intercepts/update_icon_cache
>     b/scripts/postinst-intercepts/update_icon_cache
>     > index 212209a9daf..a67ff7ef970 100644
>     > --- a/scripts/postinst-intercepts/update_icon_cache
>     > +++ b/scripts/postinst-intercepts/update_icon_cache
>     > @@ -5,12 +5,14 @@
>     >   
>     >   set -e
>     >   
>     > -# update native pixbuf loaders
>     >
>     -$STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
>     --update-cache
>     > +if [ -d $STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0 ]; then
>     > +     # update native pixbuf loaders
>     > +   
>      $STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders
>     --update-cache
>     >   
>     > -for icondir in $D/usr/share/icons/*/ ; do
>     > -    if [ -d $icondir ] ; then
>     > -        gtk-update-icon-cache -fqt  $icondir
>     > -    fi
>     > -done
>     > +     for icondir in $D/usr/share/icons/*/ ; do
>     > +         if [ -d $icondir ] ; then
>     > +             gtk-update-icon-cache -fqt  $icondir
>     > +         fi
>     > +     done
>     > +fi
>     >   
>     > diff --git a/scripts/postinst-intercepts/update_pixbuf_cache
>     b/scripts/postinst-intercepts/update_pixbuf_cache
>     > index ea12814474e..166422e5c37 100644
>     > --- a/scripts/postinst-intercepts/update_pixbuf_cache
>     > +++ b/scripts/postinst-intercepts/update_pixbuf_cache
>     > @@ -8,6 +8,9 @@ set -e
>     >   export
>     GDK_PIXBUF_MODULEDIR=$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
>     >   export GDK_PIXBUF_FATAL_LOADER=1
>     >   
>     > -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
>     $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
>     > +if [ -d $D${libdir}/gdk-pixbuf-2.0 ]; then
>     > +     PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
>     $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
>     >       >$GDK_PIXBUF_MODULEDIR/../loaders.cache && \
>     >       sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
>     > +fi
>     > +
>     > diff --git a/scripts/postinst-intercepts/update_udev_hwdb
>     b/scripts/postinst-intercepts/update_udev_hwdb
>     > index c4fb2bffcbf..7b6e38338f3 100644
>     > --- a/scripts/postinst-intercepts/update_udev_hwdb
>     > +++ b/scripts/postinst-intercepts/update_udev_hwdb
>     > @@ -5,5 +5,7 @@
>     >   
>     >   set -e
>     >   
>     > -PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
>     $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D
>     > -chown root:root $D${sysconfdir}/udev/hwdb.bin
>     > +if [ -d $D/lib/udev/hwdb.d ]; then
>     > +     PSEUDO_UNLOAD=1 ${binprefix}qemuwrapper -L $D
>     $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D
>     > +     chown root:root $D${sysconfdir}/udev/hwdb.bin
>     > +fi
> 
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 


