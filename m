Return-Path: <jatedev@gmail.com>
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
	[209.85.208.181])
	by mail.openembedded.org (Postfix) with ESMTP id BF46D7FCB0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jan 2020 21:09:58 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id j1so45003009lja.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Jan 2020 13:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=FROVry7lQjw5jap7fopmm0OdgTUhGHkVG0PSEgFiCRw=;
	b=hHU4Uq48n5aNe3wI6naiqRRvnHBWJIwNffuGt1mGk952Yo44oImAOIuFX0GdVa3vTk
	sdEKvNqJ4viSj/90BEukhDpLCTrZJDefVTxwGK4IR4lPX8u6Vm1YCqmuEgM2El0DmtoI
	VM//yoDlGppqMpevQAHYW/Wgx6en8zQmu71vbJWbSzbFf5CqKxg3k4gWErGm9NtV4EqP
	IfuBNf0k90HfSp562YhdxyBwcb4ayjyzA9GuhAS17VpE2oOcvtKBRfqoOMiGpfZmhWL+
	dO8V1HwISj6KDIc94EgufHl+xGBkGHrQ+OqKkGhAgzGN1Apu690k+Y3RPaEy5ZN4hhk2
	G2Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=FROVry7lQjw5jap7fopmm0OdgTUhGHkVG0PSEgFiCRw=;
	b=nTJBg4ComfIbodT+SykpYhOK41FOQF5HOoe4M2itn6aO2N2DVvr1IpvK7Uufuwdh8s
	bTneMxIv/ALzwv3JqnMRS++6DZ/PxJFW6vrpBjWRydjgfggv7FR+pqDoEtYXOYgKy2gq
	6xrJi/txy7RDPxhSqomIUjkAQvjhOS1gHejbia0MPCF5HP9vN6K/7q/3TBet0UtiMHL3
	tyaf2g5qumEWluVeIZ1TNklAMuq4PAc71ygrk6RgP9PFMK4i6MqmO7subPuss2VgL7Pd
	FXr8tcOhHlyBRc8ccA7Uighf6+1OoT95nxvq64ovAN+wMOi0Jt777cT0FcusbgiW2qbc
	CCQg==
X-Gm-Message-State: APjAAAVbphUXcTL+cbb5MqdDtFOw7ZNBS8fSMTZTT4Ils0c7uTJXGFHe
	lYE/Vd0sAJsi6vLEpkffF4uxJ2cRzeIBv6QMIlGgWkkb
X-Google-Smtp-Source: APXvYqxFEq9T63iNlq8yuNbHqmozBBDRzrwaR0/4OTmRms8B9FiEngOpaU/5t+apXpkH3Eb/IzSXECA5LmQqcSXbNSA=
X-Received: by 2002:a2e:9942:: with SMTP id r2mr62895178ljj.182.1578344998894; 
	Mon, 06 Jan 2020 13:09:58 -0800 (PST)
MIME-Version: 1.0
From: Jate Sujjavanich <jatedev@gmail.com>
Date: Mon, 6 Jan 2020 16:09:47 -0500
Message-ID: <CAPphmgaUr6H0WEpZvWcCcHy4X3frzCscRERALhKZdRGXPMu7+g@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] zip: Add patch fixing zipnote segfault
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
X-List-Received-Date: Mon, 06 Jan 2020 21:09:59 -0000
Content-Type: text/plain; charset="UTF-8"

This patch has been applied in several Linux distributions

Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
---
 .../zip/zip-3.0/zipnote-crashes-with-segfault.patch  | 20 ++++++++++++++++++++
 meta/recipes-extended/zip/zip_3.0.bb                 |  1 +
 2 files changed, 21 insertions(+)
 create mode 100644
meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch

diff --git a/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
new file mode 100644
index 0000000..aa10add
--- /dev/null
+++ b/meta/recipes-extended/zip/zip-3.0/zipnote-crashes-with-segfault.patch
@@ -0,0 +1,20 @@
+Close the correct file descriptor
+
+https://bugs.archlinux.org/task/47713
+
+Upstream-Status: Pending
+
+diff --git a/zipnote.c b/zipnote.c
+index 5e02cb6..996f012 100644
+--- a/zipnote.c
++++ b/zipnote.c
+@@ -661,7 +661,7 @@ char **argv;            /* command line tokens */
+     if ((r = zipcopy(z)) != ZE_OK)
+       ziperr(r, "was copying an entry");
+   }
+-  fclose(x);
++  fclose(in_file);
+
+   /* Write central directory and end of central directory with new comments */
+   if ((c = zftello(y)) == (zoff_t)-1)    /* get start of central */
+
diff --git a/meta/recipes-extended/zip/zip_3.0.bb
b/meta/recipes-extended/zip/zip_3.0.bb
index a2cd771..c00a932 100644
--- a/meta/recipes-extended/zip/zip_3.0.bb
+++ b/meta/recipes-extended/zip/zip_3.0.bb
@@ -12,6 +12,7 @@ S = "${WORKDIR}/zip30"
 SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/Zip%203.x%20%28latest%29/3.0/zip30.tar.gz
\
            file://fix-security-format.patch \
            file://10-remove-build-date.patch \
+           file://zipnote-crashes-with-segfault.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"

-- 
2.7.4

