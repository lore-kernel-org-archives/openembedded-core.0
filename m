Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Se8Ol-00087j-8o
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 19:27:27 +0200
Received: by dalh21 with SMTP id h21so5434633dal.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=AniQhL+gUjtRf6mMItxP2CZ51y3dMY98+Z3B07FVWnc=;
	b=MpFan9EmO0O0tLBVsETjZNhr6I/Kt0QBph201+7QsMV4Nr/yLbwZjn/sabeGTKgbZU
	RjOH6zYBv4+A5PWIuNNMkaxcvC/uQjp59FQkdFzzFUALfexch+MpHh9HmgR9bhC0+H6r
	fEwUDgzSVlC78Ax/PhN1Ts05Wokoct8Ojxx8o6uG6VXp5MCHy02UbX7CjqZvOcU+udHO
	RwbXNCBRIVfYcVJ0DxQitXWmJXX8Gjy9SavYjENNVpcBY2tXsmauc1RmeMZ9Oh/19NQZ
	dG5FIMvUTNfzMr0VJ2PZyBi3iCCnRxXuH4MDnMrM9HynqRUqrx8PxUA2SYoTVwsQgxbr
	wqgA==
MIME-Version: 1.0
Received: by 10.68.217.100 with SMTP id ox4mr28521718pbc.87.1339435012656;
	Mon, 11 Jun 2012 10:16:52 -0700 (PDT)
Received: by 10.68.197.4 with HTTP; Mon, 11 Jun 2012 10:16:52 -0700 (PDT)
In-Reply-To: <4FD62077.2030209@linux.intel.com>
References: <4FD60D68.4040809@linux.intel.com>
	<CADkTA4PpQYeDwSMs1iss4JoiF1R_szZU4ByMKPwHb=kNrnv=Pw@mail.gmail.com>
	<4FD62077.2030209@linux.intel.com>
Date: Mon, 11 Jun 2012 13:16:52 -0400
Message-ID: <CADkTA4NPN_8fqB9t+x6fq80L0sm0CACOC19pN0kyv+OUmEUR5A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Missing Patch Headers
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
X-List-Received-Date: Mon, 11 Jun 2012 17:27:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 11, 2012 at 12:44 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 06/11/2012 08:34 AM, Bruce Ashfield wrote:
>>
>> On Mon, Jun 11, 2012 at 11:23 AM, Saul Wold<sgw@linux.intel.com> =A0wrot=
e:
>>>
>>>
>>> Folks,
>>>
>>> We recently had a spat of new patches added without patch headers, ie n=
o
>>> patch comment, Signed-off-by or Upstream-Status.
>>>
>>> Please review this list and update the patch and submit a new commit.
>>>
>>> Zhai Edwin -
>>> meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch
>>> Laurentiu Palcu -
>>>
>>> meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-lin=
ux-config.h.patch
>>> Cristian Iorga -
>>> meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
>>> Xiaofeng Yan - meta/recipes-extended/lsb/lsbinitscripts/functions.patch
>>> Mark Hatle -
>>> meta/recipes-devtools/binutils/binutils/binutils-armv5e.patch
>>> Mark Hatle - meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
>>> Andreas M=FCller -
>>>
>>> meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-su=
pport-without-nss-for.patch
>>> Bruce Ashfield -
>>>
>>> meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_co=
mpat_task-from-redefiniti.patch
>>
>>
>> Your script is wrong here. That patch has everything you'd expect,
>> since it follows kernel
>> patch conventions. Subject, shortlog, log log and sign-off.
>>
>> So don't expect any resubmission from me on this one, since I won't be
>> putting an upstream
>> status directly in the patch.
>>
> This is a patch in OE-Core, not in the kernel, there is no reason you can=
't
> update this patch to include the Upstream-Status:? What is the status of
> this patch anyway? =A0Is it a backport?

It's still patching kernel code, that's always been the distinction we've d=
rawn.
Simply because it is being pushed (temporarily) via quilt or sits out of tr=
ee
for a time, doesn't change the fact that if the patch is merged into the ke=
rnel
tree, you'd have to strip those parts of the commit/header.

I've always said that kernel patches would follow korg guidelines. That's t=
he
same reason why you don't see any YOCTO or other bug tracking information
within the kernel patches.  I've been consistent in this request since
the dawn of
time :)

It seems to me that you are asking for the patch on disk:

    meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_co=
mpat_task-from-redefiniti.patch

To be modified with that information .. which isn't what I'd want to
do. If we want
to track that, it can be tracked as part of the commit to oe-core, but
not in the
patch itself.

As for whether or not is upstream or not and the compatibility, it was capt=
ured
as part of the commit to oe-core:

    lttng-modules: fix compliation error with 3.2.x -stable kernels

The point is taken that the information should be standardized, and
that this patch
falls into a grey area. That original commit header should have used
better language
to track the status, but I recall there being quite the rush to get it fixe=
d.

We need some flexibility in the tracking, since there is no such thing
as one size
fits all, since everything is tracked in a SCM, putting the
information within the SCM
itself is a valid option (and what I'm suggesting here).

The lttng2 modules need a complete refresh and rework, which will happen
against the 3.4 kernel, so this will be fixed as part of that effort.

Cheers,

Bruce


>
> Sau!
>
>
>
>
>> Bruce
>>
>>>
>>>
>>> Thanks
>>> --
>>> =A0 =A0Sau!
>>>
>>> Saul Wold
>>> Yocto Component Wrangler @ Intel
>>> Yocto Project / Poky Build System
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>>
>>
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


