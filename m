Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11518CD129C
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:24 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2367.1762384582598409796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3hnvHij5;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=eYknTASZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019a564e94e6-75fc589b-5183-41de-8d26-08aa733fb789-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384582;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PxL+cG2qLgR6Z4gitV1tV9pzajqYHm/luNGrJvn6bwk=;
	b=3hnvHij5DEMHXjfr7FbF3/BBaVR5+zTbFvekozfKCuLcK0aVKAfiew3wHcLI9Y/Q
	QUaPmtBbxq7A9auP7jrTOQIFNLGyh837cRsF3p/1/TZnJITdbC2Thap6vIUGSnWkLVy
	QXR6Ul3q5OL8sA4xk/cK8jkebcfMZO75/EHjb9Sc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384582;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PxL+cG2qLgR6Z4gitV1tV9pzajqYHm/luNGrJvn6bwk=;
	b=eYknTASZ6xof/k2IHQcCKWP842mcqy5NLLVGa3Z0COl5pP19Etn7XQWZI7PvxeBc
	dYIemzkcunecgnt0eSSfKL5qnYwVAXgsUhEugzcspCPaNmr3/A0gKrSjAb3tlhhX/at
	brjSDiYzfWT31BEVt6swKtvSUgx9ZKW8borgG2Ag=
Content-Type: multipart/mixed; boundary="===============4094656342714916917=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.22.5 SUCCEEDED
Message-ID: <0101019a564e94e6-75fc589b-5183-41de-8d26-08aa733fb789-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:21 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225824

--===============4094656342714916917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-beartype* to *0.22.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-beartype-upgrade-0.21.0-0.22.5.patch
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
From afb1357645dba003eb533d8c3cc69ed8ae02c34d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 16:39:52 +0000
Subject: [PATCH] python3-beartype: upgrade 0.21.0 -> 0.22.5

