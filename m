Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A59DC63716
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 00:40:39 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.857.1667349635100827342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 17:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UILz8YXN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018435c85d64-68ddb3f2-16cb-4942-84fa-3deee7809694-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EyEffL4iy9/155vfdQe57YwqEiRGpedCJnzLnhwaO3Q=;
	b=UILz8YXNfqWxy+s6krW4aCdC/TmiHxXAmri65lO8JjNj6fqD0A34pjyPrU2qn81t
	0UEfK4ZiQzXW4TypyKUrzoWujpXrEPBFwtl4MwDcgiPcz0OTpfLS+pxgAAnG9lJZPMa
	6Gb82v0ctYJaqoRbqiX4JWK7WEZ5CLHy6EJe9c3A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1667349634;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EyEffL4iy9/155vfdQe57YwqEiRGpedCJnzLnhwaO3Q=;
	b=eFhofjozi0DoeGDEKjHZ9hWlv9ONQ1AOFM1azt7e9TX70n3mk2HjOl3vCZHLyMhg
	/TNwvCHa/9zrNPRxpD68HLco/HEkgEtBXIH1UWmA6Gylw1bEUZMWX/AUs/rTor8oCHj
	xnKXJbzPMQlLX73GV1NVkvoymtwIvku5qGrPa5IY=
Content-Type: multipart/mixed; boundary="===============8407251092539144091=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] sudo: upgrading to 1.9.12 SUCCEEDED
Message-ID: <0101018435c85d64-68ddb3f2-16cb-4942-84fa-3deee7809694-000000@us-west-2.amazonses.com>
Date: Wed, 2 Nov 2022 00:40:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.11.02-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 00:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172465

--===============8407251092539144091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sudo* to *1.9.12* has Succeeded.

