Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 347B7C74A5B
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:36 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.144491.1671136350610286108
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=CplmxbuN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010185177d0bed-7999a305-6b9f-49d4-ac57-6423f1bd2816-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Y25ex8P/gJPRbYnbs9TeGlXAkXFGtGLkQ6zxdUCfXPs=;
	b=CplmxbuNSj0i0UGYhwrT2ioYOjjc5Tb/uQ/o0ZMKLuUeOAacjDNp+2wG8xvImVzn
	Lav2ooKK6jyZT3bbxK9FKLCygfugZVUGkCFca7ZAZxR35kNNFkJUkeii7TzOXMnrQEt
	U7iM84PtOBm+nYRnm/7y2hiEEDhunHyoDBjIcrfg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Y25ex8P/gJPRbYnbs9TeGlXAkXFGtGLkQ6zxdUCfXPs=;
	b=HQ9gP1MCTKxj7yw1z8PhqP2oH8CtUTimJfw1lr7MwQW/O+FtbhFr7Sh8+rkH737B
	YZkGH1oRYkJ9HGuwfyZ8bCnLil/V0Ox8KpO2BqhpkGsyt8j99Z89wJBTrzZgu5JAwQw
	HNh1zFk2i7XiBIV0BEW1bGYFRgFHpfz0km+N5bsU=
Content-Type: multipart/mixed; boundary="===============5930910418280881990=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 6.1.0 SUCCEEDED
Message-ID: <01010185177d0bed-7999a305-6b9f-49d4-ac57-6423f1bd2816-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:29 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174625

