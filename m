Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2129D7920E
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 19:25:49 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id n7-v6so4969839pgq.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 12:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=cRvlbR+wfYBR/Oj+8cfsSdOvd7S7k40ieppO+sH52Oc=;
	b=C0s/uQBQFC6diPyvb5J2Plz0gZaDU28z2M8jT8c24Og+QK+GmmiSuAsNpSRaaAG8x+
	lDb7R+zRpSM4g8QOTQ+k93BXcAt0g9Bvauqi+EysxBQG2wrU4NCkGX7jqTtoANOFaJiI
	vAh7V3F3HGBNBtDT379wD4bGNnE9/rqwbvz5M72+T/hQe6gQGa0YTG2it2BiQ4CBsofY
	ItxwobZnUWJef0VNW1HxXCtPx8o4rox38+IgnPLMspHT4Hc9Nq+0EkGoRNDQvL5iRI7z
	4ENM8hY9i8TEkZfQMhMLCNwYO0hKWSYHdEK91xTmeWPKjezEhcbYdxRWP4RHwAJcAhP3
	oJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cRvlbR+wfYBR/Oj+8cfsSdOvd7S7k40ieppO+sH52Oc=;
	b=PgcaJ/pi7HchpGwHW7BnhfG6nttVm7coh14PECLPWYcrBzM9L1QDv0Vt7+rgxCA66K
	PFWo1aet5n+hM6Epe/ufrGFPJnLWl5mTa/HcQJELZcv266a0VahBnjLetYBcij2oClOr
	ZmGfxLhPv3VIPRFVzSrLiWz4pQphprXkQ8dFJdX5HdZ3FVqJXHCvwjYU2BFaH6EcGEFX
	TgU04GaUJ7mRS3WJ8RdvdKe1mSWQ+Q5oc4geqcRUgZWmofZQa3XcpOqrOtSV6YDtqz08
	FaCtWqGFU5xIvy0VJ2EZ62duGUkcV0j/359DnIh+gCg1haXaQBKYflm17mHDC00mFqOr
	qKag==
X-Gm-Message-State: AOUpUlEHYCCQFUnlfjniL7lE9ra2hNouBg2GgoVFPFrgi3rU8A7jAZgx
	VqVt3K2GxeLxBW60lJHfRhSf7z9V
X-Google-Smtp-Source: AA+uWPzJsyiKdTxaOxjtlN2iVDZRoJ7M9mntcwioQZ/NWQK9u42CDLIMjQUM1B1yZ6+P/I4Wx8r1nA==
X-Received: by 2002:a62:6283:: with SMTP id
	w125-v6mr41589468pfb.108.1534620349975; 
	Sat, 18 Aug 2018 12:25:49 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	k64-v6sm6723068pgd.47.2018.08.18.12.25.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Aug 2018 12:25:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Aug 2018 12:25:36 -0700
Message-Id: <17f1f013ccf6a321b25fffeac5e40fad6bb9c15e.1534620189.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534620189.git.raj.khem@gmail.com>
References: <cover.1534620189.git.raj.khem@gmail.com>
Subject: [PATCH 4/6] dos2unix.bbclass: Move to oe-core
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
X-List-Received-Date: Sat, 18 Aug 2018 19:25:49 -0000

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


