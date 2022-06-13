Return-Path: <Sebastian.Suesens@baslerweb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB16EC43334
	for <webhook@archiver.kernel.org>; Mon, 13 Jun 2022 12:40:06 +0000 (UTC)
Subject: Subject: [PATCH 1/3] [PATCH] [master] weston.py: added xwayland test
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?U8O8c2VucywgU2ViYXN0aWFu?= <Sebastian.Suesens@baslerweb.com>
X-Originating-Location: Ahrensbok, Schleswig-Holstein, DE (84.140.242.110)
X-Originating-Platform: Linux Chrome 101
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 13 Jun 2022 05:40:01 -0700
Message-ID: <AGlB.1655124001881764456.MSf8@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="RtY8CarNbXDPRvSAKiDn"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jun 2022 12:40:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166839

--RtY8CarNbXDPRvSAKiDn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Test xwayland support if DISTRO_FEATURE X11 is enabled

Test checked if xserver listening on display

Signed-off-by: ssuesens <sebastian.suesens@baslerweb.com>
---
meta/lib/oeqa/runtime/cases/weston.py | 8 ++++++++
1 file changed, 8 insertions(+)

diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/runtime/=
cases/weston.py
index b81cc299ef..1fd471e611 100644
--- a/meta/lib/oeqa/runtime/cases/weston.py
+++ b/meta/lib/oeqa/runtime/cases/weston.py
@@ -77,3 +77,11 @@ class WestonTest(OERuntimeTestCase):
self.target.run('kill -9 %s' % w)
__, weston_log =3D self.target.run('cat %s' % self.weston_log_file)
self.assertTrue(new_wl_processes, msg=3D'Could not get new weston-desktop-s=
hell processes (%s, try_cnt:%s) weston log: %s' % (new_wl_processes, try_cn=
t, weston_log))
+
+=C2=A0 =C2=A0 @skipIfNotFeature('x11', 'Test requires x11 to be in DISTRO_=
FEATURES')
+=C2=A0 =C2=A0 @OEHasPackage(['weston'])
+=C2=A0 =C2=A0 def test_weston_supports_xwayland(self):
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D'cat %s | grep "xserver listening on di=
splay"' % self.weston_log_file
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.target.run(cmd)
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D ('xwayland does not appear to be runni=
ng')
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertEqual(status, 0, msg=3Dmsg)
--
2.25.1

--RtY8CarNbXDPRvSAKiDn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Test xwayland support if DISTRO_FEATURE X11 is enabled</div>
<div>&nbsp;</div>
<div>Test checked if xserver listening on display</div>
<div>&nbsp;</div>
<div>Signed-off-by: ssuesens &lt;sebastian.suesens@baslerweb.com&gt;</div>
<div>---</div>
<div>&nbsp;meta/lib/oeqa/runtime/cases/weston.py | 8 ++++++++</div>
<div>&nbsp;1 file changed, 8 insertions(+)</div>
<div>&nbsp;</div>
<div>diff --git a/meta/lib/oeqa/runtime/cases/weston.py b/meta/lib/oeqa/run=
time/cases/weston.py</div>
<div>index b81cc299ef..1fd471e611 100644</div>
<div>--- a/meta/lib/oeqa/runtime/cases/weston.py</div>
<div>+++ b/meta/lib/oeqa/runtime/cases/weston.py</div>
<div>@@ -77,3 +77,11 @@ class WestonTest(OERuntimeTestCase):</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.tar=
get.run('kill -9 %s' % w)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;__, weston_log =3D self.target.run('=
cat %s' % self.weston_log_file)</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;self.assertTrue(new_wl_processes, ms=
g=3D'Could not get new weston-desktop-shell processes (%s, try_cnt:%s) west=
on log: %s' % (new_wl_processes, try_cnt, weston_log))</div>
<div>+</div>
<div>+&nbsp; &nbsp; @skipIfNotFeature('x11', 'Test requires x11 to be in DI=
STRO_FEATURES')</div>
<div>+&nbsp; &nbsp; @OEHasPackage(['weston'])</div>
<div>+&nbsp; &nbsp; def test_weston_supports_xwayland(self):</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; cmd =3D'cat %s | grep "xserver listening =
on display"' % self.weston_log_file</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; status, output =3D self.target.run(cmd)</=
div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; msg =3D ('xwayland does not appear to be =
running')</div>
<div>+&nbsp; &nbsp; &nbsp; &nbsp; self.assertEqual(status, 0, msg=3Dmsg)</d=
iv>
<div>--&nbsp;</div>
<div>2.25.1</div>
</div>
<div>&nbsp;</div>

--RtY8CarNbXDPRvSAKiDn--

