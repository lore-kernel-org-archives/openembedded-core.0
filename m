Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id AC1E179258
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 11:18:00 +0000 (UTC)
Received: by mail-oi0-f54.google.com with SMTP id m11-v6so2511963oic.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 04:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xMY0FiQqGMtHEUpQ/s8J84O7p2lyLxfFmSRkzA1NIh8=;
	b=yqb4cKRLA2CJrC9Q058lIuT6/2m87Yq4sKD3VcBaMd6TNXoRW2SRqDxhs8E6TeuvnF
	i7PUxhFFU3p9TGQTXkM9KXg6tNn4gPTWiBWN60BXvJvqj3kaOQNNaqZ5YLyScGBuUo9j
	s6f+W8D/GpjCpp/RbKWqHgP2ROPsNQ3r0gM7Y0Xj4n9dXqDo32g0w1RklUakC+7KAoq9
	nzSfIW2Z84YclGdEUPest8hp1RUuanumF4x4edL2pOkrX3+3gImxL+RfAH44bYAAv9fj
	yLEXJcWjHzPL6gCY4bkOuEyTEoOH/nG86L8eqd4MOhgEK5l8D7M9Nwr8PBZEOxH6jrjB
	Rzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=xMY0FiQqGMtHEUpQ/s8J84O7p2lyLxfFmSRkzA1NIh8=;
	b=q12cB5p1SlVuh7GQb8U1Tew8cHZmUCcNeAyuBF+iHjT7Itlo4OmBEVdZFkjZPu9yN+
	wUqz/3OxZqLlW7MWiiHMaEs/fZ84Djvr4KuwNSakaow+wxNFYRikPk1xfF5y2fFue5dt
	czO6qlS3BQVIeIO5zBhYKCbXaNNngvKr2HzGjocYSDhzFWgJ57ggGLhSJBPu3TQb0Iix
	l0/iPEYqu/RV86lVAGMOwB1pW5/3nhJsQiyn5eTHdR5Y9ttavDkLC14pkuU1rz4qP8ZQ
	mPpzWefmnjLaZlJuGUHBhkp71xd8ottyAM12Qoi7zV9TTQPGpRBPJNMHMC/oSrSSvi6z
	TRkA==
X-Gm-Message-State: APzg51Bak6NYJLn+1d9qjxeFbv1uOHVTfwOFqFJyCJHrTskG1LHhv27e
	b1rn/yOEULne9+AGmSKhL2EYwURQOrY=
X-Google-Smtp-Source: ANB0VdbnrfhAeGXvxaWS/Jf51OuWzJkMgvzZh5XTjCgAIeSEohQG49nck3lC/vSpvD1iBDpDZyVsmg==
X-Received: by 2002:aca:5a45:: with SMTP id
	o66-v6mr3487364oib.155.1534936681605; 
	Wed, 22 Aug 2018 04:18:01 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	v5-v6sm694446oix.36.2018.08.22.04.17.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 04:18:01 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 16:46:54 +0530
Message-Id: <1534936615-11658-18-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534936615-11658-1-git-send-email-jkrishnanjanappa@mvista.com>
Cc: Ferret on Shark <shark_admin@mvista.co>
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
X-List-Received-Date: Wed, 22 Aug 2018 11:18:00 -0000

From: Ferret on Shark <shark_admin@mvista.co>

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


