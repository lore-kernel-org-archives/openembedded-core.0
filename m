Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BECDCCA476
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 11:48:44 +0000 (UTC)
Received: from drive300.trustyservers.com (drive300.trustyservers.com [64.118.86.28])
 by mx.groups.io with SMTP id smtpd.web11.3259.1760127579591324924
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Oct 2025 13:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@beroset.com header.s=default header.b=mj89MPee;
 spf=softfail (domain: ieee.org, ip: 64.118.86.28, mailfrom: beroset@ieee.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=beroset.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:Subject:From:To:
	MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kMpDlzGd2zW5FfXR06DSX2Iblb0TMzHbRg/WWA7/t24=; b=mj89MPee3Pq2TU0qdoB0EPXNH3
	BEkHNQ3XHn1f0dET4Ua9erKyPxShRlc/o822suPHLVSW+lHmcK4Av0hLWe3b7tov1PC1oldY3u9rI
	Eip9eb9biozaUbw+/MhylvJFeUYdS3gIts129ntmMuQaq90jJCl2rdkv7WyoHIdGEZw/aO7rnPwRG
	qU9CxPwXKByWhLA033a3LGS5AMkiw793LMWeOoSaqoF6kA+Ea4h3yQPukdNiprxLeZw/KGtpyurIX
	MeVgTSLFtRwzV9rybyPO8qtu5naaFQjmQni8eXiPK4JczDnRDJemp8UxUbMeQQ+PaZCKzQHVB0MT9
	e9NKg19w==;
Received: from 104-185-76-86.lightspeed.rlghnc.sbcglobal.net ([104.185.76.86]:49920 helo=[192.168.1.213])
	by drive300.trustyservers.com with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.98.2)
	(envelope-from <beroset@ieee.org>)
	id 1v7JCu-00000001gNK-3PZ1
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Oct 2025 15:55:16 -0400
Message-ID: <392f086c-ef19-468e-a3bd-1881b009d030@ieee.org>
Date: Fri, 10 Oct 2025 15:55:15 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: openembedded-core@lists.openembedded.org
From: Ed Beroset <beroset@ieee.org>
Subject: [walnascar] flex: fix for gcc15
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - drive300.trustyservers.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - ieee.org
X-Get-Message-Sender-Via: drive300.trustyservers.com: authenticated_id: eddieieee@beroset.com
X-Authenticated-Sender: drive300.trustyservers.com: eddieieee@beroset.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Oct 2025 11:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224716

I was trying to build the walnascar version of an SDK yesterday on a 
Fedora machine with gcc 15 installed and got several errors compiling 
flex.  I found that doing a cherry-pick of mainline patch 
e1832f02d70bd4082bc82ae2983546c880818491 fixed all errors, so my request 
is that this patch be applied to walnascar.

Ed


