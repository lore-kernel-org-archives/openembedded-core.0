Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACAAACA9EC4
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.7527.1685693431863737309
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Zwx8bZAc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101887b2886fb-83750478-1d45-4665-9373-faebec38ba7a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=JtcPUCFGBl7XJi3s0AWz2so68+TnjmNgU4wY5znzhn0=;
	b=Zwx8bZAcgJx18ROoDcAtAd7GukZpESSHMGpk879+/SK6A1+dFcDgq5GfOSzab+ST
	OstJA/6QauWUY16oUwtAE88ruTTX6bLt6zUaKNR+V0sFlxUqr3bXovKJg4U2qO6u9e+
	uKoLbiygKlQ6l47+uIHvolyEdL73VCEPo6r4Sfvg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693433;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=JtcPUCFGBl7XJi3s0AWz2so68+TnjmNgU4wY5znzhn0=;
	b=FrdfrWzrGt8r9rtEZbnrsv4Tz101cOgdHQQE06+yzKoaQos4HAZFs2Yx0Wci3mdL
	BT3OjPU0ZZDUrbCVYcgEeGubLu/B6h09kmVkO6SMCdfwB8gOITBm29NHIdfJuOrYMUU
	6qtNowLej0fwqOWZvFWsBehXR2cp5lDeaHofAQrY=
Content-Type: multipart/mixed; boundary="===============7284838618631061139=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ethtool: upgrading to 6.3 SUCCEEDED
Message-ID: <010101887b2886fb-83750478-1d45-4665-9373-faebec38ba7a-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:33 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182210

--===============7284838618631061139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ethtool* to *6.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ethtool-upgrade-6.2-6.3.patch
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
--===============7284838618631061139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 39968 to 47818 (+20%)

--===============7284838618631061139==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ethtool-upgrade-6.2-6.3.patch"

RnJvbSBjZTg5OGEyY2UwODgxMWQxODYxMzcyMmRjZDkzZjNhNGIwYjRhZmMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAxOToxOTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGV0
aHRvb2w6IHVwZ3JhZGUgNi4yIC0+IDYuMwoKLS0tCiAuLi4vZXRodG9vbC9ldGh0b29sL2F2b2lk
X3BhcmFsbGVsX3Rlc3RzLnBhdGNoICAgICAgICAgICAgICB8IDYgKysrLS0tCiAuLi4vZXRodG9v
bC97ZXRodG9vbF82LjIuYmIgPT4gZXRodG9vbF82LjMuYmJ9ICAgICAgICAgICAgICB8IDIgKy0K
IDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1leHRlbmRlZC9ldGh0b29sL3tldGh0b29sXzYuMi5iYiA9PiBldGh0b29s
XzYuMy5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9v
bC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2V0aHRvb2wvZXRodG9vbC9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaAppbmRleCBkNWNi
ODcwNWMyLi41ZTkwMjQ4MzRjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRo
dG9vbC9ldGh0b29sL2F2b2lkX3BhcmFsbGVsX3Rlc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9ldGh0b29sL2V0aHRvb2wvYXZvaWRfcGFyYWxsZWxfdGVzdHMucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIGI0ZWM2NjM1YWY0ZDRhNDdlOWFiN2JiZDUzNDdlNzg3MTBkMTkz
NjIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDA4Zjg4N2Y0YmM2NTY4NDM5N2JmOGVj
MzBjYzYxZDkxZDg5NGRlYWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBUdWRvciBG
bG9yZWEgPHR1ZG9yLmZsb3JlYUBlbmVhLmNvbT4KIERhdGU6IFdlZCwgMjggTWF5IDIwMTQgMTg6
NTk6NTQgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXRodG9vbDogdXNlIHNlcmlhbC10ZXN0cyBj
b25maWcgbmVlZGVkIGJ5IHB0ZXN0LgpAQCAtMTUsMTEgKzE1LDExIEBAIFVwc3RyZWFtLVN0YXR1
czogSW5hcHByb3ByaWF0ZQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRl
eCBlYmRmZDM5Li5jOTNiNzlhIDEwMDY0NAoraW5kZXggYzFlMDAxMi4uYzQ2MDM5OCAxMDA2NDQK
IC0tLSBhL2NvbmZpZ3VyZS5hYwogKysrIGIvY29uZmlndXJlLmFjCiBAQCAtMiw3ICsyLDcgQEAg
ZG5sIFByb2Nlc3MgdGhpcyBmaWxlIHdpdGggYXV0b2NvbmYgdG8gcHJvZHVjZSBhIGNvbmZpZ3Vy
ZSBzY3JpcHQuCi0gQUNfSU5JVChldGh0b29sLCA2LjIsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcp
CisgQUNfSU5JVChldGh0b29sLCA2LjMsIG5ldGRldkB2Z2VyLmtlcm5lbC5vcmcpCiAgQUNfUFJF
UkVRKDIuNTIpCiAgQUNfQ09ORklHX1NSQ0RJUihbZXRodG9vbC5jXSkKIC1BTV9JTklUX0FVVE9N
QUtFKFtnbnUgc3ViZGlyLW9iamVjdHNdKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2V0aHRvb2wvZXRodG9vbF82LjIuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZXRodG9v
bC9ldGh0b29sXzYuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvZXRodG9vbC9ldGh0b29sXzYuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjMuYmIKaW5kZXggYWVhMDNiNzI5ZC4uNTA0
ZTY0NTk2NiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9v
bF82LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2V0aHRvb2wvZXRodG9vbF82LjMu
YmIKQEAgLTExLDcgKzExLDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L3NvZnR3
YXJlL25ldHdvcmsvZXRodG9vbC9ldGh0b29sLSR7UFZ9LnRhci5neiBcCiAgICAgICAgICAgIGZp
bGU6Ly9hdm9pZF9wYXJhbGxlbF90ZXN0cy5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gIjFhOWY5NWMzZDhjMTc5NWE5NDIyMjA5MTJkNzJjMDZhMjA4ZjFjMTIy
YTc4Zjc2OTAyNTk0MDI4NTZmZjA2YTAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMzQyZDM3ZDNm
ZTE5ZGE3OWQwMjc2YzRjNjljMzRjNjFmMWFkOGY4N2IwNjUxNGQ2NjRiZjFlZWIyOWJmZDUyNSIK
IAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vd3d3Lmtlcm5lbC5vcmcvcHViL3NvZnR3
YXJlL25ldHdvcmsvZXRodG9vbC8iCiAKLS0gCjIuMzkuMgoK

