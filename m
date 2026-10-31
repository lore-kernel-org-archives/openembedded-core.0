Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3739.1793405760926226941
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 17:16:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=QkhU3wmC;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so10822395e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 17:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1793405759; x=1794010559; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B8e/1hPUYF7XWTxY7TKGR+voFJWZw6veG77yXSTn9i4=;
        b=QkhU3wmCpElRI0agi70mknnVpfNp39Kl92ZN4flrnfVX8PTYODXY0lvhfGkDHnwtAG
         EgcT6cqNd6ufB6MI+KwMKjRqLoFMehWybePDvc8qU4llBdMTjcPUFwIdynXy8SI9BM0q
         whpYPLWn0+FEfaYoGvEo+OgtYiIO1ZrE6lw1c/V+jdNKubuTmElPvPSf+x8jQq3k9rAO
         BGRp49E+/4yemYlBGCEc7KlNkV2O8NDGVBOdDDwlueRTDH1/45UoCtxurMkjzdctTHzk
         c3HcgaTPm22AaTFdGzwY6GHnzs6XRFmuncbOzNLaWGsDqsBkW9hIzIDCCXAxxBtMPbxO
         5lnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793405759; x=1794010559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B8e/1hPUYF7XWTxY7TKGR+voFJWZw6veG77yXSTn9i4=;
        b=hKoqNWGlcIwxdukDqVSer013zDMMf0DvyQICnFae0GG4Y0LEjZfEYLiqiUNv8T41bJ
         pL2TceNLcVZGcn5FNfv/TmhZEFZG7wU5yIyJbU3XUo2JPsfTjQa7+vreDhteWG9u8wTi
         MEiQUsV0DM/cXQV7EnIL+v+2H51/TkTkd1HE9+iyzf3/eZHozWavjZJQ64KC9BUNKGjz
         Afckev4p5I8ZRWXvmoQHkdu5YJ2pCemaB6zVr6N3drjIcBnDSoAMwx9uWStXqRZqfsKn
         E7avhbRr0SvHQ7DrwBsJyMWtSPEw4+dKAh5ykJ9ck82qdfu6N1y/z8bKzu9GKgz/B6dp
         7n0g==
X-Gm-Message-State: AFq9FYLGxf0jkxikOfCllY6DESzILRmdrbecqMxP51zuO4frP9N6o/zx
	5PEPlWugw/Vk25NGC/t4YT9uC9kP+SFSrnGBQGGqrcevJ7nVlq0FaB0o+IpWwHTTENQ8KlmNKIJ
	gw8MPubA=
X-Gm-Gg: AYBFou1wzmV6RHkU44U8w2TXwh3LjFIQFDR3W4cg1niJOnyziaOVpW7iGpefmTTfJ/g
	ov4tNLJn2Hn1BeWjwSJHHoJdOh1PcVW1P7K7b+ECqbrYzqu9vugI1iPL+JG5AY26LHd9gDwBCPm
	3KN7gtL08pZ3n2/MPzAZFIG6S+Atu3afiOEdntXEbmkLc1eyqmhIV8+6kchtt1eT0g7otCMZHyc
	YXnNGU/b2ADKnkvPPTrlItpacdm8tEErM5j07JxspdHIoh+Xa7GjQIZ+EiNDlLllRB5dn2FxLd2
	zcmF5Mkdx2Nk+msatbD0Wpl7/fQpjiT//1WWf3pqLFA/ZKAMcP4ohOlT875cgiDVg1N6CAn7LHU
	B4PTy0xs3Dzwz6KbErEnLQKvRhJ9voS7LDsq6BvGfYX2BjRFdxlofscdficl2QFS4MmMKQy0u8i
	wLpo0X6GHmfcvBRtVobrBTHyH1gEN7UsMDVyDQSeqwxm+altfZIqepuobAQxw45Uh7WaryZfqWe
	+cWs1qT7F3le8G+66a6M3TNNPDTrfFYQ/URxto+hWEtTaAC0O0Qe2mQzp1WGkcrTTbozkXnXe0I
	2zQwgaNiycwaHL/atMukrNK1S6vJfUzCWiPPQ96vgtb+cVVafGmXEDHf8YW2skJOphzBdUctJEL
	yCbbEUOJWiW4tWp1cS9NFeOaSg2K+TiM5i9jxPcNTQZJgNWo9OQ==
X-Received: by 2002:a05:600c:1f87:b0:4a1:f68a:9736 with SMTP id 5b1f17b1804b1-4ac17b2be08mr85337655e9.26.1793405759129;
        Fri, 30 Oct 2026 17:15:59 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm130350635e9.12.2026.10.30.17.15.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 17:15:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 27/55] glibc: patch CVE-2026-77117
Date: Sat, 31 Oct 2026 01:14:48 +0100
Message-ID: <53899a08c24fd46024112ebb665d4dcd4a04a8ea.1793405493.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1793405493.git.yoann.congal@smile.fr>
References: <cover.1793405493.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2026 00:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249102
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41 branch (oldest release
still receiving security updates).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: fixed a 3.41 -> 2.41 typo in branch name]
---
 .../glibc/glibc/0037-CVE-2026-77117.patch     | 32 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.39.bb         |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0037-CVE-2026-77117.patch

diff --git a/meta/recipes-core/glibc/glibc/0037-CVE-2026-77117.patch b/meta/recipes-core/glibc/glibc/0037-CVE-2026-77117.patch
new file mode 100644
index 00000000000..fa42a548c34
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0037-CVE-2026-77117.patch
@@ -0,0 +1,32 @@
+From e43e46f94398b3de446fec11da1e7633ea5202ec Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Fri, 28 Aug 2026 10:26:07 +0200
+Subject: [PATCH] iconvdata: SHIFT_JISX0213 decoding lacks pending character
+ reset (CVE-2026-77117)
+
+This fixes bug 34556.
+
+Reviewed-by: Carlos O'Donell <carlos@redhat.com>
+(cherry picked from commit 68d94bbe50b7577d48998107d632ef3a0df050e3)
+
+CVE: CVE-2026-77117
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=e43e46f94398b3de446fec11da1e7633ea5202ec]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ iconvdata/shift_jisx0213.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/iconvdata/shift_jisx0213.c b/iconvdata/shift_jisx0213.c
+index 364298dcff..834fa81322 100644
+--- a/iconvdata/shift_jisx0213.c
++++ b/iconvdata/shift_jisx0213.c
+@@ -226,6 +226,9 @@
+ 	    STANDARD_FROM_LOOP_ERR_HANDLER (1);				      \
+ 	  }								      \
+       }									      \
++    else 								      \
++      /* There was a pending character.  Clear it.  */			      \
++      *statep = 0;							      \
+ 									      \
+     put32 (outptr, ch);							      \
+     outptr += 4;							      \
diff --git a/meta/recipes-core/glibc/glibc_2.39.bb b/meta/recipes-core/glibc/glibc_2.39.bb
index 567d53dd6f6..3090b9cd277 100644
--- a/meta/recipes-core/glibc/glibc_2.39.bb
+++ b/meta/recipes-core/glibc/glibc_2.39.bb
@@ -69,6 +69,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0034-CVE-2026-6368.patch \
            file://0035-CVE-2026-19542.patch \
            file://0036-CVE-2026-19499.patch \
+           file://0037-CVE-2026-77117.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"
