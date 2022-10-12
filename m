Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41788C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 07:40:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.17925.1665560431882698906
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Oct 2022 00:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jveNbIzH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C0C2AC000B;
	Wed, 12 Oct 2022 07:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1665560430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X9tIl8rWEPXbjZCRKO+PxZ+AfGmjNKVhbBvmqcGi/O8=;
	b=jveNbIzHcylc2BDoPUy4FSFjlOY9Hzxdm6iLJorApXp6UNQjbR8HrWGOq/yhNS6540Wm40
	sifB6XWAAxy3d41WJ9n5bSWI1XIDgu7y8Uvc2G1+TVciICs5d5ni33Kec84NyTKI8fTPC/
	0Rslogu2ACrIshvWGKPRULlSvBqz5CDwBM8RBu/xESkS+mHV52YZZlQ3aLXrwvq/GoE3NX
	MzLASceK4B/EbdFZXMX+Qp6OBRATgPhPoGbrw2wfHxes9pHrTKW/o7xKNO1lMBRuKyfihY
	Hhb0CdmYyFkqO0GbbWNnOFOXUZ724DVUJqwG0HAKDlertE2yjFNFMDzGQ6EZpA==
Message-ID: <aa11fb39-0023-329b-fee9-e12f9f74b445@bootlin.com>
Date: Wed, 12 Oct 2022 09:40:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][dunfell][PATCH] rsync: fix CVE-2022-29154
Content-Language: en-US
To: vkumbhar <vkumbhar@mvista.com>
References: <20221011154943.39162-1-vkumbhar@mvista.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221011154943.39162-1-vkumbhar@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Oct 2022 07:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171654

Hi Vivek

On 10/11/22 17:49, vkumbhar wrote:
> Source: https://git.samba.org/?p=rsync.git;a=patch;h=b7231c7d02cfb65d291af74ff66e7d8c507ee871
> MR: 120436
> Type: Security Fix
> Disposition: Backport from https://git.samba.org/?p=rsync.git;a=patch;h=b7231c7d02cfb65d291af74ff66e7d8c507ee871
> ChangeID: c343a62e84fc2bd4793bda2f45e603a1347d0672
> Description:
>      CVE-2022-29154 rsync: remote arbitrary files write inside the
>
> Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
> ---
>   .../rsync/files/0001-CVE-2022-29154.patch     | 335 ++++++++++++++++++
>   meta/recipes-devtools/rsync/rsync_3.1.3.bb    |   1 +
>   2 files changed, 336 insertions(+)
>   create mode 100644 meta/recipes-devtools/rsync/files/0001-CVE-2022-29154.patch

Thank you for the patch!

FYI information, there were whitespace issues in your patch:

Applying: rsync: fix CVE-2022-29154
.git/rebase-apply/patch:51: trailing whitespace.

.git/rebase-apply/patch:61: trailing whitespace.

.git/rebase-apply/patch:64: trailing whitespace.

.git/rebase-apply/patch:68: space before tab in indent.
      }
.git/rebase-apply/patch:70: trailing whitespace.

warning: squelched 60 whitespace errors
warning: 65 lines add whitespace errors.


Cheers
Michael

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


