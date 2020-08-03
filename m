Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.12673.1596464853807610862
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:27:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=yCen35oH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id ha11so11397419pjb.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=g1ZYZzDRmh1w6m9UIdv0zRXaeHWLnNZUxBRjj6xDsX0=;
        b=yCen35oHPAG8LlP0eh4cORqOyGHIWawXjJST03WEvwuDtniDJJLaJEacfugNAAzG0y
         z2aj3csZwOJ8phWibQY/f12p7tsRPTkmRHpNIdY4WqILlBVV7v1SqPdNw6gWmmJtMH6W
         UxJX5zGVoxk9QmY7XeuqE630GkBcNN4938t3iXhETOeAGf/oOntK3MGdevJwWFxEaPTV
         HjKOKIRXNIhPZ6dWJ9DHU6mkNccdBQghe93JwjA9hLqj5+up9i0iOAnFUlHNjzQ9VWCP
         J8TVUdXVwXT1tD1Io/dXxoG4SAgk8G4Re5ToNGUaUFcK0HZsJbli0PT7KShH6MBf+IbT
         sdXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=g1ZYZzDRmh1w6m9UIdv0zRXaeHWLnNZUxBRjj6xDsX0=;
        b=MWoHPbaLGwv1XS1++f5dT2Rp/6P5pPSjSe6EAT29f6QrbT6MiT+C7VrZEpK2daSMJt
         bBTo0O8NAnW8xEqRGvQwgOnmBGBB3bCaH17ON7ibsdCWw8FdIJ4pj9L0NQOlxPBB3MRv
         +c5Uq+yeIwsnzpqrFQ691AKWuDVyLZi+Nt4xZPflxyalM7jvabE6bI7ai5MnswkrM9Xp
         VOqzjPMTyltzmlHXu+FrAwLPqV388wo23W/DLsENRqxcbsIINs0rDWq1HuzbWllkCmIE
         Nle08tes5QmMP7CxDH3W0GBhcpy/h038s9u103csStRb5ZMSmBSOAFKZNfR/47KgaFkK
         45cA==
X-Gm-Message-State: AOAM532yz4LQg8KdkpzNPfiV3vampubPee10wJuQSpNxqEZF4S73sW31
	4FNQzKr8+N4WSZn5UXbR/VZV+LHi9kg=
X-Google-Smtp-Source: ABdhPJzcmeKnmXk8w+QPbkFopmkn6GJmAkZISsZqTXO5R9BGgXRYZXrqpXfH94Ia848yTZKo+6b2yw==
X-Received: by 2002:a17:902:d345:: with SMTP id l5mr13850081plk.276.1596464852823;
        Mon, 03 Aug 2020 07:27:32 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm10913729pfq.189.2020.08.03.07.27.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:27:32 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/12] gtk-icon-cache.bbclass: add features_check
Date: Mon,  3 Aug 2020 04:26:58 -1000
Message-Id: <8f55aa8139347e8ac491002f10d1ba220430ea82.1596464561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>

From: Changqing Li <changqing.li@windriver.com>

'bitbake world -k' when DISTRO_FEATURES don't have x11 and wayland,
report errors:
Nothing PROVIDES 'gtk+3'
Nothing RPROVIDES 'blueman'

gtk+3 set ANY_OF_DISTRO_FEATURES, so add it here too
since we DEPENDS on it

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab9ff563c77cd5105f4ef9426f076b10ea8e2ee8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/gtk-icon-cache.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index dd394af27c..340a283851 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -1,5 +1,10 @@
 FILES_${PN} += "${datadir}/icons/hicolor"
 
+#gtk+3 reqiure GTK3DISTROFEATURES, DEPENDS on it make all the
+#recipes inherit this class require GTK3DISTROFEATURES
+inherit features_check
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
 DEPENDS +=" ${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} \
             ${@['gdk-pixbuf', '']['${BPN}' == 'gdk-pixbuf']} \
             ${@['gtk+3', '']['${BPN}' == 'gtk+3']} \
-- 
2.17.1

