Received: from aer-iport-7.cisco.com (aer-iport-7.cisco.com [173.38.203.69])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22218.1795539992332548549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 09:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=QIZWiBak;
 spf=pass (domain: cisco.com, ip: 173.38.203.69, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=18527; q=dns/txt;
  s=iport01; t=1795539992; x=1796749592;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xCwygeX/4flmzOS2AjjOIdM2b3coTH69wy+JqzAArQY=;
  b=QIZWiBaksfGtFzIKESHgbbIbJtvapSTEiDFR/VteEJgUCpMQW4CHtBUZ
   Xs6gEegXKqhapUTVQ2QCPPeBTorW5Hq6PWxombF/XRPr+TJ1PxeQJKMyc
   VbkWqT5i7llLvdUPFObBPdFsaZS4+YfVvmPhR/SrVBDp0jKfnKQsAesmF
   zGGXtNjmC6YCOrcgJbe/77d2PTvQ7Lv6OmXW2pDs/kBH5kLKvmQMRt7M9
   XKDyUNPzC3J69TBuGmghi1GwWJDoRlXquRWT+XOgOcsuZCmp0C66/YH46
   xbS3B3HYBtZY1vSZbOlBqWT+dAwEdjlokvLKpjT93cw8WKfwcoGQqFaWf
   g==;
X-CSE-ConnectionGUID: n/zZrFiUTmaBKMBUETrJ6Q==
X-CSE-MsgGUID: 7tdcHkVhTbqI7apOpxZtrA==
X-IPAS-Result: =?us-ascii?q?A0BLAgADwwVr/9FK/pBaglmCV3VgQ0kDlkgDnikUgWoPA?=
 =?us-ascii?q?QEBDy4WDQQBAYISgi1GAo4iAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFA?=
 =?us-ascii?q?QEBAgEHBYEOE4ZPDZASAQIBAwEmCwEYAS0QHAMBAi8nBCMIGYMCAYJ0AxG7A?=
 =?us-ascii?q?IF5M4EBgykBgVTbMwELFAGBOIVCiCVdGAFEhDonGxuBcoR/gQWBXAEBgRcMJ?=
 =?us-ascii?q?IZfBIINFYEMgVQeMTOMFQKBT4hOSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdg?=
 =?us-ascii?q?SM7F4EHGwYFgRyBHoESgQNdgSsoXQEhgQiBdgKCUYIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yQiCBIJARMaLAqBGjU8CSY/FQxnCxoFYQgCDQx0ORAwHiQvBRomPhsKgQwnH?=
 =?us-ascii?q?x4bDgIfEAYWIQsiGA1IESw3FRkEPm4HlBiDEwcxLwMYEwEHDBgXOTVMAwwdB?=
 =?us-ascii?q?ygckxmQH4IhoREKKIN5jCSNPnaHBhozhARNgQqlFwuYfYJZizEWlWELT4Rqg?=
 =?us-ascii?q?Wg8gVlwFTuCZwlKGQ+OOYNrhRM0yRQmMgIJAzABBwIHDwKBc5F+AQE?=
IronPort-Data: A9a23:eflFMatG7anZXjCIZbhYoDYeyOfnVAJfMUV32f8akzHdYApBsoF/q
 tZmKTiFbKvcYWD2L4p3PYrj9htXvZOHztBnGVQ4pXhkEC4bgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvZ9Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw/KFlM3tg9
 MEkLTknTTWpus+K2pDlc7w57igjBJGD0II3s3x6iDWcBvE8TNWbE+PB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYgZ/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9JIfXH5kOzh7wS
 mTuoHj1CTEZCtyjwyOkrXu0offfrz/hcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzBUCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:i/KOWqN75u56b8BcTuOjsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZqjz/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 RdWpk7LsHsBl5nisu/ygy5H9E8hOSjysmT9IHjJ7MHd3ATV0mmhD0JczqmLg==
X-Talos-CUID: =?us-ascii?q?9a23=3AAY7Domh/qXhOPlcC9L3ZjpMAMzJudDrP/m3+InK?=
 =?us-ascii?q?EDG9Da5i/dHKs4oE6qp87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AxFQXvQxlR7mO+4gjSBtYjwa1B0KaqPuyBEstkqs?=
 =?us-ascii?q?Gh8OdFHN5IxCFnAarWKZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,231,1787011200"; 
   d="scan'208";a="63524380"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 24 Nov 2026 17:06:30 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id A19C918000181;
	Tue, 24 Nov 2026 17:06:29 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 55285CBF201; Tue, 24 Nov 2026 09:06:28 -0800 (PST)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][PATCH 2/2] perl: fix CVE-2026-82560
