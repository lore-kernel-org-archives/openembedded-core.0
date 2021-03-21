Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.4175.1616319456441832599
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 02:37:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-29-64-229-255-220.dsl.bell.ca ([64.229.255.220]:53096 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lNuWc-005woY-Rq
	for openembedded-core@lists.openembedded.org; Sun, 21 Mar 2021 05:37:35 -0400
Date: Sun, 21 Mar 2021 05:37:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: is 'T_task-clean = "${LOG_DIR}/cleanlogs/${PN}"' still relevant?
Message-ID: <52b8d29-a375-ab1-911-6b341d7ca2f@crashcourse.ca>
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


  perusing some of the content in meta/classes/utility-tasks.bbclass,
and i see the snippet:

  T_task-clean = "${LOG_DIR}/cleanlogs/${PN}"

which takes one all the way back to 2012:

  commit eef9d6c2d52f5264a6e7a9d882f8323f9793fd7f
  Author: Richard Purdie <richard.purdie@linuxfoundation.org>
  Date:   Fri Aug 17 14:19:22 2012 +0100

    utility-tasks: Set T to alternate location during do_clean

    There is a race where do_clean tries to clean WORKDIR but there are logfiles
    written into ${T} by bitbake and this can lead to exceptions due to open files.

    The easiest solution is to redirect T to a different location for the do_clean
    task, hence avoiding the errors and also allowing the logfiles to be visible
    somewhere. ${LOG_DIR} seems an appropriate place for this.

does that race condition still exist?

rday
