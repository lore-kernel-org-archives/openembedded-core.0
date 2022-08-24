Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19755C00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 07:17:11 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.8254.1661325420179349698
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 00:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18,
 mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout04.t-online.de (Postfix) with SMTP id 41F8EA47
	for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 09:16:57 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.43.62]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oQkdF-1IZ3Oy0; Wed, 24 Aug 2022 09:16:57 +0200
Date: Wed, 24 Aug 2022 09:16:51 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: wpa_supplicant automatic installation
To: oe-core <openembedded-core@lists.openembedded.org>
Message-Id: <3WY3HR.RNOTS1HY3V0T@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-fNAP3/NytkxSPbWsUeXe"
X-TOI-EXPURGATEID: 150726::1661325417-01441FA6-6B0A79EA/0/0 CLEAN NORMAL
X-TOI-MSGID: 6690aa3d-81e3-4989-be61-3937bd73c0f7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 07:17:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169782

--=-fNAP3/NytkxSPbWsUeXe
Content-Type: text/plain; charset=us-ascii; format=flowed

Hi,

one question regarding this part of packagegroup-base.bb:

SUMMARY:packagegroup-base-wifi = "WiFi support"
RDEPENDS:packagegroup-base-wifi = "\
    iw \
    wireless-regdb-static \
    wpa-supplicant"

wpa_supplicant gets installed on every system, that has DISTRO_FEATURE 
wifi set, which gets problematic, once you want to replace it. Would it 
be conceivable to remove wpa_supplicant from 
RDEPENDS:packagegroup-base-wifi and instead hand over the 
responsibility for the wireless daemon to be used to the recipes in 
particular the network managers ?

Otherwise choice would be broken.


--=-fNAP3/NytkxSPbWsUeXe
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Hi,</div><div><br></div><div>one question regarding this part of packagegroup-base.bb:</div><div><br></div><div><pre style="color: rgb(232, 230, 227); font-variant-ligatures: normal; orphans: 2; widows: 2; text-decoration-thickness: initial;"><pre style="color: rgb(0, 0, 0); font-variant-ligatures: normal; text-decoration-thickness: initial;">SUMMARY:packagegroup-base-wifi = "WiFi support"
RDEPENDS:packagegroup-base-wifi = "\
    iw \
    wireless-regdb-static \
    wpa-supplicant"</pre></pre></div><div><br></div><div>wpa_supplicant gets installed on every system, that has DISTRO_FEATURE wifi set, which gets problematic, once you want to replace it. Would it be conceivable&nbsp;to remove&nbsp;wpa_supplicant&nbsp;from RDEPENDS:packagegroup-base-wifi and instead hand over the responsibility for the wireless daemon to be used to the recipes in particular the network managers ?</div><div><br></div><div>Otherwise choice would be broken.</div></div>
--=-fNAP3/NytkxSPbWsUeXe--


