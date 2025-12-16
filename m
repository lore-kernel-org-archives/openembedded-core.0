Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51181D5C0D2
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:24 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17188.1765872139220084245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=yyhnCRKl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=p4VRzFt1;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019b262e79df-d1405b5a-cff8-4840-8662-4986db3743c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EqASEPeKUYKeCb5umZmuFuWU8RuYJBVS/M0wdK4Y5JQ=;
	b=yyhnCRKlSvEcztSu/1cwKqghyorTIl+nFB7/NCWJUCPpGL0BeYe+NESKaR+16GDA
	huL7NweEf9P5Zsn4njwxbTCr0gYSYoTICFCa37bfT3LUgYXI3VtHkZHpkMxpyBGt7v/
	jtJJd4HRL9EeS+nGIV6S0DnVjIKHNlpLHb+j+sFE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872138;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EqASEPeKUYKeCb5umZmuFuWU8RuYJBVS/M0wdK4Y5JQ=;
	b=p4VRzFt1ob9VaLAE2jYWwyH4p6XAV4qanU+uD1h6n7p+uPGGNjRbNbjuyGlAwFSc
	zlv++tRThrRffC//Z5PewlKJA9NVqwDArfhe+r8jybyHcw31ye5I0THdfihUsvmP4Rc
	u0auIQ3xt/EMkAOGTGldTC9EdWvFvrmz0RBQERCE=
Content-Type: multipart/mixed; boundary="===============7151671754063796836=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.22.9 SUCCEEDED
Message-ID: <0101019b262e79df-d1405b5a-cff8-4840-8662-4986db3743c5-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:18 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227796

--===============7151671754063796836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-beartype* to *0.22.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-beartype-upgrade-0.21.0-0.22.9.patch
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
From 897fdeb87aa05a82d715e7d6fa157e862edb024a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Dec 2025 23:18:26 +0000
Subject: [PATCH] python3-beartype: upgrade 0.21.0 -> 0.22.9

