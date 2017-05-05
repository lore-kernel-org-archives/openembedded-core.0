Return-Path: <ticotimo@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id 34A0577D55
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 14:13:23 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id x71so3842496vkd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 May 2017 07:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=+tOcSFqUVjvoz5CEbs9J4JU4m5kGRa+gILxfZ6ypdak=;
	b=SKidWjcluh1stDNgbfo97fqdeAof5DTEPIFhbU/6b6QLDHbrsWLAxY0eEoLYGkMwvJ
	mIiHyNuMzTQGuvaXzdkiRsp1Qb+qK/5ED5lRkIJ9JsQYgGfYXs5JQ8iaehXuEctW5s6f
	Jpz3+CifdR7maluikl3AlRsR3osOQtOR1OVxvkGb+xweLtPOER83jHg0Dq36GcTGmHbX
	emtx8prsHgn+HXvoKJSiBeGuhtJpJb6hsmY0/x7EP+xBpr0j0mYZ4SlNLlYzu9TCn3Eg
	IMu32I1e0OIQ4jTMvdvyVsZZSyFTSOeIBh8J6JTnYej2FSrV/ac+CgsO6FZx115R3AzU
	9P3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=+tOcSFqUVjvoz5CEbs9J4JU4m5kGRa+gILxfZ6ypdak=;
	b=TDkPmnzCUOH+2ivLZj8cSa3AtWl5J5Ye+D+GNQH75fIYyknIy+7uz3H19Z2RpWb0MP
	pKWU7oi6tB3D2LZQMWZtew2coIpCuK4jIDUy0kZtxeLi1UWB9w0059NylC0coMoccqKq
	zXoC05np5lIaooJ/8p6sHRW5oOC6zirmdV/o5lvO2yzKqcRLw0MuvrE7l27/A0aiWEe2
	HMOzxpyxg3qrYmTZafAjnjICrmcUTZDfBBMaTauTbJHRm1K2zdeleUhEUsvI4VcZu15i
	F+0L3ghWs6Ns+GHJt2ZiktpX78BGyUpAylnLGdOWkbOgguf1pyGjh4iu9qCy0qDZTASA
	4sHQ==
X-Gm-Message-State: AN3rC/5SOQm5zMnp4k9e7/zvyYKb12bV4h1yZtf5cF/LbxARFWHXhuEe
	mUbC/LG8Qmg2H+qODC1A13ol+zVgBbHy
X-Received: by 10.31.1.194 with SMTP id 185mr23605071vkb.61.1493993604862;
	Fri, 05 May 2017 07:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20170505141027.8381-1-alexander.kanavin@linux.intel.com>
	<20170505141027.8381-4-alexander.kanavin@linux.intel.com>
In-Reply-To: <20170505141027.8381-4-alexander.kanavin@linux.intel.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Fri, 05 May 2017 14:13:14 +0000
Message-ID: <CANx9H-AschSQrSgpiHQh-OPsTKDt-MeQ0Jm5sUOO_OH1iRrHWg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 4/6] recipes-lsb4/perl: remove the recipes
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
X-List-Received-Date: Fri, 05 May 2017 14:13:24 -0000
Content-Type: multipart/alternative; boundary=001a113dc1ee1d8a3d054ec77e28

--001a113dc1ee1d8a3d054ec77e28
Content-Type: text/plain; charset=UTF-8

