Return-Path: <bluelightning@bluelightning.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 899ABC433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 03:55:14 +0000 (UTC)
Received: from mail-49-r22.ipv4.per01.ds.network
 (mail-49-r22.ipv4.per01.ds.network [27.123.26.153])
 by mx.groups.io with SMTP id smtpd.web09.3163.1644551712949042260
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Feb 2022 19:55:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@softec.co.nz header.s=default
 header.b=bXBVQqMv;
 spf=none, err=permanent DNS error (domain: bluelightning.org,
 ip: 27.123.26.153, mailfrom: bluelightning@bluelightning.org)
Received: from server-72-r70.ipv4.per01.ds.network (cp-fp06.syd02.ds.network
 [122.201.124.108])
	by halon-out01.au.ds.network (Halon) with ESMTPS
	id 5cee8abc-8aee-11ec-ac72-f8db88ea9a09;
	Fri, 11 Feb 2022 11:54:51 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=softec.co.nz; s=default; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=My2av1rUkTRmEip+mUs9P9Vvnux5CFrN/p3hxLKCzO0=; b=bXBVQqMv9xMndyuU0Rnm0mOFje
	ycYRSGXUMkQVdroNCJt47EqL89Ghf3AeMVvRu6yCGFCWg1kQ4HxQrRDAZrwjXJyBxc1wWSR6rkvfX
	dKazgYsEhjQqKAPIxFZoxWXOWxhY5VfWU+xG7n+qYgVBi3wZPYj488zQO1odRJi2/X2D9DcA3Lp/w
	HsWdG3BVyX6eS03IXAz93AO1jcYuW/dfXrArllwymFG99GNYLBuwPXrss285ddc4cMmPD2LsOPp4E
	+wA2Wa0QYUXrB7stjGJqlb0iyyplKD7B0WjU/0ZWNBawZZTm/Ej6hmTYHz0e2G7Bt0fa+vIYhxZ0g
	H11qmIRg==;
Received: from [151.210.145.42] (port=52222 helo=linc.localnet)
	by cp-fp06.syd02.ds.network with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <bluelightning@bluelightning.org>)
	id 1nIN1Z-00ARIB-0c; Fri, 11 Feb 2022 16:55:09 +1300
From: Paul Eggleton <bluelightning@bluelightning.org>
To: openembedded-core@lists.openembedded.org
Cc: Andres Beltran <abeltran@linux.microsoft.com>,
 Joshua Watt <jpewhacker@gmail.com>, Saul Wold <saul.wold@windriver.com>
Subject: Re: [OE-core] [PATCH v2] create-spdx: add support for SDKs
Date: Fri, 11 Feb 2022 16:55:08 +1300
Message-ID: <22530826.6Emhk5qWAg@linc>
In-Reply-To: <20220126181648.20864-1-abeltran@linux.microsoft.com>
References: <20220126181648.20864-1-abeltran@linux.microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp-fp06.syd02.ds.network
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bluelightning.org
X-Get-Message-Sender-Via: cp-fp06.syd02.ds.network: authenticated_id:
 paul@softec.co.nz
X-Authenticated-Sender: cp-fp06.syd02.ds.network: paul@softec.co.nz
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Feb 2022 03:55:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161634

On Thursday, 27 January 2022 07:16:48 NZDT Andres Beltran wrote:
> Currently, SPDX SBOMs are only created for images. Add support for
> SDKs. Fix json indent when outputting SBOMs for better readability.

Hey folks, gentle ping on this patch - any comments?

Thanks
Paul



