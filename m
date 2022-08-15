Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24CB6C32796
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 18:57:03 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.6458.1660589820502485010
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 11:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ai5tK4iO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 01010182a2ddcf52-f584a2c5-d8bb-4532-9852-6348d8910ac5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1660589822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K+vocSxUKeZyE6jxtJO6ioQp39W1e3RWxQLpcWIWc4c=;
	b=ai5tK4iO+zmVe+/oStAlSXYo9jz48BguhDzaTrkjiaNtBAA5fvN+GtbjOqeSS1A6
	nXrcJNxser7mWhawlg3VcWh87lz3kKGtL/MnxPI0aKV5ZRnMvNn9oFpestoJSZLNI5x
	XRwksirmKwR3wCNnypx3n6jwQL5Lr0dB1MQZ6IgU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1660589822;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K+vocSxUKeZyE6jxtJO6ioQp39W1e3RWxQLpcWIWc4c=;
	b=HQ1KvcVtcHYv+L47ir6wCIN+DDpo7uMX6ucHAb3Fr5y11J/xrf02Uo/+XNKEj2sR
	omc/TUIyvk05T7YerrihA1Y+17+t6cmTcmZeZrL/x7+Kb0s5HCFf+RGJRCfALxGISP1
	tnxZGziSBXBZCJsgcmpG2WeDhuW3x/gGJg/9Bzm8=
Content-Type: multipart/mixed; boundary="===============1711451472901366354=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gpgme: upgrading to 1.18.0 SUCCEEDED
Message-ID: 
 <01010182a2ddcf52-f584a2c5-d8bb-4532-9852-6348d8910ac5-000000@us-west-2.amazonses.com>
Date: Mon, 15 Aug 2022 18:57:02 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Aug 2022 18:57:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169402

