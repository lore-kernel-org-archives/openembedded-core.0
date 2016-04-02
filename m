Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f178.google.com (mail-qk0-f178.google.com
	[209.85.220.178])
	by mail.openembedded.org (Postfix) with ESMTP id BDA4E7708A
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Apr 2016 05:19:28 +0000 (UTC)
Received: by mail-qk0-f178.google.com with SMTP id r184so11177094qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 22:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=a906CZDb6T76vnvppN9mPvOVPlwbdEtrxgE/eNrb/Ao=;
	b=LLk/3P0sYwz9gAzC3QUI5zUjhik3Sr4MV4xNlYzBPVlt9txJz1LowOEYKx9GvD9YJ8
	k1BKC4h5or7lDCDf6GCpl5/hInTfJW+qIYicHE7tkVq0hUMQAFw8FIB4rWXA4Hb3Zmck
	wg9vhPAvrubAvgLBZMrp1wGQk/+CccAAcnzrdJroKKq2hhyQDjkvJTiw6Cy/FyK6D5Ti
	rXpIn+6H68BZYK0WPxY/1UHh3adbIci2VD6FvLIUyk2QxG0U8U3pPwkPLrvXXK/vaZ4L
	mEHXRngb5ceJ+EZkveM8VRCvAcWfCbwVGYvLh31wJnQsKqYLo1JvY+XshaUzquiNtbDG
	ViYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=a906CZDb6T76vnvppN9mPvOVPlwbdEtrxgE/eNrb/Ao=;
	b=D0/sr1raK20Sl2a4ygMgq3C8UHuG97pO3KWYotAfOV9RvPYgU9afgxSoyppxoGyeG/
	hv7jCnongYhPRS0xMyttdtgua5uarsZluNqku9reyT3nmClN0t87sqjSR/qe2eq4Dd7s
	HxKBRVwMp4lRiGCteXp4wCEy77T4kPc9dBzceN2R1+uEoYC4LIpFMGuTeHVdzTEQIZuD
	n3jMvHj1KpQrEMA0dMJRUdWnqXZDyUnl7ucyQEcYteBGYX5eaEvsUcZZUHw7sTzI0NXp
	YqpZRzOF6NypUAREEmX1Diyru/WtPo4X74bUD+qCmZIHfXnu1mXtstK4PFj0l0Z++NUv
	KDig==
X-Gm-Message-State: AD7BkJJlqLfFqReFi2bVc5Gd2BpN7nWZhaI0aovzh4jFVMb3DMbFz148IHLocnU7W/D1sgTdxt7EcKCNvJwmlQ==
MIME-Version: 1.0
X-Received: by 10.55.74.197 with SMTP id x188mr22809006qka.104.1459574369349; 
	Fri, 01 Apr 2016 22:19:29 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Fri, 1 Apr 2016 22:19:28 -0700 (PDT)
Received: by 10.55.130.196 with HTTP; Fri, 1 Apr 2016 22:19:28 -0700 (PDT)
In-Reply-To: <CAJ86T=VWi3JQoCs23RqrW95M=z9DszLfgAo3fOT2UaqiJty5jg@mail.gmail.com>
References: <CAJ86T=VWi3JQoCs23RqrW95M=z9DszLfgAo3fOT2UaqiJty5jg@mail.gmail.com>
Date: Fri, 1 Apr 2016 22:19:28 -0700
Message-ID: <CAMKF1soOTgOOwGvgY7FfErdB6b2XW2_LZ9ZnHm_z7C+ggY9hyw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Staging machine specific kernel headers in sysroot
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
X-List-Received-Date: Sat, 02 Apr 2016 05:19:30 -0000
Content-Type: multipart/alternative; boundary=001a114a8b9ccefa11052f79a369

--001a114a8b9ccefa11052f79a369
Content-Type: text/plain; charset=UTF-8

You should write a bbappend for linux libc headers recipe and apply the
patch to kernel and expose is that way. But before doing that I would
suggest that you work with driver owner to submit their header to kernel.
Since you can get into conflicts in future.
On Apr 1, 2016 8:38 PM, "Andre McCurdy" <armccurdy@gmail.com> wrote:

> Say I have a kernel driver with a user space API (simple struct and
> ioctl definitions) defined in a header file which is part of my
> machine specific kernel. The header file is not found in the upstream
> kernel, so doesn't clash with anything in linux-libc-headers.
>
> Is it OK to use something like the following in my kernel recipe?
>
>   sysroot_stage_all_append () {
>     install -d ${SYSROOT_DESTDIR}/${includedir}/linux
>     install -m644 ${S}/include/linux/foo.h
> ${SYSROOT_DESTDIR}/${includedir}/linux/
>   }
>
> I've tested it and everything seems to work fine, but I'm wondering if
> bypassing do_install like that is going to cause problems somehow?
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a114a8b9ccefa11052f79a369
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">You should write a bbappend for linux libc headers recipe an=
d apply the patch to kernel and expose is that way. But before doing that I=
 would suggest that you work with driver owner to submit their header to ke=
rnel. Since you can get into conflicts in future.</p>
<div class=3D"gmail_quote">On Apr 1, 2016 8:38 PM, &quot;Andre McCurdy&quot=
; &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; wr=
ote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Say I have a ke=
rnel driver with a user space API (simple struct and<br>
ioctl definitions) defined in a header file which is part of my<br>
machine specific kernel. The header file is not found in the upstream<br>
kernel, so doesn&#39;t clash with anything in linux-libc-headers.<br>
<br>
Is it OK to use something like the following in my kernel recipe?<br>
<br>
=C2=A0 sysroot_stage_all_append () {<br>
=C2=A0 =C2=A0 install -d ${SYSROOT_DESTDIR}/${includedir}/linux<br>
=C2=A0 =C2=A0 install -m644 ${S}/include/linux/foo.h<br>
${SYSROOT_DESTDIR}/${includedir}/linux/<br>
=C2=A0 }<br>
<br>
I&#39;ve tested it and everything seems to work fine, but I&#39;m wondering=
 if<br>
bypassing do_install like that is going to cause problems somehow?<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a114a8b9ccefa11052f79a369--
