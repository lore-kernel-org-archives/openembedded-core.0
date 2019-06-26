Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 092EC7E6D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 18:10:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id x4so3811876wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jun 2019 11:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=5TtYIwi9i4Hvyqt3YCJPg4oj7FWXgPzytGvkJZGDtB8=;
	b=qhxBDxnJt9wEVYmtRe1BmlcxeDrJaafRkUJUAjLzZ2SkYp4dzw5EQqPFLxNdBXjOlu
	T1S5WQe7UY7yyMXX2iRNup4y3FlEwxs9WZbqUFrlXVVGM/93g8qJYDpmEErJ2lmGbgh6
	s+nQeKNVTPEvpyLFKgHRIZSU4w2BrLtfeSpRs5dJTxNzVK/Nq81Xn3NgZDXlsqPuHXk6
	zRNg42jyqB6J0k2xIsTwYQFZhZiDo+sqqtdADSBw7QPhf7FBaKRhHflxD4v8pUbsU2GT
	tDjxgquBvsn+KRpOoVtkYulxR0Oe3OJ4jCkgc04mjsFOcS9SJo6N4pEXYYe2YW4tlifp
	+FwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=5TtYIwi9i4Hvyqt3YCJPg4oj7FWXgPzytGvkJZGDtB8=;
	b=nPmSG/PKvY8uu0bwwd/lSl/Cqt+RhrqdlCVPtX0vx3xUAfpLINubC6vAtOEGxd0kmL
	i30oOO7ehnHZE7ByAcfRkQHQMiTgaIy3hFhHVRunuzvLULelhjnvsLi1u+cfCmDfBVE2
	K032/cDdXTLBlzMDBXDHqqtjgL25W5uZZ6FxzFcN8xL2j3MdQ4e43Sy/sOFIfLgdCZrB
	aHwK6T0EZj7rx40Ti6w5/ZYivpZxHPEuqqKVBw4UhHP/+O9Ms2eXCf9LbLGslQP7lmfs
	51yINcADaBPu8IYH3m+3I8BH6SgYA/zafPS3aXfZsyNn4sSZvqSVdI8nN2vZHS/1pbqB
	yzyg==
X-Gm-Message-State: APjAAAVaxUDpBnO/AWg8xO9LkuPtE3llISXyobGaw+1FNSnHpz63gSQQ
	e5vUx0pPkcM2YU6Mmz4Bihg=
X-Google-Smtp-Source: APXvYqwajFXWYQuB1LT0GZq1J11mEjRIOsB2OeEj170AnF+HaqUfzsQ/d6JneQmtv8ifE6vD9wSthw==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr4689155wrw.177.1561572622640; 
	Wed, 26 Jun 2019 11:10:22 -0700 (PDT)
Received: from ?IPv6:2a01:598:9085:1a24:d142:2333:ed50:afa1?
	([2a01:598:9085:1a24:d142:2333:ed50:afa1])
	by smtp.gmail.com with ESMTPSA id 15sm1939550wmk.34.2019.06.26.11.10.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jun 2019 11:10:21 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16F203)
In-Reply-To: <5647f634-725a-fd9e-3b13-369095f4d415@kernel.org>
Date: Wed, 26 Jun 2019 20:10:20 +0200
Message-Id: <AD733DAE-1E42-4797-B5C2-A978300E59A8@gmail.com>
References: <20190625221319.102643-1-okaya@kernel.org>
	<4fd505d8-8616-b2e7-da92-6b2be9e3616f@windriver.com>
	<CANNYZj_r7wXtZy2he3y_n5cCXagpWsc+nyheGATHYq3k-dUYvQ@mail.gmail.com>
	<5647f634-725a-fd9e-3b13-369095f4d415@kernel.org>
To: Sinan Kaya <Okaya@kernel.org>
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
X-List-Received-Date: Wed, 26 Jun 2019 18:10:22 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Basically they are executed only when you have something in your target imag=
e that requires their execution (usually to populate some database). If the e=
xecution fails for some reason, the correct way to handle that is to look in=
to the failure instead of fixing the symptoms (missing files for instance).

Alex

