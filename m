Return-Path: <ito@lineo.co.jp>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8C6C38159
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 03:53:31 +0000 (UTC)
Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web11.7754.1674014000966369012
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 19:53:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: ito@lineo.co.jp)
Received: from [10.2.0.7] (y254190.ppp.asahi-net.or.jp [118.243.254.190])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id D27B2803DBD19;
	Wed, 18 Jan 2023 12:53:18 +0900 (JST)
Message-ID: <db8fbce2-29e9-35a4-b544-ff5e02e078c9@lineo.co.jp>
Date: Wed, 18 Jan 2023 12:53:17 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
To: openembedded-core@lists.openembedded.org
Content-Language: en-US
From: Takayasu Ito <ito@lineo.co.jp>
Subject: 4.1.2 Releasenote : The CVE in bind has already been fixed in the 4.1
 release.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 03:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176071

I was checking the following RELEASENOTE contents, and the CVE for bind, 
which has already been addressed in Yocto 4.1, was shown again.
http://downloads.yoctoproject.org/releases/yocto/yocto-4.1.2/RELEASENOTES

The commit for updating bind in this release is
https://git.yoctoproject.org/poky/commit/meta/recipes-connectivity/bind?h=langdale&id=90246ed04bdf7568c161e2f5698f954e0ac78191

The changelog is for 9.18.7 and was already fixed in the 4.1 release.


-- 
Takayasu Ito
Solution Department, Lineo Solutions, Inc.
https://www.lineo.co.jp/english/
Email: ito@lineo.co.jp
Yocto Project Ambassador