--===============5930910418280881990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iproute2* to *6.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-6.0.0-6.1.0.patch
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
--===============5930910418280881990==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 6689564 to 6711460 (+0%)
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dev: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-dev: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-doc: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-doc: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-genl: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-genl: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGSIZE changed from 829508 to 841860 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-ip: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-locale: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-locale: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3627084 to 3648931 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-src: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-src: FILELIST: directory renamed /usr/src/debug/iproute2/6.0.0-r0/include/uapi/linux/netfilter_ipv4 -> /usr/src/debug/iproute2/6.1.0-r0/include/uapi/linux/netfilter_ipv4, directory renamed /usr/src/debug/iproute2/6.0.0-r0/include/uapi/linux/tc_act -> /usr/src/debug/iproute2/6.1.0-r0/include/uapi/linux/tc_act, directory renamed /usr/src/debug/iproute2/6.0.0-r0/include/uapi/linux/hdlc -> /usr/src/debug/iproute2/6.1.0-r0/include/uapi/linux/hdlc, directory renamed /usr/src/debug/iproute2/6.0.0-r0/lib -> /usr/src/debug/iproute2/6.1.0-r0/lib, directory renamed /usr/src/debug/iproute2/6.0.0-r0/include/uapi/linux/netfilter -> /usr/src/debug/iproute2/6.1.0-r0/include/uapi/linux/netfilter, directory renamed /usr/src/debug/iproute2/6.0.0-r0/tipc -> /usr/src/debug/iproute2/6.1.0-r0/tipc, directory renamed /usr/src/debug/iproute2/6.0.0-r0/tc -> /usr/src/debug/iproute2/6.1.0-r0/tc, directory renamed /usr/src/debug/iproute2/6.0.0-r0/include -> /usr/src
 /debug/iproute2/6.1.0-r0/include, directory renamed /usr/src/debug/iproute2/6.0.0-r0/include/uapi/linux -> /usr/src/debug/iproute2/6.1.0-r0/include/uapi/linux, directory renamed /usr/src/debug/iproute2/6.0.0-r0/include/uapi/asm-generic -> /usr/src/debug/iproute2/6.1.0-r0/include/uapi/asm-generic, directory renamed /usr/src/debug/iproute2/6.0.0-r0/include/uapi/linux/can -> /usr/src/debug/iproute2/6.1.0-r0/include/uapi/linux/can, directory renamed /usr/src/debug/iproute2/6.0.0-r0/genl -> /usr/src/debug/iproute2/6.1.0-r0/genl, directory renamed /usr/src/debug/iproute2/6.0.0-r0/devlink -> /usr/src/debug/iproute2/6.1.0-r0/devlink, directory renamed /usr/src/debug/iproute2/6.0.0-r0/bridge -> /usr/src/debug/iproute2/6.1.0-r0/bridge, directory renamed /usr/src/debug/iproute2/6.0.0-r0/misc -> /usr/src/debug/iproute2/6.1.0-r0/misc, directory renamed /usr/src/debug/iproute2/6.0.0-r0/include/uapi/linux/tc_ematch -> /usr/src/debug/iproute2/6.1.0-r0/include/uapi/linux/tc_ematch, directory renamed
  /usr/src/debug/iproute2/6.0.0-r0/include/uapi/linux/netfilter/ipset -> /usr/src/debug/iproute2/6.1.0-r0/include/uapi/linux/netfilter/ipset, removed "/usr/src/debug/iproute2/6.0.0-r0/ip/ip.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_vlan.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_bond.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_vcan.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_team.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_wwan.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipfou.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_bridge_slave.c /usr/src/debug/iproute2/6.0.0-r0/ip/link_vti6.c /usr/src/debug/iproute2/6.0.0-r0/ip/iptunnel.c /usr/src/debug/iproute2/6.0.0-r0/ip/tunnel.c /usr/src/debug/iproute2/6.0.0-r0/ip/ila_common.h /usr/src/debug/iproute2/6.0.0-r0/ip/iprule.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_bareudp.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipntable.c /usr/src/debug/iproute2/6.0.0-r0/ip/tunnel.h /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_geneve.c /usr/src/debug/iproute2
 /6.0.0-r0/ip/iplink_bridge.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_batadv.c /usr/src/debug/iproute2/6.0.0-r0/ip/xfrm_policy.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_netdevsim.c /usr/src/debug/iproute2/6.0.0-r0/ip/link_veth.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_macvlan.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipmonitor.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipmaddr.c /usr/src/debug/iproute2/6.0.0-r0/ip/link_gre.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_can.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_virt_wifi.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipmroute.c /usr/src/debug/iproute2/6.0.0-r0/ip/xfrm.h /usr/src/debug/iproute2/6.0.0-r0/ip/xfrm_monitor.c /usr/src/debug/iproute2/6.0.0-r0/ip/ip_common.h /usr/src/debug/iproute2/6.0.0-r0/ip/nh_common.h /usr/src/debug/iproute2/6.0.0-r0/ip/iptoken.c /usr/src/debug/iproute2/6.0.0-r0/ip/rtmon.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipioam6.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipaddrlabel.c /usr/src/debug/iproute2/6.0.0-r0/ip/link_g
 re6.c /usr/src/debug/iproute2/6.0.0-r0/ip/link_xfrm.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipl2tp.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipnexthop.c /usr/src/debug/iproute2/6.0.0-r0/ip/iproute.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipstats.c /usr/src/debug/iproute2/6.0.0-r0/ip/xfrm_state.c /usr/src/debug/iproute2/6.0.0-r0/ip/link_iptnl.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_ipvlan.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipnetconf.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_bond_slave.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipprefix.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_vrf.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_hsr.c /usr/src/debug/iproute2/6.0.0-r0/ip/link_vti.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipila.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipnetns.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipneigh.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipseg6.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_gtp.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink.c /usr/src/debug/iproute2/6.0.0-r0/ip/l
 ink_ip6tnl.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_ifb.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipvrf.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_xstats.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipaddress.c /usr/src/debug/iproute2/6.0.0-r0/ip/iptuntap.c /usr/src/debug/iproute2/6.0.0-r0/ip/rtm_map.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_rmnet.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_vxcan.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_vxlan.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_dummy.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipmptcp.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_nlmon.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_xdp.c /usr/src/debug/iproute2/6.0.0-r0/ip/tcp_metrics.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipxfrm.c /usr/src/debug/iproute2/6.0.0-r0/ip/iproute_lwtunnel.c /usr/src/debug/iproute2/6.0.0-r0/ip/ipmacsec.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_ipoib.c /usr/src/debug/iproute2/6.0.0-r0/ip/iplink_amt.c /usr/src/debug/iproute2/6.0.0-r0/ip/ip6tunnel.c", a
 dded "/usr/src/debug/iproute2/6.1.0-r0/ip/ip.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_dsa.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_bond.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_vcan.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_team.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_vlan.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_wwan.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipfou.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_bridge_slave.c /usr/src/debug/iproute2/6.1.0-r0/ip/link_vti6.c /usr/src/debug/iproute2/6.1.0-r0/ip/iptunnel.c /usr/src/debug/iproute2/6.1.0-r0/ip/tunnel.c /usr/src/debug/iproute2/6.1.0-r0/ip/ila_common.h /usr/src/debug/iproute2/6.1.0-r0/ip/iprule.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_bareudp.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipntable.c /usr/src/debug/iproute2/6.1.0-r0/ip/tunnel.h /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_bridge.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_geneve.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_batadv.c /usr/src/debug
 /iproute2/6.1.0-r0/ip/xfrm_policy.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_netdevsim.c /usr/src/debug/iproute2/6.1.0-r0/ip/link_veth.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_macvlan.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipmonitor.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipmaddr.c /usr/src/debug/iproute2/6.1.0-r0/ip/link_gre.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_can.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_virt_wifi.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipmroute.c /usr/src/debug/iproute2/6.1.0-r0/ip/xfrm.h /usr/src/debug/iproute2/6.1.0-r0/ip/xfrm_monitor.c /usr/src/debug/iproute2/6.1.0-r0/ip/nh_common.h /usr/src/debug/iproute2/6.1.0-r0/ip/ip_common.h /usr/src/debug/iproute2/6.1.0-r0/ip/iptoken.c /usr/src/debug/iproute2/6.1.0-r0/ip/rtmon.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipioam6.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipaddrlabel.c /usr/src/debug/iproute2/6.1.0-r0/ip/link_gre6.c /usr/src/debug/iproute2/6.1.0-r0/ip/link_xfrm.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipl2t
 p.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipnexthop.c /usr/src/debug/iproute2/6.1.0-r0/ip/iproute.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipstats.c /usr/src/debug/iproute2/6.1.0-r0/ip/xfrm_state.c /usr/src/debug/iproute2/6.1.0-r0/ip/link_iptnl.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_ipvlan.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipnetconf.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_bond_slave.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipprefix.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_vrf.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_hsr.c /usr/src/debug/iproute2/6.1.0-r0/ip/link_vti.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipila.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipnetns.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipneigh.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipseg6.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_gtp.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink.c /usr/src/debug/iproute2/6.1.0-r0/ip/link_ip6tnl.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_ifb.c /usr/src/debug/iproute2/6.1.0-r0/
 ip/ipvrf.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_xstats.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipaddress.c /usr/src/debug/iproute2/6.1.0-r0/ip/iptuntap.c /usr/src/debug/iproute2/6.1.0-r0/ip/rtm_map.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_vxcan.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_vxlan.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_dummy.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_nlmon.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipmptcp.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_ipoib.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_xdp.c /usr/src/debug/iproute2/6.1.0-r0/ip/tcp_metrics.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipxfrm.c /usr/src/debug/iproute2/6.1.0-r0/ip/iproute_lwtunnel.c /usr/src/debug/iproute2/6.1.0-r0/ip/ipmacsec.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_rmnet.c /usr/src/debug/iproute2/6.1.0-r0/ip/iplink_amt.c /usr/src/debug/iproute2/6.1.0-r0/ip/ip6tunnel.c"
