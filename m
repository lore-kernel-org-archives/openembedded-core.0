Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1455.1793986363248744280
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 09:32:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pvg8Sncy;
 spf=pass (domain: gmail.com, ip: 209.85.217.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7c03744ef27so329017137.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 09:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793986362; x=1794591162; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u5Z6YrLfxqocpjtXk8xLikFRsxudsx8noPdvGGWYODo=;
        b=pvg8SncyzEbHKFmVhjo/XYrUwCPcVDPXD8cbYqaFE7LnpqNjatO5LJ3mbnd3bXGq5t
         5lT2nMkeij2X/kR6L9l9jW46cGWoRLr+D2HRS+ermKFZZ9A0FcaHs0lRNhbELkUG0Pi2
         c6ypowxJJ9NhZ8W8pnxhSpgkMmC1RKNO4aDHN04A7TU6LuZOGnBaNZgiYe0DkL9aduVZ
         gQ1fgVE4Xc+uenhg+YN9fWFdLVSXOSggCJn7MdQikzVuq+7f/BOlPPQ7B950HQXZ5khm
         p8YRV+WK6KLSiMK8M8dtRrzciSq/z4Kki36Iz2SdIiTOGdo3rIh9w80FqruOittaaSuu
         rtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986362; x=1794591162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u5Z6YrLfxqocpjtXk8xLikFRsxudsx8noPdvGGWYODo=;
        b=K8JHv/AHZ/kXeb1gWi/P4sSRPJNrnyd48v+jQrgTpZvqZDpIcq4uih09LNldtXYsGy
         ubgMMLhJd2QDEv3lYJqH+x0+uwCPcKTEUl36bUOUkmUu2Z6fj0aZ5NbDBpezoxMArify
         LfGUfh4n8gJs5OC98O8m+R4XVB5hiQWhgl7CXxsvgo40rRx13LrYT1t6H9k8SC3dZVNs
         xwvZHuJ52sgDgbXFQYq/IjkQGDbamfu3Q/kjgFq2hcMA9mELHIr2xv+imG/RUyQfkipa
         f++sDrl9LBJUy5UyAUmtBuXclnH5v3lEJU6Heh0PZdyBNVwdt0VyKzE2zQGOj7dEifAg
         YvCA==
X-Gm-Message-State: APuU4Z9+iIW0UCIsfr3QVewj4yKAW+Ary90G0NFDybo73qcjWhCSxdCc
	fUMsyKGwJuriZOgULtwrhx1M+jk2gtT35czxap3elrfh6P8NPQxI++MOM73qUkD6
X-Gm-Gg: AYBFou1mF/6dWAqeiFhjYCVEbBPlKrUuAQ9egWkY3ba1GME1a8xVHugo28a8JLzZFRZ
	3opfEDZI6mgWHZbiNhMjS+FbyppQTkdwJsxaYZgjrrwzTFQQxvOYTDUNl2QQ2v4Shi4It0392C6
	hv5cNgNi4nPmEA9186BwV0KbQVqfkgLEKkNN1b7ATokf24MwjtBHJX9V4SLHSbo4/llQv1MLYsT
	tdhAubHAV2eIeAMGC9FM6M/kJeu+1Z/HkD93GNAX6o2/CSf59YoxVEDSE1L6Cfup5i5vTjkKt/2
	6bu9aq1d0I52thHVlMdZaBTdb8/oh/aSgsZ7EomlCR2mmqDEU3N9TGPJyB/95myJ9v5b/vbsU/A
	PcC4DnNjyr+LUUNz16v9UHyXXaGKmkgna4gey+HB8SDeP+4LqcT513vJshiCr+r/H7HWsn/e0Kr
	3ndVnJg9i3E6dcjoPbrdvYbCKkfvN/uN82RmYJwSYPwEirQqfjL+UE7S5KetgY4b21D3+Nt0/Mc
	LoX2yCvSWS5q+5SveiREBu+I5s0uldqhOJJnW9urDcT5KYwYDGAuWpZO5naiyBD0YEVM5uFnnta
	urWGejRSz4IqA/2c74wwmMMSIqAw0XlR1RZU2WM+PeBdNbn/dCRO1H72Uwi66PFE5j78NhawTXG
	Mh+AUkzxmxqfzd5c2dMIx2VD4FoqZFMxXHWHVfyHcqTtPEw0FFjdHVqkQE0nO3sUsZSEFyQWH5p
	wrVcJAqaGMldofAmlpDBVNLLDuiGcRXDrN7UhutSy2FAeYPQ==
X-Received: by 2002:a05:6102:148b:b0:7d0:b125:79c3 with SMTP id ada2fe7eead31-7d2a16545d1mr1565058137.26.1793986361889;
        Fri, 06 Nov 2026 09:32:41 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from bruce-XPS-8940.localdomain (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99ba74a6964sm2335848241.0.2026.11.06.09.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:32:41 -0800 (PST)
From: bruce.ashfield@gmail.com
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [OE-core][RFC PATCH 06/08] kernel-devsrc: skip the recipe if no PACKAGECONFIG level is set
Date: Fri,  6 Nov 2026 12:32:33 -0500
Message-ID: <20261106173235.4155305-7-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
References: <20261106173235.4155305-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 17:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249706
Content-Type: text/plain; charset="utf-8"

From: Bruce Ashfield <bruce.ashfield@gmail.com>

With none of build, source, full or tarball in PACKAGECONFIG,
kernel-devsrc still builds and installs, but the package is only the
/usr/src/kernel link to an empty tree. Nothing fails until someone
tries to use it on target, and then it is not obvious why.

Skip the recipe with a message instead, so an image that installs
kernel-devsrc fails at parse time and says which PACKAGECONFIG
is missing.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index c2021002d4..621afb04de 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -50,6 +50,13 @@ PACKAGECONFIG[tarball] = ",,,bzip2"
 # python3, make, ...).
 SKIP_FILEDEPS:${PN} = "${@'1' if bb.utils.contains('PACKAGECONFIG', 'full', True, False, d) and not bb.utils.contains_any('PACKAGECONFIG', 'build tarball', True, False, d) else '0'}"
 
+# Without a level, kernel-devsrc would only be a /usr/src/kernel link to an
+# empty tree.
+python () {
+    if not bb.utils.contains_any('PACKAGECONFIG', 'build source full tarball', True, False, d):
+        raise bb.parse.SkipRecipe("PACKAGECONFIG needs at least one of build, source, full or tarball")
+}
+
 # The curated part of the 'source' level, copied in full along with
 # arch/${ARCH}. The rest (drivers, sound, samples, ...) is not curated: the
 # files the kernel build read are discovered from the manifest the kernel
-- 
2.43.0

