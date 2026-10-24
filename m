Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2968.1792832367526548064
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 01:59:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm1 header.b=gS9sN/JE;
 dkim=pass header.i=@messagingengine.com header.s=fm2 header.b=NyXt/h4C;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.145, mailfrom: paul@pbarker.dev)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 6CAABEC01A0
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 04:59:26 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sat, 24 Oct 2026 04:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1792832366; x=1792918766; bh=p6BFgZGGYc
	s7vO84zrzBb91u9xpZL+jvi7Y/SVf57ec=; b=gS9sN/JEw1v2CZ2VN0586SLnIi
	6OiCXhB3Uca63KJuX7vF+7WxFnPiAWH+UYdEbIxBAJ+sjGb1a1UGBTz6IKouo3q0
	JiaAXsC7yA27RNk2qhLwnttZ13r5MYANhUtYFeNEHmdbVJ4h6dB63E/l1kj/TdHT
	YoC8PvG6AQ0iazQfkuRi/sKWxR/hAK9J7jO4CarxTlIMJYZKFS4HDSQ9A1wIlfA0
	ce4c/E7qAdZUkKc6Clcwepy+zI+0h3vJj2ad4L1nD/dXiYrDnWiC4nn2B8Rq68uz
	b/B6ITWpJg4VSio5R0QjREDFUaMj0TFRTfDYMDGKpC4fNlJvRF+yJzKy9cUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792832366; x=1792918766; bh=p6BFgZGGYcs7vO84zrzBb91u9xpZL+jvi7Y
	/SVf57ec=; b=NyXt/h4CDgatbkXVCGzit9gr+XJ25Tvs0g4Z0GsaL9AHsiOBblC
	3T015hLxorQH3zW5CHb0EgQyeu+zOhq43ovM5zvYZflQ6pJN5S+uz3MdtV+pobBc
	qYuRari9N8tCIX1y6Jgz6rl0PmVJv/i9f+Ku3/DX1JhPj4QCs3/NbQUgONttMVHz
	BupKTQFiXau/d3pw4CGcgrj+a+LUJQ87XiR5QcCn6disTK3NzdZUP7ll8YuoFq55
	HPzwiVN30aEQ/ZQ3k12NV2oucpsO3kZQEeRGiNQYYgxOy66DlbKmbN9BoFDyEz8V
	XeLw+mHyhfrVmDK5qEK+wzpP7MKHHhrnbYg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=pbarker.dev a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792832366; d=pbarker.dev;
	mf=PHBhdWxAcGJhcmtlci5kZXY+;
	rt=PG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+;
	s=fm1:rsa-sha256:sf3V6gBUu48XRAs2/QAJp42THQCRdfvgt+itu32HewWs5H1
	JyT6gp5IV69V5uh71r0qnByPCX8+aQ8M6LyIyqcqN40GxDDBJ3FgcZHuL3/9M4M8
	42/hAGxSTbVobSF9hgO1SakVe0qZXH4VS/oT2EtIBEaolDH3pWzCKpQyawVpHAIb
	7W9fK86mmWCgzXhbv3mwPh49C/xcUFkmfwAnXWkisNl+i1Ld122V3L8eZUE7rKSx
	ywb+crsbi1k2rks5bUMbCigGmUVYen8rR5SkWSoAaqpEHC/gHPknvZGuMAE+EKKJ
	5GwimRpphIQn+dWymm0wP7IydJyDEZpNu4NohLA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=content-transfer-encoding,content-type,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:ddiWBDnUJVRLKnQeQ6WLOBwrdEO+Msb3jsbVHW0pZwo=:JcX82Alg1FSdDSMs8rmOwXMUyNrPVCH14yQIKVZ8j6E=;
X-ME-Sender: <xms:bnPcakgjxSH333mmxYYJIZXBsabmnsHd30wUGAqJKV2DGDjlWagQ1Q>
    <xme:bnPcaj_KohvRTSd4fB2Kb_UDSiLaMhZJScwzArs6RyiGUW01_uflh5l9UdaGFoKW_
    87iDuvL0kyB0Tz28efA5D11LqLF8rPfn6pH7eNB13nBdAk64M32BkPt>
