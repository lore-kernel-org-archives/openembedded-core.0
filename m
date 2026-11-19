Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86.1795101868364048402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 07:24:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=S6Mu6jMx;
 spf=pass (domain: smile.fr, ip: 209.85.128.50, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb69f5b161so15165955e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 07:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795101867; x=1795706667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QPuJz6j5M5GbLbR59aho6u9zslJOiRl2gqJMLOJugiY=;
        b=S6Mu6jMx3rd0lsqqZ0dw1WZahqStlH6Zsgu54xItEl5DcT/0Ue1VFRQJPo+pe23sqL
         744K9Oz0sZpzECU55ilyJYCIEoFXt/p5r8oOJ/jyM1dhpE2p3Cfc9a/PRmKI3g0beKJy
         xEjDkX+ptmLqnXvoMB/+sVbKkxH0Kgyj8/Ictd0V5siOcTGVhD72YDLwqwWP2x9KpfXl
         2opxJrQ+JbpuNTGZPzhDxmqW2jsEWaMaOfk8mSGgvaCWL91pynpXDTRgd6hIYUZhyuPl
         fhFzZbm2Z9fg8fmFGO2N6GX6TJ6gKitvVHkzebSVhPd6DijY2jNGs/MkLxR4z2hG1tmi
         RKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795101867; x=1795706667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QPuJz6j5M5GbLbR59aho6u9zslJOiRl2gqJMLOJugiY=;
        b=AYR/9pSi9NHVL2ysVPRIC1HMT8IrYEsctv18WbBqrUHH2+ama2TirsXl1k+rRgf4di
         XSSE1B/VjZLPTasO8eaLracSJMkOhxMfagIRggAhxbtE9cw51FodMk89iy362fcaOglw
         Pt8leZuylprvdjoB66q8Bv++OzXQOu61wv9vbKOz08VQYE+bANXvekGXWJQA5Rdsa0c8
         YDu1x0+7MzLmOE6tqOvP3MFDiUrjvr9h01NDRI5ZfdCFr+D+Zq+1c5c8hfALSeOmHTJX
         NfTcEqyOOWB1UIGTsaqsXRRVLy0nztq7nhW7ZUh0rRlVZFmgi/bMPfBG92V+YQPiGvc6
         IEkg==
X-Gm-Message-State: APuU4Z90Mwxb6R5FtscTLkKmLLSTyeOEDM0BEuuMWfouppamVzSL5Yhn
	81gTriBTopKjl0dKnpsBgekLzHp6teRf2GkUYN+YoST1BE8xzw2v3Ku5P3uys/fUri+LQEysOX2
	47+EFilc=
X-Gm-Gg: AYBFou1dfE9SC/pd3AsSZ9HKa+aEClpQeFcMrAqeKkXDGBQzhoFwcEdLYDfMoL7eQf6
	4iVywKb1w1SVqPIKXUZcxelt445Fn2t9gfddMi3fJeCoX0VUgiOfuhgQO4NPL/RYwpOOo64NoiB
	ET/soks9sZGF+KTr3odWogvRmRbbozJJLIREAnq7CznBsPiRwY/J7E1+uZHDWCzVnAk+O2eKc+C
	KsqPF9qCpY/5NIsC9eu1PBFGM2tx4QFqzwwRB4kAM1yNmKTjSRFPRLdXjzw15I2SsOx3FL7+fJ2
	vVAOOCnOoW32wmSDOUyKLa01S8ksBqvCBc3XuFbER8wSn0KFxCnjqIT7nLlQDst5+Ze/OwpJ7W7
	dziDNpTeSOISMXWZT9EzJBSn/BvCQGLpZMrdgBabkuI+0l4WYRqh3cHm3bF6F3ZN0m2ycq4UyTn
	mSnrrKm5AGeZ43nubMMFh9gZrpLuTDOCriciQRtecLLe6CE22TH6TGHBQMLioB7VMLfTKXShxeb
	t+jd9RifxIf+4ZIBxqFF6BxwW7TPujS3KLCdhui5WAb9Gi83i53TOwoWem6mYVg5u/gjyBPvLPO
	jSDNeFmphZPJ6vZMGlzuc7jgyFmKJB4uU52TIavmyPdNX1qEM7EsNJfQFu8W2ZxFyxcrUcdus5k
	S8HOx5DcYGt5qdSWgCv1QnzRP9Jbd0Q5i/YMi3p/s3GACC4jwk2WAGBI=
X-Received: by 2002:a05:600c:6092:b0:4bb:5f95:c014 with SMTP id 5b1f17b1804b1-4bb7da1efc6mr116648025e9.19.1795101866452;
        Thu, 19 Nov 2026 07:24:26 -0800 (PST)
Return-Path: <fabien.thomas@smile.fr>
Received: from FRSMI25-GIGUE ([2a01:e0a:8cc:5b00:2270:efa7:7aaf:bcdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884865b1sm4222275e9.5.2026.11.19.07.24.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:24:26 -0800 (PST)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/19] curl: set CVE_STATUS for CVE-2026-19931
Date: Thu, 19 Nov 2026 16:22:37 +0100
Message-ID: <03b991a8cf6fbbdf58b29675c71cfa4d3d291ae8.1795101267.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1795101267.git.fabien.thomas@smile.fr>
References: <cover.1795101267.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 15:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250694
Content-Type: text/plain; charset="utf-8"

From: Darsh Kelaiya <dkelaiya@cisco.com>

Analysis:
- The advisory [1] names [2] as its fixed-in commit. It moves
  connection maintenance to admin handles, preserving the identity
  used by authentication reuse checks.
- Earlier, [4] added Negotiate/NTLM connection reuse checks,
  including an SSPI ambient-user check using recent_conn_id.
  Later, [5] removed that SSPI check; the other checks remain.
- Curl 8.7.1 predates [4]. Applying [2] alone would not reproduce
  the later upstream behavior; a source fix needs backport analysis.
- The advisory describes Negotiate reuse with empty credentials and
  lists curl 8.7.1 within the affected range [1].
- On Linux, this requires krb5 and negotiate-auth. Scarthgap enables
  negotiate-auth but leaves krb5 disabled by default.
- Follow the merged GSS-API configuration check in [3]. Set
  not-applicable-config if either option is absent; otherwise keep
  unpatched while the source backport is deferred.
- Record the CVE as not-applicable-config unless both required
  PACKAGECONFIG options are enabled; otherwise retain unpatched status.
  The CVE_STATUS decision is conditional, not hardcoded.

Reference:
[1] https://curl.se/docs/CVE-2026-19931.html
[2] https://github.com/curl/curl/commit/7103a93b05bc69ea98ed9d05d02fa9eeba533f2f
[3] https://github.com/openembedded/openembedded-core/commit/93c410c455b92a2b1fe3b77347e57d02f344056b
[4] https://github.com/curl/curl/commit/1a17959fc7a80864c9c9b37097856bdb4a465cf8
[5] https://github.com/curl/curl/commit/1c58877705b172da892cb9c18c5edb572f2d1d73

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
Signed-off-by: Bastien Jauny <bastien.jauny@smile.fr>
---
 meta/recipes-support/curl/curl_8.7.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index e08ca2f930..4be96a6f7f 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -65,6 +65,7 @@ CVE_STATUS[CVE-2026-8458] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotia
 CVE_STATUS[CVE-2026-9547] = "not-applicable-config: vulnerable libssh backend is not enabled by the recipe"
 CVE_STATUS[CVE-2026-82209] = "not-applicable-config: public suffix list support is disabled by the recipe with --without-libpsl"
 CVE_STATUS[CVE-2026-12064] = "${@bb.utils.contains('PACKAGECONFIG', 'libssh2', 'unpatched', 'not-applicable-config: SCP/SFTP support is not enabled in PACKAGECONFIG', d)}"
+CVE_STATUS[CVE-2026-19931] = "${@bb.utils.contains('PACKAGECONFIG', 'krb5 negotiate-auth', 'unpatched', 'not-applicable-config: GSS-API Negotiate is disabled', d)}"
 
 inherit autotools pkgconfig binconfig multilib_header ptest
 
