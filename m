Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE831C636D6
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:44 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.10287.1676508396650535077
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=hp5+fSb9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018657aff859-a855f46e-1a76-45dd-81cc-5a0c29230692-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508395;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=8XGia7ihCIDNVM3ComwyqTbWxib3SPnUaU4DHkoz1Vk=;
	b=hp5+fSb9QOIbxobeqX2XUOtF06mQMqJiRmNm6DAwdPOUvP7ayoQlKaYMaVVzilry
	eQqLKn5gp3/DJ6/c3B9XAx8qRR6y4tB0E4OwfE3xIO56+lJKHIe8dLsyInDAkxt4S5k
	sxYUQbLRQ7Rm2dZ3Ktmpn+/VmGeNkmW3Eiuj8FKk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508395;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=8XGia7ihCIDNVM3ComwyqTbWxib3SPnUaU4DHkoz1Vk=;
	b=M81MaZrCSTDR4cpYIY989Gz8/JtW5kz55y8r0zqHeDJtuoDniUkG22R7j0mwDnk0
	detyj5BkaR0t1zqGQTbq35AtOekti307bbRC9mZMSo1fCVztkD4PoJX+PdhsoVGOdh8
	2nfIXblDpJR2AvtA891ZSEJTPJGwrctzZiCBShIU=
Content-Type: multipart/mixed; boundary="===============6328239337511347061=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] log4cplus: upgrading to 2.1.0 SUCCEEDED
Message-ID: <0101018657aff859-a855f46e-1a76-45dd-81cc-5a0c29230692-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177237