X-ME-Received: <xmr:bnPcahsiO5YfuRlEjA__PBSPDNqQTpjEgcoSrOKBMxz4-_315HhS49yIGzUeiugNLZlFp-yoUSTWp7AcODHzIKC-6ChKL5w>
X-ME-Proxy-Cause: dmFkZTGp6dIcpRYRm1C0xVLTYNqYSVTWzgecfKOPFVMbdc2rStaIPQ773QPKjX5rcTxTNv
    XbKqZHyncUWt6R/vKMX4Kf0DKKOHELksV4uggDvusXAa+wE7T0qV1P4/Z33+zeOnOfNm5j
    pbzuxnAVmuLPUgq6ACswx1zAk7TmTtMEgDL2Q4SgZDmsz37GaJoZFfnczDZWcMBkCZ5srz
    f233n9gt2qFK+0Av88CJw4QdyfVpfqusnBttvrdXFXxaY/8HJAN++rvK1mgVqiC/+istbb
    iQv94riVt8C+Ju2I+gTkNtVWjoWfY/4q9Z2hRFOwGReQgZUW3a1T4hPPvyHWbH1zUaaaEN
    RXXuNe3U/dqycWXGFLHnMSZ/BFWQSaRXeCiAkn6lqXMtTkrSRZ2Jk1LFItgxEsFz74EwVT
    nxQH73eOYOnyR4FimiwpI3XAw8FPSU7toNIpKAHC2TM2sOAa93Xto8ZTFqKpjn38s+1y4C
    McCb+eLOLIe0UOuPOBnxqfarEAjG93QrmCzh15NXL6yuGTJXH63jfctMCuaK3A5kqqwG4A
    SmTvcgnNY/pGCwIK8xos7TNaJyfsgpQSYqpdeZFnsM8SwUMnQdlLR8i2bZeQxi0NvLzdaM
    wSnR/c0JTuamO6GGX1Lt+ldKuVKMh3G60DHPCgK1GXLuMwYL+Gl0Fr5RcLow
X-ME-Proxy: <xmx:bnPcaqZIK1uxTTyzKXYNI27vWJnysNjInO-956Pz4YQ92tXInzYRYw>
    <xmx:bnPcahoI4ELQlFaY3T2VyvQbc3gXkBLzOVdfrBLbKBxQTYK-p3ukBw>
    <xmx:bnPcav-7TYZP71iw5muWC6uz5BcFch0tI8fYBoy55wEs8W6R_IzmTQ>
    <xmx:bnPcag8vE4a6wXhNA1qlVCwU-2W3EBKsorEyOa-GdICfEUKmnHSiHg>
    <xmx:bnPcahzUGrqc_E6SiVFCWLv-bYFMQCEy3MRwXkzySMAF3HDRC6bdIJcr>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <openembedded-core@lists.openembedded.org>; Sat,
 24 Oct 2026 04:59:25 -0400 (EDT)
From: Paul Barker <paul@pbarker.dev>
Date: Sat, 24 Oct 2026 09:59:24 +0100
Subject: [PATCH blacksail] python3-pip: upgrade 26.2.1 -> 26.2.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-pip-blacksail-v1-1-ec58699d0556@pbarker.dev>
X-B4-Tracking: v=1; b=H4sIAGtz3GoC/z2MWwqDMBQFtyLnuwGTilC3In7kcVtvFQ25bSkE9
 96o0M/hnJkMocQk6KqMRB8WXpcC+lLBj3Z5kOJQGKY2ra5NoyJH5WbrJ7E8q2Cv5DT5W+MCihM
 T3fl79Hr8bxjOSd7uSf6197BtP02nk218AAAA