---
 .../{python3-beartype_0.21.0.bb => python3-beartype_0.22.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.21.0.bb => python3-beartype_0.22.9.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.21.0.bb b/meta/recipes-devtools/python/python3-beartype_0.22.9.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-beartype_0.21.0.bb
rename to meta/recipes-devtools/python/python3-beartype_0.22.9.bb
index 43427c1472..e39599ccf3 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.21.0.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.22.9.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5bc05a109d235912da97a053cd7a58"
 
-SRC_URI[sha256sum] = "f9a5078f5ce87261c2d22851d19b050b64f6a805439e8793aecf01ce660d3244"
+SRC_URI[sha256sum] = "8f82b54aa723a2848a56008d18875f91c1db02c32ef6a62319a002e3e25a975f"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============7151671754063796836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype: PKGSIZE changed from 6108141 to 6891693 (+13%)
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__, directory renamed /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info -> /usr/lib/python3.13/site-packages/beartype-0.22.9.dist-info, directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind -> /usr/lib/python3.13/site-packages/beartype/bite/kind, directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/bite/kind/__pycache__, directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection -> /usr/lib/python3.13/site-packages/beartype/bite/collection, directory renamed /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/beartype-0.22.9.dist-info/licenses,
  directory renamed /usr/lib/python3.13/site-packages/beartype/_util/kind/map -> /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike, directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__, removed "/usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemake.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/decor/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodcontextlib.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/__pycache__/_clawmagic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__pycache__/datapeprepr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/datapeprepr.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/_wraparg
 s.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585tuple.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsignset.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/ast/dataast.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_package/__pycache__/clawpkghook.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/wrap/wrapmain.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsigncls.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/datamodthirdparty.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/ast/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hi
 nt/pep/sign/__pycache__/datapepsignmap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redhint.py /usr/lib/python3.13/site-packages/beartype/_check/checkcache.py /usr/lib/python3.13/site-packages/beartype/_data/decor/datadecornontype.py /usr/lib/python3.13/site-packages/beartype/_data/hint/datahinttyping.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/_wraputil.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/utilbeartype.py /usr/lib/python3.13/site-packages/beartype/_check/code/codemake.py /usr/lib/python3.13/site-packages/beartype/_check/convert/convsanify.py /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintpep.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodtyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__init__.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep695.cpyth
 on-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484typevar.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsignmap.py /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodcontextlib.py /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/datadecornontype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsigncls.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convsanify.cpython-
 313.pyc /usr/lib/python3.13/site-packages/beartype/_check/checkmagic.py /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodemagic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_func/infer/inferhint.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/clawastpep526.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/clawastpep695.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsigns.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/wrapmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_clawmagic.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodtyping.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/_wrapreturn.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_package/clawpkghook.py /usr/lib/python3.13/site-packages/beartype/_data/hint/
 __pycache__/datahinttyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintpep.py /usr/lib/python3.13/site-packages/beartype/claw/_importlib/__pycache__/clawimppath.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsignset.py /usr/lib/python3.13/site-packages/beartype/_check/__pycache__/checkmagic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/__pycache__/checkcache.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__/dataast.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodpy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilbeartype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint
 /pep/sign/__pycache__/datapepsigns.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep526.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__pycache__/inferhint.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/wrapsnip.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/wrap/_wrapreturn.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redhint.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/external/datamodthirdparty.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585tuple.py /usr/lib/python3.13/site-packages/beartype/_data/code/datacodemagic.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__
 /__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_importlib/clawimppath.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/_wrapargs.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodpy.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/_wraputil.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/wrapsnip.py", added "/usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscopes.py /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__init__.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastassign.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep560.py /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/module/pep/modpep328.py /usr/lib/python3.13/site-packages/beartype/_ut
 il/bear/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/datatypingport.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/bite/_infermain.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484585646.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/wrapmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep646.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep692.py /usr/lib/python3.13/site-packages/beartype/bite/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/external/__pycache__/utiljaxtyping.cpython-313.pyc /usr/lib/python3.13/site-pa
 ckages/beartype/_data/api/standard/datacontextlib.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datapy.py /usr/lib/python3.13/site-packages/beartype/_util/path/__pycache__/utilpathcopy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_package/__pycache__/clawpkgmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep696.py /usr/lib/python3.13/site-packages/beartype/claw/_importlib/__pycache__/clawimpmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__init__.py /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__init__.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__pycache__/clawastpep695.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache_
 _/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep484612646.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscope.py /usr/lib/python3.13/site-packages/beartype/_data/code/pep/__pycache__/datacodepep484.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep484612646.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/datatyping.py /usr/lib/python3.13/site-packages/beartype/claw/_package/clawpkgmain.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wrapargs.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wraputil.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/conf/__init__.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastimport.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/clawastpep695.p
 y /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscopebefore.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintrepr.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsigns.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/pep/checkpep484typevar.py /usr/lib/python3.13/site-packages/beartype/bite/__pycache__/_infermain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/confplaceenum.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/path/utilpathcopy.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/dataast.py /usr/lib/python3.13/site-packages/beartype/_data/claw/__pycache__/dataclawmagic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585646.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsignset.py /usr/lib/python3.13/site-packages/beartype/_util/bea
 r/__pycache__/utilbearblack.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_decornontypemap.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datapy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/code/codemain.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wrapargs.py /usr/lib/python3.13/site-packages/beartype/_data/conf/dataconfblack.py /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__pycache__/utilsetchain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastmodule.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsigncls.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/data
 hintsignmap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsignset.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep696.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep649.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep749.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep560.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/code/pep/datacodepep342.py /usr/lib/python3.13/site-packages/beartype/_data/code/pep/datacodepep484.py /usr/lib/python3.13/site-packages/beartype/_data/code/pep/datacodepep525.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscopes.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wrapreturn.cpython-313.pyc /usr/lib/python3.13/sit
 e-packages/beartype/claw/_ast/_kind/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep646.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep692.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/bear/utilbearfunc.py /usr/lib/python3.13/site-packages/beartype/_data/conf/dataconfplace.py /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/confplacetrie.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsigns.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kin
 d/clawastassign.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastimport.py /usr/lib/python3.13/site-packages/beartype/_check/convert/convmain.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastmodule.py /usr/lib/python3.13/site-packages/beartype/bite/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__/checkpep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodefunc.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodename.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redmain.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/_decornontypemap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsignmap.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datatyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_d
 ata/code/datacodelen.py /usr/lib/python3.13/site-packages/beartype/_util/cache/utilcacheobjattr.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wraputil.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wrapreturn.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/wrapmain.py /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__/modpep328.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/code/datacodefunc.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscopebefore.py /usr/lib/python3.13/site-packages/beartype/_util/cache/utilcacheclear.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/utiljaxtyping.py /usr/lib/python3.13/site-packages/beartype/_data/code/pep/__pycache__/datacodepep342.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/code/datacodename.py /usr/lib/python3.13/site-packages/beartype/_data/code/pep/__pycache__/datacodepep525.cpyth
 on-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/__pycache__/utilcacheobjattr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/bear/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/typing/datatypingport.py /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodelen.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscope.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep649.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep749.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/typing/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/bear/utilbearblack.py /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__pycache__/__init__.cpython-3
 13.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/__pycache__/utilcacheclear.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/utilsetchain.py /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/utilbearfunc.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintrepr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/confplacetrie.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsigncls.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datatyping.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datacontextlib.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/confplaceenum.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/dataast.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/claw/dataclawmagic.py /usr/lib/python3.
 13/site-packages/beartype/claw/_ast/_scope/__init__.py /usr/lib/python3.13/site-packages/beartype/claw/_importlib/clawimpmain.py /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/dataconfblack.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/dataconfplace.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/datatyping.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info moved to /usr/lib/python3.13/site-packages/beartype-0.22.9.dist-info
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
  /usr/lib/python3.13/site-packages/beartype/_data/code/datacodefunc.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/datacodelen.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/datacodename.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/pep/datacodepep342.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/pep/datacodepep484.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/pep/datacodepep525.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/pep/__pycache__/datacodepep342.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/pep/__pycache__/datacodepep484.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/pep/__pycache__/datacodepep525.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodefunc.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodelen.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodename.cpython-313.pyc was added
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
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wraputil.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wrapargs.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/wrapmain.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wrapreturn.py was added
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
  /usr/lib/python3.13/site-packages/beartype/_check/checkmagic.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/code/codemake.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemake.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/convsanify.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convsanify.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484typevar.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484typevar.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redhint.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redhint.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/__pycache__/checkcache.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/__pycache__/checkmagic.cpython-313.pyc was removed
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
  /usr/lib/python3.13/site-packages/beartype/_data/code/datacodemagic.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodemagic.cpython-313.pyc was removed
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

--===============7151671754063796836==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.21.0-0.22.9.patch"

RnJvbSA4OTdmZGViODdhYTA1YTgyZDcxNWU3ZDZmYTE1N2U4NjJlZGIwMjRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgRGVjIDIwMjUgMjM6MTg6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJlYXJ0eXBlOiB1cGdyYWRlIDAuMjEuMCAtPiAwLjIyLjkKCi0tLQogLi4uL3tweXRo
b24zLWJlYXJ0eXBlXzAuMjEuMC5iYiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMjIuOS5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1iZWFydHlwZV8wLjIxLjAu
YmIgPT4gcHl0aG9uMy1iZWFydHlwZV8wLjIyLjkuYmJ9ICg3OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMjEuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iZWFydHlwZV8wLjIyLjkuYmIKc2lt
aWxhcml0eSBpbmRleCA3OCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJlYXJ0eXBlXzAuMjEuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMjIuOS5iYgppbmRleCA0MzQyN2MxNDcyLi5l
Mzk1OTljY2YzIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtYmVhcnR5cGVfMC4yMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1iZWFydHlwZV8wLjIyLjkuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vYmVhcnR5cGUucmVhZHRoZWRvY3MuaW8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNhNWJjMDVhMTA5ZDIzNTkxMmRhOTdhMDUz
Y2Q3YTU4IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjlhNTA3OGY1Y2U4NzI2MWMyZDIyODUx
ZDE5YjA1MGI2NGY2YTgwNTQzOWU4NzkzYWVjZjAxY2U2NjBkMzI0NCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI4ZjgyYjU0YWE3MjNhMjg0OGE1NjAwOGQxODg3NWY5MWMxZGIwMmMzMmVmNmE2MjMx
OWEwMDJlM2UyNWE5NzVmIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoy
LjQ3LjEKCg==

--===============7151671754063796836==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-beartype: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.21.0.tar.gz;downloadfilename=beartype-0.21.0.tar.gz" to "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.22.9.tar.gz;downloadfilename=beartype-0.22.9.tar.gz"
packages/x86-64-v3-poky-linux/python3-beartype: PV changed from "0.21.0" to "0.22.9"
packages/x86-64-v3-poky-linux/python3-beartype: PKGV changed from 0.21.0 [default] to 0.22.9 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-dbg: PV changed from "0.21.0" to "0.22.9"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-dbg: PKGV changed from 0.21.0 [default] to 0.22.9 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-dev: PV changed from "0.21.0" to "0.22.9"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-dev: PKGV changed from 0.21.0 [default] to 0.22.9 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-doc: PV changed from "0.21.0" to "0.22.9"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-doc: PKGV changed from 0.21.0 [default] to 0.22.9 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-locale: PV changed from "0.21.0" to "0.22.9"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-locale: PKGV changed from 0.21.0 [default] to 0.22.9 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-src: PV changed from "0.21.0" to "0.22.9"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-src: PKGV changed from 0.21.0 [default] to 0.22.9 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-staticdev: PV changed from "0.21.0" to "0.22.9"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype-staticdev: PKGV changed from 0.21.0 [default] to 0.22.9 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype: PKGSIZE changed from 6108141 to 6891693 (+13%)
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype: PV changed from "0.21.0" to "0.22.9"
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype: PKGV changed from 0.21.0 [default] to 0.22.9 [default]
packages/x86-64-v3-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind -> /usr/lib/python3.13/site-packages/beartype/bite/kind, directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/kind/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/bite/kind/__pycache__, directory renamed /usr/lib/python3.13/site-packages/beartype/_util/kind/map/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike/__pycache__, directory renamed /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info -> /usr/lib/python3.13/site-packages/beartype-0.22.9.dist-info, directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection -> /usr/lib/python3.13/site-packages/beartype/bite/collection, directory renamed /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info/licenses -> /usr/lib/python3.13/site-packages/beartype-0.22.9.dist-info/licenses,
  directory renamed /usr/lib/python3.13/site-packages/beartype/door/_func/infer/collection/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/bite/collection/__pycache__, directory renamed /usr/lib/python3.13/site-packages/beartype/_util/kind/map -> /usr/lib/python3.13/site-packages/beartype/_util/kind/maplike, removed "/usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/clawastpep526.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/clawastpep695.py /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/datadecornontype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/decor/datadecornontype.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodcontextlib.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/red
 pep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/api/__pycache__/utilbeartype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/codemake.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585tuple.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__init__.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/wrapsnip.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redhint.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintpep.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsigns.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_clawmagic.py /usr/lib/python3.13/site-packages/beartype/door/_func/infer/inferhint.py /usr/lib/python3.13/site-packages/beartype/claw/_package/clawp
 kghook.py /usr/lib/python3.13/site-packages/beartype/_util/api/utilbeartype.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodtyping.py /usr/lib/python3.13/site-packages/beartype/_data/api/external/datamodthirdparty.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/datapeprepr.py /usr/lib/python3.13/site-packages/beartype/_data/hint/datahinttyping.py /usr/lib/python3.13/site-packages/beartype/claw/_package/__pycache__/clawpkghook.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__pycache__/inferhint.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/decor/__init__.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484typevar.py /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintpep.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsigncls.py /usr/lib/
 python3.13/site-packages/beartype/claw/_importlib/__pycache__/clawimppath.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/wrap/_wrapreturn.py /usr/lib/python3.13/site-packages/beartype/claw/_importlib/clawimppath.py /usr/lib/python3.13/site-packages/beartype/_data/decor/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsignset.py /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convsanify.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/wrapmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/external/__pycache__/datamodthirdparty.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_func/infer/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep695.cpython-313.pyc /usr/lib/python3.13/site-pac
 kages/beartype/claw/__pycache__/_clawmagic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsignmap.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585tuple.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodtyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/convsanify.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodemagic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsignmap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/ast/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/code/datacodemagic.py /usr/lib/python3.13/site-packages/beartype/_check/checkma
 gic.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/datapepsigns.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsigncls.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/ast/__pycache__/dataast.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/_wrapargs.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/_wrapreturn.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/ast/dataast.py /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/sign/__pycache__/datapepsignset.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahinttyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/wrap/wrapmain.py /usr/li
 b/python3.13/site-packages/beartype/_decor/wrap/wrapsnip.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/__pycache__/_wraputil.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodcontextlib.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemake.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/pep/__pycache__/clawastpep526.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datamodpy.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datamodpy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/pep/__pycache__/datapeprepr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redhint.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/__pycache__/checkcache.cpy
 thon-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/__pycache__/checkmagic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/checkcache.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/_wrapargs.py /usr/lib/python3.13/site-packages/beartype/_decor/wrap/_wraputil.py", added "/usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wrapreturn.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/wrapmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wrapargs.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_decornontypemap.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wraputil.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_uti
 l/hint/pep/proposal/pep649.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep749.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsigns.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/cache/utilcacheobjattr.py /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/confplaceenum.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep649.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep696.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep749.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/confplacetrie.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep560.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/codemain.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/
 __pycache__/clawastscopes.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep484585646.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodelen.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/bite/__init__.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscopebefore.py /usr/lib/python3.13/site-packages/beartype/_util/api/external/utiljaxtyping.py /usr/lib/python3.13/site-packages/beartype/_data/hint/datahintrepr.py /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__pycache__/utilsetchain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastimport.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/pep/checkpep484typevar.py /usr/lib/python3.13/site-packages/beartype/_util/cache/__pycache__/utilcacheobjattr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/bear/utilbearblack.py /usr/lib/py
 thon3.13/site-packages/beartype/_util/bear/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_importlib/__pycache__/clawimpmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep692.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep646.py /usr/lib/python3.13/site-packages/beartype/bite/_infermain.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/__pycache__/_decornontypemap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wrapargs.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datatyping.py /usr/lib/python3.13/site-packages/beartype/_data/code/pep/__pycache__/datacodepep342.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/code/pep/__pycache__/datacodepep525.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__py
 cache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datacontextlib.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_package/__pycache__/clawpkgmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep484612646.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsignset.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/datatypingport.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/utilsetchain.py /usr/lib/python3.13/site-packages/beartype/_util/module/pep/modpep328.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep646.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep692.cpython-313.pyc
  /usr/lib/python3.13/site-packages/beartype/claw/_importlib/clawimpmain.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsignset.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsigncls.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/conf/dataconfblack.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wrapreturn.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsigns.py /usr/lib/python3.13/site-packages/beartype/_data/code/datacodename.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsignmap.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscope.py /usr/lib/python3.13/site-packages/beartype/_de
 cor/_nontype/_wrap/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__/checkpep484typevar.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/convmain.py /usr/lib/python3.13/site-packages/beartype/_util/path/__pycache__/utilpathcopy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastmodule.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__pycache__/modpep328.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscope.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/code/pep/datacodepep342.py /usr/lib/python3.13/site-packages/beartype/_data/code/pep/datacodepep484.py /usr/lib/python3.13/site-packages/beartype/_data/code/pep/datacodepep525.py /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodef
 unc.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodename.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/typing/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/datahintsigncls.py /usr/lib/python3.13/site-packages/beartype/_data/typing/datatyping.py /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/confplaceenum.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastassign.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastimport.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/clawastmodule.py /usr/lib/python3.13/site-packages/beartype/_data/conf/dataconfplace.py /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/datatyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/bite/__pycache__/__init__.cpytho
 n-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep560.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep696.py /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/cache/__pycache__/utilcacheclear.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/bite/__pycache__/_infermain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/utilbearblack.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/claw/__pycache__/dataclawmagic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585646.py /usr/lib/python3.13/site-packages/beartype/_data/typing/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/code/datacodefu
 nc.py /usr/lib/python3.13/site-packages/beartype/_data/claw/dataclawmagic.py /usr/lib/python3.13/site-packages/beartype/claw/_package/clawpkgmain.py /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/kind/setlike/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datatyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/conf/__init__.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/clawastpep695.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/dataast.py /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redmain.py /usr/lib/python3.13/site-packages/beartype/_util/module/pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep484612646.py /usr/li
 b/python3.13/site-packages/beartype/_data/api/standard/datapy.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__init__.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__init__.py /usr/lib/python3.13/site-packages/beartype/_data/hint/__pycache__/datahintrepr.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/datapy.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/api/standard/__pycache__/dataast.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_kind/__pycache__/clawastassign.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/code/pep/__pycache__/datacodepep484.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/__pycache__/clawastscopebefore.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wraputil.py /usr/lib/p
 ython3.13/site-packages/beartype/_util/api/external/__pycache__/utiljaxtyping.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/path/utilpathcopy.py /usr/lib/python3.13/site-packages/beartype/_data/typing/datatypingport.py /usr/lib/python3.13/site-packages/beartype/claw/_ast/_scope/clawastscopes.py /usr/lib/python3.13/site-packages/beartype/_conf/decorplace/confplacetrie.py /usr/lib/python3.13/site-packages/beartype/_util/bear/__pycache__/utilbearfunc.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__pycache__/clawastpep695.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/claw/_ast/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_util/cache/utilcacheclear.py /usr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/dataconfblack.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/wrapmain.py /u
 sr/lib/python3.13/site-packages/beartype/_data/conf/__pycache__/dataconfplace.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/code/datacodelen.py /usr/lib/python3.13/site-packages/beartype/_util/bear/utilbearfunc.py /usr/lib/python3.13/site-packages/beartype/_data/api/standard/datacontextlib.py /usr/lib/python3.13/site-packages/beartype/_data/hint/sign/__pycache__/datahintsignmap.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info moved to /usr/lib/python3.13/site-packages/beartype-0.22.9.dist-info
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
  /usr/lib/python3.13/site-packages/beartype/_data/code/datacodefunc.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/datacodelen.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/datacodename.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/pep/datacodepep342.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/pep/datacodepep484.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/pep/datacodepep525.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/pep/__pycache__/datacodepep342.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/pep/__pycache__/datacodepep484.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/pep/__pycache__/datacodepep525.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodefunc.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodelen.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodename.cpython-313.pyc was added
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
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/__pycache__/_wraputil.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wrapargs.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/wrapmain.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_wrap/_wrapreturn.py was added
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
  /usr/lib/python3.13/site-packages/beartype/_check/checkmagic.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/code/codemake.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/code/__pycache__/codemake.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/convsanify.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/__pycache__/convsanify.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/__pycache__/redpep484typevar.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484/redpep484typevar.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/redhint.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/redhint.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/__pycache__/checkcache.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/__pycache__/checkmagic.cpython-313.pyc was removed
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
  /usr/lib/python3.13/site-packages/beartype/_data/code/datacodemagic.py was removed
  /usr/lib/python3.13/site-packages/beartype/_data/code/__pycache__/datacodemagic.cpython-313.pyc was removed
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

--===============7151671754063796836==--