Date: Tue, 24 Nov 2026 09:06:25 -0800
Message-Id: <20261124170625.1602109-2-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261124170625.1602109-1-dkelaiya@cisco.com>
References: <20261124170625.1602109-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 17:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251043
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Backport the Pod::Text margin fix [1] for the bundled podlators 6.0.2
modules so malformed POD cannot loop indefinitely when indentation
leaves no usable output width. Include the required follow-up [2],
which fixes Overstrike wrapping exposed by the new regression tests,
and carry its four renderer fixtures and test registrations.

[1] https://github.com/rra/podlators/commit/70510174f69eb54aa6d617bde4e1402cd9b7c61f
[2] https://github.com/rra/podlators/commit/092070954c04cffeb6ffd57a78d796eed2f66e9c
[3] https://www.openwall.com/lists/oss-security/2026/09/19/6

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../perl/files/CVE-2026-82560_p1.patch        | 147 +++++++++
 .../perl/files/CVE-2026-82560_p2.patch        | 298 ++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.44.0.bb     |   2 +
 3 files changed, 447 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-82560_p1.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-82560_p2.patch

diff --git a/meta/recipes-devtools/perl/files/CVE-2026-82560_p1.patch b/meta/recipes-devtools/perl/files/CVE-2026-82560_p1.patch
new file mode 100644
index 0000000..301e2c9
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-82560_p1.patch
@@ -0,0 +1,147 @@
+From 70510174f69eb54aa6d617bde4e1402cd9b7c61f Mon Sep 17 00:00:00 2001
+From: Russ Allbery <rra@cpan.org>
+Date: Sat, 29 Aug 2026 10:29:37 -0700
+Subject: [PATCH] Handle pathological margins in Pod::Text
+
+If the margin equals or exceeds the output width, Pod::Text and its
+subclasses could hang forever in the wrapping regular expression,
+since it would successfully match zero characters. Catch this case,
+report an error, and force the margin to zero.
+
+CVE: CVE-2026-82560
+Upstream-Status: Backport [https://github.com/rra/podlators/commit/70510174f69eb54aa6d617bde4e1402cd9b7c61f]
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ cpan/podlators/lib/Pod/Text.pm            | 18 ++++++++++++++++++
+ cpan/podlators/lib/Pod/Text/Color.pm      | 11 ++++++++++-
+ cpan/podlators/lib/Pod/Text/Overstrike.pm | 12 +++++++++++-
+ cpan/podlators/lib/Pod/Text/Termcap.pm    | 11 ++++++++++-
+ 4 files changed, 49 insertions(+), 3 deletions(-)
+
+diff --git a/cpan/podlators/lib/Pod/Text.pm b/cpan/podlators/lib/Pod/Text.pm
+index e89b01d..1c95d26 100644
+--- a/cpan/podlators/lib/Pod/Text.pm
++++ b/cpan/podlators/lib/Pod/Text.pm
+@@ -248,6 +248,17 @@ sub wrap {
+     my $output = '';
+     my $spaces = ' ' x $$self{MARGIN};
+     my $width = $$self{opt_width} - $$self{MARGIN};
++
++    # Pathological margins make wrapping impossible.  In this case, complain
++    # to the user and reset the margin to 0.
++    if ($width <= 0) {
++        my $error = 'Margin is wider than the output width';
++        $self->whine($self->line_count(), $error);
++        $spaces = q{};
++        $width = $self->{opt_width};
++    }
++
++    # Perform the wrapping.
+     while (length > $width) {
+         if (s/^([^\n]{0,$width})[ \t\n]+// || s/^([^\n]{$width})//) {
+             $output .= $spaces . $1 . "\n";
+@@ -1163,6 +1174,13 @@ and the input file it was given could not be opened.
+ constructor) was invalid.  A quote specification must be either one
+ character long or an even number (greater than one) characters long.
+ 
++=item Margin is wider than the output width
++
++(W) The requested margin width, determined from the sum of indentations
++requested by C<=over> and the baseline indentation for text, is equal to or
++wider than the desired output width specified with C<width>.  The text will
++be formatted as if the margin was set to zero.
++
+ =item POD document had syntax errors
+ 
+ (F) The POD document being formatted had syntax errors and the C<errors>
+diff --git a/cpan/podlators/lib/Pod/Text/Color.pm b/cpan/podlators/lib/Pod/Text/Color.pm
+index 5212763..16e02ff 100644
+--- a/cpan/podlators/lib/Pod/Text/Color.pm
++++ b/cpan/podlators/lib/Pod/Text/Color.pm
+@@ -85,6 +85,15 @@ sub wrap {
+     my $spaces = ' ' x $$self{MARGIN};
+     my $width = $$self{opt_width} - $$self{MARGIN};
+ 
++    # Pathological margins make wrapping impossible. In this case, complain to
++    # the user and reset the margin to 0.
++    if ($width <= 0) {
++        my $error = 'Margin is wider than the output width';
++        $self->whine($self->line_count(), $error);
++        $spaces = q{};
++        $width = $self->{opt_width};
++    }
++
+     # $codes matches a single special sequence.  $char matches any number of
+     # special sequences preceding a single character other than a newline.
+     # $shortchar matches some sequence of $char ending in codes followed by
+@@ -191,7 +200,7 @@ Russ Allbery <rra@cpan.org>.
+ 
+ =head1 COPYRIGHT AND LICENSE
+ 
+-Copyright 1999, 2001, 2004, 2006, 2008, 2009, 2018-2019, 2022, 2024 Russ
++Copyright 1999, 2001, 2004, 2006, 2008, 2009, 2018-2019, 2022, 2024, 2026 Russ
+ Allbery <rra@cpan.org>
+ 
+ This program is free software; you may redistribute it and/or modify it
+diff --git a/cpan/podlators/lib/Pod/Text/Overstrike.pm b/cpan/podlators/lib/Pod/Text/Overstrike.pm
+index 8982c42..f24a32c 100644
+--- a/cpan/podlators/lib/Pod/Text/Overstrike.pm
++++ b/cpan/podlators/lib/Pod/Text/Overstrike.pm
+@@ -103,6 +103,16 @@ sub wrap {
+     my $output = '';
+     my $spaces = ' ' x $$self{MARGIN};
+     my $width = $$self{opt_width} - $$self{MARGIN};
++
++    # Pathological margins make wrapping impossible. In this case, complain to
++    # the user and reset the margin to 0.
++    if ($width <= 0) {
++        my $error = 'Margin is wider than the output width';
++        $self->whine($self->line_count(), $error);
++        $spaces = q{};
++        $width = $self->{opt_width};
++    }
++
+     while (length > $width) {
+         # This regex represents a single character, that's possibly underlined
+         # or in bold (in which case, it's three characters; the character, a
+@@ -198,7 +208,7 @@ created by Russ Allbery <rra@cpan.org>.  Subsequently updated by Russ Allbery.
+ 
+ Copyright 2000 Joe Smith <Joe.Smith@inwap.com>
+ 
+-Copyright 2001, 2004, 2008, 2014, 2018-2019, 2022, 2024 Russ Allbery
++Copyright 2001, 2004, 2008, 2014, 2018-2019, 2022, 2024, 2026 Russ Allbery
+ <rra@cpan.org>
+ 
+ This program is free software; you may redistribute it and/or modify it
+diff --git a/cpan/podlators/lib/Pod/Text/Termcap.pm b/cpan/podlators/lib/Pod/Text/Termcap.pm
+index b628d7a..902edd4 100644
+--- a/cpan/podlators/lib/Pod/Text/Termcap.pm
++++ b/cpan/podlators/lib/Pod/Text/Termcap.pm
+@@ -147,6 +147,15 @@ sub wrap {
+         return $self->SUPER::wrap($_);
+     }
+ 
++    # Pathological margins make wrapping impossible. In this case, complain to
++    # the user and reset the margin to 0.
++    if ($width <= 0) {
++        my $error = 'Margin is wider than the output width';
++        $self->whine($self->line_count(), $error);
++        $spaces = q{};
++        $width = $self->{opt_width};
++    }
++
+     # $code matches a single special sequence.  $char matches any number of
+     # special sequences preceding a single character other than a newline.
+     # $shortchar matches some sequence of $char ending in codes followed by
+@@ -263,7 +272,7 @@ Russ Allbery <rra@cpan.org>
+ =head1 COPYRIGHT AND LICENSE
+ 
+ Copyright 1999, 2001-2002, 2004, 2006, 2008-2009, 2014-2015, 2018-2019, 2022,
+-2024 Russ Allbery <rra@cpan.org>
++2024, 2026 Russ Allbery <rra@cpan.org>
+ 
+ This program is free software; you may redistribute it and/or modify it
+ under the same terms as Perl itself.
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/perl/files/CVE-2026-82560_p2.patch b/meta/recipes-devtools/perl/files/CVE-2026-82560_p2.patch
new file mode 100644
index 0000000..7a872af
--- /dev/null
+++ b/meta/recipes-devtools/perl/files/CVE-2026-82560_p2.patch
@@ -0,0 +1,298 @@
+From 092070954c04cffeb6ffd57a78d796eed2f66e9c Mon Sep 17 00:00:00 2001
+From: Russ Allbery <rra@cpan.org>
+Date: Sat, 29 Aug 2026 10:38:02 -0700
+Subject: [PATCH] Test wrapping and fix Pod::Text::Overstrike
+
+Add tests for wrapping in Pod::Text and subclasses when the margin
+equals or exceeds the output width, and fix another bug discovered
+via that test in Pod::Text::Overstrike wrapping at a formatted space.
+Remove any partial space formatting or bold or underlined spaces from
+the start of the subsequent line.
+
+CVE: CVE-2026-82560
+Upstream-Status: Backport [https://github.com/rra/podlators/commit/092070954c04cffeb6ffd57a78d796eed2f66e9c]
+
+Backport Changes:
+- Omit the podlators 6.1.1 release-note hunk from Changes; Perl's
+  bundled copy retains its 6.0.2 distribution version and changelog.
+- Use a 71-test plan for the plain-text suite, which lacks upstream's
+  unrelated c-with-newline snippet and its two checks.
+- Apply that suite's copyright update to its existing 2024 notice.
+
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ cpan/podlators/lib/Pod/Text/Overstrike.pm           | 15 ++++++++++-----
+ cpan/podlators/t/data/snippets/color/wrap-width     | 21 +++++++++++++++++++++
+ .../podlators/t/data/snippets/overstrike/wrap-width | 21 +++++++++++++++++++++
+ cpan/podlators/t/data/snippets/termcap/wrap-width   | 20 ++++++++++++++++++++
+ cpan/podlators/t/data/snippets/text/wrap-width      | 21 +++++++++++++++++++++
+ cpan/podlators/t/text/color.t                       |  7 ++++---
+ cpan/podlators/t/text/overstrike.t                  |  6 +++---
+ cpan/podlators/t/text/snippets.t                    |  6 +++---
+ cpan/podlators/t/text/termcap.t                     |  7 ++++---
+ 9 files changed, 107 insertions(+), 17 deletions(-)
+
+diff --git a/cpan/podlators/lib/Pod/Text/Overstrike.pm b/cpan/podlators/lib/Pod/Text/Overstrike.pm
+index f24a32c..b91f116 100644
+--- a/cpan/podlators/lib/Pod/Text/Overstrike.pm
++++ b/cpan/podlators/lib/Pod/Text/Overstrike.pm
+@@ -113,14 +113,19 @@ sub wrap {
+         $width = $self->{opt_width};
+     }
+ 
++    # This regex represents a single character, that's possibly underlined or
++    # in bold (in which case, it's three characters; the character, a
++    # backspace, and a character).  Use [^\n] rather than . to protect against
++    # odd settings of $*.
++    my $char = '(?:[^\n][\b])?[^\n]';
++
++    # Perform the wrapping.  After we find a break point, remove any
++    # underlined or bold spaces left over in the input text after the break
++    # point.
+     while (length > $width) {
+-        # This regex represents a single character, that's possibly underlined
+-        # or in bold (in which case, it's three characters; the character, a
+-        # backspace, and a character).  Use [^\n] rather than . to protect
+-        # against odd settings of $*.
+-        my $char = '(?:[^\n][\b])?[^\n]';
+         if (s/^((?>$char){0,$width})(?:\Z|[ \t\n]+)//) {
+             $output .= $spaces . $1 . "\n";
++            s/^(?:[\b][ _])?(?:[ ][\b][ ])*//;
+         } else {
+             last;
+         }
+diff --git a/cpan/podlators/t/data/snippets/color/wrap-width b/cpan/podlators/t/data/snippets/color/wrap-width
+new file mode 100644
+index 0000000..0ca0e66
+--- /dev/null
++++ b/cpan/podlators/t/data/snippets/color/wrap-width
+@@ -0,0 +1,21 @@
++[name]
++Wrap with too-long indent
++
++[input]
++=over 72
++
++This paragraph cannot be wrapped because the total margin is equal to the
++maximum width.
++
++=back
++
++[output]
++This paragraph cannot be wrapped because the total margin is equal to the
++maximum width.
++
++[1mPOD ERRORS[0m
++    Hey! [1mThe above document had some coding errors, which are explained[0m
++    [1mbelow:[0m
++
++    Around line 6:
++        Margin is wider than the output width
+diff --git a/cpan/podlators/t/data/snippets/overstrike/wrap-width b/cpan/podlators/t/data/snippets/overstrike/wrap-width
+new file mode 100644
+index 0000000..4643b86
+--- /dev/null
++++ b/cpan/podlators/t/data/snippets/overstrike/wrap-width
+@@ -0,0 +1,21 @@
++[name]
++Wrap with too-long indent
++
++[input]
++=over 72
++
++This paragraph cannot be wrapped because the total margin is equal to the
++maximum width.
++
++=back
++
++[output]
++This paragraph cannot be wrapped because the total margin is equal to the
++maximum width.
++
++PPOODD  EERRRROORRSS
++    Hey! TThhee  aabboovvee  ddooccuummeenntt  hhaadd  ssoommee  ccooddiinngg  eerrrroorrss,,  wwhhiicchh  aarree  eexxppllaaiinneedd
++    bbeellooww::
++
++    Around line 6:
++        Margin is wider than the output width
+diff --git a/cpan/podlators/t/data/snippets/termcap/wrap-width b/cpan/podlators/t/data/snippets/termcap/wrap-width
+new file mode 100644
+index 0000000..251dce5
+--- /dev/null
++++ b/cpan/podlators/t/data/snippets/termcap/wrap-width
+@@ -0,0 +1,20 @@
++[name]
++Wrap with too-long indent
++
++[input]
++=over 76
++
++This paragraph cannot be wrapped because the total margin is equal to the
++maximum width.
++
++=back
++
++[output]
++This paragraph cannot be wrapped because the total margin is equal to the
++maximum width.
++
++[1mPOD ERRORS[m
++    Hey! [1mThe above document had some coding errors, which are explained below:[m
++
++    Around line 6:
++        Margin is wider than the output width
+diff --git a/cpan/podlators/t/data/snippets/text/wrap-width b/cpan/podlators/t/data/snippets/text/wrap-width
+new file mode 100644
+index 0000000..2e3e45f
+--- /dev/null
++++ b/cpan/podlators/t/data/snippets/text/wrap-width
+@@ -0,0 +1,21 @@
++[name]
++Wrap with too-long indent
++
++[input]
++=over 72
++
++This paragraph cannot be wrapped because the total margin is equal to the
++maximum width.
++
++=back
++
++[output]
++This paragraph cannot be wrapped because the total margin is equal to the
++maximum width.
++
++POD ERRORS
++    Hey! The above document had some coding errors, which are explained
++    below:
++
++    Around line 6:
++        Margin is wider than the output width
+diff --git a/cpan/podlators/t/text/color.t b/cpan/podlators/t/text/color.t
+index e0edb79..2679c03
+--- a/cpan/podlators/t/text/color.t
++++ b/cpan/podlators/t/text/color.t
+@@ -2,7 +2,7 @@
+ #
+ # Test Pod::Text::Color behavior with various snippets.
+ #
+-# Copyright 2002, 2004, 2006, 2009, 2012-2013, 2018-2019, 2023-2024
++# Copyright 2002, 2004, 2006, 2009, 2012-2013, 2018-2019, 2023-2024, 2026
+ #     Russ Allbery <rra@cpan.org>
+ #
+ # This program is free software; you may redistribute it and/or modify it
+@@ -13,7 +13,7 @@ use warnings;
+ 
+ use lib 't/lib';
+ 
+-use Test::More tests => 13;
++use Test::More tests => 15;
+ use Test::Podlators qw(test_snippet);
+ 
+ # Load the module.
+@@ -26,7 +26,8 @@ delete $ENV{NO_COLOR};
+ 
+ # List of snippets run by this test.
+ my @snippets = qw(
+-    escape-wrapping nonbreaking-wrap tag-width tag-wrapping width wrapping
++    escape-wrapping nonbreaking-wrap tag-width tag-wrapping width wrap-width
++    wrapping
+ );
+ 
+ # Run all the tests.
+diff --git a/cpan/podlators/t/text/overstrike.t b/cpan/podlators/t/text/overstrike.t
+index 16bd29d..ebb3ae5
+--- a/cpan/podlators/t/text/overstrike.t
++++ b/cpan/podlators/t/text/overstrike.t
+@@ -2,7 +2,7 @@
+ #
+ # Test Pod::Text::Overstrike with various snippets.
+ #
+-# Copyright 2002, 2004, 2006, 2009, 2012-2013, 2018-2019, 2024
++# Copyright 2002, 2004, 2006, 2009, 2012-2013, 2018-2019, 2024, 2026
+ #     Russ Allbery <rra@cpan.org>
+ #
+ # This program is free software; you may redistribute it and/or modify it
+@@ -15,7 +15,7 @@ use warnings;
+ 
+ use lib 't/lib';
+ 
+-use Test::More tests => 7;
++use Test::More tests => 9;
+ use Test::Podlators qw(test_snippet);
+ 
+ BEGIN {
+@@ -23,7 +23,7 @@ BEGIN {
+ }
+ 
+ # List of snippets run by this test.
+-my @snippets = qw(nonbreaking-wrap tag-width wrapping);
++my @snippets = qw(nonbreaking-wrap tag-width wrap-width wrapping);
+ 
+ # Run all the tests.
+ for my $snippet (@snippets) {
+diff --git a/cpan/podlators/t/text/snippets.t b/cpan/podlators/t/text/snippets.t
+index 83e8ad0..f0532e3 100644
+--- a/cpan/podlators/t/text/snippets.t
++++ b/cpan/podlators/t/text/snippets.t
+@@ -2,7 +2,7 @@
+ #
+ # Test Pod::Text behavior with various snippets.
+ #
+-# Copyright 2002, 2004, 2006-2009, 2012, 2018-2020, 2022, 2024
++# Copyright 2002, 2004, 2006-2009, 2012, 2018-2020, 2022, 2024-2026
+ #     Russ Allbery <rra@cpan.org>
+ #
+ # This program is free software; you may redistribute it and/or modify it
+@@ -15,7 +15,7 @@ use warnings;
+ 
+ use lib 't/lib';
+ 
+-use Test::More tests => 69;
++use Test::More tests => 71;
+ use Test::Podlators qw(test_snippet);
+ 
+ # Load the module.
+@@ -30,7 +30,7 @@ my @snippets = qw(
+     guesswork-no-quoting late-encoding link-rt link-url margin naive
+     name-quotes name-quotes-none non-latin nonbreaking-space
+     nonbreaking-space-l nonbreaking-wrap nourls periods quotes-opt
+-    s-whitespace sentence-spacing utf8 verbatim
++    s-whitespace sentence-spacing utf8 verbatim wrap-width
+ );
+ 
+ # Run all the tests.
+diff --git a/cpan/podlators/t/text/termcap.t b/cpan/podlators/t/text/termcap.t
+index 57688ed..1914dd0
+--- a/cpan/podlators/t/text/termcap.t
++++ b/cpan/podlators/t/text/termcap.t
+@@ -2,7 +2,7 @@
+ #
+ # Test Pod::Text::Termcap behavior with various snippets.
+ #
+-# Copyright 2002, 2004, 2006, 2009, 2012-2014, 2018-2019, 2022, 2024
++# Copyright 2002, 2004, 2006, 2009, 2012-2014, 2018-2019, 2022, 2024, 2026
+ #     Russ Allbery <rra@cpan.org>
+ #
+ # This program is free software; you may redistribute it and/or modify it
+@@ -15,7 +15,7 @@ use warnings;
+ 
+ use lib 't/lib';
+ 
+-use Test::More tests => 17;
++use Test::More tests => 19;
+ use Test::Podlators qw(test_snippet);
+ 
+ # Load the module.
+@@ -35,7 +35,8 @@ is($parser->format_regex(), "\\\e\\[1m|\\\e\\[4m|\\\e\\[m", 'Character regex');
+ 
+ # List of snippets run by this test.
+ my @snippets = qw(
+-    escape-wrapping nonbreaking-wrap tag-width tag-wrapping width wrapping
++    escape-wrapping nonbreaking-wrap tag-width tag-wrapping width wrap-width
++    wrapping
+ );
+ 
+ # Run all the tests.
+-- 
+2.35.6
diff --git a/meta/recipes-devtools/perl/perl_5.44.0.bb b/meta/recipes-devtools/perl/perl_5.44.0.bb
index 8b301a8..5f2560c 100644
--- a/meta/recipes-devtools/perl/perl_5.44.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.44.0.bb
@@ -17,6 +17,8 @@ SRC_URI = "https://www.cpan.org/src/5.0/perl-${PV}.tar.gz;name=perl \
            file://0001-cpan-Sys-Syslog-Makefile.PL-Fix-_PATH_LOG-for-determ.patch \
            file://CVE-2026-15534_p1.patch \
            file://CVE-2026-15534_p2.patch \
+           file://CVE-2026-82560_p1.patch \
+           file://CVE-2026-82560_p2.patch \
            "
 SRC_URI:append:class-native = " \
            file://perl-configpm-switch.patch \
-- 
2.35.6
