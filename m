Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id 496D076FE2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 16:18:10 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id f81so60611183iof.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Feb 2016 08:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YqHE/LHfdmQymeDhYpWmsxr4C7yx4Tp1/HS+Z98qejk=;
	b=ZGUTMWmCjq0Q2YouwIOuYwMj8LOZwfOlRWPLZoPKZvlrV2FoWoUo7bFYp6viljmbXu
	VlcllKMAl5CDqYb7ANC3IjeFg7QJ4W8+nMyMlSZA2WwfGXyR++fMVSebRMN4Ow6brlUn
	SuTyk63FrQJNIEnbHMvbsTx14znn2rbS4+GcOCreqcTU0kRh9/YOjn+lbIgEBhixGlYD
	uunoE7eom2elPJd5drr/HOZFh1TkZXBUP5Xf2JfjLSRMOo64Q1u6qfHKbb1QUB/uL1dN
	uiQ2r3rwEocqlXBg6tm2dQ0vjG0XFvGv/7oI2LfYgrnOZHWw+1dbyQlQUhKJdeD8FSTe
	/qBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YqHE/LHfdmQymeDhYpWmsxr4C7yx4Tp1/HS+Z98qejk=;
	b=fTYWfahK8eLlg+uA9w3gC/8ZQwLc1ymkgahsOXDB+LSZLFQ9iiIxVxiSQ9pmrUK7+r
	3weNy8OOl0fpClau+228CXFj77u/aHR1xAIhXLgbscWN/K/klJ9zCSNy0U5nO/SWRiof
	BT7wG60+U/tVF9Z5UbH3hwpdtU7FPsnT4zb1ZoKh3rJFix0PyQSwODOLQBj7qT3igmsX
	m7ttn586AKSkjcYQ6aPOtQs2++G/P3ekveAm0s7OumLU78d1XlZlfkPMxfDZLKEFte70
	5pXmT2KvzcuSXe4bNxKAoLOBOjjo2IgUiGgMUDPemoCRwkw2PYGEtDFeNju18VHoBGII
	C/0Q==
X-Gm-Message-State: AG10YOTTs9pQJLknhY4flfwTWfbwvzoQew7o0H2tBWJnp+F/sPXmuEDyVK3UTDLVWJVf4DFzbdiPiL/nDHU8tCRD
X-Received: by 10.107.10.157 with SMTP id 29mr4750425iok.133.1454516290901;
	Wed, 03 Feb 2016 08:18:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Wed, 3 Feb 2016 08:17:51 -0800 (PST)
In-Reply-To: <cf539a03e3ad82336bf24df078174800e7f2c2a5.1454480571.git.raj.khem@gmail.com>
References: <cover.1454480571.git.raj.khem@gmail.com>
	<cf539a03e3ad82336bf24df078174800e7f2c2a5.1454480571.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Feb 2016 16:17:51 +0000
Message-ID: <CAJTo0LbL72SbPTh22uJbRPq9G8PJRQ8Tf80bKbjYVZGBaY_kVw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] gcc: musl related fixes for unwinding, ppc/secure-plt and gthr
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
X-List-Received-Date: Wed, 03 Feb 2016 16:18:11 -0000
Content-Type: multipart/alternative; boundary=001a113f8df8d6ee71052adff6db

--001a113f8df8d6ee71052adff6db
Content-Type: text/plain; charset=UTF-8

On 3 February 2016 at 06:27, Khem Raj <raj.khem@gmail.com> wrote:

> These issues are fixing building gcc for target, ppc issue
> helps in fixing discrepency between gcc cmdline and linker cmdline
>

This appears to break glibc builds for me:

| checking version of bison... 3.0.4, ok
| checking for libc-friendly stddef.h... yes
| checking whether we need to use -P to assemble .S files... no
| checking for .set assembler directive... no
| checking for assembler gnu_unique_object symbol type... yes
| checking for .previous assembler directive... yes
| checking for .protected and .hidden assembler directive... yes
| checking whether __attribute__((visibility())) is supported... yes
| checking linker support for protected data symbol... no
| checking for broken __attribute__((visibility()))... no
| checking for broken __attribute__((alias()))... no
| checking whether to put _rtld_local into .sdata section... no
| checking for .preinit_array/.init_array/.fini_array support... no
| configure: error: Need linker with .init_array/.fini_array support.

Ross

--001a113f8df8d6ee71052adff6db
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 February 2016 at 06:27, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-sty=
le:solid;padding-left:1ex"><div id=3D":6ky" class=3D"" style=3D"overflow:hi=
dden">These issues are fixing building <span class=3D"">gcc</span> for targ=
et, ppc issue<br>
helps in fixing discrepency between <span class=3D"">gcc</span> cmdline and=
 linker cmdline<br></div></blockquote></div><br>This appears to break glibc=
 builds for me:</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra"><div class=3D"gmail_extra">| checking version of bison... 3.0.4, =
ok</div><div class=3D"gmail_extra">| checking for libc-friendly stddef.h...=
 yes</div><div class=3D"gmail_extra">| checking whether we need to use -P t=
o assemble .S files... no</div><div class=3D"gmail_extra">| checking for .s=
et assembler directive... no</div><div class=3D"gmail_extra">| checking for=
 assembler gnu_unique_object symbol type... yes</div><div class=3D"gmail_ex=
tra">| checking for .previous assembler directive... yes</div><div class=3D=
"gmail_extra">| checking for .protected and .hidden assembler directive... =
yes</div><div class=3D"gmail_extra">| checking whether __attribute__((visib=
ility())) is supported... yes</div><div class=3D"gmail_extra">| checking li=
nker support for protected data symbol... no</div><div class=3D"gmail_extra=
">| checking for broken __attribute__((visibility()))... no</div><div class=
=3D"gmail_extra">| checking for broken __attribute__((alias()))... no</div>=
<div class=3D"gmail_extra">| checking whether to put _rtld_local into .sdat=
a section... no</div><div class=3D"gmail_extra">| checking for .preinit_arr=
ay/.init_array/.fini_array support... no</div><div class=3D"gmail_extra">| =
configure: error: Need linker with .init_array/.fini_array support.</div><d=
iv class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></d=
iv></div>

--001a113f8df8d6ee71052adff6db--
