Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1REku4-0002m3-JZ
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 18:46:39 +0200
Received: by qyk10 with SMTP id 10so1432571qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 09:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=/5HMLbdR3dNjbQ4OZGLSLgLjFORQEbH2BSCvCK14lSE=;
	b=b0TghaOSYOwftVgKG6PIXpwGM6kjCbwop36IyEwbsTBySaLafe3sNIkQ1Y0oHlSZp3
	0cHpTusWZwTQ/uQKXR44TIwp3/SYEYuzfeBawRUq8MoZLn7fGrublN9Z1/NnwX8AgIOH
	P4bUigdItQZ3iT3+89uHa9ZBWypls7rn8pNEc=
Received: by 10.68.74.4 with SMTP id p4mr17894761pbv.47.1318610447130; Fri, 14
	Oct 2011 09:40:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Fri, 14 Oct 2011 09:40:17 -0700 (PDT)
In-Reply-To: <4E98641D.8040608@intel.com>
References: <cover.1317843784.git.raj.khem@gmail.com>
	<4E98641D.8040608@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 14 Oct 2011 09:40:17 -0700
Message-ID: <CAMKF1sqgHLhwuHrXKgUq20jhM-wUFk8FcuVqCcJWE6z_YA++nA@mail.gmail.com>
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
X-List-Received-Date: Fri, 14 Oct 2011 16:46:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2011 at 9:32 AM, Saul Wold <saul.wold@intel.com> wrote:
> On 10/05/2011 12:45 PM, Khem Raj wrote:
>>
>> This brings in qemu-0.15 into OE-core I have had limited testing
>> on it and mainly on qemuarm. Please help testing it on other architectur=
es
>> I will also work on getting it more solidified and bring some backports
>> as needed.
>>
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
> Merged into OE-Core
>
> I needed to add an additional patch to add glib-2.0-native to the
> qemu-native depends

yes that patch was already there on branch. I wonder why you did not get it=
.

>
> We will remove qemu-0.14 after we get through a QA cycle.
>
> Thanks
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sau!
>
>