--===============6328239337511347061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *log4cplus* to *2.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-log4cplus-upgrade-2.0.8-2.1.0.patch
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
--===============6328239337511347061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/log4cplus: PKGV changed from 2.0.8 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/log4cplus: SRC_URI changed from "https://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/2.0.8/log4cplus-2.0.8.tar.gz" to "https://downloads.sourceforge.net/project/log4cplus/log4cplus-stable/2.1.0/log4cplus-2.1.0.tar.gz"
packages/core2-32-poky-linux/log4cplus: PV changed from "2.0.8" to "2.1.0"
packages/core2-32-poky-linux/log4cplus/log4cplus-dbg: PKGV changed from 2.0.8 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus-dbg: FILELIST: removed "/usr/lib/.debug/liblog4cplusU-2.0.so.3.4.7 /usr/lib/.debug/liblog4cplus-2.0.so.3.4.7", added "/usr/lib/.debug/liblog4cplusU-2.1.so.9.0.0 /usr/lib/.debug/liblog4cplus-2.1.so.9.0.0"
packages/core2-32-poky-linux/log4cplus/log4cplus-dbg: PKGSIZE changed from 15067968 to 15280036 (+1%)
packages/core2-32-poky-linux/log4cplus/log4cplus-dbg: PV changed from "2.0.8" to "2.1.0"
packages/core2-32-poky-linux/log4cplus/log4cplus-dev: PKGV changed from 2.0.8 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus-dev: FILELIST: added "/usr/include/log4cplus/exception.h"
packages/core2-32-poky-linux/log4cplus/log4cplus-dev: PKGSIZE changed from 376078 to 379482 (+1%)
packages/core2-32-poky-linux/log4cplus/log4cplus-dev: PV changed from "2.0.8" to "2.1.0"
packages/core2-32-poky-linux/log4cplus/log4cplus-doc: PKGV changed from 2.0.8 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus-doc: PV changed from "2.0.8" to "2.1.0"
packages/core2-32-poky-linux/log4cplus/log4cplus-locale: PKGV changed from 2.0.8 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus-locale: PV changed from "2.0.8" to "2.1.0"
packages/core2-32-poky-linux/log4cplus/log4cplus-src: PKGV changed from 2.0.8 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus-src: FILELIST: directory renamed /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/thread -> /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/thread, directory renamed /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/internal -> /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/internal, directory renamed /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/helpers -> /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/helpers, directory renamed /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/spi -> /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/spi, directory renamed /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/thread/impl -> /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/thread/impl, directory renamed /usr/src/debug/log4cplus/2.0.8-r0/threadpool -> /usr/src/debug/log4cplus/2.1.0-r0/threadpool, removed "/usr/src/debug/log4cplus/2.0.8-r0/src/appender.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/snprintf.cxx /
 usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/nullappender.h /usr/src/debug/log4cplus/2.0.8-r0/src/hierarchylocker.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/layout.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/filter.cxx /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/callbackappender.h /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/clogger.h /usr/src/debug/log4cplus/2.0.8-r0/src/syncprims.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/loggingevent.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/log4judpappender.cxx /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/log4judpappender.h /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/loglevel.h /usr/src/debug/log4cplus/2.0.8-r0/src/lockfile.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/appenderattachableimpl.cxx /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/asyncappender.h /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/consoleappender.h /usr/src/debug/log4cplus/2.0.8-r0/src/fileappender.cxx /usr/src/debug/log4cplus/2.0.8-r0
 /src/nullappender.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/mdc.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/ndc.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/socket.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/callbackappender.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/configurator.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/asyncappender.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/consoleappender.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/env.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/rootlogger.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/socket-unix.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/loggerimpl.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/clogger.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/global-init.cxx /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/tchar.h /usr/src/debug/log4cplus/2.0.8-r0/src/fileinfo.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/hierarchy.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/pointer.cxx /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/configurator.h /usr/src/debug/l
 og4cplus/2.0.8-r0/src/queue.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/patternlayout.cxx /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/fstreams.h /usr/src/debug/log4cplus/2.0.8-r0/src/property.cxx /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/streams.h /usr/src/debug/log4cplus/2.0.8-r0/src/syslogappender.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/loglog.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/loggingmacros.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/threads.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/version.cxx /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/version.h /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/hierarchy.h /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/socketappender.h /usr/src/debug/log4cplus/2.0.8-r0/src/stringhelper.cxx /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/mdc.h /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/hierarchylocker.h /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/initializer.h /usr/src/debug/log4cplus/2.
 0.8-r0/include/log4cplus/layout.h /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/appender.h /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/ndc.h /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/syslogappender.h /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/tstring.h /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/logger.h /usr/src/debug/log4cplus/2.0.8-r0/src/factory.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/loglevel.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/connectorthread.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/objectregistry.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/socketappender.cxx /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/fileappender.h /usr/src/debug/log4cplus/2.0.8-r0/src/socketbuffer.cxx /usr/src/debug/log4cplus/2.0.8-r0/src/logger.cxx /usr/src/debug/log4cplus/2.0.8-r0/include/log4cplus/config.hxx /usr/src/debug/log4cplus/2.0.8-r0/src/timehelper.cxx", added "/usr/src/debug/log4cplus/2.1.0-r0/src/appender.cxx /usr/src/debug/log4cplus/2.1.0
 -r0/src/snprintf.cxx /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/fileappender.h /usr/src/debug/log4cplus/2.1.0-r0/src/hierarchylocker.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/layout.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/filter.cxx /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/callbackappender.h /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/clogger.h /usr/src/debug/log4cplus/2.1.0-r0/src/syncprims.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/loggingevent.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/log4judpappender.cxx /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/log4judpappender.h /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/loglevel.h /usr/src/debug/log4cplus/2.1.0-r0/src/lockfile.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/appenderattachableimpl.cxx /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/asyncappender.h /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/consoleappender.h /usr/src/debug/log4cplus/2.1.0-r0/src/fileappender.cxx /usr/src/de
 bug/log4cplus/2.1.0-r0/src/nullappender.cxx /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/exception.h /usr/src/debug/log4cplus/2.1.0-r0/src/mdc.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/ndc.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/socket.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/callbackappender.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/configurator.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/asyncappender.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/consoleappender.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/env.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/rootlogger.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/socket-unix.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/loggerimpl.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/clogger.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/global-init.cxx /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/tchar.h /usr/src/debug/log4cplus/2.1.0-r0/src/fileinfo.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/hierarchy.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/pointer.c
 xx /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/configurator.h /usr/src/debug/log4cplus/2.1.0-r0/src/queue.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/patternlayout.cxx /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/fstreams.h /usr/src/debug/log4cplus/2.1.0-r0/src/property.cxx /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/streams.h /usr/src/debug/log4cplus/2.1.0-r0/src/syslogappender.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/loglog.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/loggingmacros.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/threads.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/version.cxx /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/version.h /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/hierarchy.h /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/socketappender.h /usr/src/debug/log4cplus/2.1.0-r0/src/stringhelper.cxx /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/mdc.h /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/hierarchylocker.h /usr/sr
 c/debug/log4cplus/2.1.0-r0/include/log4cplus/initializer.h /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/layout.h /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/appender.h /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/ndc.h /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/syslogappender.h /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/tstring.h /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/logger.h /usr/src/debug/log4cplus/2.1.0-r0/src/exception.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/factory.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/connectorthread.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/loglevel.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/objectregistry.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/socketappender.cxx /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/nullappender.h /usr/src/debug/log4cplus/2.1.0-r0/src/socketbuffer.cxx /usr/src/debug/log4cplus/2.1.0-r0/src/logger.cxx /usr/src/debug/log4cplus/2.1.0-r0/include/log4cplus/config.hxx /usr/
 src/debug/log4cplus/2.1.0-r0/src/timehelper.cxx"