Should we move them to meta-perl?
On Fri, May 5, 2017 at 7:11 AM Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> These were required by LSB 4.1 tests; there's no other reason to continue
> carrying them in oe-core.
>
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  .../packagegroups/packagegroup-core-lsb.bb         |  6 ----
>  meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb   | 31
> ---------------------
>  meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb   | 18 ------------
>  meta/recipes-lsb4/perl/libenv-perl_1.04.bb         | 21 --------------
>  .../perl/libfile-checktree-perl_4.41.bb            | 32
> ----------------------
>  .../recipes-lsb4/perl/libi18n-collate-perl_1.02.bb | 21 --------------
>  meta/recipes-lsb4/perl/libpod-plainer-perl_1.04.bb | 23 ----------------
>  7 files changed, 152 deletions(-)
>  delete mode 100644 meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
>  delete mode 100644 meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
>  delete mode 100644 meta/recipes-lsb4/perl/libenv-perl_1.04.bb
>  delete mode 100644 meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
>  delete mode 100644 meta/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb
>  delete mode 100644 meta/recipes-lsb4/perl/libpod-plainer-perl_1.04.bb
>
> diff --git a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> index a6fb3023052..112fe7bf11d 100644
> --- a/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> +++ b/meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
> @@ -239,10 +239,4 @@ RDEPENDS_packagegroup-core-lsb-runtime-add = "\
>      glibc-localedata-posix \
>      glibc-extra-nss \
>      glibc-pcprofile \
> -    libclass-isa-perl \
> -    libenv-perl \
> -    libdumpvalue-perl \
> -    libfile-checktree-perl \
> -    libi18n-collate-perl \
> -    libpod-plainer-perl \
>  "
> diff --git a/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
> b/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
> deleted file mode 100644
> index f93841dc7f1..00000000000
> --- a/meta/recipes-lsb4/perl/libclass-isa-perl_0.36.bb
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -SUMMARY = "Perl module for reporting the search path for a class's ISA
> tree"
> -DESCRIPTION = "Suppose you have a class (like Food::Fish::Fishstick) that
> is derived, \
> -via its @ISA, from one or more superclasses (as Food::Fish::Fishstick is
> from Food::Fish,\
> -Life::Fungus, and Chemicals), and some of those superclasses may
> themselves each be\
> -derived, via its @ISA, from one or more superclasses (as above).\
> -\
> -When, then, you call a method in that class ($fishstick->calories), Perl
> first searches\
> -there for that method, but if it's not there, it goes searching in its
> superclasses, and\
> -so on, in a depth-first (or maybe "height-first" is the word) search. In
> the above example,\
> -it'd first look in Food::Fish, then Food, then Matter, then Life::Fungus,
> then Life, then\
> -Chemicals.\
> -\
> -This library, Class::ISA, provides functions that return that list -- the
> list\
> -(in order) of names of classes Perl would search to find a method, with
> no duplicates."
> -
> -HOMEPAGE = "http://search.cpan.org/dist/Class-ISA/"
> -SECTION = "libs"
> -LICENSE = "Artistic-1.0 | GPL-1.0+"
> -
> -LIC_FILES_CHKSUM =
> "file://README;beginline=107;endline=111;md5=6a5c6842a63cfe4dab1f66e2350e4d25"
> -
> -SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Class-ISA-${PV}.tar.gz
> "
> -
> -SRC_URI[md5sum] = "3a2ad203c8dc87d6c9de16215d00af47"
> -SRC_URI[sha256sum] =
> "8816f34e9a38e849a10df756030dccf9fe061a196c11ac3faafd7113c929b964"
> -
> -S = "${WORKDIR}/Class-ISA-${PV}"
> -
> -inherit cpan
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
> b/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
> deleted file mode 100644
> index 9a7461463a8..00000000000
> --- a/meta/recipes-lsb4/perl/libdumpvalue-perl_1.17.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY = "Perl module for provides screen dump of Perl data"
> -
> -HOMEPAGE = "http://search.cpan.org/~flora/Dumpvalue/"
> -SECTION = "libs"
> -LICENSE = "Artistic-1.0 | GPL-1.0+"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=f736bec5ada1fc5e39b2a8e7e06bbcbb"
> -
> -SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Dumpvalue-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "6ede9f693d4a9c4555541cb1a1cc2006"
> -SRC_URI[sha256sum] =
> "9ea74606b545f769a787ec2ae229549a2ad0a8e3cd4b14eff2ce3841836b3bdb"
> -
> -S = "${WORKDIR}/Dumpvalue-${PV}"
> -
> -inherit cpan
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-lsb4/perl/libenv-perl_1.04.bb
> b/meta/recipes-lsb4/perl/libenv-perl_1.04.bb
> deleted file mode 100644
> index dd8e1159ee5..00000000000
> --- a/meta/recipes-lsb4/perl/libenv-perl_1.04.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -SUMMARY = "Perl module that imports environment variables as scalars or
> arrays"
> -DESCRIPTION = "Perl maintains environment variables in a special hash
> named %ENV. \
> -For when this access method is inconvenient, the Perl module Env allows
> environment \
> -variables to be treated as scalar or array variables."
> -
> -HOMEPAGE = "http://search.cpan.org/~flora/Env/"
> -SECTION = "libs"
> -LICENSE = "Artistic-1.0 | GPL-1.0+"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=76c1cbf18db56b3340d91cb947943bd3"
> -
> -SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Env-${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "fdba5c0690e66972c96fee112cf5f25c"
> -SRC_URI[sha256sum] =
> "d94a3d412df246afdc31a2199cbd8ae915167a3f4684f7b7014ce1200251ebb0"
> -
> -S = "${WORKDIR}/Env-${PV}"
> -
> -inherit cpan
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
> b/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
> deleted file mode 100644
> index ce37c72ca87..00000000000
> --- a/meta/recipes-lsb4/perl/libfile-checktree-perl_4.41.bb
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -SUMMARY = "Perl module that run many filetest checks on a tree"
> -DESCRIPTION = "The validate() routine takes a single multiline string
> consisting \
> -of directives, each containing a filename plus a file test to try on it.
> (The file \
> -test may also be a "cd", causing subsequent relative filenames to be
> interpreted \
> -relative to that directory.) After the file test you may put || die to
> make it a \
> -fatal error if the file test fails. The default is || warn. The file test
> may \
> -optionally have a "!' prepended to test for the opposite condition. If
> you do a \
> -cd and then list some relative filenames, you may want to indent them
> slightly for \
> -readability. If you supply your own die() or warn() message, you can use
> $file to \
> -interpolate the filename. \
> -\
> -Filetests may be bunched: "-rwx" tests for all of -r, -w, and -x. Only
> the first failed \
> -test of the bunch will produce a warning. \
> -\
> -The routine returns the number of warnings issued."
> -
> -HOMEPAGE = "http://search.cpan.org/~flora/File-CheckTree/"
> -SECTION = "libs"
> -LICENSE = "Artistic-1.0 | GPL-1.0+"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c6fcacc5df80e037060300a7f4b93bf9"
> -
> -SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/File-CheckTree-${PV}.tar.gz
> "
> -
> -SRC_URI[md5sum] = "519c82aa7e5b7f752b4da14a6c8ad740"
> -SRC_URI[sha256sum] =
> "fc99ab6bb5af4664832715974b5a19e328071dc9202ab72e5d5a594ebd46a729"
> -
> -S = "${WORKDIR}/File-CheckTree-${PV}"
> -
> -inherit cpan
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb
> b/meta/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb
> deleted file mode 100644
> index f1839e0cf97..00000000000
> --- a/meta/recipes-lsb4/perl/libi18n-collate-perl_1.02.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -SUMMARY = "Perl module that compare 8-bit scalar data according to the
> current locale"
> -DESCRIPTION = "This module provides you with objects that will collate
> according to \
> -your national character set, provided that the POSIX setlocale() function
> is supported \
> -on your system."
> -
> -HOMEPAGE = "http://search.cpan.org/~flora/I18N-Collate/"
> -SECTION = "libs"
> -LICENSE = "Artistic-1.0 | GPL-1.0+"
> -
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=ff6d629144a6ec1ea8c300f75760184f"
> -
> -SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/I18N-Collate-${PV}.tar.gz
> "
> -
> -SRC_URI[md5sum] = "72ddb6d1c59cfdf31aa3b04799b86af0"
> -SRC_URI[sha256sum] =
> "9174506bc903eda89690394e3f45558ab7e013114227896d8569d6164648fe37"
> -
> -S = "${WORKDIR}/I18N-Collate-${PV}"
> -
> -inherit cpan
> -
> -BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-lsb4/perl/libpod-plainer-perl_1.04.bb
> b/meta/recipes-lsb4/perl/libpod-plainer-perl_1.04.bb
> deleted file mode 100644
> index a3e58f031ec..00000000000
> --- a/meta/recipes-lsb4/perl/libpod-plainer-perl_1.04.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -SUMMARY = "Perl extension for converting Pod to old-style Pod"
> -DESCRIPTION = "Pod::Plainer uses Pod::Parser which takes Pod with the
> (new) 'C<< .. >>' \
> -constructs and returns the old(er) style with just 'C<>'; '<' and '>' are
> replaced by \
> -'E<lt>' and 'E<gt>'. \
> -\
> -This can be used to pre-process Pod before using tools which do not
> recognise the new style Pods."
> -
> -HOMEPAGE = "http://search.cpan.org/dist/Pod-Plainer/"
> -SECTION = "libs"
> -LICENSE = "Artistic-1.0 | GPL-1.0+"
> -
> -LIC_FILES_CHKSUM =
> "file://README;beginline=27;md5=227cf83970fc61264845825d9d2bf6f8"
> -
> -SRC_URI = "
> http://search.cpan.org/CPAN/authors/id/R/RM/RMBARKER/Pod-Plainer-${PV}.tar.gz
> "
> -
> -SRC_URI[md5sum] = "f502eacd1a40894b9dfea55fc2cd5e7d"
> -SRC_URI[sha256sum] =
> "1bbfbf7d1d4871e5a83bab2137e22d089078206815190eb1d5c1260a3499456f"
> -
> -S = "${WORKDIR}/Pod-Plainer-${PV}"
> -
> -inherit cpan
> -
> -BBCLASSEXTEND = "native"
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a113dc1ee1d8a3d054ec77e28
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Should we move them to meta-perl?<br><div class=3D"gmail_quote"><div dir=3D=
"ltr">On Fri, May 5, 2017 at 7:11 AM Alexander Kanavin &lt;<a href=3D"mailt=
o:alexander.kanavin@linux.intel.com">alexander.kanavin@linux.intel.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">These were required by L=
SB 4.1 tests; there&#39;s no other reason to continue<br>
carrying them in oe-core.<br>
<br>
Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alexander.kanavin@li=
nux.intel.com" target=3D"_blank">alexander.kanavin@linux.intel.com</a>&gt;<=
br>
---<br>
=C2=A0.../packagegroups/<a href=3D"http://packagegroup-core-lsb.bb" rel=3D"=
noreferrer" target=3D"_blank">packagegroup-core-lsb.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 6 ----<br>
=C2=A0meta/recipes-lsb4/perl/<a href=3D"http://libclass-isa-perl_0.36.bb" r=
el=3D"noreferrer" target=3D"_blank">libclass-isa-perl_0.36.bb</a>=C2=A0 =C2=
=A0| 31 ---------------------<br>
=C2=A0meta/recipes-lsb4/perl/<a href=3D"http://libdumpvalue-perl_1.17.bb" r=
el=3D"noreferrer" target=3D"_blank">libdumpvalue-perl_1.17.bb</a>=C2=A0 =C2=
=A0| 18 ------------<br>
=C2=A0meta/recipes-lsb4/perl/<a href=3D"http://libenv-perl_1.04.bb" rel=3D"=
noreferrer" target=3D"_blank">libenv-perl_1.04.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 21 --------------<br>
=C2=A0.../perl/<a href=3D"http://libfile-checktree-perl_4.41.bb" rel=3D"nor=
eferrer" target=3D"_blank">libfile-checktree-perl_4.41.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 32 ----------------------<br>
=C2=A0.../recipes-lsb4/perl/<a href=3D"http://libi18n-collate-perl_1.02.bb"=
 rel=3D"noreferrer" target=3D"_blank">libi18n-collate-perl_1.02.bb</a> | 21=
 --------------<br>
=C2=A0meta/recipes-lsb4/perl/<a href=3D"http://libpod-plainer-perl_1.04.bb"=
 rel=3D"noreferrer" target=3D"_blank">libpod-plainer-perl_1.04.bb</a> | 23 =
----------------<br>
=C2=A07 files changed, 152 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-lsb4/perl/<a href=3D"http://libclass-=
isa-perl_0.36.bb" rel=3D"noreferrer" target=3D"_blank">libclass-isa-perl_0.=
36.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-lsb4/perl/<a href=3D"http://libdumpva=
lue-perl_1.17.bb" rel=3D"noreferrer" target=3D"_blank">libdumpvalue-perl_1.=
17.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-lsb4/perl/<a href=3D"http://libenv-pe=
rl_1.04.bb" rel=3D"noreferrer" target=3D"_blank">libenv-perl_1.04.bb</a><br=
>
=C2=A0delete mode 100644 meta/recipes-lsb4/perl/<a href=3D"http://libfile-c=
hecktree-perl_4.41.bb" rel=3D"noreferrer" target=3D"_blank">libfile-checktr=
ee-perl_4.41.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-lsb4/perl/<a href=3D"http://libi18n-c=
ollate-perl_1.02.bb" rel=3D"noreferrer" target=3D"_blank">libi18n-collate-p=
erl_1.02.bb</a><br>
=C2=A0delete mode 100644 meta/recipes-lsb4/perl/<a href=3D"http://libpod-pl=
ainer-perl_1.04.bb" rel=3D"noreferrer" target=3D"_blank">libpod-plainer-per=
l_1.04.bb</a><br>
<br>
diff --git a/meta/recipes-extended/packagegroups/<a href=3D"http://packageg=
roup-core-lsb.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-ls=
b.bb</a> b/meta/recipes-extended/packagegroups/<a href=3D"http://packagegro=
up-core-lsb.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-lsb.=
bb</a><br>
index a6fb3023052..112fe7bf11d 100644<br>
--- a/meta/recipes-extended/packagegroups/<a href=3D"http://packagegroup-co=
re-lsb.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-lsb.bb</a=
><br>
+++ b/meta/recipes-extended/packagegroups/<a href=3D"http://packagegroup-co=
re-lsb.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-core-lsb.bb</a=
><br>
@@ -239,10 +239,4 @@ RDEPENDS_packagegroup-core-lsb-runtime-add =3D &quot;\=
<br>
=C2=A0 =C2=A0 =C2=A0glibc-localedata-posix \<br>
=C2=A0 =C2=A0 =C2=A0glibc-extra-nss \<br>
=C2=A0 =C2=A0 =C2=A0glibc-pcprofile \<br>
-=C2=A0 =C2=A0 libclass-isa-perl \<br>
-=C2=A0 =C2=A0 libenv-perl \<br>
-=C2=A0 =C2=A0 libdumpvalue-perl \<br>
-=C2=A0 =C2=A0 libfile-checktree-perl \<br>
-=C2=A0 =C2=A0 libi18n-collate-perl \<br>
-=C2=A0 =C2=A0 libpod-plainer-perl \<br>
=C2=A0&quot;<br>
diff --git a/meta/recipes-lsb4/perl/<a href=3D"http://libclass-isa-perl_0.3=
6.bb" rel=3D"noreferrer" target=3D"_blank">libclass-isa-perl_0.36.bb</a> b/=
meta/recipes-lsb4/perl/<a href=3D"http://libclass-isa-perl_0.36.bb" rel=3D"=
noreferrer" target=3D"_blank">libclass-isa-perl_0.36.bb</a><br>
deleted file mode 100644<br>
index f93841dc7f1..00000000000<br>
--- a/meta/recipes-lsb4/perl/<a href=3D"http://libclass-isa-perl_0.36.bb" r=
el=3D"noreferrer" target=3D"_blank">libclass-isa-perl_0.36.bb</a><br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-SUMMARY =3D &quot;Perl module for reporting the search path for a class&#3=
9;s ISA tree&quot;<br>
-DESCRIPTION =3D &quot;Suppose you have a class (like Food::Fish::Fishstick=
) that is derived, \<br>
-via its @ISA, from one or more superclasses (as Food::Fish::Fishstick is f=
rom Food::Fish,\<br>
-Life::Fungus, and Chemicals), and some of those superclasses may themselve=
s each be\<br>
-derived, via its @ISA, from one or more superclasses (as above).\<br>
-\<br>
-When, then, you call a method in that class ($fishstick-&gt;calories), Per=
l first searches\<br>
-there for that method, but if it&#39;s not there, it goes searching in its=
 superclasses, and\<br>
-so on, in a depth-first (or maybe &quot;height-first&quot; is the word) se=
arch. In the above example,\<br>
-it&#39;d first look in Food::Fish, then Food, then Matter, then Life::Fung=
us, then Life, then\<br>
-Chemicals.\<br>
-\<br>
-This library, Class::ISA, provides functions that return that list -- the =
list\<br>
-(in order) of names of classes Perl would search to find a method, with no=
 duplicates.&quot;<br>
-<br>
-HOMEPAGE =3D &quot;<a href=3D"http://search.cpan.org/dist/Class-ISA/" rel=
=3D"noreferrer" target=3D"_blank">http://search.cpan.org/dist/Class-ISA/</a=
>&quot;<br>
-SECTION =3D &quot;libs&quot;<br>
-LICENSE =3D &quot;Artistic-1.0 | GPL-1.0+&quot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://README;beginline=3D107;endline=3D111;md5=
=3D6a5c6842a63cfe4dab1f66e2350e4d25&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://search.cpan.org/CPAN/authors/id/S/SM/S=
MUELLER/Class-ISA-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">ht=
tp://search.cpan.org/CPAN/authors/id/S/SM/SMUELLER/Class-ISA-${PV}.tar.gz</=
a>&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;3a2ad203c8dc87d6c9de16215d00af47&quot;<br>
-SRC_URI[sha256sum] =3D &quot;8816f34e9a38e849a10df756030dccf9fe061a196c11a=
c3faafd7113c929b964&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/Class-ISA-${PV}&quot;<br>
-<br>
-inherit cpan<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-lsb4/perl/<a href=3D"http://libdumpvalue-perl_1.1=
7.bb" rel=3D"noreferrer" target=3D"_blank">libdumpvalue-perl_1.17.bb</a> b/=
meta/recipes-lsb4/perl/<a href=3D"http://libdumpvalue-perl_1.17.bb" rel=3D"=
noreferrer" target=3D"_blank">libdumpvalue-perl_1.17.bb</a><br>
deleted file mode 100644<br>
index 9a7461463a8..00000000000<br>
--- a/meta/recipes-lsb4/perl/<a href=3D"http://libdumpvalue-perl_1.17.bb" r=
el=3D"noreferrer" target=3D"_blank">libdumpvalue-perl_1.17.bb</a><br>
+++ /dev/null<br>
@@ -1,18 +0,0 @@<br>
-SUMMARY =3D &quot;Perl module for provides screen dump of Perl data&quot;<=
br>
-<br>
-HOMEPAGE =3D &quot;<a href=3D"http://search.cpan.org/~flora/Dumpvalue/" re=
l=3D"noreferrer" target=3D"_blank">http://search.cpan.org/~flora/Dumpvalue/=
</a>&quot;<br>
-SECTION =3D &quot;libs&quot;<br>
-LICENSE =3D &quot;Artistic-1.0 | GPL-1.0+&quot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Df736bec5ada1fc5e39b2a8e7e0=
6bbcbb&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://search.cpan.org/CPAN/authors/id/F/FL/F=
LORA/Dumpvalue-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http:=
//search.cpan.org/CPAN/authors/id/F/FL/FLORA/Dumpvalue-${PV}.tar.gz</a>&quo=
t;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;6ede9f693d4a9c4555541cb1a1cc2006&quot;<br>
-SRC_URI[sha256sum] =3D &quot;9ea74606b545f769a787ec2ae229549a2ad0a8e3cd4b1=
4eff2ce3841836b3bdb&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/Dumpvalue-${PV}&quot;<br>
-<br>
-inherit cpan<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-lsb4/perl/<a href=3D"http://libenv-perl_1.04.bb" =
rel=3D"noreferrer" target=3D"_blank">libenv-perl_1.04.bb</a> b/meta/recipes=
-lsb4/perl/<a href=3D"http://libenv-perl_1.04.bb" rel=3D"noreferrer" target=
=3D"_blank">libenv-perl_1.04.bb</a><br>
deleted file mode 100644<br>
index dd8e1159ee5..00000000000<br>
--- a/meta/recipes-lsb4/perl/<a href=3D"http://libenv-perl_1.04.bb" rel=3D"=
noreferrer" target=3D"_blank">libenv-perl_1.04.bb</a><br>
+++ /dev/null<br>
@@ -1,21 +0,0 @@<br>
-SUMMARY =3D &quot;Perl module that imports environment variables as scalar=
s or arrays&quot;<br>
-DESCRIPTION =3D &quot;Perl maintains environment variables in a special ha=
sh named %ENV. \<br>
-For when this access method is inconvenient, the Perl module Env allows en=
vironment \<br>
-variables to be treated as scalar or array variables.&quot;<br>
-<br>
-HOMEPAGE =3D &quot;<a href=3D"http://search.cpan.org/~flora/Env/" rel=3D"n=
oreferrer" target=3D"_blank">http://search.cpan.org/~flora/Env/</a>&quot;<b=
r>
-SECTION =3D &quot;libs&quot;<br>
-LICENSE =3D &quot;Artistic-1.0 | GPL-1.0+&quot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D76c1cbf18db56b3340d91cb947=
943bd3&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://search.cpan.org/CPAN/authors/id/F/FL/F=
LORA/Env-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://sear=
ch.cpan.org/CPAN/authors/id/F/FL/FLORA/Env-${PV}.tar.gz</a>&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;fdba5c0690e66972c96fee112cf5f25c&quot;<br>
-SRC_URI[sha256sum] =3D &quot;d94a3d412df246afdc31a2199cbd8ae915167a3f4684f=
7b7014ce1200251ebb0&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/Env-${PV}&quot;<br>
-<br>
-inherit cpan<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-lsb4/perl/<a href=3D"http://libfile-checktree-per=
l_4.41.bb" rel=3D"noreferrer" target=3D"_blank">libfile-checktree-perl_4.41=
.bb</a> b/meta/recipes-lsb4/perl/<a href=3D"http://libfile-checktree-perl_4=
.41.bb" rel=3D"noreferrer" target=3D"_blank">libfile-checktree-perl_4.41.bb=
</a><br>
deleted file mode 100644<br>
index ce37c72ca87..00000000000<br>
--- a/meta/recipes-lsb4/perl/<a href=3D"http://libfile-checktree-perl_4.41.=
bb" rel=3D"noreferrer" target=3D"_blank">libfile-checktree-perl_4.41.bb</a>=
<br>
+++ /dev/null<br>
@@ -1,32 +0,0 @@<br>
-SUMMARY =3D &quot;Perl module that run many filetest checks on a tree&quot=
;<br>
-DESCRIPTION =3D &quot;The validate() routine takes a single multiline stri=
ng consisting \<br>
-of directives, each containing a filename plus a file test to try on it. (=
The file \<br>
-test may also be a &quot;cd&quot;, causing subsequent relative filenames t=
o be interpreted \<br>
-relative to that directory.) After the file test you may put || die to mak=
e it a \<br>
-fatal error if the file test fails. The default is || warn. The file test =
may \<br>
-optionally have a &quot;!&#39; prepended to test for the opposite conditio=
n. If you do a \<br>
-cd and then list some relative filenames, you may want to indent them slig=
htly for \<br>
-readability. If you supply your own die() or warn() message, you can use $=
file to \<br>
-interpolate the filename. \<br>
-\<br>
-Filetests may be bunched: &quot;-rwx&quot; tests for all of -r, -w, and -x=
. Only the first failed \<br>
-test of the bunch will produce a warning. \<br>
-\<br>
-The routine returns the number of warnings issued.&quot;<br>
-<br>
-HOMEPAGE =3D &quot;<a href=3D"http://search.cpan.org/~flora/File-CheckTree=
/" rel=3D"noreferrer" target=3D"_blank">http://search.cpan.org/~flora/File-=
CheckTree/</a>&quot;<br>
-SECTION =3D &quot;libs&quot;<br>
-LICENSE =3D &quot;Artistic-1.0 | GPL-1.0+&quot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dc6fcacc5df80e037060300a7f4=
b93bf9&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://search.cpan.org/CPAN/authors/id/F/FL/F=
LORA/File-CheckTree-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/File-CheckTree-${PV}.tar.=
gz</a>&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;519c82aa7e5b7f752b4da14a6c8ad740&quot;<br>
-SRC_URI[sha256sum] =3D &quot;fc99ab6bb5af4664832715974b5a19e328071dc9202ab=
72e5d5a594ebd46a729&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/File-CheckTree-${PV}&quot;<br>
-<br>
-inherit cpan<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-lsb4/perl/<a href=3D"http://libi18n-collate-perl_=
1.02.bb" rel=3D"noreferrer" target=3D"_blank">libi18n-collate-perl_1.02.bb<=
/a> b/meta/recipes-lsb4/perl/<a href=3D"http://libi18n-collate-perl_1.02.bb=
" rel=3D"noreferrer" target=3D"_blank">libi18n-collate-perl_1.02.bb</a><br>
deleted file mode 100644<br>
index f1839e0cf97..00000000000<br>
--- a/meta/recipes-lsb4/perl/<a href=3D"http://libi18n-collate-perl_1.02.bb=
" rel=3D"noreferrer" target=3D"_blank">libi18n-collate-perl_1.02.bb</a><br>
+++ /dev/null<br>
@@ -1,21 +0,0 @@<br>
-SUMMARY =3D &quot;Perl module that compare 8-bit scalar data according to =
the current locale&quot;<br>
-DESCRIPTION =3D &quot;This module provides you with objects that will coll=
ate according to \<br>
-your national character set, provided that the POSIX setlocale() function =
is supported \<br>
-on your system.&quot;<br>
-<br>
-HOMEPAGE =3D &quot;<a href=3D"http://search.cpan.org/~flora/I18N-Collate/"=
 rel=3D"noreferrer" target=3D"_blank">http://search.cpan.org/~flora/I18N-Co=
llate/</a>&quot;<br>
-SECTION =3D &quot;libs&quot;<br>
-LICENSE =3D &quot;Artistic-1.0 | GPL-1.0+&quot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dff6d629144a6ec1ea8c300f757=
60184f&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://search.cpan.org/CPAN/authors/id/F/FL/F=
LORA/I18N-Collate-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">ht=
tp://search.cpan.org/CPAN/authors/id/F/FL/FLORA/I18N-Collate-${PV}.tar.gz</=
a>&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;72ddb6d1c59cfdf31aa3b04799b86af0&quot;<br>
-SRC_URI[sha256sum] =3D &quot;9174506bc903eda89690394e3f45558ab7e0131142278=
96d8569d6164648fe37&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/I18N-Collate-${PV}&quot;<br>
-<br>
-inherit cpan<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-lsb4/perl/<a href=3D"http://libpod-plainer-perl_1=
.04.bb" rel=3D"noreferrer" target=3D"_blank">libpod-plainer-perl_1.04.bb</a=
> b/meta/recipes-lsb4/perl/<a href=3D"http://libpod-plainer-perl_1.04.bb" r=
el=3D"noreferrer" target=3D"_blank">libpod-plainer-perl_1.04.bb</a><br>
deleted file mode 100644<br>
index a3e58f031ec..00000000000<br>
--- a/meta/recipes-lsb4/perl/<a href=3D"http://libpod-plainer-perl_1.04.bb"=
 rel=3D"noreferrer" target=3D"_blank">libpod-plainer-perl_1.04.bb</a><br>
+++ /dev/null<br>
@@ -1,23 +0,0 @@<br>
-SUMMARY =3D &quot;Perl extension for converting Pod to old-style Pod&quot;=
<br>
-DESCRIPTION =3D &quot;Pod::Plainer uses Pod::Parser which takes Pod with t=
he (new) &#39;C&lt;&lt; .. &gt;&gt;&#39; \<br>
-constructs and returns the old(er) style with just &#39;C&lt;&gt;&#39;; &#=
39;&lt;&#39; and &#39;&gt;&#39; are replaced by \<br>
-&#39;E&lt;lt&gt;&#39; and &#39;E&lt;gt&gt;&#39;. \<br>
-\<br>
-This can be used to pre-process Pod before using tools which do not recogn=
ise the new style Pods.&quot;<br>
-<br>
-HOMEPAGE =3D &quot;<a href=3D"http://search.cpan.org/dist/Pod-Plainer/" re=
l=3D"noreferrer" target=3D"_blank">http://search.cpan.org/dist/Pod-Plainer/=
</a>&quot;<br>
-SECTION =3D &quot;libs&quot;<br>
-LICENSE =3D &quot;Artistic-1.0 | GPL-1.0+&quot;<br>
-<br>
-LIC_FILES_CHKSUM =3D &quot;file://README;beginline=3D27;md5=3D227cf83970fc=
61264845825d9d2bf6f8&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"http://search.cpan.org/CPAN/authors/id/R/RM/R=
MBARKER/Pod-Plainer-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">=
http://search.cpan.org/CPAN/authors/id/R/RM/RMBARKER/Pod-Plainer-${PV}.tar.=
gz</a>&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;f502eacd1a40894b9dfea55fc2cd5e7d&quot;<br>
-SRC_URI[sha256sum] =3D &quot;1bbfbf7d1d4871e5a83bab2137e22d089078206815190=
eb1d5c1260a3499456f&quot;<br>
-<br>
-S =3D &quot;${WORKDIR}/Pod-Plainer-${PV}&quot;<br>
-<br>
-inherit cpan<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
--<br>
2.11.0<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--001a113dc1ee1d8a3d054ec77e28--
