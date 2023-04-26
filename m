Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E41C77B78
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 18:43:17 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.1042.1682534595619582055
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 11:43:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YZBBdkNs;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.44, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5052caa1e32so13247750a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 11:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682534594; x=1685126594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3qQdoo55ZfDQ6y1BVJsCLNiXqGPp961vdUesh1xi30=;
        b=YZBBdkNszzcdsDSohBl0640u/H3IrVpBAVHgeSl12KfT7YJuo6B5Zqn/HqupllwGkg
         ivo+s4ujXYzOYsM84LeyqrnyiWKvOMjpwc9XcKPlpzXzZcNre/Mtiji0uClvk6Uiaq/B
         CSRQ8MglasK27QAhF3eNnGt1sjUDfTtMZ65kOnS7u9i2kVipV5+JYvnh3fK5U0ecowPy
         UGgChxhqv5q5k7JUP43hBT9V+wt00G9YTV0pfWDKG/3zNKUcMxjc7yMAYyGKPVJPOCvm
         T6Ln+z2Cntf4dv9xZpTRpgDMJPBmcLz0C/XCxt3jGDOU7ulGVr844Za/0ymBT+k2LyVN
         vasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682534594; x=1685126594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3qQdoo55ZfDQ6y1BVJsCLNiXqGPp961vdUesh1xi30=;
        b=gspAFdQ1dF+85KQERFnCEt3TWvJKLaYTUEcWqOlEXzPQuGOqfeWZ2Ms8DLTyGOe0Gv
         O1cW+j/Bt6Nt7uzUR2+IK8JNAHwbh8YY8bKsseWHl6wnV69L6DmcGn3z01ecEsofxKOj
         xgR4m+89nf1BRgj5w7IYm5Q87cQ2drBJzMACoHTyeDuLi4dzQfnWE9PppWllThUV4/Al
         ZJOlYHpit+/jIni+9PLD1g8sePgWTtFa4MQIgAbz5XF1Fhm0MhvZzaa3E+jHWZpr660r
         IPoC/SWqvABBGusJV3UR0CDa0YgiUT2dMvhpkDsIgJ3OLFrwMTWsiQ1AtTfRx+eWO3Ph
         r3tw==
X-Gm-Message-State: AAQBX9dir3uFAKJsY4WDrczNBF0nWLjZAwfip0ZpxalMcnUsTjD2Pfa4
	knTaovVhJr7z8HkiVGdRtZJ9uD7z1dri1m2004luIw==
X-Google-Smtp-Source: AKy350a0yT5l56+U4Z7m28I+AeE2DEt2i1I8kStJv3UmB+gvsWYiDipvLBOOnUc3pFdMBWvc7Ie/SnDuoLsSaWCAKn8=
X-Received: by 2002:aa7:d5d4:0:b0:504:ba4f:3450 with SMTP id
 d20-20020aa7d5d4000000b00504ba4f3450mr16398507eds.30.1682534593461; Wed, 26
 Apr 2023 11:43:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230426180550.22949-1-alexyao1@meraki.com> <20230426180550.22949-2-alexyao1@meraki.com>
In-Reply-To: <20230426180550.22949-2-alexyao1@meraki.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 26 Apr 2023 08:43:02 -1000
Message-ID: <CAOSpxdZBA91_j9LqLwYzC1iXwAydkyE5tLd8p=-kz6mgyMtptQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 2/3] lcov: Upgrade 1.14 -> 1.16
To: alexyao1@meraki.com
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 18:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180455

I can take version updates in an LTS branch if they contain only bug
and security fixes.

Can you confirm that this is the case for the 1.14 -> 1.15 -> 1.16
version bumps?

In the future including this information in the commit message will
speed things along!

Thanks!

Steve

