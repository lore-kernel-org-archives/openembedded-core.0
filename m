Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1DE2B79403
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 13:21:04 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id k12-v6so3042777oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 06:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KnERB40MAD9awAATf+Q+hrCO3tB2FA7CtJ6ldvg9KTc=;
	b=orv72F5Ep1z9mV4zuQc3YeHbtEC8pggVvo82qV4NdbOZltqyZimpA2edfg0eR68ykF
	Rg4fhAXcmOiWHfyW8LSlMVQsQGgdz2+ZdzNWBCfLc4+avIEI6CCEywERvz0sjoYOnZ3B
	Q2qvKG9Ma+1FDXV/fQjqX+BueaJuP4zyOL6oC1Rnbs1FNGJJlwSDmML68s6LBC4x20bC
	fSi67+5tjXrtideeOjByijbQyPeKEq2OpGezbqq3FhW28nvhahAyqkkxqkKuHciq050R
	2Ovtl1EdD6BGhuKtARtmlBtcv+mJ9uvmX69+n2lW1OLvJuA2B7I3v2/dligf9f1TKncI
	jkzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KnERB40MAD9awAATf+Q+hrCO3tB2FA7CtJ6ldvg9KTc=;
	b=Z5Xcd+SqrhncJGFv6Bj2qR4kXk7s9ksH0DuLpa6OApn6cQLo978zzfnbITZ1cNQBax
	StSOVhY7PLtp3HZHKbvBhyHZUdImUeP3dtYBP/A5PFD0+IU2LXJkZOyp+I+qOSiEw7OY
	/I0QpwVyBnksjik7RUU7q6Ukz2t4IY8Cfs/SnE9faRuVRZhHQoi1tAcbwK7lRFgrV8/r
	NnZiBsbxl50b6grO1wfh6FySZHBHLBdiZak4C5Fyh4/tRp3Z7D95futO1Bxq53iHq1S/
	jtV6hq6ZP9E17sV3+E/cE+ZQGaj0qUz5xlaQaXpNBYGN5FmmmmyMlvrV7IYnhzEXk+U/
	/+4w==
X-Gm-Message-State: APzg51CKnLCXHzJgy6aIw5vXi6+iWuZsoECcKjZD6O7cYTZZJyefvJca
	R19xeQb+j0zvZMC6/XtvDw2St2kuX1M=
X-Google-Smtp-Source: ANB0VdaG6FefDyWa8MYNWGjBKRjX4Anzvwob9oH450vlUpLIRMaU/0csD6QRAPo1f/7eJO3hsbGfhQ==
X-Received: by 2002:aca:5885:: with SMTP id
	m127-v6mr3655664oib.162.1534944064984; 
	Wed, 22 Aug 2018 06:21:04 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.3.26])
	by smtp.gmail.com with ESMTPSA id
	t141-v6sm2354715oif.18.2018.08.22.06.21.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 06:21:04 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 18:50:08 +0530
Message-Id: <1534944009-21362-18-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534944009-21362-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [SUMO][PATCH 18/19] perl: CVE-2018-12015
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
X-List-Received-Date: Wed, 22 Aug 2018 13:21:04 -0000

Remove existing files before overwriting them

Archive should extract only the latest same-named entry.
Extracted regular file should not be writtent into existing block
device (or any other one).

https://rt.cpan.org/Ticket/Display.html?id=125523

Affects perl <= 5.26.2

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
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


