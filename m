Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84A8BC433EF
	for <webhook@archiver.kernel.org>; Wed, 13 Oct 2021 07:39:12 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.4988.1634110750765417602
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 00:39:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=pVkGYiDb;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634110748; i=@fujitsu.com;
	bh=Wul/5iBWT6hCjm5s+NQCD3+SgFoqCL0FPQgQI3kQk7w=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=pVkGYiDbCCEfzm7TCmm/VKbgPSynh7sHiepYslVVKOTq4wDJYHEXnOLBTNtLe0Csc
	 OC4CTyAWUMfGQKQ9UxfdC0195CljCfka41mCYYr7+5s2y9pv0nmSG6QqZG1286CjJD
	 4y34DoMLc7v9ncuEJmeigLIrgrR0LN94AgC2HmflCh7Z2cLv/jQlbCA1b9U3gVRwyS
	 9vMHHo+P5uNie9Ki2gkRdJvwk5ffzzL+g0OmItfqBlr4dnyK7e6cHdHvyJoR3WcrQD
	 EXiqY0MKEfmALNIzj/Kzo9mPY25KA6G4cvAFrfAiJ3BFhsd+iZzjydAB7bd0MbXuf1
	 I/vVTr+pZmPfw==
Received: from [100.113.3.182] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-central-1.aws.symcld.net id 44/A7-29929-C1D86616;
 Wed, 13 Oct 2021 07:39:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSVemNy3
  RYONXTos7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPXvxamgnMiFZtP7GFpYHwr2MXIxSEk8JhR
  YmH/SUYI5zyTRN/tyUxdjJxAzglGiQmfxUFsNgE1iem3brB2MXJwiAjoSVz9JwoSZhZQkXjxu
  4cdxBYWsJPY3/yREcRmEVCVuN+0mhnE5hVwlvh1YTsriC0hoCAx5eF7qLigxMmZT1gg5qhKdB
  95ygRhy0s0b53NDFGvKDH7cjMLhF0hMWtWGxOErSZx9dwm5gmMArOQjJqFZNQsJKMWMDKvYrR
  MKspMzyjJTczM0TU0MNA1NDTWNdQ1MjDXS6zSTdRLLdVNTs0rKUoEyuollhfrFVfmJuek6OWl
  lmxiBAZwSiHj+R2MU9980DvEKMnBpCTKW9aZlijEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgvdOB
  1BOsCg1PbUiLTMHGE0waQkOHiUR3kk9QGne4oLE3OLMdIjUKUZFKXFeNpCEAEgiozQPrg0WwZ
  cYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfM+7waawpOZVwI3/RXQYiagxYFRKSCLSxIRUlI
  NTLU7r036V5g3OfjYW5kzYsfr89LVyxwfKV+N+Dz3efnc6ze26onm3Cz2Py3c+b/6qPhVH7Hg
  q9s1FHc55CifjFS1lptd8M7g+8lO4VM5twQe1u9g3bY1UGTm6V4Rk9hDFfdkWGSj1u5+73xxX
  d7bqOvBKrOKjl28o7r9pFnyxLvveh9438nw+zTdZLlc3UO78JANG6Q1T0YUusy8KrdEfkfk/o
  VXz1yPYrfLqDu9R6BfFhjBMveqrE6niD0POp/+8sbzFo8pZsU52/anhTU9jFSwW8oaKdMaO/v
  aYqWj0jPPvj914ZLoJm716U+jGjdGVP24ElUXdjeWUd/h6OyPB83zvxTWWe6cpHzo/tyFHkos
  xRmJhlrMRcWJAMXvG9JbAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-232.messagelabs.com!1634110747!2260531!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32703 invoked from network); 13 Oct 2021 07:39:08 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-22.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Oct 2021 07:39:08 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 7EABB1009BD
	for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:39:07 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 4CAF51009B2
	for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 08:39:07 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 13 Oct 2021 08:39:00 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-pip: upgrade 21.2.4 -> 21.3
Date: Wed, 13 Oct 2021 15:38:49 +0800
Message-ID: <1634110729-113967-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Oct 2021 07:39:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156891

Features
Replace vendored appdirs with platformdirs. (#10202)

Support PEP 610 to detect editable installs in pip freeze and pip list.
The pip list column output has a new Editable project location column,
and the JSON output has a new editable_project_location field. (#10249)

pip freeze will now always fallback to reporting the editable project
location when it encounters a VCS error while analyzing an editable requirement.
Before, it sometimes reported the requirement as non-editable. (#10410)

pip show now sorts Requires and Required-By alphabetically. (#10422)

Do not raise error when there are no files to remove with pip cache purge/remove.
Instead log a warning and continue (to log that we removed 0 files). (#10459)

When backtracking during dependency resolution, prefer the dependencies which
are involved in the most recent conflict. This can significantly reduce the
amount of backtracking required. (#10479)

Cache requirement objects, to improve performance reducing reparses of
requirement strings. (#10550)

Support editable installs for projects that have a pyproject.toml and
use a build backend that supports PEP 660. (#8212)

When a revision is specified in a Git URL, use git=E2=80=99s partial clone
feature to speed up source retrieval. (#9086)

Add a --debug flag, to enable a mode that doesn=E2=80=99t log errors and
propagates them to the top level instead. This is primarily to aid with
1debugging pip=E2=80=99s crashes. (#9349)

If a host is explicitly specified as trusted by the user
(via the --trusted-host option), cache HTTP responses from it in addition
to HTTPS ones. (#9498)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pip_21.2.4.bb =3D> python3-pip_21.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pip_21.2.4.bb =3D> python3-pip_21.3.bb} (89%)

diff --git a/meta/recipes-devtools/python/python3-pip_21.2.4.bb b/meta/recipes-devtools/python/python3-pip_21.3.bb
similarity index 89%
rename from meta/recipes-devtools/python/python3-pip_21.2.4.bb
rename to meta/recipes-devtools/python/python3-pip_21.3.bb
index 1f0f707f4b..924a564f62 100644
--- a/meta/recipes-devtools/python/python3-pip_21.2.4.bb
+++ b/meta/recipes-devtools/python/python3-pip_21.3.bb
@@ -10,7 +10,7 @@ inherit pypi distutils3
 
 SRC_URI +=3D "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] =3D "0eb8a1516c3d138ae8689c0c1a60fde7143310832f9dc77e11d8a4bc62de193b"
+SRC_URI[sha256sum] =3D "741a61baab1dbce2d8ca415effa48a2b6a964564f81a9f4f1fce4c433346c034"
 
 do_install:append() {
     # Install as pip3 and leave pip2 as default
-- 
2.25.1


