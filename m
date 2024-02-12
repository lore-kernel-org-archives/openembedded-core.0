Return-Path: <Markus.Niebel@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20671C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 13:06:39 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.5919.1707743195023529783
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:06:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=hAKOnd/3;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: markus.niebel@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1707743195; x=1739279195;
  h=message-id:subject:from:to:date:mime-version:
   content-transfer-encoding;
  bh=vw869REnLocbMngVCs7WkurSyTZ6FSLBell+nRqe6Qw=;
  b=hAKOnd/3A5jueYw5HaNwzVvBK/zhuYz+8Hq30Rl1hRfi/49dTqkmreLh
   4Ye7xAV2PhlJvpgtVeqIgHNlsb+augtk7JSHizgytEVTHc/X4CavLnLLm
   DBBHUZFLwGxqANQ4kpdyHNo6H0kCW6jt19so53N2z0cVpx1nkH5Fk25fV
   K50e+j+2TU9M7hE95xLvaPQW81aV0HBxpFCipUJxaOtrGX3zYM0oIgfQJ
   mYwyJ4ygxDVxlNQ6pZPU2t/O321y2+/bCGKNv24UDDCT6XOi/7iP3b5hl
   fR5eZpDi7lGKpzfk/h+REirYMwbbcGGLEzIdIqeygrh2aJeI0oyTYa54o
   A==;
X-IronPort-AV: E=Sophos;i="6.06,263,1705359600"; 
   d="scan'208";a="35360325"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 12 Feb 2024 14:06:33 +0100
Received: from NIEBEL-W3.tq-net.de (NIEBEL-W3.tq-net.de [10.123.53.155])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 5838B280075
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:06:33 +0100 (CET)
Message-ID: <19b4555c2cc17fca8f53064fc7e77a50e14d9e47.camel@ew.tq-group.com>
Subject: populate_sdk_ext.bbclass: include files for auto.conf are not
 handled
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Feb 2024 14:06:32 +0100
Organization: TQ Systems GmbH
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 13:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195318

Hello,

just a question because I'm not sure if this is an error / issue or if I missed a piece of documentation:

Part of populate_sdk_ext.bbclass is assembling of the current configuration from the conf directory. When files like auto.conf use the 'include' statement the files to be included are not copied.
This will lead to an error in do_populate_sdk_ext.

Question: Is this intended, e.g. 'include' shall not be used for files under 'conf' or should this work?

Use case: separation of configurations sharing most things and bring in slightly differences via includes.

Thank you

Markus

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
http://www.tq-group.com/