packages/core2-32-poky-linux/log4cplus/log4cplus-src: PKGSIZE changed from 709906 to 717388 (+1%)
packages/core2-32-poky-linux/log4cplus/log4cplus-src: PV changed from "2.0.8" to "2.1.0"
packages/core2-32-poky-linux/log4cplus/log4cplus-staticdev: PKGV changed from 2.0.8 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus-staticdev: PV changed from "2.0.8" to "2.1.0"
packages/core2-32-poky-linux/log4cplus/log4cplus: PKGV changed from 2.0.8 [default] to 2.1.0 [default]
packages/core2-32-poky-linux/log4cplus/log4cplus: FILELIST: removed "/usr/lib/liblog4cplusU-2.0.so.3 /usr/lib/liblog4cplus-2.0.so.3.4.7 /usr/lib/liblog4cplusU-2.0.so.3.4.7 /usr/lib/liblog4cplus-2.0.so.3", added "/usr/lib/liblog4cplus-2.1.so.9.0.0 /usr/lib/liblog4cplus-2.1.so.9 /usr/lib/liblog4cplusU-2.1.so.9.0.0 /usr/lib/liblog4cplusU-2.1.so.9"
packages/core2-32-poky-linux/log4cplus/log4cplus: PKGSIZE changed from 1223635 to 1235923 (+1%)
packages/core2-32-poky-linux/log4cplus/log4cplus: PV changed from "2.0.8" to "2.1.0"
Changes to packages/core2-32-poky-linux/log4cplus (sysroot):
  /usr/lib/liblog4cplus.so changed symlink target from liblog4cplus-2.0.so.3.4.7 to liblog4cplus-2.1.so.9.0.0
  /usr/lib/liblog4cplusU.so changed symlink target from liblog4cplusU-2.0.so.3.4.7 to liblog4cplusU-2.1.so.9.0.0
  /usr/lib/liblog4cplus-2.0.so.3.4.7 moved to /usr/lib/liblog4cplus-2.1.so.9.0.0
  /usr/lib/liblog4cplus-2.0.so.3 moved to /usr/lib/liblog4cplus-2.1.so.9
  /usr/lib/liblog4cplusU-2.0.so.3.4.7 moved to /usr/lib/liblog4cplusU-2.1.so.9.0.0
  /usr/lib/liblog4cplusU-2.0.so.3 moved to /usr/lib/liblog4cplusU-2.1.so.9
  /usr/include/log4cplus/exception.h was added

