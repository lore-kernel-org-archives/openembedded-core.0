Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1684DC3276C
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:14:57 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com
 (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.22200.1659341690400644388
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:14:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=HbeeUTSi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30,
 mailfrom: 010101825878d22a-99b3c477-bcfb-4a0c-af39-ff5c8e4eaee6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659341689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3MGU2gNz/qeQq4VHRq/WqwOJ99o4CYwHcWR/4SkDewg=;
	b=HbeeUTSiEsqt/KTXbamq1KfK/X5Oo6EyUYzSF6lg68D3GvUq9BbNw2ZuGjx3Obui
	VtOSYPXSoRwmG/Xfq7Bb9ZWu0SYxS97loYvGcPOLQJDaIOWg+D+HYCHxiXDSKKoe1WG
	qrK1+eZ4djYMLTqtum42AWZ43/UqO3EbtNDj3pQg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659341689;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3MGU2gNz/qeQq4VHRq/WqwOJ99o4CYwHcWR/4SkDewg=;
	b=UDKnzdctSoJNpzikxs4U5n5DXVrws09PBGPAuFtoEXoXjLAIGCl/mlEBiXCeuBGY
	UEr8KrXkQMis/7o98RTLZE0l/zm0IXiTeSUGFgQByvAyrTXGsZtN6H29YdiRKidXcwA
	kNkydcwOb+Wf7sLdIkVvE6/5QT8FjECttF+tNRIA=
Content-Type: multipart/mixed; boundary="===============8496617717567588128=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangrc.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.52 SUCCEEDED
Message-ID: 
 <010101825878d22a-99b3c477-bcfb-4a0c-af39-ff5c8e4eaee6-000000@us-west-2.amazonses.com>
Date: Mon, 1 Aug 2022 08:14:49 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Aug 2022 08:14:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168697

--===============8496617717567588128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ell* to *0.52* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.51-0.52.patch
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
--===============8496617717567588128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ell/ell-dbg: PKGV changed from 0.51 [default] to 0.52 [default]
packages/core2-32-poky-linux/ell/ell-dbg: PKGSIZE changed from 1312980 to 1333040 (+2%)
packages/core2-32-poky-linux/ell/ell-dbg: PV changed from "0.51" to "0.52"
packages/core2-32-poky-linux/ell/ell-dev: PKGV changed from 0.51 [default] to 0.52 [default]
packages/core2-32-poky-linux/ell/ell-dev: PKGSIZE changed from 147769 to 148055 (+0%)
packages/core2-32-poky-linux/ell/ell-dev: PV changed from "0.51" to "0.52"
packages/core2-32-poky-linux/ell/ell-doc: PKGV changed from 0.51 [default] to 0.52 [default]
packages/core2-32-poky-linux/ell/ell-doc: PV changed from "0.51" to "0.52"
packages/core2-32-poky-linux/ell/ell-locale: PKGV changed from 0.51 [default] to 0.52 [default]
packages/core2-32-poky-linux/ell/ell-locale: PV changed from "0.51" to "0.52"
packages/core2-32-poky-linux/ell/ell-src: PKGV changed from 0.51 [default] to 0.52 [default]
packages/core2-32-poky-linux/ell/ell-src: FILELIST: directory renamed /usr/src/debug/ell/0.51-r0/ell-0.51/linux -> /usr/src/debug/ell/0.52-r0/ell-0.52/linux, removed "/usr/src/debug/ell/0.51-r0/ell-0.51/ell/siphash.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/test.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/hwdb.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-service.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ecc-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/timeout.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/rtnl.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dir.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/test.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/gpio.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/acd.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tester.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/string.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/netlink.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/io.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tls-suites.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-name
 -cache.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/timeout.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ringbuf.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/cert-crypto.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/util.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-message.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-filter.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/uuid.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/netconfig.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/time-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/rtnl.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/useful.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/idle.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ecc-external.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/log.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/random.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ringbuf.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tls.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp6.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/gvariant-util.c /usr/src/debug/ell/0.51-r0/ell-
 0.51/ell/checksum.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ecdh.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/utf8.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/cipher.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp-transport.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/string.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/signal.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/log.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp-lease.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp-util.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/settings.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/idle.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/gvariant-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp6-lease.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp-server.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/uintset.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/net.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/icmp6-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/net.c /usr/src/debug/ell
 /0.51-r0/ell-0.51/ell/main.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/net-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/utf8.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-util.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/icmp6.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/time.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/main.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/signal.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/genl.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/hwdb.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dir.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/hashmap.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-client.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/cipher.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ecc.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ecdh.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/main-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-client.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/base64.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-private.h /usr/src/debug/ell/0.51-r
 0/ell-0.51/ell/netconfig.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp6-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/icmp6.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp6-transport.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/uintset.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus-service.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/strv.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/path.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/acd.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tls-extensions.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/cert-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/base64.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/io.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/key.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/uuid.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/genl.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/file.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/cert.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/pem.c /usr/src/debug/ell/0.51-r0/ell
 -0.51/ell/tls.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/random.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp6.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/cert.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/pem-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/hashmap.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/time.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tester.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/netlink.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/settings.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/checksum.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dbus.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tls-record.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/strv.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/rtnl-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/queue.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/key.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/queue.c /usr/src/debug/ell/0.51-r0/ell-0.51/ell/dhcp-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell
 /asn1-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/tls-private.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/ecc.h /usr/src/debug/ell/0.51-r0/ell-0.51/ell/util.h", added "/usr/src/debug/ell/0.52-r0/ell-0.52/ell/icmp6.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/utf8.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dhcp-private.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/uintset.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/test.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/cert.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/cipher.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/netlink.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/string.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dbus-util.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/net.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/random.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/ecc-private.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/strv.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/tls-record.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dbus-client.c /usr/src/debug/ell/0.52-r0/e
 ll-0.52/ell/dhcp6.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/tls-private.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/uuid.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dhcp-lease.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/cert.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/genl.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dhcp-transport.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/ecc-external.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dbus-private.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/pem.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/util.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dbus-name-cache.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/base64.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/tls-extensions.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/tls.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/ecc.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/ecdh.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/test.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/tester.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/asn1-private.h /usr/src/debug/
 ell/0.52-r0/ell-0.52/ell/rtnl-private.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/queue.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/net-private.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/hashmap.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/signal.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/acd.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/timeout.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/checksum.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/icmp6.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/icmp6-private.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/main.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/idle.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dir.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/gvariant-private.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/signal.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/time.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/settings.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/file.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dir.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/time.c /usr/src/debug/ell/
 0.52-r0/ell-0.52/ell/idle.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/tls.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/base64.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dhcp.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dbus-message.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/timeout.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/log.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/net.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/cipher.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/hwdb.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/ecdh.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/uuid.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/utf8.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dbus-service.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/tester.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/pem-private.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/key.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/path.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/gvariant-util.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dhcp-server.c /usr/src/debug/ell/0.52-r0/ell-0
 .52/ell/genl.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/settings.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/netlink-private.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/cert-crypto.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/gpio.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/log.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/queue.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/acd.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dhcp6-lease.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/netconfig.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/string.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/key.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dhcp.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dhcp6-private.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dhcp6.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/siphash.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/uintset.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dbus.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/netconfig.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/time-private.h /usr/src/debug/ell/0.52-r0
 /ell-0.52/ell/useful.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/ecc.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/checksum.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dbus-client.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/rtnl.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/hwdb.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/tls-suites.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/strv.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/netlink.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/hashmap.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dbus-filter.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/rtnl.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/util.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/io.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/cert-private.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dhcp6-transport.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dbus.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/main-private.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dbus-service.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/dhcp-util.c /usr/src/debug
 /ell/0.52-r0/ell-0.52/ell/ringbuf.c /usr/src/debug/ell/0.52-r0/ell-0.52/ell/main.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/io.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/random.h /usr/src/debug/ell/0.52-r0/ell-0.52/ell/ringbuf.h"
packages/core2-32-poky-linux/ell/ell-src: PKGSIZE changed from 1380611 to 1402284 (+2%)
packages/core2-32-poky-linux/ell/ell-src: PV changed from "0.51" to "0.52"
packages/core2-32-poky-linux/ell/ell-staticdev: PKGV changed from 0.51 [default] to 0.52 [default]
packages/core2-32-poky-linux/ell/ell-staticdev: PV changed from "0.51" to "0.52"
packages/core2-32-poky-linux/ell/ell: PKGV changed from 0.51 [default] to 0.52 [default]
packages/core2-32-poky-linux/ell/ell: PKGSIZE changed from 560299 to 568491 (+1%)
packages/core2-32-poky-linux/ell/ell: PV changed from "0.51" to "0.52"
packages/core2-32-poky-linux/ell: PKGV changed from 0.51 [default] to 0.52 [default]
packages/core2-32-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.51.tar.xz file://0001-build-fix-time.h-related-breakage-on-musl.patch" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.52.tar.xz"
packages/core2-32-poky-linux/ell: PV changed from "0.51" to "0.52"

--===============8496617717567588128==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.51-0.52.patch"

RnJvbSA5NTlkZjlhZmY2ODIwOWVmM2MyNjg4YzhmYmVkY2ViM2YwMDI1ZGEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBdWcgMjAyMiAwODowNDozNyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVs
bDogdXBncmFkZSAwLjUxIC0+IDAuNTIKCi0tLQogLi4uLWZpeC10aW1lLmgtcmVsYXRlZC1icmVh
a2FnZS1vbi1tdXNsLnBhdGNoIHwgNzkgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uL2VsbC97ZWxs
XzAuNTEuYmIgPT4gZWxsXzAuNTIuYmJ9ICAgICAgICAgIHwgIDYgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA4MyBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBt
ZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsLzAwMDEtYnVpbGQtZml4LXRpbWUuaC1yZWxhdGVkLWJy
ZWFrYWdlLW9uLW11c2wucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9lbGwve2VsbF8w
LjUxLmJiID0+IGVsbF8wLjUyLmJifSAoNzglKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2VsbC9lbGwvMDAwMS1idWlsZC1maXgtdGltZS5oLXJlbGF0ZWQtYnJlYWthZ2Utb24tbXVz
bC5wYXRjaCBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGwvMDAwMS1idWlsZC1maXgtdGltZS5o
LXJlbGF0ZWQtYnJlYWthZ2Utb24tbXVzbC5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQK
aW5kZXggMDJiNWE5ZjIxZS4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9lbGwv
ZWxsLzAwMDEtYnVpbGQtZml4LXRpbWUuaC1yZWxhdGVkLWJyZWFrYWdlLW9uLW11c2wucGF0Y2gK
KysrIC9kZXYvbnVsbApAQCAtMSw3OSArMCwwIEBACi1Gcm9tIGNkOTUxM2EwMjUxNzQxODFiNjZh
YzEzZGU0NTgxM2Y2ZTE1NzI3ZDMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiA9P1VU
Ri04P3E/TWlsYW49MjBQPTJFPTIwU3Rhbmk9QzQ9ODc/PSA8bXBzQGFydmFudGEubmV0PgotRGF0
ZTogTW9uLCA2IEp1biAyMDIyIDIyOjA1OjM5ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hdIGJ1aWxk
OiBmaXggdGltZS5oIHJlbGF0ZWQgYnJlYWthZ2Ugb24gbXVzbAotCi1taXNzaW5nIHRpbWUuaCBm
b3Igc3RydWN0IHRpbWV2YWwgdXNhZ2UKLWZvcndhcmQgZGVjbGFyYXRpb24gb2Ygc3RydWN0IHRp
bWV2YWwgaW4gdGltZS1wcml2YXRlLmgKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydAotU2ln
bmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXhAbGludXRyb25peC5kZT4KLS0tLQot
IGVsbC9kaGNwLXRyYW5zcG9ydC5jICB8IDEgKwotIGVsbC9kaGNwNi10cmFuc3BvcnQuYyB8IDEg
KwotIGVsbC9pY21wNi5jICAgICAgICAgICB8IDEgKwotIGVsbC90aW1lLXByaXZhdGUuaCAgICB8
IDIgKy0KLSBlbGwvdGltZS5jICAgICAgICAgICAgfCAxICsKLSA1IGZpbGVzIGNoYW5nZWQsIDUg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvZWxsL2RoY3AtdHJh
bnNwb3J0LmMgYi9lbGwvZGhjcC10cmFuc3BvcnQuYwotaW5kZXggZWYwMzBkZS4uYzRjZjBjYSAx
MDA2NDQKLS0tLSBhL2VsbC9kaGNwLXRyYW5zcG9ydC5jCi0rKysgYi9lbGwvZGhjcC10cmFuc3Bv
cnQuYwotQEAgLTQwLDYgKzQwLDcgQEAKLSAjaW5jbHVkZSA8bGludXgvZmlsdGVyLmg+Ci0gI2lu
Y2x1ZGUgPG5ldC9pZl9hcnAuaD4KLSAjaW5jbHVkZSA8ZXJybm8uaD4KLSsjaW5jbHVkZSA8c3lz
L3RpbWUuaD4KLSAKLSAjaW5jbHVkZSAiaW8uaCIKLSAjaW5jbHVkZSAidXRpbC5oIgotZGlmZiAt
LWdpdCBhL2VsbC9kaGNwNi10cmFuc3BvcnQuYyBiL2VsbC9kaGNwNi10cmFuc3BvcnQuYwotaW5k
ZXggMzBjNDI1Zi4uNWZmNjUxNiAxMDA2NDQKLS0tLSBhL2VsbC9kaGNwNi10cmFuc3BvcnQuYwot
KysrIGIvZWxsL2RoY3A2LXRyYW5zcG9ydC5jCi1AQCAtMzUsNiArMzUsNyBAQAotICNpbmNsdWRl
IDxuZXQvaWYuaD4KLSAjaW5jbHVkZSA8dW5pc3RkLmg+Ci0gI2luY2x1ZGUgPGVycm5vLmg+Ci0r
I2luY2x1ZGUgPHN5cy90aW1lLmg+Ci0gCi0gI2luY2x1ZGUgInByaXZhdGUuaCIKLSAjaW5jbHVk
ZSAibWlzc2luZy5oIgotZGlmZiAtLWdpdCBhL2VsbC9pY21wNi5jIGIvZWxsL2ljbXA2LmMKLWlu
ZGV4IDM2ODk3N2YuLjczMTk5MDMgMTAwNjQ0Ci0tLS0gYS9lbGwvaWNtcDYuYwotKysrIGIvZWxs
L2ljbXA2LmMKLUBAIC0zNiw2ICszNiw3IEBACi0gI2luY2x1ZGUgPG5ldC9pZi5oPgotICNpbmNs
dWRlIDx1bmlzdGQuaD4KLSAjaW5jbHVkZSA8ZXJybm8uaD4KLSsjaW5jbHVkZSA8c3lzL3RpbWUu
aD4KLSAKLSAjaW5jbHVkZSAicHJpdmF0ZS5oIgotICNpbmNsdWRlICJ1c2VmdWwuaCIKLWRpZmYg
LS1naXQgYS9lbGwvdGltZS1wcml2YXRlLmggYi9lbGwvdGltZS1wcml2YXRlLmgKLWluZGV4IDUy
OTVkOTQuLjgzYzIzZGQgMTAwNjQ0Ci0tLS0gYS9lbGwvdGltZS1wcml2YXRlLmgKLSsrKyBiL2Vs
bC90aW1lLXByaXZhdGUuaAotQEAgLTE5LDcgKzE5LDcgQEAKLSAgKiAgRm91bmRhdGlvbiwgSW5j
LiwgNTEgRnJhbmtsaW4gU3QsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxICBV
U0EKLSAgKgotICAqLwotLQotK3N0cnVjdCB0aW1ldmFsOwotIHVpbnQ2NF90IF90aW1lX3BpY2tf
aW50ZXJ2YWxfc2Vjcyh1aW50MzJfdCBtaW5fc2VjcywgdWludDMyX3QgbWF4X3NlY3MpOwotIHVp
bnQ2NF90IF90aW1lX2Z1enpfbXNlY3ModWludDY0X3QgbXMpOwotIHVpbnQ2NF90IF90aW1lX2Z1
enpfc2Vjcyh1aW50MzJfdCBzZWNzLCB1aW50MzJfdCBtYXhfb2Zmc2V0KTsKLWRpZmYgLS1naXQg
YS9lbGwvdGltZS5jIGIvZWxsL3RpbWUuYwotaW5kZXggMTBlMTBiMC4uNDFlNTcyNSAxMDA2NDQK
LS0tLSBhL2VsbC90aW1lLmMKLSsrKyBiL2VsbC90aW1lLmMKLUBAIC0yNiw2ICsyNiw3IEBACi0g
Ci0gI2RlZmluZSBfR05VX1NPVVJDRQotICNpbmNsdWRlIDx0aW1lLmg+Ci0rI2luY2x1ZGUgPHN5
cy90aW1lLmg+Ci0gCi0gI2luY2x1ZGUgInRpbWUuaCIKLSAjaW5jbHVkZSAidGltZS1wcml2YXRl
LmgiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNTEuYmIgYi9tZXRh
L3JlY2lwZXMtY29yZS9lbGwvZWxsXzAuNTIuYmIKc2ltaWxhcml0eSBpbmRleCA3OCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2VsbF8wLjUxLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtY29yZS9lbGwvZWxsXzAuNTIuYmIKaW5kZXggODA2ODMzYmM3ZC4uYjJhZjBkMDRmMCAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2VsbF8wLjUxLmJiCisrKyBiL21ldGEv
cmVjaXBlcy1jb3JlL2VsbC9lbGxfMC41Mi5iYgpAQCAtMTQsMTAgKzE0LDggQEAgREVQRU5EUyA9
ICJkYnVzIgogCiBpbmhlcml0IGF1dG90b29scyBwa2djb25maWcKIAotU1JDX1VSSSA9ICJodHRw
czovL21pcnJvcnMuZWRnZS5rZXJuZWwub3JnL3B1Yi9saW51eC9saWJzLyR7QlBOfS8ke0JQTn0t
JHtQVn0udGFyLnh6IFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtYnVpbGQtZml4LXRpbWUuaC1y
ZWxhdGVkLWJyZWFrYWdlLW9uLW11c2wucGF0Y2ggXAotICAgICAgICAgICAiCi1TUkNfVVJJW3No
YTI1NnN1bV0gPSAiYmE4NmNmYTRhYWYxMDE1MTQ0M2VkZDYzYTc2ODc5MTQ0NjVkOTY5ZjVkZGEw
MGEyYzFmY2IxMWJkODVlNDE3ZiIKK1NSQ19VUkkgPSAiaHR0cHM6Ly9taXJyb3JzLmVkZ2Uua2Vy
bmVsLm9yZy9wdWIvbGludXgvbGlicy8ke0JQTn0vJHtCUE59LSR7UFZ9LnRhci54eiIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4MzA5OWIxNGJlZGEyYjI1M2EyYzY5NDYwZjk2MTNjNWU5NTViNjMz
NDllM2MwMGNmMmZkNTA2ZjViM2JhN2QwIgogCiBkb19jb25maWd1cmU6cHJlcGVuZCAoKSB7CiAg
ICAgbWtkaXIgLXAgJHtTfS9idWlsZC1hdXgKLS0gCjIuMzEuMQoK

--===============8496617717567588128==--

