Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SCdiw-0008Si-67
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 23:14:38 +0200
Received: by qcso7 with SMTP id o7so281918qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2012 14:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Nhes1cP8dxBDtDMWr3W4JggyO7QsRs868Xbii7tA758=;
	b=nGGzU4IBGiZlNJ/Jp2AycvV1ZZiUlGxcpYOsluKNSlqJ7Cb+sGMwQYdpy872hLO+YK
	ckLkt8Y6bBMUaXiJtEALarD17O4Z4S6HFygEnZ10jg+OQXyNeAlAifEZKXHDvYCFb1xG
	1Y9QvnPm8FA7c1TwTWyAtJoY9Y5EgUMnrP5FAcvArFJpVGx3izkCfGco2oCmpwtbHuni
	P4ePBy8+vwvV886aYQEobhsW2WACBwQS51QzxqDNFNdzqiRZcb1dPEf09Jvm0GlKuQ/q
	JYABaSMlapOMWphdPhB5IUIp1WBlh6kVXubrq3qPoCujIREsPeou+s6vbG71DH5SAhq3
	yFhA==
Received: by 10.229.135.145 with SMTP id n17mr10508341qct.105.1332882336185;
	Tue, 27 Mar 2012 14:05:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Tue, 27 Mar 2012 14:05:15 -0700 (PDT)
In-Reply-To: <4F72219A.2020301@windriver.com>
References: <1332877869-12195-1-git-send-email-kergoth@gmail.com>
	<1332877869-12195-3-git-send-email-kergoth@gmail.com>
	<4F72219A.2020301@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 27 Mar 2012 14:05:15 -0700
X-Google-Sender-Auth: AB73UiE08uI7m-EjgriKlKO0QBw
Message-ID: <CABcZANmm5BNHdMtSJJ_P6WNpkgrQ+1vhbHgDg1-9Dc_FXWbhgQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] powerpc: define TUNE_PKGARCH for powerpc/powerpc-nf
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Mar 2012 21:14:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2012 at 1:22 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> Patch 1 and 2 look fine, but I have questions on this one....
>
>
> On 3/27/12 2:51 PM, Christopher Larson wrote:
>>
>> From: Christopher Larson<chris_larson@mentor.com>
>>
>> This allows setting DEFAULTTUNE to powerpc or powerpc-nf rather than jus=
t
>> the
>> more specific cpu/machine tuning.
>>
>> Signed-off-by: Christopher Larson<chris_larson@mentor.com>
>> ---
>> =C2=A0meta/conf/machine/include/powerpc/arch-powerpc.inc | =C2=A0 =C2=A0=
2 ++
>> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> index c5fd6b7..3438b46 100644
>> --- a/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> +++ b/meta/conf/machine/include/powerpc/arch-powerpc.inc
>> @@ -26,6 +26,8 @@ AVAILTUNES +=3D "powerpc powerpc-nf"
>> =C2=A0TUNE_FEATURES_tune-powerpc-nf ?=3D "m32 fpu-soft"
>> =C2=A0BASE_LIB_tune-powerpc-nf =3D "lib"
>> =C2=A0PACKAGE_EXTRA_ARCHS_tune-powerpc-nf =3D "powerpc-nf"
>> +TUNE_PKGARCH_tune-powerpc-nf =3D "powerpc-nf"
>> =C2=A0TUNE_FEATURES_tune-powerpc ?=3D "m32 fpu-hard"
>> =C2=A0BASE_LIB_tune-powerpc =3D "lib"
>> =C2=A0PACKAGE_EXTRA_ARCHS_tune-powerpc =3D "powerpc"
>> +TUNE_PKGARCH_tune-powerpc =3D "powerpc"
>
>
> Why is the above necessary?
>
> TUNE_PKGARCH_append is set to "${PPCPKGSFX_FPU}"
>
> PPCPKGSFX_FP is set to either '' or '-nf' based on the existance of
> fpu-soft.
>
> TUNE_PKGARCH is set by a number of the PowerPC tuning files... =C2=A0If y=
ou are
> looking for generic PowerPC there should be something setting TUNE_PKGARC=
H
> to "powerpc" (or "powerpc64" in the default cases...)

This is what I'm saying. If you want to target generic powerpc, you
have to force TUNE_PKGARCH, as the generic don't have
TUNE_PKGARCH_tune- definitions. It seems to me in most cases you can
set DEFAULTTUNE and include an appropriate tune file and not need to
set TUNE_PKGARCH directly, which is not the case for the generic ones.
Was it not the intent that this was the case? Should every MACHINE
have to override TUNE_PKGARCH?
--=20
Christopher Larson


