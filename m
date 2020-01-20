Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 4992F7FC41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 15:46:05 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c17so30482793qkg.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 07:46:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zMTuzOYeaU0FgBaNTKiteYJEImCZFiRMPtQ75XbJZTQ=;
	b=t4/U0sjcZqXq9aLMWp46m6dhErzPlRuMFfexpvwayfVwqqJ+8zgWh88r3njPHht3/3
	DNrrQMLOee7iytCM3Sw0NHdcoPkmWmb0su2JaGAmD85XuA3GTIiHhqIZeXBEF5bIqADZ
	Yfrk+VbXFu0stRUZnyu4zAu/FhtgBaZtyWatW2HEjH67snVBywsdDFs5XwEKnWCcdzQd
	n7n+mFj8+MKxITMvVAC14e+QmK9Dr5xM8q7pSRhvDe/g4dAnr13YSUIsxZKnNzNfBcz1
	0UtnHF4i9joxfGeRdnfzQxrqik7omcdI7G5zkjtMzY0S7rm4yl8I4hIy3UPhoGIMfeQF
	udfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zMTuzOYeaU0FgBaNTKiteYJEImCZFiRMPtQ75XbJZTQ=;
	b=YtJzHZaLcHTz5wjzO2798GSJzuJ4CoIzUl5WscIHIVBfwyBgQCwJHkuzS4Q0x6cPtk
	2k5VS8bQzGfnBaqUJsIMqOXEbB06W9ssfDqv/9FoI4CCvcEc4vTTKWl8QCMzuTgFkvzH
	kNWI/fU0rLSiIHHPeyzsDEJd5DnaCOjvKr81bRTl98tOuSp3Lie7wh5/zw5Q2BT4oJsC
	Zu/tYwtpsEl5w+yN08roZCKAJqFW/CnwLnNW+dfAKlqjHE/OvXHjRuyjseYs15JABGi/
	qDq5KphPeKMLDCLE8t1hcG6RSECjYZKHAdv68jo8hi0CZG7gkUgU+gVZL5RkpTPtyQ7g
	hZFQ==
X-Gm-Message-State: APjAAAUp3nhwDq99sBByjLsvGBNB6B1Onx2pd+aNGNq9dwnqFw8YU4gd
	ZMLXfwnah0YAiiKm32WTwD2pamyEwSHaCejKL9o=
X-Google-Smtp-Source: APXvYqxolwMjoD7aYwDr4P1EK02ACzZFAIgAtPg3p8ARfhPYWXTbwKvpE9qnder1JTMn4w/l/3gv9V9hc71305qNwOo=
X-Received: by 2002:a37:a3c7:: with SMTP id m190mr128683qke.212.1579535165941; 
	Mon, 20 Jan 2020 07:46:05 -0800 (PST)
MIME-Version: 1.0
References: <20191018112819.16210-1-ross.burton@intel.com>
	<CAMKF1soy5adOpd49H0dTqtwu=vSRc0EPMnXFvD5uQTaJd+JCig@mail.gmail.com>
	<1615697b554b612f329820f2b3f692011b7722ba.camel@linuxfoundation.org>
	<9bac0b45-777c-faba-f448-d2d03c7e6fac@geanix.com>
