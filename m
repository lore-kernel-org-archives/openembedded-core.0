Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9898C27C77
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:10 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.13592.1713248038938532612
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ereVm8Mu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=vqr1DKFk;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018ee58a6d4a-2a5214d3-0324-4f1a-9398-4dc0b415353c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5n9XECPDnfa+6XZDSppzE2kT6xILkk8WZh1EskSYPqc=;
	b=ereVm8MusR0smHotcwOPmV5pcJeJQfxwezVrLMTgSVB4Yz+jB0WvGHbQwchRsdyP
	44d+g9duor4aurLuwvQFaIEzYzJJUwVGNajLUi2X3CKyO5r1IhtQxucCLihA7c7dar6
	ET5Uhh8wDuGD8DMPedG/GpSlqx7tMpzDN1Q4Sz8Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248038;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5n9XECPDnfa+6XZDSppzE2kT6xILkk8WZh1EskSYPqc=;
	b=vqr1DKFkSSdRvh1GrfScoYGs98PRp1l8azjH25AyGep8j3kfN+uF1siCKXLj9+r1
	+GV6SvW9PY8kUfs1PNN03+LjDySWo4FPQ43N9IMFj/OWCDqJgO4LRUGqcTxubxH/JHo
	d/cMuCbgr8IuNrtN3cVz8Z4yYlQe/kl5PBjiXAuU=
Content-Type: multipart/mixed; boundary="===============0762226275480174947=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <mrybczynska@syslinbit.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.18.2 SUCCEEDED
Message-ID: <0101018ee58a6d4a-2a5214d3-0324-4f1a-9398-4dc0b415353c-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198286

--===============0762226275480174947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-beartype* to *0.18.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-beartype-upgrade-0.17.2-0.18.2.patch
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
From 7cae2423a68dc0178b81fbb5a731df4d0d3df225 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 18:53:59 +0000
Subject: [PATCH] python3-beartype: upgrade 0.17.2 -> 0.18.2

