Return-Path: <preid@electromag.com.au>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B89ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 05:25:23 +0000 (UTC)
Received: from anchovy1.45ru.net.au (anchovy1.45ru.net.au [203.30.46.145])
 by mx.groups.io with SMTP id smtpd.web11.33796.1661491514966532845
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Aug 2022 22:25:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: electromag.com.au,
 ip: 203.30.46.145, mailfrom: preid@electromag.com.au)
Received: (qmail 31619 invoked by uid 5089); 26 Aug 2022 05:25:12 -0000
Received: by simscan 1.2.0 ppid: 31537, pid: 31538, t: 0.0615s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
Received: from unknown (HELO ?10.1.1.106?)
 (preid@electromag.com.au@203.59.179.56)
  by anchovy3.45ru.net.au with ESMTPA; 26 Aug 2022 05:25:12 -0000
Message-ID: <41c4c0ec-06e0-2709-33e6-982f320ed091@electromag.com.au>
Date: Fri, 26 Aug 2022 13:25:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: openembedded-core@lists.openembedded.org
Content-Language: en-AU
From: Phil Reid <preid@electromag.com.au>
Subject: bitbake fetchall & populate_sdk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Aug 2022 05:25:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169902

G'day All,

How can I run fetchall so that it will also fetch all package sources related to the sdk as well as the image.

ie: "bitbake -c fetchall myimage" gets all the sources to build myimage, allowing a build to proceed without network access later.

Out sdk however includes a few extra total for development purposes, so additional recipes need to download stuff when I run:
bitbake -c populate_sdk myimage

Done some googling and found one other person asking this, and the solution was to run
bitbake -c fetchall universe

Which seems a bit of overkill for the couple of extra packages I'm after.


-- 
Regards
Phil Reid

