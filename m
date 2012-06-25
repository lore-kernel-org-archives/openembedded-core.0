Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sj24g-0004AI-Gh
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 07:42:58 +0200
Received: by eaal1 with SMTP id l1so1124760eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jun 2012 22:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=r2sdd+N0TXKuMzSWx14Eah9wqaNfA2utLpF1ewMYgEY=;
	b=CY1/ECtGTdYjBo0hsv+8vycpaP5IkjysdVr0erPtymRE2s+zTjiNdTFI25L3tDtDLp
	zKbhOrzSMTmEYSLrbWjrXb7z/c7IvJ2WiuBf4k1I+wV3NO6kni55scNUwsjr6pOBbS+2
	xFOGG5ltRhPUvWXoMAV8VwKBozgY5YyRldwrg3sBQylIOKGp3++cKH+VOO7zT7LkIetR
	VbhPSn9Nud1IaCIvkovnQq4atM/iWAXQ7KOqUUB3kB5vlRhCCsr9Lh0CXTPCp5KqBLqu
	0KUe4TchA8jaIDBYfiEfRe5WTrwKwzW4qA/tgu8Hwu3DnQfN5J6ulbHhWlMZTm4OZke8
	Q3/g==
Received: by 10.14.119.202 with SMTP id n50mr2059308eeh.33.1340602327772; Sun,
	24 Jun 2012 22:32:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.71 with HTTP; Sun, 24 Jun 2012 22:31:37 -0700 (PDT)
In-Reply-To: <4FE7F730.8080505@linux.intel.com>
References: <1340319423-24865-1-git-send-email-andrea.adami@gmail.com>
	<4FE74FD8.9000204@linux.intel.com>
	<CAAQYJAu9-xuDQnG60J76eBHGc_jH6WYQwBic0MjjFuJhAFwEHw@mail.gmail.com>
	<4FE7F730.8080505@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Jun 2012 22:31:37 -0700
Message-ID: <CAMKF1so10Leus56=FqhVsn6+cSMVhY1q_DR-X8t+LYLXhtgjXA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: do not stage headers in sysroot
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
X-List-Received-Date: Mon, 25 Jun 2012 05:42:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 24, 2012 at 10:29 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 06/24/2012 02:52 PM, Andrea Adami wrote:
>>
>> On Sun, Jun 24, 2012 at 7:35 PM, Saul Wold<sgw@linux.intel.com> =C2=A0wr=
ote:
>>>
>>> On 06/21/2012 03:57 PM, Andrea Adami wrote:
>>>>
>>>>
>>>> * Headers are included in the package for compatibility
>>>> * but have not yet been synched with linux 3.0
>>>> * The actual issue was that ubi-user.h in sysroot
>>>> * was overwritten by the older version.
>>>> * Unfortunately one ioctl was renamed:
>>>> * http://lists.infradead.org/pipermail/linux-mtd/
>>>> * 2011-March/034419.html
>>>> * Note: the recipe will still use its own older header,
>>>> * following upstream.
>>>>
>>>> Signed-off-by: Andrea Adami<andrea.adami@gmail.com>
>>>> ---
>>>> =C2=A0meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb | =C2=A0 =C2=A06 +-=
----
>>>> =C2=A01 files changed, 1 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
>>>> b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
>>>> index daa3554..1a9d4d3 100644
>>>> --- a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
>>>> +++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
>>>> @@ -11,16 +11,12 @@ SRC_URI =3D
>>>> "git://git.infradead.org/mtd-utils.git;protocol=3Dgit;tag=3Dca39eb1d98=
e736
>>>>
>>>> =C2=A0S =3D "${WORKDIR}/git/"
>>>>
>>>> -PR =3D "r0"
>>>> +PR =3D "r1"
>>>>
>>>> =C2=A0EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}'
>>>> 'CFLAGS=3D${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=3D${S}'"
>>>>
>>>> =C2=A0do_install () {
>>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake install DESTDIR=3D${D} SBINDIR=
=3D${sbindir}
>>>> MANDIR=3D${mandir}
>>>> INCLUDEDIR=3D${includedir}
>>>> - =C2=A0 =C2=A0 =C2=A0 install -d ${D}${includedir}/mtd/
>>>> - =C2=A0 =C2=A0 =C2=A0 for f in ${S}/include/mtd/*.h; do
>>>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 $f =
${D}${includedir}/mtd/
>>>> - =C2=A0 =C2=A0 =C2=A0 done
>>>> =C2=A0}
>>>
>>>
>>> Just curious how this was tested?
>>>
>>> I did a couple of different builds and on one clean rebuild, I found th=
at
>>> udev failed because it could not find mtd/mtd-user.h
>>>
>>> Thanks
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sau!
>>>
>>>
>>>>
>>>> =C2=A0PARALLEL_MAKE =3D ""
>>
>>
>> Strange...
>> I've done build from scratch of core-image-base to test and all was
>> built just fine, included udev_164.
>> It would be indeed bizarre if udev would depend on headers provided by
>> mtd-utils, though.
>>
>> Finally, mtd-user.h belongs to linux-libc-headers(-dev) package.
>>
> If that's the case, then maybe there's a race condition as to or we need =
to
> also add linux-libc-headers to the udev package to ensure they are instal=
led
> correctly before udev is built.

kernel-headers are installed very eary on even before toolchain or
libc are built
udev can only be compiled after libc is built. So there is something
else going on here


