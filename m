Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id E493F748C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 10:47:35 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a67-v6so7522880wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2018 03:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=OY4xLurHL5kTuQYS2EZkM8HQzw/B9TbTS+nlcuzVbX0=;
	b=K9VQfClBEcEixr7UEkee0rRJG0z1fD19qSPw7wlgeStrX1sKMiN6mAFLcvbM6KXUyc
	YSY0NsKOnzmrzLgVzqK4zAG9cLpDREaGWEbOVYMOXmI+c2VAqXrHOvsPOwznOKXFKoKn
	2V2awqBUpVyku9rRnQHQ3CLmfq7Lf91y0+pJe2/alVenXEC1XD005Shxs4o8pkEr2YwZ
	/2s9IhYQSB+iIrSlJafLtb9jAxfgPKq8VyAktdmIzB4zcCRnhn2ofOTLMkE4ruTezS4A
	+vpGM165lTt9sNyRlrX2nzfndJcqiElJCxXcBkQ8xmanj1+lbraQpI/GPN9RVVL3Adgm
	39qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=OY4xLurHL5kTuQYS2EZkM8HQzw/B9TbTS+nlcuzVbX0=;
	b=oV1XCaDwbEBdsiAET7IjyU6ZLfKqOBZc+V2iJ0SjrQD9WP3d6PcAVbcXDVEF8MwV3u
	E7qtFlsuj5fx81gHbvgMT5APr6uT5mGW7v7uvgz+I8LLmCRfWvQnp6tm1caawxV8/TGk
	ZwE7zEfBBWy212LEsSlr+AFkqide22wJLFndGKMUGieb2wJWi0o5p1APakKBo3EXRmss
	ULIp5xwk0ZN84uAL1ZJrNP23HXkkXiMZV5caeojCZ9HyV8yM62aakMeZTueLD8v9fdLv
	NyMyO6GLOW3GwuYIdHS1esXADRpPMrkguzzHwnKrgydttWEVOiu7Jb+ZWQOXcWeQED6N
	3fDg==
X-Gm-Message-State: ALKqPwfHA1moykQ7mXjIC32fX0YG477RJ9oO9+g75VBTj1vfQjYxYgS9
	jdMDqV9c1/LIbj7ocefPD2Y=
X-Google-Smtp-Source: AB8JxZpvRIAi+yAF7wA7SRtCfED7n3IQD2oj8uflxgXiP4VJskucvrsum9tENzXvX5KZIujQH+cEbw==
X-Received: by 2002:a1c:f714:: with SMTP id
	v20-v6mr1485439wmh.73.1526554056198; 
	Thu, 17 May 2018 03:47:36 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	76-v6sm24218098wmj.0.2018.05.17.03.47.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 17 May 2018 03:47:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 17 May 2018 12:47:34 +0200
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20180517104734.GB1398@jama>
References: <cover.1526452205.git.raj.khem@gmail.com>
	<071e32634705a36ce4132ab884b3cf11079b4d37.1526452205.git.raj.khem@gmail.com>
	<CAJTo0Lbcs8uy6hujw7S9GHR6fnEX11wUZh2tz37_2fusw9iNFQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbcs8uy6hujw7S9GHR6fnEX11wUZh2tz37_2fusw9iNFQ@mail.gmail.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] ovmf: Fix build with gcc8
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
X-List-Received-Date: Thu, 17 May 2018 10:47:36 -0000
X-Groupsio-MsgNum: 111461
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NDin8bjvE/0mNLFQ"
Content-Disposition: inline

--NDin8bjvE/0mNLFQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2018 at 11:17:11AM +0100, Burton, Ross wrote:
> Even when I pick from the branch instead of the mail, I suspect the
> line endings are messed up and this won't apply.  Can you
> double-check?
>=20
> (I *hate* the ovmf recipe for this reason and am very tempted to just
> run dos2unix over the tree after unpack!)

meta-openembedded/meta-oe/classes/dos2unix.bbclass
might help you do that automatically.

