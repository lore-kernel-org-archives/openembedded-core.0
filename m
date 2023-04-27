Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3473C77B73
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 08:26:31 +0000 (UTC)
Subject: [PATCH V1] e2fsprogs: fix ptest bug for second running
To: openembedded-core@lists.openembedded.org
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
X-Originating-Location: CN (223.111.68.150)
X-Originating-Platform: Windows Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 27 Apr 2023 01:26:26 -0700
Message-ID: <72Qn.1682583986150981484.FBVe@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ofAZALZb67SiOaJvA47b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 08:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180487

--ofAZALZb67SiOaJvA47b
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

From db4b5e31703e4143450b1e7239b2502a89ed042a Mon Sep 17 00:00:00 2001
From: Qiu Tingting <qiutt@fujitsu.com>
Date: Thu, 27 Apr 2023 15:29:14 +0800
Subject: [PATCH V1] e2fsprogs: fix ptest bug for second running

At second running, there are four new failed case:
d_loaddump f_bigalloc_badinode f_bigalloc_orphan_list f_dup_resize

The test_data.tmp is necessary, but it is deleted by run-ptest.
So it should be restored after testing.

Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
---
meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 1 +
meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 3 +++
2 files changed, 4 insertions(+)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/rec=
ipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index c97c0377e9..279923db8e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -8,3 +8,4 @@ rm -f *.tmp
rm -f *.ok
rm -f *.failed
rm -f *.log
+cp ../data/test_data.tmp ./
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/meta/rec=
ipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
index a2eb4f8f8f..87e13d744b 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
@@ -143,4 +143,7 @@ do_install_ptest() {

install -d ${D}${PTEST_PATH}/lib
install -m 0644 ${B}/lib/config.h=C2=A0 ${D}${PTEST_PATH}/lib/
+
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${PTEST_PATH}/data
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${B}/tests/test_data.tmp ${D}$=
{PTEST_PATH}/data/
}
--
2.25.1

--ofAZALZb67SiOaJvA47b
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>From db4b5e31703e4143450b1e7239b2502a89ed042a Mon Sep 17 00:00:00 2001=
</div>
<div>From: Qiu Tingting &lt;qiutt@fujitsu.com&gt;</div>
<div>Date: Thu, 27 Apr 2023 15:29:14 +0800</div>
<div>Subject: [PATCH V1] e2fsprogs: fix ptest bug for second running</div>
<div>&nbsp;</div>
<div>At second running, there are four new failed case:</div>
<div>&nbsp; d_loaddump f_bigalloc_badinode f_bigalloc_orphan_list f_dup_res=
ize</div>
<div>&nbsp;</div>
<div>The test_data.tmp is necessary, but it is deleted by run-ptest.</div>
<div>So it should be restored after testing.</div>
<div>&nbsp;</div>
<div>Signed-off-by: Qiu Tingting &lt;qiutt@fujitsu.com&gt;</div>
<div>---</div>
<div>&nbsp;meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest | 1 +</div>
<div>&nbsp;meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb | 3 +++</div=
>
<div>&nbsp;2 files changed, 4 insertions(+)</div>
<div>&nbsp;</div>
<div>diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/met=
a/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest</div>
<div>index c97c0377e9..279923db8e 100644</div>
<div>--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest</div>
<div>+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest</div>
<div>@@ -8,3 +8,4 @@ rm -f *.tmp</div>
<div>&nbsp;rm -f *.ok</div>
<div>&nbsp;rm -f *.failed</div>
<div>&nbsp;rm -f *.log</div>
<div>+cp ../data/test_data.tmp ./</div>
<div>diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb b/met=
a/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb</div>
<div>index a2eb4f8f8f..87e13d744b 100644</div>
<div>--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb</div>
<div>+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb</div>
<div>@@ -143,4 +143,7 @@ do_install_ptest() {</div>
<div>&nbsp;</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -d ${D}${PTEST_PATH}/lib</di=
v>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;install -m 0644 ${B}/lib/config.h&nb=
sp; ${D}${PTEST_PATH}/lib/</div>
<div>+</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; install -d ${D}${PTEST_PATH}/data</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; install -m 0644 ${B}/tests/test_data.tmp =
${D}${PTEST_PATH}/data/</div>
<div>&nbsp;}</div>
<div>--</div>
<div>2.25.1</div>
<div>&nbsp;</div>

--ofAZALZb67SiOaJvA47b--

