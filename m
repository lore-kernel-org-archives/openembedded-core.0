Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 37C4F7820C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:29:14 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id f199so11269770wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=YVtRoob73j52MDmXV8SHcN2XsylUx+nRRrTDPAFVTyM=;
	b=mQvfruI/JYNBzO3x9wFxOTixHdZEPjOeWBKUU6mjWkgMVLsCXUQzBbdFBl2w2Ei6ab
	hmAafoiQTV2JiU7ykQqvmlrfr+JvZRgDATdA+yIqc7JdjXpaYOcOfZEg1Tug284dsdB5
	UVyyTGcDyh5VcAOcYF9T/24HwvCBtsSeoOLVyXoFHeoUWBfXGluUB1rgro47kgKmL0/B
	Wx14M1owfKPcvZfuz/eIHopIkJsvQJEyISAO3aAC0ZgIWzk1JEZtbXQAi8KfrBMvoyVn
	ZSgl43HaVREkPmMn0YBURgKSdPr8N6Yfk67tiM6OsoSiiX40yaFOIsWvnByqo6oUB5KD
	I7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=YVtRoob73j52MDmXV8SHcN2XsylUx+nRRrTDPAFVTyM=;
	b=cj1Ad+6LV8PzgyPzfFO/QrCzsQmtGiV9xNDAEBbU81qOF+ihoRvewFJNcXIV/zhUxk
	2M8kbwBSVPQ/euxmysU/M2SSCWDzAsiAgiMVI1CT10pupGaTjYokZjNOgxFwUqutRZyE
	X7RCKczhUP1kClGMPOtg+G3Qgl8pprRxP1zsy6p8hx6Ktm/7b+0TFJc5q3GtplNaTuF2
	S756zcmqYfKqpTPwe7CTInNsLRj0QgMPwU53pa3mx7+rxuvooniGUDr/agUU19rUTmAT
	8WuIiOZPyEkRh/5eo6MHa9xAyQJy5p8mX9vKApd81/eDON5ROkF/yJOcQ6q1UZgTASWw
	ac5A==
X-Gm-Message-State: AHPjjUii0cwaFltVgBe5LPUbWVE7cOItiHvWweXA6VR4Nz1Br6xkEGZS
	3O/MCjFJaACyAoMFIvRVUn0QOAG0ZqnC
X-Google-Smtp-Source: AOwi7QBXauyfHEuB3jdVyUJAA+hMraGKxE0vBkKqhGVHBRpSrkOle6WAHuZML8HuFWwoBS3nU0dlzwwVPNs6KZxPveE=
X-Received: by 10.28.236.212 with SMTP id h81mr2522452wmi.42.1504906156021;
	Fri, 08 Sep 2017 14:29:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.155.157 with HTTP; Fri, 8 Sep 2017 14:29:15 -0700 (PDT)
In-Reply-To: <75F5325D-9BEC-49A6-AEF8-75448B46BCF7@prevas.dk>
References: <20170821083946.4493-1-mnhu@prevas.dk>
	<20170821092134.6329-1-mnhu@prevas.dk>
	<CAPyrkgyuQegVc-d694EQgXMuEdBZY4LbjQ4aObCUV1yh=jznjg@mail.gmail.com>
	<20170908203726.GG26405@denix.org>
	<75F5325D-9BEC-49A6-AEF8-75448B46BCF7@prevas.dk>
From: Paul Barker <pbarker@toganlabs.com>
Date: Fri, 8 Sep 2017 22:29:15 +0100
Message-ID: <CAPyrkgyzzfR7jmeyJURRyPra4Jd2CPKWMiJbEPR3a8W=h+4W+A@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin.hundeboll@prevas.dk>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] kernel-module-split: rrecommend kernel-image instead of rdepend
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
X-List-Received-Date: Fri, 08 Sep 2017 21:29:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 8, 2017 at 10:07 PM, Martin Hundeb=C3=B8ll
<martin.hundeboll@prevas.dk> wrote:
>
>
> On September 8, 2017 10:37:26 PM GMT+02:00, Denys Dmytriyenko <denis@deni=
x.org> wrote:
>>On Fri, Sep 08, 2017 at 09:06:17PM +0100, Paul Barker wrote:
>>>
>>> This breaks the method described in the kernel dev FAQ to omit the
>>> kernel image from the rootfs which is to set the following in a conf
>>> file:
>>>
>>>     RDEPENDS_kernel-base =3D ""
>>>
>>> See
>>http://www.yoctoproject.org/docs/2.3.1/kernel-dev/kernel-dev.html#idm4569=
0538384880.
>>>
>>> By recommending kernel-image directly instead of recommending the
>>> top-level kernel-<version> package which was actually removed from
>>> extra_depends, we skip the inclusion of the kernel-base package. I'm
>>> not familiar enough with the details of kernel module loading to know
>>> if the 2 files in kernel-base (modules.builtin and modules.order) are
>>> strictly needed but I think they should at least be included in via
>>> recommendation.
>>>
>>> As we already have a documented way to omit the kernel image, can we
>>> revert this?
>>>
>>> As an alternative I can send in a patch which changes the recommend
>>to
>>> the top-level kernel-<version> package instead of kernel-image.
>>
>>FWIW, this was discussed at #yocto on IRC today. When I first saw the
>>change
>>several days ago, I was puzzled as well...
>>The existing method has been in use by many of us for a very long time
>>and
>>seems to be well documented - I also vote for reverting the change.
>
> Does setting `RDEPENDS_kernel-base =3D ""` in an image recipe work too?
>

No, you'd need it to be set in a conf file so it takes effect when the
kernel-base package is created.

I can see the issue here though. Can you set `RDEPENDS_kernel-base =3D
""` globally and explicitly install kernel-image into the appropriate
image? If not then yes we'll need to find an alternative solution to
simply reverting the change.

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