packages/core2-32-poky-linux/iproute2/iproute2-ss: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-ss: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tc: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-tc: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2/iproute2: PKGV changed from 6.0.0 [default] to 6.1.0 [default]
packages/core2-32-poky-linux/iproute2: PV changed from "6.0.0" to "6.1.0"
packages/core2-32-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.0.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-6.1.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch"
packages/core2-32-poky-linux/iproute2: PKGV changed from 6.0.0 [default] to 6.1.0 [default]

--===============5930910418280881990==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-6.0.0-6.1.0.patch"

RnJvbSBmNzhiNzRhNmVhZWI0Zjk5NDlmNzkwNDQ0ZjY3ZGU1MDg3NjNjNTc0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMDg6MjI6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBp
cHJvdXRlMjogdXBncmFkZSA2LjAuMCAtPiA2LjEuMAoKLS0tCiAuLi4vaXByb3V0ZTIve2lwcm91
dGUyXzYuMC4wLmJiID0+IGlwcm91dGUyXzYuMS4wLmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL3tpcHJvdXRlMl82LjAuMC5iYiA9PiBpcHJvdXRl
Ml82LjEuMC5iYn0gKDk3JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2lwcm91dGUyL2lwcm91dGUyXzYuMC4wLmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9p
cHJvdXRlMi9pcHJvdXRlMl82LjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk3JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuMC4wLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzYuMS4w
LmJiCmluZGV4IGMyODdiOWMwZjUuLjRjNmRkMWY3ZjQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNi4wLjAuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi9pcHJvdXRlMl82LjEuMC5iYgpAQCAtMTUsNyArMTUs
NyBAQCBTUkNfVVJJID0gIiR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvdXRpbHMvbmV0LyR7QlBO
fS8ke0JQfS50YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1saWJjLWNvbXBhdC5oLWFk
ZC1tdXNsLXdvcmthcm91bmQucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICI1MjMxMzllOWU3MmFlYzk5NjM3NGZhMmRlNzRiZTRjNTNkMmRkMDU1ODk0ODg5MzRk
MjFmZjk3YmFlMTk1ODBhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVjZTEyYTBmZWM2YjIxMjcy
NWVmMjE4NzM1OTQxYjJkYWI3NjI0NGRiN2U3MjY0NmE3NjAyMWIwNTM3YjQzYWIiCiAKIGluaGVy
aXQgdXBkYXRlLWFsdGVybmF0aXZlcyBiYXNoLWNvbXBsZXRpb24gcGtnY29uZmlnCiAKLS0gCjIu
MzcuMwoK

--===============5930910418280881990==--

