Return-Path: <raj.khem@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id D8F9777805
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 15:40:50 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id f28so932494lfi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 08:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=nnON+ZlPipDfJF0e8EEaIdBOSlakyw0MW7CGxYotGKc=;
	b=VUi0Qfqo2v42UELh6wVnBlGGG6Ok8Ue+rBHrYy9wIeEjsGgGH3UPMqurfcCIdQJXTA
	jRKywbdyCSm2qdU84n9QZIhkhThXx/N9gtmkSHf9to03KzwVDwGtOMoFawaNNau57Krl
	LHyR6Y2gQ+dpHOe+5ceXPcGjhFpw9Ar1yn49GGdD3BJi5sOeq6NPeupW9dViuICMxN69
	DMilUV4cEWZcXwPHR+b6LkHPwaooy0LkC1V0Dcw30pjWnJmfBswrPWziDwWaqXm394Ql
	IKe/Ah1rchEkOugtl/sAottm+SdV8zYwGZrTvRshz8/2NGLhW8iKlolXEPidlGu598b/
	absA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=nnON+ZlPipDfJF0e8EEaIdBOSlakyw0MW7CGxYotGKc=;
	b=PG5aPHTwuRCXoUXGrRqtTV3cVi3k4K3JqIWuOdZ3vseqx/GrUcZ95CgyVwUzkZWeTE
	WEytXnqwfw13PI4i6kJ4wGABi+eWvrx+/QqyFxEistvdfVx9rjDKrC/ygpCCKycTWzF5
	Xz48jBbCR/Y4i4qTsbMbXssbqLqc4EFE8pmn1idkxHqqlIc4Zwv+wpBVSpxGT9rNOUUd
	xsbD4G31NILIpFWBZ42QE/3LIIDySGhGEo+fDqBxB/MUSQ4cXQlHvmOb3T1ubBfd9g3G
	627hfX5udU3zF/TuJbmTB/QHu+HjcMJUPBTEmJmW9htP10Oxi2BFsocvc9VirfoPiQ2e
	uQ5g==
X-Gm-Message-State: AKS2vOzEMIqxiY6jGBA1B2uV1srdjkjk7xFcymy5VoGRTSIS82Ia4hMA
	y4IC6nNkN2e3H+TeZkM3bsdnAyWXeA==
X-Received: by 10.80.216.5 with SMTP id o5mr23213156edj.178.1499355651176;
	Thu, 06 Jul 2017 08:40:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Thu, 6 Jul 2017 08:40:20 -0700 (PDT)
In-Reply-To: <48ec40d9-45ec-a6c1-add5-e389819f6e07@linux.intel.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
	<3107cc24993f111ff2d5714213bd85ff15173221.1499351361.git.raj.khem@gmail.com>
	<48ec40d9-45ec-a6c1-add5-e389819f6e07@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 6 Jul 2017 08:40:20 -0700
Message-ID: <CAMKF1spku=Ybg6cpduDAbgjgK6xYgSqFdhk2JSnciQ+URkNAmA@mail.gmail.com>
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
X-List-Received-Date: Thu, 06 Jul 2017 15:40:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 6, 2017 at 8:34 AM, Jose Perez Carranza
<jose.perez.carranza@linux.intel.com> wrote:
>
> On 07/06/2017 09:33 AM, Khem Raj wrote:
>>
>> buildiptables has been replaced with buildlzip
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/classes/testimage.bbclass | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/testimage.bbclass
>> b/meta/classes/testimage.bbclass
>> index 6fa2d6fd9f..0c4a84e111 100644
>> --- a/meta/classes/testimage.bbclass
>> +++ b/meta/classes/testimage.bbclass
>> @@ -49,10 +49,10 @@ DEFAULT_TEST_SUITES_pn-core-image-x11 =3D
>> "${MINTESTSUITE}"
>>   DEFAULT_TEST_SUITES_pn-core-image-lsb =3D "${NETTESTSUITE} pam parselo=
gs
>> ${RPMTESTSUITE}"
>>   DEFAULT_TEST_SUITES_pn-core-image-sato =3D "${NETTESTSUITE} connman xo=
rg
>> parselogs ${RPMTESTSUITE} \
>>       ${@bb.utils.contains('IMAGE_PKGTYPE', 'rpm', 'python', '', d)}"
>> -DEFAULT_TEST_SUITES_pn-core-image-sato-sdk =3D "${NETTESTSUITE} buildcp=
io
>> buildiptables buildgalculator \
>> +DEFAULT_TEST_SUITES_pn-core-image-sato-sdk =3D "${NETTESTSUITE} buildcp=
io
>> buildlzip buildgalculator \
>>       connman ${DEVTESTSUITE} logrotate perl parselogs python
>> ${RPMTESTSUITE} xorg"
>>   DEFAULT_TEST_SUITES_pn-core-image-lsb-dev =3D "${NETTESTSUITE} pam per=
l
>> python parselogs ${RPMTESTSUITE}"
>> -DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk =3D "${NETTESTSUITE} buildcpi=
o
>> buildiptables buildgalculator \
>> +DEFAULT_TEST_SUITES_pn-core-image-lsb-sdk =3D "${NETTESTSUITE} buildcpi=
o
>> buildlzip buildgalculator \
>>       connman ${DEVTESTSUITE} logrotate pam parselogs perl python
>> ${RPMTESTSUITE}"
>>   DEFAULT_TEST_SUITES_pn-meta-toolchain =3D "auto"
>>   @@ -61,7 +61,7 @@ DEFAULT_TEST_SUITES_remove_aarch64 =3D "xorg"
>>     # qemumips is quite slow and has reached the timeout limit several
>> times on the YP build cluster,
>>   # mitigate this by removing build tests for qemumips machines.
>> -MIPSREMOVE ??=3D "buildcpio buildiptables buildgalculator"
>> +MIPSREMOVE ??=3D "buildcpio buildlzip buildgalculator"
>>   DEFAULT_TEST_SUITES_remove_qemumips =3D "${MIPSREMOVE}"
>>   DEFAULT_TEST_SUITES_remove_qemumips64 =3D "${MIPSREMOVE}"
>>
>
> I think this patch is not applicable as for runtime tests
> (meta/lib/oeqa/runtime/cases/) we do actually use buildiptables test, for
> sdk test there are not filters so in the case of using "testsdk" all the
> available test under meta/lib/oeqa/sdk/cases should be executed.
>

Thats fine, send a followup. Without this patch I was still seeing
that bitbake -ctestimage <image> would not execute the new test and
looking for old test.

As can be seen the patch is just a rename the occurrences of old test
with new test.

> --
> Saludos
> Jos=C3=A9
>

