Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37146.1795368566465198140
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Nov 2026 09:29:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=DvtLdiRW;
 spf=pass (domain: konsulko.com, ip: 209.85.215.178, mailfrom: tim.orling@konsulko.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cde84cb8803so212528a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 09:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1795368566; x=1795973366; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LIhEZp6eBB7Qqc4s7oJxPdTei+YAggkWYtHRtcRfYmg=;
        b=DvtLdiRWyq07vLBLYCkCzMXBO1TAgLRss90qInBbbPjo+jwhcjpFxMGV0+Cf+TB2rC
         O8aeuEgQ4mS15VZu+5UTzdXoJTixk4Uyk3s0GO8qXpi5nJKETxzhbcZeUBIicLSL2IV7
         7tV5JE3SLkBOW2QloLCB/amsBtiRziIwFtAxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368566; x=1795973366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LIhEZp6eBB7Qqc4s7oJxPdTei+YAggkWYtHRtcRfYmg=;
        b=LBfNdDfzUeeCLZPQAZZi/ilAg9+lv3HICcK9HYmRv3qYCdq23NdudqIWfLaV6ATrbx
         958c6s8zyuT4k1fiJknlXVDQEKjwVMDIln32QbwSTbeQWZXAiNAF7LuUqIuWCPpV3WVJ
         305VJSwwYQdmFztOKX0o8Y/Tk0qCuJ8OhVBB7j91GzQu6jtaF86aPcKVCBgnXrlE3ef8
         MrGvS/mu6e971Zpx9vbt66f9jGuwYzNcWwoFbetnkPf0fJzDJuv0uNdKsvGZodBLZoGf
         muYfgP8M5uzwb8a4xBLBtH5z9qy2RglhLQ1uV9l3cHHsT6QWo0SAcTc/9CWRe9vO3gKl
         XTPg==
X-Gm-Message-State: APuU4Z8/OjcTEIV72rgEXgJ2/D0O9jdzxT9859dvAAZyxmTdAy4m3Qwm
	6Ac9VTbvStGvqIlhaI4t8isUFe9Al6TX5wJLwIz9Z9POE0PpekhbYoxbNfE48rNPx5ZF3L9cdlw
	1Y7o/
X-Gm-Gg: AZFdTZeUornwHnhql5p1oAvEgxHcu69rTxCWadzE7B1+MkqctOOEgNmk7u2fnaJWnlA
	OkDhb/7PBtpCqqTIAZXTS0POzbzjFFB1LFuDHxawbLLoHYESe74nHVnTtNwrdy1uzStIliy1GSS
	8JQtCY2uQ752CIsGHn1oBUEEEvwqDavpbXufqGWQsSjGjQ0YshDI+XAl3nrPliJPuOyTY8N4r/f
	E1Qbmv9sblC55Ti34xwruXbcDpPjqd4nFvP7QOqkIK2JJ8e9MHoI3IQ0+cPn5HO47vfrEur8Vga
	YisUzCHqcUJZfCKTPyLursdpF7/fRrN3ah92c+ctEfIHESISGa53Yup7t+8bklFsYCy69p+CySI
	ao17So8UDu9h7w2kxOyjs+TT7CGny9ilB8SFKzGFwlF02JU3nemZdJIc50Gx1Jx3ixOFow3t55/
	pMILLA2rlGzlkz0qRsxe7Qulhqdtzwx4aDnC6DUwoXMZ2ha1JfgmUPyCIZTAgnBlzz+nNYa+gyV
	oAN/U9Nf0rTn8B72Arbv/M+GiFflblAEoppw2Ib8Tz8gSKLuxoS5vjMWEv3qTe8S11ujIirfHlI
	TELABe0VwE72DDAz1/fT/ZqWnP7jgVAjjxPCjkBPGVVQGJHzi0X8liKBo4u3Jvtt5cExCeFik96
	zjK58EfuXsZT03+BtBWoAXPjzMQE=
X-Received: by 2002:a17:90b:3f0f:b0:3b4:1b37:ac89 with SMTP id 98e67ed59e1d1-3b41c8ff71dmr12622336a91.34.1795368565799;
        Sun, 22 Nov 2026 09:29:25 -0800 (PST)
Return-Path: <tim.orling@konsulko.com>
Received: from thetis.home.local ([2606:c800:6024:2000:6b04:91fb:ab00:ec51])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ffa98esm16338827a91.17.2026.11.22.09.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:29:25 -0800 (PST)
From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>,
	Paul Barker <paul@pbarker.dev>
Subject: [PATCH] lib/oe/distro_check: use vendored bs4
Date: Sun, 22 Nov 2026 09:29:22 -0800
Message-ID: <20261122172922.2337113-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 22 Nov 2026 17:29:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250874
Content-Type: text/plain; charset="utf-8"

bitbake moved its bundled bs4 to bb._vendor.bs4 (4b4b9c60f "lib:
Vendorize bundled third-party libraries under bb._vendor"), so
"from bs4 import" only works if the host has its own bs4 installed.
Without it, get_links_from_url() fails, and the selftest added in
cc911c5eae ("lib/oe/distro_check: fix the openSUSE Leap package lists")
skips itself. Import from bb._vendor.bs4, as bb.fetch.wget does, and
drop the skip.

Tested with "python3 -m unittest oeqa.selftest.cases.oelib.distro_check"
on a host without bs4: the test is no longer skipped and passes.

Suggested-by: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oe/distro_check.py                        | 2 +-
 meta/lib/oeqa/selftest/cases/oelib/distro_check.py | 4 ----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/lib/oe/distro_check.py b/meta/lib/oe/distro_check.py
index d8e487318c..74862bdd8f 100644
--- a/meta/lib/oe/distro_check.py
+++ b/meta/lib/oe/distro_check.py
@@ -17,7 +17,7 @@ def create_socket(url, d):
 def get_links_from_url(url, d):
     "Return all the href links found on the web location"
 
-    from bs4 import BeautifulSoup, SoupStrainer
+    from bb._vendor.bs4 import BeautifulSoup, SoupStrainer
 
     soup = BeautifulSoup(create_socket(url,d), "html.parser", parse_only=SoupStrainer("a"))
     hyperlinks = []
diff --git a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
index d783384251..583e5dcbf6 100644
--- a/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
+++ b/meta/lib/oeqa/selftest/cases/oelib/distro_check.py
@@ -62,10 +62,6 @@ class TestOpenSUSE(TestCase):
 <a href="./15.6/">15.6/</a> <a href="./16.0/">16.0/</a> <a href="./42.3/">42.3/</a>"""
 
     def test_links_relative_to_current_directory(self):
-        try:
-            from bs4 import BeautifulSoup, SoupStrainer
-        except ImportError:
-            self.skipTest("bs4 is not available")
         with mock.patch.object(oe.distro_check, "create_socket", return_value=io.BytesIO(self.LISTING)):
             links = oe.distro_check.get_links_from_url("http://example.com/leap/", None)
         self.assertEqual(links, ["..", "15.0-Current", "15.6", "16.0", "42.3"])
-- 
2.47.3