> On 26 Jun 2019, at 19.33, Sinan Kaya <Okaya@kernel.org> wrote:
>=20
> Here is my investigation:
>=20
> The intercepts are executed on QEMU during cross-compilation using
> qemu-wrapper.
>=20
> I see that the tools were built for the native architecture but
> of course they do not exist on the target image and I have no
> interest in pulling fonts and such into my image to make bitbake
> happy.
>=20
> DEBUG: Collected intercepts:
>  poky/scripts/postinst-intercepts/update_font_cache
>  poky/scripts/postinst-intercepts/update_gio_module_cache
>  poky/scripts/postinst-intercepts/update_gtk_immodules_cache
>  poky/scripts/postinst-intercepts/update_icon_cache
>  poky/scripts/postinst-intercepts/update_pixbuf_cache
>  poky/scripts/postinst-intercepts/update_udev_hwdb
>=20
> I also see that other intercepts are doing the same folder/executable
> checks.
>=20
> What is so special about these?
>=20
>=20
>> On 6/26/2019 4:59 AM, Alexander Kanavin wrote:
>> Yes, this looks suspicious to me as well. If the tools are absent you
>> need to investigate why they are absent; skipping the tools execution is
>> just sweeping the problem under the carpet, not fixing it.
>>=20
>> Alex
>>=20
>> On Wed, 26 Jun 2019 at 04:15, ChenQi <Qi.Chen@windriver.com
>> <mailto:Qi.Chen@windriver.com>> wrote:
>>=20
>>    Under which circumstances will the tools be absent?
>>    And why do you check the existence of files for some the the existence=

