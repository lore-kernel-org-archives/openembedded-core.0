Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58DB0C433EF
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 17:25:23 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.14628.1640971522363807889
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Dec 2021 09:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mZPwdTW3;
 spf=pass (domain: gmail.com, ip: 209.85.160.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id p19so24609512qtw.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Dec 2021 09:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H43SErQq/VobCRY5baNiGiBeBZ7KlbLJwv1BgROQirs=;
        b=mZPwdTW39An0wNmOXd+3YOXlLF00ZMMZJYMFz11sVupPsehi+urbZUZ+1SNarxDDrT
         g6XzAL65pnzCZT6BkXlGXsVRIeR2GPVgCquIRw2XpgV07T+/XmaGaOu0f5DihBC6KnZM
         0ZL9jkSN2NKbfni6TzAZxjzgwu3hJ7/sj+Z+p4JL8dZeZtIAj9+2jjSF+H1OWHyxQJH5
         LZtyOmdT+/GCDJBdgtdHFgw+63b49liFI9W5UsjSFhN+HdQGPwdQZlKbXC8FHTKeAUgE
         KGOSUU1qsqoBwr38bJp5uTRS8Y2srrMPUej/eydaEHl7RqJKT3l13TKDde+54WZ/aN5A
         pZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H43SErQq/VobCRY5baNiGiBeBZ7KlbLJwv1BgROQirs=;
        b=DmlPl3Kd8E16GIduNZiGWmVe+GeWCagsfBAzDD7IlbxABVaIf4y2QweGxB47eLkiJF
         90zOMykudjTbrWWpU10KzDJpkDswdjSdzwIb0ITdiw3BfbBmxm/z6pw9V/7W6JZu9Tk0
         0tFwzyzT52KJv3ZpORr6oJMaJZqDw0ccqLSh5ugC7Xg1HJ4tPLJNqiwAmBzmGZ4wKyJY
         VFDeIhX1nAIpZe4/uDa273Laf5JchUcqwU6SIEIjZTOxBUkuOMVaCPZAKWzCkTkRR39h
         j11C8k99nuNZHbyPF46m7+/9TK+kSHJwp+HRQbYnKHq96S8mn0NNCZfcWyqHBE9Az9QP
         cEkA==
X-Gm-Message-State: AOAM530aAuruBLTSbJTsX/4f2sNV7ctIyqh8V7qbco75MyjVAGx/rulO
	PmRoTSyE2X9c1obCm1yvGZZi8ozNC2hPi8vFCmg=
X-Google-Smtp-Source: 
 ABdhPJzOPzUYz2mQZsp2p2CwFEAXcgC+lfGnuwByRMV7uDFgQzFfJ4AXgz6xD7peI8Z+hNivS1q0SUET5k+QCB75l9M=
X-Received: by 2002:ac8:7f4d:: with SMTP id
 g13mr31567517qtk.215.1640971520921;
 Fri, 31 Dec 2021 09:25:20 -0800 (PST)
MIME-Version: 1.0
References: <20211229091347.42742-1-pgowda.cve@gmail.com>
 <157279ea591a9196346145e75d2beaa256713828.camel@intel.com>
In-Reply-To: <157279ea591a9196346145e75d2beaa256713828.camel@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Dec 2021 09:25:09 -0800
Message-ID: 
 <CAMKF1sqN3kmkQ8JB2gskJhO=HVhXq9rCRD_Qh8A6YUTyOKYDqQ@mail.gmail.com>
Subject: Re: [OE-core] [hardknott][PATCH] gcc: Fix CVE-2021-42574
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
	"pgowda.cve@gmail.com" <pgowda.cve@gmail.com>,
 "rwmacleod@gmail.com" <rwmacleod@gmail.com>,
	"umesh.kalappa0@gmail.com" <umesh.kalappa0@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009753d105d47474c3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 17:25:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160090

--0000000000009753d105d47474c3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 30, 2021 at 4:29 PM Anuj Mittal <anuj.mittal@intel.com> wrote:

> I can't apply this.
>
> git am says:
>
> error: cannot convert from Y to UTF-8
> fatal: could not parse patch
>

Key is When git send-email asks for UTF-8 encoding for the patch then do
not enter =E2=80=9Cy=E2=80=9D but just press
Enter


> Thanks,
>
> Anuj
>
> On Wed, 2021-12-29 at 01:13 -0800, pgowda wrote:
> > Upstream-Status: Backport
> > [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D004bb936d6d5f177af=
26ad
> > 4905595e843d5665a5]
> > Upstream-Status: Backport
> > [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3Dbd5e882cf6e0def3dd=
1bc1
> > 06075d59a303fe0d1e]
> > Upstream-Status: Backport
> > [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D51c500269bf53749b1=
0780
> > 7d84271385fad35628]
> > Upstream-Status: Backport
> > [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D1a7f2c0774129750fd=
f73e
> > 9f1b78f0ce983c9ab3]
> > Upstream-Status: Backport
> > [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3Dbef32d4a28595e933f=
24fe
> > f378cf052a30b674a7]
> >
> > Signed-off-by: pgowda <pgowda.cve@gmail.com>
> > ---
> >  meta/recipes-devtools/gcc/gcc-10.2.inc        |    5 +
> >  .../gcc/gcc/0001-CVE-2021-42574.patch         | 2906
> > +++++++++++++++++
> >  .../gcc/gcc/0002-CVE-2021-42574.patch         | 2270 +++++++++++++
> >  .../gcc/gcc/0003-CVE-2021-42574.patch         | 1724 ++++++++++
> >  .../gcc/gcc/0004-CVE-2021-42574.patch         |  138 +
> >  .../gcc/gcc/0005-CVE-2021-42574.patch         |  575 ++++
> >  6 files changed, 7618 insertions(+)
> >  create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-
> > 42574.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-
> > 42574.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-
> > 42574.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-
> > 42574.patch
> >  create mode 100644 meta/recipes-devtools/gcc/gcc/0005-CVE-2021-
> > 42574.patch
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-
> > devtools/gcc/gcc-10.2.inc
> > index 5626bf20f0..fd7f16d7bf 100644
> > --- a/meta/recipes-devtools/gcc/gcc-10.2.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-10.2.inc
> > @@ -74,6 +74,11 @@ SRC_URI =3D "\
> >             file://0002-CVE-2021-35465.patch \
> >             file://0003-CVE-2021-35465.patch \
> >             file://0004-CVE-2021-35465.patch \
> > +           file://0001-CVE-2021-42574.patch \
> > +           file://0002-CVE-2021-42574.patch \
> > +           file://0003-CVE-2021-42574.patch \
> > +           file://0004-CVE-2021-42574.patch \
> > +           file://0005-CVE-2021-42574.patch \
> >  "
> >  SRC_URI[sha256sum] =3D
> > "b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c"
> >
> > diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
> > b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
> > new file mode 100644
> > index 0000000000..e0f4f7d32f
> > --- /dev/null
> > +++ b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch
> > @@ -0,0 +1,2906 @@
> > +From 004bb936d6d5f177af26ad4905595e843d5665a5 Mon Sep 17 00:00:00
> > 2001
> > +From: Lewis Hyatt <lhyatt@gmail.com>
> > +Date: Tue, 14 Jul 2020 12:05:56 -0400
> > +Subject: [PATCH] diagnostics: Support conversion of tabs to spaces
> > [PR49973]
> > + [PR86904]
> > +
> > +Supports conversion of tabs to spaces when outputting diagnostics.
> > Also
> > +adds -fdiagnostics-column-unit and -fdiagnostics-column-origin
> > options to
> > +control how the column number is output, thereby resolving the two
> > PRs.
> > +
> > +gcc/c-family/ChangeLog:
> > +
> > +       PR other/86904
> > +       * c-indentation.c (should_warn_for_misleading_indentation):
> > Get
> > +       global tabstop from the new source.
> > +       * c-opts.c (c_common_handle_option): Remove handling of -
> > ftabstop, which
> > +       is now a common option.
> > +       * c.opt: Likewise.
> > +
> > +gcc/ChangeLog:
> > +
> > +       PR preprocessor/49973
> > +       PR other/86904
> > +       * common.opt: Handle -ftabstop here instead of in c-family
> > +       options.  Add -fdiagnostics-column-unit=3D and
> > +       -fdiagnostics-column-origin=3D options.
> > +       * opts.c (common_handle_option): Handle the new options.
> > +       * diagnostic-format-json.cc (json_from_expanded_location):
> > Add
> > +       diagnostic_context argument.  Use it to convert column
> > numbers as per
> > +       the new options.
> > +       (json_from_location_range): Likewise.
> > +       (json_from_fixit_hint): Likewise.
> > +       (json_end_diagnostic): Pass the new context argument to
> > helper
> > +       functions above.  Add "column-origin" field to the output.
> > +       (test_unknown_location): Add the new context argument to
> > calls to
> > +       helper functions.
> > +       (test_bad_endpoints): Likewise.
> > +       * diagnostic-show-locus.c
> > +       (exploc_with_display_col::exploc_with_display_col): Support
> > +       tabstop parameter.
> > +       (layout_point::layout_point): Make use of class
> > +       exploc_with_display_col.
> > +       (layout_range::layout_range): Likewise.
> > +       (struct line_bounds): Clarify that the units are now always
> > +       display columns.  Rename members accordingly.  Add
> > constructor.
> > +       (layout::print_source_line): Add support for tab expansion.
> > +       (make_range): Adapt to class layout_range changes.
> > +       (layout::maybe_add_location_range): Likewise.
> > +       (layout::layout): Adapt to class exploc_with_display_col
> > changes.
> > +       (layout::calculate_x_offset_display): Support tabstop
> > parameter.
> > +       (layout::print_annotation_line): Adapt to struct line_bounds
> > changes.
> > +       (layout::print_line): Likewise.
> > +       (line_label::line_label): Add diagnostic_context argument.
> > +       (get_affected_range): Likewise.
> > +       (get_printed_columns): Likewise.
> > +       (layout::print_any_labels): Adapt to struct line_label
> > changes.
> > +       (class correction): Add m_tabstop member.
> > +       (correction::correction): Add tabstop argument.
> > +       (correction::compute_display_cols): Use m_tabstop.
> > +       (class line_corrections): Add m_context member.
> > +       (line_corrections::line_corrections): Add diagnostic_context
> > argument.
> > +       (line_corrections::add_hint): Use m_context to handle
> > tabstops.
> > +       (layout::print_trailing_fixits): Adapt to class
> > line_corrections
> > +       changes.
> > +       (test_layout_x_offset_display_utf8): Support tabstop
> > parameter.
> > +       (test_layout_x_offset_display_tab): New selftest.
> > +       (test_one_liner_colorized_utf8): Likewise.
> > +       (test_tab_expansion): Likewise.
> > +       (test_diagnostic_show_locus_one_liner_utf8): Call the new
> > tests.
> > +       (diagnostic_show_locus_c_tests): Likewise.
> > +       (test_overlapped_fixit_printing): Adapt to helper class and
> > +       function changes.
> > +       (test_overlapped_fixit_printing_utf8): Likewise.
> > +       (test_overlapped_fixit_printing_2): Likewise.
> > +       * diagnostic.h (enum diagnostics_column_unit): New enum.
> > +       (struct diagnostic_context): Add members for the new options.
> > +       (diagnostic_converted_column): Declare.
> > +       (json_from_expanded_location): Add new context argument.
> > +       * diagnostic.c (diagnostic_initialize): Initialize new
> > members.
> > +       (diagnostic_converted_column): New function.
> > +       (maybe_line_and_column): Be willing to output a column of 0.
> > +       (diagnostic_get_location_text): Convert column number as per
> > the new
> > +       options.
> > +       (diagnostic_report_current_module): Likewise.
> > +       (assert_location_text): Add origin and column_unit arguments
> > for
> > +       testing the new functionality.
> > +       (test_diagnostic_get_location_text): Test the new
> > functionality.
> > +       * doc/invoke.texi: Document the new options and behavior.
> > +       * input.h (location_compute_display_column): Add tabstop
> > argument.
> > +       * input.c (location_compute_display_column): Likewise.
> > +       (test_cpp_utf8): Add selftests for tab expansion.
> > +       * tree-diagnostic-path.cc (default_tree_make_json_for_path):
> > Pass the
> > +       new context argument to json_from_expanded_location().
> > +
> > +libcpp/ChangeLog:
> > +
> > +       PR preprocessor/49973
> > +       PR other/86904
> > +       * include/cpplib.h (struct cpp_options):  Removed support for
> > -ftabstop,
> > +       which is now handled by diagnostic_context.
> > +       (class cpp_display_width_computation): New class.
> > +       (cpp_byte_column_to_display_column): Add optional tabstop
> > argument.
> > +       (cpp_display_width): Likewise.
> > +       (cpp_display_column_to_byte_column): Likewise.
> > +       * charset.c
> > +       (cpp_display_width_computation::cpp_display_width_computation
> > ): New
> > +       function.
> > +       (cpp_display_width_computation::advance_display_cols):
> > Likewise.
> > +       (compute_next_display_width): Removed and implemented this
> > +       functionality in a new function...
> > +       (cpp_display_width_computation::process_next_codepoint):
> > ...here.
> > +       (cpp_byte_column_to_display_column): Added tabstop argument.
> > +       Reimplemented in terms of class
> > cpp_display_width_computation.
> > +       (cpp_display_column_to_byte_column): Likewise.
> > +       * init.c (cpp_create_reader): Remove handling of -ftabstop,
> > which is now
> > +       handled by diagnostic_context.
> > +
> > +gcc/testsuite/ChangeLog:
> > +
> > +       PR preprocessor/49973
> > +       PR other/86904
> > +       * c-c++-common/Wmisleading-indentation-3.c: Adjust expected
> > output
> > +       for new defaults.
> > +       * c-c++-common/Wmisleading-indentation.c: Likewise.
> > +       * c-c++-common/diagnostic-format-json-1.c: Likewise.
> > +       * c-c++-common/diagnostic-format-json-2.c: Likewise.
> > +       * c-c++-common/diagnostic-format-json-3.c: Likewise.
> > +       * c-c++-common/diagnostic-format-json-4.c: Likewise.
> > +       * c-c++-common/diagnostic-format-json-5.c: Likewise.
> > +       * c-c++-common/missing-close-symbol.c: Likewise.
> > +       * g++.dg/diagnostic/bad-binary-ops.C: Likewise.
> > +       * g++.dg/parse/error4.C: Likewise.
> > +       * g++.old-deja/g++.brendan/crash11.C: Likewise.
> > +       * g++.old-deja/g++.pt/overload2.C: Likewise.
> > +       * g++.old-deja/g++.robertl/eb109.C: Likewise.
> > +       * gcc.dg/analyzer/malloc-paths-9.c: Likewise.
> > +       * gcc.dg/bad-binary-ops.c: Likewise.
> > +       * gcc.dg/format/branch-1.c: Likewise.
> > +       * gcc.dg/format/pr79210.c: Likewise.
> > +       * gcc.dg/plugin/diagnostic-test-expressions-1.c: Likewise.
> > +       * gcc.dg/plugin/diagnostic-test-string-literals-1.c:
> > Likewise.
> > +       * gcc.dg/redecl-4.c: Likewise.
> > +       * gfortran.dg/diagnostic-format-json-1.F90: Likewise.
> > +       * gfortran.dg/diagnostic-format-json-2.F90: Likewise.
> > +       * gfortran.dg/diagnostic-format-json-3.F90: Likewise.
> > +       * go.dg/arrayclear.go: Add a comment explaining why adding a
> > +       comment was necessary to work around a dejagnu bug.
> > +       * c-c++-common/diagnostic-units-1.c: New test.
> > +       * c-c++-common/diagnostic-units-2.c: New test.
> > +       * c-c++-common/diagnostic-units-3.c: New test.
> > +       * c-c++-common/diagnostic-units-4.c: New test.
> > +       * c-c++-common/diagnostic-units-5.c: New test.
> > +       * c-c++-common/diagnostic-units-6.c: New test.
> > +       * c-c++-common/diagnostic-units-7.c: New test.
> > +       * c-c++-common/diagnostic-units-8.c: New test.
> > +
> > +CVE: CVE-2021-42574
> > +Upstream-Status: Backport
> > [https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D004bb936d6d5f177af=
26ad
> > 4905595e843d5665a5]
> > +Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> > +---
> > + gcc/c-family/c-indentation.c                  |   5 +-
> > + gcc/c-family/c-opts.c                         |   6 -
> > + gcc/c-family/c.opt                            |   4 -
> > + gcc/common.opt                                |  21 +
> > + gcc/diagnostic-format-json.cc                 |  55 +-
> > + gcc/diagnostic-show-locus.c                   | 504 +++++++++++++--
> > ---
> > + gcc/diagnostic.c                              | 113 +++-
> > + gcc/diagnostic.h                              |  28 +-
> > + gcc/doc/invoke.texi                           |  68 ++-
> > + gcc/input.c                                   |  72 ++-
> > + gcc/input.h                                   |   4 +-
> > + gcc/opts.c                                    |  14 +
> > + .../c-c++-common/Wmisleading-indentation-3.c  |  12 +-
> > + .../c-c++-common/Wmisleading-indentation.c    |   6 +-
> > + .../c-c++-common/diagnostic-format-json-1.c   |   5 +
> > + .../c-c++-common/diagnostic-format-json-2.c   |   5 +
> > + .../c-c++-common/diagnostic-format-json-3.c   |   5 +
> > + .../c-c++-common/diagnostic-format-json-4.c   |   9 +
> > + .../c-c++-common/diagnostic-format-json-5.c   |   9 +
> > + .../c-c++-common/diagnostic-units-1.c         |  28 +
> > + .../c-c++-common/diagnostic-units-2.c         |  28 +
> > + .../c-c++-common/diagnostic-units-3.c         |  28 +
> > + .../c-c++-common/diagnostic-units-4.c         |  28 +
> > + .../c-c++-common/diagnostic-units-5.c         |  28 +
> > + .../c-c++-common/diagnostic-units-6.c         |  28 +
> > + .../c-c++-common/diagnostic-units-7.c         |  28 +
> > + .../c-c++-common/diagnostic-units-8.c         |  28 +
> > + .../c-c++-common/missing-close-symbol.c       |   6 +-
> > + .../g++.dg/diagnostic/bad-binary-ops.C        |   8 +-
> > + gcc/testsuite/g++.dg/parse/error4.C           |   2 +-
> > + .../g++.old-deja/g++.brendan/crash11.C        |   4 +-
> > + gcc/testsuite/g++.old-deja/g++.pt/overload2.C |   2 +-
> > + .../g++.old-deja/g++.robertl/eb109.C          |   4 +-
> > + .../gcc.dg/analyzer/malloc-paths-9.c          |   2 +-
> > + gcc/testsuite/gcc.dg/bad-binary-ops.c         |   8 +-
> > + gcc/testsuite/gcc.dg/format/branch-1.c        |   2 +-
> > + gcc/testsuite/gcc.dg/format/pr79210.c         |   2 +-
> > + .../plugin/diagnostic-test-expressions-1.c    |  16 +-
> > + .../diagnostic-test-string-literals-1.c       |   4 +-
> > + gcc/testsuite/gcc.dg/redecl-4.c               |   2 +-
> > + .../gfortran.dg/diagnostic-format-json-1.F90  |   5 +
> > + .../gfortran.dg/diagnostic-format-json-2.F90  |   5 +
> > + .../gfortran.dg/diagnostic-format-json-3.F90  |   5 +
> > + gcc/testsuite/go.dg/arrayclear.go             |   3 +
> > + gcc/tree-diagnostic-path.cc                   |   5 +-
> > + libcpp/charset.c                              |  98 ++--
> > + libcpp/include/cpplib.h                       |  40 +-
> > + libcpp/init.c                                 |   1 -
> > + 48 files changed, 1106 insertions(+), 287 deletions(-)
> > + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-1.c
> > + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-2.c
> > + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-3.c
> > + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-4.c
> > + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-5.c
> > + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-6.c
> > + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-7.c
> > + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-8.c
> > +
> > +diff --git a/gcc/c-family/c-indentation.c b/gcc/c-family/c-
> > indentation.c
> > +--- a/gcc/c-family/c-indentation.c     2020-07-22 23:35:17.296384022
> > -0700
> > ++++ b/gcc/c-family/c-indentation.c     2021-12-25 01:20:53.475636694
> > -0800
> > +@@ -24,8 +24,7 @@ along with GCC; see the file COPYING3.
> > + #include "c-common.h"
> > + #include "c-indentation.h"
> > + #include "selftest.h"
> > +-
> > +-extern cpp_options *cpp_opts;
> > ++#include "diagnostic.h"
> > +
> > + /* Round up VIS_COLUMN to nearest tab stop. */
> > +
> > +@@ -294,7 +293,7 @@ should_warn_for_misleading_indentation (
> > +   expanded_location next_stmt_exploc =3D expand_location
> > (next_stmt_loc);
> > +   expanded_location guard_exploc =3D expand_location (guard_loc);
> > +
> > +-  const unsigned int tab_width =3D cpp_opts->tabstop;
> > ++  const unsigned int tab_width =3D global_dc->tabstop;
> > +
> > +   /* They must be in the same file.  */
> > +   if (next_stmt_exploc.file !=3D body_exploc.file)
> > +diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt
> > +--- a/gcc/c-family/c.opt       2021-12-24 20:23:42.816809230 -0800
> > ++++ b/gcc/c-family/c.opt       2021-12-25 01:20:53.475636694 -0800
> > +@@ -1876,10 +1876,6 @@ Enum(strong_eval_order) String(some) Val
> > + EnumValue
> > + Enum(strong_eval_order) String(all) Value(2)
> > +
> > +-ftabstop=3D
> > +-C ObjC C++ ObjC++ Joined RejectNegative UInteger
> > +--ftabstop=3D<number>    Distance between tab stops for column
> > reporting.
> > +-
> > + ftemplate-backtrace-limit=3D
> > + C++ ObjC++ Joined RejectNegative UInteger
> > Var(template_backtrace_limit) Init(10)
> > + Set the maximum number of template instantiation notes for a single
> > warning or error.
> > +diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
> > +--- a/gcc/c-family/c-opts.c    2021-12-24 20:23:44.824774786 -0800
> > ++++ b/gcc/c-family/c-opts.c    2021-12-25 01:20:53.475636694 -0800
> > +@@ -504,12 +504,6 @@ c_common_handle_option (size_t scode, co
> > +       cpp_opts->track_macro_expansion =3D 2;
> > +       break;
> > +
> > +-    case OPT_ftabstop_:
> > +-      /* It is documented that we silently ignore silly values.  */
> > +-      if (value >=3D 1 && value <=3D 100)
> > +-      cpp_opts->tabstop =3D value;
> > +-      break;
> > +-
> > +     case OPT_fexec_charset_:
> > +       cpp_opts->narrow_charset =3D arg;
> > +       break;
> > +diff --git a/gcc/common.opt b/gcc/common.opt
> > +--- a/gcc/common.opt   2021-12-24 20:23:42.480814993 -0800
> > ++++ b/gcc/common.opt   2021-12-25 01:20:53.475636694 -0800
> > +@@ -1325,6 +1325,14 @@ Enum(diagnostic_url_rule) String(always)
> > + EnumValue
> > + Enum(diagnostic_url_rule) String(auto) Value(DIAGNOSTICS_URL_AUTO)
> > +
> > ++fdiagnostics-column-unit=3D
> > ++Common Joined RejectNegative Enum(diagnostics_column_unit)
> > ++-fdiagnostics-column-unit=3D[display|byte]      Select whether column
> > numbers are output as display columns (default) or raw bytes.
> > ++
> > ++fdiagnostics-column-origin=3D
> > ++Common Joined RejectNegative UInteger
> > ++-fdiagnostics-column-origin=3D<number>  Set the number of the first
> > column.  The default is 1-based as per GNU style, but some utilities
> > may expect 0-based, for example.
> > ++
> > + fdiagnostics-format=3D
> > + Common Joined RejectNegative Enum(diagnostics_output_format)
> > + -fdiagnostics-format=3D[text|json]      Select output format.
> > +@@ -1334,6 +1342,15 @@ SourceInclude
> > + diagnostic.h
> > +
> > + Enum
> > ++Name(diagnostics_column_unit) Type(int)
> > ++
> > ++EnumValue
> > ++Enum(diagnostics_column_unit) String(display)
> > Value(DIAGNOSTICS_COLUMN_UNIT_DISPLAY)
> > ++
> > ++EnumValue
> > ++Enum(diagnostics_column_unit) String(byte)
> > Value(DIAGNOSTICS_COLUMN_UNIT_BYTE)
> > ++
> > ++Enum
> > + Name(diagnostics_output_format) Type(int)
> > +
> > + EnumValue
> > +@@ -1362,6 +1379,10 @@ fdiagnostics-path-format=3D
> > + Common Joined RejectNegative Var(flag_diagnostics_path_format)
> > Enum(diagnostic_path_format) Init(DPF_INLINE_EVENTS)
> > + Specify how to print any control-flow path associated with a
> > diagnostic.
> > +
> > ++ftabstop=3D
> > ++Common Joined RejectNegative UInteger
> > ++-ftabstop=3D<number>      Distance between tab stops for column
> > reporting.
> > ++
> > + Enum
> > + Name(diagnostic_path_format) Type(int)
> > +
> > +diff --git a/gcc/diagnostic.c b/gcc/diagnostic.c
> > +--- a/gcc/diagnostic.c 2020-07-22 23:35:17.556386887 -0700
> > ++++ b/gcc/diagnostic.c 2021-12-25 01:23:41.300841207 -0800
> > +@@ -38,6 +38,7 @@ along with GCC; see the file COPYING3.
> > + #include "selftest.h"
> > + #include "selftest-diagnostic.h"
> > + #include "opts.h"
> > ++#include "cpplib.h"
> > +
> > + #ifdef HAVE_TERMIOS_H
> > + # include <termios.h>
> > +@@ -219,6 +220,9 @@ diagnostic_initialize (diagnostic_contex
> > +   context->min_margin_width =3D 0;
> > +   context->show_ruler_p =3D false;
> > +   context->parseable_fixits_p =3D false;
> > ++  context->column_unit =3D DIAGNOSTICS_COLUMN_UNIT_DISPLAY;
> > ++  context->column_origin =3D 1;
> > ++  context->tabstop =3D 8;
> > +   context->edit_context_ptr =3D NULL;
> > +   context->diagnostic_group_nesting_depth =3D 0;
> > +   context->diagnostic_group_emission_count =3D 0;
> > +@@ -353,8 +357,51 @@ diagnostic_get_color_for_kind (diagnosti
> > +   return diagnostic_kind_color[kind];
> > + }
> > +
> > ++/* Given an expanded_location, convert the column (which is in 1-
> > based bytes)
> > ++   to the requested units, without converting the origin.
> > ++   Return -1 if the column is invalid (<=3D 0).  */
> > ++
> > ++static int
> > ++convert_column_unit (enum diagnostics_column_unit column_unit,
> > ++                   int tabstop,
> > ++                   expanded_location s)
> > ++{
> > ++  if (s.column <=3D 0)
> > ++    return -1;
> > ++
> > ++  switch (column_unit)
> > ++    {
> > ++    default:
> > ++      gcc_unreachable ();
> > ++
> > ++    case DIAGNOSTICS_COLUMN_UNIT_DISPLAY:
> > ++      {
> > ++      cpp_char_column_policy policy (tabstop, cpp_wcwidth);
> > ++      return location_compute_display_column (s, policy);
> > ++      }
> > ++
> > ++    case DIAGNOSTICS_COLUMN_UNIT_BYTE:
> > ++      return s.column;
> > ++    }
> > ++}
> > ++
> > ++/* Given an expanded_location, convert the column (which is in 1-
> > based bytes)
> > ++   to the requested units and origin.  Return -1 if the column is
> > ++   invalid (<=3D 0).  */
> > ++int
> > ++diagnostic_converted_column (diagnostic_context *context,
> > expanded_location s)
> > ++{
> > ++  int one_based_col
> > ++    =3D convert_column_unit (context->column_unit, context->tabstop,
> > s);
> > ++  if (one_based_col <=3D 0)
> > ++    return -1;
> > ++  return one_based_col + (context->column_origin - 1);
> > ++}
> > ++
> > + /* Return a formatted line and column ':%line:%column'.  Elided if
> > +-   zero.  The result is a statically allocated buffer.  */
> > ++   line =3D=3D 0 or col < 0.  (A column of 0 may be valid due to the
> > ++   -fdiagnostics-column-origin option.)
> > ++   The result is a statically allocated buffer.  */
> > +
> > + static const char *
> > + maybe_line_and_column (int line, int col)
> > +@@ -363,8 +410,9 @@ maybe_line_and_column (int line, int col
> > +
> > +   if (line)
> > +     {
> > +-      size_t l =3D snprintf (result, sizeof (result),
> > +-                         col ? ":%d:%d" : ":%d", line, col);
> > ++      size_t l
> > ++      =3D snprintf (result, sizeof (result),
> > ++                  col >=3D 0 ? ":%d:%d" : ":%d", line, col);
> > +       gcc_checking_assert (l < sizeof (result));
> > +     }
> > +   else
> > +@@ -383,8 +431,14 @@ diagnostic_get_location_text (diagnostic
> > +   const char *locus_cs =3D colorize_start (pp_show_color (pp),
> > "locus");
> > +   const char *locus_ce =3D colorize_stop (pp_show_color (pp));
> > +   const char *file =3D s.file ? s.file : progname;
> > +-  int line =3D strcmp (file, N_("<built-in>")) ? s.line : 0;
> > +-  int col =3D context->show_column ? s.column : 0;
> > ++  int line =3D 0;
> > ++  int col =3D -1;
> > ++  if (strcmp (file, N_("<built-in>")))
> > ++    {
> > ++      line =3D s.line;
> > ++      if (context->show_column)
> > ++      col =3D diagnostic_converted_column (context, s);
> > ++    }
> > +
> > +   const char *line_col =3D maybe_line_and_column (line, col);
> > +   return build_message_string ("%s%s%s:%s", locus_cs, file,
> > +@@ -650,14 +704,20 @@ diagnostic_report_current_module (diagno
> > +       if (! MAIN_FILE_P (map))
> > +       {
> > +         bool first =3D true;
> > ++        expanded_location s =3D {};
> > +         do
> > +           {
> > +             where =3D linemap_included_from (map);
> > +             map =3D linemap_included_from_linemap (line_table, map);
> > +-            const char *line_col
> > +-              =3D maybe_line_and_column (SOURCE_LINE (map, where),
> > +-                                       first && context-
> > >show_column
> > +-                                       ? SOURCE_COLUMN (map, where)
> > : 0);
> > ++            s.file =3D LINEMAP_FILE (map);
> > ++            s.line =3D SOURCE_LINE (map, where);
> > ++            int col =3D -1;
> > ++            if (first && context->show_column)
> > ++              {
> > ++                s.column =3D SOURCE_COLUMN (map, where);
> > ++                col =3D diagnostic_converted_column (context, s);
> > ++              }
> > ++            const char *line_col =3D maybe_line_and_column (s.line,
> > col);
> > +             static const char *const msgs[] =3D
> > +               {
> > +                N_("In file included from"),
> > +@@ -666,7 +726,7 @@ diagnostic_report_current_module (diagno
> > +             unsigned index =3D !first;
> > +             pp_verbatim (context->printer, "%s%s %r%s%s%R",
> > +                          first ? "" : ",\n", _(msgs[index]),
> > +-                         "locus", LINEMAP_FILE (map), line_col);
> > ++                         "locus", s.file, line_col);
> > +             first =3D false;
> > +           }
> > +         while (! MAIN_FILE_P (map));
> > +@@ -2042,10 +2102,15 @@ test_print_parseable_fixits_replace ()
> > + static void
> > + assert_location_text (const char *expected_loc_text,
> > +                     const char *filename, int line, int column,
> > +-                    bool show_column)
> > ++                    bool show_column,
> > ++                    int origin =3D 1,
> > ++                    enum diagnostics_column_unit column_unit
> > ++                      =3D DIAGNOSTICS_COLUMN_UNIT_BYTE)
> > + {
> > +   test_diagnostic_context dc;
> > +   dc.show_column =3D show_column;
> > ++  dc.column_unit =3D column_unit;
> > ++  dc.column_origin =3D origin;
> > +
> > +   expanded_location xloc;
> > +   xloc.file =3D filename;
> > +@@ -2069,7 +2134,10 @@ test_diagnostic_get_location_text ()
> > +   assert_location_text ("PROGNAME:", NULL, 0, 0, true);
> > +   assert_location_text ("<built-in>:", "<built-in>", 42, 10, true);
> > +   assert_location_text ("foo.c:42:10:", "foo.c", 42, 10, true);
> > +-  assert_location_text ("foo.c:42:", "foo.c", 42, 0, true);
> > ++  assert_location_text ("foo.c:42:9:", "foo.c", 42, 10, true, 0);
> > ++  assert_location_text ("foo.c:42:1010:", "foo.c", 42, 10, true,
> > 1001);
> > ++  for (int origin =3D 0; origin !=3D 2; ++origin)
> > ++    assert_location_text ("foo.c:42:", "foo.c", 42, 0, true,
> > origin);
> > +   assert_location_text ("foo.c:", "foo.c", 0, 10, true);
> > +   assert_location_text ("foo.c:42:", "foo.c", 42, 10, false);
> > +   assert_location_text ("foo.c:", "foo.c", 0, 10, false);
> > +@@ -2077,6 +2145,41 @@ test_diagnostic_get_location_text ()
> > +   maybe_line_and_column (INT_MAX, INT_MAX);
> > +   maybe_line_and_column (INT_MIN, INT_MIN);
> > +
> > ++  {
> > ++    /* In order to test display columns vs byte columns, we need to
> > create a
> > ++       file for location_get_source_line() to read.  */
> > ++
> > ++    const char *const content =3D "smile \xf0\x9f\x98\x82\n";
> > ++    const int line_bytes =3D strlen (content) - 1;
> > ++    const int def_tabstop =3D 8;
> > ++    const int display_width =3D cpp_display_width (content,
> > line_bytes,
> > ++                                               def_tabstop);
> > ++    ASSERT_EQ (line_bytes - 2, display_width);
> > ++    temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
> > ++    const char *const fname =3D tmp.get_filename ();
> > ++    const int buf_len =3D strlen (fname) + 16;
> > ++    char *const expected =3D XNEWVEC (char, buf_len);
> > ++
> > ++    snprintf (expected, buf_len, "%s:1:%d:", fname, line_bytes);
> > ++    assert_location_text (expected, fname, 1, line_bytes, true,
> > ++                        1, DIAGNOSTICS_COLUMN_UNIT_BYTE);
> > ++
> > ++    snprintf (expected, buf_len, "%s:1:%d:", fname, line_bytes -
> > 1);
> > ++    assert_location_text (expected, fname, 1, line_bytes, true,
> > ++                        0, DIAGNOSTICS_COLUMN_UNIT_BYTE);
> > ++
> > ++    snprintf (expected, buf_len, "%s:1:%d:", fname, display_width);
> > ++    assert_location_text (expected, fname, 1, line_bytes, true,
> > ++                        1, DIAGNOSTICS_COLUMN_UNIT_DISPLAY);
> > ++
> > ++    snprintf (expected, buf_len, "%s:1:%d:", fname, display_width -
> > 1);
> > ++    assert_location_text (expected, fname, 1, line_bytes, true,
> > ++                        0, DIAGNOSTICS_COLUMN_UNIT_DISPLAY);
> > ++
> > ++    XDELETEVEC (expected);
> > ++  }
> > ++
> > ++
> > +   progname =3D old_progname;
> > + }
> > +
> > +diff --git a/gcc/diagnostic-format-json.cc b/gcc/diagnostic-format-
> > json.cc
> > +--- a/gcc/diagnostic-format-json.cc    2020-07-22 23:35:17.556386887
> > -0700
> > ++++ b/gcc/diagnostic-format-json.cc    2021-12-25 01:20:53.475636694
> > -0800
> > +@@ -23,6 +23,7 @@ along with GCC; see the file COPYING3.
> > + #include "system.h"
> > + #include "coretypes.h"
> > + #include "diagnostic.h"
> > ++#include "selftest-diagnostic.h"
> > + #include "diagnostic-metadata.h"
> > + #include "json.h"
> > + #include "selftest.h"
> > +@@ -43,21 +44,43 @@ static json::array *cur_children_array;
> > + /* Generate a JSON object for LOC.  */
> > +
> > + json::value *
> > +-json_from_expanded_location (location_t loc)
> > ++json_from_expanded_location (diagnostic_context *context,
> > location_t loc)
> > + {
> > +   expanded_location exploc =3D expand_location (loc);
> > +   json::object *result =3D new json::object ();
> > +   if (exploc.file)
> > +     result->set ("file", new json::string (exploc.file));
> > +   result->set ("line", new json::integer_number (exploc.line));
> > +-  result->set ("column", new json::integer_number (exploc.column));
> > ++
> > ++  const enum diagnostics_column_unit orig_unit =3D context-
> > >column_unit;
> > ++  struct
> > ++  {
> > ++    const char *name;
> > ++    enum diagnostics_column_unit unit;
> > ++  } column_fields[] =3D {
> > ++    {"display-column", DIAGNOSTICS_COLUMN_UNIT_DISPLAY},
> > ++    {"byte-column", DIAGNOSTICS_COLUMN_UNIT_BYTE}
> > ++  };
> > ++  int the_column =3D INT_MIN;
> > ++  for (int i =3D 0; i !=3D sizeof column_fields / sizeof
> > (*column_fields); ++i)
> > ++    {
> > ++      context->column_unit =3D column_fields[i].unit;
> > ++      const int col =3D diagnostic_converted_column (context,
> > exploc);
> > ++      result->set (column_fields[i].name, new json::integer_number
> > (col));
> > ++      if (column_fields[i].unit =3D=3D orig_unit)
> > ++      the_column =3D col;
> > ++    }
> > ++  gcc_assert (the_column !=3D INT_MIN);
> > ++  result->set ("column", new json::integer_number (the_column));
> > ++  context->column_unit =3D orig_unit;
> > +   return result;
> > + }
> > +
> > + /* Generate a JSON object for LOC_RANGE.  */
> > +
> > + static json::object *
> > +-json_from_location_range (const location_range *loc_range, unsigned
> > range_idx)
> > ++json_from_location_range (diagnostic_context *context,
> > ++                        const location_range *loc_range, unsigned
> > range_idx)
> > + {
> > +   location_t caret_loc =3D get_pure_location (loc_range->m_loc);
> > +
> > +@@ -68,13 +91,13 @@ json_from_location_range (const location
> > +   location_t finish_loc =3D get_finish (loc_range->m_loc);
> > +
> > +   json::object *result =3D new json::object ();
> > +-  result->set ("caret", json_from_expanded_location (caret_loc));
> > ++  result->set ("caret", json_from_expanded_location (context,
> > caret_loc));
> > +   if (start_loc !=3D caret_loc
> > +       && start_loc !=3D UNKNOWN_LOCATION)
> > +-    result->set ("start", json_from_expanded_location (start_loc));
> > ++    result->set ("start", json_from_expanded_location (context,
> > start_loc));
> > +   if (finish_loc !=3D caret_loc
> > +       && finish_loc !=3D UNKNOWN_LOCATION)
> > +-    result->set ("finish", json_from_expanded_location
> > (finish_loc));
> > ++    result->set ("finish", json_from_expanded_location (context,
> > finish_loc));
> > +
> > +   if (loc_range->m_label)
> > +     {
> > +@@ -91,14 +114,14 @@ json_from_location_range (const location
> > + /* Generate a JSON object for HINT.  */
> > +
> > + static json::object *
> > +-json_from_fixit_hint (const fixit_hint *hint)
> > ++json_from_fixit_hint (diagnostic_context *context, const fixit_hint
> > *hint)
> > + {
> > +   json::object *fixit_obj =3D new json::object ();
> > +
> > +   location_t start_loc =3D hint->get_start_loc ();
> > +-  fixit_obj->set ("start", json_from_expanded_location
> > (start_loc));
> > ++  fixit_obj->set ("start", json_from_expanded_location (context,
> > start_loc));
> > +   location_t next_loc =3D hint->get_next_loc ();
> > +-  fixit_obj->set ("next", json_from_expanded_location (next_loc));
> > ++  fixit_obj->set ("next", json_from_expanded_location (context,
> > next_loc));
> > +   fixit_obj->set ("string", new json::string (hint->get_string
> > ()));
> > +
> > +   return fixit_obj;
> > +@@ -190,11 +213,13 @@ json_end_diagnostic (diagnostic_context
> > +   else
> > +     {
> > +       /* Otherwise, make diag_obj be the top-level object within
> > the group;
> > +-       add a "children" array.  */
> > ++       add a "children" array and record the column origin.  */
> > +       toplevel_array->append (diag_obj);
> > +       cur_group =3D diag_obj;
> > +       cur_children_array =3D new json::array ();
> > +       diag_obj->set ("children", cur_children_array);
> > ++      diag_obj->set ("column-origin",
> > ++                   new json::integer_number (context-
> > >column_origin));
> > +     }
> > +
> > +   const rich_location *richloc =3D diagnostic->richloc;
> > +@@ -205,7 +230,7 @@ json_end_diagnostic (diagnostic_context
> > +   for (unsigned int i =3D 0; i < richloc->get_num_locations (); i++)
> > +     {
> > +       const location_range *loc_range =3D richloc->get_range (i);
> > +-      json::object *loc_obj =3D json_from_location_range (loc_range,
> > i);
> > ++      json::object *loc_obj =3D json_from_location_range (context,
> > loc_range, i);
> > +       if (loc_obj)
> > +       loc_array->append (loc_obj);
> > +     }
> > +@@ -217,7 +242,7 @@ json_end_diagnostic (diagnostic_context
> > +       for (unsigned int i =3D 0; i < richloc->get_num_fixit_hints ();
> > i++)
> > +       {
> > +         const fixit_hint *hint =3D richloc->get_fixit_hint (i);
> > +-        json::object *fixit_obj =3D json_from_fixit_hint (hint);
> > ++        json::object *fixit_obj =3D json_from_fixit_hint (context,
> > hint);
> > +         fixit_array->append (fixit_obj);
> > +       }
> > +     }
> > +@@ -320,7 +345,8 @@ namespace selftest {
> > + static void
> > + test_unknown_location ()
> > + {
> > +-  delete json_from_expanded_location (UNKNOWN_LOCATION);
> > ++  test_diagnostic_context dc;
> > ++  delete json_from_expanded_location (&dc, UNKNOWN_LOCATION);
> > + }
> > +
> > + /* Verify that we gracefully handle attempts to serialize bad
> > +@@ -338,7 +364,8 @@ test_bad_endpoints ()
> > +   loc_range.m_range_display_kind =3D SHOW_RANGE_WITH_CARET;
> > +   loc_range.m_label =3D NULL;
> > +
> > +-  json::object *obj =3D json_from_location_range (&loc_range, 0);
> > ++  test_diagnostic_context dc;
> > ++  json::object *obj =3D json_from_location_range (&dc, &loc_range,
> > 0);
> > +   /* We should have a "caret" value, but no "start" or "finish"
> > values.  */
> > +   ASSERT_TRUE (obj !=3D NULL);
> > +   ASSERT_TRUE (obj->get ("caret") !=3D NULL);
> > +diff --git a/gcc/diagnostic.h b/gcc/diagnostic.h
> > +--- a/gcc/diagnostic.h 2020-07-22 23:35:17.556386887 -0700
> > ++++ b/gcc/diagnostic.h 2021-12-25 01:20:53.479636627 -0800
> > +@@ -24,6 +24,20 @@ along with GCC; see the file COPYING3.
> > + #include "pretty-print.h"
> > + #include "diagnostic-core.h"
> > +
> > ++/* An enum for controlling what units to use for the column number
> > ++   when diagnostics are output, used by the -fdiagnostics-column-
> > unit option.
> > ++   Tabs will be expanded or not according to the value of -
> > ftabstop.  The origin
> > ++   (default 1) is controlled by -fdiagnostics-column-origin.  */
> > ++
> > ++enum diagnostics_column_unit
> > ++{
> > ++  /* The default from GCC 11 onwards: display columns.  */
> > ++  DIAGNOSTICS_COLUMN_UNIT_DISPLAY,
> > ++
> > ++  /* The behavior in GCC 10 and earlier: simple bytes.  */
> > ++  DIAGNOSTICS_COLUMN_UNIT_BYTE
> > ++};
> > ++
> > + /* Enum for overriding the standard output format.  */
> > +
> > + enum diagnostics_output_format
> > +@@ -280,6 +294,15 @@ struct diagnostic_context
> > +      rest of the diagnostic.  */
> > +   bool parseable_fixits_p;
> > +
> > ++  /* What units to use when outputting the column number.  */
> > ++  enum diagnostics_column_unit column_unit;
> > ++
> > ++  /* The origin for the column number (1-based or 0-based
> > typically).  */
> > ++  int column_origin;
> > ++
> > ++  /* The size of the tabstop for tab expansion.  */
> > ++  int tabstop;
> > ++
> > +   /* If non-NULL, an edit_context to which fix-it hints should be
> > +      applied, for generating patches.  */
> > +   edit_context *edit_context_ptr;
> > +@@ -458,6 +481,8 @@ diagnostic_same_line (const diagnostic_c
> > + }
> > +
> > + extern const char *diagnostic_get_color_for_kind (diagnostic_t
> > kind);
> > ++extern int diagnostic_converted_column (diagnostic_context
> > *context,
> > ++                                      expanded_location s);
> > +
> > + /* Pure text formatting support functions.  */
> > + extern char *file_name_as_prefix (diagnostic_context *, const char
> > *);
> > +@@ -470,6 +495,7 @@ extern void diagnostic_output_format_ini
> > + /* Compute the number of digits in the decimal representation of an
> > integer.  */
> > + extern int num_digits (int);
> > +
> > +-extern json::value *json_from_expanded_location (location_t loc);
> > ++extern json::value *json_from_expanded_location (diagnostic_context
> > *context,
> > ++                                               location_t loc);
> > +
> > + #endif /* ! GCC_DIAGNOSTIC_H */
> > +diff --git a/gcc/diagnostic-show-locus.c b/gcc/diagnostic-show-
> > locus.c
> > +--- a/gcc/diagnostic-show-locus.c      2020-07-22 23:35:17.556386887
> > -0700
> > ++++ b/gcc/diagnostic-show-locus.c      2021-12-25 01:20:53.479636627
> > -0800
> > +@@ -175,9 +175,10 @@ enum column_unit {
> > + class exploc_with_display_col : public expanded_location
> > + {
> > +  public:
> > +-  exploc_with_display_col (const expanded_location &exploc)
> > ++  exploc_with_display_col (const expanded_location &exploc, int
> > tabstop)
> > +     : expanded_location (exploc),
> > +-      m_display_col (location_compute_display_column (exploc)) {}
> > ++      m_display_col (location_compute_display_column (exploc,
> > tabstop))
> > ++  {}
> > +
> > +   int m_display_col;
> > + };
> > +@@ -189,11 +190,11 @@ class exploc_with_display_col : public e
> > + class layout_point
> > + {
> > +  public:
> > +-  layout_point (const expanded_location &exploc)
> > ++  layout_point (const exploc_with_display_col &exploc)
> > +     : m_line (exploc.line)
> > +   {
> > +     m_columns[CU_BYTES] =3D exploc.column;
> > +-    m_columns[CU_DISPLAY_COLS] =3D location_compute_display_column
> > (exploc);
> > ++    m_columns[CU_DISPLAY_COLS] =3D exploc.m_display_col;
> > +   }
> > +
> > +   linenum_type m_line;
> > +@@ -205,10 +206,10 @@ class layout_point
> > + class layout_range
> > + {
> > +  public:
> > +-  layout_range (const expanded_location *start_exploc,
> > +-              const expanded_location *finish_exploc,
> > ++  layout_range (const exploc_with_display_col &start_exploc,
> > ++              const exploc_with_display_col &finish_exploc,
> > +               enum range_display_kind range_display_kind,
> > +-              const expanded_location *caret_exploc,
> > ++              const exploc_with_display_col &caret_exploc,
> > +               unsigned original_idx,
> > +               const range_label *label);
> > +
> > +@@ -226,22 +227,18 @@ class layout_range
> > +
> > + /* A struct for use by layout::print_source_line for telling
> > +    layout::print_annotation_line the extents of the source line
> > that
> > +-   it printed, so that underlines can be clipped appropriately.  */
> > ++   it printed, so that underlines can be clipped appropriately.
> > Units
> > ++   are 1-based display columns.  */
> > +
> > + struct line_bounds
> > + {
> > +-  int m_first_non_ws;
> > +-  int m_last_non_ws;
> > ++  int m_first_non_ws_disp_col;
> > ++  int m_last_non_ws_disp_col;
> > +
> > +-  void convert_to_display_cols (char_span line)
> > ++  line_bounds ()
> > +   {
> > +-    m_first_non_ws =3D cpp_byte_column_to_display_column
> > (line.get_buffer (),
> > +-                                                      line.length
> > (),
> > +-
> >                                                       m_first_non_ws)
> > ;
> > +-
> > +-    m_last_non_ws =3D cpp_byte_column_to_display_column
> > (line.get_buffer (),
> > +-                                                     line.length
> > (),
> > +-
> > m_last_non_ws);
> > ++    m_first_non_ws_disp_col =3D INT_MAX;
> > ++    m_last_non_ws_disp_col =3D 0;
> > +   }
> > + };
> > +
> > +@@ -351,8 +348,8 @@ class layout
> > +  private:
> > +   bool will_show_line_p (linenum_type row) const;
> > +   void print_leading_fixits (linenum_type row);
> > +-  void print_source_line (linenum_type row, const char *line, int
> > line_bytes,
> > +-                        line_bounds *lbounds_out);
> > ++  line_bounds print_source_line (linenum_type row, const char
> > *line,
> > ++                               int line_bytes);
> > +   bool should_print_annotation_line_p (linenum_type row) const;
> > +   void start_annotation_line (char margin_char =3D ' ') const;
> > +   void print_annotation_line (linenum_type row, const line_bounds
> > lbounds);
> > +@@ -513,16 +510,16 @@ colorizer::get_color_by_name (const char
> > +    Initialize various layout_point fields from expanded_location
> > +    equivalents; we've already filtered on file.  */
> > +
> > +-layout_range::layout_range (const expanded_location *start_exploc,
> > +-                          const expanded_location *finish_exploc,
> > ++layout_range::layout_range (const exploc_with_display_col
> > &start_exploc,
> > ++                          const exploc_with_display_col
> > &finish_exploc,
> > +                           enum range_display_kind
> > range_display_kind,
> > +-                          const expanded_location *caret_exploc,
> > ++                          const exploc_with_display_col
> > &caret_exploc,
> > +                           unsigned original_idx,
> > +                           const range_label *label)
> > +-: m_start (*start_exploc),
> > +-  m_finish (*finish_exploc),
> > ++: m_start (start_exploc),
> > ++  m_finish (finish_exploc),
> > +   m_range_display_kind (range_display_kind),
> > +-  m_caret (*caret_exploc),
> > ++  m_caret (caret_exploc),
> > +   m_original_idx (original_idx),
> > +   m_label (label)
> > + {
> > +@@ -646,6 +643,9 @@ layout_range::intersects_line_p (linenum
> > +
> > + #if CHECKING_P
> > +
> > ++/* Default for when we don't care what the tab expansion is set
> > to.  */
> > ++static const int def_tabstop =3D 8;
> > ++
> > + /* Create some expanded locations for testing layout_range.  The
> > filename
> > +    member of the explocs is set to the empty string.  This member
> > will only be
> > +    inspected by the calls to location_compute_display_column() made
> > from the
> > +@@ -662,8 +662,11 @@ make_range (int start_line, int start_co
> > +     =3D {"", start_line, start_col, NULL, false};
> > +   const expanded_location finish_exploc
> > +     =3D {"", end_line, end_col, NULL, false};
> > +-  return layout_range (&start_exploc, &finish_exploc,
> > SHOW_RANGE_WITHOUT_CARET,
> > +-                     &start_exploc, 0, NULL);
> > ++  return layout_range (exploc_with_display_col (start_exploc,
> > def_tabstop),
> > ++                     exploc_with_display_col (finish_exploc,
> > def_tabstop),
> > ++                     SHOW_RANGE_WITHOUT_CARET,
> > ++                     exploc_with_display_col (start_exploc,
> > def_tabstop),
> > ++                     0, NULL);
> > + }
> > +
> > + /* Selftests for layout_range::contains_point and
> > +@@ -964,7 +967,7 @@ layout::layout (diagnostic_context * con
> > + : m_context (context),
> > +   m_pp (context->printer),
> > +   m_primary_loc (richloc->get_range (0)->m_loc),
> > +-  m_exploc (richloc->get_expanded_location (0)),
> > ++  m_exploc (richloc->get_expanded_location (0), context->tabstop),
> > +   m_colorizer (context, diagnostic_kind),
> > +   m_colorize_source_p (context->colorize_source_p),
> > +   m_show_labels_p (context->show_labels_p),
> > +@@ -1060,7 +1063,10 @@ layout::maybe_add_location_range (const
> > +
> > +   /* Everything is now known to be in the correct source file,
> > +      but it may require further sanitization.  */
> > +-  layout_range ri (&start, &finish, loc_range-
> > >m_range_display_kind, &caret,
> > ++  layout_range ri (exploc_with_display_col (start, m_context-
> > >tabstop),
> > ++                 exploc_with_display_col (finish, m_context-
> > >tabstop),
> > ++                 loc_range->m_range_display_kind,
> > ++                 exploc_with_display_col (caret, m_context-
> > >tabstop),
> > +                  original_idx, loc_range->m_label);
> > +
> > +   /* If we have a range that finishes before it starts (perhaps
> > +@@ -1394,7 +1400,7 @@ layout::calculate_x_offset_display ()
> > +     =3D get_line_bytes_without_trailing_whitespace (line.get_buffer
> > (),
> > +                                                 line.length ());
> > +   int eol_display_column
> > +-    =3D cpp_display_width (line.get_buffer (), line_bytes);
> > ++    =3D cpp_display_width (line.get_buffer (), line_bytes, m_context-
> > >tabstop);
> > +   if (caret_display_column > eol_display_column
> > +       || !caret_display_column)
> > +     {
> > +@@ -1445,16 +1451,13 @@ layout::calculate_x_offset_display ()
> > + }
> > +
> > + /* Print line ROW of source code, potentially colorized at any
> > ranges, and
> > +-   populate *LBOUNDS_OUT.
> > +-   LINE is the source line (not necessarily 0-terminated) and
> > LINE_BYTES
> > +-   is its length in bytes.
> > +-   This function deals only with byte offsets, not display columns,
> > so
> > +-   m_x_offset_display must be converted from display to byte
> > units.  In
> > +-   particular, LINE_BYTES and LBOUNDS_OUT are in bytes.  */
> > ++   return the line bounds.  LINE is the source line (not
> > necessarily
> > ++   0-terminated) and LINE_BYTES is its length in bytes.  In order
> > to handle both
> > ++   colorization and tab expansion, this function tracks the line
> > position in
> > ++   both byte and display column units.  */
> > +
> > +-void
> > +-layout::print_source_line (linenum_type row, const char *line, int
> > line_bytes,
> > +-                         line_bounds *lbounds_out)
> > ++line_bounds
> > ++layout::print_source_line (linenum_type row, const char *line, int
> > line_bytes)
> > + {
> > +   m_colorizer.set_normal_text ();
> > +
> > +@@ -1469,30 +1472,29 @@ layout::print_source_line (linenum_type
> > +   else
> > +     pp_space (m_pp);
> > +
> > +-  /* We will stop printing the source line at any trailing
> > whitespace, and start
> > +-     printing it as per m_x_offset_display.  */
> > ++  /* We will stop printing the source line at any trailing
> > whitespace.  */
> > +   line_bytes =3D get_line_bytes_without_trailing_whitespace (line,
> > +
> > line_bytes);
> > +-  int x_offset_bytes =3D 0;
> > +-  if (m_x_offset_display)
> > +-    {
> > +-      x_offset_bytes =3D cpp_display_column_to_byte_column (line,
> > line_bytes,
> > +-
> > m_x_offset_display);
> > +-      /* In case the leading portion of the line that will be
> > skipped over ends
> > +-       with a character with wcwidth > 1, then it is possible we
> > skipped too
> > +-       much, so account for that by padding with spaces.  */
> > +-      const int overage
> > +-      =3D cpp_byte_column_to_display_column (line, line_bytes,
> > x_offset_bytes)
> > +-      - m_x_offset_display;
> > +-      for (int column =3D 0; column < overage; ++column)
> > +-      pp_space (m_pp);
> > +-      line +=3D x_offset_bytes;
> > +-    }
> > +
> > +-  /* Print the line.  */
> > +-  int first_non_ws =3D INT_MAX;
> > +-  int last_non_ws =3D 0;
> > +-  for (int col_byte =3D 1 + x_offset_bytes; col_byte <=3D line_bytes;
> > col_byte++)
> > ++  /* This object helps to keep track of which display column we are
> > at, which is
> > ++     necessary for computing the line bounds in display units, for
> > doing
> > ++     tab expansion, and for implementing m_x_offset_display.  */
> > ++  cpp_display_width_computation dw (line, line_bytes, m_context-
> > >tabstop);
> > ++
> > ++  /* Skip the first m_x_offset_display display columns.  In case
> > the leading
> > ++     portion that will be skipped ends with a character with
> > wcwidth > 1, then
> > ++     it is possible we skipped too much, so account for that by
> > padding with
> > ++     spaces.  Note that this does the right thing too in case a tab
> > was the last
> > ++     character to be skipped over; the tab is effectively replaced
> > by the
> > ++     correct number of trailing spaces needed to offset by the
> > desired number of
> > ++     display columns.  */
> > ++  for (int skipped_display_cols =3D dw.advance_display_cols
> > (m_x_offset_display);
> > ++       skipped_display_cols > m_x_offset_display; --
> > skipped_display_cols)
> > ++    pp_space (m_pp);
> > ++
> > ++  /* Print the line and compute the line_bounds.  */
> > ++  line_bounds lbounds;
> > ++  while (!dw.done ())
> > +     {
> > +       /* Assuming colorization is enabled for the caret and
> > underline
> > +        characters, we may also colorize the associated characters
> > +@@ -1510,7 +1512,8 @@ layout::print_source_line (linenum_type
> > +       {
> > +         bool in_range_p;
> > +         point_state state;
> > +-        in_range_p =3D get_state_at_point (row, col_byte,
> > ++        const int start_byte_col =3D dw.bytes_processed () + 1;
> > ++        in_range_p =3D get_state_at_point (row, start_byte_col,
> > +                                          0, INT_MAX,
> > +                                          CU_BYTES,
> > +                                          &state);
> > +@@ -1519,22 +1522,44 @@ layout::print_source_line (linenum_type
> > +         else
> > +           m_colorizer.set_normal_text ();
> > +       }
> > +-      char c =3D *line;
> > +-      if (c =3D=3D '\0' || c =3D=3D '\t' || c =3D=3D '\r')
> > +-      c =3D ' ';
> > +-      if (c !=3D ' ')
> > ++
> > ++      /* Get the display width of the next character to be output,
> > expanding
> > ++       tabs and replacing some control bytes with spaces as
> > necessary.  */
> > ++      const char *c =3D dw.next_byte ();
> > ++      const int start_disp_col =3D dw.display_cols_processed () + 1;
> > ++      const int this_display_width =3D dw.process_next_codepoint ();
> > ++      if (*c =3D=3D '\t')
> > ++      {
> > ++        /* The returned display width is the number of spaces into
> > which the
> > ++           tab should be expanded.  */
> > ++        for (int i =3D 0; i !=3D this_display_width; ++i)
> > ++          pp_space (m_pp);
> > ++        continue;
> > ++      }
> > ++      if (*c =3D=3D '\0' || *c =3D=3D '\r')
> > +       {
> > +-        last_non_ws =3D col_byte;
> > +-        if (first_non_ws =3D=3D INT_MAX)
> > +-          first_non_ws =3D col_byte;
> > ++        /* cpp_wcwidth() promises to return 1 for all control
> > bytes, and we
> > ++           want to output these as a single space too, so this case
> > is
> > ++           actually the same as the '\t' case.  */
> > ++        gcc_assert (this_display_width =3D=3D 1);
> > ++        pp_space (m_pp);
> > ++        continue;
> > +       }
> > +-      pp_character (m_pp, c);
> > +-      line++;
> > ++
> > ++      /* We have a (possibly multibyte) character to output; update
> > the line
> > ++       bounds if it is not whitespace.  */
> > ++      if (*c !=3D ' ')
> > ++      {
> > ++        lbounds.m_last_non_ws_disp_col =3D dw.display_cols_processed
> > ();
> > ++        if (lbounds.m_first_non_ws_disp_col =3D=3D INT_MAX)
> > ++          lbounds.m_first_non_ws_disp_col =3D start_disp_col;
> > ++      }
> > ++
> > ++      /* Output the character.  */
> > ++      while (c !=3D dw.next_byte ()) pp_character (m_pp, *c++);
> > +     }
> > +   print_newline ();
> > +-
> > +-  lbounds_out->m_first_non_ws =3D first_non_ws;
> > +-  lbounds_out->m_last_non_ws =3D last_non_ws;
> > ++  return lbounds;
> > + }
> > +
> > + /* Determine if we should print an annotation line for ROW.
> > +@@ -1576,14 +1601,13 @@ layout::start_annotation_line (char marg
> > + }
> > +
> > + /* Print a line consisting of the caret/underlines for the given
> > +-   source line.  This function works with display columns, rather
> > than byte
> > +-   counts; in particular, LBOUNDS should be in display column
> > units.  */
> > ++   source line.  */
> > +
> > + void
> > + layout::print_annotation_line (linenum_type row, const line_bounds
> > lbounds)
> > + {
> > +   int x_bound =3D get_x_bound_for_row (row, m_exploc.m_display_col,
> > +-                                   lbounds.m_last_non_ws);
> > ++                                   lbounds.m_last_non_ws_disp_col);
> > +
> > +   start_annotation_line ();
> > +   pp_space (m_pp);
> > +@@ -1593,8 +1617,8 @@ layout::print_annotation_line (linenum_t
> > +       bool in_range_p;
> > +       point_state state;
> > +       in_range_p =3D get_state_at_point (row, column,
> > +-                                     lbounds.m_first_non_ws,
> > +-                                     lbounds.m_last_non_ws,
> > ++
> > lbounds.m_first_non_ws_disp_col,
> > ++
> > lbounds.m_last_non_ws_disp_col,
> > +                                      CU_DISPLAY_COLS,
> > +                                      &state);
> > +       if (in_range_p)
> > +@@ -1631,12 +1655,14 @@ layout::print_annotation_line (linenum_t
> > + class line_label
> > + {
> > + public:
> > +-  line_label (int state_idx, int column, label_text text)
> > ++  line_label (diagnostic_context *context, int state_idx, int
> > column,
> > ++            label_text text)
> > +   : m_state_idx (state_idx), m_column (column),
> > +     m_text (text), m_label_line (0), m_has_vbar (true)
> > +   {
> > +     const int bytes =3D strlen (text.m_buffer);
> > +-    m_display_width =3D cpp_display_width (text.m_buffer, bytes);
> > ++    m_display_width
> > ++      =3D cpp_display_width (text.m_buffer, bytes, context->tabstop);
> > +   }
> > +
> > +   /* Sorting is primarily by column, then by state index.  */
> > +@@ -1696,7 +1722,7 @@ layout::print_any_labels (linenum_type r
> > +       if (text.m_buffer =3D=3D NULL)
> > +         continue;
> > +
> > +-      labels.safe_push (line_label (i, disp_col, text));
> > ++      labels.safe_push (line_label (m_context, i, disp_col, text));
> > +       }
> > +   }
> > +
> > +@@ -1976,7 +2002,8 @@ public:
> > +
> > + /* Get the range of bytes or display columns that HINT would
> > affect.  */
> > + static column_range
> > +-get_affected_range (const fixit_hint *hint, enum column_unit
> > col_unit)
> > ++get_affected_range (diagnostic_context *context,
> > ++                  const fixit_hint *hint, enum column_unit
> > col_unit)
> > + {
> > +   expanded_location exploc_start =3D expand_location (hint-
> > >get_start_loc ());
> > +   expanded_location exploc_finish =3D expand_location (hint-
> > >get_next_loc ());
> > +@@ -1986,11 +2013,13 @@ get_affected_range (const fixit_hint *hi
> > +   int finish_column;
> > +   if (col_unit =3D=3D CU_DISPLAY_COLS)
> > +     {
> > +-      start_column =3D location_compute_display_column
> > (exploc_start);
> > ++      start_column
> > ++      =3D location_compute_display_column (exploc_start, context-
> > >tabstop);
> > +       if (hint->insertion_p ())
> > +       finish_column =3D start_column - 1;
> > +       else
> > +-      finish_column =3D location_compute_display_column
> > (exploc_finish);
> > ++      finish_column
> > ++        =3D location_compute_display_column (exploc_finish, context-
> > >tabstop);
> > +     }
> > +   else
> > +     {
> > +@@ -2003,12 +2032,12 @@ get_affected_range (const fixit_hint *hi
> > + /* Get the range of display columns that would be printed for
> > HINT.  */
> > +
> > + static column_range
> > +-get_printed_columns (const fixit_hint *hint)
> > ++get_printed_columns (diagnostic_context *context, const fixit_hint
> > *hint)
> > + {
> > +   expanded_location exploc =3D expand_location (hint->get_start_loc
> > ());
> > +-  int start_column =3D location_compute_display_column (exploc);
> > +-  int hint_width =3D cpp_display_width (hint->get_string (),
> > +-                                    hint->get_length ());
> > ++  int start_column =3D location_compute_display_column (exploc,
> > context->tabstop);
> > ++  int hint_width =3D cpp_display_width (hint->get_string (), hint-
> > >get_length (),
> > ++                                    context->tabstop);
> > +   int final_hint_column =3D start_column + hint_width - 1;
> > +   if (hint->insertion_p ())
> > +     {
> > +@@ -2018,7 +2047,8 @@ get_printed_columns (const fixit_hint *h
> > +     {
> > +       exploc =3D expand_location (hint->get_next_loc ());
> > +       --exploc.column;
> > +-      int finish_column =3D location_compute_display_column (exploc);
> > ++      int finish_column
> > ++      =3D location_compute_display_column (exploc, context->tabstop);
> > +       return column_range (start_column,
> > +                          MAX (finish_column, final_hint_column));
> > +     }
> > +@@ -2035,12 +2065,14 @@ public:
> > +   correction (column_range affected_bytes,
> > +             column_range affected_columns,
> > +             column_range printed_columns,
> > +-            const char *new_text, size_t new_text_len)
> > ++            const char *new_text, size_t new_text_len,
> > ++            int tabstop)
> > +   : m_affected_bytes (affected_bytes),
> > +     m_affected_columns (affected_columns),
> > +     m_printed_columns (printed_columns),
> > +     m_text (xstrdup (new_text)),
> > +     m_byte_length (new_text_len),
> > ++    m_tabstop (tabstop),
> > +     m_alloc_sz (new_text_len + 1)
> > +   {
> > +     compute_display_cols ();
> > +@@ -2058,7 +2090,7 @@ public:
> > +
> > +   void compute_display_cols ()
> > +   {
> > +-    m_display_cols =3D cpp_display_width (m_text, m_byte_length);
> > ++    m_display_cols =3D cpp_display_width (m_text, m_byte_length,
> > m_tabstop);
> > +   }
> > +
> > +   void overwrite (int dst_offset, const char_span &src_span)
> > +@@ -2086,6 +2118,7 @@ public:
> > +   char *m_text;
> > +   size_t m_byte_length; /* Not including null-terminator.  */
> > +   int m_display_cols;
> > ++  int m_tabstop;
> > +   size_t m_alloc_sz;
> > + };
> > +
> > +@@ -2121,13 +2154,15 @@ correction::ensure_terminated ()
> > + class line_corrections
> > + {
> > + public:
> > +-  line_corrections (const char *filename, linenum_type row)
> > +-  : m_filename (filename), m_row (row)
> > ++  line_corrections (diagnostic_context *context, const char
> > *filename,
> > ++                  linenum_type row)
> > ++    : m_context (context), m_filename (filename), m_row (row)
> > +   {}
> > +   ~line_corrections ();
> > +
> > +   void add_hint (const fixit_hint *hint);
> > +
> > ++  diagnostic_context *m_context;
> > +   const char *m_filename;
> > +   linenum_type m_row;
> > +   auto_vec <correction *> m_corrections;
> > +@@ -2173,9 +2208,10 @@ source_line::source_line (const char *fi
> > + void
> > + line_corrections::add_hint (const fixit_hint *hint)
> > + {
> > +-  column_range affected_bytes =3D get_affected_range (hint,
> > CU_BYTES);
> > +-  column_range affected_columns =3D get_affected_range (hint,
> > CU_DISPLAY_COLS);
> > +-  column_range printed_columns =3D get_printed_columns (hint);
> > ++  column_range affected_bytes =3D get_affected_range (m_context,
> > hint, CU_BYTES);
> > ++  column_range affected_columns =3D get_affected_range (m_context,
> > hint,
> > ++
> > CU_DISPLAY_COLS);
> > ++  column_range printed_columns =3D get_printed_columns (m_context,
> > hint);
> > +
> > +   /* Potentially consolidate.  */
> > +   if (!m_corrections.is_empty ())
> > +@@ -2243,7 +2279,8 @@ line_corrections::add_hint (const fixit_
> > +                                          affected_columns,
> > +                                          printed_columns,
> > +                                          hint->get_string (),
> > +-                                         hint->get_length ()));
> > ++                                         hint->get_length (),
> > ++                                         m_context->tabstop));
> > + }
> > +
> > + /* If there are any fixit hints on source line ROW, print them.
> > +@@ -2257,7 +2294,7 @@ layout::print_trailing_fixits (linenum_t
> > + {
> > +   /* Build a list of correction instances for the line,
> > +      potentially consolidating hints (for the sake of
> > readability).  */
> > +-  line_corrections corrections (m_exploc.file, row);
> > ++  line_corrections corrections (m_context, m_exploc.file, row);
> > +   for (unsigned int i =3D 0; i < m_fixit_hints.length (); i++)
> > +     {
> > +       const fixit_hint *hint =3D m_fixit_hints[i];
> > +@@ -2499,15 +2536,11 @@ layout::print_line (linenum_type row)
> > +   if (!line)
> > +     return;
> > +
> > +-  line_bounds lbounds;
> > +   print_leading_fixits (row);
> > +-  print_source_line (row, line.get_buffer (), line.length (),
> > &lbounds);
> > ++  const line_bounds lbounds
> > ++    =3D print_source_line (row, line.get_buffer (), line.length ());
> > +   if (should_print_annotation_line_p (row))
> > +-    {
> > +-      if (lbounds.m_first_non_ws !=3D INT_MAX)
> > +-      lbounds.convert_to_display_cols (line);
> > +-      print_annotation_line (row, lbounds);
> > +-    }
> > ++    print_annotation_line (row, lbounds);
> > +   if (m_show_labels_p)
> > +     print_any_labels (row);
> > +   print_trailing_fixits (row);
> > +@@ -2670,9 +2703,11 @@ test_layout_x_offset_display_utf8 (const
> > +
> > +   char_span lspan =3D location_get_source_line (tmp.get_filename (),
> > 1);
> > +   ASSERT_EQ (line_display_cols,
> > +-           cpp_display_width (lspan.get_buffer (), lspan.length
> > ()));
> > ++           cpp_display_width (lspan.get_buffer (), lspan.length (),
> > ++                              def_tabstop));
> > +   ASSERT_EQ (line_display_cols,
> > +-           location_compute_display_column (expand_location
> > (line_end)));
> > ++           location_compute_display_column (expand_location
> > (line_end),
> > ++                                            def_tabstop));
> > +   ASSERT_EQ (0, memcmp (lspan.get_buffer () + (emoji_col - 1),
> > +                       "\xf0\x9f\x98\x82\xf0\x9f\x98\x82", 8));
> > +
> > +@@ -2774,6 +2809,111 @@ test_layout_x_offset_display_utf8 (const
> > +
> > + }
> > +
> > ++static void
> > ++test_layout_x_offset_display_tab (const line_table_case &case_)
> > ++{
> > ++  const char *content
> > ++    =3D "This line is very long, so that we can use it to test the
> > logic for "
> > ++      "clipping long lines.  Also this: `\t' is a tab that occupies
> > 1 byte and "
> > ++      "a variable number of display columns, starting at column
> > #103.\n";
> > ++
> > ++  /* Number of bytes in the line, subtracting one to remove the
> > newline.  */
> > ++  const int line_bytes =3D strlen (content) - 1;
> > ++
> > ++ /* The column where the tab begins.  Byte or display is the same
> > as there are
> > ++    no multibyte characters earlier on the line.  */
> > ++  const int tab_col =3D 103;
> > ++
> > ++  /* Effective extra size of the tab beyond what a single space
> > would have taken
> > ++     up, indexed by tabstop.  */
> > ++  static const int num_tabstops =3D 11;
> > ++  int extra_width[num_tabstops];
> > ++  for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)
> > ++    {
> > ++      const int this_tab_size =3D tabstop - (tab_col - 1) % tabstop;
> > ++      extra_width[tabstop] =3D this_tab_size - 1;
> > ++    }
> > ++  /* Example of this calculation: if tabstop is 10, the tab
> > starting at column
> > ++     #103 has to expand into 8 spaces, covering columns 103-110, so
> > that the
> > ++     next character is at column #111.  So it takes up 7 more
> > columns than
> > ++     a space would have taken up.  */
> > ++  ASSERT_EQ (7, extra_width[10]);
> > ++
> > ++  temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
> > ++  line_table_test ltt (case_);
> > ++
> > ++  linemap_add (line_table, LC_ENTER, false, tmp.get_filename (),
> > 1);
> > ++
> > ++  location_t line_end =3D linemap_position_for_column (line_table,
> > line_bytes);
> > ++
> > ++  /* Don't attempt to run the tests if column data might be
> > unavailable.  */
> > ++  if (line_end > LINE_MAP_MAX_LOCATION_WITH_COLS)
> > ++    return;
> > ++
> > ++  /* Check that cpp_display_width handles the tabs as expected.  */
> > ++  char_span lspan =3D location_get_source_line (tmp.get_filename (),
> > 1);
> > ++  ASSERT_EQ ('\t', *(lspan.get_buffer () + (tab_col - 1)));
> > ++  for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)
> > ++    {
> > ++      ASSERT_EQ (line_bytes + extra_width[tabstop],
> > ++               cpp_display_width (lspan.get_buffer (), lspan.length
> > (),
> > ++                                  tabstop));
> > ++      ASSERT_EQ (line_bytes + extra_width[tabstop],
> > ++               location_compute_display_column (expand_location
> > (line_end),
> > ++                                                tabstop));
> > ++    }
> > ++
> > ++  /* Check that the tab is expanded to the expected number of
> > spaces.  */
> > ++  rich_location richloc (line_table,
> > ++                       linemap_position_for_column (line_table,
> > ++                                                    tab_col + 1));
> > ++  for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)
> > ++    {
> > ++      test_diagnostic_context dc;
> > ++      dc.tabstop =3D tabstop;
> > ++      layout test_layout (&dc, &richloc, DK_ERROR);
> > ++      test_layout.print_line (1);
> > ++      const char *out =3D pp_formatted_text (dc.printer);
> > ++      ASSERT_EQ (NULL, strchr (out, '\t'));
> > ++      const char *left_quote =3D strchr (out, '`');
> > ++      const char *right_quote =3D strchr (out, '\'');
> > ++      ASSERT_NE (NULL, left_quote);
> > ++      ASSERT_NE (NULL, right_quote);
> > ++      ASSERT_EQ (right_quote - left_quote, extra_width[tabstop] +
> > 2);
> > ++    }
> > ++
> > ++  /* Check that the line is offset properly and that the tab is
> > broken up
> > ++     into the expected number of spaces when it is the last
> > character skipped
> > ++     over.  */
> > ++  for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)
> > ++    {
> > ++      test_diagnostic_context dc;
> > ++      dc.tabstop =3D tabstop;
> > ++      static const int small_width =3D 24;
> > ++      dc.caret_max_width =3D small_width - 4;
> > ++      dc.min_margin_width =3D test_left_margin - test_linenum_sep +
> > 1;
> > ++      dc.show_line_numbers_p =3D true;
> > ++      layout test_layout (&dc, &richloc, DK_ERROR);
> > ++      test_layout.print_line (1);
> > ++
> > ++      /* We have arranged things so that two columns will be
> > printed before
> > ++       the caret.  If the tab results in more than one space, this
> > should
> > ++       produce two spaces in the output; otherwise, it will be a
> > single space
> > ++       preceded by the opening quote before the tab character.  */
> > ++      const char *output1
> > ++      =3D "   1 |   ' is a tab that occupies 1 byte and a variable
> > number of "
> > ++        "display columns, starting at column #103.\n"
> > ++        "     |   ^\n\n";
> > ++      const char *output2
> > ++      =3D "   1 | ` ' is a tab that occupies 1 byte and a variable
> > number of "
> > ++        "display columns, starting at column #103.\n"
> > ++        "     |   ^\n\n";
> > ++      const char *expected_output =3D (extra_width[tabstop] ? output1
> > : output2);
> > ++      ASSERT_STREQ (expected_output, pp_formatted_text
> > (dc.printer));
> > ++    }
> > ++}
> > ++
> > ++
> > + /* Verify that diagnostic_show_locus works sanely on
> > UNKNOWN_LOCATION.  */
> > +
> > + static void
> > +@@ -3854,6 +3994,27 @@ test_one_liner_labels_utf8 ()
> > +   }
> > + }
> > +
> > ++/* Make sure that colorization codes don't interrupt a multibyte
> > ++   sequence, which would corrupt it.  */
> > ++static void
> > ++test_one_liner_colorized_utf8 ()
> > ++{
> > ++  test_diagnostic_context dc;
> > ++  dc.colorize_source_p =3D true;
> > ++  diagnostic_color_init (&dc, DIAGNOSTICS_COLOR_YES);
> > ++  const location_t pi =3D linemap_position_for_column (line_table,
> > 12);
> > ++  rich_location richloc (line_table, pi);
> > ++  diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> > ++
> > ++  /* In order to avoid having the test depend on exactly how the
> > colorization
> > ++     was effected, just confirm there are two pi characters in the
> > output.  */
> > ++  const char *result =3D pp_formatted_text (dc.printer);
> > ++  const char *null_term =3D result + strlen (result);
> > ++  const char *first_pi =3D strstr (result, "\xcf\x80");
> > ++  ASSERT_TRUE (first_pi && first_pi <=3D null_term - 2);
> > ++  ASSERT_STR_CONTAINS (first_pi + 2, "\xcf\x80");
> > ++}
> > ++
> > + /* Run the various one-liner tests.  */
> > +
> > + static void
> > +@@ -3884,8 +4045,10 @@ test_diagnostic_show_locus_one_liner_utf
> > +   ASSERT_EQ (31, LOCATION_COLUMN (line_end));
> > +
> > +   char_span lspan =3D location_get_source_line (tmp.get_filename (),
> > 1);
> > +-  ASSERT_EQ (25, cpp_display_width (lspan.get_buffer (),
> > lspan.length ()));
> > +-  ASSERT_EQ (25, location_compute_display_column (expand_location
> > (line_end)));
> > ++  ASSERT_EQ (25, cpp_display_width (lspan.get_buffer (),
> > lspan.length (),
> > ++                                  def_tabstop));
> > ++  ASSERT_EQ (25, location_compute_display_column (expand_location
> > (line_end),
> > ++                                                def_tabstop));
> > +
> > +   test_one_liner_simple_caret_utf8 ();
> > +   test_one_liner_caret_and_range_utf8 ();
> > +@@ -3900,6 +4063,7 @@ test_diagnostic_show_locus_one_liner_utf
> > +   test_one_liner_many_fixits_1_utf8 ();
> > +   test_one_liner_many_fixits_2_utf8 ();
> > +   test_one_liner_labels_utf8 ();
> > ++  test_one_liner_colorized_utf8 ();
> > + }
> > +
> > + /* Verify that gcc_rich_location::add_location_if_nearby works.  */
> > +@@ -4272,25 +4436,28 @@ test_overlapped_fixit_printing (const li
> > +     /* Unit-test the line_corrections machinery.  */
> > +     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
> > +     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
> > +-    ASSERT_EQ (column_range (12, 12), get_affected_range (hint_0,
> > CU_BYTES));
> > +     ASSERT_EQ (column_range (12, 12),
> > +-                         get_affected_range (hint_0,
> > CU_DISPLAY_COLS));
> > +-    ASSERT_EQ (column_range (12, 22), get_printed_columns
> > (hint_0));
> > ++             get_affected_range (&dc, hint_0, CU_BYTES));
> > ++    ASSERT_EQ (column_range (12, 12),
> > ++             get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
> > ++    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc,
> > hint_0));
> > +     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
> > +-    ASSERT_EQ (column_range (18, 18), get_affected_range (hint_1,
> > CU_BYTES));
> > +     ASSERT_EQ (column_range (18, 18),
> > +-                         get_affected_range (hint_1,
> > CU_DISPLAY_COLS));
> > +-    ASSERT_EQ (column_range (18, 20), get_printed_columns
> > (hint_1));
> > ++             get_affected_range (&dc, hint_1, CU_BYTES));
> > ++    ASSERT_EQ (column_range (18, 18),
> > ++             get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
> > ++    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc,
> > hint_1));
> > +     const fixit_hint *hint_2 =3D richloc.get_fixit_hint (2);
> > +-    ASSERT_EQ (column_range (29, 28), get_affected_range (hint_2,
> > CU_BYTES));
> > +     ASSERT_EQ (column_range (29, 28),
> > +-                         get_affected_range (hint_2,
> > CU_DISPLAY_COLS));
> > +-    ASSERT_EQ (column_range (29, 29), get_printed_columns
> > (hint_2));
> > ++             get_affected_range (&dc, hint_2, CU_BYTES));
> > ++    ASSERT_EQ (column_range (29, 28),
> > ++             get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
> > ++    ASSERT_EQ (column_range (29, 29), get_printed_columns (&dc,
> > hint_2));
> > +
> > +     /* Add each hint in turn to a line_corrections instance,
> > +        and verify that they are consolidated into one correction
> > instance
> > +        as expected.  */
> > +-    line_corrections lc (tmp.get_filename (), 1);
> > ++    line_corrections lc (&dc, tmp.get_filename (), 1);
> > +
> > +     /* The first replace hint by itself.  */
> > +     lc.add_hint (hint_0);
> > +@@ -4484,25 +4651,28 @@ test_overlapped_fixit_printing_utf8 (con
> > +     /* Unit-test the line_corrections machinery.  */
> > +     ASSERT_EQ (3, richloc.get_num_fixit_hints ());
> > +     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
> > +-    ASSERT_EQ (column_range (14, 14), get_affected_range (hint_0,
> > CU_BYTES));
> > ++    ASSERT_EQ (column_range (14, 14),
> > ++             get_affected_range (&dc, hint_0, CU_BYTES));
> > +     ASSERT_EQ (column_range (12, 12),
> > +-                         get_affected_range (hint_0,
> > CU_DISPLAY_COLS));
> > +-    ASSERT_EQ (column_range (12, 22), get_printed_columns
> > (hint_0));
> > ++             get_affected_range (&dc, hint_0, CU_DISPLAY_COLS));
> > ++    ASSERT_EQ (column_range (12, 22), get_printed_columns (&dc,
> > hint_0));
> > +     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
> > +-    ASSERT_EQ (column_range (22, 22), get_affected_range (hint_1,
> > CU_BYTES));
> > ++    ASSERT_EQ (column_range (22, 22),
> > ++             get_affected_range (&dc, hint_1, CU_BYTES));
> > +     ASSERT_EQ (column_range (18, 18),
> > +-                         get_affected_range (hint_1,
> > CU_DISPLAY_COLS));
> > +-    ASSERT_EQ (column_range (18, 20), get_printed_columns
> > (hint_1));
> > ++             get_affected_range (&dc, hint_1, CU_DISPLAY_COLS));
> > ++    ASSERT_EQ (column_range (18, 20), get_printed_columns (&dc,
> > hint_1));
> > +     const fixit_hint *hint_2 =3D richloc.get_fixit_hint (2);
> > +-    ASSERT_EQ (column_range (35, 34), get_affected_range (hint_2,
> > CU_BYTES));
> > ++    ASSERT_EQ (column_range (35, 34),
> > ++             get_affected_range (&dc, hint_2, CU_BYTES));
> > +     ASSERT_EQ (column_range (30, 29),
> > +-                         get_affected_range (hint_2,
> > CU_DISPLAY_COLS));
> > +-    ASSERT_EQ (column_range (30, 30), get_printed_columns
> > (hint_2));
> > ++             get_affected_range (&dc, hint_2, CU_DISPLAY_COLS));
> > ++    ASSERT_EQ (column_range (30, 30), get_printed_columns (&dc,
> > hint_2));
> > +
> > +     /* Add each hint in turn to a line_corrections instance,
> > +        and verify that they are consolidated into one correction
> > instance
> > +        as expected.  */
> > +-    line_corrections lc (tmp.get_filename (), 1);
> > ++    line_corrections lc (&dc, tmp.get_filename (), 1);
> > +
> > +     /* The first replace hint by itself.  */
> > +     lc.add_hint (hint_0);
> > +@@ -4689,6 +4859,8 @@ test_overlapped_fixit_printing_2 (const
> > +
> > +   /* Two insertions, in the wrong order.  */
> > +   {
> > ++    test_diagnostic_context dc;
> > ++
> > +     rich_location richloc (line_table, col_20);
> > +     richloc.add_fixit_insert_before (col_23, "{");
> > +     richloc.add_fixit_insert_before (col_21, "}");
> > +@@ -4696,14 +4868,15 @@ test_overlapped_fixit_printing_2 (const
> > +     /* These fixits should be accepted; they can't be
> > consolidated.  */
> > +     ASSERT_EQ (2, richloc.get_num_fixit_hints ());
> > +     const fixit_hint *hint_0 =3D richloc.get_fixit_hint (0);
> > +-    ASSERT_EQ (column_range (23, 22), get_affected_range (hint_0,
> > CU_BYTES));
> > +-    ASSERT_EQ (column_range (23, 23), get_printed_columns
> > (hint_0));
> > ++    ASSERT_EQ (column_range (23, 22),
> > ++             get_affected_range (&dc, hint_0, CU_BYTES));
> > ++    ASSERT_EQ (column_range (23, 23), get_printed_columns (&dc,
> > hint_0));
> > +     const fixit_hint *hint_1 =3D richloc.get_fixit_hint (1);
> > +-    ASSERT_EQ (column_range (21, 20), get_affected_range (hint_1,
> > CU_BYTES));
> > +-    ASSERT_EQ (column_range (21, 21), get_printed_columns
> > (hint_1));
> > ++    ASSERT_EQ (column_range (21, 20),
> > ++             get_affected_range (&dc, hint_1, CU_BYTES));
> > ++    ASSERT_EQ (column_range (21, 21), get_printed_columns (&dc,
> > hint_1));
> > +
> > +     /* Verify that they're printed correctly.  */
> > +-    test_diagnostic_context dc;
> > +     diagnostic_show_locus (&dc, &richloc, DK_ERROR);
> > +     ASSERT_STREQ (" int a5[][0][0] =3D { 1, 2 };\n"
> > +                 "                    ^\n"
> > +@@ -4955,6 +5128,65 @@ test_fixit_deletion_affecting_newline (c
> > +               pp_formatted_text (dc.printer));
> > + }
> > +
> > ++static void
> > ++test_tab_expansion (const line_table_case &case_)
> > ++{
> > ++  /* Create a tempfile and write some text to it.  This example
> > uses a tabstop
> > ++     of 8, as the column numbers attempt to indicate:
> > ++
> > ++    .....................000.01111111111.22222333333  display
> > ++    .....................123.90123456789.56789012345  columns  */
> > ++  const char *content =3D "  \t   This: `\t' is a tab.\n";
> > ++  /* ....................000 00000011111 11111222222  byte
> > ++     ....................123 45678901234 56789012345  columns  */
> > ++
> > ++  const int tabstop =3D 8;
> > ++  const int first_non_ws_byte_col =3D 7;
> > ++  const int right_quote_byte_col =3D 15;
> > ++  const int last_byte_col =3D 25;
> > ++  ASSERT_EQ (35, cpp_display_width (content, last_byte_col,
> > tabstop));
> > ++
> > ++  temp_source_file tmp (SELFTEST_LOCATION, ".c", content);
> > ++  line_table_test ltt (case_);
> > ++  linemap_add (line_table, LC_ENTER, false, tmp.get_filename (),
> > 1);
> > ++
> > ++  /* Don't attempt to run the tests if column data might be
> > unavailable.  */
> > ++  location_t line_end =3D linemap_position_for_column (line_table,
> > last_byte_col);
> > ++  if (line_end > LINE_MAP_MAX_LOCATION_WITH_COLS)
> > ++    return;
> > ++
> > ++  /* Check that the leading whitespace with mixed tabs and spaces
> > is expanded
> > ++     into 11 spaces.  Recall that print_line() also puts one space
> > before
> > ++     everything too.  */
> > ++  {
> > ++    test_diagnostic_context dc;
> > ++    dc.tabstop =3D tabstop;
> > ++    rich_location richloc (line_table,
> > ++                         linemap_position_for_column (line_table,
> > ++                                                      first_non_ws_
> > byte_col));
> > ++    layout test_layout (&dc, &richloc, DK_ERROR);
> > ++    test_layout.print_line (1);
> > ++    ASSERT_STREQ ("            This: `      ' is a tab.\n"
> > ++                "            ^\n",
> > ++                pp_formatted_text (dc.printer));
> > ++  }
> > ++
> > ++  /* Confirm the display width was tracked correctly across the
> > internal tab
> > ++     as well.  */
> > ++  {
> > ++    test_diagnostic_context dc;
> > ++    dc.tabstop =3D tabstop;
> > ++    rich_location richloc (line_table,
> > ++                         linemap_position_for_column (line_table,
> > ++                                                      right_quote_b
> > yte_col));
> > ++    layout test_layout (&dc, &richloc, DK_ERROR);
> > ++    test_layout.print_line (1);
> > ++    ASSERT_STREQ ("            This: `      ' is a tab.\n"
> > ++                "                         ^\n",
> > ++                pp_formatted_text (dc.printer));
> > ++  }
> > ++}
> > ++
> > + /* Verify that line numbers are correctly printed for the case of
> > +    a multiline range in which the width of the line numbers changes
> > +    (e.g. from "9" to "10").  */
> > +@@ -5012,6 +5244,7 @@ diagnostic_show_locus_c_tests ()
> > +   test_layout_range_for_multiple_lines ();
> > +
> > +   for_each_line_table_case (test_layout_x_offset_display_utf8);
> > ++  for_each_line_table_case (test_layout_x_offset_display_tab);
> > +
> > +   test_get_line_bytes_without_trailing_whitespace ();
> > +
> > +@@ -5029,6 +5262,7 @@ diagnostic_show_locus_c_tests ()
> > +   for_each_line_table_case
> > (test_fixit_insert_containing_newline_2);
> > +   for_each_line_table_case (test_fixit_replace_containing_newline);
> > +   for_each_line_table_case (test_fixit_deletion_affecting_newline);
> > ++  for_each_line_table_case (test_tab_expansion);
> > +
> > +   test_line_numbers_multiline_range ();
> > + }
> > +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
> > +--- a/gcc/doc/invoke.texi      2021-12-24 20:23:46.876739587 -0800
> > ++++ b/gcc/doc/invoke.texi      2021-12-25 01:20:53.487636494 -0800
> > +@@ -293,7 +293,9 @@ Objective-C and Objective-C++ Dialects}.
> > + -fdiagnostics-show-template-tree  -fno-elide-type @gol
> > +
> > -fdiagnostics-path-format=3D@r{[}none@r{|}separate-events@r
> {|}inline-events@r{
> > ]} @gol
> > + -fdiagnostics-show-path-depths @gol
> > +--fno-show-column}
> > ++-fno-show-column @gol
> > ++-fdiagnostics-column-unit=3D@r{[}display@r{|}byte@r{]} @gol
> > ++-fdiagnostics-column-origin=3D@var{origin}}
> > +
> > + @item Warning Options
> > + @xref{Warning Options,,Options to Request or Suppress Warnings}.
> > +@@ -4424,6 +4426,31 @@ Do not print column numbers in diagnosti
> > + diagnostics are being scanned by a program that does not understand
> > the
> > + column numbers, such as @command{dejagnu}.
> > +
> > ++@item -fdiagnostics-column-unit=3D@var{UNIT}
> > ++@opindex fdiagnostics-column-unit
> > ++Select the units for the column number.  This affects traditional
> > diagnostics
> > ++(in the absence of @option{-fno-show-column}), as well as JSON
> > format
> > ++diagnostics if requested.
> > ++
> > ++The default @var{UNIT}, @samp{display}, considers the number of
> > display
> > ++columns occupied by each character.  This may be larger than the
> > number
> > ++of bytes required to encode the character, in the case of tab
> > ++characters, or it may be smaller, in the case of multibyte
> > characters.
> > ++For example, the character ``GREEK SMALL LETTER PI (U+03C0)''
> > occupies one
> > ++display column, and its UTF-8 encoding requires two bytes; the
> > character
> > ++``SLIGHTLY SMILING FACE (U+1F642)'' occupies two display columns,
> > and
> > ++its UTF-8 encoding requires four bytes.
> > ++
> > ++Setting @var{UNIT} to @samp{byte} changes the column number to the
> > raw byte
> > ++count in all cases, as was traditionally output by GCC prior to
> > version 11.1.0.
> > ++
> > ++@item -fdiagnostics-column-origin=3D@var{ORIGIN}
> > ++@opindex fdiagnostics-column-origin
> > ++Select the origin for column numbers, i.e. the column number
> > assigned to the
> > ++first column.  The default value of 1 corresponds to traditional
> > GCC
> > ++behavior and to the GNU style guide.  Some utilities may perform
> > better with an
> > ++origin of 0; any non-negative value may be specified.
> > ++
> > + @item -fdiagnostics-format=3D@var{FORMAT}
> > + @opindex fdiagnostics-format
> > + Select a different format for printing diagnostics.
> > +@@ -4459,11 +4486,15 @@ might be printed in JSON form (after for
> > +         "locations": [
> > +             @{
> > +                 "caret": @{
> > ++                  "display-column": 3,
> > ++                  "byte-column": 3,
> > +                     "column": 3,
> > +                     "file": "misleading-indentation.c",
> > +                     "line": 15
> > +                 @},
> > +                 "finish": @{
> > ++                  "display-column": 4,
> > ++                  "byte-column": 4,
> > +                     "column": 4,
> > +                     "file": "misleading-indentation.c",
> > +                     "line": 15
> > +@@ -4479,6 +4510,8 @@ might be printed in JSON form (after for
> > +                 "locations": [
> > +                     @{
> > +                         "caret": @{
> > ++                          "display-column": 5,
> > ++                          "byte-column": 5,
> > +                             "column": 5,
> > +                             "file": "misleading-indentation.c",
> > +                             "line": 17
> > +@@ -4488,6 +4521,7 @@ might be printed in JSON form (after for
> > +                 "message": "...this statement, but the latter is
> > @dots{}"
> > +             @}
> > +         ]
> > ++      "column-origin": 1,
> > +     @},
> > +     @dots{}
> > + ]
> > +@@ -4500,10 +4534,34 @@ A diagnostic has a @code{kind}.  If this
> > + an @code{option} key describing the command-line option controlling
> > the
> > + warning.
> > +
> > +-A diagnostic can contain zero or more locations.  Each location has
> > up
> > +-to three positions within it: a @code{caret} position and optional
> > +-@code{start} and @code{finish} positions.  A location can also have
> > +-an optional @code{label} string.  For example, this error:
> > ++A diagnostic can contain zero or more locations.  Each location has
> >

--0000000000009753d105d47474c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Dec 30, 2021 at 4:29 PM Anuj Mittal &lt;<a href=3D"=
mailto:anuj.mittal@intel.com">anuj.mittal@intel.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">I can&#39;t apply this. <br>
<br>
git am says:<br>
<br>
error: cannot convert from Y to UTF-8<br>
fatal: could not parse patch<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Key is When git =
send-email asks for UTF-8 encoding for the patch then do not enter =E2=80=
=9Cy=E2=80=9D but just press</div><div dir=3D"auto">Enter=C2=A0</div><div d=
ir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Thanks,<br>
<br>
Anuj<br>
<br>
On Wed, 2021-12-29 at 01:13 -0800, pgowda wrote:<br>
&gt; Upstream-Status: Backport<br>
&gt; [<a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D004bb9=
36d6d5f177af26ad" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/=
git/?p=3Dgcc.git;a=3Dcommit;h=3D004bb936d6d5f177af26ad</a><br>
&gt; 4905595e843d5665a5]<br>
&gt; Upstream-Status: Backport<br>
&gt; [<a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3Dbd5e88=
2cf6e0def3dd1bc1" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/=
git/?p=3Dgcc.git;a=3Dcommit;h=3Dbd5e882cf6e0def3dd1bc1</a><br>
&gt; 06075d59a303fe0d1e]<br>
&gt; Upstream-Status: Backport<br>
&gt; [<a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D51c500=
269bf53749b10780" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/=
git/?p=3Dgcc.git;a=3Dcommit;h=3D51c500269bf53749b10780</a><br>
&gt; 7d84271385fad35628]<br>
&gt; Upstream-Status: Backport<br>
&gt; [<a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D1a7f2c=
0774129750fdf73e" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/=
git/?p=3Dgcc.git;a=3Dcommit;h=3D1a7f2c0774129750fdf73e</a><br>
&gt; 9f1b78f0ce983c9ab3]<br>
&gt; Upstream-Status: Backport<br>
&gt; [<a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3Dbef32d=
4a28595e933f24fe" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/=
git/?p=3Dgcc.git;a=3Dcommit;h=3Dbef32d4a28595e933f24fe</a><br>
&gt; f378cf052a30b674a7]<br>
&gt; <br>
&gt; Signed-off-by: pgowda &lt;<a href=3D"mailto:pgowda.cve@gmail.com" targ=
et=3D"_blank">pgowda.cve@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/recipes-devtools/gcc/gcc-10.2.inc=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 5 +<br>
&gt; =C2=A0.../gcc/gcc/0001-CVE-2021-42574.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2906<br>
&gt; +++++++++++++++++<br>
&gt; =C2=A0.../gcc/gcc/0002-CVE-2021-42574.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 2270 +++++++++++++<br>
&gt; =C2=A0.../gcc/gcc/0003-CVE-2021-42574.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 1724 ++++++++++<br>
&gt; =C2=A0.../gcc/gcc/0004-CVE-2021-42574.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 138 +<br>
&gt; =C2=A0.../gcc/gcc/0005-CVE-2021-42574.patch=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 575 ++++<br>
&gt; =C2=A06 files changed, 7618 insertions(+)<br>
&gt; =C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-<=
br>
&gt; 42574.patch<br>
&gt; =C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-<=
br>
&gt; 42574.patch<br>
&gt; =C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-<=
br>
&gt; 42574.patch<br>
&gt; =C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-<=
br>
&gt; 42574.patch<br>
&gt; =C2=A0create mode 100644 meta/recipes-devtools/gcc/gcc/0005-CVE-2021-<=
br>
&gt; 42574.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc-10.2.inc b/meta/recipes-<br=
>
&gt; devtools/gcc/gcc-10.2.inc<br>
&gt; index 5626bf20f0..fd7f16d7bf 100644<br>
&gt; --- a/meta/recipes-devtools/gcc/gcc-10.2.inc<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc-10.2.inc<br>
&gt; @@ -74,6 +74,11 @@ SRC_URI =3D &quot;\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://0002-CVE-2021-35465.patch=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://0003-CVE-2021-35465.patch=C2=A0\<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fil=
e://0004-CVE-2021-35465.patch=C2=A0\<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
001-CVE-2021-42574.patch=C2=A0\<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
002-CVE-2021-42574.patch=C2=A0\<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
003-CVE-2021-42574.patch=C2=A0\<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
004-CVE-2021-42574.patch=C2=A0\<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
005-CVE-2021-42574.patch=C2=A0\<br>
&gt; =C2=A0&quot;<br>
&gt; =C2=A0SRC_URI[sha256sum] =3D<br>
&gt; &quot;b8dd4368bb9c7f0b98188317ee0254dd8cc99d1e3a18d0ff146c855fe16c1d8c=
&quot;<br>
&gt; =C2=A0<br>
&gt; diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch<b=
r>
&gt; b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..e0f4f7d32f<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-42574.patch<br>
&gt; @@ -0,0 +1,2906 @@<br>
&gt; +From 004bb936d6d5f177af26ad4905595e843d5665a5 Mon Sep 17 00:00:00<br>
&gt; 2001<br>
&gt; +From: Lewis Hyatt &lt;<a href=3D"mailto:lhyatt@gmail.com" target=3D"_=
blank">lhyatt@gmail.com</a>&gt;<br>
&gt; +Date: Tue, 14 Jul 2020 12:05:56 -0400<br>
&gt; +Subject: [PATCH] diagnostics: Support conversion of tabs to spaces<br=
>
&gt; [PR49973]<br>
&gt; + [PR86904]<br>
&gt; +<br>
&gt; +Supports conversion of tabs to spaces when outputting diagnostics.<br=
>
&gt; Also<br>
&gt; +adds -fdiagnostics-column-unit and -fdiagnostics-column-origin<br>
&gt; options to<br>
&gt; +control how the column number is output, thereby resolving the two<br=
>
&gt; PRs.<br>
&gt; +<br>
&gt; +gcc/c-family/ChangeLog:<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PR other/86904<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-indentation.c (should_w=
arn_for_misleading_indentation):<br>
&gt; Get<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0global tabstop from the new=
 source.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-opts.c (c_common_handle=
_option): Remove handling of -<br>
&gt; ftabstop, which<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0is now a common option.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c.opt: Likewise.<br>
&gt; +<br>
&gt; +gcc/ChangeLog:<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PR preprocessor/49973<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PR other/86904<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* common.opt: Handle -ftabs=
top here instead of in c-family<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0options.=C2=A0 Add -fdiagno=
stics-column-unit=3D and<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0-fdiagnostics-column-origin=
=3D options.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* opts.c (common_handle_opt=
ion): Handle the new options.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* diagnostic-format-json.cc=
 (json_from_expanded_location):<br>
&gt; Add<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0diagnostic_context argument=
.=C2=A0 Use it to convert column<br>
&gt; numbers as per<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0the new options.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(json_from_location_range):=
 Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(json_from_fixit_hint): Lik=
ewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(json_end_diagnostic): Pass=
 the new context argument to<br>
&gt; helper<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0functions above.=C2=A0 Add =
&quot;column-origin&quot; field to the output.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(test_unknown_location): Ad=
d the new context argument to<br>
&gt; calls to<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0helper functions.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(test_bad_endpoints): Likew=
ise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* diagnostic-show-locus.c<b=
r>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(exploc_with_display_col::e=
xploc_with_display_col): Support<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0tabstop parameter.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(layout_point::layout_point=
): Make use of class<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0exploc_with_display_col.<br=
>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(layout_range::layout_range=
): Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(struct line_bounds): Clari=
fy that the units are now always<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0display columns.=C2=A0 Rena=
me members accordingly.=C2=A0 Add<br>
&gt; constructor.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(layout::print_source_line)=
: Add support for tab expansion.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(make_range): Adapt to clas=
s layout_range changes.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(layout::maybe_add_location=
_range): Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(layout::layout): Adapt to =
class exploc_with_display_col<br>
&gt; changes.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(layout::calculate_x_offset=
_display): Support tabstop<br>
&gt; parameter.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(layout::print_annotation_l=
ine): Adapt to struct line_bounds<br>
&gt; changes.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(layout::print_line): Likew=
ise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(line_label::line_label): A=
dd diagnostic_context argument.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(get_affected_range): Likew=
ise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(get_printed_columns): Like=
wise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(layout::print_any_labels):=
 Adapt to struct line_label<br>
&gt; changes.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(class correction): Add m_t=
abstop member.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(correction::correction): A=
dd tabstop argument.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(correction::compute_displa=
y_cols): Use m_tabstop.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(class line_corrections): A=
dd m_context member.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(line_corrections::line_cor=
rections): Add diagnostic_context<br>
&gt; argument.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(line_corrections::add_hint=
): Use m_context to handle<br>
&gt; tabstops.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(layout::print_trailing_fix=
its): Adapt to class<br>
&gt; line_corrections<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0changes.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(test_layout_x_offset_displ=
ay_utf8): Support tabstop<br>
&gt; parameter.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(test_layout_x_offset_displ=
ay_tab): New selftest.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(test_one_liner_colorized_u=
tf8): Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(test_tab_expansion): Likew=
ise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(test_diagnostic_show_locus=
_one_liner_utf8): Call the new<br>
&gt; tests.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(diagnostic_show_locus_c_te=
sts): Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(test_overlapped_fixit_prin=
ting): Adapt to helper class and<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0function changes.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(test_overlapped_fixit_prin=
ting_utf8): Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(test_overlapped_fixit_prin=
ting_2): Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* diagnostic.h (enum diagno=
stics_column_unit): New enum.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(struct diagnostic_context)=
: Add members for the new options.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(diagnostic_converted_colum=
n): Declare.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(json_from_expanded_locatio=
n): Add new context argument.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* diagnostic.c (diagnostic_=
initialize): Initialize new<br>
&gt; members.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(diagnostic_converted_colum=
n): New function.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(maybe_line_and_column): Be=
 willing to output a column of 0.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(diagnostic_get_location_te=
xt): Convert column number as per<br>
&gt; the new<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0options.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(diagnostic_report_current_=
module): Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(assert_location_text): Add=
 origin and column_unit arguments<br>
&gt; for<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0testing the new functionali=
ty.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(test_diagnostic_get_locati=
on_text): Test the new<br>
&gt; functionality.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* doc/invoke.texi: Document=
 the new options and behavior.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* input.h (location_compute=
_display_column): Add tabstop<br>
&gt; argument.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* input.c (location_compute=
_display_column): Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(test_cpp_utf8): Add selfte=
sts for tab expansion.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* tree-diagnostic-path.cc (=
default_tree_make_json_for_path):<br>
&gt; Pass the<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0new context argument to jso=
n_from_expanded_location().<br>
&gt; +<br>
&gt; +libcpp/ChangeLog:<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PR preprocessor/49973<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PR other/86904<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* include/cpplib.h (struct =
cpp_options):=C2=A0 Removed support for<br>
&gt; -ftabstop,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0which is now handled by dia=
gnostic_context.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(class cpp_display_width_co=
mputation): New class.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(cpp_byte_column_to_display=
_column): Add optional tabstop<br>
&gt; argument.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(cpp_display_width): Likewi=
se.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(cpp_display_column_to_byte=
_column): Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* charset.c<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(cpp_display_width_computat=
ion::cpp_display_width_computation<br>
&gt; ): New<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0function.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(cpp_display_width_computat=
ion::advance_display_cols):<br>
&gt; Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(compute_next_display_width=
): Removed and implemented this<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0functionality in a new func=
tion...<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(cpp_display_width_computat=
ion::process_next_codepoint):<br>
&gt; ...here.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(cpp_byte_column_to_display=
_column): Added tabstop argument.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Reimplemented in terms of c=
lass<br>
&gt; cpp_display_width_computation.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0(cpp_display_column_to_byte=
_column): Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* init.c (cpp_create_reader=
): Remove handling of -ftabstop,<br>
&gt; which is now<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0handled by diagnostic_conte=
xt.<br>
&gt; +<br>
&gt; +gcc/testsuite/ChangeLog:<br>
&gt; +<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PR preprocessor/49973<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0PR other/86904<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/Wmisleading-=
indentation-3.c: Adjust expected<br>
&gt; output<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for new defaults.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/Wmisleading-=
indentation.c: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/diagnostic-f=
ormat-json-1.c: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/diagnostic-f=
ormat-json-2.c: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/diagnostic-f=
ormat-json-3.c: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/diagnostic-f=
ormat-json-4.c: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/diagnostic-f=
ormat-json-5.c: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/missing-clos=
e-symbol.c: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* g++.dg/diagnostic/bad-bin=
ary-ops.C: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* g++.dg/parse/error4.C: Li=
kewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* g++.old-deja/g++.brendan/=
crash11.C: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* g++.old-deja/g++.pt/overl=
oad2.C: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* g++.old-deja/g++.robertl/=
eb109.C: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* gcc.dg/analyzer/malloc-pa=
ths-9.c: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* gcc.dg/bad-binary-ops.c: =
Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* gcc.dg/format/branch-1.c:=
 Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* gcc.dg/format/pr79210.c: =
Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* gcc.dg/plugin/diagnostic-=
test-expressions-1.c: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* gcc.dg/plugin/diagnostic-=
test-string-literals-1.c:<br>
&gt; Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* gcc.dg/redecl-4.c: Likewi=
se.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* gfortran.dg/diagnostic-fo=
rmat-json-1.F90: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* gfortran.dg/diagnostic-fo=
rmat-json-2.F90: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* gfortran.dg/diagnostic-fo=
rmat-json-3.F90: Likewise.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* go.dg/arrayclear.go: Add =
a comment explaining why adding a<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0comment was necessary to wo=
rk around a dejagnu bug.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/diagnostic-u=
nits-1.c: New test.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/diagnostic-u=
nits-2.c: New test.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/diagnostic-u=
nits-3.c: New test.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/diagnostic-u=
nits-4.c: New test.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/diagnostic-u=
nits-5.c: New test.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/diagnostic-u=
nits-6.c: New test.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/diagnostic-u=
nits-7.c: New test.<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* c-c++-common/diagnostic-u=
nits-8.c: New test.<br>
&gt; +<br>
&gt; +CVE: CVE-2021-42574<br>
&gt; +Upstream-Status: Backport<br>
&gt; [<a href=3D"https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D004bb9=
36d6d5f177af26ad" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/=
git/?p=3Dgcc.git;a=3Dcommit;h=3D004bb936d6d5f177af26ad</a><br>
&gt; 4905595e843d5665a5]<br>
&gt; +Signed-off-by: Pgowda &lt;<a href=3D"mailto:pgowda.cve@gmail.com" tar=
get=3D"_blank">pgowda.cve@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + gcc/c-family/c-indentation.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 5 +-<br>
&gt; + gcc/c-family/c-opts.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 -<br>
&gt; + gcc/c-family/c.opt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 -<br>
&gt; + gcc/common.opt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 21 +<br>
&gt; + gcc/diagnostic-format-json.cc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 55 +-<br>
&gt; + gcc/diagnostic-show-locus.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 504=
 +++++++++++++--<br>
&gt; ---<br>
&gt; + gcc/diagnostic.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 113 +++-<br>
&gt; + gcc/diagnostic.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 28 +-<br>
&gt; + gcc/doc/invoke.texi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 68 ++-<br>
&gt; + gcc/input.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 72 ++-<br>
&gt; + gcc/input.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 4 +-<br>
&gt; + gcc/opts.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 14 +<br>
&gt; + .../c-c++-common/Wmisleading-indentation-3.c=C2=A0 |=C2=A0 12 +-<br>
&gt; + .../c-c++-common/Wmisleading-indentation.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 6 +-<br>
&gt; + .../c-c++-common/diagnostic-format-json-1.c=C2=A0=C2=A0 |=C2=A0=C2=
=A0 5 +<br>
&gt; + .../c-c++-common/diagnostic-format-json-2.c=C2=A0=C2=A0 |=C2=A0=C2=
=A0 5 +<br>
&gt; + .../c-c++-common/diagnostic-format-json-3.c=C2=A0=C2=A0 |=C2=A0=C2=
=A0 5 +<br>
&gt; + .../c-c++-common/diagnostic-format-json-4.c=C2=A0=C2=A0 |=C2=A0=C2=
=A0 9 +<br>
&gt; + .../c-c++-common/diagnostic-format-json-5.c=C2=A0=C2=A0 |=C2=A0=C2=
=A0 9 +<br>
&gt; + .../c-c++-common/diagnostic-units-1.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 28 +<br>
&gt; + .../c-c++-common/diagnostic-units-2.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 28 +<br>
&gt; + .../c-c++-common/diagnostic-units-3.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 28 +<br>
&gt; + .../c-c++-common/diagnostic-units-4.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 28 +<br>
&gt; + .../c-c++-common/diagnostic-units-5.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 28 +<br>
&gt; + .../c-c++-common/diagnostic-units-6.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 28 +<br>
&gt; + .../c-c++-common/diagnostic-units-7.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 28 +<br>
&gt; + .../c-c++-common/diagnostic-units-8.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 28 +<br>
&gt; + .../c-c++-common/missing-close-symbol.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 6 +-<br>
&gt; + .../g++.dg/diagnostic/bad-binary-ops.C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-<br>
&gt; + gcc/testsuite/g++.dg/parse/error4.C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
&gt; + .../g++.old-deja/g++.brendan/crash11.C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-<br>
&gt; + gcc/testsuite/g++.old-deja/g++.pt/overload2.C |=C2=A0=C2=A0 2 +-<br>
&gt; + .../g++.old-deja/g++.robertl/eb109.C=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 4 +-<br>
&gt; + .../gcc.dg/analyzer/malloc-paths-9.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
&gt; + gcc/testsuite/gcc.dg/bad-binary-ops.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-<br>
&gt; + gcc/testsuite/gcc.dg/format/branch-1.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
&gt; + gcc/testsuite/gcc.dg/format/pr79210.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
&gt; + .../plugin/diagnostic-test-expressions-1.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
 16 +-<br>
&gt; + .../diagnostic-test-string-literals-1.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0=C2=A0 4 +-<br>
&gt; + gcc/testsuite/gcc.dg/redecl-4.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-<br>
&gt; + .../gfortran.dg/diagnostic-format-json-1.F90=C2=A0 |=C2=A0=C2=A0 5 +=
<br>
&gt; + .../gfortran.dg/diagnostic-format-json-2.F90=C2=A0 |=C2=A0=C2=A0 5 +=
<br>
&gt; + .../gfortran.dg/diagnostic-format-json-3.F90=C2=A0 |=C2=A0=C2=A0 5 +=
<br>
&gt; + gcc/testsuite/go.dg/arrayclear.go=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +<br>
&gt; + gcc/tree-diagnostic-path.cc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 5 +-<br>
&gt; + libcpp/charset.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 98 ++--<br>
&gt; + libcpp/include/cpplib.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 40 +-<br>
&gt; + libcpp/init.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 -<br>
&gt; + 48 files changed, 1106 insertions(+), 287 deletions(-)<br>
&gt; + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-1.c<b=
r>
&gt; + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-2.c<b=
r>
&gt; + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-3.c<b=
r>
&gt; + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-4.c<b=
r>
&gt; + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-5.c<b=
r>
&gt; + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-6.c<b=
r>
&gt; + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-7.c<b=
r>
&gt; + create mode 100644 gcc/testsuite/c-c++-common/diagnostic-units-8.c<b=
r>
&gt; +<br>
&gt; +diff --git a/gcc/c-family/c-indentation.c b/gcc/c-family/c-<br>
&gt; indentation.c<br>
&gt; +--- a/gcc/c-family/c-indentation.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02020-=
07-22 23:35:17.296384022<br>
&gt; -0700<br>
&gt; ++++ b/gcc/c-family/c-indentation.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02021-=
12-25 01:20:53.475636694<br>
&gt; -0800<br>
&gt; +@@ -24,8 +24,7 @@ along with GCC; see the file COPYING3.<br>
&gt; + #include &quot;c-common.h&quot;<br>
&gt; + #include &quot;c-indentation.h&quot;<br>
&gt; + #include &quot;selftest.h&quot;<br>
&gt; +-<br>
&gt; +-extern cpp_options *cpp_opts;<br>
&gt; ++#include &quot;diagnostic.h&quot;<br>
&gt; + <br>
&gt; + /* Round up VIS_COLUMN to nearest tab stop. */<br>
&gt; + <br>
&gt; +@@ -294,7 +293,7 @@ should_warn_for_misleading_indentation (<br>
&gt; +=C2=A0=C2=A0 expanded_location next_stmt_exploc =3D expand_location<b=
r>
&gt; (next_stmt_loc);<br>
&gt; +=C2=A0=C2=A0 expanded_location guard_exploc =3D expand_location (guar=
d_loc);<br>
&gt; + <br>
&gt; +-=C2=A0 const unsigned int tab_width =3D cpp_opts-&gt;tabstop;<br>
&gt; ++=C2=A0 const unsigned int tab_width =3D global_dc-&gt;tabstop;<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* They must be in the same file.=C2=A0 */<br>
&gt; +=C2=A0=C2=A0 if (next_stmt_exploc.file !=3D body_exploc.file)<br>
&gt; +diff --git a/gcc/c-family/c.opt b/gcc/c-family/c.opt<br>
&gt; +--- a/gcc/c-family/c.opt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0202=
1-12-24 20:23:42.816809230 -0800<br>
&gt; ++++ b/gcc/c-family/c.opt=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0202=
1-12-25 01:20:53.475636694 -0800<br>
&gt; +@@ -1876,10 +1876,6 @@ Enum(strong_eval_order) String(some) Val<br>
&gt; + EnumValue<br>
&gt; + Enum(strong_eval_order) String(all) Value(2)<br>
&gt; + <br>
&gt; +-ftabstop=3D<br>
&gt; +-C ObjC C++ ObjC++ Joined RejectNegative UInteger<br>
&gt; +--ftabstop=3D&lt;number&gt;=C2=A0=C2=A0=C2=A0=C2=A0Distance between t=
ab stops for column<br>
&gt; reporting.<br>
&gt; +-<br>
&gt; + ftemplate-backtrace-limit=3D<br>
&gt; + C++ ObjC++ Joined RejectNegative UInteger<br>
&gt; Var(template_backtrace_limit) Init(10)<br>
&gt; + Set the maximum number of template instantiation notes for a single<=
br>
&gt; warning or error.<br>
&gt; +diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c<br>
&gt; +--- a/gcc/c-family/c-opts.c=C2=A0=C2=A0=C2=A0=C2=A02021-12-24 20:23:4=
4.824774786 -0800<br>
&gt; ++++ b/gcc/c-family/c-opts.c=C2=A0=C2=A0=C2=A0=C2=A02021-12-25 01:20:5=
3.475636694 -0800<br>
&gt; +@@ -504,12 +504,6 @@ c_common_handle_option (size_t scode, co<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cpp_opts-&gt;track_macro_ex=
pansion =3D 2;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt; + <br>
&gt; +-=C2=A0=C2=A0=C2=A0 case OPT_ftabstop_:<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* It is documented that we silently =
ignore silly values.=C2=A0 */<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (value &gt;=3D 1 &amp;&amp; value =
&lt;=3D 100)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cpp_opts-&gt;tabstop =3D value;<=
br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt; +-<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 case OPT_fexec_charset_:<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpp_opts-&gt;narrow_charset =3D =
arg;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
&gt; +diff --git a/gcc/common.opt b/gcc/common.opt<br>
&gt; +--- a/gcc/common.opt=C2=A0=C2=A0=C2=A02021-12-24 20:23:42.480814993 -=
0800<br>
&gt; ++++ b/gcc/common.opt=C2=A0=C2=A0=C2=A02021-12-25 01:20:53.475636694 -=
0800<br>
&gt; +@@ -1325,6 +1325,14 @@ Enum(diagnostic_url_rule) String(always)<br>
&gt; + EnumValue<br>
&gt; + Enum(diagnostic_url_rule) String(auto) Value(DIAGNOSTICS_URL_AUTO)<b=
r>
&gt; + <br>
&gt; ++fdiagnostics-column-unit=3D<br>
&gt; ++Common Joined RejectNegative Enum(diagnostics_column_unit)<br>
&gt; ++-fdiagnostics-column-unit=3D[display|byte]=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0Select whether column<br>
&gt; numbers are output as display columns (default) or raw bytes.<br>
&gt; ++<br>
&gt; ++fdiagnostics-column-origin=3D<br>
&gt; ++Common Joined RejectNegative UInteger<br>
&gt; ++-fdiagnostics-column-origin=3D&lt;number&gt;=C2=A0=C2=A0Set the numb=
er of the first<br>
&gt; column.=C2=A0 The default is 1-based as per GNU style, but some utilit=
ies<br>
&gt; may expect 0-based, for example.<br>
&gt; ++<br>
&gt; + fdiagnostics-format=3D<br>
&gt; + Common Joined RejectNegative Enum(diagnostics_output_format)<br>
&gt; + -fdiagnostics-format=3D[text|json]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0Select output format.<br>
&gt; +@@ -1334,6 +1342,15 @@ SourceInclude<br>
&gt; + diagnostic.h<br>
&gt; + <br>
&gt; + Enum<br>
&gt; ++Name(diagnostics_column_unit) Type(int)<br>
&gt; ++<br>
&gt; ++EnumValue<br>
&gt; ++Enum(diagnostics_column_unit) String(display)<br>
&gt; Value(DIAGNOSTICS_COLUMN_UNIT_DISPLAY)<br>
&gt; ++<br>
&gt; ++EnumValue<br>
&gt; ++Enum(diagnostics_column_unit) String(byte)<br>
&gt; Value(DIAGNOSTICS_COLUMN_UNIT_BYTE)<br>
&gt; ++<br>
&gt; ++Enum<br>
&gt; + Name(diagnostics_output_format) Type(int)<br>
&gt; + <br>
&gt; + EnumValue<br>
&gt; +@@ -1362,6 +1379,10 @@ fdiagnostics-path-format=3D<br>
&gt; + Common Joined RejectNegative Var(flag_diagnostics_path_format)<br>
&gt; Enum(diagnostic_path_format) Init(DPF_INLINE_EVENTS)<br>
&gt; + Specify how to print any control-flow path associated with a<br>
&gt; diagnostic.<br>
&gt; + <br>
&gt; ++ftabstop=3D<br>
&gt; ++Common Joined RejectNegative UInteger<br>
&gt; ++-ftabstop=3D&lt;number&gt;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Distance be=
tween tab stops for column<br>
&gt; reporting.<br>
&gt; ++<br>
&gt; + Enum<br>
&gt; + Name(diagnostic_path_format) Type(int)<br>
&gt; + <br>
&gt; +diff --git a/gcc/diagnostic.c b/gcc/diagnostic.c<br>
&gt; +--- a/gcc/diagnostic.c=C2=A02020-07-22 23:35:17.556386887 -0700<br>
&gt; ++++ b/gcc/diagnostic.c=C2=A02021-12-25 01:23:41.300841207 -0800<br>
&gt; +@@ -38,6 +38,7 @@ along with GCC; see the file COPYING3.<br>
&gt; + #include &quot;selftest.h&quot;<br>
&gt; + #include &quot;selftest-diagnostic.h&quot;<br>
&gt; + #include &quot;opts.h&quot;<br>
&gt; ++#include &quot;cpplib.h&quot;<br>
&gt; + <br>
&gt; + #ifdef HAVE_TERMIOS_H<br>
&gt; + # include &lt;termios.h&gt;<br>
&gt; +@@ -219,6 +220,9 @@ diagnostic_initialize (diagnostic_contex<br>
&gt; +=C2=A0=C2=A0 context-&gt;min_margin_width =3D 0;<br>
&gt; +=C2=A0=C2=A0 context-&gt;show_ruler_p =3D false;<br>
&gt; +=C2=A0=C2=A0 context-&gt;parseable_fixits_p =3D false;<br>
&gt; ++=C2=A0 context-&gt;column_unit =3D DIAGNOSTICS_COLUMN_UNIT_DISPLAY;<=
br>
&gt; ++=C2=A0 context-&gt;column_origin =3D 1;<br>
&gt; ++=C2=A0 context-&gt;tabstop =3D 8;<br>
&gt; +=C2=A0=C2=A0 context-&gt;edit_context_ptr =3D NULL;<br>
&gt; +=C2=A0=C2=A0 context-&gt;diagnostic_group_nesting_depth =3D 0;<br>
&gt; +=C2=A0=C2=A0 context-&gt;diagnostic_group_emission_count =3D 0;<br>
&gt; +@@ -353,8 +357,51 @@ diagnostic_get_color_for_kind (diagnosti<br>
&gt; +=C2=A0=C2=A0 return diagnostic_kind_color[kind];<br>
&gt; + }<br>
&gt; + <br>
&gt; ++/* Given an expanded_location, convert the column (which is in 1-<br=
>
&gt; based bytes)<br>
&gt; ++=C2=A0=C2=A0 to the requested units, without converting the origin.<=
br>
&gt; ++=C2=A0=C2=A0 Return -1 if the column is invalid (&lt;=3D 0).=C2=A0 *=
/<br>
&gt; ++<br>
&gt; ++static int<br>
&gt; ++convert_column_unit (enum diagnostics_column_unit column_unit,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int tabstop,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 expanded_location s)<br>
&gt; ++{<br>
&gt; ++=C2=A0 if (s.column &lt;=3D 0)<br>
&gt; ++=C2=A0=C2=A0=C2=A0 return -1;<br>
&gt; ++<br>
&gt; ++=C2=A0 switch (column_unit)<br>
&gt; ++=C2=A0=C2=A0=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0 default:<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcc_unreachable ();<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0 case DIAGNOSTICS_COLUMN_UNIT_DISPLAY:<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cpp_char_column_policy policy (t=
abstop, cpp_wcwidth);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return location_compute_display_=
column (s, policy);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0 case DIAGNOSTICS_COLUMN_UNIT_BYTE:<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return s.column;<br>
&gt; ++=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* Given an expanded_location, convert the column (which is in 1-<br=
>
&gt; based bytes)<br>
&gt; ++=C2=A0=C2=A0 to the requested units and origin.=C2=A0 Return -1 if t=
he column is<br>
&gt; ++=C2=A0=C2=A0 invalid (&lt;=3D 0).=C2=A0 */<br>
&gt; ++int<br>
&gt; ++diagnostic_converted_column (diagnostic_context *context,<br>
&gt; expanded_location s)<br>
&gt; ++{<br>
&gt; ++=C2=A0 int one_based_col<br>
&gt; ++=C2=A0=C2=A0=C2=A0 =3D convert_column_unit (context-&gt;column_unit,=
 context-&gt;tabstop,<br>
&gt; s);<br>
&gt; ++=C2=A0 if (one_based_col &lt;=3D 0)<br>
&gt; ++=C2=A0=C2=A0=C2=A0 return -1;<br>
&gt; ++=C2=A0 return one_based_col + (context-&gt;column_origin - 1);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + /* Return a formatted line and column &#39;:%line:%column&#39;.=C2=
=A0 Elided if<br>
&gt; +-=C2=A0=C2=A0 zero.=C2=A0 The result is a statically allocated buffer=
.=C2=A0 */<br>
&gt; ++=C2=A0=C2=A0 line =3D=3D 0 or col &lt; 0.=C2=A0 (A column of 0 may b=
e valid due to the<br>
&gt; ++=C2=A0=C2=A0 -fdiagnostics-column-origin option.)<br>
&gt; ++=C2=A0=C2=A0 The result is a statically allocated buffer.=C2=A0 */<b=
r>
&gt; + <br>
&gt; + static const char *<br>
&gt; + maybe_line_and_column (int line, int col)<br>
&gt; +@@ -363,8 +410,9 @@ maybe_line_and_column (int line, int col<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 if (line)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t l =3D snprintf (result, sizeof=
 (result),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 col ? &quot;:%d:%d&quot; : &quot;:%d&quot;, line, col);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t l<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D snprintf (result, sizeof (re=
sult),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 col &gt;=3D 0 ? &quot;:%d:%d&quot; : &=
quot;:%d&quot;, line, col);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcc_checking_assert (l &lt; size=
of (result));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0 else<br>
&gt; +@@ -383,8 +431,14 @@ diagnostic_get_location_text (diagnostic<br>
&gt; +=C2=A0=C2=A0 const char *locus_cs =3D colorize_start (pp_show_color (=
pp),<br>
&gt; &quot;locus&quot;);<br>
&gt; +=C2=A0=C2=A0 const char *locus_ce =3D colorize_stop (pp_show_color (p=
p));<br>
&gt; +=C2=A0=C2=A0 const char *file =3D s.file ? s.file : progname;<br>
&gt; +-=C2=A0 int line =3D strcmp (file, N_(&quot;&lt;built-in&gt;&quot;)) =
? s.line : 0;<br>
&gt; +-=C2=A0 int col =3D context-&gt;show_column ? s.column : 0;<br>
&gt; ++=C2=A0 int line =3D 0;<br>
&gt; ++=C2=A0 int col =3D -1;<br>
&gt; ++=C2=A0 if (strcmp (file, N_(&quot;&lt;built-in&gt;&quot;)))<br>
&gt; ++=C2=A0=C2=A0=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line =3D s.line;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (context-&gt;show_column)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0col =3D diagnostic_converted_col=
umn (context, s);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 }<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 const char *line_col =3D maybe_line_and_column (line, co=
l);<br>
&gt; +=C2=A0=C2=A0 return build_message_string (&quot;%s%s%s:%s&quot;, locu=
s_cs, file,<br>
&gt; +@@ -650,14 +704,20 @@ diagnostic_report_current_module (diagno<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (! MAIN_FILE_P (map))<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool first =3D true;=
<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 expanded_location s =3D {=
};<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 do<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 where =3D linemap_included_from (map);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 map =3D linemap_included_from_linemap (line_table, map);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
onst char *line_col<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=3D maybe_line_and_column (SOURCE_LINE (map, where),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 first &amp;&amp; context-<br>
&gt; &gt;show_column<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ? SOURCE_COLUMN (map, where)<br>
&gt; : 0);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
.file =3D LINEMAP_FILE (map);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
.line =3D SOURCE_LINE (map, where);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
nt col =3D -1;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
f (first &amp;&amp; context-&gt;show_column)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 s.column =3D SOURCE_COLUMN (map, where);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 col =3D diagnostic_converted_column (context, s);<=
br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0}<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
onst char *line_col =3D maybe_line_and_column (s.line,<br>
&gt; col);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 static const char *const msgs[] =3D<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0{<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 N_(&quot;In file included from&quot;),<br>
&gt; +@@ -666,7 +726,7 @@ diagnostic_report_current_module (diagno<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 unsigned index =3D !first;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 pp_verbatim (context-&gt;printer, &quot;%s%s %r%s%s%R&quot;,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 first ? &quot;&quot; : &quot;,\n&quot;, _(msgs[index]),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot;locus&quot;, LINEMAP_FILE (map), line_col);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &quot;locus&quot;, s.file, line_col);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 first =3D false;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (! MAIN_FILE_P=
 (map));<br>
&gt; +@@ -2042,10 +2102,15 @@ test_print_parseable_fixits_replace ()<br>
&gt; + static void<br>
&gt; + assert_location_text (const char *expected_loc_text,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *filename, i=
nt line, int column,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool show_column)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool show_column,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int origin =3D 1,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enum diagnostics_column_un=
it column_unit<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D DIAGN=
OSTICS_COLUMN_UNIT_BYTE)<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0 test_diagnostic_context dc;<br>
&gt; +=C2=A0=C2=A0 dc.show_column =3D show_column;<br>
&gt; ++=C2=A0 dc.column_unit =3D column_unit;<br>
&gt; ++=C2=A0 dc.column_origin =3D origin;<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 expanded_location xloc;<br>
&gt; +=C2=A0=C2=A0 xloc.file =3D filename;<br>
&gt; +@@ -2069,7 +2134,10 @@ test_diagnostic_get_location_text ()<br>
&gt; +=C2=A0=C2=A0 assert_location_text (&quot;PROGNAME:&quot;, NULL, 0, 0,=
 true);<br>
&gt; +=C2=A0=C2=A0 assert_location_text (&quot;&lt;built-in&gt;:&quot;, &qu=
ot;&lt;built-in&gt;&quot;, 42, 10, true);<br>
&gt; +=C2=A0=C2=A0 assert_location_text (&quot;foo.c:42:10:&quot;, &quot;fo=
o.c&quot;, 42, 10, true);<br>
&gt; +-=C2=A0 assert_location_text (&quot;foo.c:42:&quot;, &quot;foo.c&quot=
;, 42, 0, true);<br>
&gt; ++=C2=A0 assert_location_text (&quot;foo.c:42:9:&quot;, &quot;foo.c&qu=
ot;, 42, 10, true, 0);<br>
&gt; ++=C2=A0 assert_location_text (&quot;foo.c:42:1010:&quot;, &quot;foo.c=
&quot;, 42, 10, true,<br>
&gt; 1001);<br>
&gt; ++=C2=A0 for (int origin =3D 0; origin !=3D 2; ++origin)<br>
&gt; ++=C2=A0=C2=A0=C2=A0 assert_location_text (&quot;foo.c:42:&quot;, &quo=
t;foo.c&quot;, 42, 0, true,<br>
&gt; origin);<br>
&gt; +=C2=A0=C2=A0 assert_location_text (&quot;foo.c:&quot;, &quot;foo.c&qu=
ot;, 0, 10, true);<br>
&gt; +=C2=A0=C2=A0 assert_location_text (&quot;foo.c:42:&quot;, &quot;foo.c=
&quot;, 42, 10, false);<br>
&gt; +=C2=A0=C2=A0 assert_location_text (&quot;foo.c:&quot;, &quot;foo.c&qu=
ot;, 0, 10, false);<br>
&gt; +@@ -2077,6 +2145,41 @@ test_diagnostic_get_location_text ()<br>
&gt; +=C2=A0=C2=A0 maybe_line_and_column (INT_MAX, INT_MAX);<br>
&gt; +=C2=A0=C2=A0 maybe_line_and_column (INT_MIN, INT_MIN);<br>
&gt; + <br>
&gt; ++=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0 /* In order to test display columns vs byte colum=
ns, we need to<br>
&gt; create a<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file for location_get_source_li=
ne() to read.=C2=A0 */<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0 const char *const content =3D &quot;smile \xf0\x9=
f\x98\x82\n&quot;;<br>
&gt; ++=C2=A0=C2=A0=C2=A0 const int line_bytes =3D strlen (content) - 1;<br=
>
&gt; ++=C2=A0=C2=A0=C2=A0 const int def_tabstop =3D 8;<br>
&gt; ++=C2=A0=C2=A0=C2=A0 const int display_width =3D cpp_display_width (co=
ntent,<br>
&gt; line_bytes,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def_tabstop);<=
br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (line_bytes - 2, display_width);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 temp_source_file tmp (SELFTEST_LOCATION, &quot;.c=
&quot;, content);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 const char *const fname =3D tmp.get_filename ();<=
br>
&gt; ++=C2=A0=C2=A0=C2=A0 const int buf_len =3D strlen (fname) + 16;<br>
&gt; ++=C2=A0=C2=A0=C2=A0 char *const expected =3D XNEWVEC (char, buf_len);=
<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0 snprintf (expected, buf_len, &quot;%s:1:%d:&quot;=
, fname, line_bytes);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 assert_location_text (expected, fname, 1, line_by=
tes, true,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1,=
 DIAGNOSTICS_COLUMN_UNIT_BYTE);<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0 snprintf (expected, buf_len, &quot;%s:1:%d:&quot;=
, fname, line_bytes -<br>
&gt; 1);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 assert_location_text (expected, fname, 1, line_by=
tes, true,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,=
 DIAGNOSTICS_COLUMN_UNIT_BYTE);<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0 snprintf (expected, buf_len, &quot;%s:1:%d:&quot;=
, fname, display_width);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 assert_location_text (expected, fname, 1, line_by=
tes, true,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1,=
 DIAGNOSTICS_COLUMN_UNIT_DISPLAY);<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0 snprintf (expected, buf_len, &quot;%s:1:%d:&quot;=
, fname, display_width -<br>
&gt; 1);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 assert_location_text (expected, fname, 1, line_by=
tes, true,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0,=
 DIAGNOSTICS_COLUMN_UNIT_DISPLAY);<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0 XDELETEVEC (expected);<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; ++<br>
&gt; +=C2=A0=C2=A0 progname =3D old_progname;<br>
&gt; + }<br>
&gt; + <br>
&gt; +diff --git a/gcc/diagnostic-format-json.cc b/gcc/diagnostic-format-<b=
r>
&gt; json.cc<br>
&gt; +--- a/gcc/diagnostic-format-json.cc=C2=A0=C2=A0=C2=A0=C2=A02020-07-22=
 23:35:17.556386887<br>
&gt; -0700<br>
&gt; ++++ b/gcc/diagnostic-format-json.cc=C2=A0=C2=A0=C2=A0=C2=A02021-12-25=
 01:20:53.475636694<br>
&gt; -0800<br>
&gt; +@@ -23,6 +23,7 @@ along with GCC; see the file COPYING3.<br>
&gt; + #include &quot;system.h&quot;<br>
&gt; + #include &quot;coretypes.h&quot;<br>
&gt; + #include &quot;diagnostic.h&quot;<br>
&gt; ++#include &quot;selftest-diagnostic.h&quot;<br>
&gt; + #include &quot;diagnostic-metadata.h&quot;<br>
&gt; + #include &quot;json.h&quot;<br>
&gt; + #include &quot;selftest.h&quot;<br>
&gt; +@@ -43,21 +44,43 @@ static json::array *cur_children_array;<br>
&gt; + /* Generate a JSON object for LOC.=C2=A0 */<br>
&gt; + <br>
&gt; + json::value *<br>
&gt; +-json_from_expanded_location (location_t loc)<br>
&gt; ++json_from_expanded_location (diagnostic_context *context,<br>
&gt; location_t loc)<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0 expanded_location exploc =3D expand_location (loc);<br>
&gt; +=C2=A0=C2=A0 json::object *result =3D new json::object ();<br>
&gt; +=C2=A0=C2=A0 if (exploc.file)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 result-&gt;set (&quot;file&quot;, new json::=
string (exploc.file));<br>
&gt; +=C2=A0=C2=A0 result-&gt;set (&quot;line&quot;, new json::integer_numb=
er (exploc.line));<br>
&gt; +-=C2=A0 result-&gt;set (&quot;column&quot;, new json::integer_number =
(exploc.column));<br>
&gt; ++<br>
&gt; ++=C2=A0 const enum diagnostics_column_unit orig_unit =3D context-<br>
&gt; &gt;column_unit;<br>
&gt; ++=C2=A0 struct<br>
&gt; ++=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0 const char *name;<br>
&gt; ++=C2=A0=C2=A0=C2=A0 enum diagnostics_column_unit unit;<br>
&gt; ++=C2=A0 } column_fields[] =3D {<br>
&gt; ++=C2=A0=C2=A0=C2=A0 {&quot;display-column&quot;, DIAGNOSTICS_COLUMN_U=
NIT_DISPLAY},<br>
&gt; ++=C2=A0=C2=A0=C2=A0 {&quot;byte-column&quot;, DIAGNOSTICS_COLUMN_UNIT=
_BYTE}<br>
&gt; ++=C2=A0 };<br>
&gt; ++=C2=A0 int the_column =3D INT_MIN;<br>
&gt; ++=C2=A0 for (int i =3D 0; i !=3D sizeof column_fields / sizeof<br>
&gt; (*column_fields); ++i)<br>
&gt; ++=C2=A0=C2=A0=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 context-&gt;column_unit =3D column_fi=
elds[i].unit;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const int col =3D diagnostic_converte=
d_column (context,<br>
&gt; exploc);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 result-&gt;set (column_fields[i].name=
, new json::integer_number<br>
&gt; (col));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (column_fields[i].unit =3D=3D orig=
_unit)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0the_column =3D col;<br>
&gt; ++=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++=C2=A0 gcc_assert (the_column !=3D INT_MIN);<br>
&gt; ++=C2=A0 result-&gt;set (&quot;column&quot;, new json::integer_number =
(the_column));<br>
&gt; ++=C2=A0 context-&gt;column_unit =3D orig_unit;<br>
&gt; +=C2=A0=C2=A0 return result;<br>
&gt; + }<br>
&gt; + <br>
&gt; + /* Generate a JSON object for LOC_RANGE.=C2=A0 */<br>
&gt; + <br>
&gt; + static json::object *<br>
&gt; +-json_from_location_range (const location_range *loc_range, unsigned<=
br>
&gt; range_idx)<br>
&gt; ++json_from_location_range (diagnostic_context *context,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
nst location_range *loc_range, unsigned<br>
&gt; range_idx)<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0 location_t caret_loc =3D get_pure_location (loc_range-&g=
t;m_loc);<br>
&gt; + <br>
&gt; +@@ -68,13 +91,13 @@ json_from_location_range (const location<br>
&gt; +=C2=A0=C2=A0 location_t finish_loc =3D get_finish (loc_range-&gt;m_lo=
c);<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 json::object *result =3D new json::object ();<br>
&gt; +-=C2=A0 result-&gt;set (&quot;caret&quot;, json_from_expanded_locatio=
n (caret_loc));<br>
&gt; ++=C2=A0 result-&gt;set (&quot;caret&quot;, json_from_expanded_locatio=
n (context,<br>
&gt; caret_loc));<br>
&gt; +=C2=A0=C2=A0 if (start_loc !=3D caret_loc<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;&amp; start_loc !=3D UNKNOW=
N_LOCATION)<br>
&gt; +-=C2=A0=C2=A0=C2=A0 result-&gt;set (&quot;start&quot;, json_from_expa=
nded_location (start_loc));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 result-&gt;set (&quot;start&quot;, json_from_expa=
nded_location (context,<br>
&gt; start_loc));<br>
&gt; +=C2=A0=C2=A0 if (finish_loc !=3D caret_loc<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;&amp; finish_loc !=3D UNKNO=
WN_LOCATION)<br>
&gt; +-=C2=A0=C2=A0=C2=A0 result-&gt;set (&quot;finish&quot;, json_from_exp=
anded_location<br>
&gt; (finish_loc));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 result-&gt;set (&quot;finish&quot;, json_from_exp=
anded_location (context,<br>
&gt; finish_loc));<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 if (loc_range-&gt;m_label)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; +@@ -91,14 +114,14 @@ json_from_location_range (const location<br>
&gt; + /* Generate a JSON object for HINT.=C2=A0 */<br>
&gt; + <br>
&gt; + static json::object *<br>
&gt; +-json_from_fixit_hint (const fixit_hint *hint)<br>
&gt; ++json_from_fixit_hint (diagnostic_context *context, const fixit_hint<=
br>
&gt; *hint)<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0 json::object *fixit_obj =3D new json::object ();<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 location_t start_loc =3D hint-&gt;get_start_loc ();<br>
&gt; +-=C2=A0 fixit_obj-&gt;set (&quot;start&quot;, json_from_expanded_loca=
tion<br>
&gt; (start_loc));<br>
&gt; ++=C2=A0 fixit_obj-&gt;set (&quot;start&quot;, json_from_expanded_loca=
tion (context,<br>
&gt; start_loc));<br>
&gt; +=C2=A0=C2=A0 location_t next_loc =3D hint-&gt;get_next_loc ();<br>
&gt; +-=C2=A0 fixit_obj-&gt;set (&quot;next&quot;, json_from_expanded_locat=
ion (next_loc));<br>
&gt; ++=C2=A0 fixit_obj-&gt;set (&quot;next&quot;, json_from_expanded_locat=
ion (context,<br>
&gt; next_loc));<br>
&gt; +=C2=A0=C2=A0 fixit_obj-&gt;set (&quot;string&quot;, new json::string =
(hint-&gt;get_string<br>
&gt; ()));<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 return fixit_obj;<br>
&gt; +@@ -190,11 +213,13 @@ json_end_diagnostic (diagnostic_context<br>
&gt; +=C2=A0=C2=A0 else<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Otherwise, make diag_obj be t=
he top-level object within<br>
&gt; the group;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add a &quot;children&quot; arra=
y.=C2=A0 */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add a &quot;children&quot; arra=
y and record the column origin.=C2=A0 */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 toplevel_array-&gt;append (diag_=
obj);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cur_group =3D diag_obj;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cur_children_array =3D new json:=
:array ();<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 diag_obj-&gt;set (&quot;children=
&quot;, cur_children_array);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 diag_obj-&gt;set (&quot;column-origin=
&quot;,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 new json::integer_number (contex=
t-<br>
&gt; &gt;column_origin));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 const rich_location *richloc =3D diagnostic-&gt;richloc;=
<br>
&gt; +@@ -205,7 +230,7 @@ json_end_diagnostic (diagnostic_context<br>
&gt; +=C2=A0=C2=A0 for (unsigned int i =3D 0; i &lt; richloc-&gt;get_num_lo=
cations (); i++)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const location_range *loc_range =
=3D richloc-&gt;get_range (i);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 json::object *loc_obj =3D json_from_l=
ocation_range (loc_range,<br>
&gt; i);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 json::object *loc_obj =3D json_from_l=
ocation_range (context,<br>
&gt; loc_range, i);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (loc_obj)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0loc_array-&gt;append (loc_o=
bj);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +@@ -217,7 +242,7 @@ json_end_diagnostic (diagnostic_context<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (unsigned int i =3D 0; i &lt=
; richloc-&gt;get_num_fixit_hints ();<br>
&gt; i++)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const fixit_hint *hi=
nt =3D richloc-&gt;get_fixit_hint (i);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 json::object *fixit_obj =
=3D json_from_fixit_hint (hint);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 json::object *fixit_obj =
=3D json_from_fixit_hint (context,<br>
&gt; hint);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fixit_array-&gt;appe=
nd (fixit_obj);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +@@ -320,7 +345,8 @@ namespace selftest {<br>
&gt; + static void<br>
&gt; + test_unknown_location ()<br>
&gt; + {<br>
&gt; +-=C2=A0 delete json_from_expanded_location (UNKNOWN_LOCATION);<br>
&gt; ++=C2=A0 test_diagnostic_context dc;<br>
&gt; ++=C2=A0 delete json_from_expanded_location (&amp;dc, UNKNOWN_LOCATION=
);<br>
&gt; + }<br>
&gt; + <br>
&gt; + /* Verify that we gracefully handle attempts to serialize bad<br>
&gt; +@@ -338,7 +364,8 @@ test_bad_endpoints ()<br>
&gt; +=C2=A0=C2=A0 loc_range.m_range_display_kind =3D SHOW_RANGE_WITH_CARET=
;<br>
&gt; +=C2=A0=C2=A0 loc_range.m_label =3D NULL;<br>
&gt; + <br>
&gt; +-=C2=A0 json::object *obj =3D json_from_location_range (&amp;loc_rang=
e, 0);<br>
&gt; ++=C2=A0 test_diagnostic_context dc;<br>
&gt; ++=C2=A0 json::object *obj =3D json_from_location_range (&amp;dc, &amp=
;loc_range,<br>
&gt; 0);<br>
&gt; +=C2=A0=C2=A0 /* We should have a &quot;caret&quot; value, but no &quo=
t;start&quot; or &quot;finish&quot;<br>
&gt; values.=C2=A0 */<br>
&gt; +=C2=A0=C2=A0 ASSERT_TRUE (obj !=3D NULL);<br>
&gt; +=C2=A0=C2=A0 ASSERT_TRUE (obj-&gt;get (&quot;caret&quot;) !=3D NULL);=
<br>
&gt; +diff --git a/gcc/diagnostic.h b/gcc/diagnostic.h<br>
&gt; +--- a/gcc/diagnostic.h=C2=A02020-07-22 23:35:17.556386887 -0700<br>
&gt; ++++ b/gcc/diagnostic.h=C2=A02021-12-25 01:20:53.479636627 -0800<br>
&gt; +@@ -24,6 +24,20 @@ along with GCC; see the file COPYING3.<br>
&gt; + #include &quot;pretty-print.h&quot;<br>
&gt; + #include &quot;diagnostic-core.h&quot;<br>
&gt; + <br>
&gt; ++/* An enum for controlling what units to use for the column number<b=
r>
&gt; ++=C2=A0=C2=A0 when diagnostics are output, used by the -fdiagnostics-=
column-<br>
&gt; unit option.<br>
&gt; ++=C2=A0=C2=A0 Tabs will be expanded or not according to the value of =
-<br>
&gt; ftabstop.=C2=A0 The origin<br>
&gt; ++=C2=A0=C2=A0 (default 1) is controlled by -fdiagnostics-column-origi=
n.=C2=A0 */<br>
&gt; ++<br>
&gt; ++enum diagnostics_column_unit<br>
&gt; ++{<br>
&gt; ++=C2=A0 /* The default from GCC 11 onwards: display columns.=C2=A0 */=
<br>
&gt; ++=C2=A0 DIAGNOSTICS_COLUMN_UNIT_DISPLAY,<br>
&gt; ++<br>
&gt; ++=C2=A0 /* The behavior in GCC 10 and earlier: simple bytes.=C2=A0 */=
<br>
&gt; ++=C2=A0 DIAGNOSTICS_COLUMN_UNIT_BYTE<br>
&gt; ++};<br>
&gt; ++<br>
&gt; + /* Enum for overriding the standard output format.=C2=A0 */<br>
&gt; + <br>
&gt; + enum diagnostics_output_format<br>
&gt; +@@ -280,6 +294,15 @@ struct diagnostic_context<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rest of the diagnostic.=C2=A0 */<br>
&gt; +=C2=A0=C2=A0 bool parseable_fixits_p;<br>
&gt; + <br>
&gt; ++=C2=A0 /* What units to use when outputting the column number.=C2=A0=
 */<br>
&gt; ++=C2=A0 enum diagnostics_column_unit column_unit;<br>
&gt; ++<br>
&gt; ++=C2=A0 /* The origin for the column number (1-based or 0-based<br>
&gt; typically).=C2=A0 */<br>
&gt; ++=C2=A0 int column_origin;<br>
&gt; ++<br>
&gt; ++=C2=A0 /* The size of the tabstop for tab expansion.=C2=A0 */<br>
&gt; ++=C2=A0 int tabstop;<br>
&gt; ++<br>
&gt; +=C2=A0=C2=A0 /* If non-NULL, an edit_context to which fix-it hints sh=
ould be<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 applied, for generating patches.=C2=A0=
 */<br>
&gt; +=C2=A0=C2=A0 edit_context *edit_context_ptr;<br>
&gt; +@@ -458,6 +481,8 @@ diagnostic_same_line (const diagnostic_c<br>
&gt; + }<br>
&gt; + <br>
&gt; + extern const char *diagnostic_get_color_for_kind (diagnostic_t<br>
&gt; kind);<br>
&gt; ++extern int diagnostic_converted_column (diagnostic_context<br>
&gt; *context,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0expanded_location s);<br>
&gt; + <br>
&gt; + /* Pure text formatting support functions.=C2=A0 */<br>
&gt; + extern char *file_name_as_prefix (diagnostic_context *, const char<b=
r>
&gt; *);<br>
&gt; +@@ -470,6 +495,7 @@ extern void diagnostic_output_format_ini<br>
&gt; + /* Compute the number of digits in the decimal representation of an<=
br>
&gt; integer.=C2=A0 */<br>
&gt; + extern int num_digits (int);<br>
&gt; + <br>
&gt; +-extern json::value *json_from_expanded_location (location_t loc);<br=
>
&gt; ++extern json::value *json_from_expanded_location (diagnostic_context<=
br>
&gt; *context,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 location_t loc=
);<br>
&gt; + <br>
&gt; + #endif /* ! GCC_DIAGNOSTIC_H */<br>
&gt; +diff --git a/gcc/diagnostic-show-locus.c b/gcc/diagnostic-show-<br>
&gt; locus.c<br>
&gt; +--- a/gcc/diagnostic-show-locus.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
2020-07-22 23:35:17.556386887<br>
&gt; -0700<br>
&gt; ++++ b/gcc/diagnostic-show-locus.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
2021-12-25 01:20:53.479636627<br>
&gt; -0800<br>
&gt; +@@ -175,9 +175,10 @@ enum column_unit {<br>
&gt; + class exploc_with_display_col : public expanded_location<br>
&gt; + {<br>
&gt; +=C2=A0 public:<br>
&gt; +-=C2=A0 exploc_with_display_col (const expanded_location &amp;exploc)=
<br>
&gt; ++=C2=A0 exploc_with_display_col (const expanded_location &amp;exploc,=
 int<br>
&gt; tabstop)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 : expanded_location (exploc),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m_display_col (location_compute_displ=
ay_column (exploc)) {}<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m_display_col (location_compute_displ=
ay_column (exploc,<br>
&gt; tabstop))<br>
&gt; ++=C2=A0 {}<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 int m_display_col;<br>
&gt; + };<br>
&gt; +@@ -189,11 +190,11 @@ class exploc_with_display_col : public e<br>
&gt; + class layout_point<br>
&gt; + {<br>
&gt; +=C2=A0 public:<br>
&gt; +-=C2=A0 layout_point (const expanded_location &amp;exploc)<br>
&gt; ++=C2=A0 layout_point (const exploc_with_display_col &amp;exploc)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 : m_line (exploc.line)<br>
&gt; +=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 m_columns[CU_BYTES] =3D exploc.column;<br>
&gt; +-=C2=A0=C2=A0=C2=A0 m_columns[CU_DISPLAY_COLS] =3D location_compute_d=
isplay_column<br>
&gt; (exploc);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 m_columns[CU_DISPLAY_COLS] =3D exploc.m_display_c=
ol;<br>
&gt; +=C2=A0=C2=A0 }<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 linenum_type m_line;<br>
&gt; +@@ -205,10 +206,10 @@ class layout_point<br>
&gt; + class layout_range<br>
&gt; + {<br>
&gt; +=C2=A0 public:<br>
&gt; +-=C2=A0 layout_range (const expanded_location *start_exploc,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0const expanded_location *finish_exploc,<br>
&gt; ++=C2=A0 layout_range (const exploc_with_display_col &amp;start_exploc=
,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0const exploc_with_display_col &amp;finish_exploc,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0enum range_display_kind range_display_kind,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0const expanded_location *caret_exploc,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0const exploc_with_display_col &amp;caret_exploc,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0unsigned original_idx,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0const range_label *label);<br>
&gt; + <br>
&gt; +@@ -226,22 +227,18 @@ class layout_range<br>
&gt; + <br>
&gt; + /* A struct for use by layout::print_source_line for telling<br>
&gt; +=C2=A0=C2=A0=C2=A0 layout::print_annotation_line the extents of the s=
ource line<br>
&gt; that<br>
&gt; +-=C2=A0=C2=A0 it printed, so that underlines can be clipped appropria=
tely.=C2=A0 */<br>
&gt; ++=C2=A0=C2=A0 it printed, so that underlines can be clipped appropria=
tely.=C2=A0<br>
&gt; Units<br>
&gt; ++=C2=A0=C2=A0 are 1-based display columns.=C2=A0 */<br>
&gt; + <br>
&gt; + struct line_bounds<br>
&gt; + {<br>
&gt; +-=C2=A0 int m_first_non_ws;<br>
&gt; +-=C2=A0 int m_last_non_ws;<br>
&gt; ++=C2=A0 int m_first_non_ws_disp_col;<br>
&gt; ++=C2=A0 int m_last_non_ws_disp_col;<br>
&gt; + <br>
&gt; +-=C2=A0 void convert_to_display_cols (char_span line)<br>
&gt; ++=C2=A0 line_bounds ()<br>
&gt; +=C2=A0=C2=A0 {<br>
&gt; +-=C2=A0=C2=A0=C2=A0 m_first_non_ws =3D cpp_byte_column_to_display_col=
umn<br>
&gt; (line.get_buffer (),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0line.length<br>
&gt; (),<br>
&gt; +-<br>
&gt; =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0m_first_non_ws)<br>
&gt; ;<br>
&gt; +-<br>
&gt; +-=C2=A0=C2=A0=C2=A0 m_last_non_ws =3D cpp_byte_column_to_display_colu=
mn<br>
&gt; (line.get_buffer (),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 line.length<br>
&gt; (),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0<br>
&gt; m_last_non_ws);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 m_first_non_ws_disp_col =3D INT_MAX;<br>
&gt; ++=C2=A0=C2=A0=C2=A0 m_last_non_ws_disp_col =3D 0;<br>
&gt; +=C2=A0=C2=A0 }<br>
&gt; + };<br>
&gt; + <br>
&gt; +@@ -351,8 +348,8 @@ class layout<br>
&gt; +=C2=A0 private:<br>
&gt; +=C2=A0=C2=A0 bool will_show_line_p (linenum_type row) const;<br>
&gt; +=C2=A0=C2=A0 void print_leading_fixits (linenum_type row);<br>
&gt; +-=C2=A0 void print_source_line (linenum_type row, const char *line, i=
nt<br>
&gt; line_bytes,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 li=
ne_bounds *lbounds_out);<br>
&gt; ++=C2=A0 line_bounds print_source_line (linenum_type row, const char<b=
r>
&gt; *line,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int line_bytes);<br>
&gt; +=C2=A0=C2=A0 bool should_print_annotation_line_p (linenum_type row) c=
onst;<br>
&gt; +=C2=A0=C2=A0 void start_annotation_line (char margin_char =3D &#39; &=
#39;) const;<br>
&gt; +=C2=A0=C2=A0 void print_annotation_line (linenum_type row, const line=
_bounds<br>
&gt; lbounds);<br>
&gt; +@@ -513,16 +510,16 @@ colorizer::get_color_by_name (const char<br>
&gt; +=C2=A0=C2=A0=C2=A0 Initialize various layout_point fields from expand=
ed_location<br>
&gt; +=C2=A0=C2=A0=C2=A0 equivalents; we&#39;ve already filtered on file.=
=C2=A0 */<br>
&gt; + <br>
&gt; +-layout_range::layout_range (const expanded_location *start_exploc,<b=
r>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const expanded_location *finish_exploc,<br>
&gt; ++layout_range::layout_range (const exploc_with_display_col<br>
&gt; &amp;start_exploc,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const exploc_with_display_col<br>
&gt; &amp;finish_exploc,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 enum range_display_kind<br>
&gt; range_display_kind,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const expanded_location *caret_exploc,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 const exploc_with_display_col<br>
&gt; &amp;caret_exploc,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 unsigned original_idx,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 const range_label *label)<br>
&gt; +-: m_start (*start_exploc),<br>
&gt; +-=C2=A0 m_finish (*finish_exploc),<br>
&gt; ++: m_start (start_exploc),<br>
&gt; ++=C2=A0 m_finish (finish_exploc),<br>
&gt; +=C2=A0=C2=A0 m_range_display_kind (range_display_kind),<br>
&gt; +-=C2=A0 m_caret (*caret_exploc),<br>
&gt; ++=C2=A0 m_caret (caret_exploc),<br>
&gt; +=C2=A0=C2=A0 m_original_idx (original_idx),<br>
&gt; +=C2=A0=C2=A0 m_label (label)<br>
&gt; + {<br>
&gt; +@@ -646,6 +643,9 @@ layout_range::intersects_line_p (linenum<br>
&gt; + <br>
&gt; + #if CHECKING_P<br>
&gt; + <br>
&gt; ++/* Default for when we don&#39;t care what the tab expansion is set<=
br>
&gt; to.=C2=A0 */<br>
&gt; ++static const int def_tabstop =3D 8;<br>
&gt; ++<br>
&gt; + /* Create some expanded locations for testing layout_range.=C2=A0 Th=
e<br>
&gt; filename<br>
&gt; +=C2=A0=C2=A0=C2=A0 member of the explocs is set to the empty string.=
=C2=A0 This member<br>
&gt; will only be<br>
&gt; +=C2=A0=C2=A0=C2=A0 inspected by the calls to location_compute_display=
_column() made<br>
&gt; from the<br>
&gt; +@@ -662,8 +662,11 @@ make_range (int start_line, int start_co<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 =3D {&quot;&quot;, start_line, start_col, NU=
LL, false};<br>
&gt; +=C2=A0=C2=A0 const expanded_location finish_exploc<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 =3D {&quot;&quot;, end_line, end_col, NULL, =
false};<br>
&gt; +-=C2=A0 return layout_range (&amp;start_exploc, &amp;finish_exploc,<b=
r>
&gt; SHOW_RANGE_WITHOUT_CARET,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;start_exploc, 0=
, NULL);<br>
&gt; ++=C2=A0 return layout_range (exploc_with_display_col (start_exploc,<b=
r>
&gt; def_tabstop),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exploc_with_display_=
col (finish_exploc,<br>
&gt; def_tabstop),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SHOW_RANGE_WITHOUT_C=
ARET,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exploc_with_display_=
col (start_exploc,<br>
&gt; def_tabstop),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, NULL);<br>
&gt; + }<br>
&gt; + <br>
&gt; + /* Selftests for layout_range::contains_point and<br>
&gt; +@@ -964,7 +967,7 @@ layout::layout (diagnostic_context * con<br>
&gt; + : m_context (context),<br>
&gt; +=C2=A0=C2=A0 m_pp (context-&gt;printer),<br>
&gt; +=C2=A0=C2=A0 m_primary_loc (richloc-&gt;get_range (0)-&gt;m_loc),<br>
&gt; +-=C2=A0 m_exploc (richloc-&gt;get_expanded_location (0)),<br>
&gt; ++=C2=A0 m_exploc (richloc-&gt;get_expanded_location (0), context-&gt;=
tabstop),<br>
&gt; +=C2=A0=C2=A0 m_colorizer (context, diagnostic_kind),<br>
&gt; +=C2=A0=C2=A0 m_colorize_source_p (context-&gt;colorize_source_p),<br>
&gt; +=C2=A0=C2=A0 m_show_labels_p (context-&gt;show_labels_p),<br>
&gt; +@@ -1060,7 +1063,10 @@ layout::maybe_add_location_range (const<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* Everything is now known to be in the correct source f=
ile,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 but it may require further sanitizatio=
n.=C2=A0 */<br>
&gt; +-=C2=A0 layout_range ri (&amp;start, &amp;finish, loc_range-<br>
&gt; &gt;m_range_display_kind, &amp;caret,<br>
&gt; ++=C2=A0 layout_range ri (exploc_with_display_col (start, m_context-<b=
r>
&gt; &gt;tabstop),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exploc_with_display_col (finish, m_context-<=
br>
&gt; &gt;tabstop),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 loc_range-&gt;m_range_display_kind,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exploc_with_display_col (caret, m_context-<b=
r>
&gt; &gt;tabstop),<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 original_idx, loc_range-&gt;m_label);<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* If we have a range that finishes before it starts (pe=
rhaps<br>
&gt; +@@ -1394,7 +1400,7 @@ layout::calculate_x_offset_display ()<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 =3D get_line_bytes_without_trailing_whitespa=
ce (line.get_buffer<br>
&gt; (),<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line.=
length ());<br>
&gt; +=C2=A0=C2=A0 int eol_display_column<br>
&gt; +-=C2=A0=C2=A0=C2=A0 =3D cpp_display_width (line.get_buffer (), line_b=
ytes);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 =3D cpp_display_width (line.get_buffer (), line_b=
ytes, m_context-<br>
&gt; &gt;tabstop);<br>
&gt; +=C2=A0=C2=A0 if (caret_display_column &gt; eol_display_column<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 || !caret_display_column)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; +@@ -1445,16 +1451,13 @@ layout::calculate_x_offset_display ()<br>
&gt; + }<br>
&gt; + <br>
&gt; + /* Print line ROW of source code, potentially colorized at any<br>
&gt; ranges, and<br>
&gt; +-=C2=A0=C2=A0 populate *LBOUNDS_OUT.<br>
&gt; +-=C2=A0=C2=A0 LINE is the source line (not necessarily 0-terminated) =
and<br>
&gt; LINE_BYTES<br>
&gt; +-=C2=A0=C2=A0 is its length in bytes.<br>
&gt; +-=C2=A0=C2=A0 This function deals only with byte offsets, not display=
 columns,<br>
&gt; so<br>
&gt; +-=C2=A0=C2=A0 m_x_offset_display must be converted from display to by=
te<br>
&gt; units.=C2=A0 In<br>
&gt; +-=C2=A0=C2=A0 particular, LINE_BYTES and LBOUNDS_OUT are in bytes.=C2=
=A0 */<br>
&gt; ++=C2=A0=C2=A0 return the line bounds.=C2=A0 LINE is the source line (=
not<br>
&gt; necessarily<br>
&gt; ++=C2=A0=C2=A0 0-terminated) and LINE_BYTES is its length in bytes.=C2=
=A0 In order<br>
&gt; to handle both<br>
&gt; ++=C2=A0=C2=A0 colorization and tab expansion, this function tracks th=
e line<br>
&gt; position in<br>
&gt; ++=C2=A0=C2=A0 both byte and display column units.=C2=A0 */<br>
&gt; + <br>
&gt; +-void<br>
&gt; +-layout::print_source_line (linenum_type row, const char *line, int<b=
r>
&gt; line_bytes,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 line_bounds *lbounds_out)<br>
&gt; ++line_bounds<br>
&gt; ++layout::print_source_line (linenum_type row, const char *line, int<b=
r>
&gt; line_bytes)<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0 m_colorizer.set_normal_text ();<br>
&gt; + <br>
&gt; +@@ -1469,30 +1472,29 @@ layout::print_source_line (linenum_type<br>
&gt; +=C2=A0=C2=A0 else<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 pp_space (m_pp);<br>
&gt; + <br>
&gt; +-=C2=A0 /* We will stop printing the source line at any trailing<br>
&gt; whitespace, and start<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0 printing it as per m_x_offset_display.=C2=
=A0 */<br>
&gt; ++=C2=A0 /* We will stop printing the source line at any trailing<br>
&gt; whitespace.=C2=A0 */<br>
&gt; +=C2=A0=C2=A0 line_bytes =3D get_line_bytes_without_trailing_whitespac=
e (line,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
&gt; line_bytes);<br>
&gt; +-=C2=A0 int x_offset_bytes =3D 0;<br>
&gt; +-=C2=A0 if (m_x_offset_display)<br>
&gt; +-=C2=A0=C2=A0=C2=A0 {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 x_offset_bytes =3D cpp_display_column=
_to_byte_column (line,<br>
&gt; line_bytes,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0<br>
&gt; m_x_offset_display);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* In case the leading portion of the=
 line that will be<br>
&gt; skipped over ends<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with a character with wcwidth &=
gt; 1, then it is possible we<br>
&gt; skipped too<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 much, so account for that by pa=
dding with spaces.=C2=A0 */<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const int overage<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D cpp_byte_column_to_display_c=
olumn (line, line_bytes,<br>
&gt; x_offset_bytes)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0- m_x_offset_display;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int column =3D 0; column &lt; ov=
erage; ++column)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pp_space (m_pp);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line +=3D x_offset_bytes;<br>
&gt; +-=C2=A0=C2=A0=C2=A0 }<br>
&gt; + <br>
&gt; +-=C2=A0 /* Print the line.=C2=A0 */<br>
&gt; +-=C2=A0 int first_non_ws =3D INT_MAX;<br>
&gt; +-=C2=A0 int last_non_ws =3D 0;<br>
&gt; +-=C2=A0 for (int col_byte =3D 1 + x_offset_bytes; col_byte &lt;=3D li=
ne_bytes;<br>
&gt; col_byte++)<br>
&gt; ++=C2=A0 /* This object helps to keep track of which display column we=
 are<br>
&gt; at, which is<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 necessary for computing the line bounds in =
display units, for<br>
&gt; doing<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 tab expansion, and for implementing m_x_off=
set_display.=C2=A0 */<br>
&gt; ++=C2=A0 cpp_display_width_computation dw (line, line_bytes, m_context=
-<br>
&gt; &gt;tabstop);<br>
&gt; ++<br>
&gt; ++=C2=A0 /* Skip the first m_x_offset_display display columns.=C2=A0 I=
n case<br>
&gt; the leading<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 portion that will be skipped ends with a ch=
aracter with<br>
&gt; wcwidth &gt; 1, then<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 it is possible we skipped too much, so acco=
unt for that by<br>
&gt; padding with<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 spaces.=C2=A0 Note that this does the right=
 thing too in case a tab<br>
&gt; was the last<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 character to be skipped over; the tab is ef=
fectively replaced<br>
&gt; by the<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 correct number of trailing spaces needed to=
 offset by the<br>
&gt; desired number of<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 display columns.=C2=A0 */<br>
&gt; ++=C2=A0 for (int skipped_display_cols =3D dw.advance_display_cols<br>
&gt; (m_x_offset_display);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 skipped_display_cols &gt; m_x_o=
ffset_display; --<br>
&gt; skipped_display_cols)<br>
&gt; ++=C2=A0=C2=A0=C2=A0 pp_space (m_pp);<br>
&gt; ++<br>
&gt; ++=C2=A0 /* Print the line and compute the line_bounds.=C2=A0 */<br>
&gt; ++=C2=A0 line_bounds lbounds;<br>
&gt; ++=C2=A0 while (!dw.done ())<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Assuming colorization is enab=
led for the caret and<br>
&gt; underline<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 characters, we may also co=
lorize the associated characters<br>
&gt; +@@ -1510,7 +1512,8 @@ layout::print_source_line (linenum_type<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool in_range_p;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 point_state state;<b=
r>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in_range_p =3D get_state_=
at_point (row, col_byte,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const int start_byte_col =
=3D dw.bytes_processed () + 1;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in_range_p =3D get_state_=
at_point (row, start_byte_col,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0, INT_MAX,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 CU_BYTES,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &amp;state);<br>
&gt; +@@ -1519,22 +1522,44 @@ layout::print_source_line (linenum_type<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m_colori=
zer.set_normal_text ();<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 char c =3D *line;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (c =3D=3D &#39;\0&#39; || c =3D=3D=
 &#39;\t&#39; || c =3D=3D &#39;\r&#39;)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0c =3D &#39; &#39;;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (c !=3D &#39; &#39;)<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Get the display width of the next =
character to be output,<br>
&gt; expanding<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tabs and replacing some control=
 bytes with spaces as<br>
&gt; necessary.=C2=A0 */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *c =3D dw.next_byte ();<br=
>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const int start_disp_col =3D dw.displ=
ay_cols_processed () + 1;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const int this_display_width =3D dw.p=
rocess_next_codepoint ();<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*c =3D=3D &#39;\t&#39;)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* The returned display w=
idth is the number of spaces into<br>
&gt; which the<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tab sho=
uld be expanded.=C2=A0 */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int i =3D 0; i !=3D =
this_display_width; ++i)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pp_space (m_p=
p);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*c =3D=3D &#39;\0&#39; || *c =3D=
=3D &#39;\r&#39;)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 last_non_ws =3D col_byte;=
<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (first_non_ws =3D=3D I=
NT_MAX)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 first_non_ws =
=3D col_byte;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* cpp_wcwidth() promises=
 to return 1 for all control<br>
&gt; bytes, and we<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 want to=
 output these as a single space too, so this case<br>
&gt; is<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 actuall=
y the same as the &#39;\t&#39; case.=C2=A0 */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gcc_assert (this_display_=
width =3D=3D 1);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pp_space (m_pp);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pp_character (m_pp, c);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 line++;<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We have a (possibly multibyte) cha=
racter to output; update<br>
&gt; the line<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bounds if it is not whitespace.=
=C2=A0 */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (*c !=3D &#39; &#39;)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lbounds.m_last_non_ws_dis=
p_col =3D dw.display_cols_processed<br>
&gt; ();<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (lbounds.m_first_non_w=
s_disp_col =3D=3D INT_MAX)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lbounds.m_fir=
st_non_ws_disp_col =3D start_disp_col;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* Output the character.=C2=A0 */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (c !=3D dw.next_byte ()) pp_cha=
racter (m_pp, *c++);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0 print_newline ();<br>
&gt; +-<br>
&gt; +-=C2=A0 lbounds_out-&gt;m_first_non_ws =3D first_non_ws;<br>
&gt; +-=C2=A0 lbounds_out-&gt;m_last_non_ws =3D last_non_ws;<br>
&gt; ++=C2=A0 return lbounds;<br>
&gt; + }<br>
&gt; + <br>
&gt; + /* Determine if we should print an annotation line for ROW.<br>
&gt; +@@ -1576,14 +1601,13 @@ layout::start_annotation_line (char marg<br>
&gt; + }<br>
&gt; + <br>
&gt; + /* Print a line consisting of the caret/underlines for the given<br>
&gt; +-=C2=A0=C2=A0 source line.=C2=A0 This function works with display col=
umns, rather<br>
&gt; than byte<br>
&gt; +-=C2=A0=C2=A0 counts; in particular, LBOUNDS should be in display col=
umn<br>
&gt; units.=C2=A0 */<br>
&gt; ++=C2=A0=C2=A0 source line.=C2=A0 */<br>
&gt; + <br>
&gt; + void<br>
&gt; + layout::print_annotation_line (linenum_type row, const line_bounds<b=
r>
&gt; lbounds)<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0 int x_bound =3D get_x_bound_for_row (row, m_exploc.m_dis=
play_col,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lbounds.m_l=
ast_non_ws);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lbounds.m_l=
ast_non_ws_disp_col);<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 start_annotation_line ();<br>
&gt; +=C2=A0=C2=A0 pp_space (m_pp);<br>
&gt; +@@ -1593,8 +1617,8 @@ layout::print_annotation_line (linenum_t<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool in_range_p;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 point_state state;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 in_range_p =3D get_state_at_poin=
t (row, column,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 lbounds.m_first_non_ws,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 lbounds.m_last_non_ws,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<br>
&gt; lbounds.m_first_non_ws_disp_col,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
<br>
&gt; lbounds.m_last_non_ws_disp_col,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 CU_DISPLAY_COLS,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &amp;state);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (in_range_p)<br>
&gt; +@@ -1631,12 +1655,14 @@ layout::print_annotation_line (linenum_t<br>
&gt; + class line_label<br>
&gt; + {<br>
&gt; + public:<br>
&gt; +-=C2=A0 line_label (int state_idx, int column, label_text text)<br>
&gt; ++=C2=A0 line_label (diagnostic_context *context, int state_idx, int<b=
r>
&gt; column,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 l=
abel_text text)<br>
&gt; +=C2=A0=C2=A0 : m_state_idx (state_idx), m_column (column),<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 m_text (text), m_label_line (0), m_has_vbar =
(true)<br>
&gt; +=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const int bytes =3D strlen (text.m_buffer);<=
br>
&gt; +-=C2=A0=C2=A0=C2=A0 m_display_width =3D cpp_display_width (text.m_buf=
fer, bytes);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 m_display_width<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D cpp_display_width (text.m_buffer,=
 bytes, context-&gt;tabstop);<br>
&gt; +=C2=A0=C2=A0 }<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* Sorting is primarily by column, then by state index.=
=C2=A0 */<br>
&gt; +@@ -1696,7 +1722,7 @@ layout::print_any_labels (linenum_type r<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (text.m_buffer =3D=3D NU=
LL)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 continue;<br>
&gt; + <br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0labels.safe_push (line_label (i,=
 disp_col, text));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0labels.safe_push (line_label (m_=
context, i, disp_col, text));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0 }<br>
&gt; + <br>
&gt; +@@ -1976,7 +2002,8 @@ public:<br>
&gt; + <br>
&gt; + /* Get the range of bytes or display columns that HINT would<br>
&gt; affect.=C2=A0 */<br>
&gt; + static column_range<br>
&gt; +-get_affected_range (const fixit_hint *hint, enum column_unit<br>
&gt; col_unit)<br>
&gt; ++get_affected_range (diagnostic_context *context,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const fixit_hint *hint, enum column_un=
it<br>
&gt; col_unit)<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0 expanded_location exploc_start =3D expand_location (hint=
-<br>
&gt; &gt;get_start_loc ());<br>
&gt; +=C2=A0=C2=A0 expanded_location exploc_finish =3D expand_location (hin=
t-<br>
&gt; &gt;get_next_loc ());<br>
&gt; +@@ -1986,11 +2013,13 @@ get_affected_range (const fixit_hint *hi<br>
&gt; +=C2=A0=C2=A0 int finish_column;<br>
&gt; +=C2=A0=C2=A0 if (col_unit =3D=3D CU_DISPLAY_COLS)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start_column =3D location_compute_dis=
play_column<br>
&gt; (exploc_start);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 start_column<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D location_compute_display_col=
umn (exploc_start, context-<br>
&gt; &gt;tabstop);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (hint-&gt;insertion_p ())<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0finish_column =3D start_col=
umn - 1;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0finish_column =3D location_compu=
te_display_column<br>
&gt; (exploc_finish);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0finish_column<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D location_compute_disp=
lay_column (exploc_finish, context-<br>
&gt; &gt;tabstop);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +=C2=A0=C2=A0 else<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; +@@ -2003,12 +2032,12 @@ get_affected_range (const fixit_hint *hi<br>
&gt; + /* Get the range of display columns that would be printed for<br>
&gt; HINT.=C2=A0 */<br>
&gt; + <br>
&gt; + static column_range<br>
&gt; +-get_printed_columns (const fixit_hint *hint)<br>
&gt; ++get_printed_columns (diagnostic_context *context, const fixit_hint<b=
r>
&gt; *hint)<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0 expanded_location exploc =3D expand_location (hint-&gt;g=
et_start_loc<br>
&gt; ());<br>
&gt; +-=C2=A0 int start_column =3D location_compute_display_column (exploc)=
;<br>
&gt; +-=C2=A0 int hint_width =3D cpp_display_width (hint-&gt;get_string (),=
<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hint-=
&gt;get_length ());<br>
&gt; ++=C2=A0 int start_column =3D location_compute_display_column (exploc,=
<br>
&gt; context-&gt;tabstop);<br>
&gt; ++=C2=A0 int hint_width =3D cpp_display_width (hint-&gt;get_string (),=
 hint-<br>
&gt; &gt;get_length (),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 conte=
xt-&gt;tabstop);<br>
&gt; +=C2=A0=C2=A0 int final_hint_column =3D start_column + hint_width - 1;=
<br>
&gt; +=C2=A0=C2=A0 if (hint-&gt;insertion_p ())<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; +@@ -2018,7 +2047,8 @@ get_printed_columns (const fixit_hint *h<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exploc =3D expand_location (hint=
-&gt;get_next_loc ());<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --exploc.column;<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int finish_column =3D location_comput=
e_display_column (exploc);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int finish_column<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D location_compute_display_col=
umn (exploc, context-&gt;tabstop);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return column_range (start_colum=
n,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 MAX (finish_column, final_hint_column));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 }<br>
&gt; +@@ -2035,12 +2065,14 @@ public:<br>
&gt; +=C2=A0=C2=A0 correction (column_range affected_bytes,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 column_range affected_columns,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 column_range printed_columns,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
onst char *new_text, size_t new_text_len)<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 c=
onst char *new_text, size_t new_text_len,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 i=
nt tabstop)<br>
&gt; +=C2=A0=C2=A0 : m_affected_bytes (affected_bytes),<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 m_affected_columns (affected_columns),<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 m_printed_columns (printed_columns),<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 m_text (xstrdup (new_text)),<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 m_byte_length (new_text_len),<br>
&gt; ++=C2=A0=C2=A0=C2=A0 m_tabstop (tabstop),<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 m_alloc_sz (new_text_len + 1)<br>
&gt; +=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 compute_display_cols ();<br>
&gt; +@@ -2058,7 +2090,7 @@ public:<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 void compute_display_cols ()<br>
&gt; +=C2=A0=C2=A0 {<br>
&gt; +-=C2=A0=C2=A0=C2=A0 m_display_cols =3D cpp_display_width (m_text, m_b=
yte_length);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 m_display_cols =3D cpp_display_width (m_text, m_b=
yte_length,<br>
&gt; m_tabstop);<br>
&gt; +=C2=A0=C2=A0 }<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 void overwrite (int dst_offset, const char_span &amp;src=
_span)<br>
&gt; +@@ -2086,6 +2118,7 @@ public:<br>
&gt; +=C2=A0=C2=A0 char *m_text;<br>
&gt; +=C2=A0=C2=A0 size_t m_byte_length; /* Not including null-terminator.=
=C2=A0 */<br>
&gt; +=C2=A0=C2=A0 int m_display_cols;<br>
&gt; ++=C2=A0 int m_tabstop;<br>
&gt; +=C2=A0=C2=A0 size_t m_alloc_sz;<br>
&gt; + };<br>
&gt; + <br>
&gt; +@@ -2121,13 +2154,15 @@ correction::ensure_terminated ()<br>
&gt; + class line_corrections<br>
&gt; + {<br>
&gt; + public:<br>
&gt; +-=C2=A0 line_corrections (const char *filename, linenum_type row)<br>
&gt; +-=C2=A0 : m_filename (filename), m_row (row)<br>
&gt; ++=C2=A0 line_corrections (diagnostic_context *context, const char<br>
&gt; *filename,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linenum_type row)<br>
&gt; ++=C2=A0=C2=A0=C2=A0 : m_context (context), m_filename (filename), m_r=
ow (row)<br>
&gt; +=C2=A0=C2=A0 {}<br>
&gt; +=C2=A0=C2=A0 ~line_corrections ();<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 void add_hint (const fixit_hint *hint);<br>
&gt; + <br>
&gt; ++=C2=A0 diagnostic_context *m_context;<br>
&gt; +=C2=A0=C2=A0 const char *m_filename;<br>
&gt; +=C2=A0=C2=A0 linenum_type m_row;<br>
&gt; +=C2=A0=C2=A0 auto_vec &lt;correction *&gt; m_corrections;<br>
&gt; +@@ -2173,9 +2208,10 @@ source_line::source_line (const char *fi<br>
&gt; + void<br>
&gt; + line_corrections::add_hint (const fixit_hint *hint)<br>
&gt; + {<br>
&gt; +-=C2=A0 column_range affected_bytes =3D get_affected_range (hint,<br>
&gt; CU_BYTES);<br>
&gt; +-=C2=A0 column_range affected_columns =3D get_affected_range (hint,<b=
r>
&gt; CU_DISPLAY_COLS);<br>
&gt; +-=C2=A0 column_range printed_columns =3D get_printed_columns (hint);<=
br>
&gt; ++=C2=A0 column_range affected_bytes =3D get_affected_range (m_context=
,<br>
&gt; hint, CU_BYTES);<br>
&gt; ++=C2=A0 column_range affected_columns =3D get_affected_range (m_conte=
xt,<br>
&gt; hint,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0<br>
&gt; CU_DISPLAY_COLS);<br>
&gt; ++=C2=A0 column_range printed_columns =3D get_printed_columns (m_conte=
xt,<br>
&gt; hint);<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* Potentially consolidate.=C2=A0 */<br>
&gt; +=C2=A0=C2=A0 if (!m_corrections.is_empty ())<br>
&gt; +@@ -2243,7 +2279,8 @@ line_corrections::add_hint (const fixit_<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 affected_columns,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 printed_columns,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 hint-&gt;get_string (),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 hint-&gt;get_length ()));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 hint-&gt;get_length (),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 m_context-&gt;tabstop));<br>
&gt; + }<br>
&gt; + <br>
&gt; + /* If there are any fixit hints on source line ROW, print them.<br>
&gt; +@@ -2257,7 +2294,7 @@ layout::print_trailing_fixits (linenum_t<br>
&gt; + {<br>
&gt; +=C2=A0=C2=A0 /* Build a list of correction instances for the line,<br=
>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 potentially consolidating hints (for t=
he sake of<br>
&gt; readability).=C2=A0 */<br>
&gt; +-=C2=A0 line_corrections corrections (m_exploc.file, row);<br>
&gt; ++=C2=A0 line_corrections corrections (m_context, m_exploc.file, row);=
<br>
&gt; +=C2=A0=C2=A0 for (unsigned int i =3D 0; i &lt; m_fixit_hints.length (=
); i++)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 {<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const fixit_hint *hint =3D m_fix=
it_hints[i];<br>
&gt; +@@ -2499,15 +2536,11 @@ layout::print_line (linenum_type row)<br>
&gt; +=C2=A0=C2=A0 if (!line)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 return;<br>
&gt; + <br>
&gt; +-=C2=A0 line_bounds lbounds;<br>
&gt; +=C2=A0=C2=A0 print_leading_fixits (row);<br>
&gt; +-=C2=A0 print_source_line (row, line.get_buffer (), line.length (),<b=
r>
&gt; &amp;lbounds);<br>
&gt; ++=C2=A0 const line_bounds lbounds<br>
&gt; ++=C2=A0=C2=A0=C2=A0 =3D print_source_line (row, line.get_buffer (), l=
ine.length ());<br>
&gt; +=C2=A0=C2=A0 if (should_print_annotation_line_p (row))<br>
&gt; +-=C2=A0=C2=A0=C2=A0 {<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (lbounds.m_first_non_ws !=3D INT_M=
AX)<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0lbounds.convert_to_display_cols =
(line);<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_annotation_line (row, lbounds);=
<br>
&gt; +-=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++=C2=A0=C2=A0=C2=A0 print_annotation_line (row, lbounds);<br>
&gt; +=C2=A0=C2=A0 if (m_show_labels_p)<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 print_any_labels (row);<br>
&gt; +=C2=A0=C2=A0 print_trailing_fixits (row);<br>
&gt; +@@ -2670,9 +2703,11 @@ test_layout_x_offset_display_utf8 (const<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 char_span lspan =3D location_get_source_line (tmp.get_fi=
lename (),<br>
&gt; 1);<br>
&gt; +=C2=A0=C2=A0 ASSERT_EQ (line_display_cols,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpp_dis=
play_width (lspan.get_buffer (), lspan.length<br>
&gt; ()));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpp_dis=
play_width (lspan.get_buffer (), lspan.length (),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0def_tabstop));<br>
&gt; +=C2=A0=C2=A0 ASSERT_EQ (line_display_cols,<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 locatio=
n_compute_display_column (expand_location<br>
&gt; (line_end)));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 locatio=
n_compute_display_column (expand_location<br>
&gt; (line_end),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def_tabstop));<br>
&gt; +=C2=A0=C2=A0 ASSERT_EQ (0, memcmp (lspan.get_buffer () + (emoji_col -=
 1),<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&quot;=
\xf0\x9f\x98\x82\xf0\x9f\x98\x82&quot;, 8));<br>
&gt; + <br>
&gt; +@@ -2774,6 +2809,111 @@ test_layout_x_offset_display_utf8 (const<br>
&gt; + <br>
&gt; + }<br>
&gt; + <br>
&gt; ++static void<br>
&gt; ++test_layout_x_offset_display_tab (const line_table_case &amp;case_)<=
br>
&gt; ++{<br>
&gt; ++=C2=A0 const char *content<br>
&gt; ++=C2=A0=C2=A0=C2=A0 =3D &quot;This line is very long, so that we can =
use it to test the<br>
&gt; logic for &quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;clipping long lines.=C2=A0 Also=
 this: `\t&#39; is a tab that occupies<br>
&gt; 1 byte and &quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;a variable number of display co=
lumns, starting at column<br>
&gt; #103.\n&quot;;<br>
&gt; ++<br>
&gt; ++=C2=A0 /* Number of bytes in the line, subtracting one to remove the=
<br>
&gt; newline.=C2=A0 */<br>
&gt; ++=C2=A0 const int line_bytes =3D strlen (content) - 1;<br>
&gt; ++<br>
&gt; ++ /* The column where the tab begins.=C2=A0 Byte or display is the sa=
me<br>
&gt; as there are<br>
&gt; ++=C2=A0=C2=A0=C2=A0 no multibyte characters earlier on the line.=C2=
=A0 */<br>
&gt; ++=C2=A0 const int tab_col =3D 103;<br>
&gt; ++<br>
&gt; ++=C2=A0 /* Effective extra size of the tab beyond what a single space=
<br>
&gt; would have taken<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 up, indexed by tabstop.=C2=A0 */<br>
&gt; ++=C2=A0 static const int num_tabstops =3D 11;<br>
&gt; ++=C2=A0 int extra_width[num_tabstops];<br>
&gt; ++=C2=A0 for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)=
<br>
&gt; ++=C2=A0=C2=A0=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const int this_tab_size =3D tabstop -=
 (tab_col - 1) % tabstop;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extra_width[tabstop] =3D this_tab_siz=
e - 1;<br>
&gt; ++=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++=C2=A0 /* Example of this calculation: if tabstop is 10, the tab<br>
&gt; starting at column<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 #103 has to expand into 8 spaces, covering =
columns 103-110, so<br>
&gt; that the<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 next character is at column #111.=C2=A0 So =
it takes up 7 more<br>
&gt; columns than<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 a space would have taken up.=C2=A0 */<br>
&gt; ++=C2=A0 ASSERT_EQ (7, extra_width[10]);<br>
&gt; ++<br>
&gt; ++=C2=A0 temp_source_file tmp (SELFTEST_LOCATION, &quot;.c&quot;, cont=
ent);<br>
&gt; ++=C2=A0 line_table_test ltt (case_);<br>
&gt; ++<br>
&gt; ++=C2=A0 linemap_add (line_table, LC_ENTER, false, tmp.get_filename ()=
,<br>
&gt; 1);<br>
&gt; ++<br>
&gt; ++=C2=A0 location_t line_end =3D linemap_position_for_column (line_tab=
le,<br>
&gt; line_bytes);<br>
&gt; ++<br>
&gt; ++=C2=A0 /* Don&#39;t attempt to run the tests if column data might be=
<br>
&gt; unavailable.=C2=A0 */<br>
&gt; ++=C2=A0 if (line_end &gt; LINE_MAP_MAX_LOCATION_WITH_COLS)<br>
&gt; ++=C2=A0=C2=A0=C2=A0 return;<br>
&gt; ++<br>
&gt; ++=C2=A0 /* Check that cpp_display_width handles the tabs as expected.=
=C2=A0 */<br>
&gt; ++=C2=A0 char_span lspan =3D location_get_source_line (tmp.get_filenam=
e (),<br>
&gt; 1);<br>
&gt; ++=C2=A0 ASSERT_EQ (&#39;\t&#39;, *(lspan.get_buffer () + (tab_col - 1=
)));<br>
&gt; ++=C2=A0 for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)=
<br>
&gt; ++=C2=A0=C2=A0=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_EQ (line_bytes + extra_width[t=
abstop],<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 cpp_display_width (lspan.get_buffer (), lspan.length<br>
&gt; (),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tabstop));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_EQ (line_bytes + extra_width[t=
abstop],<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 location_compute_display_column (expand_location<br>
&gt; (line_end),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tabstop)=
);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 /* Check that the tab is expanded to the expected number of<b=
r>
&gt; spaces.=C2=A0 */<br>
&gt; ++=C2=A0 rich_location richloc (line_table,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 linemap_=
position_for_column (line_table,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 tab_col + 1));<br>
&gt; ++=C2=A0 for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)=
<br>
&gt; ++=C2=A0=C2=A0=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_diagnostic_context dc;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc.tabstop =3D tabstop;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 layout test_layout (&amp;dc, &amp;ric=
hloc, DK_ERROR);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_layout.print_line (1);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *out =3D pp_formatted_text=
 (dc.printer);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_EQ (NULL, strchr (out, &#39;\t=
&#39;));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *left_quote =3D strchr (ou=
t, &#39;`&#39;);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *right_quote =3D strchr (o=
ut, &#39;\&#39;&#39;);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_NE (NULL, left_quote);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_NE (NULL, right_quote);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_EQ (right_quote - left_quote, =
extra_width[tabstop] +<br>
&gt; 2);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 /* Check that the line is offset properly and that the tab is=
<br>
&gt; broken up<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 into the expected number of spaces when it =
is the last<br>
&gt; character skipped<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 over.=C2=A0 */<br>
&gt; ++=C2=A0 for (int tabstop =3D 1; tabstop !=3D num_tabstops; ++tabstop)=
<br>
&gt; ++=C2=A0=C2=A0=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_diagnostic_context dc;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc.tabstop =3D tabstop;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 static const int small_width =3D 24;<=
br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc.caret_max_width =3D small_width - =
4;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc.min_margin_width =3D test_left_mar=
gin - test_linenum_sep +<br>
&gt; 1;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dc.show_line_numbers_p =3D true;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 layout test_layout (&amp;dc, &amp;ric=
hloc, DK_ERROR);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_layout.print_line (1);<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* We have arranged things so that tw=
o columns will be<br>
&gt; printed before<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the caret.=C2=A0 If the tab res=
ults in more than one space, this<br>
&gt; should<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 produce two spaces in the outpu=
t; otherwise, it will be a<br>
&gt; single space<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 preceded by the opening quote b=
efore the tab character.=C2=A0 */<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *output1<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D &quot;=C2=A0=C2=A0 1 |=C2=A0=
=C2=A0 &#39; is a tab that occupies 1 byte and a variable<br>
&gt; number of &quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;display columns, st=
arting at column #103.\n&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 ^\n\n&quot;;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *output2<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=3D &quot;=C2=A0=C2=A0 1 | ` &#3=
9; is a tab that occupies 1 byte and a variable<br>
&gt; number of &quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;display columns, st=
arting at column #103.\n&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0=C2=A0 ^\n\n&quot;;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char *expected_output =3D (extr=
a_width[tabstop] ? output1<br>
&gt; : output2);<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_STREQ (expected_output, pp_for=
matted_text<br>
&gt; (dc.printer));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++<br>
&gt; + /* Verify that diagnostic_show_locus works sanely on<br>
&gt; UNKNOWN_LOCATION.=C2=A0 */<br>
&gt; + <br>
&gt; + static void<br>
&gt; +@@ -3854,6 +3994,27 @@ test_one_liner_labels_utf8 ()<br>
&gt; +=C2=A0=C2=A0 }<br>
&gt; + }<br>
&gt; + <br>
&gt; ++/* Make sure that colorization codes don&#39;t interrupt a multibyte=
<br>
&gt; ++=C2=A0=C2=A0 sequence, which would corrupt it.=C2=A0 */<br>
&gt; ++static void<br>
&gt; ++test_one_liner_colorized_utf8 ()<br>
&gt; ++{<br>
&gt; ++=C2=A0 test_diagnostic_context dc;<br>
&gt; ++=C2=A0 dc.colorize_source_p =3D true;<br>
&gt; ++=C2=A0 diagnostic_color_init (&amp;dc, DIAGNOSTICS_COLOR_YES);<br>
&gt; ++=C2=A0 const location_t pi =3D linemap_position_for_column (line_tab=
le,<br>
&gt; 12);<br>
&gt; ++=C2=A0 rich_location richloc (line_table, pi);<br>
&gt; ++=C2=A0 diagnostic_show_locus (&amp;dc, &amp;richloc, DK_ERROR);<br>
&gt; ++<br>
&gt; ++=C2=A0 /* In order to avoid having the test depend on exactly how th=
e<br>
&gt; colorization<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 was effected, just confirm there are two pi=
 characters in the<br>
&gt; output.=C2=A0 */<br>
&gt; ++=C2=A0 const char *result =3D pp_formatted_text (dc.printer);<br>
&gt; ++=C2=A0 const char *null_term =3D result + strlen (result);<br>
&gt; ++=C2=A0 const char *first_pi =3D strstr (result, &quot;\xcf\x80&quot;=
);<br>
&gt; ++=C2=A0 ASSERT_TRUE (first_pi &amp;&amp; first_pi &lt;=3D null_term -=
 2);<br>
&gt; ++=C2=A0 ASSERT_STR_CONTAINS (first_pi + 2, &quot;\xcf\x80&quot;);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + /* Run the various one-liner tests.=C2=A0 */<br>
&gt; + <br>
&gt; + static void<br>
&gt; +@@ -3884,8 +4045,10 @@ test_diagnostic_show_locus_one_liner_utf<br>
&gt; +=C2=A0=C2=A0 ASSERT_EQ (31, LOCATION_COLUMN (line_end));<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 char_span lspan =3D location_get_source_line (tmp.get_fi=
lename (),<br>
&gt; 1);<br>
&gt; +-=C2=A0 ASSERT_EQ (25, cpp_display_width (lspan.get_buffer (),<br>
&gt; lspan.length ()));<br>
&gt; +-=C2=A0 ASSERT_EQ (25, location_compute_display_column (expand_locati=
on<br>
&gt; (line_end)));<br>
&gt; ++=C2=A0 ASSERT_EQ (25, cpp_display_width (lspan.get_buffer (),<br>
&gt; lspan.length (),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def_tabstop));<br=
>
&gt; ++=C2=A0 ASSERT_EQ (25, location_compute_display_column (expand_locati=
on<br>
&gt; (line_end),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 def_tabs=
top));<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 test_one_liner_simple_caret_utf8 ();<br>
&gt; +=C2=A0=C2=A0 test_one_liner_caret_and_range_utf8 ();<br>
&gt; +@@ -3900,6 +4063,7 @@ test_diagnostic_show_locus_one_liner_utf<br>
&gt; +=C2=A0=C2=A0 test_one_liner_many_fixits_1_utf8 ();<br>
&gt; +=C2=A0=C2=A0 test_one_liner_many_fixits_2_utf8 ();<br>
&gt; +=C2=A0=C2=A0 test_one_liner_labels_utf8 ();<br>
&gt; ++=C2=A0 test_one_liner_colorized_utf8 ();<br>
&gt; + }<br>
&gt; + <br>
&gt; + /* Verify that gcc_rich_location::add_location_if_nearby works.=C2=
=A0 */<br>
&gt; +@@ -4272,25 +4436,28 @@ test_overlapped_fixit_printing (const li<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 /* Unit-test the line_corrections machinery.=
=C2=A0 */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_EQ (3, richloc.get_num_fixit_hints ()=
);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const fixit_hint *hint_0 =3D richloc.get_fix=
it_hint (0);<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (12, 12), get_affected_ra=
nge (hint_0,<br>
&gt; CU_BYTES));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (12, 12),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 get_affected_range (hint_0,<br>
&gt; CU_DISPLAY_COLS));<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (12, 22), get_printed_col=
umns<br>
&gt; (hint_0));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_0, CU_BYTES));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (12, 12),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_0, CU_DISPLAY_COLS));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (12, 22), get_printed_col=
umns (&amp;dc,<br>
&gt; hint_0));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const fixit_hint *hint_1 =3D richloc.get_fix=
it_hint (1);<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (18, 18), get_affected_ra=
nge (hint_1,<br>
&gt; CU_BYTES));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (18, 18),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 get_affected_range (hint_1,<br>
&gt; CU_DISPLAY_COLS));<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (18, 20), get_printed_col=
umns<br>
&gt; (hint_1));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_1, CU_BYTES));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (18, 18),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_1, CU_DISPLAY_COLS));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (18, 20), get_printed_col=
umns (&amp;dc,<br>
&gt; hint_1));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const fixit_hint *hint_2 =3D richloc.get_fix=
it_hint (2);<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (29, 28), get_affected_ra=
nge (hint_2,<br>
&gt; CU_BYTES));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (29, 28),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 get_affected_range (hint_2,<br>
&gt; CU_DISPLAY_COLS));<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (29, 29), get_printed_col=
umns<br>
&gt; (hint_2));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_2, CU_BYTES));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (29, 28),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_2, CU_DISPLAY_COLS));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (29, 29), get_printed_col=
umns (&amp;dc,<br>
&gt; hint_2));<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 /* Add each hint in turn to a line_correctio=
ns instance,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and verify that they are c=
onsolidated into one correction<br>
&gt; instance<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as expected.=C2=A0 */<br>
&gt; +-=C2=A0=C2=A0=C2=A0 line_corrections lc (tmp.get_filename (), 1);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 line_corrections lc (&amp;dc, tmp.get_filename ()=
, 1);<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 /* The first replace hint by itself.=C2=A0 *=
/<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 lc.add_hint (hint_0);<br>
&gt; +@@ -4484,25 +4651,28 @@ test_overlapped_fixit_printing_utf8 (con<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 /* Unit-test the line_corrections machinery.=
=C2=A0 */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_EQ (3, richloc.get_num_fixit_hints ()=
);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const fixit_hint *hint_0 =3D richloc.get_fix=
it_hint (0);<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (14, 14), get_affected_ra=
nge (hint_0,<br>
&gt; CU_BYTES));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (14, 14),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_0, CU_BYTES));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (12, 12),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 get_affected_range (hint_0,<br>
&gt; CU_DISPLAY_COLS));<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (12, 22), get_printed_col=
umns<br>
&gt; (hint_0));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_0, CU_DISPLAY_COLS));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (12, 22), get_printed_col=
umns (&amp;dc,<br>
&gt; hint_0));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const fixit_hint *hint_1 =3D richloc.get_fix=
it_hint (1);<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (22, 22), get_affected_ra=
nge (hint_1,<br>
&gt; CU_BYTES));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (22, 22),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_1, CU_BYTES));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (18, 18),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 get_affected_range (hint_1,<br>
&gt; CU_DISPLAY_COLS));<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (18, 20), get_printed_col=
umns<br>
&gt; (hint_1));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_1, CU_DISPLAY_COLS));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (18, 20), get_printed_col=
umns (&amp;dc,<br>
&gt; hint_1));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const fixit_hint *hint_2 =3D richloc.get_fix=
it_hint (2);<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (35, 34), get_affected_ra=
nge (hint_2,<br>
&gt; CU_BYTES));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (35, 34),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_2, CU_BYTES));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (30, 29),<br>
&gt; +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 get_affected_range (hint_2,<br>
&gt; CU_DISPLAY_COLS));<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (30, 30), get_printed_col=
umns<br>
&gt; (hint_2));<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_2, CU_DISPLAY_COLS));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (30, 30), get_printed_col=
umns (&amp;dc,<br>
&gt; hint_2));<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 /* Add each hint in turn to a line_correctio=
ns instance,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 and verify that they are c=
onsolidated into one correction<br>
&gt; instance<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as expected.=C2=A0 */<br>
&gt; +-=C2=A0=C2=A0=C2=A0 line_corrections lc (tmp.get_filename (), 1);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 line_corrections lc (&amp;dc, tmp.get_filename ()=
, 1);<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 /* The first replace hint by itself.=C2=A0 *=
/<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 lc.add_hint (hint_0);<br>
&gt; +@@ -4689,6 +4859,8 @@ test_overlapped_fixit_printing_2 (const<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 /* Two insertions, in the wrong order.=C2=A0 */<br>
&gt; +=C2=A0=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0 test_diagnostic_context dc;<br>
&gt; ++<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 rich_location richloc (line_table, col_20);<=
br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 richloc.add_fixit_insert_before (col_23, &qu=
ot;{&quot;);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 richloc.add_fixit_insert_before (col_21, &qu=
ot;}&quot;);<br>
&gt; +@@ -4696,14 +4868,15 @@ test_overlapped_fixit_printing_2 (const<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 /* These fixits should be accepted; they can=
&#39;t be<br>
&gt; consolidated.=C2=A0 */<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_EQ (2, richloc.get_num_fixit_hints ()=
);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const fixit_hint *hint_0 =3D richloc.get_fix=
it_hint (0);<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (23, 22), get_affected_ra=
nge (hint_0,<br>
&gt; CU_BYTES));<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (23, 23), get_printed_col=
umns<br>
&gt; (hint_0));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (23, 22),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_0, CU_BYTES));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (23, 23), get_printed_col=
umns (&amp;dc,<br>
&gt; hint_0));<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 const fixit_hint *hint_1 =3D richloc.get_fix=
it_hint (1);<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (21, 20), get_affected_ra=
nge (hint_1,<br>
&gt; CU_BYTES));<br>
&gt; +-=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (21, 21), get_printed_col=
umns<br>
&gt; (hint_1));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (21, 20),<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 get_affected_range (&amp;dc, hint_1, CU_BYTES));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_EQ (column_range (21, 21), get_printed_col=
umns (&amp;dc,<br>
&gt; hint_1));<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 /* Verify that they&#39;re printed correctly=
.=C2=A0 */<br>
&gt; +-=C2=A0=C2=A0=C2=A0 test_diagnostic_context dc;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 diagnostic_show_locus (&amp;dc, &amp;richloc=
, DK_ERROR);<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 ASSERT_STREQ (&quot; int a5[][0][0] =3D { 1,=
 2 };\n&quot;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 ^\n&quot;<br>
&gt; +@@ -4955,6 +5128,65 @@ test_fixit_deletion_affecting_newline (c<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0pp_formatted_text (dc.printer));<br>
&gt; + }<br>
&gt; + <br>
&gt; ++static void<br>
&gt; ++test_tab_expansion (const line_table_case &amp;case_)<br>
&gt; ++{<br>
&gt; ++=C2=A0 /* Create a tempfile and write some text to it.=C2=A0 This ex=
ample<br>
&gt; uses a tabstop<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 of 8, as the column numbers attempt to indi=
cate:<br>
&gt; ++<br>
&gt; ++=C2=A0=C2=A0=C2=A0 .....................000.01111111111.22222333333=
=C2=A0 display<br>
&gt; ++=C2=A0=C2=A0=C2=A0 .....................123.90123456789.56789012345=
=C2=A0 columns=C2=A0 */<br>
&gt; ++=C2=A0 const char *content =3D &quot;=C2=A0 \t=C2=A0=C2=A0 This: `\t=
&#39; is a tab.\n&quot;;<br>
&gt; ++=C2=A0 /* ....................000 00000011111 11111222222=C2=A0 byte=
<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 ....................123 45678901234 5678901=
2345=C2=A0 columns=C2=A0 */<br>
&gt; ++<br>
&gt; ++=C2=A0 const int tabstop =3D 8;<br>
&gt; ++=C2=A0 const int first_non_ws_byte_col =3D 7;<br>
&gt; ++=C2=A0 const int right_quote_byte_col =3D 15;<br>
&gt; ++=C2=A0 const int last_byte_col =3D 25;<br>
&gt; ++=C2=A0 ASSERT_EQ (35, cpp_display_width (content, last_byte_col,<br>
&gt; tabstop));<br>
&gt; ++<br>
&gt; ++=C2=A0 temp_source_file tmp (SELFTEST_LOCATION, &quot;.c&quot;, cont=
ent);<br>
&gt; ++=C2=A0 line_table_test ltt (case_);<br>
&gt; ++=C2=A0 linemap_add (line_table, LC_ENTER, false, tmp.get_filename ()=
,<br>
&gt; 1);<br>
&gt; ++<br>
&gt; ++=C2=A0 /* Don&#39;t attempt to run the tests if column data might be=
<br>
&gt; unavailable.=C2=A0 */<br>
&gt; ++=C2=A0 location_t line_end =3D linemap_position_for_column (line_tab=
le,<br>
&gt; last_byte_col);<br>
&gt; ++=C2=A0 if (line_end &gt; LINE_MAP_MAX_LOCATION_WITH_COLS)<br>
&gt; ++=C2=A0=C2=A0=C2=A0 return;<br>
&gt; ++<br>
&gt; ++=C2=A0 /* Check that the leading whitespace with mixed tabs and spac=
es<br>
&gt; is expanded<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 into 11 spaces.=C2=A0 Recall that print_lin=
e() also puts one space<br>
&gt; before<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 everything too.=C2=A0 */<br>
&gt; ++=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0 test_diagnostic_context dc;<br>
&gt; ++=C2=A0=C2=A0=C2=A0 dc.tabstop =3D tabstop;<br>
&gt; ++=C2=A0=C2=A0=C2=A0 rich_location richloc (line_table,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 linemap_position_for_column (line_table,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0first_non_ws_<br>
&gt; byte_col));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 layout test_layout (&amp;dc, &amp;richloc, DK_ERR=
OR);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 test_layout.print_line (1);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_STREQ (&quot;=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This: `=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &#39; is a tab.\n&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &quot;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ^\n&quot;,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pp_formatted_text (dc.printer));<br>
&gt; ++=C2=A0 }<br>
&gt; ++<br>
&gt; ++=C2=A0 /* Confirm the display width was tracked correctly across the=
<br>
&gt; internal tab<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0 as well.=C2=A0 */<br>
&gt; ++=C2=A0 {<br>
&gt; ++=C2=A0=C2=A0=C2=A0 test_diagnostic_context dc;<br>
&gt; ++=C2=A0=C2=A0=C2=A0 dc.tabstop =3D tabstop;<br>
&gt; ++=C2=A0=C2=A0=C2=A0 rich_location richloc (line_table,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 linemap_position_for_column (line_table,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0right_quote_b<br>
&gt; yte_col));<br>
&gt; ++=C2=A0=C2=A0=C2=A0 layout test_layout (&amp;dc, &amp;richloc, DK_ERR=
OR);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 test_layout.print_line (1);<br>
&gt; ++=C2=A0=C2=A0=C2=A0 ASSERT_STREQ (&quot;=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This: `=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 &#39; is a tab.\n&quot;<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &quot;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^\n&quot;,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 pp_formatted_text (dc.printer));<br>
&gt; ++=C2=A0 }<br>
&gt; ++}<br>
&gt; ++<br>
&gt; + /* Verify that line numbers are correctly printed for the case of<br=
>
&gt; +=C2=A0=C2=A0=C2=A0 a multiline range in which the width of the line n=
umbers changes<br>
&gt; +=C2=A0=C2=A0=C2=A0 (e.g. from &quot;9&quot; to &quot;10&quot;).=C2=A0=
 */<br>
&gt; +@@ -5012,6 +5244,7 @@ diagnostic_show_locus_c_tests ()<br>
&gt; +=C2=A0=C2=A0 test_layout_range_for_multiple_lines ();<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 for_each_line_table_case (test_layout_x_offset_display_u=
tf8);<br>
&gt; ++=C2=A0 for_each_line_table_case (test_layout_x_offset_display_tab);<=
br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 test_get_line_bytes_without_trailing_whitespace ();<br>
&gt; + <br>
&gt; +@@ -5029,6 +5262,7 @@ diagnostic_show_locus_c_tests ()<br>
&gt; +=C2=A0=C2=A0 for_each_line_table_case<br>
&gt; (test_fixit_insert_containing_newline_2);<br>
&gt; +=C2=A0=C2=A0 for_each_line_table_case (test_fixit_replace_containing_=
newline);<br>
&gt; +=C2=A0=C2=A0 for_each_line_table_case (test_fixit_deletion_affecting_=
newline);<br>
&gt; ++=C2=A0 for_each_line_table_case (test_tab_expansion);<br>
&gt; + <br>
&gt; +=C2=A0=C2=A0 test_line_numbers_multiline_range ();<br>
&gt; + }<br>
&gt; +diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi<br>
&gt; +--- a/gcc/doc/invoke.texi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02021-12-=
24 20:23:46.876739587 -0800<br>
&gt; ++++ b/gcc/doc/invoke.texi=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A02021-12-=
25 01:20:53.487636494 -0800<br>
&gt; +@@ -293,7 +293,9 @@ Objective-C and Objective-C++ Dialects}.<br>
&gt; + -fdiagnostics-show-template-tree=C2=A0 -fno-elide-type @gol<br>
&gt; +<br>
&gt; -fdiagnostics-path-format=3D@r{[}none@r{|}separate-events@r{|}inline-e=
vents@r{<br>
&gt; ]} @gol<br>
&gt; + -fdiagnostics-show-path-depths @gol<br>
&gt; +--fno-show-column}<br>
&gt; ++-fno-show-column @gol<br>
&gt; ++-fdiagnostics-column-unit=3D@r{[}display@r{|}byte@r{]} @gol<br>
&gt; ++-fdiagnostics-column-origin=3D@var{origin}}<br>
&gt; + <br>
&gt; + @item Warning Options<br>
&gt; + @xref{Warning Options,,Options to Request or Suppress Warnings}.<br>
&gt; +@@ -4424,6 +4426,31 @@ Do not print column numbers in diagnosti<br>
&gt; + diagnostics are being scanned by a program that does not understand<=
br>
&gt; the<br>
&gt; + column numbers, such as @command{dejagnu}.<br>
&gt; + <br>
&gt; ++@item -fdiagnostics-column-unit=3D@var{UNIT}<br>
&gt; ++@opindex fdiagnostics-column-unit<br>
&gt; ++Select the units for the column number.=C2=A0 This affects tradition=
al<br>
&gt; diagnostics<br>
&gt; ++(in the absence of @option{-fno-show-column}), as well as JSON<br>
&gt; format<br>
&gt; ++diagnostics if requested.<br>
&gt; ++<br>
&gt; ++The default @var{UNIT}, @samp{display}, considers the number of<br>
&gt; display<br>
&gt; ++columns occupied by each character.=C2=A0 This may be larger than th=
e<br>
&gt; number<br>
&gt; ++of bytes required to encode the character, in the case of tab<br>
&gt; ++characters, or it may be smaller, in the case of multibyte<br>
&gt; characters.<br>
&gt; ++For example, the character ``GREEK SMALL LETTER PI (U+03C0)&#39;&#39=
;<br>
&gt; occupies one<br>
&gt; ++display column, and its UTF-8 encoding requires two bytes; the<br>
&gt; character<br>
&gt; ++``SLIGHTLY SMILING FACE (U+1F642)&#39;&#39; occupies two display col=
umns,<br>
&gt; and<br>
&gt; ++its UTF-8 encoding requires four bytes.<br>
&gt; ++<br>
&gt; ++Setting @var{UNIT} to @samp{byte} changes the column number to the<b=
r>
&gt; raw byte<br>
&gt; ++count in all cases, as was traditionally output by GCC prior to<br>
&gt; version 11.1.0.<br>
&gt; ++<br>
&gt; ++@item -fdiagnostics-column-origin=3D@var{ORIGIN}<br>
&gt; ++@opindex fdiagnostics-column-origin<br>
&gt; ++Select the origin for column numbers, i.e. the column number<br>
&gt; assigned to the<br>
&gt; ++first column.=C2=A0 The default value of 1 corresponds to traditiona=
l<br>
&gt; GCC<br>
&gt; ++behavior and to the GNU style guide.=C2=A0 Some utilities may perfor=
m<br>
&gt; better with an<br>
&gt; ++origin of 0; any non-negative value may be specified.<br>
&gt; ++<br>
&gt; + @item -fdiagnostics-format=3D@var{FORMAT}<br>
&gt; + @opindex fdiagnostics-format<br>
&gt; + Select a different format for printing diagnostics.<br>
&gt; +@@ -4459,11 +4486,15 @@ might be printed in JSON form (after for<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;locations&quot=
;: [<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 @{<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;caret&quot;: @{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;display-column&quot;: 3,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;byte-column&quot;: 3,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;column&quot;: 3,<=
br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;file&quot;: &quot=
;misleading-indentation.c&quot;,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;line&quot;: 15<br=
>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 @},<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;finish&quot;: @{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;display-column&quot;: 4,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;byte-column&quot;: 4,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;column&quot;: 4,<=
br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;file&quot;: &quot=
;misleading-indentation.c&quot;,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;line&quot;: 15<br=
>
&gt; +@@ -4479,6 +4510,8 @@ might be printed in JSON form (after for<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;locations&quot;: [<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 @{<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 &quot;caret&quot;: @{<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &quot;display-column&quot;: 5,<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 &quot;byte-column&quot;: 5,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &quot;column&quot;: 5,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &quot;file&quot;: &quot;misleading-indentation.c&q=
uot;,<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 &quot;line&quot;: 17<br>
&gt; +@@ -4488,6 +4521,7 @@ might be printed in JSON form (after for<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 &quot;message&quot;: &quot;...this statement, b=
ut the latter is<br>
&gt; @dots{}&quot;<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 @}<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]<br>
&gt; ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0&quot;column-origin&quot;: 1,<br=
>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 @},<br>
&gt; +=C2=A0=C2=A0=C2=A0=C2=A0 @dots{}<br>
&gt; + ]<br>
&gt; +@@ -4500,10 +4534,34 @@ A diagnostic has a @code{kind}.=C2=A0 If this=
<br>
&gt; + an @code{option} key describing the command-line option controlling<=
br>
&gt; the<br>
&gt; + warning.<br>
&gt; + <br>
&gt; +-A diagnostic can contain zero or more locations.=C2=A0 Each location=
 has<br>
&gt; up<br>
&gt; +-to three positions within it: a @code{caret} position and optional<b=
r>
&gt; +-@code{start} and @code{finish} positions.=C2=A0 A location can also =
have<br>
&gt; +-an optional @code{label} string.=C2=A0 For example, this error:<br>
&gt; ++A diagnostic can contain zero or more locations.=C2=A0 Each location=
 has<br>
&gt; </blockquote></div></div>

--0000000000009753d105d47474c3--

