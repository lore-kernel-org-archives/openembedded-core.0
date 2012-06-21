Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1Shj2R-0003R6-6Z
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 17:11:15 +0200
Received: from mail-vb0-f52.google.com ([209.85.212.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 21 Jun 2012 08:00:27 -0700
Received: by vbzb23 with SMTP id b23so334023vbz.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 08:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=Tz6ihRbtFhlItOuQkqx3VLB2oa5A7xoR7W440oOF2LE=;
	b=TrXkYfgFfA92mbJCOMMAq/kGs6cZ1lGtmplltLoRAllkgL3wcg9FjhYU61wClTffJr
	MDEz/tPXqSKVHQ90zbH0TvTDXlfK3jPSm6skduaOCgRRH2Xr5gHpVRd72u+x2qsuyO6s
	tUn42aoXsA/HsbJLW3LwxbgU1a62j1YpMYhODE9oTrW6s6SA77hcFShDY4JN2+ZRI6fC
	JUC1gdHZEe+bHt4fMeR4wZXXEr4mOhemtGmBjZvDqBbQszRDmqIpSDdn5o/YtO/csI9R
	9gKWaPfbvXpqToOIRdEXKIKtFUUtyHPQC32iHiMEdxYOMJBVkB5RnihdvAcb3ge5D6dL
	pu3Q==
Received: by 10.220.223.212 with SMTP id il20mr13754447vcb.71.1340290826845;
	Thu, 21 Jun 2012 08:00:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.34.208 with HTTP; Thu, 21 Jun 2012 07:59:54 -0700 (PDT)
In-Reply-To: <CADkTA4Pgp=3oD+b-7bdseEiNE++CSwzd++FfBriQ5kZ=0qS+vQ@mail.gmail.com>
References: <1340180732-26710-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1340281789.1640.106.camel@ted>
	<CAMZjud0p_349MXBVFUj4q-jxKy0S+1bz3_onEjx16XdkKtRPQw@mail.gmail.com>
	<CADkTA4M6tN=zGrKe6-1ZVmcW3Facm-cLT+70cqMs7+Q_U6DXOg@mail.gmail.com>
	<1340282394.1640.108.camel@ted>
	<CADkTA4Pgp=3oD+b-7bdseEiNE++CSwzd++FfBriQ5kZ=0qS+vQ@mail.gmail.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Thu, 21 Jun 2012 17:59:54 +0300
Message-ID: <CAMZjud3yGfzV7ZjQPt7WuQ95OvWeiAW15nvysSKZoeGPHCUagA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm3HefYbdqwBWbkjTHIz5pm5PjKQNOFtzFkM3BNTF6xUFXct3p8B+8JUdeJlkVCceQEGH6a
Subject: Re: [PATCH] linux-tools: multilib compilation fix
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
X-List-Received-Date: Thu, 21 Jun 2012 15:11:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2012 at 3:42 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Thu, Jun 21, 2012 at 8:39 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Thu, 2012-06-21 at 08:33 -0400, Bruce Ashfield wrote:
>>> On Thu, Jun 21, 2012 at 8:32 AM, Marinescu, Bogdan A
>>> <bogdan.a.marinescu@intel.com> wrote:
>>> > On Thu, Jun 21, 2012 at 3:29 PM, Richard Purdie
>>> > <richard.purdie@linuxfoundation.org> wrote:
>>> >> On Wed, 2012-06-20 at 11:25 +0300, Bogdan Marinescu wrote:
>>> >>> This patch makes linux-tools compile properly on multilib configura=
tions
>>> >>> (which failed because of some invalid dependencies). Tested by comp=
iling
>>> >>> lib32-core-image-sato-sdk.
>>> >>>
>>> >>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>>> >>> ---
>>> >>> =A0meta/recipes-kernel/linux/linux-tools.inc | =A0 =A02 +-
>>> >>> =A01 file changed, 1 insertion(+), 1 deletion(-)
>>> >>>
>>> >>> diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recip=
es-kernel/linux/linux-tools.inc
>>> >>> index 3b03c05..048608c 100644
>>> >>> --- a/meta/recipes-kernel/linux/linux-tools.inc
>>> >>> +++ b/meta/recipes-kernel/linux/linux-tools.inc
>>> >>> @@ -34,7 +34,7 @@ do_install_perf[umask] =3D "022"
>>> >>>
>>> >>> =A0PERFDEPENDS =3D "virtual/${MLPREFIX}libc:do_populate_sysroot ${M=
LPREFIX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroo=
t"
>>> >>> =A0PERFDEPENDS_libc-uclibc =3D ""
>>> >>> -PERFRDEPENDS =3D "python perl elfutils"
>>> >>> +PERFRDEPENDS =3D "${MLPREFIX}python ${MLPREFIX}perl ${MLPREFIX}elf=
utils"
>>> >>> =A0PERFRDEPENDS_libc-uclibc =3D ""
>>> >>>
>>> >>> =A0do_compile_perf[depends] =3D "${PERFDEPENDS}"
>>> >>
>>> >> Bruce has just totally rearranged this code. Could you check if the =
new
>>> >> recipe still suffers from this issue please?
>>> >
>>> > Sure, I'm on it.
>>>
>>> Yep. We still need this addition to the recipe .. luckily, easy to do :=
)
>>
>> I'm not sure, the autorenaming magic should take care of a simple
>> RDEPENDS...
>
> Ah yes, I wasn't sure about that myself. I'll just watch and wait in
> that case :)

I'm not sure what to think. I don't get the error that I got yesterday
when I compile lib32-core-image-sato-sdk, but I also can't find any
linux-tools package anywhere. Is this normal?

Thanks,
Bogdan

>
> Bruce
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


