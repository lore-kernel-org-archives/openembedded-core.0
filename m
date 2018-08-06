Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id B96B678AB6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 17:27:41 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c15-v6so14773536qtp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 10:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=udxIDBIhc6rICSQGDbcjHcixB7km7UrzN2/vMckPmwI=;
	b=opAJiS8fDzD059phLSgd1CwjUasKxpt+kIwA6i7rdA7f6KZUnRW65fe1+pJ+rxSdWl
	yJTd2pIElsKQUePVNWbvaEPttX8PNyHIfbOKMJRszmZ2Aurg4+t++Y88cbbi6oyF25a4
	0IkHIzNhyVdQijzHcdqePsyWX+9vEB39r7i39vRUoo/psAYhjOGTD2pyda0gZcQXR4fP
	NYSvSsCAuengKTmfld8f/uGpUzUM48Jd/ks/IEXWkxUV74STFCOjpEV9YSwB6Mo/C33i
	DP7TWDxCArQZRXoJmVuKNkr6XDf91AYTBB6U98eV9HEFDrQvK5hVmYKM/t3b5eA7IhSX
	HF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=udxIDBIhc6rICSQGDbcjHcixB7km7UrzN2/vMckPmwI=;
	b=IGz6begYZ10WR3FeOgLKj8htdDf3vHH8S06/05/v01pSsBFy1KI9htQSQvTAen3r4x
	Mv4MCoXQYvKaT5R2DVzxWlX+XWhyCIotE5Np+aga0SBW/dtXB8SyWQSAydiDNsZGplPD
	zrJ6fgoH/MTxHgSqkyYRGNHXhCNT4uOh9Oz9NTp2ayT1kAcX78+anONsWXw2Z40l1plg
	VlMIxlT11faaMAqbFF77mvSKl96ADwk13fmRY6BTAij/v4UThEtpBM8VuYEhgo9ncmo7
	eQx4AbUOksaAeyvAnQklgwVuSB+ACuH4mq7omI6ChfTQFS6i0HGnfG6iolbOgxIHHf3c
	Sfyg==
X-Gm-Message-State: AOUpUlEGdnudJDotPjYZr6Yr3PYPlbluwU7J+RRLIiquH5j3Izgh4bqd
	7WZsdG6+IG6lVvgvjgNde2MwM1zEVXGidBKPQ3U=
X-Google-Smtp-Source: AAOMgpf+qX4qhMAq+A8ksKeA2Kc/Sf/rwYZ2+cBM6ZfdoPFxXQVPxjRdah/HaxSBt8oPLRDe19FgOnYSCAu4xcJTb6E=
X-Received: by 2002:ac8:2ad8:: with SMTP id
	c24-v6mr15388594qta.117.1533576462435; 
	Mon, 06 Aug 2018 10:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1533565758-2467-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Aug 2018 10:27:15 -0700
Message-ID: <CAMKF1srBfOXE5S=m_e2m7ce4NVWmFphiChkpW2fnAtc-zaG0+Q@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [SUMO][PATCH 01/12] binutils: Security fix CVE-2018-8945
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
X-List-Received-Date: Mon, 06 Aug 2018 17:27:42 -0000
Content-Type: text/plain; charset="UTF-8"

this series is ok. Although a single patch would be ok as well.
On Mon, Aug 6, 2018 at 7:29 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> From: Armin Kuster <akuster@mvista.com>
>
> Affects <= 2.30
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/recipes-devtools/binutils/binutils-2.30.inc   |  1 +
>  .../binutils/binutils/CVE-2018-8945.patch          | 70 ++++++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2018-8945.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.30.inc b/meta/recipes-devtools/binutils/binutils-2.30.inc
> index 9c883ac..349fa5a 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.30.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.30.inc
> @@ -35,6 +35,7 @@ SRC_URI = "\
>       file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
>       file://0014-Detect-64-bit-MIPS-targets.patch \
>       file://0015-sync-with-OE-libtool-changes.patch \
> +     file://CVE-2018-8945.patch \
>  "
>  S  = "${WORKDIR}/git"
>
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2018-8945.patch b/meta/recipes-devtools/binutils/binutils/CVE-2018-8945.patch
> new file mode 100644
> index 0000000..6a43168
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2018-8945.patch
> @@ -0,0 +1,70 @@
> +From 95a6d23566165208853a68d9cd3c6eedca840ec6 Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Tue, 8 May 2018 12:51:06 +0100
> +Subject: [PATCH] Prevent a memory exhaustion failure when running objdump on a
> + fuzzed input file with corrupt string and attribute sections.
> +
> +       PR 22809
> +       * elf.c (bfd_elf_get_str_section): Check for an excessively large
> +       string section.
> +       * elf-attrs.c (_bfd_elf_parse_attributes): Issue an error if the
> +       attribute section is larger than the size of the file.
> +
> +Upsteram-Status: Backport
> +Affects: Binutils <= 2.30
> +CVE: CVE-2018-8945
> +Signed-off-by: Armin kuster <akuster@mvista.com>
> +---
> + bfd/ChangeLog   | 8 ++++++++
> + bfd/elf-attrs.c | 9 +++++++++
> + bfd/elf.c       | 1 +
> + 3 files changed, 18 insertions(+)
> +
> +Index: git/bfd/elf-attrs.c
> +===================================================================
> +--- git.orig/bfd/elf-attrs.c
> ++++ git/bfd/elf-attrs.c
> +@@ -438,6 +438,15 @@ _bfd_elf_parse_attributes (bfd *abfd, El
> +   /* PR 17512: file: 2844a11d.  */
> +   if (hdr->sh_size == 0)
> +     return;
> ++  if (hdr->sh_size > bfd_get_file_size (abfd))
> ++    {
> ++      /* xgettext:c-format */
> ++      _bfd_error_handler (_("%pB: error: attribute section '%pA' too big: %#llx"),
> ++                        abfd, hdr->bfd_section, (long long) hdr->sh_size);
> ++      bfd_set_error (bfd_error_invalid_operation);
> ++      return;
> ++    }
> ++
> +   contents = (bfd_byte *) bfd_malloc (hdr->sh_size + 1);
> +   if (!contents)
> +     return;
> +Index: git/bfd/elf.c
> +===================================================================
> +--- git.orig/bfd/elf.c
> ++++ git/bfd/elf.c
> +@@ -298,6 +298,7 @@ bfd_elf_get_str_section (bfd *abfd, unsi
> +       /* Allocate and clear an extra byte at the end, to prevent crashes
> +        in case the string table is not terminated.  */
> +       if (shstrtabsize + 1 <= 1
> ++        || shstrtabsize > bfd_get_file_size (abfd)
> +         || bfd_seek (abfd, offset, SEEK_SET) != 0
> +         || (shstrtab = (bfd_byte *) bfd_alloc (abfd, shstrtabsize + 1)) == NULL)
> +       shstrtab = NULL;
> +Index: git/bfd/ChangeLog
> +===================================================================
> +--- git.orig/bfd/ChangeLog
> ++++ git/bfd/ChangeLog
> +@@ -1,3 +1,11 @@
> ++2018-05-08  Nick Clifton  <nickc@redhat.com>
> ++
> ++       PR 22809
> ++       * elf.c (bfd_elf_get_str_section): Check for an excessively large
> ++       string section.
> ++       * elf-attrs.c (_bfd_elf_parse_attributes): Issue an error if the
> ++       attribute section is larger than the size of the file.
> ++
> + 2018-02-07  Alan Modra  <amodra@gmail.com>
> +
> +       Revert 2018-01-17  Alan Modra  <amodra@gmail.com>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