Next steps:
    - apply the patch: git am 0001-sudo-upgrade-1.9.11p3-1.9.12.patch
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
--===============8407251092539144091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/sudo: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo: SRC_URI changed from "https://www.sudo.ws/dist/sudo-1.9.11p3.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch" to "https://www.sudo.ws/dist/sudo-1.9.12.tar.gz file://sudo.pam file://0001-sudo.conf.in-fix-conflict-with-multilib.patch file://0001-lib-util-mksigname.c-correctly-include-header-for-ou.patch"
packages/core2-32-poky-linux/sudo/sudo-dbg: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-dbg: FILELIST: removed "/usr/lib/sudo/.debug/sample_approval.so"
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-dbg: PKGSIZE changed from 4164100 to 4255796 (+2%)
packages/core2-32-poky-linux/sudo/sudo-dev: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-dev: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-dev: PKGSIZE changed from 11939 to 11970 (+0%)
packages/core2-32-poky-linux/sudo/sudo-doc: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-doc: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-doc: PKGSIZE changed from 2894085 to 2971377 (+3%)
packages/core2-32-poky-linux/sudo/sudo-lib: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-lib: FILELIST: removed "/usr/lib/sudo/sample_approval.so"
packages/core2-32-poky-linux/sudo/sudo-lib: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-lib: PKGSIZE changed from 969568 to 980668 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-ast: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-ca: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-cs: PKGSIZE changed from 99969 to 100629 (+1%)
packages/core2-32-poky-linux/sudo/sudo-locale-da: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-da: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-de: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-de: PKGSIZE changed from 104520 to 106667 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-el: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-el: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-eo: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-es: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-es: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-eu: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fa: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-fa: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-fi: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-fr: PKGSIZE changed from 108759 to 110986 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-fur: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-gl: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-hr: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-hu: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-it: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-it: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ja: PKGSIZE changed from 113415 to 116127 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-ka: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-ka: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ka: PKGSIZE changed from 36091 to 40144 (+11%)
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ko: PKGSIZE changed from 104831 to 106988 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-lt: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-nb: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-nl: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-nn: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pl: PKGSIZE changed from 101361 to 103427 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-pt-br: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-pt: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-ro: PKGSIZE changed from 104742 to 106935 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-ru: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-sk: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-sl: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sr: PKGSIZE changed from 129220 to 129837 (+0%)
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PKGSIZE changed from 86536 to 99068 (+14%)
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-tr: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-uk: PKGSIZE changed from 137281 to 140083 (+2%)
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-vi: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-cn: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-locale-zh-tw: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-src: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-src: FILELIST: directory renamed /usr/src/debug/sudo/1.9.11p3-r0/lib/logsrv -> /usr/src/debug/sudo/1.9.12-r0/lib/logsrv, directory renamed /usr/src/debug/sudo/1.9.11p3-r0/plugins/group_file -> /usr/src/debug/sudo/1.9.12-r0/plugins/group_file, directory renamed /usr/src/debug/sudo/1.9.11p3-r0/include/protobuf-c -> /usr/src/debug/sudo/1.9.12-r0/include/protobuf-c, directory renamed /usr/src/debug/sudo/1.9.11p3-r0/lib/protobuf-c -> /usr/src/debug/sudo/1.9.12-r0/lib/protobuf-c, directory renamed /usr/src/debug/sudo/1.9.11p3-r0/lib/eventlog -> /usr/src/debug/sudo/1.9.12-r0/lib/eventlog, directory renamed /usr/src/debug/sudo/1.9.11p3-r0/lib/iolog -> /usr/src/debug/sudo/1.9.12-r0/lib/iolog, directory renamed /usr/src/debug/sudo/1.9.11p3-r0/include/compat -> /usr/src/debug/sudo/1.9.12-r0/include/compat, directory renamed /usr/src/debug/sudo/1.9.11p3-r0/plugins/audit_json -> /usr/src/debug/sudo/1.9.12-r0/plugins/audit_json, directory renamed /usr/src/deb
 ug/sudo/1.9.11p3-r0/plugins/sudoers/auth -> /usr/src/debug/sudo/1.9.12-r0/plugins/sudoers/auth, directory renamed /usr/src/debug/sudo/1.9.11p3-r0/plugins/system_group -> /usr/src/debug/sudo/1.9.12-r0/plugins/system_group, directory renamed /usr/src/debug/sudo/1.9.11p3-r0/plugins/sudoers -> /usr/src/debug/sudo/1.9.12-r0/plugins/sudoers, directory renamed /usr/src/debug/sudo/1.9.11p3-r0/logsrvd -> /usr/src/debug/sudo/1.9.12-r0/logsrvd, removed "/usr/src/debug/sudo/1.9.11p3-r0/lib/util/pw_dup.c /usr/src/debug/sudo/1.9.11p3-r0/src/exec_common.c /usr/src/debug/sudo/1.9.11p3-r0/src/utmp.c /usr/src/debug/sudo/1.9.11p3-r0/src/exec_monitor.c /usr/src/debug/sudo/1.9.11p3-r0/include/sudo_conf.h /usr/src/debug/sudo/1.9.11p3-r0/lib/util/strlcat.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/digest.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/fatal.c /usr/src/debug/sudo/1.9.11p3-r0/src/limits.c /usr/src/debug/sudo/1.9.11p3-r0/src/conversation.c /usr/src/debug/sudo/1.9.11p3-r0/src/tgetpass.c /usr/src/de
 bug/sudo/1.9.11p3-r0/include/sudo_eventlog.h /usr/src/debug/sudo/1.9.11p3-r0/src/net_ifs.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/lbuf.c /usr/src/debug/sudo/1.9.11p3-r0/include/sudo_json.h /usr/src/debug/sudo/1.9.11p3-r0/lib/util/sha2.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/strtoid.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/logpri.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/gidlist.c /usr/src/debug/sudo/1.9.11p3-r0/src/sudo_intercept.c /usr/src/debug/sudo/1.9.11p3-r0/include/intercept.pb-c.h /usr/src/debug/sudo/1.9.11p3-r0/lib/util/strtobool.c /usr/src/debug/sudo/1.9.11p3-r0/include/sudo_fatal.h /usr/src/debug/sudo/1.9.11p3-r0/src/edit_open.c /usr/src/debug/sudo/1.9.11p3-r0/include/sudo_event.h /usr/src/debug/sudo/1.9.11p3-r0/lib/util/secure_path.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/logfac.c /usr/src/debug/sudo/1.9.11p3-r0/src/parse_args.c /usr/src/debug/sudo/1.9.11p3-r0/src/get_pty.c /usr/src/debug/sudo/1.9.11p3-r0/include/sudo_plugin.h /usr/src/debug/sudo/1.9.11p3-r0/src
 /sudo.h /usr/src/debug/sudo/1.9.11p3-r0/include/sudo_dso.h /usr/src/debug/sudo/1.9.11p3-r0/src/suspend_nopty.c /usr/src/debug/sudo/1.9.11p3-r0/src/env_hooks.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/ttysize.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/key_val.c /usr/src/debug/sudo/1.9.11p3-r0/src/exec_preload.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/parseln.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/gethostname.c /usr/src/debug/sudo/1.9.11p3-r0/src/exec_intercept.c /usr/src/debug/sudo/1.9.11p3-r0/plugins/sample_approval/sample_approval.c /usr/src/debug/sudo/1.9.11p3-r0/src/exec_intercept.h /usr/src/debug/sudo/1.9.11p3-r0/lib/util/freezero.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/json.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/roundup.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/rcstr.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/gettime.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/locking.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/sudo_debug.c /usr/src/debug/sudo/1.9.11p3-r0/src/tcsetpg
 rp_nobg.c /usr/src/debug/sudo/1.9.11p3-r0/src/sudo_noexec.c /usr/src/debug/sudo/1.9.11p3-r0/src/exec_pty.c /usr/src/debug/sudo/1.9.11p3-r0/src/intercept.pb-c.c /usr/src/debug/sudo/1.9.11p3-r0/src/sudo_intercept_common.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/strtonum.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/regex.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/strlcpy.c /usr/src/debug/sudo/1.9.11p3-r0/src/ttyname.c /usr/src/debug/sudo/1.9.11p3-r0/include/sudo_debug.h /usr/src/debug/sudo/1.9.11p3-r0/src/exec_nopty.c /usr/src/debug/sudo/1.9.11p3-r0/src/sudo_edit.h /usr/src/debug/sudo/1.9.11p3-r0/src/exec_ptrace.c /usr/src/debug/sudo/1.9.11p3-r0/include/sudo_iolog.h /usr/src/debug/sudo/1.9.11p3-r0/lib/util/ttyname_dev.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/event.c /usr/src/debug/sudo/1.9.11p3-r0/src/exec_ptrace.h /usr/src/debug/sudo/1.9.11p3-r0/include/log_server.pb-c.h /usr/src/debug/sudo/1.9.11p3-r0/lib/util/sudo_dso.c /usr/src/debug/sudo/1.9.11p3-r0/include/sudo_digest.h /usr/src
 /debug/sudo/1.9.11p3-r0/lib/util/sudo_conf.c /usr/src/debug/sudo/1.9.11p3-r0/include/sudo_compat.h /usr/src/debug/sudo/1.9.11p3-r0/lib/util/uuid.c /usr/src/debug/sudo/1.9.11p3-r0/src/copy_file.c /usr/src/debug/sudo/1.9.11p3-r0/include/sudo_util.h /usr/src/debug/sudo/1.9.11p3-r0/include/sudo_lbuf.h /usr/src/debug/sudo/1.9.11p3-r0/lib/util/term.c /usr/src/debug/sudo/1.9.11p3-r0/src/preserve_fds.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/snprintf.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/closefrom.c /usr/src/debug/sudo/1.9.11p3-r0/src/hooks.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/progname.c /usr/src/debug/sudo/1.9.11p3-r0/src/sudo_exec.h /usr/src/debug/sudo/1.9.11p3-r0/src/signal.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/fnmatch.c /usr/src/debug/sudo/1.9.11p3-r0/src/load_plugins.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/event_poll.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/getgrouplist.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/strsplit.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/
 setgroups.c /usr/src/debug/sudo/1.9.11p3-r0/src/sudo_plugin_int.h /usr/src/debug/sudo/1.9.11p3-r0/src/exec.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/sig2str.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/strtomode.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/str2sig.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/basename.c /usr/src/debug/sudo/1.9.11p3-r0/src/sudo.c /usr/src/debug/sudo/1.9.11p3-r0/src/sudo_edit.c /usr/src/debug/sudo/1.9.11p3-r0/lib/util/mkdir_parents.c", added "/usr/src/debug/sudo/1.9.12-r0/include/sudo_debug.h /usr/src/debug/sudo/1.9.12-r0/lib/util/chacha_private.h /usr/src/debug/sudo/1.9.12-r0/lib/util/key_val.c /usr/src/debug/sudo/1.9.12-r0/include/sudo_digest.h /usr/src/debug/sudo/1.9.12-r0/lib/util/locking.c /usr/src/debug/sudo/1.9.12-r0/lib/util/gidlist.c /usr/src/debug/sudo/1.9.12-r0/src/limits.c /usr/src/debug/sudo/1.9.12-r0/lib/util/strtobool.c /usr/src/debug/sudo/1.9.12-r0/src/sudo_edit.c /usr/src/debug/sudo/1.9.12-r0/lib/util/lbuf.c /usr/src/debug/sudo/1.9.12-r0/in
 clude/sudo_eventlog.h /usr/src/debug/sudo/1.9.12-r0/lib/util/rcstr.c /usr/src/debug/sudo/1.9.12-r0/lib/util/regex.c /usr/src/debug/sudo/1.9.12-r0/lib/util/sudo_debug.c /usr/src/debug/sudo/1.9.12-r0/lib/util/arc4random_uniform.c /usr/src/debug/sudo/1.9.12-r0/lib/util/str2sig.c /usr/src/debug/sudo/1.9.12-r0/src/exec_monitor.c /usr/src/debug/sudo/1.9.12-r0/include/sudo_iolog.h /usr/src/debug/sudo/1.9.12-r0/include/sudo_event.h /usr/src/debug/sudo/1.9.12-r0/lib/util/strtomode.c /usr/src/debug/sudo/1.9.12-r0/src/suspend_nopty.c /usr/src/debug/sudo/1.9.12-r0/lib/util/pw_dup.c /usr/src/debug/sudo/1.9.12-r0/lib/util/freezero.c /usr/src/debug/sudo/1.9.12-r0/src/sudo_noexec.c /usr/src/debug/sudo/1.9.12-r0/lib/util/logpri.c /usr/src/debug/sudo/1.9.12-r0/lib/util/strsplit.c /usr/src/debug/sudo/1.9.12-r0/lib/util/setgroups.c /usr/src/debug/sudo/1.9.12-r0/include/sudo_util.h /usr/src/debug/sudo/1.9.12-r0/src/tgetpass.c /usr/src/debug/sudo/1.9.12-r0/include/sudo_json.h /usr/src/debug/sudo/1.9.12-r
 0/src/sudo_intercept.c /usr/src/debug/sudo/1.9.12-r0/include/sudo_conf.h /usr/src/debug/sudo/1.9.12-r0/lib/util/secure_path.c /usr/src/debug/sudo/1.9.12-r0/lib/util/logfac.c /usr/src/debug/sudo/1.9.12-r0/src/exec_common.c /usr/src/debug/sudo/1.9.12-r0/src/exec_nopty.c /usr/src/debug/sudo/1.9.12-r0/lib/util/roundup.c /usr/src/debug/sudo/1.9.12-r0/src/sudo_intercept_common.c /usr/src/debug/sudo/1.9.12-r0/src/signal.c /usr/src/debug/sudo/1.9.12-r0/lib/util/strtoid.c /usr/src/debug/sudo/1.9.12-r0/lib/util/sudo_conf.c /usr/src/debug/sudo/1.9.12-r0/src/env_hooks.c /usr/src/debug/sudo/1.9.12-r0/include/sudo_lbuf.h /usr/src/debug/sudo/1.9.12-r0/src/ttyname.c /usr/src/debug/sudo/1.9.12-r0/lib/util/strlcat.c /usr/src/debug/sudo/1.9.12-r0/lib/util/snprintf.c /usr/src/debug/sudo/1.9.12-r0/src/net_ifs.c /usr/src/debug/sudo/1.9.12-r0/src/sudo_exec.h /usr/src/debug/sudo/1.9.12-r0/include/sudo_rand.h /usr/src/debug/sudo/1.9.12-r0/include/sudo_compat.h /usr/src/debug/sudo/1.9.12-r0/src/hooks.c /usr/
 src/debug/sudo/1.9.12-r0/src/get_pty.c /usr/src/debug/sudo/1.9.12-r0/lib/util/parseln.c /usr/src/debug/sudo/1.9.12-r0/src/exec_intercept.c /usr/src/debug/sudo/1.9.12-r0/lib/util/event_poll.c /usr/src/debug/sudo/1.9.12-r0/lib/util/json.c /usr/src/debug/sudo/1.9.12-r0/lib/util/fnmatch.c /usr/src/debug/sudo/1.9.12-r0/lib/util/ttyname_dev.c /usr/src/debug/sudo/1.9.12-r0/src/sudo_plugin_int.h /usr/src/debug/sudo/1.9.12-r0/src/exec_intercept.h /usr/src/debug/sudo/1.9.12-r0/lib/util/ttysize.c /usr/src/debug/sudo/1.9.12-r0/src/utmp.c /usr/src/debug/sudo/1.9.12-r0/src/edit_open.c /usr/src/debug/sudo/1.9.12-r0/lib/util/progname.c /usr/src/debug/sudo/1.9.12-r0/src/exec_iolog.c /usr/src/debug/sudo/1.9.12-r0/src/conversation.c /usr/src/debug/sudo/1.9.12-r0/src/exec_ptrace.h /usr/src/debug/sudo/1.9.12-r0/src/load_plugins.c /usr/src/debug/sudo/1.9.12-r0/lib/util/mkdir_parents.c /usr/src/debug/sudo/1.9.12-r0/src/sudo_edit.h /usr/src/debug/sudo/1.9.12-r0/lib/util/multiarch.c /usr/src/debug/sudo/1.9.
 12-r0/lib/util/mmap_alloc.c /usr/src/debug/sudo/1.9.12-r0/src/exec_preload.c /usr/src/debug/sudo/1.9.12-r0/src/exec_ptrace.c /usr/src/debug/sudo/1.9.12-r0/lib/util/arc4random.c /usr/src/debug/sudo/1.9.12-r0/lib/util/sig2str.c /usr/src/debug/sudo/1.9.12-r0/src/exec_pty.c /usr/src/debug/sudo/1.9.12-r0/lib/util/fatal.c /usr/src/debug/sudo/1.9.12-r0/lib/util/digest.c /usr/src/debug/sudo/1.9.12-r0/src/sudo.c /usr/src/debug/sudo/1.9.12-r0/lib/util/getgrouplist.c /usr/src/debug/sudo/1.9.12-r0/src/sudo.h /usr/src/debug/sudo/1.9.12-r0/src/copy_file.c /usr/src/debug/sudo/1.9.12-r0/lib/util/gethostname.c /usr/src/debug/sudo/1.9.12-r0/src/parse_args.c /usr/src/debug/sudo/1.9.12-r0/lib/util/strlcpy.c /usr/src/debug/sudo/1.9.12-r0/lib/util/event.c /usr/src/debug/sudo/1.9.12-r0/src/exec.c /usr/src/debug/sudo/1.9.12-r0/include/sudo_plugin.h /usr/src/debug/sudo/1.9.12-r0/lib/util/sha2.c /usr/src/debug/sudo/1.9.12-r0/include/sudo_fatal.h /usr/src/debug/sudo/1.9.12-r0/lib/util/getentropy.c /usr/src/de
 bug/sudo/1.9.12-r0/lib/util/gettime.c /usr/src/debug/sudo/1.9.12-r0/lib/util/strtonum.c /usr/src/debug/sudo/1.9.12-r0/src/intercept.pb-c.c /usr/src/debug/sudo/1.9.12-r0/src/preserve_fds.c /usr/src/debug/sudo/1.9.12-r0/lib/util/term.c /usr/src/debug/sudo/1.9.12-r0/lib/util/uuid.c /usr/src/debug/sudo/1.9.12-r0/lib/util/basename.c /usr/src/debug/sudo/1.9.12-r0/include/sudo_dso.h /usr/src/debug/sudo/1.9.12-r0/include/intercept.pb-c.h /usr/src/debug/sudo/1.9.12-r0/include/log_server.pb-c.h /usr/src/debug/sudo/1.9.12-r0/lib/util/sudo_dso.c /usr/src/debug/sudo/1.9.12-r0/src/tcsetpgrp_nobg.c /usr/src/debug/sudo/1.9.12-r0/lib/util/closefrom.c /usr/src/debug/sudo/1.9.12-r0/lib/util/mktemp.c"
