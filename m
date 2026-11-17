Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2081.1794939634738270494
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 10:20:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=O5ADRqV6;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so2524755e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 10:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794939633; x=1795544433; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIHEWmU0qTavZoywl2aPq9GYZ1kw0UUaVZf9EHpJhws=;
        b=O5ADRqV6OsRP7bYyoCpcbgYKKLlIoKrB5QyWgyrRAKCZ6FXCK79HBDFgxz9fdiVJOb
         K4E7tZM8eVbuxYiEOJv0gwJyt7PVSyU2bTdisWgDn2mPQ4bnaOil/e1S8rv0YU8vTBQJ
         iaNPkuMF9+lHolSAmSlfyhHdOzUG9nM4CeZFVl5Ud58qM5gA5j/U+wwffZHxb59abmJK
         IQO/5exRWPiAlE7aIZa6xfTRMjXJZgIMXhrAsXdBtahXa9iONCHk3cS4NxL8ildpEe1P
         sCj+mrLEB1MdAceOOsmvD9/m9z4XkiLeY2ez0z8cE9f6LnMvhmKVRfyWHCE6X2Id1KNx
         PTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794939633; x=1795544433;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oIHEWmU0qTavZoywl2aPq9GYZ1kw0UUaVZf9EHpJhws=;
        b=MQI2iCm1gYyv2rGq/kgOZWXGtB3PT6gl2EsNQdX+KEu8Kj822oXMBxIgcSmZsRjUuU
         JDv7W/fRobgJSYZa3G3YeYQcPlR0DXBHyw58A8IGkmK1yZbK/29WAKY9uWFXcKYjMXFV
         PIvv9aHRo+m2geS1zn9u9+Qe0A17Y9U8rEwIZETIQYONB4OSPw7MEJ2XnkCd2T75OwXF
         vFajJ+jYZ+eGOUdCtzlQmDjdEoWmwJqHBeWAOtcOCOu0VXxczOD/4dxkmeo/AK+hmh38
         5GswcpVse4Dg1SumsPLJSG0V1oF0iDlYWpXoDJs/h2O64EZS0+T3R+Eel0i3cezjx/FQ
         mpnA==
X-Gm-Message-State: APuU4Z92dIDzNUjoMWL3uMCXkGQRebTpPbK9MmU0VbVFUw3paaizaeZ7
	C5UxOgfqI8lHd5yj7lQAeO9v9AZWdMI6K2VfMO9B5pMyOmb9f2r8g0cWsrfQZB+khsiCYa68av1
	aSIHXago=
X-Gm-Gg: AYBFou04jEZwRD9S+0qbpnt12zXRIE8gv6jnWz3hrXfzkFp56FxefWJeFP2g1Esgu3C
	T1zMSt6mvN3jihWAKaX5dEETorRshP5fTaN6pcl9OC9OqAqJWFTZcn2jQyqL7AFX43Rvse+zvyI
	q0YuaUXZJ0tMRek5WilPFodNjelfVX0jVNAjRO6XeZZqcJQpTNoucFEthskBA4wc5oqH3Ym5ZN6
	MGDFrVXwj5P+slZ8PzGdxwqgZAMDFkEVHmLurawl0oS4YTus3wTPTE5MtsHC36xZHgNlkdxd0wV
	7DI3HLDujV9WdIXFOtmut34+g5/nSSDX+9JN1bQuGc48g8Ud8YPO/7e0xaE1OoOrxv6hPAXR3KE
	t4SCGTuY7QxGE67vxxSaLO/fpYkECQEcwH9VOp4hJgCkxX7cqh4LAeztsgftTdPm+KP2JBoqPu4
	R49bPdtyonvjKogmSwHMIjexRwzE9YqQktO4ydERqNLruqc0m14tr0Eng2ZoBsoiiUp9quAMnyk
	94TGkHmAFV6mO3nDwnSRfAVzXMKcel0IT9lFL8iFy5uDkmBfDlBr1LLIwLXE4P3wCiQHmVi3Iwg
	Axne7X33SXjcF3NB7xkskc5/QELqZ03E8BFTuT7N028uJpQImtOOEoz4NXttjWL+Cr1xiF118W+
	6B1p5uYjH4T5uS4TkKbBzFmE7R+RDSg==
X-Received: by 2002:a05:600c:8b81:b0:4bb:5f45:c97f with SMTP id 5b1f17b1804b1-4bb5f4f93f3mr243378525e9.27.1794939632630;
        Tue, 17 Nov 2026 10:20:32 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654997681sm114337f8f.15.2026.11.17.10.20.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:20:31 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/17] Patch review
Date: Tue, 17 Nov 2026 19:20:00 +0100
Message-ID: <cover.1794939400.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 18:20:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250467
Content-Type: text/plain; charset="utf-8"