X-Change-ID: 20261024-pip-blacksail-da3eb1ec94bd
To: openembedded-core@lists.openembedded.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openssh-sha256; t=1792832365; l=3179;
 i=paul@pbarker.dev; s=id_piv_33200296; h=from:subject:message-id;
 bh=NvgBXYlgCD4H5YaH7D5HaXa7in+josXYSXzCM3MPNZU=;
 b=U1NIU0lHAAAAAQAAAGgAAAATZWNkc2Etc2hhMi1uaXN0cDI1NgAAAAhuaXN0cDI1NgAAAEEEQ
 dOfZ4fCf9WdA7cHWnYqW4P6zifYTwJ18a3l28hvdGt3M0CTKu/FWpwoh+x5E487TvYA9iW0goTM
 GGtdemFzVgAAAAZwYXRhdHQAAAAAAAAABnNoYTUxMgAAAGQAAAATZWNkc2Etc2hhMi1uaXN0cDI
 1NgAAAEkAAAAgEwUG3xDDj9Usa4Va4Q/8pC5otCK3QMVZGNljHLCoEVwAAAAhAKdbk9kAJg5wsd
 ZtcstdmJOdus7TTjS2Yu5fNk7cPvaS
X-Developer-Key: i=paul@pbarker.dev; a=openssh;
 fpr=SHA256:IlqExt9TPtGqXrqYg/YPMlsWlOGC6AVubz/PwuYw6KY
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 24 Oct 2026 08:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248586

From: Ross Burton <ross.burton@arm.com>

Just one change, upgrading the vendorered certifi to 2026.10.19, removing
the compromised eMudhra intermediate certificates[1].

[1] https://emudhra.we-have-a-problem.com

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

(cherry picked from commit d0a56494bf6617ce797c1b71a6aee6ce9ab4703e)

Signed-off-by: Paul Barker <paul@pbarker.dev>
---
 .../recipes-devtools/python/python3-pip/no_shebang_mangling.patch | 8 ++++----
 .../python/{python3-pip_26.2.1.bb => python3-pip_26.2.2.bb}       | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index e8b2982b2ab3..f388928230ef 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From e4e1fed9f8e3ff3e04467699f36599f76caa9487 Mon Sep 17 00:00:00 2001
+From ea75b7fc017f7a1a3a47e9e2bef21209f0f36a04 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
@@ -13,10 +13,10 @@ Upstream-Status: Inappropriate [OE specific config]
  1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/src/pip/_vendor/distlib/scripts.py b/src/pip/_vendor/distlib/scripts.py
-index 195dc3f..a0e0d61 100644
+index ac9e909..1faa5b6 100644
 --- a/src/pip/_vendor/distlib/scripts.py
 +++ b/src/pip/_vendor/distlib/scripts.py
-@@ -155,6 +155,8 @@ class ScriptMaker(object):
+@@ -157,6 +157,8 @@ class ScriptMaker(object):
          See also: http://www.in-ulm.de/~mascheck/various/shebang/#length
                    https://hg.mozilla.org/mozilla-central/file/tip/mach
          """
@@ -25,7 +25,7 @@ index 195dc3f..a0e0d61 100644
          if os.name != 'posix':
              simple_shebang = True
          elif getattr(sys, "cross_compiling", False):
-@@ -363,7 +365,7 @@ class ScriptMaker(object):
+@@ -367,7 +369,7 @@ class ScriptMaker(object):
                  return
  
              match = FIRST_LINE_RE.match(first_line.replace(b'\r\n', b'\n'))
diff --git a/meta/recipes-devtools/python/python3-pip_26.2.1.bb b/meta/recipes-devtools/python/python3-pip_26.2.2.bb
similarity index 97%
rename from meta/recipes-devtools/python/python3-pip_26.2.1.bb
rename to meta/recipes-devtools/python/python3-pip_26.2.2.bb
index 7f041f822e33..c83c9e4468dc 100644
--- a/meta/recipes-devtools/python/python3-pip_26.2.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_26.2.2.bb
@@ -26,7 +26,7 @@ inherit pypi python_flit_core
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "f6ad667e89a1fe78046c8f13232b247200f5258d7828f3f7883d660878e0813f"
+SRC_URI[sha256sum] = "3a8e5c800492787f33a4114ef54444546c340df428974ebba17e0fd47e11af2f"
 
 CVE_PRODUCT = "pypa:pip"
 

---
base-commit: b2d8d86c02627276d818793b5fbe94d5f12dfaf5
change-id: 20261024-pip-blacksail-da3eb1ec94bd

Best regards,
--  
Paul Barker

