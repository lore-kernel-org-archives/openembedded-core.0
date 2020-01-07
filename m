Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE6E7F87E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 11:27:36 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id q10so14572800wrm.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jan 2020 03:27:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=+cY9T8wjALDQD0PEDn7JjclEvTd2UINVJvVnmmIDDhI=;
	b=FFnB+wH4qVyeTa/yh3qPhExM7M+poKcQp8CBecJ/E1oQua3LUw+Cam9iOhXbg+NYeZ
	mvrCWUqRHe9pbnRhxdV+gzI5L8HEiSyA507Mlbruj8BbKH2ykgfVCCY9u04Le4kmCs/B
	6x8DJ7wYsWeOX6uxJFDy3ilgfDFJ70gHyxVTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+cY9T8wjALDQD0PEDn7JjclEvTd2UINVJvVnmmIDDhI=;
	b=Ux6doYgspQNkFXodvrCbtP744/XTxX+DHDZnJusvxpmVhw7cDOiWXIpPGai0HVuivY
	F9/ettoWUBXy03AEWWzfxcJ3IxqqiPrrQNyRnrjzchGCxfmnwzaObesytZUmOvKALAaR
	TARJ5RuHmcdraBNTdYnIwoEanlnCrGV3DLX24MHCtePap1eRfL8J5p3tTSxcg6ruBa2/
	l2bV7dCoRTsa8AX2xCryoadLKhlp+85SIQkfBmGjGTUIQowuOr1AKXSPm198gK1smP3G
	z5xgkhp4AJ4JaGcQHzS/hDH1AkHLLoqJ/WVBMzmWWCAPQCSswtNI3DvW3f+uQCb+y+2H
	NSSQ==
X-Gm-Message-State: APjAAAUQCxfQukGmq9uJV1jEtpgmIslfp5nlDy1sUbCYFVYNT6JRlIJO
	isI6awtHcpL3/9rhZOma//uDB9NUGgRPVQ==
X-Google-Smtp-Source: APXvYqy4j+E7+nZoAJQYrnH/qQObMpfkKJSa/YF/mw+ue3BXnECBErXY/TEOiP9QjNSk4oDl/3IDhA==
X-Received: by 2002:a5d:4e90:: with SMTP id
	e16mr112895099wru.318.1578396456937; 
	Tue, 07 Jan 2020 03:27:36 -0800 (PST)
Received: from arch0.home.b5net.uk ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	r5sm75069879wrt.43.2020.01.07.03.27.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 07 Jan 2020 03:27:36 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jan 2020 11:27:34 +0000
Message-Id: <20200107112734.2431-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107112734.2431-1-pbarker@konsulko.com>
References: <20200107112734.2431-1-pbarker@konsulko.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa: archiver: Tidy up test case descriptions
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
X-List-Received-Date: Tue, 07 Jan 2020 11:27:36 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta/lib/oeqa/selftest/cases/archiver.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index fab2f56c39..c036e0cbe2 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -152,28 +152,28 @@ class Archiver(OESelftestTestCase):
 
     def test_archiver_mode_original(self):
         """
-        Test that the archiver works in with `ARCHIVER_MODE[src] = "original"`.
+        Test that the archiver works with `ARCHIVER_MODE[src] = "original"`.
         """
 
         self._test_archiver_mode('original', 'ed-1.14.1.tar.lz')
 
     def test_archiver_mode_patched(self):
         """
-        Test that the archiver works in with `ARCHIVER_MODE[src] = "patched"`.
+        Test that the archiver works with `ARCHIVER_MODE[src] = "patched"`.
         """
 
         self._test_archiver_mode('patched', 'selftest-ed-1.14.1-r0-patched.tar.gz')
 
     def test_archiver_mode_configured(self):
         """
-        Test that the archiver works in with `ARCHIVER_MODE[src] = "configured"`.
+        Test that the archiver works with `ARCHIVER_MODE[src] = "configured"`.
         """
 
         self._test_archiver_mode('configured', 'selftest-ed-1.14.1-r0-configured.tar.gz')
 
     def test_archiver_mode_recipe(self):
         """
-        Test that the archiver works in with `ARCHIVER_MODE[recipe] = "1"`.
+        Test that the archiver works with `ARCHIVER_MODE[recipe] = "1"`.
         """
 
         self._test_archiver_mode('patched', 'selftest-ed-1.14.1-r0-recipe.tar.gz',
@@ -181,7 +181,7 @@ class Archiver(OESelftestTestCase):
 
     def test_archiver_mode_diff(self):
         """
-        Test that the archiver works in with `ARCHIVER_MODE[diff] = "1"`.
+        Test that the archiver works with `ARCHIVER_MODE[diff] = "1"`.
         Exclusions controlled by `ARCHIVER_MODE[diff-exclude]` are not yet tested.
         """
 
@@ -190,7 +190,7 @@ class Archiver(OESelftestTestCase):
 
     def test_archiver_mode_dumpdata(self):
         """
-        Test that the archiver works in with `ARCHIVER_MODE[dumpdata] = "1"`.
+        Test that the archiver works with `ARCHIVER_MODE[dumpdata] = "1"`.
         """
 
         self._test_archiver_mode('patched', 'selftest-ed-1.14.1-r0-showdata.dump',
-- 
2.24.1


