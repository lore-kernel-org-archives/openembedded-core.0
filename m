Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10502.1795001328759859383
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:28:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Gfw+v+Dr;
 spf=pass (domain: mvista.com, ip: 74.125.82.171, mailfrom: rsangam@mvista.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-36f8cdd30beso278260eec.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 03:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1795001328; x=1795606128; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EvKJbWgYKs1y/4Y1/GsPakXntcVUqD/BGdfezud9eSw=;
        b=Gfw+v+DrpA7+jL1uo+m8NSvJNvii5oFdN2uSbSz807Dfg8Fh4tK/rcSOCsZFZ9M3fs
         HRD4UdLDD0riGli/ClKlDadhD7HElp2gvSubP3r1o5J8a4Q1hzsIS0g276ULFtgixJ7U
         hVA3DkkCy5Hk9I9huvhPtVOs84+Xz+XpsYVjk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795001328; x=1795606128;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EvKJbWgYKs1y/4Y1/GsPakXntcVUqD/BGdfezud9eSw=;
        b=RV3xqYshivNQBPND5m5SK/bzqQGjP+Z2W2rtQhAd6JMI+BDTtxJPNk6c9tPYIBjqjF
         9jjUSZbWcES9V8OCFSrvH5wOiehe/haG/MwqFZUo6HmcvIqu1WE4j8WLBxJYdHAR+lRs
         2FbgYqeMkJkCzrNJR1ao9V1sFHkUId9YrPgYYTuz6zkdvkMCk9BqHbAxadvIINOGt8JN
         8XnXmmd9udrnaPxPJo1Tt9C19S3qwdRoF7B21JwPoXjeB1RxJjOvmnTEhYEuPCuKuW7K
         uNUSeDJxfWDn50Inl6bQFBCZtUT8JKIIDDN9ZD3pwOA/c0LnSxR4fRaQPVcN49HCMaJT
         6MPw==
X-Gm-Message-State: APuU4Z+0z2GthWbi0YJOOithvX2MJrybAeCzBhmbc/ZbeLq0HbkSgJ9w
	VEX0L11ncQWdFon7SL28Rxgkte65sjM2l1bnivOfhRAR4pcHzso7WtdegGTr2Ef9Un8LcKpR78c
	7S0gIGtk=
X-Gm-Gg: AZFdTZccfjfMYGQaS6QANqb4n2sXKAEDJLiEuj3jr9wPuKfL+LSwFLeRS62or85C4zd
	ptX9nLx3e4IoRKYx3D0+ZH/9tBfZ/k5OshpGTpvKjuLxgYJ4QK3P6g2wWVz4eRVS7FZJSz/etW+
	LMdup/LEjRlBIho+V4lo7S7hgNx5cRxQwv9sQLLCdYc1pNaNyw6lxvsYSOnLH779iRvFCg6SGWa
	G500MLTLmo5OnZDdZQufo4E6qTEx3ZSl7mLhqlxb5FmmKVOQ3zoSUARm9YLca8acbsrJ4n75piu
	Pgf1RSbmZ5qYewCj4ydZ0q67TtCYNtk9b+lEiVKAnJM9vatkY5d1fXqesKvOf3YOU8mtlsf+XY/
	MdBwfQ2kiDqx7Pok3199RHJfm+BkRD4tcYA9zMWc6spQzCbHI2pHcHP2mg6FmStYlO85YcC770u
	wnRAMS7FgoeANfXK3P+Xs/Qpzc1Y9zT2KZKN3I2o48ooph52BUS1xSjGpFXFflNj1xmO6ybsbw2
	2GBlIMKKCgJBD5qMHPI3ctNCvsK2KmGFUAlGP0bakd7SS5T80Omm3QyDbvaPSFgZwrSrkc7trSR
	uUP8S27SYxTucR9/BRMZWmAmS9XaUnXo10Q7Jw==
X-Received: by 2002:a05:7300:f792:b0:36e:a265:8ee with SMTP id 5a478bee46e88-38280c3452fmr2153316eec.18.1795001327902;
        Wed, 18 Nov 2026 03:28:47 -0800 (PST)
Return-Path: <rsangam@mvista.com>
Received: from MVIN00040.mvista.com ([49.207.195.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7bc05cfsm7565776eec.26.2026.11.18.03.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:28:47 -0800 (PST)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>
Subject: [OE-core][scarthgap][PATCH] libxml2: Security fix for CVE-2026-74860
Date: Wed, 18 Nov 2026 16:58:39 +0530
Message-Id: <20261118112839.94636-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 11:28:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250542
Content-Type: text/plain; charset="utf-8"

Pick patch from [1] also mentioned at Debian tracker in [2]

[1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/f41e1865781f74d1cadfe2fbdfeefed946026f12
[2] https://security-tracker.debian.org/tracker/CVE-2026-74860

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
---
 .../libxml/libxml2/CVE-2026-74860.patch       | 35 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-74860.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-74860.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-74860.patch
new file mode 100644
index 0000000000..0a56282bc4
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-74860.patch
@@ -0,0 +1,35 @@
+From f41e1865781f74d1cadfe2fbdfeefed946026f12 Mon Sep 17 00:00:00 2001
+From: Daniel Garcia Moreno <daniel.garcia@suse.com>
+Date: Tue, 10 Mar 2026 20:30:20 +0100
+Subject: [PATCH] python: Do not decref string after adding to the list
+
+The python API PyList_SetItem function "steals" a reference to item, so
+we don't need to call Py_DECREF here.
+
+https://docs.python.org/3.13/c-api/list.html#c.PyList_SetItem
+
+Fix https://gitlab.gnome.org/GNOME/libxml2/-/issues/1076
+
+CVE: CVE-2026-74860
+Upstream-Status: Backport from https://gitlab.gnome.org/GNOME/libxml2/-/commit/f41e1865781f74d1cadfe2fbdfeefed946026f12
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+---
+ python/libxml.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/python/libxml.c b/python/libxml.c
+index 2bf1407..728ecbf 100644
+--- a/python/libxml.c
++++ b/python/libxml.c
+@@ -1232,7 +1232,6 @@ pythonAttributeDecl(void *user_data,
+         for (node = tree; node != NULL; node = node->next) {
+             newName = PY_IMPORT_STRING((char *) node->name);
+             PyList_SetItem(nameList, count, newName);
+-	    Py_DECREF(newName);
+             count++;
+         }
+         result = PyObject_CallMethod(handler, (char *) "attributeDecl",
+-- 
+2.44.4
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 5e4cabbf5d..387f47c3ed 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -39,6 +39,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86142.patch \
            file://CVE-2026-86143.patch \
            file://CVE-2026-86144.patch \
+           file://CVE-2026-74860.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.34.1