packages/core2-32-poky-linux/sudo/sudo-src: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-src: PKGSIZE changed from 3325765 to 3453630 (+4%)
packages/core2-32-poky-linux/sudo/sudo-staticdev: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-staticdev: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-sudo: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo-sudo: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo-sudo: PKGSIZE changed from 291964 to 316540 (+8%)
packages/core2-32-poky-linux/sudo/sudo: PV changed from "1.9.11p3" to "1.9.12"
packages/core2-32-poky-linux/sudo/sudo: PKGV changed from 1.9.11p3 [default] to 1.9.12 [default]
packages/core2-32-poky-linux/sudo/sudo: PKGSIZE changed from 1225256 to 1233864 (+1%)
Changes to packages/core2-32-poky-linux/sudo (sysroot):
  /usr/lib/sudo/sample_approval.so was removed

--===============8407251092539144091==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-sudo-upgrade-1.9.11p3-1.9.12.patch"

RnJvbSBlMzY1MGQzYTRiZDZkMjFhMzlmYmNmYWRkMjEzMmJmMTM4ZTMwYmNhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBOb3YgMjAyMiAxMzo0ODowNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN1
ZG86IHVwZ3JhZGUgMS45LjExcDMgLT4gMS45LjEyCgotLS0KIG1ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zdWRvL3N1ZG8uaW5jICAgICAgICAgICB8ICAyICstCiAuLi4vc3Vkby97c3Vkb18xLjkuMTFw
My5iYiA9PiBzdWRvXzEuOS4xMi5iYn0gfCAzMyArKysrKysrKysrKysrKysrKystCiAyIGZpbGVz
IGNoYW5nZWQsIDMzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL3N1ZG8ve3N1ZG9fMS45LjExcDMuYmIgPT4gc3Vkb18xLjkuMTIuYmJ9
ICg2NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N1ZG8vc3Vkby5pbmMg
Yi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvLmluYwppbmRleCA4OTQ3YzQ2MTI5Li5m
ZDViYmYxMDNkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvLmlu
YworKysgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvLmluYwpAQCAtNCw3ICs0LDcg
QEAgSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5zdWRvLndzIgogQlVHVFJBQ0tFUiA9ICJodHRwOi8v
d3d3LnN1ZG8ud3MvYnVncy8iCiBTRUNUSU9OID0gImFkbWluIgogTElDRU5TRSA9ICJJU0MgJiBC
U0QtMy1DbGF1c2UgJiBCU0QtMi1DbGF1c2UgJiBabGliIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJm
aWxlOi8vTElDRU5TRS5tZDttZDU9MTZjZjYwYjQ2NmYzYTA2MDY0MjdhN2I2MjRhM2E2NzAgXAor
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5tZDttZDU9N2FhY2JhNDk5Nzc3Yjcx
OTQxNmIyOTNkMTZmMjljOGMgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vcGx1Z2lucy9z
dWRvZXJzL3JlZGJsYWNrLmM7YmVnaW5saW5lPTE7ZW5kbGluZT00NjttZDU9MDNlMzUzMTc2OTli
YTAwYjQ5NjI1MWUwZGZlOWYxMDkgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGliL3V0
aWwvcmVhbGxvY2FycmF5LmM7YmVnaW5saW5lPTM7ZW5kbGluZT0xNTttZDU9Mzk3ZGQ0NWM3Njgz
ZTkwYjlmOGJmMjQ2MzhjZjAzYmYgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vbGliL3V0
aWwvZm5tYXRjaC5jO2JlZ2lubGluZT0zO2VuZGxpbmU9Mjc7bWQ1PTAwNGQ3ZDI4NjZiYTFmNWI0
MTE3NDkwNjg0OWQyZTBmIFwKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zdWRv
L3N1ZG9fMS45LjExcDMuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvXzEuOS4x
Mi5iYgpzaW1pbGFyaXR5IGluZGV4IDY2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvc3Vkby9zdWRvXzEuOS4xMXAzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQv
c3Vkby9zdWRvXzEuOS4xMi5iYgppbmRleCBiYTYxMGVlMmU3Li42NDAzZWMzODA5IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3Vkby9zdWRvXzEuOS4xMXAzLmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdWRvL3N1ZG9fMS45LjEyLmJiCkBAIC0xLDMgKzEsMzQgQEAK
KyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBi
eSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBi
ZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRl
IHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBp
bgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4
YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMg
VGhlIGNoYW5nZXM6CisjCisjIC0tLSBMSUNFTlNFLm1kCisjICsrKyBMSUNFTlNFLm1kCisjIEBA
IC0yOTYsNyArMjk2LDcgQEAKKyMgIAorIyAgVGhlIGVtYmVkZGVkIGNvcHkgb2YgemxpYiBiZWFy
cyB0aGUgZm9sbG93aW5nIGxpY2Vuc2U6CisjICAKKyMgLSAgICBDb3B5cmlnaHQgKEMpIDE5OTUt
MjAxNyBKZWFuLWxvdXAgR2FpbGx5IGFuZCBNYXJrIEFkbGVyCisjICsgICAgQ29weXJpZ2h0IChD
KSAxOTk1LTIwMjIgSmVhbi1sb3VwIEdhaWxseSBhbmQgTWFyayBBZGxlcgorIyAgCisjICAgICAg
VGhpcyBzb2Z0d2FyZSBpcyBwcm92aWRlZCAnYXMtaXMnLCB3aXRob3V0IGFueSBleHByZXNzIG9y
IGltcGxpZWQKKyMgICAgICB3YXJyYW50eS4gIEluIG5vIGV2ZW50IHdpbGwgdGhlIGF1dGhvcnMg
YmUgaGVsZCBsaWFibGUgZm9yIGFueSBkYW1hZ2VzCisjIEBAIC0zMTksNyArMzE5LDcgQEAKKyMg
IAorIyAgVGhlIGVtYmVkZGVkIGNvcHkgb2YgcHJvdG9idWYtYyBiZWFycyB0aGUgZm9sbG93aW5n
IGxpY2Vuc2U6CisjICAKKyMgLSAgICBDb3B5cmlnaHQgKGMpIDIwMDgtMjAxOCwgRGF2ZSBCZW5z
b24gYW5kIHRoZSBwcm90b2J1Zi1jIGF1dGhvcnMuCisjICsgICAgQ29weXJpZ2h0IChjKSAyMDA4
LTIwMjIsIERhdmUgQmVuc29uIGFuZCB0aGUgcHJvdG9idWYtYyBhdXRob3JzLgorIyAgICAgIEFs
bCByaWdodHMgcmVzZXJ2ZWQuCisjICAKKyMgICAgICBSZWRpc3RyaWJ1dGlvbiBhbmQgdXNlIGlu
IHNvdXJjZSBhbmQgYmluYXJ5IGZvcm1zLCB3aXRoIG9yIHdpdGhvdXQKKyMgCisjCisKIHJlcXVp
cmUgc3Vkby5pbmMKIAogU1JDX1VSSSA9ICJodHRwczovL3d3dy5zdWRvLndzL2Rpc3Qvc3Vkby0k
e1BWfS50YXIuZ3ogXApAQCAtOCw3ICszOSw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly93d3cuc3Vk
by53cy9kaXN0L3N1ZG8tJHtQVn0udGFyLmd6IFwKIAogUEFNX1NSQ19VUkkgPSAiZmlsZTovL3N1
ZG8ucGFtIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNDY4N2U3ZDJmNTY3MjE3MDhmNTljY2Ey
ZTEzNTJjMDU2Y2IyM2RlNTI2YzIyNzI1NjE1YTQyYmIwOTRmMWY3MCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJkZTE1NzMzODg4MTcwYzU2ODM0ZGFhZmQzNGJmOTgzZGIxMGZiMjEwMzk3NDJmY2Zj
Mzk2YmQzMjE2OGQ2MzYyIgogCiBERVBFTkRTICs9ICIgdmlydHVhbC9jcnlwdCAke0BiYi51dGls
cy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3BhbScsICdsaWJwYW0nLCAnJywgZCl9Igog
UkRFUEVORFM6JHtQTn0gKz0gIiAke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVT
JywgJ3BhbScsICdwYW0tcGx1Z2luLWxpbWl0cyBwYW0tcGx1Z2luLWtleWluaXQnLCAnJywgZCl9
IgotLSAKMi4zMS4xCgo=

--===============8407251092539144091==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/sudo/sudo-lib: FILELIST: removed "/usr/lib/sudo/sample_approval.so"
packages/core2-32-poky-linux/sudo/sudo-locale-ka: PKGSIZE changed from 36091 to 40144 (+11%)
packages/core2-32-poky-linux/sudo/sudo-locale-sv: PKGSIZE changed from 86536 to 99068 (+14%)
Changes to packages/core2-32-poky-linux/sudo (sysroot):
  /usr/lib/sudo/sample_approval.so was removed

--===============8407251092539144091==--

