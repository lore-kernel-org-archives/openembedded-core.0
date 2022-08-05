Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80B4CC38142
	for <webhook@archiver.kernel.org>; Fri,  5 Aug 2022 06:03:38 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com
 (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web08.3854.1659679407261622759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 23:03:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=VoMWjLsS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192,
 mailfrom: 010101826c99f8fe-9ee6367a-b536-4774-854c-062df61f3932-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1659679406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aUXV7az1Min7VqjS/gSCnfTmH15GqLHZ3lOMeSlC+3g=;
	b=VoMWjLsSO7ieR45bbq+fJO15Asw5bmoGrDSNg6v92u+Vo4197Y3016F0rFTHJcUD
	ZUnuIKkKUo0jCgOkKjDIrnJX7qOUAQW/atXOulqsyHe4phVEKyeQqAKo7g7SemybuTQ
	59yg8zvoMS+iJ9VCTGmOoW1j4er5zRHs7qEs5uBo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1659679406;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aUXV7az1Min7VqjS/gSCnfTmH15GqLHZ3lOMeSlC+3g=;
	b=cA+7xUHNgvRlaFJjf9TAHrk2yNbQw/gV+3hHWeC8rXZsZEo+PRfMqOiaTlxmWfr7
	yURgjkxhlT0F8Gw0BDkuuKqX4TYN5xD5tIP+8m4gukW7XqKXypaigdQwhvnWprWLdJ8
	jRbtTT8vpI4EUkRqiTcJJwNL7Kk0ppyBTroRu1+s=
Content-Type: multipart/mixed; boundary="===============6403122074503844133=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Changhyeok Bae <changhyeok.bae@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] iproute2: upgrading to 5.19.0 FAILED
Message-ID: 
 <010101826c99f8fe-9ee6367a-b536-4774-854c-062df61f3932-000000@us-west-2.amazonses.com>
Date: Fri, 5 Aug 2022 06:03:26 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.08.05-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Aug 2022 06:03:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168883

--===============6403122074503844133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *iproute2* to *5.19.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-iproute2-upgrade-5.18.0-5.19.0.patch
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
--===============6403122074503844133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-bash-completion: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-dbg: PKGSIZE changed from 6439600 to 6530104 (+1%)
packages/core2-32-poky-linux/iproute2/iproute2-dev: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-dev: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-devlink: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-doc: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-doc: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-genl: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-genl: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-ifstat: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ip: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-ip: PKGSIZE changed from 812964 to 829508 (+2%)
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-lnstat: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-locale: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-locale: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-nstat: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-rdma: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-rtacct: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-src: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-src: FILELIST: directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/include/uapi/linux -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/include/uapi/linux, directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/include/uapi/linux/netfilter_ipv4 -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/include/uapi/linux/netfilter_ipv4, directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/include/uapi/linux/can -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/include/uapi/linux/can, directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/include -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/include, directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/include/uapi/linux/hdlc -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/include/uapi/linux/hdlc, directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/lib -> /usr/src/debug/iproute2/5.19.0-r0/i
 proute2-5.19.0/lib, directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/tipc -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/tipc, directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/devlink -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/devlink, directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/tc -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/tc, directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/include/uapi/linux/netfilter -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/include/uapi/linux/netfilter, directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/include/uapi/linux/tc_ematch -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/include/uapi/linux/tc_ematch, directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/include/uapi/linux/tc_act -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/include/uapi/linux/tc_act, directory renamed /usr/src/debug/iproute2/5.1
 8.0-r0/iproute2-5.18.0/misc -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/misc, directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/genl -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/genl, directory renamed /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/include/uapi/linux/netfilter/ipset -> /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/include/uapi/linux/netfilter/ipset, removed "/usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipprefix.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipneigh.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ip6tunnel.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_bridge_slave.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_amt.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipxfrm.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/link_veth.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iproute_lwtunnel.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.
 18.0/ip/iplink_netdevsim.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/tcp_metrics.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/xfrm_monitor.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/xfrm_policy.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/bridge/bridge.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_macvlan.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipmacsec.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipnetconf.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_bond.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_rmnet.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iptoken.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iptunnel.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/link_iptnl.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/link_xfrm.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_ifb.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5
 .18.0/ip/iplink_vxcan.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_can.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipntable.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iproute.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipnexthop.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_vrf.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_ipvlan.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_batadv.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_bridge.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/rtmon.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/tunnel.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ip.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_bareudp.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_bond_slave.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/bridge/vlan.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/i
 pmptcp.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ip_common.h /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/rtm_map.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/bridge/monitor.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_xstats.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/bridge/br_common.h /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_vlan.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/bridge/link.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_dummy.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/link_ip6tnl.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/xfrm.h /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipioam6.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_ipoib.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_nlmon.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iprule.c /usr/s
 rc/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_xdp.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipnetns.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/xfrm_state.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ila_common.h /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_vcan.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/tunnel.h /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipaddrlabel.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipfou.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipmonitor.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/bridge/mdb.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipseg6.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/bridge/fdb.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_geneve.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_hsr.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipmroute.c /usr/src/debug/iproute2/5.18.0-r0
 /iproute2-5.18.0/ip/ipvrf.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/link_gre.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipmaddr.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/link_vti.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/link_vti6.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_team.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipila.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipl2tp.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/link_gre6.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/nh_common.h /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_vxlan.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_gtp.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iplink_wwan.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/iptuntap.c /usr/src/debug/iproute2/5.18.0-r0/iproute2-5.18.0/ip/ipaddress.c", added "/usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/i
 pxfrm.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/link_xfrm.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_macvlan.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ip.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/link_iptnl.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iprule.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/tunnel.h /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipseg6.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/bridge/bridge.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_vxcan.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipioam6.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/rtm_map.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ip_common.h /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_vxlan.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/xfrm_state.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_hsr.c /usr/src/debug/ipro
 ute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_ifb.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipnetns.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/bridge/br_common.h /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/tunnel.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iptoken.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_xdp.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_vcan.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipmacsec.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_geneve.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipl2tp.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipneigh.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/tcp_metrics.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipila.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipvrf.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/link_gre.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0
 /ip/nh_common.h /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_batadv.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_amt.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/link_vti.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/link_gre6.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/bridge/vlan.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_netdevsim.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/bridge/mdb.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipnexthop.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/bridge/vni.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipntable.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_nlmon.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_ipoib.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_bridge.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ip6tun
 nel.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/link_veth.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipnetconf.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipaddress.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_dummy.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/link_ip6tnl.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_bridge_slave.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_xstats.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipmonitor.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ila_common.h /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_wwan.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/bridge/monitor.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_gtp.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iptunnel.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipprefix.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplin
 k_vrf.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/rtmon.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/bridge/fdb.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipmptcp.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_bond_slave.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/xfrm_monitor.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_virt_wifi.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_ipvlan.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipaddrlabel.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iptuntap.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipfou.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_bareudp.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iproute_lwtunnel.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_team.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_vlan.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip
 /ipmroute.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/link_vti6.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/xfrm.h /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_bond.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/bridge/link.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_rmnet.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipmaddr.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/xfrm_policy.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iplink_can.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipstats.c /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/iproute.c"
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-src: PKGSIZE changed from 3534359 to 3595887 (+2%)
packages/core2-32-poky-linux/iproute2/iproute2-ss: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-ss: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-staticdev: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tc: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-tc: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2-tipc: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2/iproute2: PKGV changed from 5.18.0 [default] to 5.19.0 [default]
packages/core2-32-poky-linux/iproute2/iproute2: PKGSIZE changed from 261794 to 269986 (+3%)
packages/core2-32-poky-linux/iproute2: PV changed from "5.18.0" to "5.19.0"
packages/core2-32-poky-linux/iproute2: SRC_URI changed from "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.18.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch" to "https://cdn.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.19.0.tar.xz file://0001-libc-compat.h-add-musl-workaround.patch"
packages/core2-32-poky-linux/iproute2: PKGV changed from 5.18.0 [default] to 5.19.0 [default]

--===============6403122074503844133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.6" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1660 targets, 49 skipped, 0 masked, 0 errors.
Removing 102 recipes from the core2-32 sysroot...done.
Removing 101 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-040e9f5ff5815b18c0743897801ad034b7c0ca8c"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:040e9f5ff5815b18c0743897801ad034b7c0ca8c"
workspace            = "master:6c3a88e8dcf0b7a40080c4cd9d447d0d50b12f4c"

Initialising tasks...done.
Sstate summary: Wanted 176 Local 69 Mirrors 0 Missed 107 Current 128 (39% match, 64% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 168 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 169 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 173 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 174 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 190 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_packagedata_setscene)
NOTE: Running setscene task 210 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 219 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.64.bb:do_populate_sysroot_setscene)
NOTE: Running task 552 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_fetch)
NOTE: Running task 569 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 570 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 571 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_fetch)
NOTE: Running task 572 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_fetch)
NOTE: Running task 573 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_fetch)
NOTE: Running task 574 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_fetch)
NOTE: Running task 575 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_fetch)
NOTE: Running task 576 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_fetch)
NOTE: Running task 577 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_fetch)
NOTE: Running task 578 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_fetch)
NOTE: Running task 579 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_fetch)
NOTE: Running task 580 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_fetch)
NOTE: Running task 581 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_fetch)
NOTE: Running task 582 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 583 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 584 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_fetch)
NOTE: Running task 585 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_fetch)
NOTE: Running task 586 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: Running task 587 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: Running task 588 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_fetch)
NOTE: Running task 589 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_fetch)
NOTE: Running task 590 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_fetch)
NOTE: Running task 591 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_fetch)
NOTE: Running task 592 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_fetch)
NOTE: Running task 593 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb:do_fetch)
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Started
NOTE: recipe nettle-3.8-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_fetch: Started
NOTE: recipe curl-7.84.0-r0: task do_fetch: Started
NOTE: recipe file-5.42-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.45-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2-r0: task do_fetch: Started
NOTE: recipe nettle-3.8-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.84.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_fetch: Started
NOTE: Running task 603 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_unpack)
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_fetch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Started
NOTE: Running task 604 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_unpack)
NOTE: Running task 605 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_unpack)
NOTE: Running task 606 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: Running task 607 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_unpack)
NOTE: Running task 608 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_unpack)
NOTE: Running task 609 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 610 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_unpack)
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: Running task 611 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.3-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe file-5.42-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Started
NOTE: recipe gmp-6.2.1-r0: task do_fetch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Started
NOTE: recipe xz-5.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 612 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: Running task 613 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 614 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_unpack)
NOTE: Running task 615 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_unpack)
NOTE: Running task 616 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_unpack)
NOTE: recipe elfutils-0.187-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Started
NOTE: recipe bash-5.1.16-r0: task do_fetch: Started
NOTE: recipe iproute2-5.19.0-r0: task do_fetch: Started
NOTE: recipe bash-completion-2.11-r0: task do_fetch: Succeeded
NOTE: Running task 617 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_unpack)
NOTE: recipe libarchive-3.6.1-r0: task do_fetch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-5.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 618 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_unpack)
NOTE: recipe libcap-2.64-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 245 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running task 619 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_unpack)
NOTE: Running task 620 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_unpack)
NOTE: Running task 621 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb:do_unpack)
NOTE: recipe libseccomp-2.5.4-r0: task do_fetch: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_fetch: Succeeded
NOTE: Running task 622 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_unpack)
NOTE: Running task 623 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_unpack)
NOTE: recipe bash-5.1.16-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe acl-2.3.1-r0: task do_unpack: Started
NOTE: Running task 624 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_unpack)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 625 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_unpack)
NOTE: recipe sqlite3-3_3.39.1-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe libcap-2.64-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.8-r0: task do_unpack: Started
NOTE: Running setscene task 247 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-7.84.0-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe file-5.42-r0: task do_unpack: Started
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Started
NOTE: recipe xz-5.2.5-r0: task do_unpack: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Started
NOTE: Running setscene task 253 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 638 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_patch)
NOTE: Running setscene task 255 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-5.19.0-r0: task do_unpack: Started
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Started
NOTE: Running task 643 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe bash-5.1.16-r0: task do_unpack: Started
NOTE: recipe elfutils-0.187-r0: task do_unpack: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_unpack: Succeeded
NOTE: Running task 644 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_patch)
NOTE: Running task 645 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_patch)
NOTE: recipe libmnl-1.0.5-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.8-r0: task do_unpack: Succeeded
NOTE: Running task 646 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 647 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 648 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_patch: Started
NOTE: Running task 649 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_patch)
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.8-r0: task do_patch: Started
NOTE: Running task 650 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 651 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-5.19.0-r0: task do_unpack: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 652 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: Running task 653 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 654 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_unpack: Succeeded
NOTE: Running task 659 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libmnl-1.0.5-r0: task do_patch: Succeeded
NOTE: Running task 660 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_patch)
NOTE: Running task 661 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Started
NOTE: recipe bash-completion-2.11-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 662 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-5.19.0-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_patch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_patch: Succeeded
NOTE: recipe curl-7.84.0-r0: task do_unpack: Succeeded
NOTE: recipe file-5.42-r0: task do_unpack: Succeeded
NOTE: Running task 663 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 664 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: Running task 665 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 666 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_patch)
NOTE: Running task 667 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_patch)
NOTE: Running task 668 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: recipe bash-5.1.16-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 669 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: Running task 670 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: Running task 671 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe iptables-1.8.8-r0: task do_patch: Started
NOTE: Running task 672 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-5.19.0-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.42-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: Running task 673 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 674 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb:do_populate_lic)
NOTE: recipe curl-7.84.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe bash-5.1.16-r0: task do_patch: Started
NOTE: recipe nettle-3.8-r0: task do_patch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Started
NOTE: recipe iproute2-5.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_patch: Succeeded
NOTE: recipe iproute2-5.19.0-r0: task do_populate_lic: Started
NOTE: Running task 675 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_patch)
NOTE: Running task 676 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 677 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 678 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.45-r0: task do_patch: Succeeded
NOTE: Running task 679 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.39.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 680 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.42-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gmp-6.2.1-r0: task do_patch: Started
NOTE: Running task 681 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_patch: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 682 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 683 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-5.19.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb:do_populate_lic unihash changed to 569d18dd0ad246693337f8213a254664f2e0fade72fce82812b6c0b72b40bfd6
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.84.0-r0: task do_patch: Succeeded
NOTE: Running task 684 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-5.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.42-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 685 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_patch)
NOTE: recipe curl-7.84.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_patch: Succeeded
NOTE: recipe nettle-3.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 686 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Started
NOTE: Running setscene task 259 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 260 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 261 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 262 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.42-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_patch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_patch: Succeeded
NOTE: recipe curl-7.84.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 691 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 692 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: recipe musl-obstack-1.2-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_unpack: Succeeded
NOTE: Running task 693 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: Running task 694 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: Running task 695 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_patch)
NOTE: recipe gnutls-3.7.6-r0: task do_patch: Succeeded
NOTE: Running task 696 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe bash-5.1.16-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 697 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe musl-obstack-1.2-r0: task do_unpack: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 267 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 269 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.7.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zlib-1.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 272 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 274 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.2-r0: task do_unpack: Succeeded
NOTE: Running task 714 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: Running task 715 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: recipe musl-obstack-1.2-r0: task do_patch: Started
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.2-r0: task do_patch: Succeeded
NOTE: Running task 716 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch)
NOTE: Running task 717 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-runtime-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 277 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 279 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.187-r0: task do_patch: Succeeded
NOTE: Running task 720 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_unpack)
NOTE: Running task 721 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_unpack: Started
NOTE: recipe libgcc-12.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 281 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 722 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_patch)
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_patch: Started
NOTE: Running setscene task 282 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.187-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 285 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+6e9d2370c7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 288 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 289 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running task 731 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 298 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.1.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 301 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 302 of 304 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 845 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_prepare_recipe_sysroot)
NOTE: Running task 862 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 863 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 870 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 871 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 881 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 884 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 885 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 888 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 889 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 890 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: Running task 891 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 892 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 899 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 900 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 912 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-5.1.16-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 915 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 916 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 917 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: Running task 918 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 919 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe libseccomp-2.5.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 920 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure)
NOTE: Running task 921 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure)
NOTE: Running task 922 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_configure)
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-obstack-1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: Running task 923 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_configure)
NOTE: recipe libmnl-1.0.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 924 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_configure)
NOTE: Running task 925 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: Running task 926 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure)
NOTE: Running task 927 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: Running task 928 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_configure)
NOTE: Running task 929 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_configure)
NOTE: recipe bash-5.1.16-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: Running task 930 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_configure)
NOTE: Running task 931 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_configure)
NOTE: recipe gmp-6.2.1-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.3-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_configure: Started
NOTE: recipe xz-5.2.5-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.2-r0: task do_configure: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_configure: Started
NOTE: recipe acl-2.3.1-r0: task do_configure: Started
NOTE: recipe iptables-1.8.8-r0: task do_configure: Started
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Started
NOTE: recipe bash-5.1.16-r0: task do_configure: Started
NOTE: recipe bash-completion-2.11-r0: task do_configure: Succeeded
NOTE: Running task 932 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_compile)
NOTE: recipe bash-completion-2.11-r0: task do_compile: Started
NOTE: recipe bash-completion-2.11-r0: task do_compile: Succeeded
NOTE: Running task 933 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_install)
NOTE: recipe argp-standalone-1.3-r0: task do_configure: Succeeded
NOTE: Running task 934 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_compile)
NOTE: recipe argp-standalone-1.3-r0: task do_compile: Started
NOTE: recipe bash-completion-2.11-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 935 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe argp-standalone-1.3-r0: task do_compile: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 936 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_install)
NOTE: Running task 937 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe argp-standalone-1.3-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.3-r0: task do_install: Succeeded
NOTE: Running task 938 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot)
NOTE: Running task 939 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package)
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_configure: Succeeded
NOTE: Running task 940 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_compile)
NOTE: recipe sqlite3-3_3.39.1-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2-r0: task do_configure: Succeeded
NOTE: Running task 941 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe musl-obstack-1.2-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 942 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package: Succeeded
NOTE: Running task 943 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata)
NOTE: recipe musl-obstack-1.2-r0: task do_compile: Succeeded
NOTE: Running task 944 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata: Started
NOTE: recipe musl-obstack-1.2-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 945 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 946 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe libmnl-1.0.5-r0: task do_configure: Succeeded
NOTE: recipe musl-obstack-1.2-r0: task do_install: Succeeded
NOTE: Running task 947 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_compile)
NOTE: Running task 948 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot)
NOTE: Running task 949 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe musl-obstack-1.2-r0: task do_package: Started
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 950 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_configure: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: Running task 951 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_configure_ptest_base)
NOTE: recipe musl-obstack-1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 952 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe libmnl-1.0.5-r0: task do_compile: Succeeded
NOTE: Running task 953 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Started
NOTE: recipe iptables-1.8.8-r0: task do_configure: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 954 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_compile)
NOTE: Running task 955 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_compile: Started
NOTE: Running task 956 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot)
NOTE: recipe acl-2.3.1-r0: task do_compile: Started
NOTE: Running task 957 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_install: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: Running task 958 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 959 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot)
NOTE: Running task 960 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 961 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe libmnl-1.0.5-r0: task do_install: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 962 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot)
NOTE: Running task 963 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_package)
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure: Succeeded
NOTE: Running task 964 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_configure_ptest_base)
NOTE: recipe acl-2.3.1-r0: task do_compile: Succeeded
NOTE: Running task 965 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_compile_ptest_base)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Started
NOTE: recipe musl-obstack-1.2-r0: task do_package: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 966 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile)
NOTE: Running task 967 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.2-r0: task do_packagedata: Started
NOTE: recipe acl-2.3.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 968 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install)
NOTE: recipe musl-obstack-1.2-r0: task do_packagedata: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_install: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: Running task 969 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata)
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Started
NOTE: recipe acl-2.3.1-r0: task do_install: Succeeded
NOTE: Running task 970 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_install_ptest_base)
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Started
NOTE: recipe libmnl-1.0.5-r0: task do_package: Succeeded
NOTE: Running task 971 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Started
NOTE: Running task 972 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot)
NOTE: Running task 973 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_package)
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe acl-2.3.1-r0: task do_package: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: Running task 974 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata)
NOTE: recipe iptables-1.8.8-r0: task do_compile: Succeeded
NOTE: Running task 975 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.8-r0: task do_install: Started
NOTE: recipe libgpg-error-1.45-r0: task do_configure: Succeeded
NOTE: Running task 976 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_configure_ptest_base)
NOTE: recipe libgpg-error-1.45-r0: task do_configure_ptest_base: Started
NOTE: recipe libgpg-error-1.45-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 977 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_compile: Started
NOTE: Running task 978 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_install: Succeeded
NOTE: Running task 979 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_populate_sysroot)
NOTE: Running task 980 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_package)
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.8-r0: task do_package: Started
NOTE: recipe xz-5.2.5-r0: task do_configure: Succeeded
NOTE: Running task 981 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_compile)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_compile: Started
NOTE: Running task 982 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_compile_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Started
NOTE: recipe acl-2.3.1-r0: task do_package: Succeeded
NOTE: Running task 983 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata)
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 984 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install)
NOTE: recipe acl-2.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install: Succeeded
NOTE: Running task 985 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_install_ptest_base)
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Started
NOTE: recipe bash-5.1.16-r0: task do_configure: Succeeded
NOTE: Running task 986 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_configure_ptest_base)
NOTE: recipe bash-5.1.16-r0: task do_configure_ptest_base: Started
NOTE: recipe bash-5.1.16-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 987 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_compile)
NOTE: recipe bash-5.1.16-r0: task do_compile: Started
NOTE: recipe xz-5.2.5-r0: task do_compile: Succeeded
NOTE: Running task 988 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_install)
NOTE: recipe xz-5.2.5-r0: task do_install: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 989 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot)
NOTE: Running task 990 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_package)
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_install: Succeeded
NOTE: Running task 991 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot)
NOTE: Running task 992 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package)
NOTE: recipe xz-5.2.5-r0: task do_package: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 993 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.42-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.45-r0: task do_compile: Succeeded
NOTE: Running task 994 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_compile_ptest_base)
NOTE: recipe file-5.42-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 995 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_configure)
NOTE: recipe libgpg-error-1.45-r0: task do_compile_ptest_base: Started
NOTE: recipe file-5.42-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.45-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 996 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_install)
NOTE: recipe libgpg-error-1.45-r0: task do_install: Started
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: Running task 997 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_install)
NOTE: recipe libgpg-error-1.45-r0: task do_install: Succeeded
NOTE: Running task 998 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_install_ptest_base)
NOTE: recipe zstd-1.5.2-r0: task do_install: Started
NOTE: recipe libgpg-error-1.45-r0: task do_install_ptest_base: Started
NOTE: recipe gmp-6.2.1-r0: task do_configure: Succeeded
NOTE: Running task 999 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_compile)
NOTE: recipe libgpg-error-1.45-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1000 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_populate_sysroot)
NOTE: Running task 1001 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_compile: Started
NOTE: recipe libgpg-error-1.45-r0: task do_package: Started
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot: Started
NOTE: recipe bash-5.1.16-r0: task do_compile: Succeeded
NOTE: Running task 1002 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_compile_ptest_base)
NOTE: recipe libgpg-error-1.45-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1003 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe bash-5.1.16-r0: task do_compile_ptest_base: Started
NOTE: recipe xz-5.2.5-r0: task do_package: Succeeded
NOTE: Running task 1004 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1005 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata: Succeeded
NOTE: recipe iptables-1.8.8-r0: task do_package: Succeeded
NOTE: Running task 1006 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.8.bb:do_packagedata)
NOTE: recipe iptables-1.8.8-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.8-r0: task do_packagedata: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_package: Succeeded
NOTE: Running task 1007 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata: Succeeded
NOTE: recipe libgpg-error-1.45-r0: task do_package: Succeeded
NOTE: Running task 1008 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.45.bb:do_packagedata)
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Started
NOTE: recipe libgpg-error-1.45-r0: task do_packagedata: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1009 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_install)
NOTE: recipe bash-5.1.16-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1010 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_install)
NOTE: recipe gmp-6.2.1-r0: task do_install: Started
NOTE: recipe gmp-6.2.1-r0: task do_install: Succeeded
NOTE: Running task 1011 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot)
NOTE: Running task 1012 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1013 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_compile)
NOTE: recipe libunistring-1.0-r0: task do_compile: Started
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1014 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1015 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_configure)
NOTE: recipe nettle-3.8-r0: task do_configure: Started
NOTE: recipe file-5.42-r0: task do_configure: Succeeded
NOTE: Running task 1016 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_compile)
NOTE: recipe file-5.42-r0: task do_compile: Started
NOTE: recipe bash-5.1.16-r0: task do_install: Succeeded
NOTE: Running task 1017 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_install_ptest_base)
NOTE: recipe bash-5.1.16-r0: task do_install_ptest_base: Started
NOTE: recipe zstd-1.5.2-r0: task do_install: Succeeded
NOTE: Running task 1018 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_populate_sysroot)
NOTE: Running task 1019 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_package)
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Started
NOTE: recipe gmp-6.2.1-r0: task do_package: Succeeded
NOTE: Running task 1020 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata)
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1021 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe file-5.42-r0: task do_compile: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1022 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_install)
NOTE: Running task 1023 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_configure)
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Started
NOTE: recipe file-5.42-r0: task do_install: Started
NOTE: recipe file-5.42-r0: task do_install: Succeeded
NOTE: Running task 1024 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_populate_sysroot)
NOTE: Running task 1025 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_package)
NOTE: recipe file-5.42-r0: task do_populate_sysroot: Started
NOTE: recipe file-5.42-r0: task do_package: Started
NOTE: recipe nettle-3.8-r0: task do_configure: Succeeded
NOTE: Running task 1026 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_configure_ptest_base)
NOTE: recipe file-5.42-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1027 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_compile)
NOTE: recipe nettle-3.8-r0: task do_compile: Started
NOTE: recipe zstd-1.5.2-r0: task do_package: Succeeded
NOTE: Running task 1028 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_packagedata)
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Started
NOTE: recipe zstd-1.5.2-r0: task do_packagedata: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure: Succeeded
NOTE: Running task 1029 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_configure_ptest_base)
NOTE: recipe file-5.42-r0: task do_package: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 1030 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.42.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1031 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile)
NOTE: recipe file-5.42-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Started
NOTE: recipe file-5.42-r0: task do_packagedata: Succeeded
NOTE: recipe bash-5.1.16-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1032 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_package)
NOTE: recipe bash-5.1.16-r0: task do_package: Started
NOTE: recipe bash-5.1.16-r0: task do_package: Succeeded
NOTE: Running task 1033 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata)
NOTE: recipe bash-5.1.16-r0: task do_packagedata: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata: Succeeded
NOTE: Running task 1034 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe nettle-3.8-r0: task do_compile: Succeeded
NOTE: Running task 1035 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile: Succeeded
NOTE: Running task 1036 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_compile_ptest_base)
NOTE: recipe nettle-3.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1037 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Started
NOTE: recipe nettle-3.8-r0: task do_install: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1038 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Started
NOTE: recipe nettle-3.8-r0: task do_install: Succeeded
NOTE: Running task 1039 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install: Succeeded
NOTE: recipe nettle-3.8-r0: task do_install_ptest_base: Started
NOTE: Running task 1040 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Started
NOTE: recipe nettle-3.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1041 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_populate_sysroot)
NOTE: Running task 1042 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_package)
NOTE: recipe nettle-3.8-r0: task do_populate_sysroot: Started
NOTE: recipe nettle-3.8-r0: task do_package: Started
NOTE: recipe nettle-3.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgcrypt-1.10.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1043 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_populate_sysroot)
NOTE: Running task 1044 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_package)
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.8-r0: task do_package: Succeeded
NOTE: Running task 1045 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.bb:do_packagedata)
NOTE: recipe nettle-3.8-r0: task do_packagedata: Started
NOTE: recipe nettle-3.8-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_configure: Succeeded
NOTE: Running task 1046 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_compile)
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_package: Succeeded
NOTE: Running task 1047 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.1.bb:do_packagedata)
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Started
NOTE: recipe libgcrypt-1.10.1-r0: task do_packagedata: Succeeded
NOTE: recipe libarchive-3.6.1-r0: task do_compile: Succeeded
NOTE: Running task 1048 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_install)
NOTE: recipe libarchive-3.6.1-r0: task do_install: Started
NOTE: recipe libarchive-3.6.1-r0: task do_install: Succeeded
NOTE: Running task 1049 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_populate_sysroot)
NOTE: Running task 1050 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_package)
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Started
NOTE: recipe libarchive-3.6.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_compile: Succeeded
NOTE: Running task 1051 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_install)
NOTE: recipe sqlite3-3_3.39.1-r0: task do_install: Started
NOTE: recipe libarchive-3.6.1-r0: task do_package: Succeeded
NOTE: Running task 1052 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.1.bb:do_packagedata)
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_install: Succeeded
NOTE: Running task 1053 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_populate_sysroot)
NOTE: Running task 1054 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_package)
NOTE: recipe libarchive-3.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_populate_sysroot: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_package: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.39.1-r0: task do_package: Succeeded
NOTE: Running task 1055 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.39.1.bb:do_packagedata)
NOTE: recipe sqlite3-3_3.39.1-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.39.1-r0: task do_packagedata: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1056 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_install)
NOTE: recipe libunistring-1.0-r0: task do_install: Started
NOTE: recipe libunistring-1.0-r0: task do_install: Succeeded
NOTE: Running task 1057 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot)
NOTE: Running task 1058 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_package)
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1059 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libidn2-2.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libidn2-2.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1060 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_configure)
NOTE: recipe libidn2-2.3.3-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_package: Succeeded
NOTE: Running task 1061 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata)
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata: Succeeded
NOTE: recipe libidn2-2.3.3-r0: task do_configure: Succeeded
NOTE: Running task 1062 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_compile)
NOTE: recipe libidn2-2.3.3-r0: task do_compile: Started
NOTE: recipe libidn2-2.3.3-r0: task do_compile: Succeeded
NOTE: Running task 1063 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_install)
NOTE: recipe libidn2-2.3.3-r0: task do_install: Started
NOTE: recipe libidn2-2.3.3-r0: task do_install: Succeeded
NOTE: Running task 1064 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_populate_sysroot)
NOTE: Running task 1065 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_package)
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot: Started
NOTE: recipe libidn2-2.3.3-r0: task do_package: Started
NOTE: recipe libidn2-2.3.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1066 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1067 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnutls-3.7.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe curl-7.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1068 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_configure)
NOTE: recipe curl-7.84.0-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1069 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_configure)
NOTE: recipe gnutls-3.7.6-r0: task do_configure: Started
NOTE: recipe libidn2-2.3.3-r0: task do_package: Succeeded
NOTE: Running task 1070 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.3.bb:do_packagedata)
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata: Started
NOTE: recipe libidn2-2.3.3-r0: task do_packagedata: Succeeded
NOTE: recipe curl-7.84.0-r0: task do_configure: Succeeded
NOTE: Running task 1071 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_configure_ptest_base)
NOTE: recipe curl-7.84.0-r0: task do_configure_ptest_base: Started
NOTE: recipe curl-7.84.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1072 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_compile)
NOTE: recipe curl-7.84.0-r0: task do_compile: Started
NOTE: recipe curl-7.84.0-r0: task do_compile: Succeeded
NOTE: Running task 1073 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_compile_ptest_base)
NOTE: recipe curl-7.84.0-r0: task do_compile_ptest_base: Started
NOTE: recipe curl-7.84.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1074 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_install)
NOTE: recipe curl-7.84.0-r0: task do_install: Started
NOTE: recipe curl-7.84.0-r0: task do_install: Succeeded
NOTE: Running task 1075 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_install_ptest_base)
NOTE: recipe curl-7.84.0-r0: task do_install_ptest_base: Started
NOTE: recipe curl-7.84.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1076 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_populate_sysroot)
NOTE: Running task 1077 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_package)
NOTE: recipe curl-7.84.0-r0: task do_populate_sysroot: Started
NOTE: recipe curl-7.84.0-r0: task do_package: Started
NOTE: recipe curl-7.84.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.84.0-r0: task do_package: Succeeded
NOTE: Running task 1078 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.84.0.bb:do_packagedata)
NOTE: recipe curl-7.84.0-r0: task do_packagedata: Started
NOTE: recipe curl-7.84.0-r0: task do_packagedata: Succeeded
NOTE: recipe gnutls-3.7.6-r0: task do_configure: Succeeded
NOTE: Running task 1079 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_compile)
NOTE: recipe gnutls-3.7.6-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.6-r0: task do_compile: Succeeded
NOTE: Running task 1080 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_install)
NOTE: recipe gnutls-3.7.6-r0: task do_install: Started
NOTE: recipe gnutls-3.7.6-r0: task do_install: Succeeded
NOTE: Running task 1081 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_populate_sysroot)
NOTE: Running task 1082 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_package)
NOTE: recipe gnutls-3.7.6-r0: task do_populate_sysroot: Started
NOTE: recipe gnutls-3.7.6-r0: task do_package: Started
NOTE: recipe gnutls-3.7.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1083 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1084 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_configure)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.6-r0: task do_package: Succeeded
NOTE: Running task 1085 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.6.bb:do_packagedata)
NOTE: recipe gnutls-3.7.6-r0: task do_packagedata: Started
NOTE: recipe gnutls-3.7.6-r0: task do_packagedata: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_configure: Succeeded
NOTE: Running task 1086 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_compile)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_compile: Succeeded
NOTE: Running task 1087 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_install)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_install: Succeeded
NOTE: Running task 1088 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_populate_sysroot)
NOTE: Running task 1089 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_package)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1090 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1091 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_configure)
NOTE: recipe elfutils-0.187-r0: task do_configure: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_package: Succeeded
NOTE: Running task 1092 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_packagedata)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_packagedata: Succeeded
NOTE: recipe elfutils-0.187-r0: task do_configure: Succeeded
NOTE: Running task 1093 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_compile)
NOTE: recipe elfutils-0.187-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_compile: Succeeded
NOTE: Running task 1094 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_install)
NOTE: recipe elfutils-0.187-r0: task do_install: Started
NOTE: recipe elfutils-0.187-r0: task do_install: Succeeded
NOTE: Running task 1095 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_populate_sysroot)
NOTE: Running task 1096 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_package)
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.187-r0: task do_package: Started
NOTE: recipe elfutils-0.187-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1097 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-5.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-5.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1098 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb:do_configure)
NOTE: recipe iproute2-5.19.0-r0: task do_configure: Started
NOTE: recipe iproute2-5.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1099 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb:do_compile)
NOTE: recipe iproute2-5.19.0-r0: task do_compile: Started
NOTE: recipe elfutils-0.187-r0: task do_package: Succeeded
NOTE: Running task 1100 of 1107 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.187.bb:do_packagedata)
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Started
NOTE: recipe elfutils-0.187-r0: task do_packagedata: Succeeded
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56 CC=i686-poky-linux-musl-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot KERNEL_INCLUDE=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include DOCDIR=/usr/share/doc/iproute2 SUBDIRS=lib tc ip bridge misc genl devlink tipc SBINDIR=/sbin LIBDIR=/usr/lib CCOPTS= -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0=/usr/src/debug/iproute2/5.19.0-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0=/usr/src/debug/iproute2/5.19.0-r0                      -fdebu
 g-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot-native=
