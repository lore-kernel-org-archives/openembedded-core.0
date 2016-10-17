Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id DD30471AD3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 13:29:11 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r16so12809855pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 06:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=bt/v7wrjZLFVlt2BjaXFw/hooblZP7OHTM3laDSdKws=;
	b=MxYsGEx9U/BlzKk49A6hWYbeJwiJykKpxJDR4Ol7YJSpMqjMIE3UGWcyrP4o8TwPQu
	Le1ATUfTvsOIfCw6yVuwGsPqxpPjuq/1aC1wQLeHN8HOnPfmV4xiG84Y623ksw0G9mhQ
	oSdalrWyQsRr7xFC1GSA4SuHyIAcm5jjSiNK4mHvtdOgDaQgV4YXH3PGkJfceukHplXg
	7RbapXh46j11p9wbXSdFHJ5GurWkImu8QUU0rbHNPhAOyx3cEFJF+ELqRLOhgVJe9r12
	7x/W+fRn7PxKCIyUJ49xYvQIwlFHaPxe7fhTJXJ0T1J5/0LnZ66VSMoDlu8OCxhsc9yY
	jspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=bt/v7wrjZLFVlt2BjaXFw/hooblZP7OHTM3laDSdKws=;
	b=Q2gBYOKJT/F7e3WavjGxnjwM5HSfXIBIxpTkQogibj+ul30Sgm7CYLUgAnSj7KKnFO
	GEf//2FvPIyZURO1q/mop8CR518VvYVLnppo87YLPe1pc3ZQVrprPtVtIvToHN5jEA/M
	UC0KadnwcAYPRnO7wRTF9/9U9qvuslRpSDSG+K2QJt33gPmJn7dEw4nQV2Xut3BiMsWw
	iJOJRamNHs33NlUfs5pIcGcgd2CqJ+k2EHYfepGls7OzyngHbvXSBpH1EDC9yVe7uuvw
	VIUJswU1UhKvmfjiCunrDni0I/jcq2v06Y+gLkJyaqEploeRXX8TBtedCbHtaMNIyS5B
	+/Mg==
X-Gm-Message-State: AA6/9RmJwEULFP34nQQf7mzleEj7Ll4O1z4hGC/7MHLqj/BPwygbWbbJKxZS8UosnM0RKg==
X-Received: by 10.98.77.1 with SMTP id a1mr38084962pfb.160.1476710953258;
	Mon, 17 Oct 2016 06:29:13 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:10af:7454:ca4e:95f6?
	([2601:646:8882:b8c:10af:7454:ca4e:95f6])
	by smtp.gmail.com with ESMTPSA id
	g78sm48317072pfe.19.2016.10.17.06.29.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Oct 2016 06:29:12 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Khem Raj <raj.khem@gmail.com>
X-Mailer: iPad Mail (14B71)
In-Reply-To: <97106aec-ccb5-ae4c-1b4d-8519e6b59156@windriver.com>
Date: Mon, 17 Oct 2016 06:29:11 -0700
Message-Id: <83A798E4-7985-46C1-A0EE-928EE10BFC66@gmail.com>
References: <20161012023734.11991-1-kai.kang@windriver.com>
	<CAJTo0LbhDO+ijOerKVao+s+fruJK98VqQTeMSzxir3_eYWLMbw@mail.gmail.com>
	<57FF9CD8.9040305@windriver.com>
	<CAJTo0LaFVw6oUW5jL7kR-B3TWenNwowGRzcG8=5K=CGqPFx+5w@mail.gmail.com>
	<58009F43.6070904@windriver.com>
	<CAMKF1srF3ow22DWfsj78MyaR14N5+nCxvdanXwsKqroLG_9DRg@mail.gmail.com>
	<97106aec-ccb5-ae4c-1b4d-8519e6b59156@windriver.com>
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
X-List-Received-Date: Mon, 17 Oct 2016 13:29:12 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Oct 16, 2016, at 10:52 PM, Kang Kai <Kai.Kang@windriver.com> wrote:
>=20
>> On 2016=E5=B9=B410=E6=9C=8814=E6=97=A5 17:32, Khem Raj wrote:
>>> On Fri, Oct 14, 2016 at 11:02 AM, Kang Kai <Kai.Kang@windriver.com> wr=
ote:
>>> On 2016=E5=B9=B410=E6=9C=8813=E6=97=A5 22:59, Burton, Ross wrote:
>>>=20
>>>=20
>>>> On 13 October 2016 at 15:40, Kang Kai <Kai.Kang@windriver.com> wrote:
>>>> gcc checks tsan and lsan support in source file
>>>> gcc/libsanitizer/configure.tgt, it seems only support x86_64. Then ts=
an and
>>>> lsan related packages will be empty for other target.
>>>> For qemuarm project, add in local.conf:
>>>>=20
>>>> IMAGE_INSTALL_append =3D " libtsan"
>>>=20
>>> If libtsan is x86-64 only, why not only add it for x86-64 images?  The
>>> package not existing on machines it can't be built for is more obvious=
 than
>>> existing but being empty.
>>>=20
>>>=20
>>> The real scenario is for x86-64 kernel with x86 rootfs. We created a
>>> template to enable gcc sanitize support. It just simple adds sanitize
>>> related packages to image:
>>>=20
>>> LIBX_DEV ?=3D ""
>>> LIBX_DEV_x86-64 =3D "liblsan-dev libtsan-dev"
>>>=20
>>> IMAGE_INSTALL +=3D " \
>>>     gcc-sanitizers \
>>>     libasan-dev \
>>>     libubsan-dev \
>>>     ${LIBX_DEV} \
>>> "
>>>=20
>>> When multilib is enabled, it fails for x86-64 kernel with x86 rootfs s=
uch as
>>> lib32-xxx-image on qemux86-64. Var IMAGE_INSTALL will be expand with p=
refix
>>> lib32 but lib32-lsan* and lib32-tsan* are empty then cause the failure=
s.
>> perhaps we should build sanitizers for multilib too ?
>=20
> The problem is that thread and leak sanitizers are not supported for x86=
 by checking in gcc/libsanitizer/configure.tgt:
>=20
>=20
> # Filter out unsupported systems.
> TSAN_TARGET_DEPENDENT_OBJECTS=3D
> case "${target}" in
>  x86_64-*-linux* | i?86-*-linux*)
>        if test x$ac_cv_sizeof_void_p =3D x8; then
>                TSAN_SUPPORTED=3Dyes
>                LSAN_SUPPORTED=3Dyes
>                TSAN_TARGET_DEPENDENT_OBJECTS=3Dtsan_rtl_amd64.lo
>        fi
>        ;;
> ...
>=20
> that causes packages lib32-lsan* and lib32-tsan* are empty.

Ok then may be keeping the empty packages is ok even though not optimal
>=20
>=20
> --Kai
>=20
>>=20
>>> Regards,
>>> Kai
>>>=20
>>>=20
>>> Ross
>>>=20
>>>=20
>>>=20
>>> --
>>> Regards,
>>> Neil | Kai Kang
>=20
>=20
> -- not=20
> Regards,
> Neil | Kai Kang
>=20

