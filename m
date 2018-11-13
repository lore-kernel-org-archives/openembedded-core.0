Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1FE006C245
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 22:59:37 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id f1-v6so12192699wmg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 14:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=H14pD+YfpXV9xiryZLI6q+rYFbQW6R2EhLvIBXo+9Lg=;
	b=GT40CHMF9Z3dPJ72nvVEZIz6SUIRzuuwSV2JzJ+b4djvxlp9ntVOZEaxLNpQVbn2ks
	ZgC9DfG1ZjSdkWGZ01UvnNBuxswmqyPnJSxA7G95ghg7mfSLJwUKOgJoz5NxTqP8Sco+
	iQlJZk8yVbAaqP0S8cJXXFwGpmy7w6arG3igQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=H14pD+YfpXV9xiryZLI6q+rYFbQW6R2EhLvIBXo+9Lg=;
	b=qUHVydL8p2xniY2ZTNLcKHyuvgxl1fkP+OOtNqseDha3g0dl2NYgW1L/4Ki5oUYDRR
	3badVQ7HZ4QRXGrHE19kmIRazzln7kvGonTZBGzcTomig6FcekhwfoZs+8QxBNMGipqD
	5ZzeeklWU1UeRAXD2131tTet16JsYnZcWWhYQlgxgDzoxuTGwS9gQsuNObtu02zXwTx2
	uXpK9C0mJOSGaBeXo+k4XYOfvTAgwPhGpcrDMysOVQpVG7VOBZHGoCwNhMKiS2z6KMwo
	INkuSzoUg+R+fWDuOJ+vZM3Kq1zwArPsbHTsz5DQYRfhD4UZDY5EuGhMaSZ+jnGYn2Q1
	FPOw==
X-Gm-Message-State: AGRZ1gL3nORxngUibvRGc+e0AEv2mSjvB2KbRMeMyHT9y7tgu5KQQZcT
	VqoTtTAikNyAmwABnGJj1yQfxaz9uCM=
X-Google-Smtp-Source: AJdET5cEGYjpIOHnDsdsKtA+jw4K/ILetZw71T/X3y++CtV7Sw0nbPm6GNpitzKfo3ACB94sXhnMwg==
X-Received: by 2002:a1c:7cc:: with SMTP id
	195-v6mr4616328wmh.139.1542149977292; 
	Tue, 13 Nov 2018 14:59:37 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y2-v6sm36426474wrh.53.2018.11.13.14.59.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 14:59:36 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2018 22:59:31 +0000
Message-Id: <20181113225932.17726-4-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181113225932.17726-1-richard.purdie@linuxfoundation.org>
References: <20181113225932.17726-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/5] oeqa/core/runner: Correctly markup regexs
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
X-List-Received-Date: Tue, 13 Nov 2018 22:59:37 -0000

Avoid the warning "DeprecationWarning: invalid escape sequence \(" by marking
the regexs correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 7035adfaae0..df88b85f1ca 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -93,13 +93,13 @@ class OETestResult(_TestResult):
 
                 # When fails at module or class level the class name is passed as string
                 # so figure out to see if match
-                m = re.search("^setUpModule \((?P<module_name>.*)\)$", scase_str)
+                m = re.search(r"^setUpModule \((?P<module_name>.*)\)$", scase_str)
                 if m:
                     if case.__class__.__module__ == m.group('module_name'):
                         found = True
                         break
 
-                m = re.search("^setUpClass \((?P<class_name>.*)\)$", scase_str)
+                m = re.search(r"^setUpClass \((?P<class_name>.*)\)$", scase_str)
                 if m:
                     class_name = "%s.%s" % (case.__class__.__module__,
                                             case.__class__.__name__)
-- 
2.17.1


