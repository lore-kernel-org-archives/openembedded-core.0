Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bogdan.a.marinescu@intel.com>) id 1SrUJo-00045c-V3
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 15:29:33 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 18 Jul 2012 06:18:11 -0700
Received: by qaeb19 with SMTP id b19so2753819qae.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 06:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=NoDCT1iSUwMeOG51aNq5mn8S5IBVgDUCBo4lUynrcZA=;
	b=oCfYSFmoZ8R8pfbZqPEaYv1PMbJFIGtCwHaQtVwOutWni0z8kfX84UmrAunxKNwjgM
	GjpO2Ls7Ix2hIHBiEIZ4fwda+M494LnaoT6WmTdsodeVzOqYz+sdF2fswqMM8bG/Gdjf
	6Tf6+QP93UbI7MUmJX4tYsb2ZoWiyCT6IPAdqxc60CYfyDRSqwOT7vu7NQREc/FjlvXo
	Rpwn2NoRgIV1VOZfGsuck7VTVOiRIvs8vw3LzcLmOWXGzaJSbH0fobdtI3mSQINkKvAC
	DwvKgIK1LM+hKQGLFM6nVTlIGg6k5S1BwS+efx8n88tefgc3Kc5MD1dKb5biGGoGltJJ
	jMsA==
Received: by 10.224.34.14 with SMTP id j14mr5939913qad.34.1342617490343; Wed,
	18 Jul 2012 06:18:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.178.233 with HTTP; Wed, 18 Jul 2012 06:17:50 -0700 (PDT)
In-Reply-To: <CADkTA4OkYB6ZsA81mz1YUrYeukVjrtSTph8b5mJ9jiomPibMKg@mail.gmail.com>
References: <1342011739-6416-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1sq_D4nDSSOctRRht=_93yacfMNfnO9AENCg-aTGyPNreg@mail.gmail.com>
	<CAMZjud0ZtRDiE-kpNw6mZz33BQEBJN3LzG5shHEzMn6wk5+sSA@mail.gmail.com>
	<CADkTA4OkYB6ZsA81mz1YUrYeukVjrtSTph8b5mJ9jiomPibMKg@mail.gmail.com>
From: "Marinescu, Bogdan A" <bogdan.a.marinescu@intel.com>
Date: Wed, 18 Jul 2012 16:17:50 +0300
Message-ID: <CAMZjud1JPfU7pfd2C+gQEmEpY_8ePSvrsMiyUMOAH4SnMd-pqg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQl1v/e6frKWH+ByVBHfZIEFxbzfIZ0nNh4Ile1+d/755ZlAcfMthjQf+W5FGkcFIYq7FomK
Subject: Re: [PATCH] linux-libc-headers: updated to 3.4.3
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
X-List-Received-Date: Wed, 18 Jul 2012 13:29:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 18, 2012 at 4:03 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Jul 18, 2012 at 7:30 AM, Marinescu, Bogdan A
> <bogdan.a.marinescu@intel.com> wrote:
>> On Tue, Jul 17, 2012 at 7:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> Why is recipe renamed
>>
>> Wasn't I supposed to do that when I upgraded the package from 3.4 to 3.4.3 ?
>
> No one replied to my other question (or at least no one replied that I
> noticed), about
> why we even bothered to bump it to 3.4.3 ...

Quite simply, I'm the owner of the recipe and I'm supposed to upgrade
it when a new version appears :)

Best,
Bogdan

>
> I have the same elements in that question .. but from a different angle.
>
> Cheers,
>
> Bruce
>
>>
>>>
>>>
>>> On Wednesday, July 11, 2012, Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>>> wrote:
>>>> Tested by building core-image-sato-sdk.
>>>>
>>>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>>>> ---
>>>>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>>>>  .../linux-libc-headers/linux-libc-headers_3.4.3.bb |    6 ++++++
>>>>  .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 ------
>>>>  3 files changed, 7 insertions(+), 7 deletions(-)
>>>>  create mode 100644
>>>> meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>>>>  delete mode 100644
>>>> meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>>>>
>>>> diff --git a/meta/conf/distro/include/tcmode-default.inc
>>>> b/meta/conf/distro/include/tcmode-default.inc
>>>> index f11e687..0a068be 100644
>>>> --- a/meta/conf/distro/include/tcmode-default.inc
>>>> +++ b/meta/conf/distro/include/tcmode-default.inc
>>>> @@ -22,7 +22,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
>>>>  BINUVERSION ?= "2.22"
>>>>  EGLIBCVERSION ?= "2.15"
>>>>  UCLIBCVERSION ?= "0.9.33"
>>>> -LINUXLIBCVERSION ?= "3.4"
>>>> +LINUXLIBCVERSION ?= "3.4.3"
>>>>
>>>>  PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>>>>  PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
>>>> diff --git
>>>> a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>>>> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>>>> new file mode 100644
>>>> index 0000000..6f8d9e8
>>>> --- /dev/null
>>>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>>>> @@ -0,0 +1,6 @@
>>>> +require linux-libc-headers.inc
>>>> +
>>>> +PR = "r0"
>>>> +
>>>> +SRC_URI[md5sum] = "3aefa02db55715d627ed23a01667057d"
>>>> +SRC_URI[sha256sum] =
>>>> "17f1256daa289dde1a0a587c9753556d37a52770f7c4efcf2666fd4796a6eacc"
>>>> diff --git
>>>> a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>>>> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>>>> deleted file mode 100644
>>>> index 9e8c88f..0000000
>>>> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>>>> +++ /dev/null
>>>> @@ -1,6 +0,0 @@
>>>> -require linux-libc-headers.inc
>>>> -
>>>> -PR = "r0"
>>>> -
>>>> -SRC_URI[md5sum] = "146af0160fc7a60cf9acf44aec13482b"
>>>> -SRC_URI[sha256sum] =
>>>> "a797a15d0b6228381507c14ecf4eec4a6cc5c77cfd521ba3b3e1325e85b5b16d"
>>>> --
>>>> 1.7.9.5
>>>>
>>>>
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
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