---
 .../{python3-beartype_0.21.0.bb => python3-beartype_0.22.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.21.0.bb => python3-beartype_0.22.5.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.21.0.bb b/meta/recipes-devtools/python/python3-beartype_0.22.5.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-beartype_0.21.0.bb
rename to meta/recipes-devtools/python/python3-beartype_0.22.5.bb
index 43427c1472..389df818bf 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.21.0.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.22.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5bc05a109d235912da97a053cd7a58"
 
-SRC_URI[sha256sum] = "f9a5078f5ce87261c2d22851d19b050b64f6a805439e8793aecf01ce660d3244"
+SRC_URI[sha256sum] = "516a9096cc77103c96153474fa35c3ebcd9d36bd2ec8d0e3a43307ced0fa6341"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============4094656342714916917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype: PKGSIZE changed from 6108141 to 6840819 (+12%)
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__, directory renamed /usr/lib/python3.13/site-packages/beartype/_util/kind/map -> /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike, directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind -> /usr/lib/python3.13/site-packages/beartype/bite/kind, directory renamed /usr/lib/python3.13/site-packages/beartype/_decor/wrap -> /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap, directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection -> /usr/lib/python3.13/site-packages/beartype/bite/collection, directory renamed /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__, direc
 tory renamed /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/beartype-0.22.5.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info -> /usr/lib/python3.13/site-packages/beartype-0.22.5.dist-info, directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/bite/kind/__pycache__, directory renamed /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__, removed "/usr/lib/python3.13/site-packages/beartype/door/_func/infer/inferhint.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redhint.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsignmap.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep526.cpython-313.pyc /usr/lib/python3.13/site-packag
 es/beartype/_data/hint/__pycache__/datahinttyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodpy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/datamodthirdparty.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsigncls.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484typevar.py /usr/lib/python3.13/site-packages/beartype/_check/convert/convsanify.py /usr/lib/python3.13/site-packages/beartype/claw/_package/__pycache__/clawpkghook.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemake.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodtyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/ast/__init__.py /usr/lib/pyth
 on3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/datapeprepr.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__init__.py /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__pycache__/inferhint.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsignset.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/external/datamodthirdparty.py /usr/lib/python3.13/site-packages/beartype/claw/_importlib/clawimppath.py /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convsanify.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_clawmagic.py /usr/lib/python3.13/site-pack
 ages/beartype/_data/hint/pep/sign/datapepsignset.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodpy.py /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintpep.py /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsigns.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_importlib/__pycache__/clawimppath.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/decor/datadecornontype.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodtyping.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsigns.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep695.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__pycache__/datapeprepr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__init__.py /usr
 /lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsignmap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsigncls.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintpep.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/ast/dataast.py /usr/lib/python3.13/site-packages/beartype/_check/checkcache.py /usr/lib/python3.13/site-packages/beartype/claw/_package/clawpkghook.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/api/utilbeartype.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585tuple.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/__pycache__/checkcache.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/
 _func/infer/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodcontextlib.py /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__/dataast.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodcontextlib.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/clawastpep526.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/clawastpep695.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redhint.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilbeartype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/codemake.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585tuple.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__init__.py /usr/lib/python3.13/site-packages/beartype/claw/__pycache__/_clawmagic.cpython-313.pyc /usr/l
 ib/python3.13/site-packages/beartype/_data/decor/__pycache__/datadecornontype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/decor/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/hint/datahinttyping.py", added "/usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__/modpep328.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep649.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep560.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep696.cpython-313.pyc 
 /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep749.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/path/utilpathcopy.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsigns.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/datatypingport.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsigncls.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsignmap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsignset.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/utilsetchain.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/dataast.py /usr/lib/python3.13/site-packages/beartype/bite/_infermain.py /usr/lib/pyt
 hon3.13/site-packages/beartype/_conf/decorplace/confplacetrie.py /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__init__.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastmodule.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/bear/utilbearfunc.py /usr/lib/python3.13/site-packages/beartype/_check/pep/checkpep484typevar.py /usr/lib/python3.13/site-packages/beartype/claw/_importlib/__pycache__/clawimpmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/conf/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep646.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep692.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/module/pep/modpep328.py /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintrepr.py /usr/lib/python
 3.13/site-packages/beartype/_conf/decorplace/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/path/__pycache__/utilpathcopy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/codemain.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscope.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datapy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/external/utiljaxtyping.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_decornontypemap.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscopebefore.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utiljaxtyping.cpython-313.pyc /usr/lib/python3.13/site-packages/b
 eartype/_check/convert/__pycache__/convmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/clawastpep695.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep484612646.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/datatyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep646.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep692.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datacontextlib.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/confplacetrie.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/dataast.cpython-313.pyc /usr/lib/python3.13/site-packages/beart
 ype/claw/_ast/_pep/__pycache__/clawastpep695.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/__pycache__/utilcacheclear.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datatyping.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/_decornontypemap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_package/__pycache__/clawpkgmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscopebefore.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/utilbearblack.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/claw/__pycache__/dataclawmagic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsigns.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datatyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/bear/utilbearblack.py /usr/lib/pytho
 n3.13/site-packages/beartype/claw/_package/clawpkgmain.py /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/claw/dataclawmagic.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastassign.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastimport.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastmodule.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsignmap.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/datatypingport.py /usr/lib/python3.13/site-packages/beartype/_data/typing/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/utilbearfunc.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/bear/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/dataco
 nfblack.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/dataconfplace.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datapy.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscopes.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastassign.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintrepr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__init__.py /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/confplaceenum.py /usr/lib/python3.13/site-packages/beartype/_data/conf/dataconfplace.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscopes.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/bite/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redmain.py 
 /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep560.py /usr/lib/python3.13/site-packages/beartype/claw/_importlib/clawimpmain.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datacontextlib.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/convmain.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585646.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep696.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep649.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep749.py /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/confplaceenum.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastimport.cpy
 thon-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/utilcacheobjattr.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsigncls.py /usr/lib/python3.13/site-packages/beartype/_data/conf/dataconfblack.py /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__/checkpep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsignset.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscope.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/datatyping.py /usr/lib/python3.13/site-packages/beartype/bite/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484585646.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/bite/__pycache__/_infermain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/utilcacheclear.py /usr/lib/python3.13/site-packages/beartype/_util/kind/set
 like/__pycache__/utilsetchain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__init__.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep484612646.py /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/__pycache__/utilcacheobjattr.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info moved to /usr/lib/python3.13/site-packages/beartype-0.22.5.dist-info
  /usr/lib/python3.13/site-packages/beartype/bite was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/infercollectionbuiltin.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/infercollectionitems.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/infercollectionsabc.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__/infercollectionbuiltin.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__/infercollectionitems.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__/infercollectionsabc.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/_infermain.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/infercallable.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/inferthirdparty.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/__pycache__/infercallable.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/__pycache__/inferthirdparty.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/bite/__pycache__/_infermain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/codemain.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/convmain.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep484612646.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep646.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep692.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep484612646.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep646.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep692.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redmain.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/checkpep484typevar.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__/checkpep484typevar.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastassign.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastimport.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastmodule.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastassign.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastimport.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastmodule.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/clawastpep695.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__pycache__/clawastpep695.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscopebefore.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscope.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscopes.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscopebefore.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscope.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscopes.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_importlib/clawimpmain.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_importlib/__pycache__/clawimpmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_package/clawpkgmain.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_package/__pycache__/clawpkgmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/confplaceenum.py was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/confplacetrie.py was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/confplaceenum.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/confplacetrie.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/dataast.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datacontextlib.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datapy.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datatyping.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/dataast.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datacontextlib.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datapy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datatyping.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/claw was added
  /usr/lib/python3.13/site-packages/beartype/_data/claw/dataclawmagic.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/claw/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/claw/__pycache__/dataclawmagic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/dataconfblack.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/dataconfplace.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/dataconfblack.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/dataconfplace.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintrepr.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintrepr.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsigncls.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsignmap.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsignset.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsigns.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsigncls.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsignmap.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsigns.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsignset.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/datatypingport.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/datatyping.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/datatyping.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/datatypingport.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_decornontypemap.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/_decornontypemap.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wrapargs.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/wrapmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wrapreturn.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/wrapsnip.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wraputil.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wrapargs.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/wrapmain.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wrapreturn.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/wrapsnip.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wraputil.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utiljaxtyping.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/utiljaxtyping.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/utilbearblack.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/utilbearfunc.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/utilbearblack.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/utilbearfunc.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/cache/__pycache__/utilcacheclear.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/cache/__pycache__/utilcacheobjattr.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/cache/utilcacheclear.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/cache/utilcacheobjattr.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585646.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep560.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep649.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep696.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep749.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484585646.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep560.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep649.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep696.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep749.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__/utilmapfrozen.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__/utilmapset.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__/utilmaptest.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/utilmapfrozen.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/utilmapset.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/utilmaptest.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__pycache__/utilsetchain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/utilsetchain.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/module/pep was added
  /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/module/pep/modpep328.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__/modpep328.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/path/__pycache__/utilpathcopy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/path/utilpathcopy.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/checkcache.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/code/codemake.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemake.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/convsanify.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convsanify.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484typevar.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484typevar.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redhint.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redhint.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/__pycache__/checkcache.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/clawastpep526.py was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/clawastpep695.py was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep526.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep695.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_clawmagic.py was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_importlib/clawimppath.py was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_importlib/__pycache__/clawimppath.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_package/clawpkghook.py was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_package/__pycache__/clawpkghook.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/claw/__pycache__/_clawmagic.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/datamodthirdparty.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/datamodthirdparty.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodcontextlib.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodpy.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodtyping.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodcontextlib.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodpy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodtyping.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/ast was removed
  /usr/lib/python3.13/site-packages/beartype/_data/ast/dataast.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/ast/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__/dataast.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/decor was removed
  /usr/lib/python3.13/site-packages/beartype/_data/decor/datadecornontype.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/datadecornontype.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintpep.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/datahinttyping.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/datapeprepr.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__pycache__/datapeprepr.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsigncls.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsignmap.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsignset.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsigns.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsigncls.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsignmap.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsigns.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsignset.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintpep.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahinttyping.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/_wrapargs.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/wrapmain.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/_wrapreturn.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/wrapsnip.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/_wraputil.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/_wrapargs.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/wrapmain.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/_wrapreturn.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/wrapsnip.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/_wraputil.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/infercollectionbuiltin.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/infercollectionitems.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/infercollectionsabc.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__/infercollectionbuiltin.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__/infercollectionitems.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__/infercollectionsabc.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/inferhint.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/infercallable.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/inferthirdparty.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__pycache__/infercallable.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__pycache__/inferthirdparty.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__pycache__/inferhint.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilbeartype.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilbeartype.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585tuple.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585tuple.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__/utilmapfrozen.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__/utilmapset.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__/utilmaptest.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/utilmapfrozen.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/utilmapset.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/utilmaptest.py was removed

--===============4094656342714916917==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.21.0-0.22.5.patch"

RnJvbSBhZmIxMzU3NjQ1ZGJhMDAzZWI1MzNkOGMzY2M2OWVkOGFlMDJjMzRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxNjozOTo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmVhcnR5cGU6IHVwZ3JhZGUgMC4yMS4wIC0+IDAuMjIuNQoKLS0tCiAuLi4ve3B5dGhv
bjMtYmVhcnR5cGVfMC4yMS4wLmJiID0+IHB5dGhvbjMtYmVhcnR5cGVfMC4yMi41LmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWJlYXJ0eXBlXzAuMjEuMC5i
YiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMjIuNS5iYn0gKDc4JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4yMS4wLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMjIuNS5iYgpzaW1p
bGFyaXR5IGluZGV4IDc4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmVhcnR5cGVfMC4yMS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4yMi41LmJiCmluZGV4IDQzNDI3YzE0NzIuLjM4
OWRmODE4YmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1iZWFydHlwZV8wLjIxLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJlYXJ0eXBlXzAuMjIuNS5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9iZWFydHlwZS5yZWFkdGhlZG9jcy5pbyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2E1YmMwNWExMDlkMjM1OTEyZGE5N2EwNTNj
ZDdhNTgiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJmOWE1MDc4ZjVjZTg3MjYxYzJkMjI4NTFk
MTliMDUwYjY0ZjZhODA1NDM5ZTg3OTNhZWNmMDFjZTY2MGQzMjQ0IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjUxNmE5MDk2Y2M3NzEwM2M5NjE1MzQ3NGZhMzVjM2ViY2Q5ZDM2YmQyZWM4ZDBlM2E0
MzMwN2NlZDBmYTYzNDEiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIu
NDcuMQoK

--===============4094656342714916917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-beartype: PV changed from "0.21.0" to "0.22.5"
packages/x86-64-v3-poky-linux/python3-beartype: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.21.0.tar.gz;downloadfilename=beartype-0.21.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.22.5.tar.gz;downloadfilename=beartype-0.22.5.tar.gz"
packages/x86-64-v3-poky-linux/python3-beartype: PKGV changed from 0.21.0 [default] to 0.22.5 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-dbg: PV changed from "0.21.0" to "0.22.5"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-dbg: PKGV changed from 0.21.0 [default] to 0.22.5 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-dev: PV changed from "0.21.0" to "0.22.5"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-dev: PKGV changed from 0.21.0 [default] to 0.22.5 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-doc: PV changed from "0.21.0" to "0.22.5"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-doc: PKGV changed from 0.21.0 [default] to 0.22.5 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-locale: PV changed from "0.21.0" to "0.22.5"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-locale: PKGV changed from 0.21.0 [default] to 0.22.5 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-src: PV changed from "0.21.0" to "0.22.5"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-src: PKGV changed from 0.21.0 [default] to 0.22.5 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-staticdev: PV changed from "0.21.0" to "0.22.5"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-staticdev: PKGV changed from 0.21.0 [default] to 0.22.5 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype: PV changed from "0.21.0" to "0.22.5"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__, directory renamed /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info -> /usr/lib/python3.13/site-packages/beartype-0.22.5.dist-info, directory renamed /usr/lib/python3.13/site-packages/beartype/_decor/wrap -> /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap, directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/bite/kind/__pycache__, directory renamed /usr/lib/python3.13/site-packages/beartype/_util/kind/map -> /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike, directory renamed /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/beartype-0.22.5.dist-info/licenses, directo
 ry renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__, directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind -> /usr/lib/python3.13/site-packages/beartype/bite/kind, directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection -> /usr/lib/python3.13/site-packages/beartype/bite/collection, directory renamed /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__, removed "/usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemake.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__pycache__/inferhint.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redhint.py /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convsanify.cpython-313.p
 yc /usr/lib/python3.13/site-packages/beartype/claw/_package/__pycache__/clawpkghook.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsigncls.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsignset.py /usr/lib/python3.13/site-packages/beartype/_data/hint/datahinttyping.py /usr/lib/python3.13/site-packages/beartype/_util/api/utilbeartype.py /usr/lib/python3.13/site-packages/beartype/claw/__pycache__/_clawmagic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsigncls.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilbeartype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/decor/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/datamodthirdparty.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahinttyping.cpython-313.pyc /usr/lib/python3.13/site-packages/b
 eartype/_data/decor/__pycache__/datadecornontype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/clawastpep695.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/clawastpep526.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsignmap.py /usr/lib/python3.13/site-packages/beartype/claw/_package/clawpkghook.py /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/api/external/datamodthirdparty.py /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/convsanify.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodpy.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__py
 cache__/datapeprepr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585tuple.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodcontextlib.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodpy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/ast/dataast.py /usr/lib/python3.13/site-packages/beartype/claw/_importlib/clawimppath.py /usr/lib/python3.13/site-packages/beartype/_data/ast/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484typevar.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsignmap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodcontextlib.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/decor/datadecornontype.py /usr/lib/python3.13/sit
 e-packages/beartype/_data/hint/pep/datapeprepr.py /usr/lib/python3.13/site-packages/beartype/_check/code/codemake.py /usr/lib/python3.13/site-packages/beartype/claw/_clawmagic.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsignset.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodtyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodtyping.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585tuple.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__/dataast.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/__pycache__/checkcache.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__in
 it__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redhint.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintpep.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/checkcache.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep695.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsigns.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_func/infer/inferhint.py /usr/lib/python3.13/site-packages/beartype/_data
 /hint/pep/sign/datapepsigns.py /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintpep.py /usr/lib/python3.13/site-packages/beartype/claw/_importlib/__pycache__/clawimppath.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep526.cpython-313.pyc", added "/usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsigns.py /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/utilbearfunc.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utiljaxtyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastassign.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__init__.py /usr/lib/python3.13/site-packages/beartype/_
 util/cache/utilcacheclear.py /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscope.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscope.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484585646.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/confplaceenum.py /usr/lib/python3.13/site-packages/beartype/bite/__pycache__/_infermain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/utilsetchain.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585646.py /usr/l
 ib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscopebefore.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/bite/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/path/__pycache__/utilpathcopy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/datatypingport.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__/modpep328.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/pep/checkpep484typevar.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsigns.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/_decornontypemap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datacontextlib.py /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/dataconfblack.c
 python-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/dataconfplace.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/bite/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastassign.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastimport.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastmodule.py /usr/lib/python3.13/site-packages/beartype/_util/bear/utilbearblack.py /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__/checkpep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/confplaceenum.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__pycache__/clawastpep695.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/bear/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep484612646.cpython-313.pyc /usr/lib/python3.1
 3/site-packages/beartype/_data/hint/sign/datahintsignset.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redmain.py /usr/lib/python3.13/site-packages/beartype/_check/convert/convmain.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep749.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep649.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep560.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep696.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep649.py /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/datatyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep749.py /usr/lib/python3.13/site-packages/beartype/_util/cache/__pycac
 he__/utilcacheclear.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/typing/datatyping.py /usr/lib/python3.13/site-packages/beartype/claw/_package/__pycache__/clawpkgmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsigncls.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsignmap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsignset.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/datatypingport.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscopes.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datatypin
 g.py /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/__pycache__/utilcacheobjattr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsignmap.py /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/utilcacheobjattr.py /usr/lib/python3.13/site-packages/beartype/claw/_importlib/clawimpmain.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep484612646.py /usr/lib/python3.13/site-packages/beartype/_util/path/utilpathcopy.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscopebefore.py /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/codemain.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pe
 p/redpep692.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep646.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/clawastpep695.py /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/confplacetrie.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep560.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/utiljaxtyping.py /usr/lib/python3.13/site-packages/beartype/_data/conf/dataconfplace.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/dataast.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/__init__.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datapy.py /usr/lib/python3.13/site-packages/beartype/_util/module/pep/modpep328.py /usr/lib/python3.13/site-packages/beartype
 /_util/bear/utilbearfunc.py /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/bite/_infermain.py /usr/lib/python3.13/site-packages/beartype/claw/_package/clawpkgmain.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datapy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_importlib/__pycache__/clawimpmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datatyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/claw/dataclawmagic.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsigncls.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datacontextlib.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastmodule.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__init__.py /usr/lib/python3
 .13/site-packages/beartype/_util/hint/pep/proposal/pep696.py /usr/lib/python3.13/site-packages/beartype/_data/conf/dataconfblack.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/confplacetrie.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/conf/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintrepr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__pycache__/utilsetchain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep646.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep692.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/claw/__pycache__/dataclawmagic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_decornontypemap.py /usr/lib/py
 thon3.13/site-packages/beartype/_util/bear/__pycache__/utilbearblack.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscopes.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastimport.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/dataast.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintrepr.py"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype: PKGV changed from 0.21.0 [default] to 0.22.5 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype: PKGSIZE changed from 6108141 to 6840819 (+12%)
Changes to packages/x86-64-v3-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info moved to /usr/lib/python3.13/site-packages/beartype-0.22.5.dist-info
  /usr/lib/python3.13/site-packages/beartype/bite was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/infercollectionbuiltin.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/infercollectionitems.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/infercollectionsabc.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__/infercollectionbuiltin.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__/infercollectionitems.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__/infercollectionsabc.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/_infermain.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/infercallable.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/inferthirdparty.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/__pycache__/infercallable.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/__pycache__/inferthirdparty.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/kind/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/bite/__pycache__/_infermain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/bite/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/codemain.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/convmain.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep484612646.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep646.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep692.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep484612646.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep646.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep692.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redmain.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/checkpep484typevar.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__/checkpep484typevar.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastassign.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastimport.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastmodule.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastassign.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastimport.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastmodule.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/clawastpep695.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__pycache__/clawastpep695.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscopebefore.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscope.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscopes.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscopebefore.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscope.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscopes.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_importlib/clawimpmain.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_importlib/__pycache__/clawimpmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/claw/_package/clawpkgmain.py was added
  /usr/lib/python3.13/site-packages/beartype/claw/_package/__pycache__/clawpkgmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/confplaceenum.py was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/confplacetrie.py was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/confplaceenum.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/confplacetrie.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/dataast.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datacontextlib.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datapy.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datatyping.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/dataast.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datacontextlib.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datapy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datatyping.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/claw was added
  /usr/lib/python3.13/site-packages/beartype/_data/claw/dataclawmagic.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/claw/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/claw/__pycache__/dataclawmagic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/dataconfblack.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/dataconfplace.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/dataconfblack.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/dataconfplace.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintrepr.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintrepr.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsigncls.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsignmap.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsignset.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsigns.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsigncls.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsignmap.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsigns.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsignset.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/datatypingport.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/datatyping.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/datatyping.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/datatypingport.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_decornontypemap.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/_decornontypemap.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wrapargs.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/wrapmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wrapreturn.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/wrapsnip.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wraputil.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wrapargs.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/wrapmain.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wrapreturn.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/wrapsnip.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wraputil.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utiljaxtyping.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/api/external/utiljaxtyping.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/utilbearblack.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/utilbearfunc.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/utilbearblack.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/bear/utilbearfunc.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/cache/__pycache__/utilcacheclear.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/cache/__pycache__/utilcacheobjattr.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/cache/utilcacheclear.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/cache/utilcacheobjattr.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585646.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep560.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep649.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep696.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep749.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484585646.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep560.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep649.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep696.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep749.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__/utilmapfrozen.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__/utilmapset.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__/utilmaptest.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/utilmapfrozen.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/utilmapset.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/utilmaptest.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__pycache__/utilsetchain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/utilsetchain.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/module/pep was added
  /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/module/pep/modpep328.py was added
  /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__/modpep328.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/path/__pycache__/utilpathcopy.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/path/utilpathcopy.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/checkcache.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/code/codemake.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemake.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/convsanify.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convsanify.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484typevar.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484typevar.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redhint.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redhint.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/__pycache__/checkcache.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/clawastpep526.py was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/clawastpep695.py was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep526.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep695.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_clawmagic.py was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_importlib/clawimppath.py was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_importlib/__pycache__/clawimppath.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_package/clawpkghook.py was removed
  /usr/lib/python3.13/site-packages/beartype/claw/_package/__pycache__/clawpkghook.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/claw/__pycache__/_clawmagic.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/datamodthirdparty.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/datamodthirdparty.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodcontextlib.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodpy.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodtyping.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodcontextlib.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodpy.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodtyping.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/ast was removed
  /usr/lib/python3.13/site-packages/beartype/_data/ast/dataast.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/ast/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__/dataast.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/decor was removed
  /usr/lib/python3.13/site-packages/beartype/_data/decor/datadecornontype.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/datadecornontype.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintpep.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/datahinttyping.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/datapeprepr.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__pycache__/datapeprepr.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsigncls.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsignmap.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsignset.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsigns.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsigncls.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsignmap.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsigns.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsignset.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintpep.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahinttyping.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/_wrapargs.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/wrapmain.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/_wrapreturn.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/wrapsnip.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/_wraputil.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/_wrapargs.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/wrapmain.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/_wrapreturn.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/wrapsnip.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/wrap/_wraputil.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/infercollectionbuiltin.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/infercollectionitems.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/infercollectionsabc.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__/infercollectionbuiltin.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__/infercollectionitems.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__/infercollectionsabc.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/inferhint.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/infercallable.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/inferthirdparty.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__pycache__/infercallable.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__pycache__/inferthirdparty.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__pycache__/inferhint.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilbeartype.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/api/utilbeartype.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585tuple.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585tuple.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__/utilmapfrozen.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__/utilmapset.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__/utilmaptest.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/utilmapfrozen.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/utilmapset.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/kind/map/utilmaptest.py was removed

--===============4094656342714916917==--

