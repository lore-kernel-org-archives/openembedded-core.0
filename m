Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 36F666FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 14:51:57 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id n3so31700963wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 07:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Ce2kgsM1i3hHOpOqke0ZgCyKSKQzlOGq8Xq6Ejia7Yw=;
	b=J+eUJ0bSVVo3jO42CafVNiqUIfMA7D3k7GGSFDEeSc7yZGL9/Iq9yJ4RtDPBqPGsvd
	1yUCTYQr4EpuWNlIcQs44M8JP26p8OfyMIxdOZLROpp+V4asH1TN8g1NjveoztRVjoQ3
	bUJhjrCwGMbIuEEhMZMHQUJwUirR50hUqW2Pkg2uo9xJbYTwG39LWYkdiym3pXV6bnW2
	I4jUdrP6DX+R70Q+ynYJgtZLLjVBTcYYQH6pk8+kmPOE/J45npim02Qxpm5ORx/O5DSH
	PQNhEhXp4hVCZwbecfi8Dlr1xBK4+qWfMuGyspux75I9JHxznxovRSWDkEdPwLMi1kX3
	aZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Ce2kgsM1i3hHOpOqke0ZgCyKSKQzlOGq8Xq6Ejia7Yw=;
	b=D7gwZnolBM5qkyTR3NMuWxjixXCABjFU93Y86Pw+3gbG1dXLwySE0VjhWrfAczvMGH
	Ics83i8wG/oH6lk4cJgCkgvzs272sNcyKh6psR+OzXkWWQKG8ndL6EwCYChKgXzV5mfh
	ToAQ9d/oTvrC9JgFFYgSnSr+SFbBOW43E9EUH3ONf3Nmwl2OQ5+sSTZI8vsy3HfzBUzD
	8JRxh+CHXykshhJ7sdDMPnJLp0jBFb1BjE+clvkecKkJiunqeeWBxmpVVsDvEyewNcI8
	Wy3ll23gYUAec7GjnQD0V5aFmAj2hZAcp5OlyCZnZMj3NbTR0abuO7zUAzTd0ZrBbeIB
	SS8g==
X-Gm-Message-State: AD7BkJLXF6mVVelbscjfz3uP+j6ErrYEcevhfPWOkni8u+OZJH+IJKolcEhiJehhf9qqloV0
X-Received: by 10.28.30.79 with SMTP id e76mr26669870wme.27.1460472718278;
	Tue, 12 Apr 2016 07:51:58 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id z6sm23192722wme.9.2016.04.12.07.51.57
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Apr 2016 07:51:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 15:51:51 +0100
Message-Id: <1460472714-12605-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
In-Reply-To: <1460472714-12605-1-git-send-email-ross.burton@intel.com>
References: <1460472714-12605-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/5] Revert "oeqa/selftest/wic: add test case for sparse images"
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
X-List-Received-Date: Tue, 12 Apr 2016 14:51:58 -0000

This reverts commit 43150ab7ec63d804e8a998ecee9d00295b8b2bc7.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index dd32075..a569fbf 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -276,16 +276,3 @@ class Wic(oeSelfTest):
             status, output = qemu.run_serial(command)
             self.assertEqual(1, status, 'Failed to run command "%s": %s' % (command, output))
             self.assertEqual(output, '/dev/root /\r\n/dev/vda3 /mnt')
-
-    def test_sparseness(self):
-        """Test that assembled images are sparse; apparent size > disk usage"""
-        self.assertEqual(0, runCmd("wic create directdisk "
-                                   "--image-name core-image-minimal").status)
-        images = glob(self.resultdir + "directdisk-*.direct")
-        self.assertEqual(1, len(images))
-
-        imagestat = os.stat(images.pop())
-        # st_blocks is the "number of 512-byte blocks allocated for file"
-        used = imagestat.st_blocks*512
-        apparent = imagestat.st_size
-        self.assertLess(used, apparent)
-- 
2.8.0.rc3


