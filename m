Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 130C262135
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Sep 2016 23:29:51 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l65so325781wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Sep 2016 16:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dMbLhLj8KpPx8WjTY58QxAF4ZS9sCSJ82ua6AvGAQVk=;
	b=X+qwpwcAjoNiWDDytJoEHwNoOAJCb8AWAxWaN5ozAjs48UrYBfCmO8/jxvP3PGX0pv
	YgDYooiPo5aj7rPUgkAgO5ZThS0Dp67eiHG3gCf/n39EfGhhvJ/E4m1AbFMVvXUbew88
	WDRibDG9Qp49yz7s4+s5kbc6qhccyUf9hmXhlCbGqOrIpkfBvMZtee15JODTWu+UzxZS
	MiuknsQRJmsx/zRbaAZlDHjfsx4tIf9HfW5CT+5NCheR1lAszvSYofw3FMwJ2U3RVvXG
	mo58Iv3CvRPvSDq/LXJssXwxuzNxzvDvMFAqZdZB/dpL32kc2fF+ROflFUsd88ayrx64
	ixFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dMbLhLj8KpPx8WjTY58QxAF4ZS9sCSJ82ua6AvGAQVk=;
	b=dFjnTLz3O6azv5pNZks7loMu5i1TCrbd0CQYnTrsd5o4EgqnDjvZu1Q3MvtYhWCWhW
	FUGnINby9F6FUOiyjxDrUfgP2UiZe/DfypMKy00y/DwLAtoe227x+CWL/IuVIC4tKLkX
	yxftXU3oX+X2BNei5HiNrtoAJeysHkhNd9bCqG3kyCeefDnPSYXG41Ee2MJVD3L0mQG5
	67utPfDH0i7VpIijjjpwljRlC+obcsr94HYQVudLQ00LoXjMIguzHWGLL63g/KLAhOWH
	oqSINyjXcUcpY5upsaNjKT6ND1in2XGU3/Qp/lrcynkiFnKQGhSFB3q7LfCJ2VQ5n3Hb
	0PBg==
X-Gm-Message-State: AE9vXwN4zSfHD5ZccNvkV4cWR0OG1OCQ2Qbhi7CcCuIIdllxj9aUp7O4UYkoj7xz8aivLlNlLVz5Aqzcp+ZaUg==
X-Received: by 10.28.168.151 with SMTP id r145mr46208wme.93.1473377392401;
	Thu, 08 Sep 2016 16:29:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.216.100 with HTTP; Thu, 8 Sep 2016 16:29:51 -0700 (PDT)
In-Reply-To: <1473349503.26345.3.camel@andred.net>
References: <1473340457-31797-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<1473349503.26345.3.camel@andred.net>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 8 Sep 2016 16:29:51 -0700
Message-ID: <CAJ86T=Vegf+SSiqO8_MeniWVoxob2HdbvGeYdDGtmt1gd3=qiA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: MIPS: Make toolchain basename generic
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
X-List-Received-Date: Thu, 08 Sep 2016 23:29:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 8, 2016 at 8:45 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> On Do, 2016-09-08 at 14:14 +0100, Zubair Lutfullah Kakakhel wrote:
>> For the hard float case, COMPATIBLE_HOST should be set to ".*-linux"
>> since OE can support multiple distro layers, not just poky.
>>
>> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>>
>> ---
>> Pointed out by Andre McCurdy but patch v1 had already been accepted
>> and applied.
>> ---
>>  meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> index 3d49131..42fd27f 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
>> @@ -39,8 +39,8 @@ COMPATIBLE_HOST_armv5 =3D 'null'
>>  COMPATIBLE_HOST_armv6 =3D 'null'
>>
>>  # valgrind doesn't like mips soft float
>> -COMPATIBLE_HOST_mips =3D "${@bb.utils.contains("TARGET_FPU", "soft",
>> "null", "mips-poky-linux", d)}"
>> -COMPATIBLE_HOST_mipsel =3D "${@bb.utils.contains("TARGET_FPU", "soft",
>> "null", "mipsel-poky-linux", d)}"
>> +COMPATIBLE_HOST_mips =3D "${@bb.utils.contains("TARGET_FPU", "soft",
>> "null", ".*-linux", d)}"
>> +COMPATIBLE_HOST_mipsel =3D "${@bb.utils.contains("TARGET_FPU", "soft",
>> "null", ".*-linux", d)}"
>
> Can it not just be set to mips or mipsel? Why .*-linux?

Yes, any pattern that always matches (e.g. "mips", ".*",
"${HOST_SYS}", ".*-linux", etc) would be OK.

> COMPATIBLE_HOST_mips =3D "${@bb.utils.contains("TARGET_FPU", "soft", "nul=
l", "mips", d)}"
> COMPATIBLE_HOST_mipsel =3D "${@bb.utils.contains("TARGET_FPU", "soft", "n=
ull", "mipsel", d)}"
>
> Cheers,
> Andre'
>
>