--===============1711451472901366354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gpgme* to *1.18.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gpgme-upgrade-1.17.1-1.18.0.patch
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
--===============1711451472901366354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gpgme/gpgme-cpp: PKGSIZE changed from 402856 to 423336 (+5%)
packages/core2-32-poky-linux/gpgme/gpgme-cpp: PV changed from "1.17.1" to "1.18.0"
packages/core2-32-poky-linux/gpgme/gpgme-cpp: PKGV changed from 1.17.1 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme-cpp: FILELIST: removed "/usr/lib/libgpgmepp.so.6.14.0", added "/usr/lib/libgpgmepp.so.6.15.0"
packages/core2-32-poky-linux/gpgme/gpgme-dbg: PKGSIZE changed from 8945996 to 9198000 (+3%)
packages/core2-32-poky-linux/gpgme/gpgme-dbg: PV changed from "1.17.1" to "1.18.0"
packages/core2-32-poky-linux/gpgme/gpgme-dbg: PKGV changed from 1.17.1 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme-dbg: FILELIST: removed "/usr/lib/.debug/libgpgmepp.so.6.14.0 /usr/lib/.debug/libgpgme.so.11.26.0", added "/usr/lib/.debug/libgpgmepp.so.6.15.0 /usr/lib/.debug/libgpgme.so.11.27.0"
packages/core2-32-poky-linux/gpgme/gpgme-dev: PKGSIZE changed from 250437 to 253838 (+1%)
packages/core2-32-poky-linux/gpgme/gpgme-dev: PV changed from "1.17.1" to "1.18.0"
packages/core2-32-poky-linux/gpgme/gpgme-dev: PKGV changed from 1.17.1 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme-dev: FILELIST: added "/usr/include/gpgme++/gpgrevokekeyeditinteractor.h"
packages/core2-32-poky-linux/gpgme/gpgme-doc: PKGSIZE changed from 466346 to 466681 (+0%)
packages/core2-32-poky-linux/gpgme/gpgme-doc: PV changed from "1.17.1" to "1.18.0"
packages/core2-32-poky-linux/gpgme/gpgme-doc: PKGV changed from 1.17.1 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme-locale: PV changed from "1.17.1" to "1.18.0"
packages/core2-32-poky-linux/gpgme/gpgme-locale: PKGV changed from 1.17.1 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme-src: PKGSIZE changed from 3524895 to 3546434 (+1%)
packages/core2-32-poky-linux/gpgme/gpgme-src: PV changed from "1.17.1" to "1.18.0"
packages/core2-32-poky-linux/gpgme/gpgme-src: PKGV changed from 1.17.1 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme-src: FILELIST: directory renamed /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/src -> /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/src, directory renamed /usr/src/debug/gpgme/1.17.1-r0/build/lang/python/python3-gpg -> /usr/src/debug/gpgme/1.18.0-r0/build/lang/python/python3-gpg, directory renamed /usr/src/debug/gpgme/1.17.1-r0/build/src -> /usr/src/debug/gpgme/1.18.0-r0/build/src, directory renamed /usr/src/debug/gpgme/1.17.1-r0/build/lang/python -> /usr/src/debug/gpgme/1.18.0-r0/build/lang/python, directory renamed /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/interfaces -> /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/interfaces, removed "/usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/keylistresult.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/gpgaddexistingsubkeyeditinteractor.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/statusconsumerassuantransaction.cpp /usr/src/debug/gpgme/1.17.1-r
 0/gpgme-1.17.1/lang/cpp/src/gpggencardkeyinteractor.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/callbacks.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/key.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/keygenerationresult.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/error.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/encryptionresult.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/gpgsetexpirytimeeditinteractor.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/keylistresult.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/scdgetinfoassuantransaction.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/util.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/trustitem.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/vfsmountresult.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/gpgsignkeyeditinteractor.h /usr/src/debug/gpgme/1.17.1-r0/gpgme
 -1.17.1/lang/cpp/src/gpgsignkeyeditinteractor.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/engineinfo.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/configuration.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/exception.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/util.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/eventloopinteractor.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/swdbresult.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/decryptionresult.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/importresult.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/signingresult.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/statusconsumerassuantransaction.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/swdbresult.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/gpgsetownertrusteditinteractor.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.
 1/lang/cpp/src/gpgsetexpirytimeeditinteractor.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/eventloopinteractor.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/gpgadduserideditinteractor.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/defaultassuantransaction.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/signingresult.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/decryptionresult.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/context.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/gpgsetownertrusteditinteractor.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/context_p.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/defaultassuantransaction.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/result.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/importresult.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/editinteractor.h /usr/src/debug/gp
 gme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/encryptionresult.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/tofuinfo.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/gpggencardkeyinteractor.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/keygenerationresult.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/exception.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/trustitem.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/data.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/engineinfo.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/verificationresult.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/context_vanilla.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/gpgaddexistingsubkeyeditinteractor.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/editinteractor.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/configuration.h /usr/src/debug/gpgme/1.17.1-r0
 /gpgme-1.17.1/lang/cpp/src/data_p.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/key.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/notation.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/gpgagentgetinfoassuantransaction.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/scdgetinfoassuantransaction.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/data.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/callbacks.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/gpgadduserideditinteractor.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/gpgagentgetinfoassuantransaction.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/gpgmefw.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/global.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/vfsmountresult.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/verificationresult.cpp /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1
 /lang/cpp/src/context.h /usr/src/debug/gpgme/1.17.1-r0/gpgme-1.17.1/lang/cpp/src/tofuinfo.cpp", added "/usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpgagentgetinfoassuantransaction.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/configuration.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/data.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/verificationresult.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/editinteractor.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpgsignkeyeditinteractor.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpgsetexpirytimeeditinteractor.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/keygenerationresult.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/vfsmountresult.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpgsetownertrusteditinteractor.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/signingresult.h /usr/src/de
 bug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/scdgetinfoassuantransaction.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/encryptionresult.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/eventloopinteractor.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/notation.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpgaddexistingsubkeyeditinteractor.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/statusconsumerassuantransaction.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpgsignkeyeditinteractor.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpggencardkeyinteractor.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/keylistresult.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/context.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/trustitem.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/keygenerationresult.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/c
 pp/src/gpgadduserideditinteractor.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpggencardkeyinteractor.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/scdgetinfoassuantransaction.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/signingresult.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/trustitem.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/result.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpgadduserideditinteractor.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/defaultassuantransaction.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/importresult.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/defaultassuantransaction.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/callbacks.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/context_vanilla.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/error.h /usr/src/debug/gpgme/1.18.0-r0/g
 pgme-1.18.0/lang/cpp/src/gpgsetownertrusteditinteractor.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/key.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/util.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/context_p.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/configuration.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/data.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/eventloopinteractor.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/tofuinfo.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/engineinfo.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/tofuinfo.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/encryptionresult.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/data_p.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/exception.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/exception.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgm
 e-1.18.0/lang/cpp/src/gpgmefw.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpgrevokekeyeditinteractor.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/decryptionresult.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/importresult.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/engineinfo.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/verificationresult.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpgagentgetinfoassuantransaction.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/decryptionresult.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/keylistresult.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpgsetexpirytimeeditinteractor.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/key.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/swdbresult.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/editinteractor.cpp /usr/src/debug/gpgme/1.18.0-r0/
 gpgme-1.18.0/lang/cpp/src/callbacks.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/global.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/swdbresult.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/context.h /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/util.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/statusconsumerassuantransaction.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpgaddexistingsubkeyeditinteractor.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/vfsmountresult.cpp /usr/src/debug/gpgme/1.18.0-r0/gpgme-1.18.0/lang/cpp/src/gpgrevokekeyeditinteractor.cpp"