In-Reply-To: <9bac0b45-777c-faba-f448-d2d03c7e6fac@geanix.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jan 2020 07:45:39 -0800
Message-ID: <CAMKF1soa5bEfN23uPAhDCk4rfD_OGjaf2xR+m5ET9cLt+kOn0Q@mail.gmail.com>
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] file: explicitly disable seccomp
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
X-List-Received-Date: Mon, 20 Jan 2020 15:46:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 20, 2020 at 4:53 AM Martin Hundeb=C3=B8ll <martin@geanix.com> w=
rote:
>
> On 18/10/2019 23.28, Richard Purdie wrote:
> > On Fri, 2019-10-18 at 18:03 +0530, Khem Raj wrote:
> >>
> >>
> >> On Fri, Oct 18, 2019 at 4:58 PM Ross Burton <ross.burton@intel.com>
> >> wrote:
> >>> file will automatically enable seccomp if the seccomp headers are
> >>> available, but
> >>> the build will fail on Opensuse Tumbleweed because the include
> >>> paths are wrong.
> >>>
> >>> Enabling seccomp is a bad idea because it interacts badly with
> >>> pseudo (causing
> >>> build failures), so explicitly and globally disable seccomp.
> >>>
> >>> Signed-off-by: Ross Burton <ross.burton@intel.com>
> >>> ---
> >>>   meta/recipes-devtools/file/file_5.37.bb | 2 ++
> >>>   1 file changed, 2 insertions(+)
> >>>
> >>> diff --git a/meta/recipes-devtools/file/file_5.37.bb
> >>> b/meta/recipes-devtools/file/file_5.37.bb
> >>> index a840dbc012b..c53a120b840 100644
> >>> --- a/meta/recipes-devtools/file/file_5.37.bb
> >>> +++ b/meta/recipes-devtools/file/file_5.37.bb
> >>> @@ -21,6 +21,8 @@ S =3D "${WORKDIR}/git"
> >>>
> >>>   inherit autotools update-alternatives
> >>>
> >>> +EXTRA_OECONF +=3D "--disable-libseccomp"
> >>> +
> >>
> >> On host it makes sense but how about for target recipe ? We do have
> >> libseccomp support
> >> Perhaps it=E2=80=99s best to disable it for native and native sdk alon=
e ?
> >
> > Given the problem reports in the media and the decisions made by most
> > other distros I think disabling this is probably safest until its been
> > make more usable (no other distro is shipping this enabled now).
>
> Arch Linux enabled libseccomp as of today:
>
> https://git.archlinux.org/svntogit/packages.git/commit/trunk?h=3Dpackages=
/file&id=3Da52fa0a37bad1f4ab67a934a4e0025e70aa1fd0e
>
> This breaks the use of `file` in do_package():
>
> ERROR: base-files-3.0.14-r89 do_package: Fatal errors occurred in
> subprocesses:
>
> Command '['file', '-b',
> '/home/martin/clients/connectedcars/yocto/build/tmp-glibc/work/iwg26-oe-l=
inux-gnueabi/base-files/3.0.14-r89/package/etc/skel/.profile']'
> died with <Signals.SIGSYS: 31>.: Traceback (most recent call last):
>
>    File
> "/home/martin/clients/connectedcars/yocto/poky/meta/lib/oe/utils.py",
> line 272, in run
>
>      ret =3D self._target(*self._args, **self._kwargs)
>
>    File
> "/home/martin/clients/connectedcars/yocto/poky/meta/lib/oe/package.py",
> line 70, in is_elf
>
>      result =3D subprocess.check_output(["file", "-b", path],
> stderr=3Dsubprocess.STDOUT).decode("utf-8")
>
>    File "/usr/lib/python3.8/subprocess.py", line 411, in check_output
>
>      return run(*popenargs, stdout=3DPIPE, timeout=3Dtimeout, check=3DTru=
e,
>
>    File "/usr/lib/python3.8/subprocess.py", line 512, in run
>
>
>      raise CalledProcessError(retcode, process.args,
>
> subprocess.CalledProcessError: Command '['file', '-b',
> '/home/martin/clients/connectedcars/yocto/build/tmp-glibc/work/iwg26-oe-l=
inux-gnueabi/base-files/3.0.14-r89/package/etc/skel/.profile']'
> died with <Signals.SIGSYS: 31>.
>
> Disabling libseccomp sandboxing at runtime fixes it for me:
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
>
> index efd36b3758..bc46d7c27c 100644
>
> --- a/meta/lib/oe/package.py
>
> +++ b/meta/lib/oe/package.py
>
> @@ -67,7 +67,7 @@ def is_kernel_module_signed(path):
>
>   # 16 - kernel module
>
>   def is_elf(path):
>
>       exec_type =3D 0
>
> -    result =3D subprocess.check_output(["file", "-b", path],
> stderr=3Dsubprocess.STDOUT).decode("utf-8")
>
> +    result =3D subprocess.check_output(["file", "-S", "-b", path],
> stderr=3Dsubprocess.STDOUT).decode("utf-8")
>

pseudo needs some love since it alters syscalls which go out of bounds
what is allowed by libseccomp until then pin your file version to 5.37
in arch till a supported distro is affected by same problem. It wont
be long better option is to fix pseudo

>
>
>       if "ELF" in result:
>
>           exec_type |=3D 1
>
>

