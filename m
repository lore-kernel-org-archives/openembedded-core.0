Return-Path: <niko.mauno@iki.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223A7C52D6D
	for <webhook@archiver.kernel.org>; Sat,  3 Aug 2024 10:56:12 +0000 (UTC)
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [185.226.149.38])
 by mx.groups.io with SMTP id smtpd.web10.6445.1722682562609221334
 for <openembedded-core@lists.openembedded.org>;
 Sat, 03 Aug 2024 03:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@runbox.com header.s=selector1 header.b=26J8uqAh;
 spf=pass (domain: runbox.com, ip: 185.226.149.38, mailfrom: realint@runbox.com)
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <realint@runbox.com>)
	id 1saCQa-005THn-2U
	for openembedded-core@lists.openembedded.org; Sat, 03 Aug 2024 12:56:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Reply-To:MIME-Version:Date:Message-ID;
	bh=7E2mvWqvRcIUdOFeP3CLMN85b4jgd0eI7iSLWGnFMik=; b=26J8uqAh43lSMyRtoCD6h4PBKE
	fF139ETGY1AKe7Brrr8DKEJFCdeogvPQHNYtRJXPq+ax8idhpzHWNs0kFE4lLTAWa13y1PwkLKsAG
	3pSdbjlYhSq5oM9wEiaVHArNrGqOdtlDVrlcJtgPiW//o0IRKFn7TlmpiyuGZw0/tRqAum0xyV1VI
	KgXe8uGAxiwAUn0fo5kEQ8gMH4VhNwSfV9LAE0czv2BpKYanHHC/gdZt5V1Nl3NTg10NCT2Wye8yE
	PiJ7Dfkn+vt+t26EFCyKVjMk+cNpnzfagez8Qupq95MHBLygGf+1UrRwFZTc4zby/ZgvDPVM41nJ0
	T982MUSw==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <realint@runbox.com>)
	id 1saCQZ-0002op-GO
	for openembedded-core@lists.openembedded.org; Sat, 03 Aug 2024 12:55:59 +0200
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1051538)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1saCQO-007nsF-Uv
	for openembedded-core@lists.openembedded.org; Sat, 03 Aug 2024 12:55:49 +0200
Message-ID: <1cb7a46f-a8b1-4063-b690-bef78b94da66@runbox.com>
Date: Sat, 3 Aug 2024 13:55:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: niko.mauno@iki.fi
Subject: Re: [OE-core] [PATCH] libyaml: Amend CVE status as 'upstream-wontfix'
To: openembedded-core@lists.openembedded.org
References: <20240801101719.89910-1-niko.mauno@vaisala.com>
 <2427.1722608746946415660@lists.openembedded.org>
Content-Language: en-US
From: Niko Mauno <realint@runbox.com>
In-Reply-To: <2427.1722608746946415660@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 03 Aug 2024 10:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202934

On 8/2/24 17:25, Guðni Már Gilbert wrote:
> I wonder if it would be good to backport this to Scarthgap. I'm getting 
> the following warning for unpatched CVE on latest scarthgap:
> WARNING: libyaml-0.2.5-r0 do_cve_check: Found unpatched CVE 
> (CVE-2024-35328), for more information check 
> /home/builder/yocto/build/tmp/work/cortexa9t2hf-neon-tdx-linux-gnueabi/libyaml/0.2.5/temp/cve.log
> Would this patch silence it?
> 

Thanks, I've submitted 
https://lists.openembedded.org/g/openembedded-core/message/202933 which 
should fix the issue if it gets incorporated.
-Niko


