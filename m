Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.7026.1616163770299315078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Mar 2021 07:22:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-29-64-229-255-220.dsl.bell.ca ([64.229.255.220]:58084 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lNG1Y-00F1Z7-Qg
	for openembedded-core@lists.openembedded.org; Fri, 19 Mar 2021 10:22:49 -0400
Date: Fri, 19 Mar 2021 10:22:47 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: diff between "bitbake meta-toolchain" and "bitbake -c populate_sdk <target>?
Message-ID: <92d67e94-f4d9-e693-b3af-18b69b8d881@crashcourse.ca>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII


  colleague just asked me about the difference between building an SDK
with either of:

  $ bitbake meta-toolchain
  $ bitbake -c populate_sdk <some target>

i know that the meta-toolchain recipe file contains little more than
inheriting populate_sdk so, without checking, i speculated wildly as
follows:

  "bitbake meta-toolchain" takes no target, so it's limited to
whatever info it can glean from local.conf and bitbake.conf and so on
and so on, things like MACHINE and DISTRO, and whatever assignments to
TOOLCHAIN_HOST_TASK, etc, it runs into in its travels; in essence,
it's a "generic" toolchain.

  on the other hand, "bitbake -c populate_sdk <target>" can, in
addition, consult the target recipe file where it can collect even
further SDK defining info, like what you find in core-image-sato.bb:

TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool nativesdk-glib-2.0"

  at the risk of over-simplification, is that a not wholly inaccurate
explanation of the difference?

rday