Please review this set of changes for wrynose and have comments back by
end of day Thursday, November 19.

Highlighted patches: this series upgrades rsync 3.4.1 -> 3.5.1: This is
an exception to the stable rules to handle the otherwise very difficult
to patch CVEs.

Passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/5137

The following changes since commit 33a6bd6cc8a9a976902081642414bd67adc74879:

  populate_sdk_ext: Fix locale error handling in SDK (2026-11-11 00:22:27 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-review
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-review

for you to fetch changes up to dcc87a051b64f2643b94bdb1a703aa50e8dccb26:

  perl: upgrade 5.42.0 -> 5.42.3 (2026-11-17 11:03:28 +0100)

----------------------------------------------------------------

Adarsh Jagadish Kamini (3):
  curl: fix CVE-2026-87864
  curl: fix CVE-2026-92388
  curl: fix CVE-2026-92389

Ashishkumar Parmar (1):
  bluez5: fix CVE-2026-19774

Darsh Kelaiya (4):
  curl: fix CVE-2026-82208
  curl: fix CVE-2026-86409
  curl: set CVE_STATUS for CVE-2026-19931
  curl: fix CVE-2026-18924

Jaipaul Cheernam (4):
  rsync: upgrade 3.4.4 -> 3.5.0
  rsync: upgrade 3.5.0 -> 3.5.1
  perl-cross: add patches for perl-5.42.3
  perl: upgrade 5.42.0 -> 5.42.3

KAZUYOSHI AKIYAMA (秋山 和慶) (1):
  spdx30_tasks: Fix duplicated revision in Git PURLs

Richard Purdie (2):
  rsync: upgrade 3.4.1 -> 3.4.2
  rsync: upgrade 3.4.2 -> 3.4.4

Shuai Zhang (1):
  bluez5: Abort continuing response on fragmented CT replies

Yoann Congal (1):
  pseudo: Upgrade 1.9.11 -> 1.9.12+git

 meta/lib/oe/spdx30_tasks.py                   |   7 +-
 meta/recipes-connectivity/bluez5/bluez5.inc   |   3 +
 ...inuing-response-on-fragmented-CT-rep.patch |  62 ++++++++
 .../bluez5/bluez5/CVE-2026-19774_p1.patch     |  63 ++++++++
 .../bluez5/bluez5/CVE-2026-19774_p2.patch     |  62 ++++++++
 ...rl-cross-add-patches-for-perl-5.42.3.patch | 114 ++++++++++++++
 .../perl-cross/perlcross_1.6.4.bb             |   1 +
 .../perl/files/CVE-2026-13221.patch           |  75 ---------
 .../perl/files/CVE-2026-42496.patch           |  99 ------------
 .../perl/files/CVE-2026-57432-01.patch        |  52 -------
 .../perl/files/CVE-2026-57432-02.patch        |  34 -----
 .../perl/files/CVE-2026-57433.patch           |  32 ----
 .../perl/files/CVE-2026-8376-01.patch         |  62 --------
 .../perl/files/CVE-2026-8376-02.patch         |  49 ------
 .../perl/{perl_5.42.0.bb => perl_5.42.3.bb}   |   9 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   6 +-
 ...-prototypes-to-function-declarations.patch |  78 ++--------
 .../rsync/files/CVE-2025-10158.patch          |  36 -----
 .../rsync/files/determism.patch               |   6 +-
 .../rsync/files/makefile-no-rebuild.patch     |   6 +-
 .../rsync/{rsync_3.4.1.bb => rsync_3.5.1.bb}  |   4 +-
 .../curl/curl/CVE-2026-18924.patch            |  57 +++++++
 .../curl/curl/CVE-2026-82208.patch            |  54 +++++++
 .../curl/curl/CVE-2026-86409.patch            |  88 +++++++++++
 .../curl/curl/CVE-2026-87864.patch            |  52 +++++++
 .../curl/curl/CVE-2026-92388-1.patch          | 142 ++++++++++++++++++
 .../curl/curl/CVE-2026-92388-2.patch          |  31 ++++
 .../curl/curl/CVE-2026-92389.patch            |  53 +++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   8 +
 29 files changed, 822 insertions(+), 523 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p1.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2026-19774_p2.patch
 create mode 100644 meta/recipes-devtools/perl-cross/files/0001-perl-cross-add-patches-for-perl-5.42.3.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-13221.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-42496.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-01.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57432-02.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-57433.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 delete mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
 rename meta/recipes-devtools/perl/{perl_5.42.0.bb => perl_5.42.3.bb} (98%)
 delete mode 100644 meta/recipes-devtools/rsync/files/CVE-2025-10158.patch
 rename meta/recipes-devtools/rsync/{rsync_3.4.1.bb => rsync_3.5.1.bb} (95%)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-18924.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-82208.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-86409.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-87864.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92388-2.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-92389.patch

