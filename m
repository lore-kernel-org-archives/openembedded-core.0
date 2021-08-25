Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web09.21293.1629923722086475133
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 13:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from [::1] (port=37846 helo=cpanel8.indieserve.net)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mIzcG-0006y2-5l
	for openembedded-core@lists.openembedded.org; Wed, 25 Aug 2021 16:35:20 -0400
Received: from [136.2.32.182] ([136.2.32.182]) by crashcourse.ca (Horde
 Framework) with HTTPS; Wed, 25 Aug 2021 16:35:20 -0400
Date: Wed, 25 Aug 2021 16:35:20 -0400
Message-ID: <20210825163520.Horde.SwfJDAmwq6x_Wn-Vf4FoTSG@crashcourse.ca>
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-core@lists.openembedded.org
Subject: what means the test 'if [ -z "$D" ]' in a pkg_postinst routine?
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline


there will be many more questions about pkg_postinst (and related)
routines shortly, but digging into these for the first time, i
thought that that test checked whether the routine was being run
at image creation time, or at first-time boot. now i'm not quite
sure what to think after seeing several examples.

what does the test for null or non-null variable "D" mean in
a pkg_postinst routine? and once i figure all this out, i may
very well contribute some enhanced docs for the next confused
person.

rday

