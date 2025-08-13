Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82118CA0EE0
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 16:48:11 +0000 (UTC)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
 by mx.groups.io with SMTP id smtpd.web10.1439.1755103689057177801
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Aug 2025 09:48:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X+iKaGB+;
 spf=pass (domain: gmail.com, ip: 209.85.166.176, mailfrom: danismostlikely@gmail.com)
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3e56ffcec58so333565ab.1
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 09:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755103688; x=1755708488; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QNbIW2IpSLbsPHhY/eg9kSOCLjNvn0KDiQom0WUd1/g=;
        b=X+iKaGB+dgwKmvDkZ+yDq8aFOCFDl6iEf5PwE50CiDXnryKkqmFUlUvnB6rFVQcYKU
         dWOMf6OGsaeTwrj/efF0WZE5lCD2ro0bXGVNVN13biGT6B+jnXGIKXlJJNd4kzJ0fOE2
         Jtt940O/nIO+9zQjiDz3CAtj0BsYGN5L0nyH24vG73r/5edpseUqirTpwiFnrM+34yz2
         R2hRShGT3WNlpSqueO3HQTlfr9m/PX/TKz/CLx54N7nFqpljsU9+HMCea3LKGfC/lH+J
         Gvi/cw7gEreYcUYX0WmsgAjRCTRQB7D/b3gG1Gvq5rvY6AvwD3ZG5T4rkpNHExHB7ADW
         Mluw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755103688; x=1755708488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QNbIW2IpSLbsPHhY/eg9kSOCLjNvn0KDiQom0WUd1/g=;
        b=jh5DVnBoquDWfWJE6jhDQVSaNXdOo0DS1uJeBlnzme9gwV70QU1H243wsJiEoeY+3r
         8H8oZIdQCacwMS+mZ76WiT4RU79KMFbIix6KsB81NBbacAMSHUEm1CR3G/TgFnGWBbGP
         N2OBte3PmMkpFXfw4VkxR2xGnCI0pUYRQdhdUugwEV/MTKdAc41BpLGAUkLcCouwC3Eu
         AomVf1/AOjXf5VGpJ+1gXHm8DlD5KlmzvExLiNRO6Omolhi1DWNTz97fHi9x/Iz1g2Xq
         M/XApfSMPFd1ug8P3Q8Ncp54pCPhE/uzD4zOaY5oXGWLWuutJTL08RBlvZecvR4pua0u
         lyvQ==
X-Gm-Message-State: AOJu0YyLb40etFGm7xFpDV7xuBaAXazzvGg4tNpkvFCR7k+psGWkDXiW
	kSQ0P0ZSW4yemb5uSjRA1l6mm+su1XrpD/CXoWpuVOpX+/V5Ymj8T353f1Tyww==
X-Gm-Gg: ASbGncup2G00bpXzcKMZERV7VhpSzU+ZsqU8wDKg45jgZlv2Y0LoN5I+pLqV5aEyPD8
	pflosaHCrrBYkCmcOustw4Ndzy0tVfADKNfQm9mwEwvVKJzEF6kjQzDBxuQpkGo9fUkhCdG7oO3
	gaROr++FSpUWZgZeOrIdRJFlFJINvDsx+UvTEklQxv/JWNmR/UrGUPIwfulo8EXLPFaX3eFwDgT
	d+1UX6dhEN2LJCYoGF1pBofQsCEBS2AIDZsmyF8T9vvJ2/YZEN7C0XBvmV5vKffNkzhul8ivZ47
	rCBzrdI4MSdVcPDedHJwTXERlLyVQMmL3/WCm+TSDbcoq+OqLY0GnTsDjbl46l/8ixNRCHjnUQ/
	zzGRAYkNSsFnQaUtLk8atTyHMcmd506ipibe5e/TX/7N33nWyY/kBKhE=
X-Google-Smtp-Source: AGHT+IEIjZCf2ec0rtDhXGPeobXKUrm0g229NV7POmNm1UUkGxL13iNPNCWdJNNrppPdeN3EcqwoNQ==
X-Received: by 2002:a05:6e02:1a4b:b0:3e5:4942:88dc with SMTP id e9e14a558f8ab-3e5673c0809mr55006255ab.9.1755103687874;
        Wed, 13 Aug 2025 09:48:07 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3e5594c1991sm23980675ab.38.2025.08.13.09.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 09:48:07 -0700 (PDT)
From: Daniel McGregor <danismostlikely@gmail.com>
X-Google-Original-From: Daniel McGregor <daniel.mcgregor@vecima.com>
To: openembedded-core@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [kirkstone][PATCH] systemd: Fix manpage build after CVE-2025-4598
Date: Wed, 13 Aug 2025 10:46:50 -0600
Message-ID: <20250813164652.1053976-1-daniel.mcgregor@vecima.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 16:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221819

The previous fix missed another cherry-pick that fixed building
manpages after the coredump patch. The version-info.xml file doesn't
exist in 250. It was introduced later, so remove the reference to
it.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch
index 737121af12..a3337b9108 100644
--- a/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch
+++ b/meta/recipes-core/systemd/systemd/CVE-2025-4598-0003.patch
@@ -33,16 +33,16 @@ Upstream-Status: Backport [https://github.com/systemd/systemd-stable/commit/2eb4
 
 Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
 ---
- man/systemd-coredump.xml     | 12 ++++++++++++
+ man/systemd-coredump.xml     | 11 +++++++++++
  src/coredump/coredump.c      | 21 ++++++++++++++++++---
  sysctl.d/50-coredump.conf.in |  2 +-
- 3 files changed, 31 insertions(+), 4 deletions(-)
+ 3 files changed, 30 insertions(+), 4 deletions(-)
 
 diff --git a/man/systemd-coredump.xml b/man/systemd-coredump.xml
 index cb9f47745b..ba7cad12bc 100644
 --- a/man/systemd-coredump.xml
 +++ b/man/systemd-coredump.xml
-@@ -259,6 +259,18 @@ COREDUMP_FILENAME=/var/lib/systemd/coredump/core.Web….552351.….zst
+@@ -259,6 +259,17 @@ COREDUMP_FILENAME=/var/lib/systemd/coredump/core.Web….552351.….zst
          </listitem>
        </varlistentry>
  
@@ -54,7 +54,6 @@ index cb9f47745b..ba7cad12bc 100644
 +        project='man-pages'><refentrytitle>prctl</refentrytitle><manvolnum>2</manvolnum></citerefentry>.
 +        </para>
 +
-+        <xi:include href="version-info.xml" xpointer="v258"/>
 +        </listitem>
 +      </varlistentry>
 +

