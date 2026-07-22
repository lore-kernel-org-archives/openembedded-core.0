Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4927CC44539
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 05:50:11 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41698.1784699401301495829
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 22:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bN5riWj6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nV/Kcd6b;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019f885fb04a-54c16695-7012-4e84-9286-dce71380ea71-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1784699400;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Dc9bU9CUA4BFvkSQacH6TmMpRB3jJZ1XEJovwNJrx9o=;
	b=bN5riWj67fdYIlTIW2Fh0+7qZ3ke+J3mCmmfQzBBtDkmIBBmjWDP8Cxl6lkSy4sc
	aTxEej6CiNDoOGdEyWI6EpOckXH1bkQz8gdG7W62t5XY8jyeXke65hBYUqDvGtpgUdt
	8rYp4yrXxbQjWseut/4j6n9pEHZZJfap6/hXUMlQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1784699400;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Dc9bU9CUA4BFvkSQacH6TmMpRB3jJZ1XEJovwNJrx9o=;
	b=nV/Kcd6burcf1v3zMYiHm93NYRtA5doIzb2RvXldYK7+HBW6+ODnEhR2oqzdIuPS
	qD5jw5/V/hMo8ZU0o6oJ+A8l1VbW++uQbGnmTnl7zSRvCNyvc+cIFXTZ2YLBhtL/DgG
	58pz//NJHDg4beM5a5C5OlFGqlwrtEC1E23wCH5U=
Content-Type: multipart/mixed; boundary="===============4387462532588677620=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-uv-build: upgrading to 0.11.31 SUCCEEDED
Message-ID: <0101019f885fb04a-54c16695-7012-4e84-9286-dce71380ea71-000000@us-west-2.amazonses.com>
Date: Wed, 22 Jul 2026 05:50:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.07.22-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 05:50:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241591

--===============4387462532588677620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-uv-build* to *0.11.31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-uv-build-upgrade-0.11.29-0.11.31.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From cfa2c121c9a13413772ed43f398dc9ef49611e53 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 22 Jul 2026 05:49:53 +0000
Subject: [PATCH] python3-uv-build: upgrade 0.11.29 -> 0.11.31

