Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 8282678215
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 16:41:16 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id g65so17164796pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 09:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=H3MlTahyA69OXI2bb537npgSJpnhjmBBw/SfYWVlhCg=;
	b=NXqWEMdT200ix7XExSR8gH/lieiXVaY0RVdnli5qCqs+ZsKIOhPf9caUWcf8WI/9B/
	elFfAyHCFcGYd2nywReDRvGR/Eee66ffxf9i5J2K4+AcUBv2mhSiExWyMeC11bGALwAU
	bFOhDkOG34U9kFB8B11ocNPbxVqkY3yMyFNx7hucEvDzeJwSWWbMMM37uNRQyi79PVkB
	8PHIpxsqQxsS7+AzHUCWfD4K94rgW8j5LaAI7vDbeKCi5Jcp/nNcbo8rtkrl+Tx7V7TZ
	v9vVCjFm3Ss44Yk3BgcHs7BR9WnLpikN0hhEjvIDD8BGVqhR1uM1EDdjoceUR848jxut
	Eqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=H3MlTahyA69OXI2bb537npgSJpnhjmBBw/SfYWVlhCg=;
	b=HFN24GamFOs0B1ktDfmOSi1xNwnAUdAukKRthFwvEpdhv46vsJEjLEjEbuECye9w9e
	797KYo8eqpwbWLUX4afp75Lgtsp+kaVLUo1j7m+oKYBCiteC08xbCMXcRwQ6sftifIIu
	cL57h63Qq7b0bNosGrsVvHd0dXf2JlRVkZR0wWM8/FsFAUhjMsbdFoCNjZQxIXeijbg0
	Yb3gl01ErVt9P83bhys0Bj3doatyf5eaZgfXuV+ohk45BUvAdCzGG70vcG2Z97hInbFm
	P61qN5Ohibko3aJ0uVA+M2TCapw5GfBO7w9h95Ui7DLXHtaz1HWM1weWWZsVxCakQSxQ
	EeOg==
X-Gm-Message-State: AMCzsaXylHEZ5s1tyBH+ZtNR6/y785l4FWVW8+Mn3pH+xDQFHpNObzWA
	3Jxt4+5nKlfmnXrmxcv+PsDdW4ovJ15CXPylSSE=
X-Google-Smtp-Source: AOwi7QDvLkxsqPYQdiuc9mfzcIiyA8k2lGhHZYw6N68iaIXMA1YVjSFqeIVEV5MlyFcEjPUNejQbtC+g127E8MOrSdI=
X-Received: by 10.98.202.138 with SMTP id y10mr2732770pfk.151.1507308077514;
	Fri, 06 Oct 2017 09:41:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.135.23 with HTTP; Fri, 6 Oct 2017 09:40:47 -0700 (PDT)
In-Reply-To: <E6158B0A-C810-4CA2-B66E-CD337A13929D@inango-systems.com>
References: <20171005080227.20685-1-n.merinov@inango-systems.com>
	<CAMKF1soz2yx3pcSXdV4Ym3geuxCUj+=Tb4RW0wJ6MTsdDDQF6w@mail.gmail.com>
	<E6158B0A-C810-4CA2-B66E-CD337A13929D@inango-systems.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Oct 2017 09:40:47 -0700
Message-ID: <CAMKF1srwskD5uQ6K_tiVVcaSK5o7uyN=mVyPmrggxvp17XB1ww@mail.gmail.com>
To: Nikolai Merinov <n.merinov@inango-systems.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cross.bbclass: Remove usage of host flags for cross-compilation
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
X-List-Received-Date: Fri, 06 Oct 2017 16:41:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 6, 2017 at 9:11 AM, Nikolai Merinov
<n.merinov@inango-systems.com> wrote:
> So, it will be better to keep TARGET_LDFLAGS empty by default?

I think yes.

>
> 6 =D0=BE=D0=BA=D1=82=D1=8F=D0=B1=D1=80=D1=8F 2017 =D0=B3. 18:55:02 GMT+05=
:00, Khem Raj <raj.khem@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On Thu, Oct 5, 2017 at 1:02 AM, Nikolay Merinov
>> <n.merinov@inango-systems.com> wrote:
>>>
>>>  BUILD_* flags can't be used as TARGET_* flags even for "cross" package=
s.
>>>
>>>  gcc-cross buils leaks config.log's through "gcc-stashed-builddir" and
>>>  TARGET_* flags to libgcc cross-build through "gcc/libgcc.mvars" file
>>>  on "gcc-stashed-builddir". This means that if BUILD_CFLAGS contains
>>>  host-specific flags like "-isystem/usr/include" libgcc build will
>>>  fail "do_qa_configure" and "do_package_qa" checks.
>>>
>>>  Remove host-related flags from TARGET_* flags for gcc-cross build.
>>>
>>>  Signed-off-by: Nikolay Merinov <n.merinov@inango-systems.com>
>>>  ---
>>>   meta/classes/cross.bbclass | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>>  diff --git a/meta/classes/cross.bbclass b/meta/classes/cross.bbclass
>>>  index 4887317a9a..29d4424829 100644
>>>  --- a/meta/classes/cross.bbclass
>>>  +++ b/meta/classes/cross.bbclass
>>>  @@ -28,10 +28,10 @@ MULTIMACH_TARGET_SYS =3D
>>> "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
>>>   export PKG_CONFIG_DIR =3D "${exec_prefix}/lib/pkgconfig"
>>>   export PKG_CONFIG_SYSROOT_DIR =3D ""
>>>
>>>  -TARGET_CPPFLAGS =3D "${BUILD_CPPFLAGS}"
>>>  -TARGET_CFLAGS =3D "${BUILD_CFLAGS}"
>>>  -TARGET_CXXFLAGS =3D "${BUILD_CXXFLAGS}"
>>>  -TARGET_LDFLAGS =3D "${BUILD_LDFLAGS}"
>>>  +TARGET_CPPFLAGS =3D ""
>>>  +TARGET_CFLAGS =3D ""
>>>  +TARGET_CXXFLAGS =3D ""
>>>  +TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
>>
>>
>>
>> I think using TARGET_LINK_HASH_STYLE could create target specific
>> dependency on cross packages, which might not be an issue for gcc but
>> could be issue for other cross packages.
>>
>>>   CPPFLAGS =3D "${BUILD_CPPFLAGS}"
>>>   CFLAGS =3D "${BUILD_CFLAGS}"
>>>  --
>>>  2.14.2
>>>
>>>  --
>>> ________________________________
>>>
>>>  Openembedded-core mailing list
>>>  Openembedded-core@lists.openembedded.org
>>>  http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> Nikolay Merinov
> Team Leader, 3-rd Party Group
> n.merinov@inango-systems.com
> T +7 343 298 0147 C +7 912 229 2564
> inango.com

