Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by mail.openembedded.org (Postfix) with ESMTP id E90F3792A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 12:00:52 +0000 (UTC)
Received: by mail-oi0-f47.google.com with SMTP id s198-v6so2624551oih.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 05:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c4JQEcKpNGq65G651OzRRROh367v8zo9NWRedTaAC1E=;
	b=W2uYKHZ9SYmMhZcTXVoMrWSUvHc0fxFna3Q7VfHjMwlI2eWceFlWIpxko5WU8wDEOq
	HVPEf895a8/FQRHyEo6q+vhK+3RJo7lWHByf1nYlZyFO2n+tOtizDsAMsno7enxpk+OE
	6YsVAxEsLBsVo05higFREZAnVEeZnyWE9sVjltuP8JXkYcbywqNSc2NOo7XmfHaxguLi
	cP+fed5Ud7pNBp6CUI9Imrg4EarMOncll0g+R7wdfBbdpxJTiJuIW8XoANDGZmfJkk2/
	t5SO/8VSitJtYm6tm4Ut0sYQptm3lCEiEJudAMTif31CvFQGYz3ja5Z4tBn7ksi/Ks5s
	buNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c4JQEcKpNGq65G651OzRRROh367v8zo9NWRedTaAC1E=;
	b=r3iY1Em1bwibW9P0vYomzJUlMX+OblSVn8SmbDulCHbByGZ/hCh+TBJR6pYQJLN5x4
	aNfeuRz9wJTf2Ntme8p2zWuTs1Vzl5CMGsXF4x/eOSuTyJFWrhDi6IpbfenA+4IZ6PLK
	jaZJeUXDpJ8O9V5ofkWTffbBqquSoPVQ02MLxsKh6F093ChTlhhGVozscUuIxjsocCku
	F1P+DfxzaUstzIB+f2ECqIeOUFYQ434cHsYXiWnEMjmCo2qaps4MYq24iIbrEzvv4pd5
	HdahOxCpXWbzpvfUOPmw4K2AXXDu6I1Vy2T4t+s3Lhfw7XHrgSHV5wSf0tj+qZjlnnjp
	xRlg==
X-Gm-Message-State: APzg51Bz6p3KxkXotNFEyRC2ZZdttqGAvIKD9EJL+DiSnvhOfB8IBRfi
	HgO5HOgPdMVFSq9b3+SbZIh4tOfVaeQ=
X-Google-Smtp-Source: ANB0VdapkSiGmNODDk3aamke+bvfWs0aZ9bygcNpNHsc8yIxYdbX6/Z1PYb/GkIHVn+JVV+H2GdczA==
X-Received: by 2002:aca:acb:: with SMTP id k72-v6mr3523444oiy.78.1534939253412;
	Wed, 22 Aug 2018 05:00:53 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	h186-v6sm3129596oib.55.2018.08.22.05.00.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 05:00:52 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 17:30:32 +0530
Message-Id: <1534939232-13249-4-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534939232-13249-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534939232-13249-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [PATCH V2 4/4] perl: CVE-2018-12015
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
X-List-Received-Date: Wed, 22 Aug 2018 12:00:53 -0000

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


