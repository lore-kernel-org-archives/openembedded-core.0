Received: from mail-qa0-f54.google.com ([209.85.216.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1SrU5S-0003nZ-B7
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 15:14:42 +0200
Received: by qaat11 with SMTP id t11so1017051qaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 06:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=CM3vW558SDWDKDeZh+R/jM6FctZKfWfaE6sloXEcs8o=;
	b=rWRlYVfjOC1uqMLxuvrv44VXfMaQHhBftC55x6QdDkC2ty7p8gMZV5qE6//P7q8/ak
	wHbLr/ICZnNeDlfW3d+aI0ZZNtvEO/5IIOlE+IMuE9qPwKS/MX6ehooY8z3bxKJyOkAN
	DkT1SMhoc7NVU9ZYjCqIRZ9/DCiE7/h5YCOtLnEJhiFlii45lx6ZxJO6rXm5neqlA6bo
	WFEWGuc2qK6UUecCAUpR5iOS+zVUuzAlPLuvrEedEiSMODtw7YS6BCYyJSpqBOH6ukd6
	N59lgmGU7DMzbdgQa+PpoJFfjhsGdrHm2v3qoHrRrAbyAaBq0dag+DNw9ECAIIGxTpT6
	fLzw==
MIME-Version: 1.0
Received: by 10.224.35.3 with SMTP id n3mr5580745qad.93.1342616601062; Wed, 18
	Jul 2012 06:03:21 -0700 (PDT)
Received: by 10.229.8.78 with HTTP; Wed, 18 Jul 2012 06:03:20 -0700 (PDT)
In-Reply-To: <CAMZjud0ZtRDiE-kpNw6mZz33BQEBJN3LzG5shHEzMn6wk5+sSA@mail.gmail.com>
References: <1342011739-6416-1-git-send-email-bogdan.a.marinescu@intel.com>
	<CAMKF1sq_D4nDSSOctRRht=_93yacfMNfnO9AENCg-aTGyPNreg@mail.gmail.com>
	<CAMZjud0ZtRDiE-kpNw6mZz33BQEBJN3LzG5shHEzMn6wk5+sSA@mail.gmail.com>
Date: Wed, 18 Jul 2012 09:03:20 -0400
Message-ID: <CADkTA4OkYB6ZsA81mz1YUrYeukVjrtSTph8b5mJ9jiomPibMKg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Wed, 18 Jul 2012 13:14:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 18, 2012 at 7:30 AM, Marinescu, Bogdan A
<bogdan.a.marinescu@intel.com> wrote:
> On Tue, Jul 17, 2012 at 7:54 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Why is recipe renamed
>
> Wasn't I supposed to do that when I upgraded the package from 3.4 to 3.4.3 ?

No one replied to my other question (or at least no one replied that I
noticed), about
why we even bothered to bump it to 3.4.3 ...

I have the same elements in that question .. but from a different angle.

Cheers,

Bruce

>
>>
>>
>> On Wednesday, July 11, 2012, Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>> wrote:
>>> Tested by building core-image-sato-sdk.
>>>
>>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>>> ---
>>>  meta/conf/distro/include/tcmode-default.inc        |    2 +-
>>>  .../linux-libc-headers/linux-libc-headers_3.4.3.bb |    6 ++++++
>>>  .../linux-libc-headers/linux-libc-headers_3.4.bb   |    6 ------
>>>  3 files changed, 7 insertions(+), 7 deletions(-)
>>>  create mode 100644
>>> meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>>>  delete mode 100644
>>> meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>>>
>>> diff --git a/meta/conf/distro/include/tcmode-default.inc
>>> b/meta/conf/distro/include/tcmode-default.inc
>>> index f11e687..0a068be 100644
>>> --- a/meta/conf/distro/include/tcmode-default.inc
>>> +++ b/meta/conf/distro/include/tcmode-default.inc
>>> @@ -22,7 +22,7 @@ SDKGCCVERSION ?= "${GCCVERSION}"
>>>  BINUVERSION ?= "2.22"
>>>  EGLIBCVERSION ?= "2.15"
>>>  UCLIBCVERSION ?= "0.9.33"
>>> -LINUXLIBCVERSION ?= "3.4"
>>> +LINUXLIBCVERSION ?= "3.4.3"
>>>
>>>  PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
>>>  PREFERRED_VERSION_gcc-cross ?= "${GCCVERSION}"
>>> diff --git
>>> a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>>> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>>> new file mode 100644
>>> index 0000000..6f8d9e8
>>> --- /dev/null
>>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb
>>> @@ -0,0 +1,6 @@
>>> +require linux-libc-headers.inc
>>> +
>>> +PR = "r0"
>>> +
>>> +SRC_URI[md5sum] = "3aefa02db55715d627ed23a01667057d"
>>> +SRC_URI[sha256sum] =
>>> "17f1256daa289dde1a0a587c9753556d37a52770f7c4efcf2666fd4796a6eacc"
>>> diff --git
>>> a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>>> b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>>> deleted file mode 100644
>>> index 9e8c88f..0000000
>>> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.bb
>>> +++ /dev/null
>>> @@ -1,6 +0,0 @@
>>> -require linux-libc-headers.inc
>>> -
>>> -PR = "r0"
>>> -
>>> -SRC_URI[md5sum] = "146af0160fc7a60cf9acf44aec13482b"
>>> -SRC_URI[sha256sum] =
>>> "a797a15d0b6228381507c14ecf4eec4a6cc5c77cfd521ba3b3e1325e85b5b16d"
>>> --
>>> 1.7.9.5
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


