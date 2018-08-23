Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f45.google.com (mail-oi0-f45.google.com
	[209.85.218.45])
	by mail.openembedded.org (Postfix) with ESMTP id 6147B79496
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 02:37:44 +0000 (UTC)
Received: by mail-oi0-f45.google.com with SMTP id m11-v6so6767788oic.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 19:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=c4JQEcKpNGq65G651OzRRROh367v8zo9NWRedTaAC1E=;
	b=KRXOTaOoklbOWETnUZTSZ+StMAXcd0AxezQNnZuKbwdKswWAQq7z7GKotlvhZFhwzZ
	/XxIBV6Gn0frjad3HA/vSGY7fYOF1A0DcNWUgiPrzU9FXm51uMrS4yCD7bP6C/4D3hlS
	QtvBmWR7tdIrW+Cpjd1PaL2EDXh66i0GMUyX9X4NPRSJYVdktfp6TCNUd9JIJmL2IuyN
	zuaAH2j+30FmaCLoXdMRwzsDTd15krC0MPRHXgnBRyUzQli/yhNFjwPylEghO03N6BYn
	SY2ywjqQzRIgE2GxkMYl99JWcKiNbJM49WCEnTLr2Qr4uV4JNhXUhkCuIW8TmaZGxC+m
	pzvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=c4JQEcKpNGq65G651OzRRROh367v8zo9NWRedTaAC1E=;
	b=NLH4tnnB52fvgAJESnTJWgI+Gz87RtqDC1M7mvQbMQohPerDStH5WD8jJBVGEU94N4
	JwUF1m2Os/ihvETsaV6PdPkvNEgNEHHUVNtCy/08yH8JBWIG26P/VjaY849I9QznXP7C
	4/zDN0ngFsJtcCAZPWz+ICAZAiT3WBy7wcWIK0LawPx0jEfLWIP8ISFXPomCrBnI7R3Q
	H2apetEalwVQFkrfoGKORKyqlC5SWXtliiPtKPUOPlASfJUhaEQNJoSGikF7HDg8XjFH
	6TNN5TpQ5fIgph5Nk1OsXs1x3qASsFh7QRNUxMuePef9aXGovQlzBRtcO4z4xE9zQZDB
	Vrhg==
X-Gm-Message-State: APzg51C2W+LBr1NXzlyG7vHIHTmzdK76blXPyFWf28PgFC/b4fWVXG1C
	LuDZh5N87ltZNIqJl7kWRUTE1sqoUkY=
X-Google-Smtp-Source: ANB0VdazQ7y7BdXd9H0qJ2ozgg6fcI37G0EVbj/0bc+SB+Lqr9JN+uwFL7xc2TyGRV6nx+snX7hbNw==
X-Received: by 2002:aca:45d6:: with SMTP id
	s205-v6mr6867301oia.147.1534991865215; 
	Wed, 22 Aug 2018 19:37:45 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.119.250])
	by smtp.gmail.com with ESMTPSA id
	n84-v6sm1844493oif.23.2018.08.22.19.37.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 19:37:44 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Aug 2018 08:07:30 +0530
Message-Id: <1534991850-3341-4-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534991850-3341-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1534991850-3341-1-git-send-email-jkrishnanjanappa@mvista.com>
Subject: [PATCH resend V2 4/4] perl: CVE-2018-12015
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
X-List-Received-Date: Thu, 23 Aug 2018 02:37:44 -0000

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


