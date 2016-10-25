Return-Path: <ulfalizer@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1E7E4606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 11:18:20 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id 14so776481vke.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 04:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=dEmvEOu9HxenEn4Ynl/LofpaTK0qiJj6tIcbgyk9nsI=;
	b=d3q/dqTVx+SCAztqg7FkxDWMbN6n4tYHZvdFHL68afHRKdiP87LsEP61VAVxlvzIhl
	f68DGFNmU3wLad7wM3SxO1VYXEPeGJ8zMkVSF4JMzd6LFy3MNBISeqEgOrYKzsi0FcPN
	F2LvRqxgDkdRwnQq6RLs0+8FZYHFnkW2ZSXFL7iHBH0EVqShx90LsyMMvGXK/82KUPM2
	1Qxm8LlI/ocMBzOJfJHiaQ2a9MMTTnRq/GwxHl43kRPreOSuBySY49iYdLB4hGENpAFv
	bd99kr9ESooCLiKAUnDj7NzSlV72pUyd26hvhVFJbOEcr7bL0ads01pGg2p8tmFy+sKW
	CkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=dEmvEOu9HxenEn4Ynl/LofpaTK0qiJj6tIcbgyk9nsI=;
	b=eXJn0XzRpIUy5xKnLjoUI7mE0zpC8Qw33Pu/R0QsR7ghqAyvnz0ocC992/pa5jPFK/
	0n8/95Spo2JFEBSjYwtN8lpeWx3M90EWhmZhd/MXLMT7m421DI0+2xE9OGu2L07HnfXv
	FRvfdkiMovHLWFE57CAXz8qaSROO16Y9gBbP3okVqzwBq634Xh9E9MWTKWvhzPqgMx14
	meGG2IYgvqQb0UotPrhD60VBIIUqrGQS3q7hTrpNNclAEJcVM0IcN17O03U3qrAVyIzr
	PZVLEZPAsHjn3FI0rWbiUmmMRGtODo27Emt0CJCe7bgrH2mOVf61DMVxPeosxMcYQiA1
	0Q7Q==
X-Gm-Message-State: ABUngvfVbRQzy273ncs51bHuYCFBX7XfrPY56rfBl6fWt8On6wNCZTXMIWSfBFFwuVxoUady4KfdAxtRac18Yw==
X-Received: by 10.31.52.66 with SMTP id b63mr14748277vka.9.1477394301398; Tue,
	25 Oct 2016 04:18:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.153.194 with HTTP; Tue, 25 Oct 2016 04:18:20 -0700 (PDT)
In-Reply-To: <1477390980-16319-1-git-send-email-michael.blaettler@siemens.com>
References: <1477390980-16319-1-git-send-email-michael.blaettler@siemens.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Tue, 25 Oct 2016 13:18:20 +0200
Message-ID: <CAFkk2KRg0eC98kRU=vAbdCG8zLAaB6B9_H2tBiY-bweoNfLSsA@mail.gmail.com>
To: =?UTF-8?Q?Michael_Bl=C3=A4ttler?= <michael.blaettler@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] package.py: New EXTRA_STRIPFLAGS variable
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
X-List-Received-Date: Tue, 25 Oct 2016 11:18:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 25, 2016 at 12:23 PM, Michael Bl=C3=A4ttler
<michael.blaettler@siemens.com> wrote:
> The EXTRA_STRIPFLAGS variable can be used to pass additional parameters t=
o the strip command.
> This can be used to remove additional sections or to keep symbols.
> The removal of additional sections can be useful to enable reproducible b=
uilds.
> Sections which contain paths or md5sums of the debug binaries (like gnu_d=
ebuglink)
> can be eliminated with this flag.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> Signed-off-by: Michael Bl=C3=A4ttler <michael.blaettler@siemens.com>
> ---
>  meta/classes/package.bbclass |  5 +++--
>  meta/lib/oe/package.py       | 13 ++++++-------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index a6f0a7a..05b92a8 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1055,14 +1055,15 @@ python split_and_strip_files () {
>      # Now lets go back over things and strip them
>      #
>      if (d.getVar('INHIBIT_PACKAGE_STRIP', True) !=3D '1'):
> +        extraflags =3D d.getVar('EXTRA_STRIPFLAGS', False)

Why False? That means you can't do e.g.

  EXTRA_STRIPFLAGS =3D "${EXTRA_STRIPSFLAGS_HELPER}"

or

  EXTRA_STRIPFLAGS =3D "${@calculate_extra_stripflags()}"

>          strip =3D d.getVar("STRIP", True)
>          sfiles =3D []
>          for file in elffiles:
>              elf_file =3D int(elffiles[file])
>              #bb.note("Strip %s" % file)
> -            sfiles.append((file, elf_file, strip))
> +            sfiles.append((file, elf_file, strip, extraflags))
>          for f in kernmods:
> -            sfiles.append((f, 16, strip))
> +            sfiles.append((f, 16, strip, extraflags))
>
>          oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
>
> diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
> index 02642f2..757044a 100644
> --- a/meta/lib/oe/package.py
> +++ b/meta/lib/oe/package.py
> @@ -10,7 +10,7 @@ def runstrip(arg):
>
>      import stat, subprocess
>
> -    (file, elftype, strip) =3D arg
> +    (file, elftype, strip, extraflags) =3D arg
>
>      newmode =3D None
>      if not os.access(file, os.W_OK) or os.access(file, os.R_OK):
> @@ -18,17 +18,16 @@ def runstrip(arg):
>          newmode =3D origmode | stat.S_IWRITE | stat.S_IREAD
>          os.chmod(file, newmode)
>
> -    extraflags =3D ""
> -
> -    # kernel module
> +    extraflags +=3D ' '

I'd remove this line and add an extra space to the beginning of the +=3D
values below, but no biggie.

> +    # kernel module
>      if elftype & 16:
> -        extraflags =3D "--strip-debug --remove-section=3D.comment --remo=
ve-section=3D.note --preserve-dates"
> +        extraflags +=3D "--strip-debug --remove-section=3D.comment --rem=
ove-section=3D.note --preserve-dates"
>      # .so and shared library
>      elif ".so" in file and elftype & 8:
> -        extraflags =3D "--remove-section=3D.comment --remove-section=3D.=
note --strip-unneeded"
> +        extraflags +=3D "--remove-section=3D.comment --remove-section=3D=
.note --strip-unneeded"
>      # shared or executable:
>      elif elftype & 8 or elftype & 4:
> -        extraflags =3D "--remove-section=3D.comment --remove-section=3D.=
note"
> +        extraflags +=3D "--remove-section=3D.comment --remove-section=3D=
.note"
>
>      stripcmd =3D "'%s' %s '%s'" % (strip, extraflags, file)
>      bb.debug(1, "runstrip: %s" % stripcmd)
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Cheers,
Ulf

