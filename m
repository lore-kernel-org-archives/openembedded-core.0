Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0549FC32774
	for <webhook@archiver.kernel.org>; Thu, 25 Aug 2022 15:36:30 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web12.25341.1661441786797679003
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 08:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout09.t-online.de (Postfix) with SMTP id BBC621E50B;
	Thu, 25 Aug 2022 17:36:24 +0200 (CEST)
Received: from [192.168.178.83] ([84.163.38.226]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oREu7-489be40; Thu, 25 Aug 2022 17:36:23 +0200
Date: Thu, 25 Aug 2022 17:36:17 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] connman: add PACKAGECONFIG to support iwd
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Cc: Ross Burton <ross.burton@arm.com>,
	openembedded-core@lists.openembedded.org
Message-Id: <HOG6HR.F19M3US4K2XI@t-online.de>
In-Reply-To: <2d8ddc57-2f9f-f909-3b26-6b1810ee5d83@theobroma-systems.com>
References: <20220824125037.4855-1-f_l_k@t-online.de>
	<D7DA9B94-3FFE-4817-9279-3420BB423AC2@arm.com>
	<2d8ddc57-2f9f-f909-3b26-6b1810ee5d83@theobroma-systems.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-uTydWtxFGzakYBz3x2nn"
X-TOI-EXPURGATEID: 150726::1661441783-01447895-E9F17E8E/0/0 CLEAN NORMAL
X-TOI-MSGID: f47944f5-1224-484e-b46d-3714728fed89
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Aug 2022 15:36:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169879

--=-uTydWtxFGzakYBz3x2nn
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 25. Aug 2022 um 16:59:58 +0200 schrieb Quentin Schulz 
<quentin.schulz@theobroma-systems.com>:
> From the comment " For smooth operation it would be best to start 
> only one wireless daemon at a time." I gathered that both can be 
> enabled at once.

Correct. Connman doesn't really care if both wpa_supplicant and iwd are 
running. It's just that it then defaults to using wpa_supplicant. So to 
have a working out-of-box experience for iwd, you would either have to 
make them mutually exclusive, or change the Connman default 
configuration for iwd during installation.

I made this additional configure option to try to make it more visible 
that a decision should be made here. Additionally, the wireless daemon 
could be selected in a nicer way from a bbappend or e.g. local.conf.

If wpa_supplicant is preset in PACKAGECONFIG, we would always have to 
do a PACKAGECONFIG:remove for it.

For example, if we override this option in local.conf or distro.conf, 
we can make this decision visible to other recipes that might depend on 
this setting.


--=-uTydWtxFGzakYBz3x2nn
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Do, 25. Aug 2022 um 16:59:58 +0200 s=
chrieb Quentin Schulz &lt;quentin.schulz@theobroma-systems.com&gt;:<br><blo=
ckquote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-=
spaces;">From the comment " For smooth operation it would be best to start =
only one wireless daemon at a time." I gathered that both can be enabled at=
 once.</div></blockquote><div><br></div><div><div>Correct. Connman doesn't =
really care if both wpa_supplicant and iwd are running. It's just that it t=
hen defaults to using wpa_supplicant. So to have a working out-of-box exper=
ience for iwd, you would either have to make them mutually exclusive, or ch=
ange the Connman default configuration for iwd during installation.</div><d=
iv><br></div><div>I made this additional configure option to try to make it=
 more visible that a decision should be made here. Additionally, the wirele=
ss daemon could be selected in a nicer way from a bbappend or e.g. local.co=
nf.</div><div><br></div><div>If wpa_supplicant is preset in PACKAGECONFIG, =
we would always have to do a PACKAGECONFIG:remove for it.</div><div><br></d=
iv><div>For example, if we override this option in local.conf or distro.con=
f, we can make this decision visible to other recipes that might depend on =
this setting.</div></div></div>
--=-uTydWtxFGzakYBz3x2nn--


