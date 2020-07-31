Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web10.17715.1596200191834787162
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2020 05:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from localhost ([127.0.0.1]:46864 helo=cpanel7.indieserve.net)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1k1UaM-002OlA-CB
	for openembedded-core@lists.openembedded.org; Fri, 31 Jul 2020 08:56:30 -0400
Received: from [66.129.241.14] ([66.129.241.14]) by crashcourse.ca (Horde
 Framework) with HTTPS; Fri, 31 Jul 2020 08:56:30 -0400
Date: Fri, 31 Jul 2020 08:56:30 -0400
Message-ID: <20200731085630.Horde.vkdn4_1ejt9Kq39l-i_6CKl@crashcourse.ca>
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-core@lists.openembedded.org
Subject: does linux-kernel-base.bbclass "linux_module_packages()" have any value?
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline

currently writing tutorial on how to craft some kernel-related recipes,
and noticed in linux-kernel-base.bbclass the python function
linux_module_packages() which, these days, does not seem to have any
callers.

is there something that routine is still doing? is it simply available
in case someone wants it?

rday