--===============7284838618631061139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-bash-completion: PKGSIZE changed from 24547 to 24621 (+0%)
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-dbg: PKGSIZE changed from 3626908 to 3765336 (+4%)
packages/core2-32-poky-linux/ethtool/ethtool-dev: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-dev: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-doc: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-doc: PKGSIZE changed from 39968 to 47818 (+20%)
packages/core2-32-poky-linux/ethtool/ethtool-locale: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-locale: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-ptest: PKGSIZE changed from 1544678 to 1594796 (+3%)
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-src: FILELIST: directory renamed /usr/src/debug/ethtool/6.2-r0/uapi/linux/hdlc -> /usr/src/debug/ethtool/6.3-r0/uapi/linux/hdlc, directory renamed /usr/src/debug/ethtool/6.2-r0/uapi/linux -> /usr/src/debug/ethtool/6.3-r0/uapi/linux, directory renamed /usr/src/debug/ethtool/6.2-r0 -> /usr/src/debug/ethtool/6.3-r0, removed "/usr/src/debug/ethtool/6.2-r0/netlink/parser.c /usr/src/debug/ethtool/6.2-r0/netlink/privflags.c /usr/src/debug/ethtool/6.2-r0/netlink/pause.c /usr/src/debug/ethtool/6.2-r0/netlink/desc-genlctrl.c /usr/src/debug/ethtool/6.2-r0/netlink/tunnels.c /usr/src/debug/ethtool/6.2-r0/netlink/monitor.c /usr/src/debug/ethtool/6.2-r0/netlink/eee.c /usr/src/debug/ethtool/6.2-r0/netlink/parser.h /usr/src/debug/ethtool/6.2-r0/netlink/module.c /usr/src/debug/ethtool/6.2-r0/netlink/nlsock.c /usr/src/debug/ethtool/6.2-r0/netlink/permaddr.c /usr/src/debug/ethtool/6.2-r0/netlink/nlsock.h /usr/src/debug/ethtool/6.2-r0/netlink/rss.c /usr/src/de
 bug/ethtool/6.2-r0/netlink/module-eeprom.c /usr/src/debug/ethtool/6.2-r0/netlink/bitset.c /usr/src/debug/ethtool/6.2-r0/netlink/strset.c /usr/src/debug/ethtool/6.2-r0/netlink/extapi.h /usr/src/debug/ethtool/6.2-r0/netlink/features.c /usr/src/debug/ethtool/6.2-r0/netlink/strset.h /usr/src/debug/ethtool/6.2-r0/netlink/desc-ethtool.c /usr/src/debug/ethtool/6.2-r0/netlink/bitset.h /usr/src/debug/ethtool/6.2-r0/netlink/msgbuff.h /usr/src/debug/ethtool/6.2-r0/netlink/channels.c /usr/src/debug/ethtool/6.2-r0/netlink/tsinfo.c /usr/src/debug/ethtool/6.2-r0/netlink/msgbuff.c /usr/src/debug/ethtool/6.2-r0/netlink/stats.c /usr/src/debug/ethtool/6.2-r0/netlink/desc-rtnl.c /usr/src/debug/ethtool/6.2-r0/netlink/netlink.h /usr/src/debug/ethtool/6.2-r0/netlink/netlink.c /usr/src/debug/ethtool/6.2-r0/netlink/settings.c /usr/src/debug/ethtool/6.2-r0/netlink/prettymsg.h /usr/src/debug/ethtool/6.2-r0/netlink/rings.c /usr/src/debug/ethtool/6.2-r0/netlink/cable_test.c /usr/src/debug/ethtool/6.2-r0/netlink
 /prettymsg.c /usr/src/debug/ethtool/6.2-r0/netlink/fec.c /usr/src/debug/ethtool/6.2-r0/netlink/coalesce.c", added "/usr/src/debug/ethtool/6.3-r0/netlink/parser.c /usr/src/debug/ethtool/6.3-r0/netlink/privflags.c /usr/src/debug/ethtool/6.3-r0/netlink/pause.c /usr/src/debug/ethtool/6.3-r0/netlink/desc-genlctrl.c /usr/src/debug/ethtool/6.3-r0/netlink/tunnels.c /usr/src/debug/ethtool/6.3-r0/netlink/mm.c /usr/src/debug/ethtool/6.3-r0/netlink/monitor.c /usr/src/debug/ethtool/6.3-r0/netlink/eee.c /usr/src/debug/ethtool/6.3-r0/netlink/parser.h /usr/src/debug/ethtool/6.3-r0/netlink/module.c /usr/src/debug/ethtool/6.3-r0/netlink/nlsock.c /usr/src/debug/ethtool/6.3-r0/netlink/permaddr.c /usr/src/debug/ethtool/6.3-r0/netlink/nlsock.h /usr/src/debug/ethtool/6.3-r0/netlink/rss.c /usr/src/debug/ethtool/6.3-r0/netlink/module-eeprom.c /usr/src/debug/ethtool/6.3-r0/netlink/bitset.c /usr/src/debug/ethtool/6.3-r0/netlink/strset.c /usr/src/debug/ethtool/6.3-r0/netlink/extapi.h /usr/src/debug/ethtool/6.3
 -r0/netlink/features.c /usr/src/debug/ethtool/6.3-r0/netlink/strset.h /usr/src/debug/ethtool/6.3-r0/netlink/desc-ethtool.c /usr/src/debug/ethtool/6.3-r0/netlink/bitset.h /usr/src/debug/ethtool/6.3-r0/netlink/msgbuff.h /usr/src/debug/ethtool/6.3-r0/netlink/channels.c /usr/src/debug/ethtool/6.3-r0/netlink/tsinfo.c /usr/src/debug/ethtool/6.3-r0/netlink/msgbuff.c /usr/src/debug/ethtool/6.3-r0/netlink/stats.c /usr/src/debug/ethtool/6.3-r0/netlink/desc-rtnl.c /usr/src/debug/ethtool/6.3-r0/netlink/netlink.h /usr/src/debug/ethtool/6.3-r0/netlink/netlink.c /usr/src/debug/ethtool/6.3-r0/netlink/settings.c /usr/src/debug/ethtool/6.3-r0/netlink/prettymsg.h /usr/src/debug/ethtool/6.3-r0/netlink/rings.c /usr/src/debug/ethtool/6.3-r0/netlink/cable_test.c /usr/src/debug/ethtool/6.3-r0/netlink/plca.c /usr/src/debug/ethtool/6.3-r0/netlink/prettymsg.c /usr/src/debug/ethtool/6.3-r0/netlink/fec.c /usr/src/debug/ethtool/6.3-r0/netlink/coalesce.c /usr/src/debug/ethtool/6.3-r0/netlink/pse-pd.c"
packages/core2-32-poky-linux/ethtool/ethtool-src: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool-src: PKGSIZE changed from 1332537 to 1362532 (+2%)
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool-staticdev: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool/ethtool: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool/ethtool: PKGSIZE changed from 600816 to 617200 (+3%)
packages/core2-32-poky-linux/ethtool: PKGV changed from 6.2 [default] to 6.3 [default]
packages/core2-32-poky-linux/ethtool: PV changed from "6.2" to "6.3"
packages/core2-32-poky-linux/ethtool: SRC_URI changed from "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.2.tar.gz file://run-ptest file://avoid_parallel_tests.patch" to "https://cdn.kernel.org/pub/software/network/ethtool/ethtool-6.3.tar.gz file://run-ptest file://avoid_parallel_tests.patch"

--===============7284838618631061139==--

