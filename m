Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.290.1631563333571552989
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 13:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from [::1] (port=54652 helo=cpanel8.indieserve.net)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1mPs9c-0001V9-4g
	for openembedded-core@lists.openembedded.org; Mon, 13 Sep 2021 16:02:12 -0400
Received: from [136.2.17.160] ([136.2.17.160]) by crashcourse.ca (Horde
 Framework) with HTTPS; Mon, 13 Sep 2021 16:02:11 -0400
Date: Mon, 13 Sep 2021 16:02:11 -0400
Message-ID: <20210913160211.Horde.XCCChM8Xh71L8RVn0Iaf00_@crashcourse.ca>
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: openembedded-core@lists.openembedded.org
Subject: how to manually discard some SDK content before bundling up the SDK?
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


   another off-the-wall question but i want to delete some content from
a standard SDK (sysroots/cortex.../usr/src) before creating the final
.sh script but, because of the slightly weird way this SDK is bring created
via "bitbake -c populate_sdk ...", i have little control of most of the
creation process other than right toward the end, where the easiest way
to do this would be to just sneak in a "rm -rf ..." command at the
appropriate time before the step that creates the tarball and appends it
to the .sh script in populate_sdk_base.bbclass.

   the SDK_PRE_INSTALL and SDK_POST_INSTALL variables would not quite
do it as i want to discard that content *before* creating the SDK so
that it is not in the tarball at all. i'm digging through
populate_sdk_base.bbclass right now, working backwards from the final
SDK creation step to see where i can get away with this, but if there's
a simple answer, that would be just ducky.

   in exchange for an answer, I'll proofread more documentation. :-)

rday



