Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9816AC43334
	for <webhook@archiver.kernel.org>; Thu,  9 Jun 2022 09:21:41 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by mx.groups.io with SMTP id smtpd.web08.8542.1654766497186466662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jun 2022 02:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm2
 header.b=sKbYWfyp;
 spf=pass (domain: zhukoff.net, ip: 66.111.4.28, mailfrom: pavel@zhukoff.net)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 7C6B15C01A5;
	Thu,  9 Jun 2022 05:21:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 09 Jun 2022 05:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1654766492; x=1654852892; bh=9H76YVxvSxLFUaDC5HadgO4Lw
	yw7/1G8gLmX8vkIHa4=; b=sKbYWfypubs4NyefTycF/V0pgxpr3LG9TqGFurpnX
	3Qexh1J2TyL5b97pAR+l85KZWfeQa11Xr7v5Xo1grdnU34RM2Gju6XNBtnjfNJjk
	DamFtJa1lK5v3jAHadzA0ssw53Nsg5QzNdloZd9LIU3tGmZ99Sca37KWZJgaZhB8
	FLXQeEagdpYeZkC4CZ1PJ8mtFzsqyj+evO5veSXBhdnHZc6LFvIAgYQJm1L+328C
	73d5wvyqw0RszG0cFdCpm2LklCScwrhwxj0tyvtO/j1kZeLIYw5Iqay02fJs4G+Y
	pnCeQ2GB1QI9hdroc98YyP8F9EVxFMcO4cp2JswLEIWug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1654766492; x=1654852892; bh=9H76YVxvSxLFUaDC5HadgO4Lwyw7/1G8gLm
	X8vkIHa4=; b=bsHI7uupV53XbombX4QnxWWm3LiKRj0xwyyuRMNRgOHA7kKTwk3
	5SDdFttOJSEiqxIFfMU0JkXps4FaILNFMV1rBFR1GtXsQzWalRF9pi15L3VaOLPH
	T88EgCjMxlw8HXrIj+B+sdbQY9DAQdBan3/8CFcLRGDzj3sPK9SSijMLbdklBGFT
	waXVQCdn1zenFVNncHBKhA588l+ngSpZUtM6dzeIRy32iOz1PtUkXpjfAJ4Z+8Qw
	4/3iYDS31qaOAbmAJlr/mZeHksEYsgPB+J+uOmjGm9Yy89UbPXPO7B9cfJMWRP/U
	DAlSC+9pTjZXj00uGFA6cLla3O/he5sniHQ==
X-ME-Sender: <xms:nLuhYjzfKRUzH1C-nm3nfYke3BOxC_kzo0MiVM8ByYxcbD41VqWKug>
    <xme:nLuhYrQQqrwMYNbdnN_xBjvh5Wa54waT_4TsibXFyoZ7J6GH-xG_Lprfll8Ddnd6N
    sAhQQYNk_yaSwpVmME>
X-ME-Received: 
 <xmr:nLuhYtUsu5T901jluOOr_G9_SA1FltSjSDeYYruLbJmyw8s9l4ccwAmc-p1RvQc2heUZ9Y-YsYHpyRjDkWm-mZc>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedruddtledguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefhvfevufffkffoggfgsedtkeertd
    ertddtnecuhfhrohhmpefrrghvvghlucgkhhhukhhovhcuoehprghvvghlseiihhhukhho
    fhhfrdhnvghtqeenucggtffrrghtthgvrhhnpeeftdeuuefgveeufedtveevtdejhfduff
    ejfedtgfelheekkeelueejveduleffvdenucffohhmrghinhepihhnihhtrdhshhenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehprghvvghlse
    iihhhukhhofhhfrdhnvght
X-ME-Proxy: <xmx:nLuhYtjgOM1dkS_WoIIBfbD3LCtx0A_rT-Ka1ohE3T9WQE2K_cW9fg>
    <xmx:nLuhYlCQnU66ax3W8sAhz6fcOH5eAS88lKLUVe0TjgbR8YBE0MKO2Q>
    <xmx:nLuhYmLuZPNZ-SEdP-POn67xSe6_HgqAFH_uQAA9ZQNSulHpasTceg>
    <xmx:nLuhYi4vioqeNB0Xw7_QZILZOKmX-UhGfxeQYkq4mcTZd_W2Qjj38A>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Jun 2022 05:21:31 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Pavel Zhukov <pavel.zhukov@huawei.com>,
	pavel@zhukoff.net
Subject: [PATCH] dbus: Soecify runstatedir configure option
Date: Thu,  9 Jun 2022 11:21:19 +0200
Message-Id: <20220609092119.5890-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jun 2022 09:21:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166764

From: Pavel Zhukov <pavel.zhukov@huawei.com>

Without specifing runstatedir tmpfiles.d is configured to use /var/run
for dbus and this causes deprecation warnings in system logs.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 meta/recipes-core/dbus/dbus_1.14.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus_1.14.0.bb b/meta/recipes-core/dbus/dbus_1.14.0.bb
index 7598c45f8e..0046b9fda2 100644
--- a/meta/recipes-core/dbus/dbus_1.14.0.bb
+++ b/meta/recipes-core/dbus/dbus_1.14.0.bb
@@ -24,6 +24,7 @@ EXTRA_OECONF = "--disable-xml-docs \
                 --enable-tests \
                 --enable-checks \
                 --enable-asserts \
+                --runstatedir=/run \
                 "
 EXTRA_OECONF:append:class-target = " SYSTEMCTL=${base_bindir}/systemctl"
 
@@ -131,7 +132,7 @@ do_install() {
 		sed 's:@bindir@:${bindir}:' < ${WORKDIR}/dbus-1.init >${WORKDIR}/dbus-1.init.sh
 		install -m 0755 ${WORKDIR}/dbus-1.init.sh ${D}${sysconfdir}/init.d/dbus-1
 		install -d ${D}${sysconfdir}/default/volatiles
-		echo "d messagebus messagebus 0755 ${localstatedir}/run/dbus none" \
+		echo "d messagebus messagebus 0755 /run/dbus none" \
 		     > ${D}${sysconfdir}/default/volatiles/99_dbus
 	fi
 
-- 
2.35.1


