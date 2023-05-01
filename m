Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEC4CA9EAC
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:03 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.107418.1682976349473379046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=dO/zo31u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010187d9352dae-1d9fa132-8de2-4029-bf07-5afb57a3356d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=siAdyiCKhXMIuYrcH7mkrdJchnR0J9fWqgQFdJap33s=;
	b=dO/zo31uXAYnHd56Oqn8FUAaMiS/TAso35JjQnAvsN29/yaY65lciO9mvWbXGs69
	BTzzSpPLAbaFWQIOzTXW9d/p9QaxCPzfMK3H2uxlMPz7YhKcBax6GqqtLQHb2F75GYH
	Wr7onk55RAcyB4z7sq7Hm1GI7zPw9atgHUy5w0Ks=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976353;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=siAdyiCKhXMIuYrcH7mkrdJchnR0J9fWqgQFdJap33s=;
	b=RAdAua1bjjzDnXt7iKWtNFoyl5Yhk1/68FGS0gov3nfgk+9GPmMYCAgF3yKX9z6t
	M6Q1xUqZB7bfrrzxIZJN6civYNS1dhMUa1p6lg+lBCyUfm0QSTMaUZbcradex6hXoa1
	zWSVbwwrBrzHEDxQRj7erYAGp1RRaf1Y8OOXxRd4=
Content-Type: multipart/mixed; boundary="===============7249039777726599151=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-rtsp-server: upgrading to 1.22.2 SUCCEEDED
Message-ID: <01010187d9352dae-1d9fa132-8de2-4029-bf07-5afb57a3356d-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180688

--===============7249039777726599151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-rtsp-server* to *1.22.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-upgrade-1.22.0-1.22.2.patch
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
--===============7249039777726599151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-apps: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGSIZE changed from 1150088 to 1150180 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: FILELIST: removed "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2200.0", added "/usr/lib/.debug/libgstrtspserver-1.0.so.0.2202.0"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dbg: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-dev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-doc: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-glib: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-locale: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-meta: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspclientsink: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-rtspserver-typelib: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGSIZE changed from 1173100 to 1173126 (+0%)
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-src: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server-staticdev: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/gstreamer1.0-rtsp-server: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.22.0.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-rtsp-server/gst-rtsp-server-1.22.2.tar.xz"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PV changed from "1.22.0" to "1.22.2"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILES: removed "/usr/lib/libgstrtspserver-1.0.so.0.2200.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2202.0"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2200.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2202.0"
packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: PKGV changed from 1.22.0 [default] to 1.22.2 [default]
Changes to packages/core2-32-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2200.0 to libgstrtspserver-1.0.so.0.2202.0
  /usr/lib/libgstrtspserver-1.0.so.0.2200.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2202.0

--===============7249039777726599151==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gstreamer1.0-rtsp-server/libgstrtspserver-1.0: FILELIST: removed "/usr/lib/libgstrtspserver-1.0.so.0.2200.0", added "/usr/lib/libgstrtspserver-1.0.so.0.2202.0"
Changes to packages/core2-32-poky-linux/gstreamer1.0-rtsp-server (sysroot):
  /usr/lib/libgstrtspserver-1.0.so.0 changed symlink target from libgstrtspserver-1.0.so.0.2200.0 to libgstrtspserver-1.0.so.0.2202.0
  /usr/lib/libgstrtspserver-1.0.so.0.2200.0 moved to /usr/lib/libgstrtspserver-1.0.so.0.2202.0

--===============7249039777726599151==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-upgrade-1.22.0-1.22.2.patch"

RnJvbSAxZWI3MDE0ZjE0ZGZjNjU4NTU1Y2NmMmZkMjc4YmY3YTY5MTFkMjU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAyMDozMDowMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1ydHNwLXNlcnZlcjogdXBncmFkZSAxLjIyLjAgLT4gMS4yMi4yCgotLS0KIC4u
LnJ0c3Atc2VydmVyXzEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4y
LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4w
LXJ0c3Atc2VydmVyXzEuMjIuMC5iYiA9PiBnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4y
LmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4wLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRp
bWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjIyLjIuYmIKc2ltaWxh
cml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjIyLjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4y
LmJiCmluZGV4IGY5NDNjODI5YzQuLjAyYzJiYWRjMmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4wLmJi
CisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRz
cC1zZXJ2ZXJfMS4yMi4yLmJiCkBAIC0xMCw3ICsxMCw3IEBAIFBOUkVBTCA9ICJnc3QtcnRzcC1z
ZXJ2ZXIiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Aub3JnL3Ny
Yy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImFlYTI0ZWViNTllZTVmYWRmYWMzNTVkZTJmN2NlY2I1MTk2NmMzZTE0N2U1YWQ3Y2ZiNGMz
MTRmMWE0MDg2ZWQiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmJlNGFlY2ZiODg3MTAxMDBlYTcx
MTVlZDAyMTY0MDNlODA5NDM0NGViZjE0NjA5NDI3MWI4ZDRkNzM4MjhiZiIKIAogUyA9ICIke1dP
UktESVJ9LyR7UE5SRUFMfS0ke1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============7249039777726599151==--