packages/core2-32-poky-linux/gpgme/gpgme-staticdev: PV changed from "1.17.1" to "1.18.0"
packages/core2-32-poky-linux/gpgme/gpgme-staticdev: PKGV changed from 1.17.1 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme: PV changed from "1.17.1" to "1.18.0"
packages/core2-32-poky-linux/gpgme/gpgme: PKGV changed from 1.17.1 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.11.26.0", added "/usr/lib/libgpgme.so.11.27.0"
packages/core2-32-poky-linux/gpgme: SRC_URI changed from "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.17.1.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch file://0003-Correctly-install-python-modules.patch file://0004-python-import.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib-directories-in-.patch file://0006-fix-build-path-issue.patch file://0007-python-Add-variables-to-tests.patch file://0008-do-not-auto-check-var-PYTHON.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch" to "https://www.gnupg.org/ftp/gcrypt/gpgme/gpgme-1.18.0.tar.bz2 file://0001-Revert-build-Make-gpgme.m4-use-gpgrt-config-with-.pc.patch file://0001-pkgconfig.patch file://0002-gpgme-lang-python-gpg-error-config-should-not-be-use.patch file://0003-Correctly-install-python-modules.patch file://0004-python-import.patch file://0005-gpgme-config-skip-all-lib-or-usr-lib
 -directories-in-.patch file://0006-fix-build-path-issue.patch file://0007-python-Add-variables-to-tests.patch file://0008-do-not-auto-check-var-PYTHON.patch file://0001-use-closefrom-on-linux-and-glibc-2.34.patch"
packages/core2-32-poky-linux/gpgme: PV changed from "1.17.1" to "1.18.0"
packages/core2-32-poky-linux/gpgme: PKGV changed from 1.17.1 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/gpgme/python3-gpg: PKGSIZE changed from 1368390 to 1369006 (+0%)
packages/core2-32-poky-linux/gpgme/python3-gpg: PV changed from "1.17.1" to "1.18.0"
packages/core2-32-poky-linux/gpgme/python3-gpg: PKGV changed from 1.17.1 [default] to 1.18.0 [default]
packages/core2-32-poky-linux/gpgme/python3-gpg: FILELIST: removed "/usr/lib/python3.10/site-packages/gpg-1.17.1_unknown-py3.10.egg-info", added "/usr/lib/python3.10/site-packages/gpg-1.18.0_unknown-py3.10.egg-info"
Changes to packages/core2-32-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgmepp.so.6 changed symlink target from libgpgmepp.so.6.14.0 to libgpgmepp.so.6.15.0
  /usr/lib/libgpgmepp.so changed symlink target from libgpgmepp.so.6.14.0 to libgpgmepp.so.6.15.0
  /usr/lib/libgpgme.so.11 changed symlink target from libgpgme.so.11.26.0 to libgpgme.so.11.27.0
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.11.26.0 to libgpgme.so.11.27.0
  /usr/lib/libgpgmepp.so.6.14.0 moved to /usr/lib/libgpgmepp.so.6.15.0
  /usr/lib/libgpgme.so.11.26.0 moved to /usr/lib/libgpgme.so.11.27.0
  /usr/lib/python3.10/site-packages/gpg-1.17.1_unknown-py3.10.egg-info moved to /usr/lib/python3.10/site-packages/gpg-1.18.0_unknown-py3.10.egg-info
  /usr/include/gpgme++/gpgrevokekeyeditinteractor.h was added