---
 .../python/python3-uv-build-crates.inc        | 32 +++++++++----------
 ...0.11.29.bb => python3-uv-build_0.11.31.bb} |  2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)
 rename meta/recipes-devtools/python/{python3-uv-build_0.11.29.bb => python3-uv-build_0.11.31.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-uv-build-crates.inc b/meta/recipes-devtools/python/python3-uv-build-crates.inc
index f1de38878c..c0839045bd 100644
--- a/meta/recipes-devtools/python/python3-uv-build-crates.inc
+++ b/meta/recipes-devtools/python/python3-uv-build-crates.inc
@@ -28,7 +28,7 @@ SRC_URI += " \
     crate://crates.io/bumpalo/3.20.2 \
     crate://crates.io/bytecheck/0.8.2 \
     crate://crates.io/bytecheck_derive/0.8.2 \
-    crate://crates.io/bytes/1.12.0 \
+    crate://crates.io/bytes/1.12.1 \
     crate://crates.io/bzip2/0.5.2 \
     crate://crates.io/bzip2-sys/0.1.13+1.0.8 \
     crate://crates.io/cc/1.2.57 \
@@ -103,9 +103,9 @@ SRC_URI += " \
     crate://crates.io/is_terminal_polyfill/1.70.2 \
     crate://crates.io/itertools/0.14.0 \
     crate://crates.io/itoa/1.0.17 \
-    crate://crates.io/jiff/0.2.31 \
-    crate://crates.io/jiff-static/0.2.31 \
-    crate://crates.io/jiff-tzdb/0.1.6 \
+    crate://crates.io/jiff/0.2.32 \
+    crate://crates.io/jiff-static/0.2.32 \
+    crate://crates.io/jiff-tzdb/0.1.8 \
     crate://crates.io/jiff-tzdb-platform/0.1.3 \
     crate://crates.io/jobserver/0.1.35 \
     crate://crates.io/js-sys/0.3.91 \
@@ -120,7 +120,7 @@ SRC_URI += " \
     crate://crates.io/lzma-sys/0.1.20 \
     crate://crates.io/mailparse/0.16.1 \
     crate://crates.io/matchers/0.2.0 \
-    crate://crates.io/memchr/2.8.2 \
+    crate://crates.io/memchr/2.8.3 \
     crate://crates.io/miniz_oxide/0.8.9 \
     crate://crates.io/mio/1.2.0 \
     crate://crates.io/munge/0.4.7 \
@@ -159,8 +159,8 @@ SRC_URI += " \
     crate://crates.io/ref-cast/1.0.25 \
     crate://crates.io/ref-cast-impl/1.0.25 \
     crate://crates.io/reflink-copy/0.1.30 \
-    crate://crates.io/regex/1.12.4 \
-    crate://crates.io/regex-automata/0.4.14 \
+    crate://crates.io/regex/1.13.0 \
+    crate://crates.io/regex-automata/0.4.15 \
     crate://crates.io/regex-syntax/0.8.11 \
     crate://crates.io/rend/0.5.3 \
     crate://crates.io/rkyv/0.8.17 \
@@ -235,7 +235,7 @@ SRC_URI += " \
     crate://crates.io/url/2.5.8 \
     crate://crates.io/utf8_iter/1.0.4 \
     crate://crates.io/utf8parse/0.2.2 \
-    crate://crates.io/uuid/1.23.4 \
+    crate://crates.io/uuid/1.23.5 \
     crate://crates.io/valuable/0.1.1 \
     crate://crates.io/version_check/0.9.5 \
     crate://crates.io/vte/0.14.1 \
@@ -313,7 +313,7 @@ SRC_URI[bstr-1.12.1.sha256sum] = "63044e1ae8e69f3b5a92c736ca6269b8d12fa7efe39bf3
 SRC_URI[bumpalo-3.20.2.sha256sum] = "5d20789868f4b01b2f2caec9f5c4e0213b41e3e5702a50157d699ae31ced2fcb"
 SRC_URI[bytecheck-0.8.2.sha256sum] = "0caa33a2c0edca0419d15ac723dff03f1956f7978329b1e3b5fdaaaed9d3ca8b"
 SRC_URI[bytecheck_derive-0.8.2.sha256sum] = "89385e82b5d1821d2219e0b095efa2cc1f246cbf99080f3be46a1a85c0d392d9"
-SRC_URI[bytes-1.12.0.sha256sum] = "8ae3f5d315924270530207e2a68396c3cc547f6dca3fbdca317cfb1a51edb593"
+SRC_URI[bytes-1.12.1.sha256sum] = "fc652a48c352aef3ea3aed32080501cf3ef6ed5da78602a020c991775b0aff04"
 SRC_URI[bzip2-0.5.2.sha256sum] = "49ecfb22d906f800d4fe833b6282cf4dc1c298f5057ca0b5445e5c209735ca47"
 SRC_URI[bzip2-sys-0.1.13+1.0.8.sha256sum] = "225bff33b2141874fe80d71e07d6eec4f85c5c216453dd96388240f96e1acc14"
 SRC_URI[cc-1.2.57.sha256sum] = "7a0dd1ca384932ff3641c8718a02769f1698e7563dc6974ffd03346116310423"
@@ -388,9 +388,9 @@ SRC_URI[insta-1.48.0.sha256sum] = "86f0f8fee8c926415c58d6ae43a08523a26faccb2323f
 SRC_URI[is_terminal_polyfill-1.70.2.sha256sum] = "a6cb138bb79a146c1bd460005623e142ef0181e3d0219cb493e02f7d08a35695"
 SRC_URI[itertools-0.14.0.sha256sum] = "2b192c782037fadd9cfa75548310488aabdbf3d2da73885b31bd0abd03351285"
 SRC_URI[itoa-1.0.17.sha256sum] = "92ecc6618181def0457392ccd0ee51198e065e016d1d527a7ac1b6dc7c1f09d2"
-SRC_URI[jiff-0.2.31.sha256sum] = "ccfe6121cbe750cf81efa362d85c0bde7ea298ec43092d3a193baca59cdbd634"
-SRC_URI[jiff-static-0.2.31.sha256sum] = "e165e897f662d428f3cd3828a919dbe067c2d42bb1031eede74ef9d27ecdedd2"
-SRC_URI[jiff-tzdb-0.1.6.sha256sum] = "c900ef84826f1338a557697dc8fc601df9ca9af4ac137c7fb61d4c6f2dfd3076"
+SRC_URI[jiff-0.2.32.sha256sum] = "961d16382652bfdd8c6f68b223b26a8c93e0d475c672f414411db31c6c5c900e"
+SRC_URI[jiff-static-0.2.32.sha256sum] = "d0879bd39df99c4c5e2c6615ccc026391a423dde10532c573e6086eb94a802cc"
+SRC_URI[jiff-tzdb-0.1.8.sha256sum] = "142bd39932ad231f10513df9ab62661fead8719872150b7ad02a2df79f4e141e"
 SRC_URI[jiff-tzdb-platform-0.1.3.sha256sum] = "875a5a69ac2bab1a891711cf5eccbec1ce0341ea805560dcd90b7a2e925132e8"
 SRC_URI[jobserver-0.1.35.sha256sum] = "1c00acbd29eabad4a2392fa0e921c874934dbbf4194312ad20f04a0ed67a3cb3"
 SRC_URI[js-sys-0.3.91.sha256sum] = "b49715b7073f385ba4bc528e5747d02e66cb39c6146efb66b781f131f0fb399c"
@@ -405,7 +405,7 @@ SRC_URI[log-0.4.29.sha256sum] = "5e5032e24019045c762d3c0f28f5b6b8bbf38563a659083
 SRC_URI[lzma-sys-0.1.20.sha256sum] = "5fda04ab3764e6cde78b9974eec4f779acaba7c4e84b36eca3cf77c581b85d27"
 SRC_URI[mailparse-0.16.1.sha256sum] = "60819a97ddcb831a5614eb3b0174f3620e793e97e09195a395bfa948fd68ed2f"
 SRC_URI[matchers-0.2.0.sha256sum] = "d1525a2a28c7f4fa0fc98bb91ae755d1e2d1505079e05539e35bc876b5d65ae9"
-SRC_URI[memchr-2.8.2.sha256sum] = "88904434abc2901f197fe8cc55f0445e7ded921dba5911dad2e2b39b48e663c4"
+SRC_URI[memchr-2.8.3.sha256sum] = "cf8baf1c55e62ffcace7a9f06f4bd9cd3f0c4beb022d3b367256b91b87513d98"
 SRC_URI[miniz_oxide-0.8.9.sha256sum] = "1fa76a2c86f704bdb222d66965fb3d63269ce38518b83cb0575fca855ebb6316"
 SRC_URI[mio-1.2.0.sha256sum] = "50b7e5b27aa02a74bac8c3f23f448f8d87ff11f92d3aac1a6ed369ee08cc56c1"
 SRC_URI[munge-0.4.7.sha256sum] = "5e17401f259eba956ca16491461b6e8f72913a0a114e39736ce404410f915a0c"
@@ -444,8 +444,8 @@ SRC_URI[redox_syscall-0.5.15.sha256sum] = "7e8af0dde094006011e6a740d487931943948
 SRC_URI[ref-cast-1.0.25.sha256sum] = "f354300ae66f76f1c85c5f84693f0ce81d747e2c3f21a45fef496d89c960bf7d"
 SRC_URI[ref-cast-impl-1.0.25.sha256sum] = "b7186006dcb21920990093f30e3dea63b7d6e977bf1256be20c3563a5db070da"
 SRC_URI[reflink-copy-0.1.30.sha256sum] = "d9dd7ab4af0363d5ccfd2838d782a28196cf32a5cc2e4fe3c5dc83f2be588b8b"
-SRC_URI[regex-1.12.4.sha256sum] = "f1292b7759ae1cb9ec195452d1390a074f0cd8541ab7a5a8c31cd6db45d4a6ba"
-SRC_URI[regex-automata-0.4.14.sha256sum] = "6e1dd4122fc1595e8162618945476892eefca7b88c52820e74af6262213cae8f"
+SRC_URI[regex-1.13.0.sha256sum] = "2a0e75113e14dc5acb068cd0786884f214f1312650a3d36d269f5c4f3cdee8a2"
+SRC_URI[regex-automata-0.4.15.sha256sum] = "1f388202e4b80542a0921078cc23b6333bcf1409c1e3f86404cae4766a6131db"
 SRC_URI[regex-syntax-0.8.11.sha256sum] = "d6f6ff9a378485b298a5286656da665ba74413d36db0979633275d2e708145d4"
 SRC_URI[rend-0.5.3.sha256sum] = "cadadef317c2f20755a64d7fdc48f9e7178ee6b0e1f7fce33fa60f1d68a276e6"
 SRC_URI[rkyv-0.8.17.sha256sum] = "815cc8a37159a463064825246cadb07961e25cd9885908606f6d08a98d8f8874"
@@ -520,7 +520,7 @@ SRC_URI[unscanny-0.1.0.sha256sum] = "e9df2af067a7953e9c3831320f35c1cc0600c30d44d
 SRC_URI[url-2.5.8.sha256sum] = "ff67a8a4397373c3ef660812acab3268222035010ab8680ec4215f38ba3d0eed"
 SRC_URI[utf8_iter-1.0.4.sha256sum] = "b6c140620e7ffbb22c2dee59cafe6084a59b5ffc27a8859a5f0d494b5d52b6be"
 SRC_URI[utf8parse-0.2.2.sha256sum] = "06abde3611657adf66d383f00b093d7faecc7fa57071cce2578660c9f1010821"
-SRC_URI[uuid-1.23.4.sha256sum] = "bf80a72845275afea99e7f2b434723d3bc7e38470fcd1c7ed39a599c73319a53"
+SRC_URI[uuid-1.23.5.sha256sum] = "ea5fab0d6c3c01ae70085a09cb03d4c7a1d6314e2b3e075392783396d724ca0a"
 SRC_URI[valuable-0.1.1.sha256sum] = "ba73ea9cf16a25df0c8caa16c51acb937d5712a8429db78a3ee29d5dcacd3a65"
 SRC_URI[version_check-0.9.5.sha256sum] = "0b928f33d975fc6ad9f86c8f283853ad26bdd5b10b7f1542aa2fa15e2289105a"
 SRC_URI[vte-0.14.1.sha256sum] = "231fdcd7ef3037e8330d8e17e61011a2c244126acc0a982f4040ac3f9f0bc077"
diff --git a/meta/recipes-devtools/python/python3-uv-build_0.11.29.bb b/meta/recipes-devtools/python/python3-uv-build_0.11.31.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-uv-build_0.11.29.bb
rename to meta/recipes-devtools/python/python3-uv-build_0.11.31.bb
index 202e7f1834..a6a5e7506d 100644
--- a/meta/recipes-devtools/python/python3-uv-build_0.11.29.bb
+++ b/meta/recipes-devtools/python/python3-uv-build_0.11.31.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE-APACHE;md5=86d3f3a95c324c9479bd8986968f4327 \
                     file://crates/uv-pep508/License-Apache;md5=e23fadd6ceef8c618fc1c65191d846fa \
                     file://crates/uv-pep508/License-BSD;md5=ef7a6027dc4c2389b9afad7e690274c7"
 
-SRC_URI[sha256sum] = "7dd16d50366f410ae494a27be20b45206feeac37d99dc53abfa1a04410069b78"
+SRC_URI[sha256sum] = "5a0c94681c1d869db209242f10e33df14f116ee28677a5be9610c3f307645ffe"
 
 require ${BPN}-crates.inc
 
-- 
2.47.1


--===============4387462532588677620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-uv-build: PV changed from "0.11.29" to "0.11.31"
packages/x86-64-v3-poky-linux/python3-uv-build: PKGV changed from 0.11.29 [default] to 0.11.31 [default]
packages/x86-64-v3-poky-linux/python3-uv-build: SRC_URI changed from "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.29.tar.gz;downloadfilename=uv_build-0.11.29.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.103 crate://crates.io/arcstr/1.2.0 crate://crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.6.3 crate://crates.io/astral-version-ranges/0.2.1 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates
 .io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.0 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatures/0.2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.
 0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate://crates.io/fs-err/3.3.1 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 c
 rate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://crates.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.31 crate://crates.io/jiff-static/0.2.31 crate://crates.io/jiff-tzdb/0.1.6 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 cr
 ate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.2 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pe
 st_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/quote/1.0.46 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.12.4 crate://crates.io/regex-automata/0.4.14 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.17 crate://crates
 .io/rkyv_derive/0.8.17 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate://crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/sm
 awk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://crates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://cra
 tes.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://crates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.4 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winap
 i-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.
 3 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7" to "https://files.pythonhosted.org/packages/source/u/uv_build/uv_build-0.11.31.tar.gz;downloadfilename=uv_build-0.11.31.tar.gz crate://crates.io/adler2/2.0.1 crate://crates.io/aho-corasick/1.1.4 crate://crates.io/allocator-api2/0.2.21 crate://crates.io/anstream/1.0.0 crate://crates.io/anstyle/1.0.14 crate://crates.io/anstyle-parse/1.0.0 crate://crates.io/anstyle-query/1.1.5 crate://crates.io/anstyle-wincon/3.0.11 crate://crates.io/anyhow/1.0.103 crate://crates.io/arcstr/1.2.0 crate:
 //crates.io/arrayvec/0.7.8 crate://crates.io/astral-tokio-tar/0.6.3 crate://crates.io/astral-version-ranges/0.2.1 crate://crates.io/astral_async_zip/0.0.20 crate://crates.io/async-compression/0.4.19 crate://crates.io/autocfg/1.5.0 crate://crates.io/backon/1.6.0 crate://crates.io/base64/0.22.1 crate://crates.io/bitflags/1.3.2 crate://crates.io/bitflags/2.13.0 crate://crates.io/block-buffer/0.10.4 crate://crates.io/boxcar/0.2.14 crate://crates.io/bstr/1.12.1 crate://crates.io/bumpalo/3.20.2 crate://crates.io/bytecheck/0.8.2 crate://crates.io/bytecheck_derive/0.8.2 crate://crates.io/bytes/1.12.1 crate://crates.io/bzip2/0.5.2 crate://crates.io/bzip2-sys/0.1.13+1.0.8 crate://crates.io/cc/1.2.57 crate://crates.io/cfg-if/1.0.4 crate://crates.io/charset/0.1.5 crate://crates.io/clap/4.6.1 crate://crates.io/clap_builder/4.6.0 crate://crates.io/clap_derive/4.6.1 crate://crates.io/clap_lex/1.1.0 crate://crates.io/colorchoice/1.0.5 crate://crates.io/console/0.16.4 crate://crates.io/cpufeatures/0
 .2.17 crate://crates.io/crc32fast/1.5.0 crate://crates.io/crypto-common/0.1.7 crate://crates.io/csv/1.4.0 crate://crates.io/csv-core/0.1.13 crate://crates.io/data-encoding/2.11.0 crate://crates.io/defmt/1.1.0 crate://crates.io/defmt-macros/1.1.0 crate://crates.io/defmt-parser/1.0.0 crate://crates.io/digest/0.10.7 crate://crates.io/displaydoc/0.2.5 crate://crates.io/dunce/1.0.5 crate://crates.io/dyn-clone/1.0.20 crate://crates.io/either/1.16.0 crate://crates.io/encode_unicode/1.0.0 crate://crates.io/encoding_rs/0.8.35 crate://crates.io/encoding_rs_io/0.1.7 crate://crates.io/enumflags2/0.7.12 crate://crates.io/enumflags2_derive/0.7.12 crate://crates.io/equivalent/1.0.2 crate://crates.io/erased-serde/0.4.10 crate://crates.io/errno/0.3.14 crate://crates.io/fastrand/2.4.1 crate://crates.io/find-msvc-tools/0.1.9 crate://crates.io/fixedbitset/0.5.7 crate://crates.io/flate2/1.1.9 crate://crates.io/foldhash/0.1.5 crate://crates.io/foldhash/0.2.0 crate://crates.io/form_urlencoded/1.2.2 crate:
 //crates.io/fs-err/3.3.1 crate://crates.io/futures/0.3.32 crate://crates.io/futures-channel/0.3.32 crate://crates.io/futures-core/0.3.32 crate://crates.io/futures-executor/0.3.32 crate://crates.io/futures-io/0.3.32 crate://crates.io/futures-lite/2.6.1 crate://crates.io/futures-macro/0.3.32 crate://crates.io/futures-sink/0.3.32 crate://crates.io/futures-task/0.3.32 crate://crates.io/futures-util/0.3.32 crate://crates.io/generic-array/0.14.7 crate://crates.io/getrandom/0.4.3 crate://crates.io/globset/0.4.18 crate://crates.io/gloo-timers/0.3.0 crate://crates.io/hashbrown/0.15.5 crate://crates.io/hashbrown/0.17.1 crate://crates.io/heck/0.5.0 crate://crates.io/hex/0.4.3 crate://crates.io/icu_collections/2.1.1 crate://crates.io/icu_locale_core/2.1.1 crate://crates.io/icu_normalizer/2.1.1 crate://crates.io/icu_normalizer_data/2.1.1 crate://crates.io/icu_properties/2.1.2 crate://crates.io/icu_properties_data/2.1.2 crate://crates.io/icu_provider/2.1.1 crate://crates.io/idna/1.1.0 crate://cra
 tes.io/idna_adapter/1.2.1 crate://crates.io/indexmap/2.14.0 crate://crates.io/indoc/2.0.7 crate://crates.io/insta/1.48.0 crate://crates.io/is_terminal_polyfill/1.70.2 crate://crates.io/itertools/0.14.0 crate://crates.io/itoa/1.0.17 crate://crates.io/jiff/0.2.32 crate://crates.io/jiff-static/0.2.32 crate://crates.io/jiff-tzdb/0.1.8 crate://crates.io/jiff-tzdb-platform/0.1.3 crate://crates.io/jobserver/0.1.35 crate://crates.io/js-sys/0.3.91 crate://crates.io/junction/2.0.0 crate://crates.io/lazy_static/1.5.0 crate://crates.io/libc/0.2.186 crate://crates.io/linux-raw-sys/0.4.15 crate://crates.io/linux-raw-sys/0.12.1 crate://crates.io/litemap/0.8.1 crate://crates.io/lock_api/0.4.14 crate://crates.io/log/0.4.29 crate://crates.io/lzma-sys/0.1.20 crate://crates.io/mailparse/0.16.1 crate://crates.io/matchers/0.2.0 crate://crates.io/memchr/2.8.3 crate://crates.io/miniz_oxide/0.8.9 crate://crates.io/mio/1.2.0 crate://crates.io/munge/0.4.7 crate://crates.io/munge_macro/0.4.7 crate://crates.io/
 nu-ansi-term/0.50.3 crate://crates.io/once_cell/1.21.4 crate://crates.io/once_cell_polyfill/1.70.2 crate://crates.io/owo-colors/4.3.0 crate://crates.io/parking/2.2.1 crate://crates.io/parking_lot/0.12.5 crate://crates.io/parking_lot_core/0.9.12 crate://crates.io/path-slash/0.2.1 crate://crates.io/percent-encoding/2.3.2 crate://crates.io/pest/2.8.6 crate://crates.io/pest_derive/2.8.6 crate://crates.io/pest_generator/2.8.6 crate://crates.io/pest_meta/2.8.6 crate://crates.io/petgraph/0.8.3 crate://crates.io/pin-project/1.1.11 crate://crates.io/pin-project-internal/1.1.11 crate://crates.io/pin-project-lite/0.2.17 crate://crates.io/pkg-config/0.3.32 crate://crates.io/portable-atomic/1.13.1 crate://crates.io/portable-atomic-util/0.2.6 crate://crates.io/potential_utf/0.1.4 crate://crates.io/proc-macro-error-attr2/2.0.0 crate://crates.io/proc-macro-error2/2.0.1 crate://crates.io/proc-macro2/1.0.106 crate://crates.io/ptr_meta/0.3.1 crate://crates.io/ptr_meta_derive/0.3.1 crate://crates.io/qu
 ote/1.0.46 crate://crates.io/quoted_printable/0.5.1 crate://crates.io/r-efi/6.0.0 crate://crates.io/rancor/0.1.1 crate://crates.io/redox_syscall/0.5.15 crate://crates.io/ref-cast/1.0.25 crate://crates.io/ref-cast-impl/1.0.25 crate://crates.io/reflink-copy/0.1.30 crate://crates.io/regex/1.13.0 crate://crates.io/regex-automata/0.4.15 crate://crates.io/regex-syntax/0.8.11 crate://crates.io/rend/0.5.3 crate://crates.io/rkyv/0.8.17 crate://crates.io/rkyv_derive/0.8.17 crate://crates.io/rustc-hash/2.1.3 crate://crates.io/rustix/0.38.44 crate://crates.io/rustix/1.1.4 crate://crates.io/rustversion/1.0.22 crate://crates.io/ryu/1.0.23 crate://crates.io/same-file/1.0.6 crate://crates.io/schemars/1.2.1 crate://crates.io/schemars_derive/1.2.1 crate://crates.io/scopeguard/1.2.0 crate://crates.io/seahash/4.1.0 crate://crates.io/self-replace/1.5.0 crate://crates.io/serde/1.0.228 crate://crates.io/serde-untagged/0.1.9 crate://crates.io/serde_core/1.0.228 crate://crates.io/serde_derive/1.0.228 crate:
 //crates.io/serde_derive_internals/0.29.1 crate://crates.io/serde_json/1.0.150 crate://crates.io/serde_spanned/1.1.1 crate://crates.io/sha2/0.10.9 crate://crates.io/sharded-slab/0.1.7 crate://crates.io/shlex/1.3.0 crate://crates.io/signal-hook-registry/1.4.8 crate://crates.io/simd-adler32/0.3.8 crate://crates.io/simdutf8/0.1.5 crate://crates.io/similar/2.7.0 crate://crates.io/slab/0.4.12 crate://crates.io/smallvec/1.15.2 crate://crates.io/smawk/0.3.2 crate://crates.io/spdx/0.13.4 crate://crates.io/stable_deref_trait/1.2.1 crate://crates.io/strip-ansi-escapes/0.2.1 crate://crates.io/strsim/0.11.1 crate://crates.io/syn/2.0.118 crate://crates.io/synstructure/0.13.2 crate://crates.io/temp-env/0.3.6 crate://crates.io/tempfile/3.27.0 crate://crates.io/terminal_size/0.4.4 crate://crates.io/textwrap/0.16.2 crate://crates.io/thiserror/2.0.18 crate://crates.io/thiserror-impl/2.0.18 crate://crates.io/thread_local/1.1.9 crate://crates.io/tinystr/0.8.2 crate://crates.io/tinyvec/1.11.0 crate://cr
 ates.io/tinyvec_macros/0.1.1 crate://crates.io/tokio/1.52.3 crate://crates.io/tokio-macros/2.7.0 crate://crates.io/tokio-stream/0.1.18 crate://crates.io/tokio-util/0.7.18 crate://crates.io/toml/1.1.2+spec-1.1.0 crate://crates.io/toml_datetime/1.1.1+spec-1.1.0 crate://crates.io/toml_edit/0.25.12+spec-1.1.0 crate://crates.io/toml_parser/1.1.2+spec-1.1.0 crate://crates.io/toml_writer/1.1.1+spec-1.1.0 crate://crates.io/tracing/0.1.44 crate://crates.io/tracing-attributes/0.1.31 crate://crates.io/tracing-core/0.1.36 crate://crates.io/tracing-log/0.2.0 crate://crates.io/tracing-subscriber/0.3.23 crate://crates.io/tracing-test/0.2.6 crate://crates.io/tracing-test-macro/0.2.6 crate://crates.io/typeid/1.0.3 crate://crates.io/typenum/1.20.1 crate://crates.io/ucd-trie/0.1.7 crate://crates.io/unicode-ident/1.0.24 crate://crates.io/unicode-linebreak/0.1.5 crate://crates.io/unicode-width/0.2.2 crate://crates.io/unscanny/0.1.0 crate://crates.io/url/2.5.8 crate://crates.io/utf8_iter/1.0.4 crate://cr
 ates.io/utf8parse/0.2.2 crate://crates.io/uuid/1.23.5 crate://crates.io/valuable/0.1.1 crate://crates.io/version_check/0.9.5 crate://crates.io/vte/0.14.1 crate://crates.io/walkdir/2.5.0 crate://crates.io/wasi/0.11.1+wasi-snapshot-preview1 crate://crates.io/wasm-bindgen/0.2.114 crate://crates.io/wasm-bindgen-macro/0.2.114 crate://crates.io/wasm-bindgen-macro-support/0.2.114 crate://crates.io/wasm-bindgen-shared/0.2.114 crate://crates.io/winapi-util/0.1.11 crate://crates.io/windows/0.61.3 crate://crates.io/windows-collections/0.2.0 crate://crates.io/windows-core/0.61.2 crate://crates.io/windows-future/0.2.1 crate://crates.io/windows-implement/0.60.2 crate://crates.io/windows-interface/0.59.3 crate://crates.io/windows-link/0.1.3 crate://crates.io/windows-link/0.2.1 crate://crates.io/windows-numerics/0.2.0 crate://crates.io/windows-result/0.3.4 crate://crates.io/windows-strings/0.4.2 crate://crates.io/windows-sys/0.52.0 crate://crates.io/windows-sys/0.61.2 crate://crates.io/windows-targ
 ets/0.52.6 crate://crates.io/windows-threading/0.1.0 crate://crates.io/windows_aarch64_gnullvm/0.52.6 crate://crates.io/windows_aarch64_msvc/0.52.6 crate://crates.io/windows_i686_gnu/0.52.6 crate://crates.io/windows_i686_gnullvm/0.52.6 crate://crates.io/windows_i686_msvc/0.52.6 crate://crates.io/windows_x86_64_gnu/0.52.6 crate://crates.io/windows_x86_64_gnullvm/0.52.6 crate://crates.io/windows_x86_64_msvc/0.52.6 crate://crates.io/winnow/1.0.3 crate://crates.io/writeable/0.6.2 crate://crates.io/xattr/1.6.1 crate://crates.io/xz2/0.1.7 crate://crates.io/yoke/0.8.1 crate://crates.io/yoke-derive/0.8.1 crate://crates.io/zerofrom/0.1.6 crate://crates.io/zerofrom-derive/0.1.6 crate://crates.io/zerotrie/0.2.3 crate://crates.io/zerovec/0.11.5 crate://crates.io/zerovec-derive/0.11.2 crate://crates.io/zlib-rs/0.6.3 crate://crates.io/zmij/1.0.21 crate://crates.io/zstd/0.13.3 crate://crates.io/zstd-safe/7.2.4 crate://crates.io/zstd-sys/2.0.16+zstd.1.5.7"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PV changed from "0.11.29" to "0.11.31"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dbg: PKGV changed from 0.11.29 [default] to 0.11.31 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PV changed from "0.11.29" to "0.11.31"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-dev: PKGV changed from 0.11.29 [default] to 0.11.31 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PV changed from "0.11.29" to "0.11.31"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-doc: PKGV changed from 0.11.29 [default] to 0.11.31 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PV changed from "0.11.29" to "0.11.31"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-locale: PKGV changed from 0.11.29 [default] to 0.11.31 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PV changed from "0.11.29" to "0.11.31"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-src: PKGV changed from 0.11.29 [default] to 0.11.31 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PV changed from "0.11.29" to "0.11.31"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build-staticdev: PKGV changed from 0.11.29 [default] to 0.11.31 [default]
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.31.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.31.dist-info
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PV changed from "0.11.29" to "0.11.31"
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGSIZE changed from 5360946 to 5360914 (-0%)
packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: PKGV changed from 0.11.29 [default] to 0.11.31 [default]
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.31.dist-info
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_scm-10.2.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_scm-10.2.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools_scm/_integration/bdist_wheel.py was removed
  /usr/lib/python3.14/site-packages/setuptools_scm/_integration/__pycache__/bdist_wheel.cpython-314.pyc was removed

--===============4387462532588677620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-uv-build/python3-uv-build: FILELIST: directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info/licenses -> /usr/lib/python3.14/site-packages/uv_build-0.11.31.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info -> /usr/lib/python3.14/site-packages/uv_build-0.11.31.dist-info
Changes to packages/x86-64-v3-poky-linux/python3-uv-build (sysroot):
  /usr/lib/python3.14/site-packages/uv_build-0.11.29.dist-info moved to /usr/lib/python3.14/site-packages/uv_build-0.11.31.dist-info
Changes to packages/x86_64-linux/python3-setuptools-scm-native (sysroot):
  /usr/lib/python3.14/site-packages/setuptools_scm-10.2.1.dist-info moved to /usr/lib/python3.14/site-packages/setuptools_scm-10.2.0.dist-info
  /usr/lib/python3.14/site-packages/setuptools_scm/_integration/bdist_wheel.py was removed
  /usr/lib/python3.14/site-packages/setuptools_scm/_integration/__pycache__/bdist_wheel.cpython-314.pyc was removed

--===============4387462532588677620==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-uv-build-upgrade-0.11.29-0.11.31.patch"

RnJvbSBjZmEyYzEyMWM5YTEzNDEzNzcyZWQ0M2YzOThkYzllZjQ5NjExZTUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjIgSnVsIDIwMjYgMDU6NDk6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXV2LWJ1aWxkOiB1cGdyYWRlIDAuMTEuMjkgLT4gMC4xMS4zMQoKLS0tCiAuLi4vcHl0
aG9uL3B5dGhvbjMtdXYtYnVpbGQtY3JhdGVzLmluYyAgICAgICAgfCAzMiArKysrKysrKystLS0t
LS0tLS0tCiAuLi4wLjExLjI5LmJiID0+IHB5dGhvbjMtdXYtYnVpbGRfMC4xMS4zMS5iYn0gfCAg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXV2LWJ1aWxkXzAu
MTEuMjkuYmIgPT4gcHl0aG9uMy11di1idWlsZF8wLjExLjMxLmJifSAoOTIlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWlsZC1jcmF0ZXMu
aW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRl
cy5pbmMKaW5kZXggZjFkZTM4ODc4Yy4uYzA4MzkwNDViZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXV2LWJ1aWxkLWNyYXRlcy5pbmMKQEAg
LTI4LDcgKzI4LDcgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9idW1w
YWxvLzMuMjAuMiBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnl0ZWNoZWNrLzAuOC4yIFwKICAg
ICBjcmF0ZTovL2NyYXRlcy5pby9ieXRlY2hlY2tfZGVyaXZlLzAuOC4yIFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby9ieXRlcy8xLjEyLjAgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2J5dGVzLzEu
MTIuMSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vYnppcDIvMC41LjIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2J6aXAyLXN5cy8wLjEuMTMrMS4wLjggXAogICAgIGNyYXRlOi8vY3JhdGVzLmlv
L2NjLzEuMi41NyBcCkBAIC0xMDMsOSArMTAzLDkgQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9pc190ZXJtaW5hbF9wb2x5ZmlsbC8xLjcwLjIgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL2l0ZXJ0b29scy8wLjE0LjAgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2l0b2Ev
MS4wLjE3IFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLzAuMi4zMSBcCi0gICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vamlmZi1zdGF0aWMvMC4yLjMxIFwKLSAgICBjcmF0ZTovL2NyYXRlcy5pby9q
aWZmLXR6ZGIvMC4xLjYgXAorICAgIGNyYXRlOi8vY3JhdGVzLmlvL2ppZmYvMC4yLjMyIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9qaWZmLXN0YXRpYy8wLjIuMzIgXAorICAgIGNyYXRlOi8vY3Jh
dGVzLmlvL2ppZmYtdHpkYi8wLjEuOCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vamlmZi10emRi
LXBsYXRmb3JtLzAuMS4zIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9qb2JzZXJ2ZXIvMC4xLjM1
IFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9qcy1zeXMvMC4zLjkxIFwKQEAgLTEyMCw3ICsxMjAs
NyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL2x6bWEtc3lzLzAuMS4y
MCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWFpbHBhcnNlLzAuMTYuMSBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vbWF0Y2hlcnMvMC4yLjAgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL21lbWNo
ci8yLjguMiBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vbWVtY2hyLzIuOC4zIFwKICAgICBjcmF0
ZTovL2NyYXRlcy5pby9taW5pel9veGlkZS8wLjguOSBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8v
bWlvLzEuMi4wIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9tdW5nZS8wLjQuNyBcCkBAIC0xNTks
OCArMTU5LDggQEAgU1JDX1VSSSArPSAiIFwKICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWYtY2Fz
dC8xLjAuMjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZi1jYXN0LWltcGwvMS4wLjI1IFwK
ICAgICBjcmF0ZTovL2NyYXRlcy5pby9yZWZsaW5rLWNvcHkvMC4xLjMwIFwKLSAgICBjcmF0ZTov
L2NyYXRlcy5pby9yZWdleC8xLjEyLjQgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JlZ2V4LWF1
dG9tYXRhLzAuNC4xNCBcCisgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vcmVnZXgvMS4xMy4wIFwKKyAg
ICBjcmF0ZTovL2NyYXRlcy5pby9yZWdleC1hdXRvbWF0YS8wLjQuMTUgXAogICAgIGNyYXRlOi8v
Y3JhdGVzLmlvL3JlZ2V4LXN5bnRheC8wLjguMTEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Jl
bmQvMC41LjMgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3JreXYvMC44LjE3IFwKQEAgLTIzNSw3
ICsyMzUsNyBAQCBTUkNfVVJJICs9ICIgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3VybC8yLjUu
OCBcCiAgICAgY3JhdGU6Ly9jcmF0ZXMuaW8vdXRmOF9pdGVyLzEuMC40IFwKICAgICBjcmF0ZTov
L2NyYXRlcy5pby91dGY4cGFyc2UvMC4yLjIgXAotICAgIGNyYXRlOi8vY3JhdGVzLmlvL3V1aWQv
MS4yMy40IFwKKyAgICBjcmF0ZTovL2NyYXRlcy5pby91dWlkLzEuMjMuNSBcCiAgICAgY3JhdGU6
Ly9jcmF0ZXMuaW8vdmFsdWFibGUvMC4xLjEgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3ZlcnNp
b25fY2hlY2svMC45LjUgXAogICAgIGNyYXRlOi8vY3JhdGVzLmlvL3Z0ZS8wLjE0LjEgXApAQCAt
MzEzLDcgKzMxMyw3IEBAIFNSQ19VUklbYnN0ci0xLjEyLjEuc2hhMjU2c3VtXSA9ICI2MzA0NGUx
YWU4ZTY5ZjNiNWE5MmM3MzZjYTYyNjliOGQxMmZhN2VmZTM5YmYzCiBTUkNfVVJJW2J1bXBhbG8t
My4yMC4yLnNoYTI1NnN1bV0gPSAiNWQyMDc4OTg2OGY0YjAxYjJmMmNhZWM5ZjVjNGUwMjEzYjQx
ZTNlNTcwMmE1MDE1N2Q2OTlhZTMxY2VkMmZjYiIKIFNSQ19VUklbYnl0ZWNoZWNrLTAuOC4yLnNo
YTI1NnN1bV0gPSAiMGNhYTMzYTJjMGVkY2EwNDE5ZDE1YWM3MjNkZmYwM2YxOTU2Zjc5NzgzMjli
MWUzYjVmZGFhYWVkOWQzY2E4YiIKIFNSQ19VUklbYnl0ZWNoZWNrX2Rlcml2ZS0wLjguMi5zaGEy
NTZzdW1dID0gIjg5Mzg1ZTgyYjVkMTgyMWQyMjE5ZTBiMDk1ZWZhMmNjMWYyNDZjYmY5OTA4MGYz
YmU0NmExYTg1YzBkMzkyZDkiCi1TUkNfVVJJW2J5dGVzLTEuMTIuMC5zaGEyNTZzdW1dID0gIjhh
ZTNmNWQzMTU5MjQyNzA1MzAyMDdlMmE2ODM5NmMzY2M1NDdmNmRjYTNmYmRjYTMxN2NmYjFhNTFl
ZGI1OTMiCitTUkNfVVJJW2J5dGVzLTEuMTIuMS5zaGEyNTZzdW1dID0gImZjNjUyYTQ4YzM1MmFl
ZjNlYTNhZWQzMjA4MDUwMWNmM2VmNmVkNWRhNzg2MDJhMDIwYzk5MTc3NWIwYWZmMDQiCiBTUkNf
VVJJW2J6aXAyLTAuNS4yLnNoYTI1NnN1bV0gPSAiNDllY2ZiMjJkOTA2ZjgwMGQ0ZmU4MzNiNjI4
MmNmNGRjMWMyOThmNTA1N2NhMGI1NDQ1ZTVjMjA5NzM1Y2E0NyIKIFNSQ19VUklbYnppcDItc3lz
LTAuMS4xMysxLjAuOC5zaGEyNTZzdW1dID0gIjIyNWJmZjMzYjIxNDE4NzRmZTgwZDcxZTA3ZDZl
ZWM0Zjg1YzVjMjE2NDUzZGQ5NjM4ODI0MGY5NmUxYWNjMTQiCiBTUkNfVVJJW2NjLTEuMi41Ny5z
aGEyNTZzdW1dID0gIjdhMGRkMWNhMzg0OTMyZmYzNjQxYzg3MThhMDI3NjlmMTY5OGU3NTYzZGM2
OTc0ZmZkMDMzNDYxMTYzMTA0MjMiCkBAIC0zODgsOSArMzg4LDkgQEAgU1JDX1VSSVtpbnN0YS0x
LjQ4LjAuc2hhMjU2c3VtXSA9ICI4NmYwZjhmZWU4YzkyNjQxNWM1OGQ2YWU0M2EwODUyM2EyNmZh
Y2NiMjMyM2YKIFNSQ19VUklbaXNfdGVybWluYWxfcG9seWZpbGwtMS43MC4yLnNoYTI1NnN1bV0g
PSAiYTZjYjEzOGJiNzlhMTQ2YzFiZDQ2MDAwNTYyM2UxNDJlZjAxODFlM2QwMjE5Y2I0OTNlMDJm
N2QwOGEzNTY5NSIKIFNSQ19VUklbaXRlcnRvb2xzLTAuMTQuMC5zaGEyNTZzdW1dID0gIjJiMTky
Yzc4MjAzN2ZhZGQ5Y2ZhNzU1NDgzMTA0ODhhYWJkYmYzZDJkYTczODg1YjMxYmQwYWJkMDMzNTEy
ODUiCiBTUkNfVVJJW2l0b2EtMS4wLjE3LnNoYTI1NnN1bV0gPSAiOTJlY2M2NjE4MTgxZGVmMDQ1
NzM5MmNjZDBlZTUxMTk4ZTA2NWUwMTZkMWQ1MjdhN2FjMWI2ZGM3YzFmMDlkMiIKLVNSQ19VUklb
amlmZi0wLjIuMzEuc2hhMjU2c3VtXSA9ICJjY2ZlNjEyMWNiZTc1MGNmODFlZmEzNjJkODVjMGJk
ZTdlYTI5OGVjNDMwOTJkM2ExOTNiYWNhNTljZGJkNjM0IgotU1JDX1VSSVtqaWZmLXN0YXRpYy0w
LjIuMzEuc2hhMjU2c3VtXSA9ICJlMTY1ZTg5N2Y2NjJkNDI4ZjNjZDM4MjhhOTE5ZGJlMDY3YzJk
NDJiYjEwMzFlZWRlNzRlZjlkMjdlY2RlZGQyIgotU1JDX1VSSVtqaWZmLXR6ZGItMC4xLjYuc2hh
MjU2c3VtXSA9ICJjOTAwZWY4NDgyNmYxMzM4YTU1NzY5N2RjOGZjNjAxZGY5Y2E5YWY0YWMxMzdj
N2ZiNjFkNGM2ZjJkZmQzMDc2IgorU1JDX1VSSVtqaWZmLTAuMi4zMi5zaGEyNTZzdW1dID0gIjk2
MWQxNjM4MjY1MmJmZGQ4YzZmNjhiMjIzYjI2YThjOTNlMGQ0NzVjNjcyZjQxNDQxMWRiMzFjNmM1
YzkwMGUiCitTUkNfVVJJW2ppZmYtc3RhdGljLTAuMi4zMi5zaGEyNTZzdW1dID0gImQwODc5YmQz
OWRmOTljNGM1ZTJjNjYxNWNjYzAyNjM5MWE0MjNkZGUxMDUzMmM1NzNlNjA4NmViOTRhODAyY2Mi
CitTUkNfVVJJW2ppZmYtdHpkYi0wLjEuOC5zaGEyNTZzdW1dID0gIjE0MmJkMzk5MzJhZDIzMWYx
MDUxM2RmOWFiNjI2NjFmZWFkODcxOTg3MjE1MGI3YWQwMmEyZGY3OWY0ZTE0MWUiCiBTUkNfVVJJ
W2ppZmYtdHpkYi1wbGF0Zm9ybS0wLjEuMy5zaGEyNTZzdW1dID0gIjg3NWE1YTY5YWMyYmFiMWE4
OTE3MTFjZjVlY2NiZWMxY2UwMzQxZWE4MDU1NjBkY2Q5MGI3YTJlOTI1MTMyZTgiCiBTUkNfVVJJ
W2pvYnNlcnZlci0wLjEuMzUuc2hhMjU2c3VtXSA9ICIxYzAwYWNiZDI5ZWFiYWQ0YTIzOTJmYTBl
OTIxYzg3NDkzNGRiYmY0MTk0MzEyYWQyMGYwNGEwZWQ2N2EzY2IzIgogU1JDX1VSSVtqcy1zeXMt
MC4zLjkxLnNoYTI1NnN1bV0gPSAiYjQ5NzE1YjcwNzNmMzg1YmE0YmM1MjhlNTc0N2QwMmU2NmNi
MzljNjE0NmVmYjY2Yjc4MWYxMzFmMGZiMzk5YyIKQEAgLTQwNSw3ICs0MDUsNyBAQCBTUkNfVVJJ
W2xvZy0wLjQuMjkuc2hhMjU2c3VtXSA9ICI1ZTUwMzJlMjQwMTkwNDVjNzYyZDNjMGYyOGY1YjZi
OGJiZjM4NTYzYTY1OTA4MwogU1JDX1VSSVtsem1hLXN5cy0wLjEuMjAuc2hhMjU2c3VtXSA9ICI1
ZmRhMDRhYjM3NjRlNmNkZTc4Yjk5NzRlZWM0Zjc3OWFjYWJhN2M0ZTg0YjM2ZWNhM2NmNzdjNTgx
Yjg1ZDI3IgogU1JDX1VSSVttYWlscGFyc2UtMC4xNi4xLnNoYTI1NnN1bV0gPSAiNjA4MTlhOTdk
ZGNiODMxYTU2MTRlYjNiMDE3NGYzNjIwZTc5M2U5N2UwOTE5NWEzOTViZmE5NDhmZDY4ZWQyZiIK
IFNSQ19VUklbbWF0Y2hlcnMtMC4yLjAuc2hhMjU2c3VtXSA9ICJkMTUyNWEyYTI4YzdmNGZhMGZj
OThiYjkxYWU3NTVkMWUyZDE1MDUwNzllMDU1MzllMzViYzg3NmI1ZDY1YWU5IgotU1JDX1VSSVtt
ZW1jaHItMi44LjIuc2hhMjU2c3VtXSA9ICI4ODkwNDQzNGFiYzI5MDFmMTk3ZmU4Y2M1NWYwNDQ1
ZTdkZWQ5MjFkYmE1OTExZGFkMmUyYjM5YjQ4ZTY2M2M0IgorU1JDX1VSSVttZW1jaHItMi44LjMu
c2hhMjU2c3VtXSA9ICJjZjhiYWYxYzU1ZTYyZmZjYWNlN2E5ZjA2ZjRiZDljZDNmMGM0YmViMDIy
ZDNiMzY3MjU2YjkxYjg3NTEzZDk4IgogU1JDX1VSSVttaW5pel9veGlkZS0wLjguOS5zaGEyNTZz
dW1dID0gIjFmYTc2YTJjODZmNzA0YmRiMjIyZDY2OTY1ZmIzZDYzMjY5Y2UzODUxOGI4M2NiMDU3
NWZjYTg1NWViYjYzMTYiCiBTUkNfVVJJW21pby0xLjIuMC5zaGEyNTZzdW1dID0gIjUwYjdlNWIy
N2FhMDJhNzRiYWM4YzNmMjNmNDQ4ZjhkODdmZjExZjkyZDNhYWMxYTZlZDM2OWVlMDhjYzU2YzEi
CiBTUkNfVVJJW211bmdlLTAuNC43LnNoYTI1NnN1bV0gPSAiNWUxNzQwMWYyNTllYmE5NTZjYTE2
NDkxNDYxYjZlOGY3MjkxM2EwYTExNGUzOTczNmNlNDA0NDEwZjkxNWEwYyIKQEAgLTQ0NCw4ICs0
NDQsOCBAQCBTUkNfVVJJW3JlZG94X3N5c2NhbGwtMC41LjE1LnNoYTI1NnN1bV0gPSAiN2U4YWYw
ZGRlMDk0MDA2MDExZTZhNzQwZDQ4NzkzMTk0Mzk0OAogU1JDX1VSSVtyZWYtY2FzdC0xLjAuMjUu
c2hhMjU2c3VtXSA9ICJmMzU0MzAwYWU2NmY3NmYxYzg1YzVmODQ2OTNmMGNlODFkNzQ3ZTJjM2Yy
MWE0NWZlZjQ5NmQ4OWM5NjBiZjdkIgogU1JDX1VSSVtyZWYtY2FzdC1pbXBsLTEuMC4yNS5zaGEy
NTZzdW1dID0gImI3MTg2MDA2ZGNiMjE5MjA5OTAwOTNmMzBlM2RlYTYzYjdkNmU5NzdiZjEyNTZi
ZTIwYzM1NjNhNWRiMDcwZGEiCiBTUkNfVVJJW3JlZmxpbmstY29weS0wLjEuMzAuc2hhMjU2c3Vt
XSA9ICJkOWRkN2FiNGFmMDM2M2Q1Y2NmZDI4MzhkNzgyYTI4MTk2Y2YzMmE1Y2MyZTRmZTNjNWRj
ODNmMmJlNTg4YjhiIgotU1JDX1VSSVtyZWdleC0xLjEyLjQuc2hhMjU2c3VtXSA9ICJmMTI5MmI3
NzU5YWUxY2I5ZWMxOTU0NTJkMTM5MGEwNzRmMGNkODU0MWFiN2E1YThjMzFjZDZkYjQ1ZDRhNmJh
IgotU1JDX1VSSVtyZWdleC1hdXRvbWF0YS0wLjQuMTQuc2hhMjU2c3VtXSA9ICI2ZTFkZDQxMjJm
YzE1OTVlODE2MjYxODk0NTQ3Njg5MmVlZmNhN2I4OGM1MjgyMGU3NGFmNjI2MjIxM2NhZThmIgor
U1JDX1VSSVtyZWdleC0xLjEzLjAuc2hhMjU2c3VtXSA9ICIyYTBlNzUxMTNlMTRkYzVhY2IwNjhj
ZDA3ODY4ODRmMjE0ZjEzMTI2NTBhM2QzNmQyNjlmNWM0ZjNjZGVlOGEyIgorU1JDX1VSSVtyZWdl
eC1hdXRvbWF0YS0wLjQuMTUuc2hhMjU2c3VtXSA9ICIxZjM4ODIwMmU0YjgwNTQyYTA5MjEwNzhj
YzIzYjYzMzNiY2YxNDA5YzFlM2Y4NjQwNGNhZTQ3NjZhNjEzMWRiIgogU1JDX1VSSVtyZWdleC1z
eW50YXgtMC44LjExLnNoYTI1NnN1bV0gPSAiZDZmNmZmOWEzNzg0ODViMjk4YTUyODY2NTZkYTY2
NWJhNzQ0MTNkMzZkYjA5Nzk2MzMyNzVkMmU3MDgxNDVkNCIKIFNSQ19VUklbcmVuZC0wLjUuMy5z
aGEyNTZzdW1dID0gImNhZGFkZWYzMTdjMmYyMDc1NWE2NGQ3ZmRjNDhmOWU3MTc4ZWU2YjBlMWY3
ZmNlMzNmYTYwZjFkNjhhMjc2ZTYiCiBTUkNfVVJJW3JreXYtMC44LjE3LnNoYTI1NnN1bV0gPSAi
ODE1Y2M4YTM3MTU5YTQ2MzA2NDgyNTI0NmNhZGIwNzk2MWUyNWNkOTg4NTkwODYwNmY2ZDA4YTk4
ZDhmODg3NCIKQEAgLTUyMCw3ICs1MjAsNyBAQCBTUkNfVVJJW3Vuc2Nhbm55LTAuMS4wLnNoYTI1
NnN1bV0gPSAiZTlkZjJhZjA2N2E3OTUzZTljMzgzMTMyMGYzNWMxY2MwNjAwYzMwZDQ0ZAogU1JD
X1VSSVt1cmwtMi41Ljguc2hhMjU2c3VtXSA9ICJmZjY3YThhNDM5NzM3M2MzZWY2NjA4MTJhY2Fi
MzI2ODIyMjAzNTAxMGFiODY4MGVjNDIxNWYzOGJhM2QwZWVkIgogU1JDX1VSSVt1dGY4X2l0ZXIt
MS4wLjQuc2hhMjU2c3VtXSA9ICJiNmMxNDA2MjBlN2ZmYmIyMmMyZGVlNTljYWZlNjA4NGE1OWI1
ZmZjMjdhODg1OWE1ZjBkNDk0YjVkNTJiNmJlIgogU1JDX1VSSVt1dGY4cGFyc2UtMC4yLjIuc2hh
MjU2c3VtXSA9ICIwNmFiZGUzNjExNjU3YWRmNjZkMzgzZjAwYjA5M2Q3ZmFlY2M3ZmE1NzA3MWNj
ZTI1Nzg2NjBjOWYxMDEwODIxIgotU1JDX1VSSVt1dWlkLTEuMjMuNC5zaGEyNTZzdW1dID0gImJm
ODBhNzI4NDUyNzVhZmVhOTllN2YyYjQzNDcyM2QzYmM3ZTM4NDcwZmNkMWM3ZWQzOWE1OTljNzMz
MTlhNTMiCitTUkNfVVJJW3V1aWQtMS4yMy41LnNoYTI1NnN1bV0gPSAiZWE1ZmFiMGQ2YzNjMDFh
ZTcwMDg1YTA5Y2IwM2Q0YzdhMWQ2MzE0ZTJiM2UwNzUzOTI3ODMzOTZkNzI0Y2EwYSIKIFNSQ19V
UklbdmFsdWFibGUtMC4xLjEuc2hhMjU2c3VtXSA9ICJiYTczZWE5Y2YxNmEyNWRmMGM4Y2FhMTZj
NTFhY2I5MzdkNTcxMmE4NDI5ZGI3OGEzZWUyOWQ1ZGNhY2QzYTY1IgogU1JDX1VSSVt2ZXJzaW9u
X2NoZWNrLTAuOS41LnNoYTI1NnN1bV0gPSAiMGI5MjhmMzNkOTc1ZmM2YWQ5Zjg2YzhmMjgzODUz
YWQyNmJkZDViMTBiN2YxNTQyYWEyZmExNWUyMjg5MTA1YSIKIFNSQ19VUklbdnRlLTAuMTQuMS5z
aGEyNTZzdW1dID0gIjIzMWZkY2Q3ZWYzMDM3ZTgzMzBkOGUxN2U2MTAxMWEyYzI0NDEyNmFjYzBh
OTgyZjQwNDBhYzNmOWYwYmMwNzciCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4xMS4yOS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy11di1idWlsZF8wLjExLjMxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTIl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy11di1idWls
ZF8wLjExLjI5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtdXYtYnVpbGRfMC4xMS4zMS5iYgppbmRleCAyMDJlN2YxODM0Li5hNmE1ZTc1MDZkIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVpbGRfMC4x
MS4yOS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtdXYtYnVp
bGRfMC4xMS4zMS5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFLUFQQUNIRTttZDU9ODZkM2YzYTk1YzMyNGM5NDc5YmQ4OTg2OTY4ZjQzMjcgXAog
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUFwYWNo
ZTttZDU9ZTIzZmFkZDZjZWVmOGM2MThmYzFjNjUxOTFkODQ2ZmEgXAogICAgICAgICAgICAgICAg
ICAgICBmaWxlOi8vY3JhdGVzL3V2LXBlcDUwOC9MaWNlbnNlLUJTRDttZDU9ZWY3YTYwMjdkYzRj
MjM4OWI5YWZhZDdlNjkwMjc0YzciCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3ZGQxNmQ1MDM2
NmY0MTBhZTQ5NGEyN2JlMjBiNDUyMDZmZWVhYzM3ZDk5ZGM1M2FiZmExYTA0NDEwMDY5Yjc4Igor
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjVhMGM5NDY4MWMxZDg2OWRiMjA5MjQyZjEwZTMzZGYxNGYx
MTZlZTI4Njc3YTViZTk2MTBjM2YzMDc2NDVmZmUiCiAKIHJlcXVpcmUgJHtCUE59LWNyYXRlcy5p
bmMKIAotLSAKMi40Ny4xCgo=

--===============4387462532588677620==--