---
 .../{python3-beartype_0.17.2.bb => python3-beartype_0.18.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.17.2.bb => python3-beartype_0.18.2.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.17.2.bb b/meta/recipes-devtools/python/python3-beartype_0.18.2.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-beartype_0.17.2.bb
rename to meta/recipes-devtools/python/python3-beartype_0.18.2.bb
index 05fd74543b..1b6ab6a42b 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.17.2.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.18.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e71f94261c1b39896cacacfeaf60560e"
 
-SRC_URI[sha256sum] = "e911e1ae7de4bccd15745f7643609d8732f64de5c2fb844e89cbbed1c5a8d495"
+SRC_URI[sha256sum] = "a6fbc0be9269889312388bfec6a9ddf41bf8fe31b68bcf9c8239db35cd38f411"
 
 inherit setuptools3 pypi
 
-- 
2.42.0


--===============0762226275480174947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.12/site-packages/beartype-0.17.2.dist-info -> /usr/lib/python3.12/site-packages/beartype-0.18.2.dist-info, removed "/usr/lib/python3.12/site-packages/beartype/_util/func/mod/__init__.py /usr/lib/python3.12/site-packages/beartype/door/_doortyping.py /usr/lib/python3.12/site-packages/beartype/claw/_clawtyping.py /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorraise.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/_errorgeneric.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/_errorgeneric.py /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep484604union.py /usr/
 lib/python3.12/site-packages/beartype/_util/func/mod/__pycache__/utilbeartypefunc.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep484604union.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/errorutilcolor.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_util/errorutilcolor.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/_errorsequence.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/_clawastmunge.py /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585arg.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/__pycache__/_clawastmunge.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/_errornoreturn.py /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorget.py /usr/lib/p
 ython3.12/site-packages/beartype/_check/error/_util/__pycache__/errorutiltext.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/mod/utilfuncmodtest.py /usr/lib/python3.12/site-packages/beartype/_check/code/codesnip.py /usr/lib/python3.12/site-packages/beartype/door/__pycache__/_doortyping.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__init__.py /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585arg.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/mod/utilbeartypefunc.py /usr/lib/python3.12/site-packages/beartype/_util/text/__pycache__/utiltextmagic.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__pycache__/utilfuncmodtest.cpython-312.pyc /usr/lib/pyt
 hon3.12/site-packages/beartype/_util/text/utiltextmagic.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorraise.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep593.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep586.py /usr/lib/python3.12/site-packages/beartype/_check/error/_util/errorutiltext.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep586.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep593.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/_errorsequence.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/codesnip.cpython-
 312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorget.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/claw/__pycache__/_clawtyping.cpython-312.pyc", added "/usr/lib/python3.12/site-packages/beartype/_util/func/module/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/errorpep484604union.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__init__.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/_clawastutil.py /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_data/error/__init__.py /usr/lib/python3.12/site-packages/beartype/_data/code/datacodemagic.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/__pycache__/_clawastutil.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrget.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep
 484/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__pycache__/codesnipcls.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/errorsequence.py /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wrapargs.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/module/utilfuncmodbear.py /usr/lib/python3.12/site-packages/beartype/_data/func/__pycache__/datafunccodeobj.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/errorpep586.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/errorpep593.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/__pycache__/errornoreturn.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/utilpep613.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__p
 ycache__/errorgeneric.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep613.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrraise.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_data/error/dataerrmagic.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/errorpep586.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/errorpep593.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_data/func/datafunccodeobj.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrwarn.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__init__.py /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrraise.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep4
 84585/errorgeneric.py /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wrapargs.py /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wraputil.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/errorpep484604union.py /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__/datacodemagic.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/module/utilfuncmodtest.py /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrtest.py /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__/datacodeindent.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wrapreturn.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wraputil.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__pycache__/codesnipstr.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-p
 ackages/beartype/_data/code/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/errornoreturn.py /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrwarn.py /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__/utilfuncmodbear.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__/utilfuncmodtest.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrget.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wrapreturn.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errormapping.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/errormapping.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errorsequence.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/snip/codesnipcls.py /usr/lib/python3.12/site-packages/beartyp
 e/_check/code/snip/codesnipstr.py /usr/lib/python3.12/site-packages/beartype/_data/code/datacodeindent.py /usr/lib/python3.12/site-packages/beartype/_data/error/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_data/error/__pycache__/dataerrmagic.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrtest.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__/__init__.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.12/site-packages/beartype-0.17.2.dist-info moved to /usr/lib/python3.12/site-packages/beartype-0.18.2.dist-info
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/codesnipcls.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/codesnipstr.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__pycache__/codesnipcls.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__pycache__/codesnipstr.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/errorpep484604union.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/errorpep586.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/errorpep593.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484 was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585 was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/errorgeneric.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/errormapping.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/errorsequence.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errorgeneric.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errormapping.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errorsequence.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/errornoreturn.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/__pycache__/errornoreturn.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/errorpep484604union.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/errorpep586.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/errorpep593.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/_clawastutil.py was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/__pycache__/_clawastutil.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/code was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/datacodeindent.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/datacodemagic.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__/datacodeindent.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__/datacodemagic.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/error was added
  /usr/lib/python3.12/site-packages/beartype/_data/error/dataerrmagic.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/error/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/error/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_data/error/__pycache__/dataerrmagic.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/error/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/func/datafunccodeobj.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/func/__pycache__/datafunccodeobj.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wrapargs.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wrapreturn.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wraputil.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wrapargs.py was added
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wrapreturn.py was added
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wraputil.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrget.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrraise.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrtest.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrwarn.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrget.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrraise.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrtest.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrwarn.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__/utilfuncmodbear.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__/utilfuncmodtest.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/utilfuncmodbear.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/utilfuncmodtest.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep613.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/utilpep613.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/codesnip.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/codesnip.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep484604union.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep586.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep593.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484 was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585 was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/_errorgeneric.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/_errorsequence.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/_errorgeneric.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/_errorsequence.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/_errornoreturn.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep484604union.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep586.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep593.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/errorutilcolor.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/errorutiltext.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/errorutilcolor.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/errorutiltext.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/_clawastmunge.py was removed
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/__pycache__/_clawastmunge.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/claw/_clawtyping.py was removed
  /usr/lib/python3.12/site-packages/beartype/claw/__pycache__/_clawtyping.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/door/_doortyping.py was removed
  /usr/lib/python3.12/site-packages/beartype/door/__pycache__/_doortyping.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorget.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorraise.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorget.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorraise.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__pycache__/utilbeartypefunc.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__pycache__/utilfuncmodtest.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/utilbeartypefunc.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/utilfuncmodtest.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585arg.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585arg.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/text/__pycache__/utiltextmagic.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/text/utiltextmagic.py was removed

--===============0762226275480174947==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.17.2-0.18.2.patch"

RnJvbSA3Y2FlMjQyM2E2OGRjMDE3OGI4MWZiYjVhNzMxZGY0ZDBkM2RmMjI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTg6NTM6NTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJlYXJ0eXBlOiB1cGdyYWRlIDAuMTcuMiAtPiAwLjE4LjIKCi0tLQogLi4uL3tweXRo
b24zLWJlYXJ0eXBlXzAuMTcuMi5iYiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMTguMi5iYn0gIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1iZWFydHlwZV8wLjE3LjIu
YmIgPT4gcHl0aG9uMy1iZWFydHlwZV8wLjE4LjIuYmJ9ICg3NSUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTcuMi5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1iZWFydHlwZV8wLjE4LjIuYmIKc2lt
aWxhcml0eSBpbmRleCA3NSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLWJlYXJ0eXBlXzAuMTcuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMTguMi5iYgppbmRleCAwNWZkNzQ1NDNiLi4x
YjZhYjZhNDJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtYmVhcnR5cGVfMC4xNy4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24v
cHl0aG9uMy1iZWFydHlwZV8wLjE4LjIuYmIKQEAgLTQsNyArNCw3IEBAIEhPTUVQQUdFID0gImh0
dHBzOi8vYmVhcnR5cGUucmVhZHRoZWRvY3MuaW8iCiBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWU3MWY5NDI2MWMxYjM5ODk2Y2FjYWNmZWFm
NjA1NjBlIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTkxMWUxYWU3ZGU0YmNjZDE1NzQ1Zjc2
NDM2MDlkODczMmY2NGRlNWMyZmI4NDRlODljYmJlZDFjNWE4ZDQ5NSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJhNmZiYzBiZTkyNjk4ODkzMTIzODhiZmVjNmE5ZGRmNDFiZjhmZTMxYjY4YmNmOWM4
MjM5ZGIzNWNkMzhmNDExIgogCiBpbmhlcml0IHNldHVwdG9vbHMzIHB5cGkKIAotLSAKMi40Mi4w
Cgo=

--===============0762226275480174947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-beartype: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.17.2.tar.gz;downloadfilename=beartype-0.17.2.tar.gz" to "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.18.2.tar.gz;downloadfilename=beartype-0.18.2.tar.gz"
packages/core2-64-poky-linux/python3-beartype: PV changed from "0.17.2" to "0.18.2"
packages/core2-64-poky-linux/python3-beartype: PKGV changed from 0.17.2 [default] to 0.18.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PV changed from "0.17.2" to "0.18.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PKGV changed from 0.17.2 [default] to 0.18.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PV changed from "0.17.2" to "0.18.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PKGV changed from 0.17.2 [default] to 0.18.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PV changed from "0.17.2" to "0.18.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PKGV changed from 0.17.2 [default] to 0.18.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PV changed from "0.17.2" to "0.18.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PKGV changed from 0.17.2 [default] to 0.18.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PV changed from "0.17.2" to "0.18.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PKGV changed from 0.17.2 [default] to 0.18.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PV changed from "0.17.2" to "0.18.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PKGV changed from 0.17.2 [default] to 0.18.2 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.12/site-packages/beartype-0.17.2.dist-info -> /usr/lib/python3.12/site-packages/beartype-0.18.2.dist-info, removed "/usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/codesnip.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorget.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorraise.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/claw/__pycache__/_clawtyping.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/_errorsequence.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/_clawastmunge.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/_errorgeneric.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error
 /_pep/_errorpep586.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/__pycache__/_clawastmunge.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585arg.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/errorutilcolor.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__pycache__/utilbeartypefunc.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep593.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep586.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/fu
 nc/mod/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/_errorsequence.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/mod/utilbeartypefunc.py /usr/lib/python3.12/site-packages/beartype/_util/text/utiltextmagic.py /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585arg.py /usr/lib/python3.12/site-packages/beartype/door/__pycache__/_doortyping.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/door/_doortyping.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep593.py /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorraise.py /usr/lib/python3.12/site-packages/beartype/claw/_clawtyping.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/_errornoreturn.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__init__.py /usr/lib/python3.12/site-packages/beartype/_util/error/utile
 rrorget.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/_errorgeneric.py /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/errorutiltext.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep484604union.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/text/__pycache__/utiltextmagic.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__pycache__/utilfuncmodtest.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/codesnip.py /usr/lib/python3.12/site-packages/beartype/_check/error/_util/errorutilcolor.py /usr/lib/python3.12/site-packages/beartype/_util/
 func/mod/utilfuncmodtest.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep484604union.py /usr/lib/python3.12/site-packages/beartype/_check/error/_util/errorutiltext.py", added "/usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/errornoreturn.py /usr/lib/python3.12/site-packages/beartype/_data/error/__pycache__/dataerrmagic.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrraise.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wrapargs.py /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wraputil.py /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wrapargs.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrget.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_data/func/datafunccodeobj.py /usr/lib/python
 3.12/site-packages/beartype/_check/error/_pep/pep484585/errorgeneric.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errorsequence.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/snip/codesnipcls.py /usr/lib/python3.12/site-packages/beartype/_check/code/snip/codesnipstr.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/_clawastutil.py /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/__pycache__/errornoreturn.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrwarn.py /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__init__.py /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrtest.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrwarn.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code
 /snip/__pycache__/codesnipcls.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/errorpep484604union.py /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrtest.py /usr/lib/python3.12/site-packages/beartype/_util/func/module/utilfuncmodbear.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errormapping.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errorgeneric.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep613.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/errorpep593.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/errorpep586.py /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/utilpep613.py /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrget.py /usr/lib/python3.12/site-packages/beartype/claw/_ast/__pycache__/_clawastutil.cpython
 -312.pyc /usr/lib/python3.12/site-packages/beartype/_data/code/datacodeindent.py /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wrapreturn.py /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__/utilfuncmodbear.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__/utilfuncmodtest.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/module/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/errorpep484604union.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_util/func/module/utilfuncmodtest.py /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/errormapping.py /usr/lib/python3.12/site-packages/beartype/_data/code/datacodemagic.py /usr/lib/pyth
 on3.12/site-packages/beartype/_decor/wrap/__pycache__/_wrapreturn.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wraputil.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_data/error/__init__.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/__init__.py /usr/lib/python3.12/site-packages/beartype/_data/error/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/errorpep586.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/errorpep593.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_data/code/__init__.py /usr/lib/python3.12/site-packages/beartype/_data/error/dataerrmagic.py /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/errorsequence.py /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrraise.py /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__/__init__.cpython-31
 2.pyc /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__/datacodemagic.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__/datacodeindent.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__init__.py /usr/lib/python3.12/site-packages/beartype/_data/func/__pycache__/datafunccodeobj.cpython-312.pyc /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__pycache__/codesnipstr.cpython-312.pyc"
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGSIZE changed from 4479601 to 4674743 (+4%)
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PV changed from "0.17.2" to "0.18.2"
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGV changed from 0.17.2 [default] to 0.18.2 [default]
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.12/site-packages/beartype-0.17.2.dist-info moved to /usr/lib/python3.12/site-packages/beartype-0.18.2.dist-info
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/codesnipcls.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/codesnipstr.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__pycache__/codesnipcls.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__pycache__/codesnipstr.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/snip/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/errorpep484604union.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/errorpep586.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/errorpep593.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484 was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585 was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/errorgeneric.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/errormapping.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/errorsequence.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errorgeneric.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errormapping.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errorsequence.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/errornoreturn.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/__pycache__/errornoreturn.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/pep484/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/errorpep484604union.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/errorpep586.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/errorpep593.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/_clawastutil.py was added
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/__pycache__/_clawastutil.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/code was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/datacodeindent.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/datacodemagic.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__/datacodeindent.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__/datacodemagic.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/code/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/error was added
  /usr/lib/python3.12/site-packages/beartype/_data/error/dataerrmagic.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/error/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/error/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_data/error/__pycache__/dataerrmagic.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/error/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_data/func/datafunccodeobj.py was added
  /usr/lib/python3.12/site-packages/beartype/_data/func/__pycache__/datafunccodeobj.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wrapargs.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wrapreturn.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/__pycache__/_wraputil.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wrapargs.py was added
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wrapreturn.py was added
  /usr/lib/python3.12/site-packages/beartype/_decor/wrap/_wraputil.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrget.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrraise.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrtest.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrwarn.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrget.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrraise.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrtest.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrwarn.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/__init__.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__ was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__/utilfuncmodbear.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/__pycache__/utilfuncmodtest.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/utilfuncmodbear.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/func/module/utilfuncmodtest.py was added
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/__pycache__/utilpep613.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/utilpep613.py was added
  /usr/lib/python3.12/site-packages/beartype/_check/code/codesnip.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/code/__pycache__/codesnip.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep484604union.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep586.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_errorpep593.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484 was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585 was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/_errorgeneric.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/_errorsequence.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/_errorgeneric.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/_errorsequence.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484585/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/_errornoreturn.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/_errornoreturn.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/_pep484/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep484604union.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep586.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_pep/__pycache__/_errorpep593.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/errorutilcolor.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/errorutiltext.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/errorutilcolor.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/errorutiltext.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_check/error/_util/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/_clawastmunge.py was removed
  /usr/lib/python3.12/site-packages/beartype/claw/_ast/__pycache__/_clawastmunge.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/claw/_clawtyping.py was removed
  /usr/lib/python3.12/site-packages/beartype/claw/__pycache__/_clawtyping.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/door/_doortyping.py was removed
  /usr/lib/python3.12/site-packages/beartype/door/__pycache__/_doortyping.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorget.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/error/__pycache__/utilerrorraise.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorget.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/error/utilerrorraise.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__init__.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__pycache__ was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__pycache__/__init__.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__pycache__/utilbeartypefunc.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/__pycache__/utilfuncmodtest.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/utilbeartypefunc.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/func/mod/utilfuncmodtest.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/utilpep484585arg.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/hint/pep/proposal/pep484585/utilpep484585arg.py was removed
  /usr/lib/python3.12/site-packages/beartype/_util/text/__pycache__/utiltextmagic.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/beartype/_util/text/utiltextmagic.py was removed

--===============0762226275480174947==--