--===============1711451472901366354==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gpgme-upgrade-1.17.1-1.18.0.patch"

RnJvbSA5NTVlNTFmYTZmOGRlYTMyZTQ5NTU0OGFhZTFlNjhkZWFmODFkMTRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXVnIDIwMjIgMTg6NTY6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
cGdtZTogdXBncmFkZSAxLjE3LjEgLT4gMS4xOC4wCgotLS0KIC4uLi9ncGdtZS9ncGdtZS8wMDAx
LXBrZ2NvbmZpZy5wYXRjaCAgICAgICAgICAgfCAxOCArKysrKysrKy0tLS0tLS0tLS0KIC4uLi9n
cGdtZS97Z3BnbWVfMS4xNy4xLmJiID0+IGdwZ21lXzEuMTguMC5iYn0gfCAgMiArLQogMiBmaWxl
cyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1zdXBwb3J0L2dwZ21lL3tncGdtZV8xLjE3LjEuYmIgPT4gZ3BnbWVfMS4xOC4wLmJi
fSAoOTclKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lLzAw
MDEtcGtnY29uZmlnLnBhdGNoIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAw
MS1wa2djb25maWcucGF0Y2gKaW5kZXggMzVjNmI0MDU2Yy4uM2IyZjU5YzJmYyAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1wa2djb25maWcucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZ3BnbWUvZ3BnbWUvMDAwMS1wa2djb25maWcucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDk4Y2U2NTkwMmIxOTdmYWE4ZjY2MDU2NDYxM2NhMmU1
MDRjMmY4ZjggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBkN2VjNWI5OGRjNmNiZDM1
ZjU2ZGVhZWNlYzVlY2ZkYWE5NDRhZWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBS
aWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6
IEZyaSwgMTAgTWF5IDIwMTkgMTQ6MjM6NTUgKzA4MDAKIFN1YmplY3Q6IFtQQVRDSF0gcGtnY29u
ZmlnCkBAIC0xNSw2ICsxNSw3IEBAIFJlYmFzZSB0byAxLjEzLjAKIFNpZ25lZC1vZmYtYnk6IEhv
bmd4dSBKaWEgPGhvbmd4dS5qaWFAd2luZHJpdmVyLmNvbT4KIFJlYmFzZSB0byAxLjE3LjAKIFNp
Z25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+CisKIC0tLQogIGNv
bmZpZ3VyZS5hYyAgICAgICAgICAgIHwgICAxICsKICBzcmMvTWFrZWZpbGUuYW0gICAgICAgICB8
ICAgNCArLQpAQCAtMjUsMTAgKzI2LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1IDx3
YW5nbXlAZnVqaXRzdS5jb20+CiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHNyYy9ncGdtZS1wdGhyZWFk
LnBjLmluCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUuYWMgYi9jb25maWd1cmUuYWMKLWluZGV4
IDgwY2U3OWMuLmQ3YzBhYzEgMTAwNjQ0CitpbmRleCA5ZDY5NmI5Li41YjRlNzMwIDEwMDY0NAog
LS0tIGEvY29uZmlndXJlLmFjCiArKysgYi9jb25maWd1cmUuYWMKLUBAIC05MDUsNiArOTA1LDcg
QEAgQUNfQ09ORklHX0ZJTEVTKE1ha2VmaWxlIHNyYy9NYWtlZmlsZQorQEAgLTkyNiw2ICs5MjYs
NyBAQCBBQ19DT05GSUdfRklMRVMoTWFrZWZpbGUgc3JjL01ha2VmaWxlCiAgICAgICAgICAgICAg
ICAgIHNyYy9ncGdtZS1nbGliLnBjCiAgICAgICAgICAgICAgICAgIHNyYy9ncGdtZS5oKQogIEFD
X0NPTkZJR19GSUxFUyhzcmMvZ3BnbWUtY29uZmlnLCBjaG1vZCAreCBzcmMvZ3BnbWUtY29uZmln
KQpAQCAtMzcsNyArMzgsNyBAQCBpbmRleCA4MGNlNzljLi5kN2MwYWMxIDEwMDY0NAogIEFDX0NP
TkZJR19GSUxFUyhsYW5nL2NwcC90ZXN0cy9NYWtlZmlsZSkKICBBQ19DT05GSUdfRklMRVMobGFu
Zy9jcHAvc3JjL0dwZ21lcHBDb25maWctdzMyLmNtYWtlLmluKQogZGlmZiAtLWdpdCBhL3NyYy9N
YWtlZmlsZS5hbSBiL3NyYy9NYWtlZmlsZS5hbQotaW5kZXggMzljMzQxZi4uM2FjYTcxNiAxMDA2
NDQKK2luZGV4IDY3ODA1YTguLmQzOGJhMDIgMTAwNjQ0CiAtLS0gYS9zcmMvTWFrZWZpbGUuYW0K
ICsrKyBiL3NyYy9NYWtlZmlsZS5hbQogQEAgLTIwLDExICsyMCwxMSBAQApAQCAtNTIsOCArNTMs
OCBAQCBpbmRleCAzOWMzNDFmLi4zYWNhNzE2IDEwMDY0NAogLQkgICAgIGdwZ21lLnBjLmluIGdw
Z21lLWdsaWIucGMuaW4KICsJICAgICBncGdtZS5wYy5pbiBncGdtZS1nbGliLnBjLmluIGdwZ21l
LXB0aHJlYWQucGMuaW4KICAKLSBiaW5fU0NSSVBUUyA9IGdwZ21lLWNvbmZpZwotIG00ZGF0YWRp
ciA9ICQoZGF0YWRpcikvYWNsb2NhbAorIGlmIFVTRV9HUEdSVF9DT05GSUcKKyBub2luc3RfU0NS
SVBUUyA9IGdwZ21lLWNvbmZpZwogZGlmZiAtLWdpdCBhL3NyYy9ncGdtZS1wdGhyZWFkLnBjLmlu
IGIvc3JjL2dwZ21lLXB0aHJlYWQucGMuaW4KIG5ldyBmaWxlIG1vZGUgMTAwNjQ0CiBpbmRleCAw
MDAwMDAwLi4wNzRiYmY2CkBAIC03Niw3ICs3Nyw3IEBAIGluZGV4IDAwMDAwMDAuLjA3NGJiZjYK
ICtDZmxhZ3M6IC1JJHtpbmNsdWRlZGlyfQogK1JlcXVpcmVzOiBsaWJhc3N1YW4gZ3BnLWVycm9y
CiBkaWZmIC0tZ2l0IGEvc3JjL2dwZ21lLm00IGIvc3JjL2dwZ21lLm00Ci1pbmRleCA3MWIwMDEw
Li4zMGVjMTUxIDEwMDY0NAoraW5kZXggNzFiMDAxMC4uNTgyMTg5NSAxMDA2NDQKIC0tLSBhL3Ny
Yy9ncGdtZS5tNAogKysrIGIvc3JjL2dwZ21lLm00CiBAQCAtNzksNyArNzksNyBAQCBkbmwgY29u
ZmlnIHNjcmlwdCBkb2VzIG5vdCBtYXRjaCB0aGUgaG9zdCBzcGVjaWZpY2F0aW9uIHRoZSBzY3Jp
cHQKQEAgLTI4Nyw2ICsyODgsMyBAQCBpbmRleCA4MGQ1OWRlLi45MzI2NDViIDEwMDY0NAogK0Nm
bGFnczogLUkke2luY2x1ZGVkaXJ9CiArTGliczogLUwke2xpYmRpcn0gLWxncGdtZQogIFVSTDog
aHR0cHM6Ly93d3cuZ251cGcub3JnL3NvZnR3YXJlL2dwZ21lL2luZGV4Lmh0bWwKLS0tIAotMi4y
NS4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzEuMTcu
MS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzEuMTguMC5iYgpzaW1pbGFy
aXR5IGluZGV4IDk3JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdt
ZV8xLjE3LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2dwZ21lL2dwZ21lXzEu
MTguMC5iYgppbmRleCBkOTVlZDZjMjk5Li5jYTljNmNhYjE0IDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9ncGdtZS9ncGdtZV8xLjE3LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1
cHBvcnQvZ3BnbWUvZ3BnbWVfMS4xOC4wLmJiCkBAIC0yMyw3ICsyMyw3IEBAIFNSQ19VUkkgPSAi
JHtHTlVQR19NSVJST1J9L2dwZ21lLyR7QlB9LnRhci5iejIgXAogICAgICAgICAgICBmaWxlOi8v
MDAwMS11c2UtY2xvc2Vmcm9tLW9uLWxpbnV4LWFuZC1nbGliYy0yLjM0LnBhdGNoIFwKICAgICAg
ICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzExZWFiZjVkZDY2MWI5YjA0YmU5ZWRj
OWFjZTJhN2JjMDMxZjZiZDlkMzdhNzY4ZDAyZDBlZmRlZjEwOGY1ZiIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIzNjFkNGVhZTQ3Y2U5MjVkYmEwZWE1NjlhZjQwZTdiNTJjNjQ1YzRhZTJlNjVlNTYy
MWJmMWI2Y2RkOGIwZTllIgogCiBERVBFTkRTID0gImxpYmdwZy1lcnJvciBsaWJhc3N1YW4iCiBS
REVQRU5EUzoke1BOfS1jcHAgKz0gImxpYnN0ZGMrKyIKLS0gCjIuMzEuMQoK

