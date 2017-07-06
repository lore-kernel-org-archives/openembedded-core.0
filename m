Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 40B4C77805
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 16:06:07 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id f28so1027194lfi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 09:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=b/TeUpmAvUI37ENKSmtZ4T/nvVG3r6oIXyTjIg83ogw=;
	b=a1BXSqipyzEyS6r9HPrjOIUUAcLjbGIHSol9fo2fPJFCH9NLVEVI+Frr4V5pT/0nmP
	6ZoSeH+L+jwpZn0YW3r9JQCyW8d/NbqGnms+B15R1dKgbXNzwCXXR1CfEJPNihhKkSvt
	dJgSiJoUo23DXuoO3JGA0Tw9msFRLg0A/LZl4FcF5nYD/tNzGQqiiJEJfaS2z29w4DmP
	WLxOR9wW+R+t5vENvp9Mq43CxFkiVPFrOKsK7ztNwYX0qfjGmKMJWUujAx9rE5EE2yaP
	vAdioc1A1rULt3xQoLJsNyvxdXK9c7Z0XibdsBBx5/axm2hahS3ryFiyxDyPXiugxaQh
	fLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=b/TeUpmAvUI37ENKSmtZ4T/nvVG3r6oIXyTjIg83ogw=;
	b=HK1NyIclAQUecPsTZ6wt6WgMUWFKLkoUeC/SaFdaM+5M49APuX8z18Fb8gNQbm7b/e
	ErsaaKCqaN8yX//M8IWw7P4xknd8XYBckt2AFmR65aSh+SOM0MZWA6BY+qrM/8Qwkfnf
	ltZrd1VpzPTe8QNvW26PM/R8YJNxakyTrdDTHXcDpMA8tpF0rtBx/qHDdXRf2a+QpQhV
	kNo2/KsHvQe0Y5vgumhEQ0Kbmvhl+v9ML/arLQzqCjeFgA+xFCYzqs1m3iYjTXHtsbZ6
	Ovrxf1jwujxb0gZX+GgRB5PaAA7sYB2KxQG8DjHpD6cTaWadu9+67MX1gwzhMMC8bkVe
	KiAw==
X-Gm-Message-State: AKS2vOyuRvNAI/FtTxnrti29Cd5LsKdRG8yGu6KjDAF3h9oui9zPDtTo
	yr3Pml2AZxkW32aIhmAH4iEu8oDXfA==
X-Received: by 10.80.151.49 with SMTP id c46mr26951437edb.30.1499357168629;
	Thu, 06 Jul 2017 09:06:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Thu, 6 Jul 2017 09:05:38 -0700 (PDT)
In-Reply-To: <77b8ac69-1626-27d8-8743-1bb2589a4503@linux.intel.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
	<3107cc24993f111ff2d5714213bd85ff15173221.1499351361.git.raj.khem@gmail.com>
	<48ec40d9-45ec-a6c1-add5-e389819f6e07@linux.intel.com>
	<CAMKF1spku=Ybg6cpduDAbgjgK6xYgSqFdhk2JSnciQ+URkNAmA@mail.gmail.com>
	<77b8ac69-1626-27d8-8743-1bb2589a4503@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jul 2017 09:05:38 -0700
