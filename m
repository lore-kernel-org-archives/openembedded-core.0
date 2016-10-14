Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id BD23F71996
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 09:33:17 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id b186so4750729vkb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CsQ9dDH6heEF9tI18MtR/fIOUsvCQKvrg0LTiTI5JoQ=;
	b=Nsw6+wjPAzlCsWGZ6O8mC0jzatyk6r8kUl+HWAsTAhNnoi7O36ryWW7xktsMTZ/lUO
	wBpYi7wr/jZonWJhW6x0qOpUdYQizxDj2s6eWc/PAVRFWtUd9YCcVOXTp6AmXKoKe3Jm
	GC7r7vUek9rqghT/ancMPSj3W2c7oAQyl+ccLcGwnUyaUjV2iAKeA3OfTVs1hP1nXb2Q
	9B8H0pJvFcW8LN8ppJeXTcFQc9BP75uwjn8ywqqxhadmyrQuK6znyqUDv5SbDPtOf4JT
	uVirwZtCB98RRIioPLHsWEBx8HwuAU8QJCyEp6tFnRqaL8SfLoXzSdawIzBjkCoOwyWl
	TZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CsQ9dDH6heEF9tI18MtR/fIOUsvCQKvrg0LTiTI5JoQ=;
	b=S1g8xPBmk+offNyLfE+ljtXUsCjoDvgA9Llk9EcDS36xKYAOmMmLRFnZ96xYT+miSV
	iU12zz/xargKxGyrN9WuquetcRIHyaCsg7/1tWxt24x46KoxIyd48ZRV0PhfAJn+j9+v
	ugdwIzVFZ3GbdMnvSOQWQhvAL6LoEx7qOdVoLVMJbx2UCA4gaeO8SmqDmZjBdw8Vv1Dt
	GaDtvwnBho80GASFgiNCww/Il5CJFI4NSWjJk7McsoHWDDOOw19zQIv+6K0oa/XVEjkY
	7V4PV36rpUDdK0M5SMEBU12SAK6q3u+9ysEeC2+uL/3Bsd3JGL68btcYhpysmrHboEjD
	bfdQ==
X-Gm-Message-State: AA6/9Rn8g+pw2vrPMoeq3BjE3T9PnklqDDF6WocLZHuH1+DFiwdAwIrRf3cT5OinDUWGksdtBlFeUZ5R7lMEEQ==
X-Received: by 10.31.108.70 with SMTP id h67mr7998165vkc.163.1476437598534;
	Fri, 14 Oct 2016 02:33:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Fri, 14 Oct 2016 02:32:48 -0700 (PDT)
In-Reply-To: <58009F43.6070904@windriver.com>
References: <20161012023734.11991-1-kai.kang@windriver.com>
	<CAJTo0LbhDO+ijOerKVao+s+fruJK98VqQTeMSzxir3_eYWLMbw@mail.gmail.com>
	<57FF9CD8.9040305@windriver.com>
	<CAJTo0LaFVw6oUW5jL7kR-B3TWenNwowGRzcG8=5K=CGqPFx+5w@mail.gmail.com>
	<58009F43.6070904@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Oct 2016 11:32:48 +0200
Message-ID: <CAMKF1srF3ow22DWfsj78MyaR14N5+nCxvdanXwsKqroLG_9DRg@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-sanitizers: allow empty for lsan and tsan packages
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
X-List-Received-Date: Fri, 14 Oct 2016 09:33:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2016 at 11:02 AM, Kang Kai <Kai.Kang@windriver.com> wrote:
> On 2016=E5=B9=B410=E6=9C=8813=E6=97=A5 22:59, Burton, Ross wrote:
>
>
> On 13 October 2016 at 15:40, Kang Kai <Kai.Kang@windriver.com> wrote:
>>
>> gcc checks tsan and lsan support in source file
>> gcc/libsanitizer/configure.tgt, it seems only support x86_64. Then tsan =
and
>> lsan related packages will be empty for other target.
>> For qemuarm project, add in local.conf:
>>
>> IMAGE_INSTALL_append =3D " libtsan"
>
>
> If libtsan is x86-64 only, why not only add it for x86-64 images?  The
> package not existing on machines it can't be built for is more obvious th=
an
> existing but being empty.
>
>
> The real scenario is for x86-64 kernel with x86 rootfs. We created a
> template to enable gcc sanitize support. It just simple adds sanitize
> related packages to image:
>
> LIBX_DEV ?=3D ""
> LIBX_DEV_x86-64 =3D "liblsan-dev libtsan-dev"
>
> IMAGE_INSTALL +=3D " \
>     gcc-sanitizers \
>     libasan-dev \
>     libubsan-dev \
>     ${LIBX_DEV} \
> "
>
> When multilib is enabled, it fails for x86-64 kernel with x86 rootfs such=
 as
> lib32-xxx-image on qemux86-64. Var IMAGE_INSTALL will be expand with pref=
ix
> lib32 but lib32-lsan* and lib32-tsan* are empty then cause the failures.

perhaps we should build sanitizers for multilib too ?

>
> Regards,
> Kai
>
>
> Ross
>
>
>
> --
> Regards,
> Neil | Kai Kang