--===============1711451472901366354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gpgme/gpgme-cpp: FILELIST: removed "/usr/lib/libgpgmepp.so.6.14.0", added "/usr/lib/libgpgmepp.so.6.15.0"
packages/core2-32-poky-linux/gpgme/gpgme-dev: FILELIST: added "/usr/include/gpgme++/gpgrevokekeyeditinteractor.h"
packages/core2-32-poky-linux/gpgme/gpgme: FILELIST: removed "/usr/lib/libgpgme.so.11.26.0", added "/usr/lib/libgpgme.so.11.27.0"
packages/core2-32-poky-linux/gpgme/python3-gpg: FILELIST: removed "/usr/lib/python3.10/site-packages/gpg-1.17.1_unknown-py3.10.egg-info", added "/usr/lib/python3.10/site-packages/gpg-1.18.0_unknown-py3.10.egg-info"
Changes to packages/core2-32-poky-linux/gpgme (sysroot):
  /usr/lib/libgpgmepp.so.6 changed symlink target from libgpgmepp.so.6.14.0 to libgpgmepp.so.6.15.0
  /usr/lib/libgpgmepp.so changed symlink target from libgpgmepp.so.6.14.0 to libgpgmepp.so.6.15.0
  /usr/lib/libgpgme.so.11 changed symlink target from libgpgme.so.11.26.0 to libgpgme.so.11.27.0
  /usr/lib/libgpgme.so changed symlink target from libgpgme.so.11.26.0 to libgpgme.so.11.27.0
  /usr/lib/libgpgmepp.so.6.14.0 moved to /usr/lib/libgpgmepp.so.6.15.0
  /usr/lib/libgpgme.so.11.26.0 moved to /usr/lib/libgpgme.so.11.27.0
  /usr/lib/python3.10/site-packages/gpg-1.17.1_unknown-py3.10.egg-info moved to /usr/lib/python3.10/site-packages/gpg-1.18.0_unknown-py3.10.egg-info
  /usr/include/gpgme++/gpgrevokekeyeditinteractor.h was added

--===============1711451472901366354==--

