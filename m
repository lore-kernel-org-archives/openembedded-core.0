Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 55B3A79174
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:15:34 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id s198-v6so2440855oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c4JQEcKpNGq65G651OzRRROh367v8zo9NWRedTaAC1E=;
	b=qReX+j15O/cpkZ0h5A8zkdWU8yA/8zaLh3kDofFdDOrl6EfPHHynq4L/CqNDO4i3zD
	SMEpP3tRG7MVfp3mcEK6ukjeBQGrREEQvNvtfuiUnO9JkjxTMzA7R7lgtuh05WvJmY1Y
	ezg6rZoPG9hqG8wCEKIujInGg85VrS7zXZnMFxiPjnZUzXSQVU11ih91tgxIafbCXZ7/
	GMiRpSQB/pRzcJZQRDmicHoQMOwxNbI1EvLb54+Q+LZnz5JBizhaFuRyXfdpVnuEVqsN
	ba+2bEKEJwsfPc5NpBRV46AW+u/o98NYtmbe8XkcTRxirB2nFUbjNKxyHhSDoU5Zxj/P
	hNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c4JQEcKpNGq65G651OzRRROh367v8zo9NWRedTaAC1E=;
	b=FAI3+/CeFGynsMKrj+F4lq8P3A21dpCt38W0J7YFZG48FZu5Bf/kw/ChmPNzf8CAhu
	ZO49vbEWRWoq/9PBNKf6fNs1AtLzyfiibpd251SpmfoABv50/WscMd3ZGhslNpe9vChF
	f4Wl5qtlnggJHK/oiYYy3NCaQa57Dq4R7X0nb70LqEwDhvSJWIqwH6UAPcvjRw9msmmP
	mddBPCjUBCYMa8TDwn7zwpZaSjEJJVLgUPyR6pfKr2JakpOSBpWLDegbpcH0SgzkSfwn
	NwfukgzR2vegyEnXr7wP0olP8zuiNKMcuF9/TBFVtdIjTl0yIWuEtPkvPN3jHbe75XNA
	wmWA==
X-Gm-Message-State: APzg51BWkYDUxXCttMqEZTePS0LZV2xy+dUi6OP3RsIqjUags+Xy7jGU
	KuU8JbtFRfBJJ/GZgTRCrndWKs3Dn0o=
X-Google-Smtp-Source: ANB0VdYvYrEaXIx1AZjoymguqlUsCsg/w9WLHAGGGyTWZNWLgO9V0Xv4tv6y1nauWWFYtTDI8a4rjA==
X-Received: by 2002:aca:4d0a:: with SMTP id
	a10-v6mr3344256oib.175.1534936535334; 
	Wed, 22 Aug 2018 04:15:35 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	e205-v6sm1656620oia.9.2018.08.22.04.15.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:15:34 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:45:00 +0530
Message-Id: <1534936500-11509-4-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936500-11509-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936500-11509-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [PATCH 4/4] perl: CVE-2018-12015
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
X-List-Received-Date: Wed, 22 Aug 2018 11:15:34 -0000

Remove existing files before overwriting them

Archive should extract only the latest same-named entry.
Extracted regular file should not be writtent into existing block
device (or any other one).

https://rt.cpan.org/Ticket/Display.html?id=125523

Affects perl <= 5.26.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../perl/perl/CVE-2018-12015.patch                 | 48 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.4.bb          |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/CVE-2018-12015.patch

diff --git a/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch b/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch
new file mode 100644
index 0000000..a33deaf
--- /dev/null
+++ b/meta/recipes-devtools/perl/perl/CVE-2018-12015.patch
@@ -0,0 +1,48 @@
+From ae65651eab053fc6dc4590dbb863a268215c1fc5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Petr=20P=C3=ADsa=C5=99?= <ppisar@redhat.com>
+Date: Fri, 8 Jun 2018 11:45:40 +0100
+Subject: [PATCH] [PATCH] Remove existing files before overwriting them
+
+Archive should extract only the latest same-named entry.
+Extracted regular file should not be writtent into existing block
+device (or any other one).
+
+https://rt.cpan.org/Ticket/Display.html?id=125523
+
+CVE: CVE-2018-12015
+Upstream-Status: Backport [https://github.com/jib/archive-tar-new/commit/ae65651eab053fc6dc4590dbb863a268215c1fc5]
+
+Signed-off-by: Chris 'BinGOs' Williams <chris@bingosnet.co.uk>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+---
+ lib/Archive/Tar.pm | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/cpan/Archive-Tar/lib/Archive/Tar.pm b/cpan/Archive-Tar/lib/Archive/Tar.pm
+index 6244369..a83975f 100644
+--- a/cpan/Archive-Tar/lib/Archive/Tar.pm
++++ b/cpan/Archive-Tar/lib/Archive/Tar.pm
+@@ -845,6 +845,20 @@ sub _extract_file {
+         return;
+     }
+ 
++    ### If a file system already contains a block device with the same name as
++    ### the being extracted regular file, we would write the file's content
++    ### to the block device. So remove the existing file (block device) now.
++    ### If an archive contains multiple same-named entries, the last one
++    ### should replace the previous ones. So remove the old file now.
++    ### If the old entry is a symlink to a file outside of the CWD, the new
++    ### entry would create a file there. This is CVE-2018-12015
++    ### <https://rt.cpan.org/Ticket/Display.html?id=125523>.
++    if (-l $full || -e _) {
++	if (!unlink $full) {
++	    $self->_error( qq[Could not remove old file '$full': $!] );
++	    return;
++	}
++    }
+     if( length $entry->type && $entry->is_file ) {
+         my $fh = IO::File->new;
+         $fh->open( '>' . $full ) or (
+-- 
+2.13.3
+
diff --git a/meta/recipes-devtools/perl/perl_5.24.4.bb b/meta/recipes-devtools/perl/perl_5.24.4.bb
index 4709d3e..1dce3bc 100644
--- a/meta/recipes-devtools/perl/perl_5.24.4.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.4.bb
@@ -64,6 +64,7 @@ SRC_URI += " \
         file://perl-fix-conflict-between-skip_all-and-END.patch \
         file://perl-test-customized.patch \
         file://perl-5.26.1-guard_old_libcrypt_fix.patch \
+        file://CVE-2018-12015.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


