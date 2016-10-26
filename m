Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 52C19719CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 13:16:30 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 6so202614uat.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 06:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=loFwRSCjZUwsYBMP+xbbS7A+LcX29PmasIdM7rAHAvg=;
	b=L4R2Uuv8N+lMzDcsHyWjQFaNTyKkp1XlGVrkLxQkWZXWeODoverETOIC2euxAThf0v
	StJkpY0tb3vyortZOHgzLb4I+zLaMf12UEDEC8nu6ta1Jn7HTxr8vC9MPvzSJd8+LdQw
	tReNuQoa0lbRx0gvUjuSt8Dfj5yF0e6pKX7Unu75ISnLNTXdVG2b08JajdXuHypG4vlz
	tB/Yf2ntnaSeZdrfM2MHOMnXHODpw6N/u7qQUZjWAgqSm/g4Uq3g1y5SC7U2Cg0ry7BD
	rC42aQvx1VlkL9KBnQt/irJLSwGoq7oRgZFQPqFkZ6E3TFgZ8jAki3Rz336qzjXI3tVP
	mWdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=loFwRSCjZUwsYBMP+xbbS7A+LcX29PmasIdM7rAHAvg=;
	b=RvITRKXIFhP50FGBNDtAFra+q4nJeMSy3TvK9QttSPaEjZ8jWwV5P2P5pFUtRprxQY
	jGMM1z7YPtm8gwyqn+Ub0GYIyEMUUmkIIN48oUA0PGwg6psl1/psSy8VgJW35TVlZDfN
	aCSAD6gKZfrDZpDB+/7dTb+xm1SlBpcmt8WBtzsPRwLCVQ7pXWZjlg3mTaI6tRuIYRh8
	zq622Z3U8025vS3WKK8wh3WRZIpBNtZqG1IWpwDSgXese52I4B+OfgvU4iPtk75Zf5fC
	pi5MqZpLCfPtS1mEuqEIaxyp95XBErvdSOhLFrkEkUioeD/5iJ/+YfNwPQdCOoXkkrPO
	8sLA==
X-Gm-Message-State: ABUngvfouxBY6yKKRV2K0CM1pxYcI8WfgK+ewVKQan7IcAQ5FP8+E9KXIBUG2fz+iwXhyxL2LDpEbrHzZFJ4Gg==
X-Received: by 10.176.3.203 with SMTP id 69mr900821uau.91.1477487791371; Wed,
	26 Oct 2016 06:16:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.153.194 with HTTP; Wed, 26 Oct 2016 06:16:30 -0700 (PDT)
In-Reply-To: <1477464673-6184-1-git-send-email-michael.blaettler@siemens.com>
References: <1477464673-6184-1-git-send-email-michael.blaettler@siemens.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Wed, 26 Oct 2016 15:16:30 +0200
Message-ID: <CAFkk2KQ8ErNVTZ22TyLQLK6aJ64y95=snp_8Fspu6qf+AWjRjA@mail.gmail.com>
To: =?UTF-8?Q?Michael_Bl=C3=A4ttler?= <michael.blaettler@siemens.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] package.py: New EXTRA_STRIPFLAGS variable
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
X-List-Received-Date: Wed, 26 Oct 2016 13:16:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Oct 26, 2016 at 8:51 AM, Michael Bl=C3=A4ttler
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
>  meta/lib/oe/package.py       | 12 +++++-------
>  2 files changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index a6f0a7a..7e1c5c3 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1055,14 +1055,15 @@ python split_and_strip_files () {
>      # Now lets go back over things and strip them
>      #
>      if (d.getVar('INHIBIT_PACKAGE_STRIP', True) !=3D '1'):
> +        extraflags =3D d.getVar('EXTRA_STRIPFLAGS', True) or ''
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
> index 02642f2..ab5f616 100644
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
> @@ -18,17 +18,15 @@ def runstrip(arg):
>          newmode =3D origmode | stat.S_IWRITE | stat.S_IREAD
>          os.chmod(file, newmode)
>
> -    extraflags =3D ""
> -
> -    # kernel module
> +    # kernel module
>      if elftype & 16:
> -        extraflags =3D "--strip-debug --remove-section=3D.comment --remo=
ve-section=3D.note --preserve-dates"
> +        extraflags +=3D " --strip-debug --remove-section=3D.comment --re=
move-section=3D.note --preserve-dates"
>      # .so and shared library
>      elif ".so" in file and elftype & 8:
> -        extraflags =3D "--remove-section=3D.comment --remove-section=3D.=
note --strip-unneeded"
> +        extraflags +=3D " --remove-section=3D.comment --remove-section=
=3D.note --strip-unneeded"
>      # shared or executable:
>      elif elftype & 8 or elftype & 4:
> -        extraflags =3D "--remove-section=3D.comment --remove-section=3D.=
note"
> +        extraflags +=3D " --remove-section=3D.comment --remove-section=
=3D.note"

Another approach would be to use STRIPFLAGS and
STRIPFLAGS_EXTRA_{MODULE,SO,EXE} variables with default values in
metadata. Not sure if that's overengineering things for little benefit
though.

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

Looks fine to me codewise now, though I haven't tested it.

Cheers,
Ulf

