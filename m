Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id DE0B96CE84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 06:48:49 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id k14so3732221wgh.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 23:48:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=xYceBfy+75OEu0iWRiRhnkkZLPw/L+JAkHjXYmHR0Qg=;
	b=hXxi1w13T9RyG8Xv6ztY3HAmfF347LJ1oQo8FqDnfyh0BIh2a3fDTrfxI1Ixdmtry0
	fxUFuBt35B41iAEUvAmRpMsTz3SPCuw1Lby/I63OsM1FiFcR4dcvQEpoMPp+HKcvOly3
	VIXwpsVN8SC/pcNb9ALYUL2AjxjrSzWUA0P83v3uh87nvPR9E6hhXRI1kj8Tu1ha5QGH
	l9Yoq1R5RrUy7sHSLpGVOT+bscP1gNIrKgdU2571WRMaQF0c9jsYpov6UlHWy2x6Zzf0
	M33fVEnuYr0/RROShrXn3vyxk6w1eaHB6vrt9TU9z6uHr2qSNS7CFAIxrwxk2buaDaz0
	Neag==
X-Gm-Message-State: ALoCoQndUk+KF1SfWjo1bPHCJPet07wSgDIo/piEVUgbGOzrfPi7BeicWig0DN1lKb98OHpppzct
X-Received: by 10.180.37.227 with SMTP id b3mr1865874wik.24.1381474130852;
	Thu, 10 Oct 2013 23:48:50 -0700 (PDT)
Received: from ?IPv6:2001:610:612::f179:7f43:e390:81b2?
	([2001:610:612:0:f179:7f43:e390:81b2])
	by mx.google.com with ESMTPSA id om10sm2647948wic.5.2013.10.10.23.48.49
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 10 Oct 2013 23:48:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CABMQnVJZCxvFgJNgtMZ=gp2BiWLofpFyXCZ9H1-xQhLM=hsd6g@mail.gmail.com>
Date: Fri, 11 Oct 2013 08:48:48 +0200
Message-Id: <86430D8A-9905-4C7F-82C3-2FEEEF4C790A@dominion.thruhere.net>
References: <1381400211-28604-1-git-send-email-koen.kooi@linaro.org>
	<CABMQnVJZCxvFgJNgtMZ=gp2BiWLofpFyXCZ9H1-xQhLM=hsd6g@mail.gmail.com>
To: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
X-Mailer: Apple Mail (2.1510)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add aarch64_be target
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
X-List-Received-Date: Fri, 11 Oct 2013 06:48:51 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 11 okt. 2013, om 07:37 heeft Nobuhiro Iwamatsu <iwamatsu@nigauri.org> =
het volgende geschreven:

> Hi,
>=20
> I have a question.
> Why don't you unite  name rules of  other architecture?
> Forexample, armeb is endian-big of arm.  mipsel is endian-little of =
mips.
> If you can unified name, arm64eb is better, I think.

In an ideal world I'd do that, but that ghastly 'aarch64_be' is already =
in upstream gcc, binutils and eglibc  :(

regards,

Koen

>=20
> Best regards,
>  Nobuhiro
>=20
> 2013/10/10 Koen Kooi <koen@dominion.thruhere.net>:
>> From: Victor Kamensky <victor.kamensky@linaro.org>
>>=20
>> Add big endian ARMv8 target to OE infrastructure
>>=20
>> Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
>> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> ---
>> meta/classes/insane.bbclass       | 1 +
>> meta/classes/kernel-arch.bbclass  | 1 +
>> meta/classes/libc-package.bbclass | 1 +
>> meta/classes/siteinfo.bbclass     | 2 ++
>> 4 files changed, 5 insertions(+)
>>=20
>> diff --git a/meta/classes/insane.bbclass =
b/meta/classes/insane.bbclass
>> index a784aff..f1c6d22 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -55,6 +55,7 @@ def package_qa_get_machine_dict():
>>                       },
>>             "linux" : {
>>                         "aarch64" :   (183,    0,    0,          =
True,          64),
>> +                        "aarch64_be" :(183,    0,    0,          =
False,         64),
>>                         "arm" :       (40,    97,    0,          =
True,          32),
>>                         "armeb":      (40,    97,    0,          =
False,         32),
>>                         "powerpc":    (20,     0,    0,          =
False,         32),
>> diff --git a/meta/classes/kernel-arch.bbclass =
b/meta/classes/kernel-arch.bbclass
>> index 4a140eb..6a6ad91 100644
>> --- a/meta/classes/kernel-arch.bbclass
>> +++ b/meta/classes/kernel-arch.bbclass
>> @@ -23,6 +23,7 @@ def map_kernel_arch(a, d):
>>     if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
>>     elif re.match('armeb$', a):                 return 'arm'
>>     elif re.match('aarch64$', a):               return 'arm64'
>> +    elif re.match('aarch64_be$', a):            return 'arm64'
>>     elif re.match('mips(el|64|64el)$', a):      return 'mips'
>>     elif re.match('p(pc|owerpc)(|64)', a):      return 'powerpc'
>>     elif re.match('sh(3|4)$', a):               return 'sh'
>> diff --git a/meta/classes/libc-package.bbclass =
b/meta/classes/libc-package.bbclass
>> index fd06c4a..de3ffe6 100644
>> --- a/meta/classes/libc-package.bbclass
>> +++ b/meta/classes/libc-package.bbclass
>> @@ -268,6 +268,7 @@ python package_do_split_gconvs () {
>>             locale_arch_options =3D { \
>>                 "arm":     " --uint32-align=3D4 --little-endian ", \
>>                 "armeb":   " --uint32-align=3D4 --big-endian ",    \
>> +                "aarch64_be": " --uint32-align=3D4 --big-endian ",   =
 \
>>                 "sh4":     " --uint32-align=3D4 --big-endian ",    \
>>                 "powerpc": " --uint32-align=3D4 --big-endian ",    \
>>                 "powerpc64": " --uint32-align=3D4 --big-endian ",  \
>> diff --git a/meta/classes/siteinfo.bbclass =
b/meta/classes/siteinfo.bbclass
>> index 8705eaa..9ae2561 100644
>> --- a/meta/classes/siteinfo.bbclass
>> +++ b/meta/classes/siteinfo.bbclass
>> @@ -19,6 +19,7 @@ def siteinfo_data(d):
>>     archinfo =3D {
>>         "allarch": "endian-little bit-32", # bogus, but better than =
special-casing the checks below for allarch
>>         "aarch64": "endian-little bit-64 arm-common",
>> +        "aarch64_be": "endian-big bit-64 arm-common",
>>         "arm": "endian-little bit-32 arm-common",
>>         "armeb": "endian-big bit-32 arm-common",
>>         "avr32": "endian-big bit-32 avr32-common",
>> @@ -63,6 +64,7 @@ def siteinfo_data(d):
>>     }
>>     targetinfo =3D {
>>         "aarch64-linux-gnu": "aarch64-linux",
>> +        "aarch64_be-linux-gnu": "aarch64_be-linux",
>>         "arm-linux-gnueabi": "arm-linux",
>>         "arm-linux-uclibceabi": "arm-linux-uclibc",
>>         "armeb-linux-gnueabi": "armeb-linux",
>> --
>> 1.8.3.1
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
>=20
>=20
> --=20
> Nobuhiro Iwamatsu
>   iwamatsu at {nigauri.org / debian.org}
>   GPG ID: 40AD1FA6


