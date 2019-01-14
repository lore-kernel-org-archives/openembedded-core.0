Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 778FD7BFF7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 13:52:32 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id b63so8592149ywc.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 05:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZyY9+IHbuqOdggb3uPuohIoMg7emYVz6V39BeUaajHg=;
	b=JK6lGXUao0fqL0B+V6rYh4K8L3yA9Mr683PduRjQXHp0BJG4oETNuuRzgnlR5TxNRM
	yF4hi29uZACCebvzF1GebNLtqk67woBFpHXh8ED1gB7cQtWVo+Z8f12VNcAkGLGjfq+0
	4Kz5I8Lxl5u0L9+4Q6aET9I+TTKB+bga+hAjfM/orIAtKVrc+aw8+y/wAQ5vO6gCW06z
	XX66rh+pSiIG7SMEj4/AVm7z03WS4AoG5FQX+1WpIAl3prFfS2LK4NKwplytODEDAaPY
	fSPXfou6y3raAAWtsSvDsZBnSJ9UhSTS92/4yqg63lchJO+dX1B8DcCmNxntn70Oc3Gc
	IPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZyY9+IHbuqOdggb3uPuohIoMg7emYVz6V39BeUaajHg=;
	b=IlaVzmAl2ZD+lNx65NT6t+qN4+m7rRjQz3E6dl/iay3JniCGW/o/46PmoWXl4YwvpI
	ttdUZ5sKjcrG36C0luLEJBTW9II2LZ1cKjNbE5WubDN329axa9RfPopph9WX8o74Qyxz
	3fg62PhT+sc+WgyMLKooNgQcFZaf8e8dxo7JlJJrsEfYSGcr/HmeFW9zdRMNhhZ2kGuj
	VXf2qU87CGpTPmZzZuX8d5sS11EA+uCF/EZiUG/BH8UrXql+DFpLsP0fF+s/ofzDd0YN
	3YrMaat3PY8DffPqrNVDbh7WbFdi0ylsEy9XVqgutrL/birgE4sT9c1XwLIKdLdrZ1dA
	FoSA==
X-Gm-Message-State: AJcUukcwOFR7+tyxeTJk26yD+dm8IOnCFvPmnUDEuWl6YH2NKGPuGO16
	obLjhE6A4hnWrDVbhz4iaGzvLImVJ+pogUkbzgjAATdr
X-Google-Smtp-Source: ALg8bN7ioC83BBuPGsWzTTBmvEfWejpoQPf9sBnwrsQlbXkXz2l7s7v3dqqgRvkziSHnDyWymniRODncMp3gKsfeaxM=
X-Received: by 2002:a81:5a86:: with SMTP id
	o128mr22820461ywb.205.1547473953212; 
	Mon, 14 Jan 2019 05:52:33 -0800 (PST)
MIME-Version: 1.0
References: <20190111101609.5587-1-samuli.piippo@qt.io>
	<CAJTo0Lazeqsrp7EUoX0uZHRf5k6_yfy=M2anyFDenMAbS-iYZw@mail.gmail.com>
In-Reply-To: <CAJTo0Lazeqsrp7EUoX0uZHRf5k6_yfy=M2anyFDenMAbS-iYZw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 14 Jan 2019 14:52:21 +0100
Message-ID: <CALbNGRQhduq9wk-Hth=EOqKMpH6HLoe6KHg40wjWCDHcCd+YbA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sdl2: fix sdl2.pc include paths
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
X-List-Received-Date: Mon, 14 Jan 2019 13:52:32 -0000
Content-Type: text/plain; charset="UTF-8"

My two comments:

1. There is already an upgrade libsdl2 -> 2.09 pending so this patch
needs rebase [1]
2. Removing CFLAGS is easier but potentially a risk of unwanted
effects. My sdl2.pc contains -D_REENTRANT. This should be obsolete but
who guarantees that there isn't some old application still requiring
it (because it is set in other build environments).

[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-January/277739.html

Andreas


On Mon, Jan 14, 2019 at 11:52 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> Would it be easier to just remove @SDL_CFLAGS@ from sdl.pc.in?  Does that contain other values that are needed, or are they all spurious?
>
> Ross
>
> On Sat, 12 Jan 2019 at 08:43, Samuli Piippo <samuli.piippo@qt.io> wrote:
>>
>> SDL2 dumps all cflags to the sdl2.pc, which might then contain paths
>> to the recipe sysroot include dirs.
>>
>> Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
>> ---
>>  meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
>> index 812a9abf3c..a9c5d8a443 100644
>> --- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
>> +++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.8.bb
>> @@ -64,6 +64,10 @@ do_configure_prepend() {
>>          export SYSROOT=$PKG_CONFIG_SYSROOT_DIR
>>  }
>>
>> +do_install_append() {
>> +    sed -i -e "s|${STAGING_INCDIR}|$\{includedir}|g" ${D}${libdir}/pkgconfig/sdl2.pc
>> +}
>> +
>>  FILES_${PN}-dev += "${libdir}/cmake"
>>
>>  BBCLASSEXTEND = "native nativesdk"
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

