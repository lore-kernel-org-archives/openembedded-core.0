Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sn1yu-0002yk-6d
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 08:25:32 +0200
Received: by eekd49 with SMTP id d49so3390476eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2012 23:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=cmr+X15jWif8whwnDf12wRgefgIc71eY1viKXAa14Nc=;
	b=GKxZJyT+EnIkJrz7z6WaFyWG1A7WJ3ElXvkiMVmnAAeSurYdkpkRduYQvKw76Y0pCX
	FmwDHe53lMV1Vbot4trMyREBCXyEjxH6fA9U0KHomBL8KjnFw80XesIw/+3Eb61MiIGA
	Yt6/Li0wI+EyqMtEKYn6JoHCcSWs/5g8oifSpFaNtQp1duNoiVmg5gPFa24/tzexzChq
	CZlnw3Lvhtdrf/kUU6gPU2yBnaMbrEX8e0OTu/92DbWJs9jTmBSCQneviSMbO/HQHe/E
	hOjF9ZTCmhczbcc3aeIf6CS3epksYf4nrE+pEbvqGS3eMZah2Jne9fo1q/lRdZrFYYnh
	r1eA==
Received: by 10.14.97.16 with SMTP id s16mr6417153eef.117.1341555267106; Thu,
	05 Jul 2012 23:14:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Thu, 5 Jul 2012 23:13:56 -0700 (PDT)
In-Reply-To: <CAEsOVNfebYabCyfhYd873LeKJwH56Ci9DBcyYbe8_P_Y8go3dA@mail.gmail.com>
References: <1341549155-30728-1-git-send-email-msm@freescale.com>
	<CAMKF1srU_KcFP7-3-znj+T6m9Tc1J+JVFbxy4L5ojW-2Z3GUag@mail.gmail.com>
	<CAEsOVNfebYabCyfhYd873LeKJwH56Ci9DBcyYbe8_P_Y8go3dA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jul 2012 23:13:56 -0700
Message-ID: <CAMKF1spjF-h=LhkbCoWO49N64PYnHW3B0Q9tq+ZJa5gQtKwymw@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgomp: add libgomp (openmp) library, and build for powerpc targets by default
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
X-List-Received-Date: Fri, 06 Jul 2012 06:25:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 5, 2012 at 10:36 PM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Fri, Jul 6, 2012 at 12:25 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Thu, Jul 5, 2012 at 9:32 PM, Matthew McClintock <msm@freescale.com> wrote:
>>> Signed-off-by: Matthew McClintock <msm@freescale.com>
>>> ---
>>>  meta/recipes-devtools/gcc/gcc-4.6.inc               |    2 +-
>>>  meta/recipes-devtools/gcc/gcc-configure-runtime.inc |    2 ++
>>>  meta/recipes-devtools/gcc/gcc-package-runtime.inc   |    9 +++++++++
>>>  3 files changed, 12 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
>>> index 020e21b..32545eb 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-4.6.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
>>> @@ -1,6 +1,6 @@
>>>  require gcc-common.inc
>>>
>>> -PR = "r25"
>>> +PR = "r26"
>>>
>>>  # Third digit in PV should be incremented after a minor release
>>>  # happens from this branch on gcc e.g. currently its 4.6.0
>>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>>> index 34bfaeb..a7d478c 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-configure-runtime.inc
>>> @@ -9,6 +9,8 @@ EXTRA_OECONF_PATHS = " \
>>>      --with-build-sysroot=${STAGING_DIR_TARGET}"
>>>
>>>  RUNTIMETARGET = "libssp libstdc++-v3"
>>> +RUNTIMETARGET_append_powerpc = " libgomp"
>>> +RUNTIMETARGET_append_powerpc64 = " libgomp"
>>>  #  ?
>>>  # libiberty
>>>  # libmudflap
>>> diff --git a/meta/recipes-devtools/gcc/gcc-package-runtime.inc b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>>> index feb8735..001a444 100644
>>> --- a/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>>> +++ b/meta/recipes-devtools/gcc/gcc-package-runtime.inc
>>> @@ -13,6 +13,8 @@ PACKAGES = "\
>>>    libgfortran-dev \
>>>    libmudflap \
>>>    libmudflap-dev \
>>> +  libgomp \
>>> +  libgomp-dev \
>>>  "
>>>  # The base package doesn't exist, so we clear the recommends.
>>>  RRECOMMENDS_${PN}-dbg = ""
>>> @@ -61,3 +63,10 @@ FILES_libmudflap-dev = "\
>>>    ${libdir}/libmudflap*.a \
>>>    ${libdir}/libmudflap*.la"
>>>
>>> +FILES_libgomp = "${libdir}/libgomp*.so.*"
>>> +FILES_libgomp-dev = "\
>>> +  ${libdir}/libgomp*.so \
>>> +  ${libdir}/libgomp*.a \
>>> +  ${libdir}/libgomp*.la \
>>> +  ${libdir}/libgomp.spec \
>>> +  ${libdir}/gcc/${TARGET_SYS}/${BINV}/include/omp.h"
>>
>> Did you build a non ppc architecture to verify that it does not
>> complain about empty packages ?
>
> I tested without the powerpc overrides first...

OK let me put it differently remove

+RUNTIMETARGET_append_powerpc = " libgomp"
+RUNTIMETARGET_append_powerpc64 = " libgomp"

and leave the rest of patch in

then build for powerpc

>
> -M
>
>>
>>> --
>>> 1.7.10
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