On Wed, Apr 26, 2023 at 8:06=E2=80=AFAM alexyao1 via lists.openembedded.org
<alexyao1=3Dmeraki.com@lists.openembedded.org> wrote:
>
> From: Alex Yao <alexyao1@meraki.com>
>
> This upgrades lcov to 1.16 and removes backported patches which are
> now included since 1.15. This also removes dependencies added from
> backported patches since the new version removes the need for these
> dependencies.
>
> Signed-off-by: Alex Yao <alexyao1@meraki.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...Add-intermediate-text-format-support.patch | 898 ------------------
>  ...Add-intermediate-JSON-format-support.patch | 247 -----
>  .../lcov/{lcov_1.14.bb =3D> lcov_1.16.bb}       |  16 +-
>  3 files changed, 4 insertions(+), 1157 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/lcov/files/0001-geninfo-Add-i=
ntermediate-text-format-support.patch
>  delete mode 100644 meta-oe/recipes-support/lcov/files/0002-geninfo-Add-i=
ntermediate-JSON-format-support.patch
>  rename meta-oe/recipes-support/lcov/{lcov_1.14.bb =3D> lcov_1.16.bb} (78=
%)
>
> diff --git a/meta-oe/recipes-support/lcov/files/0001-geninfo-Add-intermed=
iate-text-format-support.patch b/meta-oe/recipes-support/lcov/files/0001-ge=
ninfo-Add-intermediate-text-format-support.patch
> deleted file mode 100644
> index 9ac0770f96..0000000000
> --- a/meta-oe/recipes-support/lcov/files/0001-geninfo-Add-intermediate-te=
xt-format-support.patch
> +++ /dev/null
> @@ -1,898 +0,0 @@
> -From ec3e1f411c332cbc2f2bc7ab7e2175ebf918b37a Mon Sep 17 00:00:00 2001
> -From: Peter Oberparleiter <oberpar@linux.ibm.com>
> -Date: Fri, 24 May 2019 16:56:52 +0200
> -Subject: [PATCH 1/2] geninfo: Add intermediate text format support
> -
> -This change adds support for parsing the output of gcov's intermediate
> -text file format as implemented by GCC versions 5 to 8.  The use of the
> -gcov intermediate format should increase processing speed. It also
> -provides branch coverage data when using the --initial command line
> -option.
> -
> -Users can control whether geninfo uses the intermediate format via the
> -geninfo_intermediate configuration file option. Valid values are:
> -
> -     0: Use normal text format
> -     1: Use intermediate format
> -  auto: Use intermediate format if available. This is the default.
> -
> -Signed-off-by: Peter Oberparleiter <oberpar@linux.ibm.com>
> ----
> - bin/geninfo  | 567 ++++++++++++++++++++++++++++++++++++++++++++-------
> - lcovrc       |   3 +
> - man/lcovrc.5 |  24 +++
> - 3 files changed, 521 insertions(+), 73 deletions(-)
> -
> -Upstream-Status: Backport
> -Download URL: https://github.com/linux-test-project/lcov/commit/ebfeb3e1=
79e450c69c3532f98cd5ea1fbf6ccba7
> -
> -diff --git a/bin/geninfo b/bin/geninfo
> -index f41eaec..0276666 100755
> ---- a/bin/geninfo
> -+++ b/bin/geninfo
> -@@ -54,6 +54,8 @@ use warnings;
> - use File::Basename;
> - use File::Spec::Functions qw /abs2rel catdir file_name_is_absolute spli=
tdir
> -                             splitpath catpath/;
> -+use File::Temp qw(tempfile tempdir);
> -+use File::Copy qw(copy);
> - use Getopt::Long;
> - use Digest::MD5 qw(md5_base64);
> - use Cwd qw/abs_path/;
> -@@ -163,13 +165,13 @@ sub solve_relative_path($$);
> - sub read_gcov_header($);
> - sub read_gcov_file($);
> - sub info(@);
> -+sub process_intermediate($$$);
> - sub map_llvm_version($);
> - sub version_to_str($);
> - sub get_gcov_version();
> - sub system_no_output($@);
> - sub read_config($);
> - sub apply_config($);
> --sub get_exclusion_data($);
> - sub apply_exclusion_data($$);
> - sub process_graphfile($$);
> - sub filter_fn_name($);
> -@@ -264,6 +266,8 @@ our $gcno_split_crc;
> - our $func_coverage =3D 1;
> - our $br_coverage =3D 0;
> - our $rc_auto_base =3D 1;
> -+our $rc_intermediate =3D "auto";
> -+our $intermediate;
> - our $excl_line =3D "LCOV_EXCL_LINE";
> - our $excl_br_line =3D "LCOV_EXCL_BR_LINE";
> -
> -@@ -331,6 +335,7 @@ if ($config || %opt_rc)
> -               "geninfo_compat"                =3D> \$opt_compat,
> -               "geninfo_adjust_src_path"       =3D> \$rc_adjust_src_path=
,
> -               "geninfo_auto_base"             =3D> \$rc_auto_base,
> -+              "geninfo_intermediate"          =3D> \$rc_intermediate,
> -               "lcov_function_coverage"        =3D> \$func_coverage,
> -               "lcov_branch_coverage"          =3D> \$br_coverage,
> -               "lcov_excl_line"                =3D> \$excl_line,
> -@@ -460,15 +465,38 @@ if (system_no_output(3, $gcov_tool, "--help") =3D=
=3D -1)
> - }
> -
> - ($gcov_version, $gcov_version_string) =3D get_gcov_version();
> -+$gcov_caps =3D get_gcov_capabilities();
> -+
> -+# Determine intermediate mode
> -+if ($rc_intermediate eq "0") {
> -+      $intermediate =3D 0;
> -+} elsif ($rc_intermediate eq "1") {
> -+      $intermediate =3D 1;
> -+} elsif (lc($rc_intermediate) eq "auto") {
> -+      # Use intermediate format if supported by gcov
> -+      $intermediate =3D $gcov_caps->{'intermediate-format'} ? 1 : 0;
> -+} else {
> -+      die("ERROR: invalid value for geninfo_intermediate: ".
> -+          "'$rc_intermediate'\n");
> -+}
> -+
> -+if ($intermediate) {
> -+      info("Using intermediate gcov format\n");
> -+      if ($opt_derive_func_data) {
> -+              warn("WARNING: --derive-func-data is not compatible with =
".
> -+                   "intermediate format - ignoring\n");
> -+              $opt_derive_func_data =3D 0;
> -+      }
> -+}
> -
> - # Determine gcov options
> --$gcov_caps =3D get_gcov_capabilities();
> - push(@gcov_options, "-b") if ($gcov_caps->{'branch-probabilities'} &&
> -                             ($br_coverage || $func_coverage));
> - push(@gcov_options, "-c") if ($gcov_caps->{'branch-counts'} &&
> -                             $br_coverage);
> - push(@gcov_options, "-a") if ($gcov_caps->{'all-blocks'} &&
> --                            $opt_gcov_all_blocks && $br_coverage);
> -+                            $opt_gcov_all_blocks && $br_coverage &&
> -+                            !$intermediate);
> - if ($gcov_caps->{'hash-filenames'})
> - {
> -       push(@gcov_options, "-x");
> -@@ -599,7 +627,7 @@ foreach my $entry (@data_directory) {
> -       gen_info($entry);
> - }
> -
> --if ($initial && $br_coverage) {
> -+if ($initial && $br_coverage && !$intermediate) {
> -       warn("Note: --initial does not generate branch coverage ".
> -            "data\n");
> - }
> -@@ -768,6 +796,7 @@ sub gen_info($)
> -       my $prefix;
> -       my $type;
> -       my $ext;
> -+      my $tempdir;
> -
> -       if ($initial) {
> -               $type =3D "graph";
> -@@ -798,16 +827,22 @@ sub gen_info($)
> -               $prefix =3D "";
> -       }
> -
> -+      $tempdir =3D tempdir(CLEANUP =3D> 1);
> -+
> -       # Process all files in list
> -       foreach $file (@file_list) {
> -               # Process file
> --              if ($initial) {
> -+              if ($intermediate) {
> -+                      process_intermediate($file, $prefix, $tempdir);
> -+              } elsif ($initial) {
> -                       process_graphfile($file, $prefix);
> -               } else {
> -                       process_dafile($file, $prefix);
> -               }
> -       }
> -
> -+      unlink($tempdir);
> -+
> -       # Report whether files were excluded.
> -       if (%excluded_files) {
> -               info("Excluded data for %d files due to include/exclude o=
ptions\n",
> -@@ -1058,10 +1093,12 @@ sub process_dafile($$)
> -
> -       # Try to find base directory automatically if requested by user
> -       if ($rc_auto_base) {
> --              $base_dir =3D find_base_from_graph($base_dir, $instr, $gr=
aph);
> -+              $base_dir =3D find_base_from_source($base_dir,
> -+                      [ keys(%{$instr}), keys(%{$graph}) ]);
> -       }
> -
> --      ($instr, $graph) =3D adjust_graph_filenames($base_dir, $instr, $g=
raph);
> -+      adjust_source_filenames($instr, $base_dir);
> -+      adjust_source_filenames($graph, $base_dir);
> -
> -       # Set $object_dir to real location of object files. This may diff=
er
> -       # from $da_dir if the graph file is just a link to the "real" obj=
ect
> -@@ -2017,6 +2054,299 @@ sub read_gcov_file($)
> - }
> -
> -
> -+#
> -+# read_intermediate_text(gcov_filename, data)
> -+#
> -+# Read gcov intermediate text format in GCOV_FILENAME and add the resul=
ting
> -+# data to DATA in the following format:
> -+#
> -+# data:      source_filename -> file_data
> -+# file_data: concatenated lines of intermediate text data
> -+#
> -+
> -+sub read_intermediate_text($$)
> -+{
> -+      my ($gcov_filename, $data) =3D @_;
> -+      my $fd;
> -+      my $filename;
> -+
> -+      open($fd, "<", $gcov_filename) or
> -+              die("ERROR: Could not read $gcov_filename: $!\n");
> -+      while (my $line =3D <$fd>) {
> -+              if ($line =3D~ /^file:(.*)$/) {
> -+                      $filename =3D $1;
> -+                      chomp($filename);
> -+              } elsif (defined($filename)) {
> -+                      $data->{$filename} .=3D $line;
> -+              }
> -+      }
> -+      close($fd);
> -+}
> -+
> -+
> -+#
> -+# intermediate_text_to_info(fd, data, srcdata)
> -+#
> -+# Write DATA in info format to file descriptor FD.
> -+#
> -+# data:      filename -> file_data:
> -+# file_data: concatenated lines of intermediate text data
> -+#
> -+# srcdata:   filename -> [ excl, brexcl, checksums ]
> -+# excl:      lineno -> 1 for all lines for which to exclude all data
> -+# brexcl:    lineno -> 1 for all lines for which to exclude branch data
> -+# checksums: lineno -> source code checksum
> -+#
> -+# Note: To simplify processing, gcov data is not combined here, that is=
 counts
> -+#       that appear multiple times for the same lines/branches are not =
added.
> -+#       This is done by lcov/genhtml when reading the data files.
> -+#
> -+
> -+sub intermediate_text_to_info($$$)
> -+{
> -+      my ($fd, $data, $srcdata) =3D @_;
> -+      my $branch_num =3D 0;
> -+      my $c;
> -+
> -+      return if (!%{$data});
> -+
> -+      print($fd "TN:$test_name\n");
> -+      for my $filename (keys(%{$data})) {
> -+              my ($excl, $brexcl, $checksums);
> -+
> -+              if (defined($srcdata->{$filename})) {
> -+                      ($excl, $brexcl, $checksums) =3D @{$srcdata->{$fi=
lename}};
> -+              }
> -+
> -+              print($fd "SF:$filename\n");
> -+              for my $line (split(/\n/, $data->{$filename})) {
> -+                      if ($line =3D~ /^lcount:(\d+),(\d+),?/) {
> -+                              # lcount:<line>,<count>
> -+                              # lcount:<line>,<count>,<has_unexecuted_b=
locks>
> -+                              if ($checksum && exists($checksums->{$1})=
) {
> -+                                      $c =3D ",".$checksums->{$1};
> -+                              } else {
> -+                                      $c =3D "";
> -+                              }
> -+                              print($fd "DA:$1,$2$c\n") if (!$excl->{$1=
});
> -+
> -+                              # Intermediate text format does not provi=
de
> -+                              # branch numbers, and the same branch may=
 appear
> -+                              # multiple times on the same line (e.g. i=
n
> -+                              # template instances). Synthesize a branc=
h
> -+                              # number based on the assumptions:
> -+                              # a) the order of branches is fixed acros=
s
> -+                              #    instances
> -+                              # b) an instance starts with an lcount li=
ne
> -+                              $branch_num =3D 0;
> -+                      } elsif ($line =3D~ /^function:(\d+),(\d+),([^,]+=
)$/) {
> -+                              next if (!$func_coverage || $excl->{$1});
> -+
> -+                              # function:<line>,<count>,<name>
> -+                              print($fd "FN:$1,$3\n");
> -+                              print($fd "FNDA:$2,$3\n");
> -+                      } elsif ($line =3D~ /^function:(\d+),\d+,(\d+),([=
^,]+)$/) {
> -+                              next if (!$func_coverage || $excl->{$1});
> -+
> -+                              # function:<start_line>,<end_line>,<count=
>,
> -+                              #          <name>
> -+                              print($fd "FN:$1,$3\n");
> -+                              print($fd "FNDA:$2,$3\n");
> -+                      } elsif ($line =3D~ /^branch:(\d+),(taken|nottake=
n|notexec)/) {
> -+                              next if (!$br_coverage || $excl->{$1} ||
> -+                                       $brexcl->{$1});
> -+
> -+                              # branch:<line>,taken|nottaken|notexec
> -+                              if ($2 eq "taken") {
> -+                                      $c =3D 1;
> -+                              } elsif ($2 eq "nottaken") {
> -+                                      $c =3D 0;
> -+                              } else {
> -+                                      $c =3D "-";
> -+                              }
> -+                              print($fd "BRDA:$1,0,$branch_num,$c\n");
> -+                              $branch_num++;
> -+                      }
> -+              }
> -+              print($fd "end_of_record\n");
> -+      }
> -+}
> -+
> -+
> -+sub get_output_fd($$)
> -+{
> -+      my ($outfile, $file) =3D @_;
> -+      my $fd;
> -+
> -+      if (!defined($outfile)) {
> -+              open($fd, ">", "$file.info") or
> -+                      die("ERROR: Cannot create file $file.info: $!\n")=
;
> -+      } elsif ($outfile eq "-") {
> -+              open($fd, ">&STDOUT") or
> -+                      die("ERROR: Cannot duplicate stdout: $!\n");
> -+      } else {
> -+              open($fd, ">>", $outfile) or
> -+                      die("ERROR: Cannot write to file $outfile: $!\n")=
;
> -+      }
> -+
> -+      return $fd;
> -+}
> -+
> -+
> -+#
> -+# print_gcov_warnings(stderr_file, is_graph, map)
> -+#
> -+# Print GCOV warnings in file STDERR_FILE to STDERR. If IS_GRAPH is non=
-zero,
> -+# suppress warnings about missing as these are expected. Replace keys f=
ound
> -+# in MAP with their values.
> -+#
> -+
> -+sub print_gcov_warnings($$$)
> -+{
> -+      my ($stderr_file, $is_graph, $map) =3D @_;
> -+      my $fd;
> -+
> -+      if (!open($fd, "<", $stderr_file)) {
> -+              warn("WARNING: Could not open GCOV stderr file ".
> -+                   "$stderr_file: $!\n");
> -+              return;
> -+      }
> -+      while (my $line =3D <$fd>) {
> -+              next if ($is_graph && $line =3D~ /cannot open data file/)=
;
> -+
> -+              for my $key (keys(%{$map})) {
> -+                      $line =3D~ s/\Q$key\E/$map->{$key}/g;
> -+              }
> -+
> -+              print(STDERR $line);
> -+      }
> -+      close($fd);
> -+}
> -+
> -+
> -+#
> -+# process_intermediate(file, dir, tempdir)
> -+#
> -+# Create output for a single file (either a data file or a graph file) =
using
> -+# gcov's intermediate option.
> -+#
> -+
> -+sub process_intermediate($$$)
> -+{
> -+      my ($file, $dir, $tempdir) =3D @_;
> -+      my ($fdir, $fbase, $fext);
> -+      my $data_file;
> -+      my $errmsg;
> -+      my %data;
> -+      my $fd;
> -+      my $base;
> -+      my $srcdata;
> -+      my $is_graph =3D 0;
> -+      my ($out, $err, $rc);
> -+
> -+      info("Processing %s\n", abs2rel($file, $dir));
> -+
> -+      $file =3D solve_relative_path($cwd, $file);
> -+      ($fdir, $fbase, $fext) =3D split_filename($file);
> -+
> -+      $is_graph =3D 1 if (".$fext" eq $graph_file_extension);
> -+
> -+      if ($is_graph) {
> -+              # Process graph file - copy to temp directory to prevent
> -+              # accidental processing of associated data file
> -+              $data_file =3D "$tempdir/$fbase$graph_file_extension";
> -+              if (!copy($file, $data_file)) {
> -+                      $errmsg =3D "ERROR: Could not copy file $file";
> -+                      goto err;
> -+              }
> -+      } else {
> -+              # Process data file in place
> -+              $data_file =3D $file;
> -+      }
> -+
> -+      # Change directory
> -+      if (!chdir($tempdir)) {
> -+              $errmsg =3D "Could not change to directory $tempdir: $!";
> -+              goto err;
> -+      }
> -+
> -+      # Run gcov on data file
> -+      ($out, $err, $rc) =3D system_no_output(1 + 2 + 4, $gcov_tool,
> -+                                           $data_file, @gcov_options, "=
-i");
> -+      defined($out) && unlink($out);
> -+      if (defined($err)) {
> -+              print_gcov_warnings($err, $is_graph, {
> -+                      $data_file =3D> $file,
> -+              });
> -+              unlink($err);
> -+      }
> -+      if ($rc) {
> -+              $errmsg =3D "GCOV failed for $file";
> -+              goto err;
> -+      }
> -+
> -+      if ($is_graph) {
> -+              # Remove graph file copy
> -+              unlink($data_file);
> -+      }
> -+
> -+      # Parse resulting file(s)
> -+      for my $gcov_filename (glob("*.gcov")) {
> -+              read_intermediate_text($gcov_filename, \%data);
> -+              unlink($gcov_filename);
> -+      }
> -+
> -+      if (!%data) {
> -+              warn("WARNING: GCOV did not produce any data for $file\n"=
);
> -+              return;
> -+      }
> -+
> -+      # Determine base directory
> -+      if (defined($base_directory)) {
> -+              $base =3D $base_directory;
> -+      } else {
> -+              $base =3D $fdir;
> -+
> -+              if (is_compat($COMPAT_MODE_LIBTOOL)) {
> -+                      # Avoid files from .libs dirs
> -+                      $base =3D~ s/\.libs$//;
> -+              }
> -+
> -+              # Try to find base directory automatically if requested b=
y user
> -+              if ($rc_auto_base) {
> -+                      $base =3D find_base_from_source($base, [ keys(%da=
ta) ]);
> -+              }
> -+      }
> -+
> -+      # Apply base file name to relative source files
> -+      adjust_source_filenames(\%data, $base);
> -+
> -+      # Remove excluded source files
> -+      filter_source_files(\%data);
> -+
> -+      # Get data on exclusion markers and checksums if requested
> -+      if (!$no_markers || $checksum) {
> -+              $srcdata =3D get_all_source_data(keys(%data));
> -+      }
> -+
> -+      # Generate output
> -+      $fd =3D get_output_fd($output_filename, $file);
> -+      intermediate_text_to_info($fd, \%data, $srcdata);
> -+      close($fd);
> -+
> -+      chdir($cwd);
> -+
> -+      return;
> -+
> -+err:
> -+      if ($ignore[$ERROR_GCOV]) {
> -+              warn("WARNING: $errmsg!\n");
> -+      } else {
> -+              die("ERROR: $errmsg!\n")
> -+      }
> -+}
> -+
> -+
> - # Map LLVM versions to the version of GCC gcov which they emulate.
> -
> - sub map_llvm_version($)
> -@@ -2151,8 +2481,12 @@ sub int_handler()
> - #
> - #   MODE & 1: suppress STDOUT
> - #   MODE & 2: suppress STDERR
> -+#   MODE & 4: redirect to temporary files instead of suppressing
> - #
> --# Return 0 on success, non-zero otherwise.
> -+# Return (stdout, stderr, rc):
> -+#    stdout: path to tempfile containing stdout or undef
> -+#    stderr: path to tempfile containing stderr or undef
> -+#    0 on success, non-zero otherwise
> - #
> -
> - sub system_no_output($@)
> -@@ -2161,14 +2495,31 @@ sub system_no_output($@)
> -       my $result;
> -       local *OLD_STDERR;
> -       local *OLD_STDOUT;
> -+      my $stdout_file;
> -+      my $stderr_file;
> -+      my $fd;
> -
> -       # Save old stdout and stderr handles
> -       ($mode & 1) && open(OLD_STDOUT, ">>&", "STDOUT");
> -       ($mode & 2) && open(OLD_STDERR, ">>&", "STDERR");
> -
> --      # Redirect to /dev/null
> --      ($mode & 1) && open(STDOUT, ">", "/dev/null");
> --      ($mode & 2) && open(STDERR, ">", "/dev/null");
> -+      if ($mode & 4) {
> -+              # Redirect to temporary files
> -+              if ($mode & 1) {
> -+                      ($fd, $stdout_file) =3D tempfile(UNLINK =3D> 1);
> -+                      open(STDOUT, ">", $stdout_file) || warn("$!\n");
> -+                      close($fd);
> -+              }
> -+              if ($mode & 2) {
> -+                      ($fd, $stderr_file) =3D tempfile(UNLINK =3D> 1);
> -+                      open(STDERR, ">", $stderr_file) || warn("$!\n");
> -+                      close($fd);
> -+              }
> -+      } else {
> -+              # Redirect to /dev/null
> -+              ($mode & 1) && open(STDOUT, ">", "/dev/null");
> -+              ($mode & 2) && open(STDERR, ">", "/dev/null");
> -+      }
> -
> -       debug("system(".join(' ', @_).")\n");
> -       system(@_);
> -@@ -2181,8 +2532,18 @@ sub system_no_output($@)
> -       # Restore old handles
> -       ($mode & 1) && open(STDOUT, ">>&", "OLD_STDOUT");
> -       ($mode & 2) && open(STDERR, ">>&", "OLD_STDERR");
> -+
> -+      # Remove empty output files
> -+      if (defined($stdout_file) && -z $stdout_file) {
> -+              unlink($stdout_file);
> -+              $stdout_file =3D undef;
> -+      }
> -+      if (defined($stderr_file) && -z $stderr_file) {
> -+              unlink($stderr_file);
> -+              $stderr_file =3D undef;
> -+      }
> -
> --      return $result;
> -+      return ($stdout_file, $stderr_file, $result);
> - }
> -
> -
> -@@ -2260,23 +2621,28 @@ sub apply_config($)
> -
> -
> - #
> --# get_exclusion_data(filename)
> -+# get_source_data(filename)
> - #
> --# Scan specified source code file for exclusion markers and return
> --#   linenumber -> 1
> --# for all lines which should be excluded.
> -+# Scan specified source code file for exclusion markers and checksums. =
Return
> -+#   ( excl, brexcl, checksums ) where
> -+#   excl:      lineno -> 1 for all lines for which to exclude all data
> -+#   brexcl:    lineno -> 1 for all lines for which to exclude branch da=
ta
> -+#   checksums: lineno -> source code checksum
> - #
> -
> --sub get_exclusion_data($)
> -+sub get_source_data($)
> - {
> -       my ($filename) =3D @_;
> -       my %list;
> -       my $flag =3D 0;
> -+      my %brdata;
> -+      my $brflag =3D 0;
> -+      my %checksums;
> -       local *HANDLE;
> -
> -       if (!open(HANDLE, "<", $filename)) {
> -               warn("WARNING: could not open $filename\n");
> --              return undef;
> -+              return;
> -       }
> -       while (<HANDLE>) {
> -               if (/$EXCL_STOP/) {
> -@@ -2287,14 +2653,62 @@ sub get_exclusion_data($)
> -               if (/$excl_line/ || $flag) {
> -                       $list{$.} =3D 1;
> -               }
> -+              if (/$EXCL_BR_STOP/) {
> -+                      $brflag =3D 0;
> -+              } elsif (/$EXCL_BR_START/) {
> -+                      $brflag =3D 1;
> -+              }
> -+              if (/$excl_br_line/ || $brflag) {
> -+                      $brdata{$.} =3D 1;
> -+              }
> -+              if ($checksum) {
> -+                      chomp();
> -+                      $checksums{$.} =3D md5_base64($_);
> -+              }
> -       }
> -       close(HANDLE);
> -
> --      if ($flag) {
> -+      if ($flag || $brflag) {
> -               warn("WARNING: unterminated exclusion section in $filenam=
e\n");
> -       }
> -
> --      return \%list;
> -+      return (\%list, \%brdata, \%checksums);
> -+}
> -+
> -+
> -+#
> -+# get_all_source_data(filenames)
> -+#
> -+# Scan specified source code files for exclusion markers and return
> -+#   filename -> [ excl, brexcl, checksums ]
> -+#   excl:      lineno -> 1 for all lines for which to exclude all data
> -+#   brexcl:    lineno -> 1 for all lines for which to exclude branch da=
ta
> -+#   checksums: lineno -> source code checksum
> -+#
> -+
> -+sub get_all_source_data(@)
> -+{
> -+      my @filenames =3D @_;
> -+      my %data;
> -+      my $failed =3D 0;
> -+
> -+      for my $filename (@filenames) {
> -+              my @d;
> -+              next if (exists($data{$filename}));
> -+
> -+              @d =3D get_source_data($filename);
> -+              if (@d) {
> -+                      $data{$filename} =3D [ @d ];
> -+              } else {
> -+                      $failed =3D 1;
> -+              }
> -+      }
> -+
> -+      if ($failed) {
> -+              warn("WARNING: some exclusion markers may be ignored\n");
> -+      }
> -+
> -+      return \%data;
> - }
> -
> -
> -@@ -2318,35 +2732,17 @@ sub apply_exclusion_data($$)
> - {
> -       my ($instr, $graph) =3D @_;
> -       my $filename;
> --      my %excl_data;
> --      my $excl_read_failed =3D 0;
> -+      my $excl_data;
> -
> --      # Collect exclusion marker data
> --      foreach $filename (sort_uniq_lex(keys(%{$graph}), keys(%{$instr})=
)) {
> --              my $excl =3D get_exclusion_data($filename);
> --
> --              # Skip and note if file could not be read
> --              if (!defined($excl)) {
> --                      $excl_read_failed =3D 1;
> --                      next;
> --              }
> --
> --              # Add to collection if there are markers
> --              $excl_data{$filename} =3D $excl if (keys(%{$excl}) > 0);
> --      }
> --
> --      # Warn if not all source files could be read
> --      if ($excl_read_failed) {
> --              warn("WARNING: some exclusion markers may be ignored\n");
> --      }
> -+      ($excl_data) =3D get_all_source_data(keys(%{$graph}), keys(%{$ins=
tr}));
> -
> -       # Skip if no markers were found
> --      return ($instr, $graph) if (keys(%excl_data) =3D=3D 0);
> -+      return ($instr, $graph) if (!%$excl_data);
> -
> -       # Apply exclusion marker data to graph
> --      foreach $filename (keys(%excl_data)) {
> -+      foreach $filename (keys(%$excl_data)) {
> -               my $function_data =3D $graph->{$filename};
> --              my $excl =3D $excl_data{$filename};
> -+              my $excl =3D $excl_data->{$filename}->[0];
> -               my $function;
> -
> -               next if (!defined($function_data));
> -@@ -2384,9 +2780,9 @@ sub apply_exclusion_data($$)
> -       }
> -
> -       # Apply exclusion marker data to instr
> --      foreach $filename (keys(%excl_data)) {
> -+      foreach $filename (keys(%$excl_data)) {
> -               my $line_data =3D $instr->{$filename};
> --              my $excl =3D $excl_data{$filename};
> -+              my $excl =3D $excl_data->{$filename}->[0];
> -               my $line;
> -               my @new_data;
> -
> -@@ -2468,10 +2864,12 @@ sub process_graphfile($$)
> -
> -       # Try to find base directory automatically if requested by user
> -       if ($rc_auto_base) {
> --              $base_dir =3D find_base_from_graph($base_dir, $instr, $gr=
aph);
> -+              $base_dir =3D find_base_from_source($base_dir,
> -+                      [ keys(%{$instr}), keys(%{$graph}) ]);
> -       }
> -
> --      ($instr, $graph) =3D adjust_graph_filenames($base_dir, $instr, $g=
raph);
> -+      adjust_source_filenames($instr, $base_dir);
> -+      adjust_source_filenames($graph, $base_dir);
> -
> -       if (!$no_markers) {
> -               # Apply exclusion marker data to graph file data
> -@@ -2767,11 +3165,11 @@ sub parent_dir($)
> - }
> -
> - #
> --# find_base_from_graph(base_dir, instr, graph)
> -+# find_base_from_source(base_dir, source_files)
> - #
> --# Try to determine the base directory of the graph file specified by IN=
STR
> --# and GRAPH. The base directory is the base for all relative filenames =
in
> --# the graph file. It is defined by the current working directory at tim=
e
> -+# Try to determine the base directory of the object file built from
> -+# SOURCE_FILES. The base directory is the base for all relative filenam=
es in
> -+# the gcov data. It is defined by the current working directory at time
> - # of compiling the source file.
> - #
> - # This function implements a heuristic which relies on the following
> -@@ -2781,16 +3179,16 @@ sub parent_dir($)
> - # - files by the same name are not present in multiple parent directori=
es
> - #
> -
> --sub find_base_from_graph($$$)
> -+sub find_base_from_source($$)
> - {
> --      my ($base_dir, $instr, $graph) =3D @_;
> -+      my ($base_dir, $source_files) =3D @_;
> -       my $old_base;
> -       my $best_miss;
> -       my $best_base;
> -       my %rel_files;
> -
> -       # Determine list of relative paths
> --      foreach my $filename (keys(%{$instr}), keys(%{$graph})) {
> -+      foreach my $filename (@$source_files) {
> -               next if (file_name_is_absolute($filename));
> -
> -               $rel_files{$filename} =3D 1;
> -@@ -2829,17 +3227,17 @@ sub find_base_from_graph($$$)
> - }
> -
> - #
> --# adjust_graph_filenames(base_dir, instr, graph)
> -+# adjust_source_filenames(hash, base_dir)
> - #
> --# Make relative paths in INSTR and GRAPH absolute and apply
> --# geninfo_adjust_src_path setting to graph file data.
> -+# Transform all keys of HASH to absolute form and apply requested
> -+# transformations.
> - #
> -
> --sub adjust_graph_filenames($$$)
> -+sub adjust_source_filenames($$$)
> - {
> --      my ($base_dir, $instr, $graph) =3D @_;
> -+      my ($hash, $base_dir) =3D @_;
> -
> --      foreach my $filename (keys(%{$instr})) {
> -+      foreach my $filename (keys(%{$hash})) {
> -               my $old_filename =3D $filename;
> -
> -               # Convert to absolute canonical form
> -@@ -2851,28 +3249,50 @@ sub adjust_graph_filenames($$$)
> -               }
> -
> -               if ($filename ne $old_filename) {
> --                      $instr->{$filename} =3D delete($instr->{$old_file=
name});
> -+                      $hash->{$filename} =3D delete($hash->{$old_filena=
me});
> -               }
> -       }
> -+}
> -
> --      foreach my $filename (keys(%{$graph})) {
> --              my $old_filename =3D $filename;
> -
> --              # Make absolute
> --              # Convert to absolute canonical form
> --              $filename =3D solve_relative_path($base_dir, $filename);
> -+#
> -+# filter_source_files(hash)
> -+#
> -+# Remove unwanted source file data from HASH.
> -+#
> -
> --              # Apply adjustment
> --              if (defined($adjust_src_pattern)) {
> --                      $filename =3D~ s/$adjust_src_pattern/$adjust_src_=
replace/g;
> -+sub filter_source_files($)
> -+{
> -+      my ($hash) =3D @_;
> -+
> -+      foreach my $filename (keys(%{$hash})) {
> -+              # Skip external files if requested
> -+              goto del if (!$opt_external && is_external($filename));
> -+
> -+              # Apply include patterns
> -+              if (@include_patterns) {
> -+                      my $keep;
> -+
> -+                      foreach my $pattern (@include_patterns) {
> -+                              if ($filename =3D~ (/^$pattern$/)) {
> -+                                      $keep =3D 1;
> -+                                      last;
> -+                              }
> -+                      }
> -+                      goto del if (!$keep);
> -               }
> -
> --              if ($filename ne $old_filename) {
> --                      $graph->{$filename} =3D delete($graph->{$old_file=
name});
> -+              # Apply exclude patterns
> -+              foreach my $pattern (@exclude_patterns) {
> -+                      goto del if ($filename =3D~ (/^$pattern$/));
> -               }
> --      }
> -+              next;
> -
> --      return ($instr, $graph);
> -+del:
> -+              # Remove file data
> -+              delete($hash->{$filename});
> -+              $excluded_files{$filename} =3D 1;
> -+      }
> - }
> -
> - #
> -@@ -3784,6 +4204,7 @@ sub get_gcov_capabilities()
> -               'c' =3D> 'branch-counts',
> -               'f' =3D> 'function-summaries',
> -               'h' =3D> 'help',
> -+              'i' =3D> 'intermediate-format',
> -               'l' =3D> 'long-file-names',
> -               'n' =3D> 'no-output',
> -               'o' =3D> 'object-directory',
> -diff --git a/lcovrc b/lcovrc
> -index 40f364f..bd4bc3b 100644
> ---- a/lcovrc
> -+++ b/lcovrc
> -@@ -134,6 +134,9 @@ genhtml_desc_html=3D0
> - # when collecting coverage data.
> - geninfo_auto_base =3D 1
> -
> -+# Use gcov intermediate format? Valid values are 0, 1, auto
> -+geninfo_intermediate =3D auto
> -+
> - # Directory containing gcov kernel files
> - # lcov_gcov_dir =3D /proc/gcov
> -
> -diff --git a/man/lcovrc.5 b/man/lcovrc.5
> -index f20d273..bf0ce7a 100644
> ---- a/man/lcovrc.5
> -+++ b/man/lcovrc.5
> -@@ -223,6 +223,11 @@ geninfo_compat_libtool =3D 0
> - geninfo_auto_base =3D 1
> - .br
> -
> -+# Use gcov intermediate format? Valid values are 0, 1, auto
> -+.br
> -+geninfo_intermediate =3D auto
> -+.br
> -+
> - # Directory containing gcov kernel files
> - .br
> - lcov_gcov_dir =3D /proc/gcov
> -@@ -789,6 +794,25 @@ located, and in addition, is different between file=
s of the same project.
> - Default is 1.
> - .PP
> -
> -+.BR geninfo_intermediate " =3D"
> -+.IR 0 | 1 | auto
> -+.IP
> -+Specify whether to use gcov intermediate format
> -+.br
> -+
> -+Use this option to control whether geninfo should use the gcov intermed=
iate
> -+format while collecting coverage data. The use of the gcov intermediate=
 format
> -+should increase processing speed. It also provides branch coverage data=
 when
> -+using the \-\-initial command line option.
> -+.br
> -+
> -+Valid values are 0 for off, 1 for on, and "auto" to let geninfo automat=
ically
> -+use immediate format when supported by gcov.
> -+.br
> -+
> -+Default is "auto".
> -+.PP
> -+
> - .BR lcov_gcov_dir " =3D"
> - .I path_to_kernel_coverage_data
> - .IP
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-support/lcov/files/0002-geninfo-Add-intermed=
iate-JSON-format-support.patch b/meta-oe/recipes-support/lcov/files/0002-ge=
ninfo-Add-intermediate-JSON-format-support.patch
> deleted file mode 100644
> index 7b180635cd..0000000000
> --- a/meta-oe/recipes-support/lcov/files/0002-geninfo-Add-intermediate-JS=
ON-format-support.patch
> +++ /dev/null
> @@ -1,247 +0,0 @@
> -From e13b2b6f8443da660cafa0679c3b16240843ce9f Mon Sep 17 00:00:00 2001
> -From: Peter Oberparleiter <oberpar@linux.ibm.com>
> -Date: Fri, 24 May 2019 17:16:56 +0200
> -Subject: [PATCH 2/2] geninfo: Add intermediate JSON format support
> -
> -This change adds support for parsing the output of gcov's intermediate
> -JSON file format as implemented by GCC version 9.
> -
> -Note: The way that the intermediate file format support is implemented
> -in geninfo removes the need to parse .gcno files directly. Since geninfo
> -does not include support for parsing GCC 9 .gcno files, using the
> -intermediate format is the only option for geninfo to collect coverage
> -data generated by GCC version 9.
> -
> -Signed-off-by: Peter Oberparleiter <oberpar@linux.ibm.com>
> ----
> - bin/geninfo | 162 +++++++++++++++++++++++++++++++++++++++++++++++++++-
> - 1 file changed, 160 insertions(+), 2 deletions(-)
> -
> -Upstream-Status: Backport
> -Download URL: https://github.com/linux-test-project/lcov/commit/75fbae1c=
fc5027f818a0bb865bf6f96fab3202da
> -
> -diff --git a/bin/geninfo b/bin/geninfo
> -index 0276666..cceb782 100755
> ---- a/bin/geninfo
> -+++ b/bin/geninfo
> -@@ -59,6 +59,9 @@ use File::Copy qw(copy);
> - use Getopt::Long;
> - use Digest::MD5 qw(md5_base64);
> - use Cwd qw/abs_path/;
> -+use PerlIO::gzip;
> -+use JSON qw(decode_json);
> -+
> - if( $^O eq "msys" )
> - {
> -       require File::Spec::Win32;
> -@@ -474,7 +477,8 @@ if ($rc_intermediate eq "0") {
> -       $intermediate =3D 1;
> - } elsif (lc($rc_intermediate) eq "auto") {
> -       # Use intermediate format if supported by gcov
> --      $intermediate =3D $gcov_caps->{'intermediate-format'} ? 1 : 0;
> -+      $intermediate =3D ($gcov_caps->{'intermediate-format'} ||
> -+                       $gcov_caps->{'json-format'}) ? 1 : 0;
> - } else {
> -       die("ERROR: invalid value for geninfo_intermediate: ".
> -           "'$rc_intermediate'\n");
> -@@ -2084,6 +2088,48 @@ sub read_intermediate_text($$)
> - }
> -
> -
> -+#
> -+# read_intermediate_json(gcov_filename, data, basedir_ref)
> -+#
> -+# Read gcov intermediate JSON format in GCOV_FILENAME and add the resul=
ting
> -+# data to DATA in the following format:
> -+#
> -+# data:      source_filename -> file_data
> -+# file_data: GCOV JSON data for file
> -+#
> -+# Also store the value for current_working_directory to BASEDIR_REF.
> -+#
> -+
> -+sub read_intermediate_json($$$)
> -+{
> -+      my ($gcov_filename, $data, $basedir_ref) =3D @_;
> -+      my $fd;
> -+      my $text;
> -+      my $json;
> -+
> -+      open($fd, "<:gzip", $gcov_filename) or
> -+              die("ERROR: Could not read $gcov_filename: $!\n");
> -+      local $/;
> -+      $text =3D <$fd>;
> -+      close($fd);
> -+
> -+      $json =3D decode_json($text);
> -+      if (!defined($json) || !exists($json->{"files"}) ||
> -+          ref($json->{"files"} ne "ARRAY")) {
> -+              die("ERROR: Unrecognized JSON output format in ".
> -+                  "$gcov_filename\n");
> -+      }
> -+
> -+      $$basedir_ref =3D $json->{"current_working_directory"};
> -+
> -+      for my $file (@{$json->{"files"}}) {
> -+              my $filename =3D $file->{"file"};
> -+
> -+              $data->{$filename} =3D $file;
> -+      }
> -+}
> -+
> -+
> - #
> - # intermediate_text_to_info(fd, data, srcdata)
> - #
> -@@ -2173,6 +2219,104 @@ sub intermediate_text_to_info($$$)
> - }
> -
> -
> -+#
> -+# intermediate_json_to_info(fd, data, srcdata)
> -+#
> -+# Write DATA in info format to file descriptor FD.
> -+#
> -+# data:      filename -> file_data:
> -+# file_data: GCOV JSON data for file
> -+#
> -+# srcdata:   filename -> [ excl, brexcl, checksums ]
> -+# excl:      lineno -> 1 for all lines for which to exclude all data
> -+# brexcl:    lineno -> 1 for all lines for which to exclude branch data
> -+# checksums: lineno -> source code checksum
> -+#
> -+# Note: To simplify processing, gcov data is not combined here, that is=
 counts
> -+#       that appear multiple times for the same lines/branches are not =
added.
> -+#       This is done by lcov/genhtml when reading the data files.
> -+#
> -+
> -+sub intermediate_json_to_info($$$)
> -+{
> -+      my ($fd, $data, $srcdata) =3D @_;
> -+      my $branch_num =3D 0;
> -+
> -+      return if (!%{$data});
> -+
> -+      print($fd "TN:$test_name\n");
> -+      for my $filename (keys(%{$data})) {
> -+              my ($excl, $brexcl, $checksums);
> -+              my $file_data =3D $data->{$filename};
> -+
> -+              if (defined($srcdata->{$filename})) {
> -+                      ($excl, $brexcl, $checksums) =3D @{$srcdata->{$fi=
lename}};
> -+              }
> -+
> -+              print($fd "SF:$filename\n");
> -+
> -+              # Function data
> -+              if ($func_coverage) {
> -+                      for my $d (@{$file_data->{"functions"}}) {
> -+                              my $line =3D $d->{"start_line"};
> -+                              my $count =3D $d->{"execution_count"};
> -+                              my $name =3D $d->{"name"};
> -+
> -+                              next if (!defined($line) || !defined($cou=
nt) ||
> -+                                       !defined($name) || $excl->{$line=
});
> -+
> -+                              print($fd "FN:$line,$name\n");
> -+                              print($fd "FNDA:$count,$name\n");
> -+                      }
> -+              }
> -+
> -+              # Line data
> -+              for my $d (@{$file_data->{"lines"}}) {
> -+                      my $line =3D $d->{"line_number"};
> -+                      my $count =3D $d->{"count"};
> -+                      my $c;
> -+                      my $branches =3D $d->{"branches"};
> -+                      my $unexec =3D $d->{"unexecuted_block"};
> -+
> -+                      next if (!defined($line) || !defined($count) ||
> -+                               $excl->{$line});
> -+
> -+                      if (defined($unexec) && $unexec && $count =3D=3D =
0) {
> -+                              $unexec =3D 1;
> -+                      } else {
> -+                              $unexec =3D 0;
> -+                      }
> -+
> -+                      if ($checksum && exists($checksums->{$line})) {
> -+                              $c =3D ",".$checksums->{$line};
> -+                      } else {
> -+                              $c =3D "";
> -+                      }
> -+                      print($fd "DA:$line,$count$c\n");
> -+
> -+                      $branch_num =3D 0;
> -+                      # Branch data
> -+                      if ($br_coverage && !$brexcl->{$line}) {
> -+                              for my $b (@$branches) {
> -+                                      my $brcount =3D $b->{"count"};
> -+
> -+                                      if (!defined($brcount) || $unexec=
) {
> -+                                              $brcount =3D "-";
> -+                                      }
> -+                                      print($fd "BRDA:$line,0,$branch_n=
um,".
> -+                                            "$brcount\n");
> -+
> -+                                      $branch_num++;
> -+                              }
> -+                      }
> -+
> -+              }
> -+
> -+              print($fd "end_of_record\n");
> -+      }
> -+}
> -+
> -+
> - sub get_output_fd($$)
> - {
> -       my ($outfile, $file) =3D @_;
> -@@ -2243,6 +2387,8 @@ sub process_intermediate($$$)
> -       my $srcdata;
> -       my $is_graph =3D 0;
> -       my ($out, $err, $rc);
> -+      my $json_basedir;
> -+      my $json_format;
> -
> -       info("Processing %s\n", abs2rel($file, $dir));
> -
> -@@ -2296,6 +2442,12 @@ sub process_intermediate($$$)
> -               unlink($gcov_filename);
> -       }
> -
> -+      for my $gcov_filename (glob("*.gcov.json.gz")) {
> -+              read_intermediate_json($gcov_filename, \%data, \$json_bas=
edir);
> -+              unlink($gcov_filename);
> -+              $json_format =3D 1;
> -+      }
> -+
> -       if (!%data) {
> -               warn("WARNING: GCOV did not produce any data for $file\n"=
);
> -               return;
> -@@ -2304,6 +2456,8 @@ sub process_intermediate($$$)
> -       # Determine base directory
> -       if (defined($base_directory)) {
> -               $base =3D $base_directory;
> -+      } elsif (defined($json_basedir)) {
> -+              $base =3D $json_basedir;
> -       } else {
> -               $base =3D $fdir;
> -
> -@@ -2331,7 +2485,11 @@ sub process_intermediate($$$)
> -
> -       # Generate output
> -       $fd =3D get_output_fd($output_filename, $file);
> --      intermediate_text_to_info($fd, \%data, $srcdata);
> -+      if ($json_format) {
> -+              intermediate_json_to_info($fd, \%data, $srcdata);
> -+      } else {
> -+              intermediate_text_to_info($fd, \%data, $srcdata);
> -+      }
> -       close($fd);
> -
> -       chdir($cwd);
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-support/lcov/lcov_1.14.bb b/meta-oe/recipes-=
support/lcov/lcov_1.16.bb
> similarity index 78%
> rename from meta-oe/recipes-support/lcov/lcov_1.14.bb
> rename to meta-oe/recipes-support/lcov/lcov_1.16.bb
> index 5e8fb938cf..3c09161dee 100755
> --- a/meta-oe/recipes-support/lcov/lcov_1.14.bb
> +++ b/meta-oe/recipes-support/lcov/lcov_1.16.bb
> @@ -8,9 +8,7 @@ LCOV supports statement, function and branch coverage mea=
surement."
>  LICENSE =3D "GPL-2.0"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
>
> -RDEPENDS_${PN} +=3D " \
> -    libjson-perl \
> -    libperlio-gzip-perl \
> +RDEPENDS:${PN} +=3D " \
>      perl \
>      perl-module-filehandle \
>      perl-module-getopt-std \
> @@ -48,15 +46,9 @@ RDEPENDS_${PN}_append_class-target =3D " \
>      gcov \
>      gcov-symlinks \
>  "
> -
> -SRC_URI =3D " \
> -           http://downloads.sourceforge.net/ltp/${BP}.tar.gz \
> -           file://0001-geninfo-Add-intermediate-text-format-support.patc=
h \
> -           file://0002-geninfo-Add-intermediate-JSON-format-support.patc=
h \
> -          "
> -
> -SRC_URI[md5sum] =3D "0220d01753469f83921f8f41ae5054c1"
> -SRC_URI[sha256sum] =3D "14995699187440e0ae4da57fe3a64adc0a3c5cf14feab971=
f8db38fb7d8f071a"
> +SRC_URI =3D "https://github.com/linux-test-project/lcov/releases/downloa=
d/v${PV}/lcov-${PV}.tar.gz"
> +SRC_URI[md5sum] =3D "bfee0cef50d7b7bd1df03bfadf68dcef"
> +SRC_URI[sha256sum] =3D "987031ad5528c8a746d4b52b380bc1bffe412de1f2b9c2ba=
5224995668e3240b"
>
>  do_install() {
>      oe_runmake install PREFIX=3D${D}${prefix} CFG_DIR=3D${D}${sysconfdir=
} LCOV_PERL_PATH=3D"/usr/bin/env perl"
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180453): https://lists.openembedded.org/g/openembedde=
d-core/message/180453
> Mute This Topic: https://lists.openembedded.org/mt/98520789/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

