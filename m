Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id 97248792F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:42:28 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id y207-v6so2535345oie.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c+8bZEhhMQ9ZlyUHClKRUmI+MHAAsvt09+BzIeoJZE4=;
	b=0DovJ+E4zAMInRdAykPMEmVOtdbTpPLJZgo7ZePbiVrFkqjxQ4bs1ReAc+oPps7RDV
	WOFAuf9DjiO24toorbOhHcxbFGqaP7BKOstny1yDD0Db8iCA9rCFf1WbfFI47cmVMFU0
	MD5huFIuEQBs5ZKteeP/ui72W0L9HsTGv7Cc0eci1apwk29Z5C0w5YY3u4CWHmlUV/Uf
	/Hu6CsQrFUf0Bw6Z61wYFE1EVgaA5gSzxeLxgJlO6BFuh2YIOiy2OjG9EsjLt2vja+d6
	cL86vVJ+j51yb7h9JKDw/oCSsx59ya0uwqGlXNDRlCOnzM1f/TW7NWKGrecNWTU83cNc
	QlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c+8bZEhhMQ9ZlyUHClKRUmI+MHAAsvt09+BzIeoJZE4=;
	b=r1NRKZQsvC4/xXxzWRoMXXLqK05V+l0b5di61CR/XgEHh98E4LaA1C5uIrDtqOW76s
	q4Uvi9ajdXWkRrdxgeHcYIzEcRyzqTnR2LjoGCsnEYwQj4q0obY22yqPW1SNh/g+t6Vh
	OcrS8cfOW6XGkvIQIzB1e3iGx5Thm/Ejeiorivgfx8DTHmmhnxX50sqJOsWfRqlUDdsn
	jdeauqtjP7KduSFIeuJYbRNbQfviH7PmrWRY8wvk/dZCrUsZWe/vwEFtEt+sK/+ocNNe
	8QxzT8qMB2kRMQTiq6tCDtXECYGRZlOJixERfj2Ke/OQkZEicvhZBJG+9H+bwcMZrt0b
	tErA==
X-Gm-Message-State: APzg51CUkc0SKqTKw8+UGNJ8B9NSvOuk3m+8ljD6JVD8k8iJqs/QhXx4
	IKuVMUQwNpgXhw/elWcFCz//stjzrQM=
X-Google-Smtp-Source: ANB0VdbiWQ3ojGY0YpmMyVcQwqWJ7Y2Yn+tWXMh+wi32Lfa6ulkkdBXSB32uOvSDa4EMV+37Evk5XQ==
X-Received: by 2002:aca:310b:: with SMTP id
	x11-v6mr3644527oix.74.1534938149478; 
	Wed, 22 Aug 2018 04:42:29 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	f144-v6sm1323750oib.39.2018.08.22.04.42.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:42:29 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 17:11:52 +0530
Message-Id: <1534938113-12197-12-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534938113-12197-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534938113-12197-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH V2] perl: CVE-2018-12015
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
X-List-Received-Date: Wed, 22 Aug 2018 11:42:28 -0000

Remove existing files before overwriting them

Archive should extract only the latest same-named entry.
Extracted regular file should not be writtent into existing block
device (or any other one).

https://rt.cpan.org/Ticket/Display.html?id=125523

Affects perl <= 5.26.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
v2:
  Corrected "From:" address

 .../perl/perl/CVE-2018-12015.patch                 | 48 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.24.1.bb          |  1 +
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
diff --git a/meta/recipes-devtools/perl/perl_5.24.1.bb b/meta/recipes-devtools/perl/perl_5.24.1.bb
index bb18c6a..5fed896 100644
--- a/meta/recipes-devtools/perl/perl_5.24.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.24.1.bb
@@ -70,6 +70,7 @@ SRC_URI += " \
         file://CVE-2018-6798-2.patch \
         file://CVE-2018-6797.patch \
         file://CVE-2018-6913.patch \
+        file://CVE-2018-12015.patch \
 "
 
 # Fix test case issues
-- 
2.7.4


