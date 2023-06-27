Return-Path: <jorcrous@amazon.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A73EB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 17:10:34 +0000 (UTC)
Received: from smtp-fw-80009.amazon.com (smtp-fw-80009.amazon.com [99.78.197.220])
 by mx.groups.io with SMTP id smtpd.web11.1171.1687885831568218277
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 10:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amazon.com header.s=amazon201209 header.b=Pjy9alzX;
 spf=pass (domain: amazon.com, ip: 99.78.197.220, mailfrom: prvs=5355c91c5=jorcrous@amazon.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1687885831; x=1719421831;
  h=date:from:to:cc:message-id:references:mime-version:
   in-reply-to:subject;
  bh=eEhohkmZgcOsRpjxMsa4IhdCXm6poa01o6MRM93KAMU=;
  b=Pjy9alzXIkKEeveGC/darQmo6RwTws622NlW9eEAHGJS3+azhxinJNLr
   tfyjn+dpChivOuoR42YuvoF+x+CtZAXRhCFn2+ucURLrgx4YltcX7Q2QT
   HDqBJCfcFs9MTE+I8LL4/MmvLKclXkHSkmJzeiGN7y9RfEF2BivbQlLzu
   U=;
X-IronPort-AV: E=Sophos;i="6.01,163,1684800000"; 
   d="scan'208";a="12739720"
Subject: Re: [OE-core] [PATCH 3/3] vulkan-validation: Add the official Vulkan
 validation layers
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO email-inbound-relay-pdx-2c-m6i4x-b1c0e1d0.us-west-2.amazon.com) ([10.25.36.214])
  by smtp-border-fw-80009.pdx80.corp.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 17:10:30 +0000
Received: from EX19MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
	by email-inbound-relay-pdx-2c-m6i4x-b1c0e1d0.us-west-2.amazon.com (Postfix) with ESMTPS id A7D1F80E53;
	Tue, 27 Jun 2023 17:10:30 +0000 (UTC)
Received: from EX19D047UWB002.ant.amazon.com (10.13.138.34) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 27 Jun 2023 17:10:30 +0000
Received: from amazon.com (10.135.228.27) by EX19D047UWB002.ant.amazon.com
 (10.13.138.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 27 Jun
 2023 17:10:30 +0000
Date: Tue, 27 Jun 2023 11:10:28 -0600
From: Jordan Crouse <jorcrous@amazon.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Vincent Davis Jr <vince@underview.tech>,
	<openembedded-core@lists.openembedded.org>
Message-ID: <20230627171028.j6yianz4ppa4skff@amazon.com>
References: <20221114152347.z67ftsylidd3tfjt@amazon.com>
 <21434.1685656554319162310@lists.openembedded.org>
 <CANNYZj-+shiYOgREJM65W4-5=toqiJ_5=HuJEz1tN6vfTGs9-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CANNYZj-+shiYOgREJM65W4-5=toqiJ_5=HuJEz1tN6vfTGs9-Q@mail.gmail.com>
X-Originating-IP: [10.135.228.27]
X-ClientProxiedBy: EX19D043UWA004.ant.amazon.com (10.13.139.41) To
 EX19D047UWB002.ant.amazon.com (10.13.138.34)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 17:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183495

On Fri, Jun 02, 2023 at 07:21:13AM +0200, Alexander Kanavin wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you can confirm the sender and know the content is safe.
> 
> 
> 
> Given that this was in November last year, I think the best course of
> action is for you to take the proposed patch and fix it into a state
> that can be merged.

I couldn't figure out why it kept failing the verification. I need to
pick it back up but I got distracted by other things. If you manage to
figure it out, please merge on with my blessing.

Jordan

