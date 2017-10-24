Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f54.google.com (mail-pg0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id B1E016011A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 16:26:26 +0000 (UTC)
Received: by mail-pg0-f54.google.com with SMTP id y5so7111737pgq.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 09:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=kjWghS0I8/8e5ppLEZ6bFGion2OHYjcbX50Wi9eKqd0=;
	b=lRbxy13TWfDnN1VHor1csx8quwDNFI/Eu0xSM4W88l0rBqev4OkmLLDlWcuPlvKSOm
	zFlO61W7ldy+ragkXfuLU4alj9haaCHqlKveDp7NNMHqvvt04en7vXCBqMKkr6XHQybP
	dAYOPFFNw4jwykpGYytw6n4klyBylcBL3WdyiG9lEtVVL7i+AO5vi38k9bTOCGgT376I
	qVERoBdGRycOjQtXfFdInPWwDRZHsBwC8HgGB9iGWeqQ9JpG4fOc39QMjAQNVGzi5C1j
	YYrfvTSNIrKlAkPo+3oudXhCfI+iE9CzfDe4iKxRaKnlVWWoYV1aLXv4Jx23lB6zSLv3
	0wOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=kjWghS0I8/8e5ppLEZ6bFGion2OHYjcbX50Wi9eKqd0=;
	b=UJf+dMqsBsCVLx8GnJZr08riqiIyzImQ7ZrF0Rsg9Oz7y/wT7OIxbhJlGf94S4xJ2N
	BaPnc2IQ+XaK8KDu6N8q7PhL7uShq7q7IsdK9mG80HMqRWs7xl40mico2QMHrwBY0R13
	uts+o8GFXvVI5Jne0qTYbJLdF9EggBf/EPSYagiRYr9Y9um69ffVgVHdqsm5R2CP8V5/
	ScNiaxhSYwgx3nPqpWb3VGx0s20EhcSE0qeEaLy49U7lbac+yse2mn5chIWaQZEUJtoa
	uUCzmUe7bB07G2OjJvYbC5fu2jrBQFIROAg6JCUg6UrhnRhlLqIuWI61wmXavotV7JbW
	WISQ==
X-Gm-Message-State: AMCzsaX7BAkdawvfvRnZiIgraZ5ff9AGA1EsbQWVsnW0J4sljwWn2leJ
	5wqvL1C/IGPBaqYsMspU9UpHf4kIq1mj1YucFhs=
X-Google-Smtp-Source: ABhQp+Rd9jMNsTaKw9qtJ1/aormUpR0eFy1yQE5F0g/SOj+WUULuMOzwxzHils6xx4vQVNqlPINcUGJmOvYnkfKg0S0=
X-Received: by 10.98.166.205 with SMTP id r74mr17052472pfl.285.1508862387769; 
	Tue, 24 Oct 2017 09:26:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Tue, 24 Oct 2017 09:25:57 -0700 (PDT)
In-Reply-To: <SN1PR13MB027295287B467702CA7967E692470@SN1PR13MB0272.namprd13.prod.outlook.com>
References: <SN1PR13MB027295287B467702CA7967E692470@SN1PR13MB0272.namprd13.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 24 Oct 2017 09:25:57 -0700
Message-ID: <CAMKF1sokNFnWVOuOTu31VJQ=Y-cjNON_cO9Ch1Ca8YfeVrNSiw@mail.gmail.com>
To: "Lee, Yong" <Yong.Lee@johnsonoutdoors.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC 4.9 and Morty
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
X-List-Received-Date: Tue, 24 Oct 2017 16:26:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2017 at 6:56 AM, Lee, Yong <Yong.Lee@johnsonoutdoors.com> w=
rote:
> I have a bunch of apps that require an old version of GCC (4.9 or less).
>
> There are a few versions of GCC available in my Morty based SDK.
>
>
>
> build@6e35408e8fa5:~/tisdk/build$ bitbake-layers show-recipes gcc
>
> WARNING: No recipes available for:
>
>
> /home/build/tisdk/sources/meta-openamp/recipes-bsp/device-tree/device-tre=
e-generation_%.bbappend
>
> Parsing recipes..done.
>
> =3D=3D=3D Matching recipes: =3D=3D=3D
>
> gcc:
>
>   meta-linaro-toolchain linaro-4.9
>
>   meta-linaro-toolchain linaro-6.2
>
>   meta                 6.2.0
>
>   meta                 5.4.0
>
>   meta-linaro-toolchain linaro-5.3
>
>   meta-linaro-toolchain linaro-5.2
>
>
>
> Immediately I have set the PREFERRED_VERSION of gcc to 4.9 but bitbake do=
es
> not go beyond configuration.
>
>

Please post the error and change you did to enable 4.9

>
> I believe 4.9 + morty combination has not been tested at all. I understan=
d
> my apps need to get updated, but that=E2=80=99s not my call.

OE-core and yocto releases by default do not test toolchains coming
from other layers
so essentially 6.2 is whats the default compiler with morty and thats
what is most tested
however, others might have tested the other combinations with morty,

