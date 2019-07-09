Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
	[209.85.221.52])
	by mail.openembedded.org (Postfix) with ESMTP id 1C97F7ED59
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2019 22:30:38 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id x4so426398wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2019 15:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=XYEXQUwEqYikWI/0GLsVssb9/rDahBXiBfMAHr3T5l0=;
	b=PWIrhkX9AIpqY75kcL3Bjz5cVyZiLKTLqE+AMD3gvMiaxU/05FAQFY8x9wcP+v+KdN
	YOW7HQTWZOOF0z8V32Zh1JkCjOeF2a7AgbUYwj2BthtoW4nPS+0DeIxPRh1NdBS9M8Jp
	qfc/pbBaFlS0UgxvsfeBWy3V/yIpmqVH3MMj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=XYEXQUwEqYikWI/0GLsVssb9/rDahBXiBfMAHr3T5l0=;
	b=qpz8RIsqMTwqbaUrJ5nWpyaRSCg7z2sXUDMEsDTEIiUMWvJAZxlipWgL8NEsaxxySb
	2biEcRG1gQTmEf7dy+xqd4mHWDumJ8EPQ8HltN2/+eVgPfQB9IaJyRIZG6SW7M1IP1U8
	8numDMefwhJRB428JkAtt8KFjljYSSeGIyish+oyFlBxT4z7YMd7KxOFN4F4zshGiyCL
	TexjXHRWvcc+pQXk8PnVa0Xu+5XkvatiRZsyhFZ2Tnew13sHbxtR8FKyxzEen1I9fc2W
	/x3A5N1UAE4DXBo8On4xXWxARuRuXGELHEIOHKKRLm4CKeNKsc91SsZYsFU/ZvH7mD5x
	givA==
X-Gm-Message-State: APjAAAVaYZJ4RPquInZu16ThigynNfy1ffyUqCedIWOJHs+5N2cbADSX
	2Npwmq+f4txonL+lrTBjevi5ug94yr4=
X-Google-Smtp-Source: APXvYqyI0TxhT4AfpKNe84MWE+sIpYyyn7Jm/ftXnXkJrpUc4u0yt0fe/+UbAPfsz6hcJ8C5cN8iWQ==
X-Received: by 2002:a5d:5152:: with SMTP id u18mr17892669wrt.9.1562711438600; 
	Tue, 09 Jul 2019 15:30:38 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	a81sm286272wmh.3.2019.07.09.15.30.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 09 Jul 2019 15:30:38 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jul 2019 23:30:35 +0100
Message-Id: <20190709223035.14911-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190709223035.14911-1-richard.purdie@linuxfoundation.org>
References: <20190709223035.14911-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] oeqa/bbtests: Tweak test bitbake output pattern matching
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
X-List-Received-Date: Tue, 09 Jul 2019 22:30:38 -0000
Content-Transfer-Encoding: 8bit

The output from bitbake will change slightly soon due to runqueue changes,
adpat the test now to account for both the old and new cases.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/bbtests.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bbtests.py b/meta/lib/oeqa/selftest/cases/bbtests.py
index 2a310bc4af2..17da0fd32c7 100644
--- a/meta/lib/oeqa/selftest/cases/bbtests.py
+++ b/meta/lib/oeqa/selftest/cases/bbtests.py
@@ -40,7 +40,7 @@ class BitbakeTests(OESelftestTestCase):
     def test_event_handler(self):
         self.write_config("INHERIT += \"test_events\"")
         result = bitbake('m4-native')
-        find_build_started = re.search(r"NOTE: Test for bb\.event\.BuildStarted(\n.*)*NOTE: Executing RunQueue Tasks", result.output)
+        find_build_started = re.search(r"NOTE: Test for bb\.event\.BuildStarted(\n.*)*NOTE: Executing.*Tasks", result.output)
         find_build_completed = re.search(r"Tasks Summary:.*(\n.*)*NOTE: Test for bb\.event\.BuildCompleted", result.output)
         self.assertTrue(find_build_started, msg = "Match failed in:\n%s"  % result.output)
         self.assertTrue(find_build_completed, msg = "Match failed in:\n%s" % result.output)
-- 
2.20.1