> On 16 May 2018 at 07:32, Khem Raj <raj.khem@gmail.com> wrote:
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ....makefile-add-Wno-stringop-truncatio.patch |  73 ++++++++++++
> >  ...ols-header.makefile-add-Wno-restrict.patch | 104 ++++++++++++++++++
> >  ....makefile-revert-gcc-8-Wno-xxx-optio.patch |  55 +++++++++
> >  ...-silence-false-stringop-overflow-war.patch |  65 +++++++++++
> >  meta/recipes-core/ovmf/ovmf_git.bb            |   4 +
> >  5 files changed, 301 insertions(+)
> >  create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-header.m=
akefile-add-Wno-stringop-truncatio.patch
> >  create mode 100644 meta/recipes-core/ovmf/ovmf/0002-BaseTools-header.m=
akefile-add-Wno-restrict.patch
> >  create mode 100644 meta/recipes-core/ovmf/ovmf/0003-BaseTools-header.m=
akefile-revert-gcc-8-Wno-xxx-optio.patch
> >  create mode 100644 meta/recipes-core/ovmf/ovmf/0004-BaseTools-GenVtf-s=
ilence-false-stringop-overflow-war.patch
> >
> > diff --git a/meta/recipes-core/ovmf/ovmf/0001-BaseTools-header.makefile=
-add-Wno-stringop-truncatio.patch b/meta/recipes-core/ovmf/ovmf/0001-BaseTo=
ols-header.makefile-add-Wno-stringop-truncatio.patch
> > new file mode 100644
> > index 0000000000..1d1679fe7e
> > --- /dev/null
> > +++ b/meta/recipes-core/ovmf/ovmf/0001-BaseTools-header.makefile-add-Wn=
o-stringop-truncatio.patch
> > @@ -0,0 +1,73 @@
> > +From 9fce4bab014b9aa618060eba13d6dd04b0fa1b70 Mon Sep 17 00:00:00 2001
> > +From: Laszlo Ersek <lersek@redhat.com>
> > +Date: Fri, 2 Mar 2018 17:11:52 +0100
> > +Subject: [PATCH 1/4] BaseTools/header.makefile: add "-Wno-stringop-tru=
ncation"
> > +
> > +gcc-8 (which is part of Fedora 28) enables the new warning
> > +"-Wstringop-truncation" in "-Wall". This warning is documented in deta=
il
> > +at <https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html>; the
> > +introduction says
> > +
> > +> Warn for calls to bounded string manipulation functions such as strn=
cat,
> > +> strncpy, and stpncpy that may either truncate the copied string or l=
eave
> > +> the destination unchanged.
> > +
> > +It breaks the BaseTools build with:
> > +
> > +> EfiUtilityMsgs.c: In function 'PrintMessage':
> > +> EfiUtilityMsgs.c:484:9: error: 'strncat' output may be truncated cop=
ying
> > +> between 0 and 511 bytes from a string of length 511
> > +> [-Werror=3Dstringop-truncation]
> > +>          strncat (Line, Line2, MAX_LINE_LEN - strlen (Line) - 1);
> > +>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +> EfiUtilityMsgs.c:469:9: error: 'strncat' output may be truncated cop=
ying
> > +> between 0 and 511 bytes from a string of length 511
> > +> [-Werror=3Dstringop-truncation]
> > +>          strncat (Line, Line2, MAX_LINE_LEN - strlen (Line) - 1);
> > +>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +> EfiUtilityMsgs.c:511:5: error: 'strncat' output may be truncated cop=
ying
> > +> between 0 and 511 bytes from a string of length 511
> > +> [-Werror=3Dstringop-truncation]
> > +>      strncat (Line, Line2, MAX_LINE_LEN - strlen (Line) - 1);
> > +>      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +The right way to fix the warning would be to implement string concat w=
ith
> > +snprintf(). However, Microsoft does not appear to support snprintf()
> > +before VS2015
> > +<https://stackoverflow.com/questions/2915672/snprintf-and-visual-studi=
o-2010>,
> > +so we just have to shut up the warning. The strncat() calls flagged ab=
ove
> > +are valid BTW.
> > +
> > +Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > +Cc: Cole Robinson <crobinso@redhat.com>
> > +Cc: Liming Gao <liming.gao@intel.com>
> > +Cc: Paolo Bonzini <pbonzini@redhat.com>
> > +Cc: Yonghong Zhu <yonghong.zhu@intel.com>
> > +Contributed-under: TianoCore Contribution Agreement 1.1
> > +Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> > +Reviewed-by: Liming Gao <liming.gao@intel.com>
> > +---
> > +Upstream-Status: Backport
> > +
> > + BaseTools/Source/C/Makefiles/header.makefile | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/=
Source/C/Makefiles/header.makefile
> > +index 063982b82f..6c3826aecb 100644
> > +--- a/BaseTools/Source/C/Makefiles/header.makefile
> > ++++ b/BaseTools/Source/C/Makefiles/header.makefile
> > +@@ -47,9 +47,9 @@ INCLUDE =3D $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKE=
ROOT)/Include/Common -I $(MAKE
> > + BUILD_CPPFLAGS =3D $(INCLUDE) -O2
> > + ifeq ($(DARWIN),Darwin)
> > + # assume clang or clang compatible flags on OS X
> > +-BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror=
 -Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nostdlib=
 -c -g
> > ++BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror=
 -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-self-assign -Wn=
o-unused-result -nostdlib -c -g
> > + else
> > +-BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror=
 -Wno-deprecated-declarations -Wno-unused-result -nostdlib -c -g
> > ++BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror=
 -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-unused-result -=
nostdlib -c -g
> > + endif
> > + BUILD_LFLAGS =3D
> > + BUILD_CXXFLAGS =3D -Wno-unused-result
> > +--
> > +2.17.0
> > +
> > diff --git a/meta/recipes-core/ovmf/ovmf/0002-BaseTools-header.makefile=
-add-Wno-restrict.patch b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-header=
=2Emakefile-add-Wno-restrict.patch
> > new file mode 100644
> > index 0000000000..4a25e230ce
> > --- /dev/null
> > +++ b/meta/recipes-core/ovmf/ovmf/0002-BaseTools-header.makefile-add-Wn=
o-restrict.patch
> > @@ -0,0 +1,104 @@
> > +From 86dbdac5a25bd23deb4a0e0a97b527407e02184d Mon Sep 17 00:00:00 2001
> > +From: Laszlo Ersek <lersek@redhat.com>
> > +Date: Fri, 2 Mar 2018 17:11:52 +0100
> > +Subject: [PATCH 2/4] BaseTools/header.makefile: add "-Wno-restrict"
> > +
> > +gcc-8 (which is part of Fedora 28) enables the new warning
> > +"-Wrestrict" in "-Wall". This warning is documented in detail
> > +at <https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html>; the
> > +introduction says
> > +
> > +> Warn when an object referenced by a restrict-qualified parameter (or=
, in
> > +> C++, a __restrict-qualified parameter) is aliased by another argumen=
t,
> > +> or when copies between such objects overlap.
> > +
> > +It breaks the BaseTools build (in the Brotli compression library) with:
> > +
> > +> In function 'ProcessCommandsInternal',
> > +>     inlined from 'ProcessCommands' at dec/decode.c:1828:10:
> > +> dec/decode.c:1781:9: error: 'memcpy' accessing between 17 and 214748=
3631
> > +> bytes at offsets 16 and 16 overlaps between 17 and 2147483631 bytes =
at
> > +> offset 16 [-Werror=3Drestrict]
> > +>          memcpy(copy_dst + 16, copy_src + 16, (size_t)(i - 16));
> > +>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +> In function 'ProcessCommandsInternal',
> > +>     inlined from 'SafeProcessCommands' at dec/decode.c:1833:10:
> > +> dec/decode.c:1781:9: error: 'memcpy' accessing between 17 and 214748=
3631
> > +> bytes at offsets 16 and 16 overlaps between 17 and 2147483631 bytes =
at
> > +> offset 16 [-Werror=3Drestrict]
> > +>          memcpy(copy_dst + 16, copy_src + 16, (size_t)(i - 16));
> > +>          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Paolo Bonzini <pbonzini@redhat.com> analyzed the Brotli source in deta=
il,
> > +and concluded that the warning is a false positive:
> > +
> > +> This seems safe to me, because it's preceded by:
> > +>
> > +>     uint8_t* copy_dst =3D &s->ringbuffer[pos];
> > +>     uint8_t* copy_src =3D &s->ringbuffer[src_start];
> > +>     int dst_end =3D pos + i;
> > +>     int src_end =3D src_start + i;
> > +>     if (src_end > pos && dst_end > src_start) {
> > +>       /* Regions intersect. */
> > +>       goto CommandPostWrapCopy;
> > +>     }
> > +>
> > +> If [src_start, src_start + i) and [pos, pos + i) don't intersect, th=
en
> > +> neither do [src_start + 16, src_start + i) and [pos + 16, pos + i).
> > +>
> > +> The if seems okay:
> > +>
> > +>        (src_start + i > pos && pos + i > src_start)
> > +>
> > +> which can be rewritten to:
> > +>
> > +>        (pos < src_start + i && src_start < pos + i)
> > +>
> > +> Then the numbers are in one of these two orders:
> > +>
> > +>      pos <=3D src_start < pos + i <=3D src_start + i
> > +>      src_start <=3D pos < src_start + i <=3D pos + i
> > +>
> > +> These two would be allowed by the "if", but they can only happen if =
pos
> > +> =3D=3D src_start so they degenerate to the same two orders above:
> > +>
> > +>      pos <=3D src_start < src_start + i <=3D pos + i
> > +>      src_start <=3D pos < pos + i <=3D src_start + i
> > +>
> > +> So it is a false positive in GCC.
> > +
> > +Disable the warning for now.
> > +
> > +Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > +Cc: Cole Robinson <crobinso@redhat.com>
> > +Cc: Liming Gao <liming.gao@intel.com>
> > +Cc: Paolo Bonzini <pbonzini@redhat.com>
> > +Cc: Yonghong Zhu <yonghong.zhu@intel.com>
> > +Reported-by: Cole Robinson <crobinso@redhat.com>
> > +Contributed-under: TianoCore Contribution Agreement 1.1
> > +Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> > +Reviewed-by: Liming Gao <liming.gao@intel.com>
> > +---
> > +Upstream-Status: Backport
> > + BaseTools/Source/C/Makefiles/header.makefile | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/=
Source/C/Makefiles/header.makefile
> > +index 6c3826aecb..3feae10095 100644
> > +--- a/BaseTools/Source/C/Makefiles/header.makefile
> > ++++ b/BaseTools/Source/C/Makefiles/header.makefile
> > +@@ -47,9 +47,9 @@ INCLUDE =3D $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKE=
ROOT)/Include/Common -I $(MAKE
> > + BUILD_CPPFLAGS =3D $(INCLUDE) -O2
> > + ifeq ($(DARWIN),Darwin)
> > + # assume clang or clang compatible flags on OS X
> > +-BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror=
 -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-self-assign -Wn=
o-unused-result -nostdlib -c -g
> > ++BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror=
 -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict -Wno-s=
elf-assign -Wno-unused-result -nostdlib -c -g
> > + else
> > +-BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror=
 -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-unused-result -=
nostdlib -c -g
> > ++BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror=
 -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict -Wno-u=
nused-result -nostdlib -c -g
> > + endif
> > + BUILD_LFLAGS =3D
> > + BUILD_CXXFLAGS =3D -Wno-unused-result
> > +--
> > +2.17.0
> > +
> > diff --git a/meta/recipes-core/ovmf/ovmf/0003-BaseTools-header.makefile=
-revert-gcc-8-Wno-xxx-optio.patch b/meta/recipes-core/ovmf/ovmf/0003-BaseTo=
ols-header.makefile-revert-gcc-8-Wno-xxx-optio.patch
> > new file mode 100644
> > index 0000000000..19f32e7cee
> > --- /dev/null
> > +++ b/meta/recipes-core/ovmf/ovmf/0003-BaseTools-header.makefile-revert=
-gcc-8-Wno-xxx-optio.patch
> > @@ -0,0 +1,55 @@
> > +From 6866325dd9c17412e555974dde41f9631224db52 Mon Sep 17 00:00:00 2001
> > +From: Laszlo Ersek <lersek@redhat.com>
> > +Date: Wed, 7 Mar 2018 10:17:28 +0100
> > +Subject: [PATCH 3/4] BaseTools/header.makefile: revert gcc-8 "-Wno-xxx"
> > + options on OSX
> > +
> > +I recently added the gcc-8 specific "-Wno-stringop-truncation" and
> > +"-Wno-restrict" options to BUILD_CFLAGS, both for "Darwin" (XCODE5 /
> > +clang, OSX) and otherwise (gcc, Linux / Cygwin).
> > +
> > +I also regression-tested the change with gcc-4.8 on Linux -- gcc-4.8 d=
oes
> > +not know either of the (gcc-8 specific) "-Wno-stringop-truncation" and
> > +"-Wno-restrict" options, yet the build completed fine (by GCC design).
> > +
> > +Regarding OSX, my expectation was that
> > +
> > +- XCODE5 / clang would either recognize these warnings options (because
> > +  clang does recognize most -W options of gcc),
> > +
> > +- or, similarly to gcc, clang would simply ignore the "-Wno-xxx" flags
> > +  that it didn't recognize.
> > +
> > +Neither is the case; the new flags have broken the BaseTools build on =
OSX.
> > +Revert them (for OSX only).
> > +
> > +Cc: Liming Gao <liming.gao@intel.com>
> > +Cc: Yonghong Zhu <yonghong.zhu@intel.com>
> > +Reported-by: Liming Gao <liming.gao@intel.com>
> > +Fixes: 1d212a83df0eaf32a6f5d4159beb2d77832e0231
> > +Fixes: 9222154ae7b3eef75ae88cdb56158256227cb929
> > +Contributed-under: TianoCore Contribution Agreement 1.1
> > +Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> > +Reviewed-by: Liming Gao <liming.gao@intel.com>
> > +Acked-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > +---
> > +Upstream-Status: Backport
> > + BaseTools/Source/C/Makefiles/header.makefile | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/BaseTools/Source/C/Makefiles/header.makefile b/BaseTools/=
Source/C/Makefiles/header.makefile
> > +index 3feae10095..6eefddb417 100644
> > +--- a/BaseTools/Source/C/Makefiles/header.makefile
> > ++++ b/BaseTools/Source/C/Makefiles/header.makefile
> > +@@ -47,7 +47,7 @@ INCLUDE =3D $(TOOL_INCLUDE) -I $(MAKEROOT) -I $(MAKE=
ROOT)/Include/Common -I $(MAKE
> > + BUILD_CPPFLAGS =3D $(INCLUDE) -O2
> > + ifeq ($(DARWIN),Darwin)
> > + # assume clang or clang compatible flags on OS X
> > +-BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror=
 -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict -Wno-s=
elf-assign -Wno-unused-result -nostdlib -c -g
> > ++BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror=
 -Wno-deprecated-declarations -Wno-self-assign -Wno-unused-result -nostdlib=
 -c -g
> > + else
> > + BUILD_CFLAGS =3D -MD -fshort-wchar -fno-strict-aliasing -Wall -Werror=
 -Wno-deprecated-declarations -Wno-stringop-truncation -Wno-restrict -Wno-u=
nused-result -nostdlib -c -g
> > + endif
> > +--
> > +2.17.0
> > +
> > diff --git a/meta/recipes-core/ovmf/ovmf/0004-BaseTools-GenVtf-silence-=
false-stringop-overflow-war.patch b/meta/recipes-core/ovmf/ovmf/0004-BaseTo=
ols-GenVtf-silence-false-stringop-overflow-war.patch
> > new file mode 100644
> > index 0000000000..5fd4e9d573
> > --- /dev/null
> > +++ b/meta/recipes-core/ovmf/ovmf/0004-BaseTools-GenVtf-silence-false-s=
tringop-overflow-war.patch
> > @@ -0,0 +1,65 @@
> > +From dfb42a5bff78d9239a80731e337855234badef3e Mon Sep 17 00:00:00 2001
> > +From: Laszlo Ersek <lersek@redhat.com>
> > +Date: Fri, 2 Mar 2018 17:11:52 +0100
> > +Subject: [PATCH 4/4] BaseTools/GenVtf: silence false "stringop-overflo=
w"
> > + warning with memcpy()
> > +
> > +gcc-8 (which is part of Fedora 28) enables the new warning
> > +"-Wstringop-overflow" in "-Wall". This warning is documented in detail=
 at
> > +<https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html>; the
> > +introduction says
> > +
> > +> Warn for calls to string manipulation functions such as memcpy and
> > +> strcpy that are determined to overflow the destination buffer.
> > +
> > +It breaks the BaseTools build with:
> > +
> > +> GenVtf.c: In function 'ConvertVersionInfo':
> > +> GenVtf.c:132:7: error: 'strncpy' specified bound depends on the leng=
th
> > +> of the source argument [-Werror=3Dstringop-overflow=3D]
> > +>        strncpy (TemStr + 4 - Length, Str, Length);
> > +>        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +> GenVtf.c:130:14: note: length computed here
> > +>      Length =3D strlen(Str);
> > +>               ^~~~~~~~~~~
> > +
> > +It is a false positive because, while the bound equals the length of t=
he
> > +source argument, the destination pointer is moved back towards the
> > +beginning of the destination buffer by the same amount (and this amoun=
t is
> > +range-checked first, so we can't precede the start of the dest buffer).
> > +
> > +Replace both strncpy() calls with memcpy().
> > +
> > +Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > +Cc: Cole Robinson <crobinso@redhat.com>
> > +Cc: Liming Gao <liming.gao@intel.com>
> > +Cc: Paolo Bonzini <pbonzini@redhat.com>
> > +Cc: Yonghong Zhu <yonghong.zhu@intel.com>
> > +Reported-by: Cole Robinson <crobinso@redhat.com>
> > +Contributed-under: TianoCore Contribution Agreement 1.1
> > +Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> > +Reviewed-by: Liming Gao <liming.gao@intel.com>
> > +---
> > +Upstream-Status: Backport
> > + BaseTools/Source/C/GenVtf/GenVtf.c | 4 ++--
> > + 1 file changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/BaseTools/Source/C/GenVtf/GenVtf.c b/BaseTools/Source/C/G=
enVtf/GenVtf.c
> > +index 2ae9a7be2c..0cd33e71e9 100644
> > +--- a/BaseTools/Source/C/GenVtf/GenVtf.c
> > ++++ b/BaseTools/Source/C/GenVtf/GenVtf.c
> > +@@ -129,9 +129,9 @@ Returns:
> > +   } else {
> > +     Length =3D strlen(Str);
> > +     if (Length < 4) {
> > +-      strncpy (TemStr + 4 - Length, Str, Length);
> > ++      memcpy (TemStr + 4 - Length, Str, Length);
> > +     } else {
> > +-      strncpy (TemStr, Str + Length - 4, 4);
> > ++      memcpy (TemStr, Str + Length - 4, 4);
> > +     }
> > +
> > +     sscanf (
> > +--
> > +2.17.0
> > +
> > diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovm=
f/ovmf_git.bb
> > index 8750b3c528..212530acbf 100644
> > --- a/meta/recipes-core/ovmf/ovmf_git.bb
> > +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> > @@ -19,6 +19,10 @@ SRC_URI =3D "git://github.com/tianocore/edk2.git;bra=
nch=3Dmaster \
> >         file://0004-ovmf-enable-long-path-file.patch \
> >         file://VfrCompile-increase-path-length-limit.patch \
> >         file://no-stack-protector-all-archs.patch \
> > +       file://0001-BaseTools-header.makefile-add-Wno-stringop-truncati=
o.patch \
> > +       file://0002-BaseTools-header.makefile-add-Wno-restrict.patch \
> > +       file://0003-BaseTools-header.makefile-revert-gcc-8-Wno-xxx-opti=
o.patch \
> > +       file://0004-BaseTools-GenVtf-silence-false-stringop-overflow-wa=
r.patch \
> >          "
> >  UPSTREAM_VERSION_UNKNOWN =3D "1"
> >
> > --
> > 2.17.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NDin8bjvE/0mNLFQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWv1dxgAKCRA3VSO3ZXaA
HKFGAKCxHkOR84ut41coD9T5XxCHzIwP6QCfUAzBqDnosbs/EeAPoBiOHD6xcVA=
=G+Wy
-----END PGP SIGNATURE-----

--NDin8bjvE/0mNLFQ--