>>    of directories for others?
>>=20
>>    Best Regards,
>>    Chen Qi
>>=20
>>>    On 06/26/2019 06:13 AM, Sinan Kaya wrote:
>>> do_rootfs: The postinstall intercept hook 'update_udev_hwdb'
>>> do_rootfs: The postinstall intercept hook
>>    'update_gio_module_cache' failed
>>> do_rootfs: The postinstall intercept hook 'update_icon_cache' failed
>>> do_rootfs: The postinstall intercept hook 'update_icon_cache' failed
>>>=20
>>> Signed-off-by: Sinan Kaya <okaya@kernel.org <mailto:okaya@kernel.org>>
>>> ---
>>>    scripts/postinst-intercepts/update_font_cache    |  6 ++++--
>>>    .../postinst-intercepts/update_gio_module_cache  | 10 +++++++---
>>>    scripts/postinst-intercepts/update_icon_cache    | 16
>>    +++++++++-------
>>>    scripts/postinst-intercepts/update_pixbuf_cache  |  5 ++++-
>>>    scripts/postinst-intercepts/update_udev_hwdb     |  6 ++++--
>>>    5 files changed, 28 insertions(+), 15 deletions(-)
>>>=20
>>> diff --git a/scripts/postinst-intercepts/update_font_cache
>>    b/scripts/postinst-intercepts/update_font_cache
>>> index 3053c7065f4..954acbb41b2 100644
>>> --- a/scripts/postinst-intercepts/update_font_cache
>>> +++ b/scripts/postinst-intercepts/update_font_cache
>>> @@ -5,5 +5,7 @@
>>>   =20
>>>    set -e
>>>   =20
>>> -PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D -E
>>    ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache
>>    --sysroot=3D$D --system-only ${fontconfigcacheparams}
>>> -chown -R root:root $D${fontconfigcachedir}
>>> +if [ -f $D${libexecdir}/${binprefix}fc-cache ]; then
>>> +     PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D -E
>>    ${fontconfigcacheenv} $D${libexecdir}/${binprefix}fc-cache
>>    --sysroot=3D$D --system-only ${fontconfigcacheparams}
>>> +     chown -R root:root $D${fontconfigcachedir}
>>> +fi
>>> diff --git a/scripts/postinst-intercepts/update_gio_module_cache
>>    b/scripts/postinst-intercepts/update_gio_module_cache
>>> index c87fa85db9e..e8483cb0bf5 100644
>>> --- a/scripts/postinst-intercepts/update_gio_module_cache
>>> +++ b/scripts/postinst-intercepts/update_gio_module_cache
>>> @@ -5,7 +5,11 @@
>>>   =20
>>>    set -e
>>>   =20
>>> -PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D
>>    $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
>>> +if [ -f $D${libexecdir}/${binprefix}gio-querymodules ]; then
>>> +
>>> +     PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D
>>    $D${libexecdir}/${binprefix}gio-querymodules $D${libdir}/gio/modules/
>>> +
>>> +     [ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
>>> +             chown root:root $D${libdir}/gio/modules/giomodule.cache
>>> +fi
>>>   =20
>>> -[ ! -e $D${libdir}/gio/modules/giomodule.cache ] ||
>>> -     chown root:root $D${libdir}/gio/modules/giomodule.cache
>>> diff --git a/scripts/postinst-intercepts/update_icon_cache
>>    b/scripts/postinst-intercepts/update_icon_cache
>>> index 212209a9daf..a67ff7ef970 100644
>>> --- a/scripts/postinst-intercepts/update_icon_cache
>>> +++ b/scripts/postinst-intercepts/update_icon_cache
>>> @@ -5,12 +5,14 @@
>>>   =20
>>>    set -e
>>>   =20
>>> -# update native pixbuf loaders
>>>=20
>>    -$STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-=
loaders
>>    --update-cache
>>> +if [ -d $STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0 ]; then
>>> +     # update native pixbuf loaders
>>> +  =20
>>     $STAGING_DIR_NATIVE/${libdir_native}/gdk-pixbuf-2.0/gdk-pixbuf-query-=
loaders
>>    --update-cache
>>>   =20
>>> -for icondir in $D/usr/share/icons/*/ ; do
>>> -    if [ -d $icondir ] ; then
>>> -        gtk-update-icon-cache -fqt  $icondir
>>> -    fi
>>> -done
>>> +     for icondir in $D/usr/share/icons/*/ ; do
>>> +         if [ -d $icondir ] ; then
>>> +             gtk-update-icon-cache -fqt  $icondir
>>> +         fi
>>> +     done
>>> +fi
>>>   =20
>>> diff --git a/scripts/postinst-intercepts/update_pixbuf_cache
>>    b/scripts/postinst-intercepts/update_pixbuf_cache
>>> index ea12814474e..166422e5c37 100644
>>> --- a/scripts/postinst-intercepts/update_pixbuf_cache
>>> +++ b/scripts/postinst-intercepts/update_pixbuf_cache
>>> @@ -8,6 +8,9 @@ set -e
>>>    export
>>    GDK_PIXBUF_MODULEDIR=3D$D${libdir}/gdk-pixbuf-2.0/2.10.0/loaders
>>>    export GDK_PIXBUF_FATAL_LOADER=3D1
>>>   =20
>>> -PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D
>>    $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
>>> +if [ -d $D${libdir}/gdk-pixbuf-2.0 ]; then
>>> +     PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D
>>    $D${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders \
>>>        >$GDK_PIXBUF_MODULEDIR/../loaders.cache && \
>>>        sed -i -e "s:$D::g" $GDK_PIXBUF_MODULEDIR/../loaders.cache
>>> +fi
>>> +
>>> diff --git a/scripts/postinst-intercepts/update_udev_hwdb
>>    b/scripts/postinst-intercepts/update_udev_hwdb
>>> index c4fb2bffcbf..7b6e38338f3 100644
>>> --- a/scripts/postinst-intercepts/update_udev_hwdb
>>> +++ b/scripts/postinst-intercepts/update_udev_hwdb
>>> @@ -5,5 +5,7 @@
>>>   =20
>>>    set -e
>>>   =20
>>> -PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D
>>    $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D
>>> -chown root:root $D${sysconfdir}/udev/hwdb.bin
>>> +if [ -d $D/lib/udev/hwdb.d ]; then
>>> +     PSEUDO_UNLOAD=3D1 ${binprefix}qemuwrapper -L $D
>>    $D${libexecdir}/${binprefix}udevadm hwdb --update --root $D
>>> +     chown root:root $D${sysconfdir}/udev/hwdb.bin
>>> +fi
>>=20
>>=20
>>    --=20
>>    _______________________________________________
>>    Openembedded-core mailing list
>>    Openembedded-core@lists.openembedded.org
>>    <mailto:Openembedded-core@lists.openembedded.org>
>>    http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>=20
>=20

