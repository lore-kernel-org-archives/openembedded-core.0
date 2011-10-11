Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RDPzI-0002fQ-JC
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 02:14:28 +0200
Received: by ywf7 with SMTP id 7so5968555ywf.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 17:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=sPsK26GyfGcQw330hzaM1/WjNqEYvSaOSuNC6dE80VY=;
	b=lcfr+nVJK0frWEomRsZzTRJ/z3CRuARDKQyoodBFJDiUmgg9Y6GvgO7C5QalVgZCFQ
	VjXbNY0WBkQD3fTqCcrhGzTVHUOf4gDfRU0YUvdks1HabU14YpzsJZrHqagKH6nPe/KO
	5jRX0pfaewsKrAzrFqi/gTBzm+bLYPtwz7rBs=
Received: by 10.68.28.4 with SMTP id x4mr41217427pbg.56.1318291725103; Mon, 10
	Oct 2011 17:08:45 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.49.129 with HTTP; Mon, 10 Oct 2011 17:08:15 -0700 (PDT)
In-Reply-To: <4E927BBE.3030908@intel.com>
References: <cover.1317843784.git.raj.khem@gmail.com>
	<4E927BBE.3030908@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Oct 2011 17:08:15 -0700
Message-ID: <CAMKF1soHxwjCx4U9xErYXnwYdRo1ksawSZGBZgF8iXDODjeLfA@mail.gmail.com>
To: Saul Wold <saul.wold@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] QEMU 0.15 update please test
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
X-List-Received-Date: Tue, 11 Oct 2011 00:14:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 9, 2011 at 9:59 PM, Saul Wold <saul.wold@intel.com> wrote:
> On 10/05/2011 12:45 PM, Khem Raj wrote:
>>
>> This brings in qemu-0.15 into OE-core I have had limited testing
>> on it and mainly on qemuarm. Please help testing it on other architectur=
es
>> I will also work on getting it more solidified and bring some backports
>> as needed.
>>
> Khem,
>
> Did you do any kind of non-native build, I know it may not make sense, bu=
t
> we can support qemu within the target image with 0.14.
>

no I have not done target builds. Only qemu-native

> My initial testing on the autobuilder seems to imply some dependency on
> glib-2.0.
>

hmmm can you point me to logs


> Thanks
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sau!
>
>> The following changes since commit
>> abde9f65b1617ec61e964c4b3502fd4ad2215dcf:
>>
>> =C2=A0 shared-mime-info: Upgrade recipes from 0.90 -> =C2=A00.91 (2011-1=
0-05
>> 12:39:47 -0700)
>>
>> are available in the git repository at:
>> =C2=A0 git://git.openembedded.org/openembedded-core-contrib kraj/qemu-up=
date
>>
>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Dkraj/qemu-update
>>
>> Khem Raj (1):
>> =C2=A0 qemu-0.15: Add recipe and forward port patches from 0.14
>>
>> =C2=A0.../qemu/qemu-0.15.0/arm-bgr.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 30 +
>> =C2=A0.../qemu/qemu-0.15.0/enable-i386-linux-user.patch =C2=A0| =C2=A0 5=
5 +
>> =C2=A0.../fallback-to-safe-mmap_min_addr.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 39 +
>> =C2=A0.../qemu/qemu-0.15.0/fix-configure-checks.patch =C2=A0 =C2=A0| =C2=
=A0 22 +
>> =C2=A0.../qemu/qemu-0.15.0/fix-nogl.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0127 +
>> =C2=A0.../qemu/qemu-0.15.0/glflags.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 15 +
>> =C2=A0.../qemu/qemu-0.15.0/init-info.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0 18 +
>> =C2=A0.../qemu/qemu-0.15.0/larger_default_ram_size.patch | =C2=A0 22 +
>> =C2=A0.../qemu/qemu-0.15.0/linker-flags.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| =C2=A0 25 +
>> =C2=A0.../qemu/qemu-0.15.0/no-strip.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 15 +
>> =C2=A0.../qemu/qemu-0.15.0/opengl-sdl-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 43 +
>> =C2=A0.../qemu/qemu-0.15.0/powerpc_rom.bin =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | =C2=A0Bin 0 -> =C2=A04096
>> bytes
>> =C2=A0.../qemu/qemu-0.15.0/qemu-git-qemugl-host.patch =C2=A0 =C2=A0|3436=
8
>> ++++++++++++++++++++
>> =C2=A0.../qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch =C2=A0 | =C2=A011=
8 +
>> =C2=A0.../qemugl-allow-glxcontext-release.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 65 +
>> =C2=A0.../qemu/qemu-0.15.0/qemugl-fix.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| =C2=A0 74 +
>> =C2=A0meta/recipes-devtools/qemu/qemu_0.15.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 45 +
>> =C2=A017 files changed, 35081 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/arm-bgr.=
patch
>> =C2=A0create mode 100644
>> meta/recipes-devtools/qemu/qemu-0.15.0/enable-i386-linux-user.patch
>> =C2=A0create mode 100644
>> meta/recipes-devtools/qemu/qemu-0.15.0/fallback-to-safe-mmap_min_addr.pa=
tch
>> =C2=A0create mode 100644
>> meta/recipes-devtools/qemu/qemu-0.15.0/fix-configure-checks.patch
>> =C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/fix-nogl=
.patch
>> =C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/glflags.=
patch
>> =C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/init-inf=
o.patch
>> =C2=A0create mode 100644
>> meta/recipes-devtools/qemu/qemu-0.15.0/larger_default_ram_size.patch
>> =C2=A0create mode 100644
>> meta/recipes-devtools/qemu/qemu-0.15.0/linker-flags.patch
>> =C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/no-strip=
.patch
>> =C2=A0create mode 100644
>> meta/recipes-devtools/qemu/qemu-0.15.0/opengl-sdl-fix.patch
>> =C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu-0.15.0/powerpc_=
rom.bin
>> =C2=A0create mode 100644
>> meta/recipes-devtools/qemu/qemu-0.15.0/qemu-git-qemugl-host.patch
>> =C2=A0create mode 100644
>> meta/recipes-devtools/qemu/qemu-0.15.0/qemu-vmware-vga-depth.patch
>> =C2=A0create mode 100644
>> meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-allow-glxcontext-release.p=
atch
>> =C2=A0create mode 100644
>> meta/recipes-devtools/qemu/qemu-0.15.0/qemugl-fix.patch
>> =C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu_0.15.0.bb
>>
>
>


