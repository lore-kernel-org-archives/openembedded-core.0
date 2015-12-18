Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id AA6D565CBF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 06:11:40 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l126so50937517wml.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 22:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=kI+S3REujyZHjm2tZBXQZw3x6AI4S9MHtkCKEGi+fq0=;
	b=fXjWIo47hU8XyIHzHwQMJjScm0fAKPDyJ5a6WBXWUjXd3IjTGMNUDea335QG4Vd7sJ
	kgXCM1J/26y+TqguRfOExJqLC8GC2DxvQGCAgLX6/xTgytQmIxidIID53+dRG7HWDF0w
	+KOi9q1yCcARMeLczpnqR+peseXlKXquGhIPy02Hle2IFVh/wlMummJahCMPCDbCD5RC
	GyJg0Ah15UiKkmkTpzhhaKxTelPKqcLmX5XVKKUVulvmHyBa3sMFoMsvC9FkPCtW5Wnq
	2QxZa+c9esbJBe1QMyGlRUsDHHFSaJ9kgLjDuvxhafQpM/OC0+htXSTcyyZkmbntUnyo
	0ovw==
MIME-Version: 1.0
X-Received: by 10.28.1.5 with SMTP id 5mr807503wmb.61.1450419100802; Thu, 17
	Dec 2015 22:11:40 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Thu, 17 Dec 2015 22:11:40 -0800 (PST)
In-Reply-To: <EE4768DC-A0B6-4B69-8812-35BD3F47512A@gmail.com>
References: <1450413723-22208-1-git-send-email-armccurdy@gmail.com>
	<1450413723-22208-4-git-send-email-armccurdy@gmail.com>
	<FB8878E7-D891-4BB0-A20A-E3536DBF316F@gmail.com>
	<CAJ86T=VQNgf6QvOZDYWSv4DwEOAMz1FCsEsucjGb-r895M7XHw@mail.gmail.com>
	<EE4768DC-A0B6-4B69-8812-35BD3F47512A@gmail.com>
Date: Thu, 17 Dec 2015 22:11:40 -0800
Message-ID: <CAJ86T=XiFJuq9cwqQ6yGZrR4mjtxTniYbcVUqs0GtMQDaaMRiQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4 v3] valgrind: don't restrict to armv7a
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
X-List-Received-Date: Fri, 18 Dec 2015 06:11:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2015 at 10:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Dec 17, 2015, at 9:56 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Thu, Dec 17, 2015 at 9:17 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> On Dec 17, 2015, at 8:42 PM, Andre McCurdy <armccurdy@gmail.com> wrote=
:
>>>>
>>>> Valgrind has been tested on armv5te/qemuarm, so it seems
>>>> that valgrind's configure check for armv7 is over cautious.
>>>>
>>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>>> ---
>>>> meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 8 +++++---
>>>> 1 file changed, 5 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/=
recipes-devtools/valgrind/valgrind_3.11.0.bb
>>>> index 3dc3cc1..bb3f6e1 100644
>>>> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>>>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>>>> @@ -26,14 +26,16 @@ SRC_URI =3D "http://www.valgrind.org/downloads/val=
grind-${PV}.tar.bz2 \
>>>> SRC_URI[md5sum] =3D "4ea62074da73ae82e0162d6550d3f129"
>>>> SRC_URI[sha256sum] =3D "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab2=
6b4266aeb4c2413b42"
>>>>
>>>> -COMPATIBLE_HOST =3D '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
>>>> -COMPATIBLE_HOST_armv7a =3D 'arm.*-linux'
>>>> +COMPATIBLE_HOST =3D '(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux=
'
>>>>
>>>> inherit autotools ptest
>>>>
>>>> EXTRA_OECONF =3D "--enable-tls --without-mpicc"
>>>> -EXTRA_OECONF_armv7a =3D "--enable-tls -host=3Darmv7-none-linux-gnueab=
i --without-mpicc"
>>>> EXTRA_OECONF +=3D "${@['--enable-only32bit','--enable-only64bit'][d.ge=
tVar('SITEINFO_BITS', True) !=3D '32']}"
>>>> +
>>>> +# valgrind checks host_cpu "armv7*)", so we need to over-ride the aut=
otools.bbclass default --host option
>>>> +EXTRA_OECONF_append_arm =3D " --host=3Darmv7${HOST_VENDOR}-${HOST_OS}=
=E2=80=9D
>>>
>>> this could be problematic for arm < v7
>>
>> The configure script will give an error if ${host_cpu} doesn't begin
>> with "armv7", so we either have to provide this kind of fake --host
>> option or patch the configure script.
>
> How is it working right now ?

Up to now the recipe has been forcing "--host=3Darmv7-..." via
EXTRA_OECONF. That hasn't changed.

The thing that's changed is that previously you couldn't build for any
ARM target other than armv7a, now you can.

>>
>> Do you think patching the configure script would be better ?
>
> that could be better since we will get failure.
>
>>
>>>
>>>> EXTRA_OEMAKE =3D "-w"
>>>>
>>>> do_install_append () {
>>>> --
>>>> 1.9.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>