Message-ID: <CAMKF1sq0CP6-4mpFsAO8dX-AiDcoUtRisKO_gbDM8tTKYbkaKA@mail.gmail.com>
To: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 22/22] testimage: Use the renamed buildlzip
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
X-List-Received-Date: Thu, 06 Jul 2017 16:06:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 6, 2017 at 9:05 AM, Jose Perez Carranza
<jose.perez.carranza@linux.intel.com> wrote:
>
>
> On 07/06/2017 10:40 AM, Khem Raj wrote:
>>
>> On Thu, Jul 6, 2017 at 8:34 AM, Jose Perez Carranza
>> <jose.perez.carranza@linux.intel.com> wrote:
>>>
>>> On 07/06/2017 09:33 AM, Khem Raj wrote:
>>>>
>>>> buildiptables has been replaced with buildlzip
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>    meta/classes/testimage.bbclass | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/meta/classes/testimage.bbclass
>>>> b/meta/classes/testimage.bbclass
>>>> index 6fa2d6fd9f..0c4a84e111 100644
>>>> --- a/meta/classes/testimage.bbclass
>>>> +++ b/meta/classes/testimage.bbclass
>>>> @@ -49,10 +49,10 @@ DEFAULT_TEST_SUITES_pn-core-image-x11 =3D
>>>> "${MINTESTSUITE}"
>>>>    DEFAULT_TEST_SUITES_pn-core-image-lsb =3D "${NETTESTSUITE} pam
>>>> parselogs
>>>> ${RPMTESTSUITE}"
>>>>    DEFAULT_TEST_SUITES_pn-core-image-sato =3D "${NETTESTSUITE} connman
>>>> xorg
>>>> parselogs ${RPMTESTSUITE} \
>>>>        ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)}"
>>>> -DEFAULT_TEST_SUITES_pn-core-image-sato-sdk =3D "${NETTESTSUITE} build=
cpio
>>>> buildiptables buildgalculator \
>>>> +DEFAULT_TEST_SUITES_pn-core-image-sato-sdk =3D "${NETTESTSUITE} build=
cpio
>>>> buildlzip buildgalculator \
>>>>        connman ${DEVTESTSUITE} logrotate perl parselogs python
>>>> ${RPMTESTSUITE} xorg"
>>>>    DEFAULT_TEST_SUITES_pn-core-image-lsb-dev =3D "${NETTESTSUITE} pam =
perl
>>>> python parselogs ${RPMTESTSUITE}"
>>>> -DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk =3D "${NETTESTSUITE} buildc=
pio
>>>> buildiptables buildgalculator \
>>>> +DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk =3D "${NETTESTSUITE} buildc=
pio
>>>> buildlzip buildgalculator \
>>>>        connman ${DEVTESTSUITE} logrotate pam parselogs perl python
>>>> ${RPMTESTSUITE}"
>>>>    DEFAULT_TEST_SUITES_pn-meta-toolchain =3D "auto"
>>>>    @@ -61,7 +61,7 @@ DEFAULT_TEST_SUITES_remove_aarch64 =3D "xorg"
>>>>      # qemumips is quite slow and has reached the timeout limit severa=
l
>>>> times on the YP build cluster,
>>>>    # mitigate this by removing build tests for qemumips machines.
>>>> -MIPSREMOVE ??=3D "buildcpio buildiptables buildgalculator"
>>>> +MIPSREMOVE ??=3D "buildcpio buildlzip buildgalculator"
>>>>    DEFAULT_TEST_SUITES_remove_qemumips =3D "${MIPSREMOVE}"
>>>>    DEFAULT_TEST_SUITES_remove_qemumips64 =3D "${MIPSREMOVE}"
>>>>
>>> I think this patch is not applicable as for runtime tests
>>> (meta/lib/oeqa/runtime/cases/) we do actually use buildiptables test, f=
or
>>> sdk test there are not filters so in the case of using "testsdk" all th=
e
>>> available test under meta/lib/oeqa/sdk/cases should be executed.
>>>
>> Thats fine, send a followup. Without this patch I was still seeing
>> that bitbake -ctestimage <image> would not execute the new test and
>> looking for old test.
>
> The new test is only applicable to sdk test, to execute this tests "bitba=
ke
> -c testsdk <image>" should be used an this actually executes new lzip tes=
ts,
> on the bug 11713 is tatetd tht the problems are in sdl/cases/iptables, ar=
e
> you also having issues on the "runtime/cases/buildiptables"? if that is t=
he
> case please add a comment on the bug as this will need some more effort.
>

its needed for executing with -c testimage as well when we use
core-image-sato-sdk e.g.


>> "
>> As can be seen the patch is just a rename the occurrences of old test
>> with new test.
>>
>>> --
>>> Saludos
>>> Jos=C3=A9
>>>
>
> --
> Saludos
> Jos=C3=A9
>

