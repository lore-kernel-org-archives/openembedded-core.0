Return-Path: <enrico.scholz@sigma-chemnitz.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C24C5475B
	for <webhook@archiver.kernel.org>; Mon, 11 Mar 2024 18:13:01 +0000 (UTC)
Received: from smtpout.cvg.de (smtpout.cvg.de [87.128.211.67])
 by mx.groups.io with SMTP id smtpd.web10.493.1710180771576215359
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Mar 2024 11:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@sigma-chemnitz.de header.s=v2022040800 header.b=FJg7NtUa;
 spf=pass (domain: sigma-chemnitz.de, ip: 87.128.211.67, mailfrom: enrico.scholz@sigma-chemnitz.de)
Received: from mail-mta-2.intern.sigma-chemnitz.de (mail-mta-2.intern.sigma-chemnitz.de [192.168.12.70])
	by mail-out-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTPS id 42BICnhE167031
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 19:12:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2022040800; t=1710180769;
	bh=lx3mVYVYDFDC1+pYd1tFzfkIo/8Wn3BA1LwpYwgf0uM=; l=414;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FJg7NtUabqRqSp3Z9TGRNVsFb4KoRdjjtpEBgJFcB8sLKsjiXSaCfh9wQvAwKl6NC
	 ojD/9Ww+AvL3X8mB2Qe3+uLB9RvjReH9nZPU8ROtXA4T9v//l3V+NcJYBixqGJR0Ge
	 xMNBlv+kaJmW24LDhsZyXFlg3ZTXoGuTfaLu19sQzYE+oNcS84ZKRTwof4kI19S6qI
	 vrb+AK6eWYPidlhkZRwGx3D+cXwCTmEq06JG8MNmO0wa93GoE4hNt/Ix/X60mX3+1T
	 dBAJVPH943PiHa13T74f4H0xxJHBx6YuSb5xzT30wIddhFvHQsdD2btg/G1Eu4/rfL
	 3LhYMlViBRxVg==
Received: from reddoxx.intern.sigma-chemnitz.de (reddoxx.sigma.local [192.168.16.32])
	by mail-mta-2.intern.sigma-chemnitz.de (8.17.1/8.17.1) with ESMTP id 42BIClLT211752
	for <openembedded-core@lists.openembedded.org> from enrico.scholz@sigma-chemnitz.de; Mon, 11 Mar 2024 19:12:47 +0100
Received: from mail-msa-3.intern.sigma-chemnitz.de ([192.168.12.73])
	by reddoxx.intern.sigma-chemnitz.de with ESMTP
	id Q7SI2VQUFL; Mon, 11 Mar 2024 19:12:46 +0100
Received: from ensc-pc.intern.sigma-chemnitz.de (ensc-pc.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-3.intern.sigma-chemnitz.de (8.15.2/8.15.2) with ESMTPS id 42BICjOx105749
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Mon, 11 Mar 2024 19:12:46 +0100
Received: from ensc by ensc-pc.intern.sigma-chemnitz.de with local (Exim 4.97.1)
	(envelope-from <ensc@sigma-chemnitz.de>)
	id 1rjk8j-0000000DbuK-3sJu;
	Mon, 11 Mar 2024 19:12:45 +0100
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: patchtest@automation.yoctoproject.org
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Patchtest results for [PATCH 2/7] openssh-config: initial checkin
In-Reply-To: <0101018e2e9afb18-ff562683-59f3-418d-b628-74dfc3f7f152-000000@us-west-2.amazonses.com>
	(patchtest@automation.yoctoproject.org's message of "Mon, 11 Mar 2024
	17:41:32 +0000")
References: <507a19c6164d34669ff09794134257835063af64.1710177387.git.enrico.scholz@sigma-chemnitz.de>
	<0101018e2e9afb18-ff562683-59f3-418d-b628-74dfc3f7f152-000000@us-west-2.amazonses.com>
Date: Mon, 11 Mar 2024 19:12:45 +0100
Message-ID: <lyedcgbpsy.fsf@ensc-pc.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-REDDOXX-Id: 65ef499eb121c496daa8efa4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Mar 2024 18:13:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196963

patchtest@automation.yoctoproject.org writes:

> FAIL: test lic files chksum modified not mentioned: LIC_FILES_CHKSUM changed without "License-Update:" tag and description in commit message (test_metadata.TestMetadata.test_lic_files_chksum_modified_not_mentioned)

This failure seems to be bogus; patch creates a new recipe with a new
LIC_FILES_CHKSUM.  It does not change/update an existing tag.


Enrico