| 
| lib
|     CC       libgenl.o
|     CC       libnetlink.o
|     CC       mnl_utils.o
|     CC       utils.o
|     CC       utils_math.o
|     CC       rt_names.o
|     CC       ll_map.o
|     CC       ll_types.o
|     CC       ll_proto.o
|     CC       ll_addr.o
|     CC       inet_proto.o
|     CC       namespace.o
|     CC       json_writer.o
|     CC       json_print.o
|     CC       json_print_math.o
|     CC       names.o
|     CC       color.o
|     CC       bpf_legacy.o
|     CC       bpf_glue.o
|     CC       exec.o
|     CC       fs.o
|     CC       cg_map.o
|     CC       ax25_ntop.o
|     CC       rose_ntop.o
|     CC       mpls_ntop.o
|     CC       mpls_pton.o
|     CC       netrom_ntop.o
| In file included from ll_types.c:24:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ll_types.c:16:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
| In file included from ll_proto.c:24:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ll_proto.c:16:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
| In file included from ll_addr.c:24:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ll_addr.c:16:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
| In file included from rose_ntop.c:16:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from rose_ntop.c:7:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
| utils.c: In function 'print_timestamp':
| utils.c:1234:38: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'suseconds_t' {aka 'long long int'} [-Wformat=]
|  1234 |                 fprintf(fp, "[%s.%06ld] ", tshort, tv.tv_usec);
|       |                                  ~~~~^             ~~~~~~~~~~
|       |                                      |               |
|       |                                      long int        suseconds_t {aka long long int}
|       |                                  %06lld
| utils.c:1239:46: warning: format '%ld' expects argument of type 'long int', but argument 4 has type 'suseconds_t' {aka 'long long int'} [-Wformat=]
|  1239 |                 fprintf(fp, "Timestamp: %s %ld usec\n",
|       |                                            ~~^
|       |                                              |
|       |                                              long int
|       |                                            %lld
|  1240 |                         tstr, tv.tv_usec);
|       |                               ~~~~~~~~~~
|       |                                 |
|       |                                 suseconds_t {aka long long int}
| bpf_legacy.c: In function 'bpf_obj_hash':
| bpf_legacy.c:1350:64: warning: format '%zu' expects argument of type 'size_t', but argument 4 has type 'off_t' {aka 'long long int'} [-Wformat=]
|  1350 |                 fprintf(stderr, "Error from sendfile (%zd vs %zu bytes): %s\n",
|       |                                                              ~~^
|       |                                                                |
|       |                                                                unsigned int
|       |                                                              %llu
|  1351 |                         size, stbuff.st_size, strerror(errno));
|       |                               ~~~~~~~~~~~~~~
|       |                                     |
|       |                                     off_t {aka long long int}
|     AR       libnetlink.a
|     AR       libutil.a
| 
| tc
|     CC       tc.o
|     CC       tc_qdisc.o
|     CC       tc_class.o
|     CC       tc_filter.o
|     CC       tc_util.o
|     CC       tc_monitor.o
|     CC       tc_exec.o
|     CC       m_police.o
|     CC       m_estimator.o
|     CC       m_action.o
|     CC       m_ematch.o
|     YACC     emp_ematch.tab.c
|     LEX      emp_ematch.lex.c
|     CC       q_fifo.o
|     CC       q_sfq.o
|     CC       q_red.o
|     CC       q_prio.o
|     CC       q_skbprio.o
|     CC       q_tbf.o
|     CC       q_cbq.o
|     CC       q_rr.o
|     CC       q_multiq.o
|     CC       q_netem.o
|     CC       q_sfb.o
|     CC       q_choke.o
|     CC       f_u32.o
|     CC       f_rsvp.o
|     CC       f_route.o
|     CC       f_fw.o
|     CC       f_basic.o
|     CC       f_flow.o
|     CC       f_bpf.o
|     CC       f_cgroup.o
|     CC       f_flower.o
|     CC       q_dsmark.o
|     CC       q_gred.o
|     CC       f_tcindex.o
|     CC       q_ingress.o
|     CC       q_hfsc.o
|     CC       q_htb.o
|     CC       q_drr.o
|     CC       q_qfq.o
|     CC       m_gact.o
|     CC       m_mirred.o
|     CC       m_mpls.o
|     CC       m_nat.o
|     CC       m_pedit.o
|     CC       m_ife.o
|     CC       m_skbedit.o
|     CC       m_skbmod.o
|     CC       m_csum.o
|     CC       m_simple.o
|     CC       m_vlan.o
|     CC       m_connmark.o
|     CC       m_ctinfo.o
|     CC       m_bpf.o
| In file included from ../include/uapi/linux/netdevice.h:29,
|                  from ../include/uapi/linux/if_arp.h:27,
|                  from f_flower.c:18:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from f_flower.c:16:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
|     CC       m_tunnel_key.o
|     CC       m_sample.o
|     CC       m_ct.o
|     CC       m_gate.o
|     CC       p_ip.o
|     CC       p_ip6.o
|     CC       p_icmp.o
|     CC       p_eth.o
|     CC       p_tcp.o
|     CC       p_udp.o
|     CC       em_nbyte.o
|     CC       em_cmp.o
|     CC       em_u32.o
|     CC       em_canid.o
|     CC       em_meta.o
|     CC       q_mqprio.o
|     CC       q_codel.o
|     CC       q_fq_codel.o
|     CC       q_fq.o
|     CC       q_pie.o
|     CC       q_fq_pie.o
|     CC       q_cake.o
|     CC       q_hhf.o
|     CC       q_clsact.o
|     CC       e_bpf.o
|     CC       f_matchall.o
|     CC       q_cbs.o
|     CC       q_etf.o
|     CC       q_taprio.o
|     CC       q_plug.o
|     CC       q_ets.o
|     CC       em_ipt.o
|     CC       em_ipset.o
|     CC       tc_core.o
|     CC       tc_red.o
|     CC       tc_cbq.o
|     CC       tc_estimator.o
|     CC       tc_stab.o
|     CC       tc_qevent.o
|     CC       m_xt.so
|     CC       emp_ematch.lex.o
|     CC       emp_ematch.tab.o
| In file included from ../include/uapi/linux/netfilter_ipv4/ip_tables.h:21,
|                  from m_xt.c:19:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from m_xt.c:16:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
| In file included from tc_util.h:7,
|                  from m_ematch.h:11,
|                  from em_ipset.c:42:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from ../include/xtables.h:17,
|                  from em_ipset.c:26:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
| In file included from tc_util.h:7,
|                  from m_ematch.h:11,
|                  from em_ipt.c:16:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from ../include/xtables.h:17,
|                  from em_ipt.c:15:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
|     AR       libtc.a
|     LINK     tc
| rm emp_ematch.lex.c
| 
| ip
|     CC       ip.o
|     CC       ipaddress.o
|     CC       ipaddrlabel.o
|     CC       iproute.o
|     CC       iprule.o
|     CC       ipnetns.o
|     CC       rtm_map.o
|     CC       iptunnel.o
|     CC       ip6tunnel.o
|     CC       tunnel.o
|     CC       ipneigh.o
|     CC       ipntable.o
|     CC       iplink.o
|     CC       ipmaddr.o
|     CC       ipmonitor.o
|     CC       ipmroute.o
|     CC       ipprefix.o
|     CC       iptuntap.o
|     CC       ipxfrm.o
|     CC       iptoken.o
|     CC       xfrm_state.o
|     CC       xfrm_policy.o
|     CC       xfrm_monitor.o
|     CC       iplink_ifb.o
|     CC       iplink_dummy.o
|     CC       iplink_nlmon.o
|     CC       iplink_vcan.o
|     CC       iplink_team.o
|     CC       iplink_vxcan.o
|     CC       iplink_vlan.o
|     CC       link_veth.o
|     CC       link_gre.o
|     CC       iplink_can.o
|     CC       iplink_xdp.o
|     CC       iplink_macvlan.o
|     CC       ipl2tp.o
|     CC       link_vti.o
|     CC       link_vti6.o
|     CC       link_xfrm.o
|     CC       iplink_vxlan.o
|     CC       tcp_metrics.o
|     CC       iplink_ipoib.o
|     CC       ipnetconf.o
|     CC       link_ip6tnl.o
|     CC       link_iptnl.o
|     CC       link_gre6.o
|     CC       iplink_bond.o
|     CC       iplink_bond_slave.o
|     CC       iplink_hsr.o
|     CC       iplink_bridge.o
|     CC       iplink_bridge_slave.o
|     CC       ipfou.o
|     CC       iplink_ipvlan.o
|     CC       iplink_geneve.o
|     CC       iplink_vrf.o
|     CC       iproute_lwtunnel.o
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from iptunnel.c:24:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from iptunnel.c:21:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_gre.c:20:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from link_gre.c:14:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
| In file included from ipmaddr.c:26:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from ipaddress.c:31:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ipmaddr.c:17:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ipaddress.c:19:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
| In file included from ipmroute.c:27:
| ../include/uapi/linux/sockios.h:45: warning: "SIOCGSTAMP" redefined
|    45 | #define SIOCGSTAMP      ((sizeof(struct timeval))  == 8 ? \
|       |
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/sys/ioctl.h:10,
|                  from ipmroute.c:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:108: note: this is the location of the previous definition
|   108 | #define SIOCGSTAMP      _IOR(0x89, 6, char[16])
|       |
| ../include/uapi/linux/sockios.h:47: warning: "SIOCGSTAMPNS" redefined
|    47 | #define SIOCGSTAMPNS    ((sizeof(struct timespec)) == 8 ? \
|       |
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/bits/ioctl.h:109: note: this is the location of the previous definition
|   109 | #define SIOCGSTAMPNS    _IOR(0x89, 7, char[16])
|       |
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_vti.c:20:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from link_vti.c:14:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_vti6.c:21:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from link_vti6.c:15:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_ip6tnl.c:20:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from link_ip6tnl.c:14:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_gre6.c:20:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from link_gre6.c:14:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
|     CC       ipmacsec.o
| In file included from ../include/uapi/linux/if_tunnel.h:6,
|                  from link_iptnl.c:21:
| ../include/uapi/linux/if.h:134: warning: "IFF_VOLATILE" redefined
|   134 | #define IFF_VOLATILE    (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST|IFF_ECHO|\
|       |
| In file included from link_iptnl.c:14:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot/usr/include/net/if.h:48: note: this is the location of the previous definition
|    48 | #define IFF_VOLATILE (IFF_LOOPBACK|IFF_POINTOPOINT|IFF_BROADCAST| \
|       |
|     CC       ipila.o
|     CC       iplink_xstats.o
|     CC       ipvrf.o
|     CC       ipseg6.o
|     CC       iplink_netdevsim.o
|     CC       iplink_rmnet.o
|     CC       ipnexthop.o
| xfrm_policy.c: In function 'xfrm_policy_default_print':
| xfrm_policy.c:1215:60: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
|  1215 |                         "BUG: short nlmsg len %u (expect %lu) for XFRM_MSG_GETDEFAULT\n",
|       |                                                          ~~^
|       |                                                            |
|       |                                                            long unsigned int
|       |                                                          %u
|     CC       ipmptcp.o
|     CC       iplink_bareudp.o
|     CC       iplink_wwan.o
|     CC       ipioam6.o
|     CC       iplink_amt.o
|     CC       iplink_batadv.o
|     CC       iplink_gtp.o
|     CC       iplink_virt_wifi.o
|     CC       rtmon.o
|     CC       ipstats.o
| ipnexthop.c: In function 'ipnh_parse_nhmsg':
| ipnexthop.c:377:78: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'unsigned int' [-Wformat=]
|   377 |                         fprintf(fp, "<nexthop id %u invalid gateway length %lu>\n",
|       |                                                                            ~~^
|       |                                                                              |
|       |                                                                              long unsigned int
|       |                                                                            %u
| ipstats.c: In function 'ipstats_show_64':
| ipstats.c:143:48: warning: implicit declaration of function 'MIN' [-Wimplicit-function-declaration]
|   143 |                 memcpy(__dest, RTA_DATA(__at), MIN(__at_sz, __var_sz)); \
|       |                                                ^~~
| ipstats.c:157:9: note: in expansion of macro 'IPSTATS_RTA_PAYLOAD'
|   157 |         IPSTATS_RTA_PAYLOAD(stats, at);
|       |         ^~~~~~~~~~~~~~~~~~~
|     LINK     rtmon
| In function 'xfrm_algo_parse',
|     inlined from 'xfrm_state_modify.constprop' at xfrm_state.c:573:5:
| xfrm_state.c:162:32: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
|   162 |                         buf[j] = val;
|       |                         ~~~~~~~^~~~~
|     LINK     ip
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld: ipstats.o: in function `ipstats_show_64':
| /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipstats.c:157: undefined reference to `MIN'
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld: ipstats.o: in function `ipstats_show_hw64':
| /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipstats.c:231: undefined reference to `MIN'
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/12.1.0/ld: ipstats.o: in function `ipstats_stat_desc_show_afstats_mpls':
| /usr/src/debug/iproute2/5.19.0-r0/iproute2-5.19.0/ip/ipstats.c:681: undefined reference to `MIN'
| collect2: error: ld returned 1 exit status
| make[1]: *** [Makefile:29: ip] Error 1
| make: *** [Makefile:77: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/temp/run.do_compile.871608:180 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/temp/run.do_compile.871608, line 180
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/temp/run.do_compile.871608, line 165
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/temp/run.do_compile.871608, line 170
| 	#4: base_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/temp/run.do_compile.871608, line 148
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/temp/run.do_compile.871608, line 142
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/temp/run.do_compile.871608, line 190
NOTE: recipe iproute2-5.19.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1100 tasks of which 793 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb:do_compile
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: iproute2-5.19.0-r0 do_compile: oe_runmake failed
ERROR: iproute2-5.19.0-r0 do_compile: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/temp/run.do_compile.871608', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/5.19.0-r0/temp/log.do_compile.871608
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.19.0.bb:do_compile) failed with exit code '1'

--===============6403122074503844133==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-iproute2-upgrade-5.18.0-5.19.0.patch"

RnJvbSBmMjYwMmQwZTFhNjc5OWY4NDI4NGRlYTk5ODc5YjFjNTUyOTZkODI0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgNCBBdWcgMjAyMiAxOToxNDoyOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGlw
cm91dGUyOiB1cGdyYWRlIDUuMTguMCAtPiA1LjE5LjAKCi0tLQogLi4uL2lwcm91dGUyL3tpcHJv
dXRlMl81LjE4LjAuYmIgPT4gaXByb3V0ZTJfNS4xOS4wLmJifSAgICAgICAgIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9pcHJvdXRlMi97aXByb3V0ZTJfNS4xOC4wLmJiID0+IGlwcm91
dGUyXzUuMTkuMC5iYn0gKDc1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2lwcm91dGUyL2lwcm91dGUyXzUuMTguMC5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvaXByb3V0ZTIvaXByb3V0ZTJfNS4xOS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNzUlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvaXByb3V0ZTIvaXByb3V0ZTJfNS4xOC4w
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUy
XzUuMTkuMC5iYgppbmRleCAzZTAxYzcwODAxLi43ODYwZjJjMTVkIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzUuMTguMC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2lwcm91dGUyL2lwcm91dGUyXzUuMTkuMC5iYgpAQCAt
NCw3ICs0LDcgQEAgU1JDX1VSSSA9ICIke0tFUk5FTE9SR19NSVJST1J9L2xpbnV4L3V0aWxzL25l
dC8ke0JQTn0vJHtCUH0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtbGliYy1jb21w
YXQuaC1hZGQtbXVzbC13b3JrYXJvdW5kLnBhdGNoIFwKICAgICAgICAgICAgIgogCi1TUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiNWJhM2Q0NjRkNTFjOGMyODM1NTBkNTA3ZmZhYzNkMTBmN2FlYzU4N2I3
YzY2YjBjY2I2OTUwNjQzNjQ2Mzg5ZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIyNmI3YTM0ZDZh
N2ZkMmY3YTQyZTJiMzljNWE5MGNiNjFiYWM1MjJkMTA5NjA2N2ZmZWIxOTVlNTY5M2Q3NzkxIgog
CiAjIENGTEFHUyBhcmUgY29tcHV0ZWQgaW4gTWFrZWZpbGUgYW5kIHJlZmVyZW5jZSBDQ09QVFMK
ICMKLS0gCjIuMzEuMQoK

--===============6403122074503844133==--

