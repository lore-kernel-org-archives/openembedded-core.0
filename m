Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 49DC879223
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 17:23:52 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id k21-v6so5602657pff.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 10:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cRvlbR+wfYBR/Oj+8cfsSdOvd7S7k40ieppO+sH52Oc=;
	b=NI+5uJunEsXr85+DAC5By9cl+HYmQh8Ymptj7cCfrZy1VrPa44YT0VVO8Gf75LLsUK
	r51DA+fJ1a6jpH6BqxWg0Y0La3ZkqedC/vjmi0KokE79gL7QILIj4sKl80BVcOdxtO4E
	LilbaNaDqF5UhcGHyaoxUzI7sAdaFGYgYmNQBQFpQRrt1GsnWT6jFwS5idB1UaL3TGW8
	V4REA+jVQO7gzJDL7gXkYK8OeR0ZN6DJ1JRJrEuWryOHVIzqPOKGFnZ5YVWB8sqtoYGJ
	2Hu45iY0GYrT0NjzyqsG0NZ624dqICoYxTzupCaVZsH3OQsleSgPcPe3VuwU32XGbbxd
	5XVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cRvlbR+wfYBR/Oj+8cfsSdOvd7S7k40ieppO+sH52Oc=;
	b=Iu/hXQE6UaZIwYoofUUO9uZOyUVam1m1bTrJPoGIwyIRzOBDZPPREWRussAfJgqtgG
	+BS0jGLyufz0aQznvRU+Wttat/1Jfbfcm+4H3Sw/h7iehuYVtKlsa3T2Pr5ZYpZxnHU6
	8LIAmaKjjNtUqLDU+dPbkH22GvmDUw7czsp+C2mZMj9BfnwOnTCZFXtCNVy9dv2yGhNE
	YFbNe7B6iMJl33tLxYCr55+8Tq+rfP5g9CWN0pnj72XxyFiz+95xXAHiYHaRHgQPMrfk
	Y45pzwNpxL7pclmmh3YML00M6Dkwcq6BobLBUgfftu2w8IYqPMDppm0DsNQXXCiRKOR3
	xtLg==
X-Gm-Message-State: AOUpUlEx6dQSWhYRvZ7SSD9X4811x/nkHXnNeTe++0/hp2mN0zqTjhR6
	z21TuzUXZ1WOT7lh4P4CYNGhaUOs
X-Google-Smtp-Source: AA+uWPxciwsl79D7O4uuMkU2LDasjYe9lDhsGaha52NvGIEKcf37gIZ9x4ZK7X08p5d5fJdp69RWaA==
X-Received: by 2002:a63:7f0b:: with SMTP id
	a11-v6mr12437048pgd.22.1534699432972; 
	Sun, 19 Aug 2018 10:23:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm8293466pgr.59.2018.08.19.10.23.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 10:23:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 10:23:36 -0700
Message-Id: <f1c6008db923f577cb03d5461c06ad97d55a57f6.1534699224.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534699224.git.raj.khem@gmail.com>
References: <cover.1534699224.git.raj.khem@gmail.com>
Subject: [PATCH 4/9] dos2unix.bbclass: Move to oe-core
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
X-List-Received-Date: Sun, 19 Aug 2018 17:23:52 -0000

- Import from meta-oe layer

- This is useful for many packages where CR-LF
  needs to be adjusted, many recipes depend on it
  e.g. meta-multimedia libebml and so on.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/dos2unix.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta/classes/dos2unix.bbclass

diff --git a/meta/classes/dos2unix.bbclass b/meta/classes/dos2unix.bbclass
new file mode 100644
index 0000000000..3fc17e2196
--- /dev/null
+++ b/meta/classes/dos2unix.bbclass
@@ -0,0 +1,14 @@
+# Class for use to convert all CRLF line terminators to LF
+# provided that some projects are being developed/maintained
+# on Windows so they have different line terminators(CRLF) vs
+# on Linux(LF), which can cause annoying patching errors during
+# git push/checkout processes.
+
+do_convert_crlf_to_lf[depends] += "dos2unix-native:do_populate_sysroot"
+
+# Convert CRLF line terminators to LF
+do_convert_crlf_to_lf () {
+	find ${S} -type f -exec dos2unix {} \;
+}
+
+addtask convert_crlf_to_lf after do_unpack before do_patch
-- 
2.18.0