--===============6328239337511347061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/log4cplus/log4cplus-dev: FILELIST: added "/usr/include/log4cplus/exception.h"
packages/core2-32-poky-linux/log4cplus/log4cplus: FILELIST: removed "/usr/lib/liblog4cplusU-2.0.so.3.4.7 /usr/lib/liblog4cplus-2.0.so.3.4.7 /usr/lib/liblog4cplusU-2.0.so.3 /usr/lib/liblog4cplus-2.0.so.3", added "/usr/lib/liblog4cplus-2.1.so.9 /usr/lib/liblog4cplus-2.1.so.9.0.0 /usr/lib/liblog4cplusU-2.1.so.9 /usr/lib/liblog4cplusU-2.1.so.9.0.0"
Changes to packages/core2-32-poky-linux/log4cplus (sysroot):
  /usr/lib/liblog4cplus.so changed symlink target from liblog4cplus-2.0.so.3.4.7 to liblog4cplus-2.1.so.9.0.0
  /usr/lib/liblog4cplusU.so changed symlink target from liblog4cplusU-2.0.so.3.4.7 to liblog4cplusU-2.1.so.9.0.0
  /usr/lib/liblog4cplus-2.0.so.3.4.7 moved to /usr/lib/liblog4cplus-2.1.so.9.0.0
  /usr/lib/liblog4cplus-2.0.so.3 moved to /usr/lib/liblog4cplus-2.1.so.9
  /usr/lib/liblog4cplusU-2.0.so.3.4.7 moved to /usr/lib/liblog4cplusU-2.1.so.9.0.0
  /usr/lib/liblog4cplusU-2.0.so.3 moved to /usr/lib/liblog4cplusU-2.1.so.9
  /usr/include/log4cplus/exception.h was added

--===============6328239337511347061==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-log4cplus-upgrade-2.0.8-2.1.0.patch"

RnJvbSA2MmI5NjRjYWM0YmFjM2Y4ODc5M2IzNWFjMmNkNzc0NWZjY2VhZThkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTU6MTM6MzIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
b2c0Y3BsdXM6IHVwZ3JhZGUgMi4wLjggLT4gMi4xLjAKCi0tLQogLi4uL2xvZzRjcGx1cy97bG9n
NGNwbHVzXzIuMC44LmJiID0+IGxvZzRjcGx1c18yLjEuMC5iYn0gICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2xvZzRjcGx1cy97bG9nNGNwbHVzXzIuMC44LmJiID0+IGxvZzRjcGx1
c18yLjEuMC5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvbG9n
NGNwbHVzL2xvZzRjcGx1c18yLjAuOC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sb2c0Y3Bs
dXMvbG9nNGNwbHVzXzIuMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9sb2c0Y3BsdXMvbG9nNGNwbHVzXzIuMC44LmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvbG9nNGNwbHVzL2xvZzRjcGx1c18yLjEuMC5iYgppbmRl
eCBiYmY0Y2U2MjE4Li5lMGMxNmQyZTczIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbG9nNGNwbHVzL2xvZzRjcGx1c18yLjAuOC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvbG9nNGNwbHVzL2xvZzRjcGx1c18yLjEuMC5iYgpAQCAtOSw3ICs5LDcgQEAgTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9NDFlOGUwNjBjMjY4MjI4ODZiNTkyYWI0NzY1
Yzc1NmIiCiAKIFNSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9NSVJST1J9L3Byb2plY3QvJHtCUE59
LyR7QlBOfS1zdGFibGUvJHtQVn0vJHtCUH0udGFyLmd6IFwKICAgICAgICAgICAiCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiY2RjM2M3MzhlMDBiZTg0ZDhkMDNiNTgwODE2YjlmMTI2MjhlY2MxZDcx
ZTEzOTUwODBjODAyNjE1ZDJkOWNlZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyYThlYjk5ZDcx
YjA2ODBjMDUyMGM3YzE2MjQ4Y2RiNDE5NWRhODJmMzk2Yjc5ZmVhMzBiMGQ5ZTI4OWM4YzcyIgog
CiBVUFNUUkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly9zb3VyY2Vmb3JnZS5uZXQvcHJvamVjdHMv
bG9nNGNwbHVzL2ZpbGVzL2xvZzRjcGx1cy1zdGFibGUvIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVgg
PSAibG9nNGNwbHVzLXN0YWJsZS8oP1A8cHZlcj5cZCsoXC5cZCspKykvIgotLSAKMi4zNy4zCgo=

--===============6328239337511347061==--

