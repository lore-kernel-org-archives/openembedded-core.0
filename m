Received: from good-out-12.clustermail.de (good-out-12.clustermail.de [212.223.35.74])
 by mx.groups.io with SMTP id smtpd.web12.6952.1593175137341283804
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 05:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gin.de, ip: 212.223.35.74, mailfrom: daniel.klauer@gin.de)
Received: from [10.0.0.6] (helo=frontend.clustermail.de)
	by smtpout-03.clustermail.de with esmtp (Exim 4.92.3)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1jond2-0002Ai-Jg
	for openembedded-core@lists.openembedded.org; Fri, 26 Jun 2020 14:38:54 +0200
Received: from [217.6.33.237] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.92.3)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1jond2-0001vh-Cs
	for openembedded-core@lists.openembedded.org; Fri, 26 Jun 2020 14:38:48 +0200
Received: from [10.176.8.42] (10.176.8.42) by Win2012-02.gin-domain.local
 (10.160.128.12) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 26 Jun
 2020 14:38:47 +0200
From: "Daniel Klauer" <daniel.klauer@gin.de>
Subject: Re: [PATCH 2/2] deploy.bbclass: Clean DEPLOYDIR before do_deploy
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20190828114131.10340-1-daniel.klauer@gin.de>
 <20190828114131.10340-2-daniel.klauer@gin.de>
Message-ID: <a7b4cfab-eec4-2ddd-a48b-f1846bbd3ee5@gin.de>
Date: Fri, 26 Jun 2020 14:38:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20190828114131.10340-2-daniel.klauer@gin.de>
X-Originating-IP: [10.176.8.42]
X-ClientProxiedBy: Win2012-02.gin-domain.local (10.160.128.12) To
 Win2012-02.gin-domain.local (10.160.128.12)
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping - any chance of getting this merged? (refering to
https://patchwork.openembedded.org/series/19533/)

I think it would still be useful, especially for meta-freescale, which
uses do_deploy() in many recipes.

If not, then I can update the meta-freescale pull request that triggered
this patch (https://github.com/Freescale/meta-freescale/pull/139).

Thanks.
