Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.34148.1615202584446203601
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Mar 2021 03:23:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from bras-base-otwaon0916w-grc-29-64-229-255-220.dsl.bell.ca ([64.229.255.220]:34692 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lJDyY-0008Kt-Tq
	for openembedded-core@lists.openembedded.org; Mon, 08 Mar 2021 06:23:03 -0500
Date: Mon, 8 Mar 2021 06:22:59 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: any reason for "cmake_" prefix on cmake_runcmake_build()?
Message-ID: <b0117e87-c17f-e22f-c2b9-868dd12ea09@crashcourse.ca>
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


  collecting some examples of inheritance of class functions using
EXPORT_FUNCTIONS, and ran across this routine in cmake.bbclass:

  ... snip ...
  cmake_runcmake_build() {
	bbnote ...
	eval ...
  }

  cmake_do_compile()  {
        cmake_runcmake_build --target ${OECMAKE_TARGET_COMPILE}
  }
  ... snip ...

what puzzles me is that the routine cmake_runcmake_build(), despite
having a "cmake_" prefix, is not being exported with EXPORT_FUNCTIONS,
so while that's a perfectly respectable function, it's not clear why
it would have a "cmake_" prefix. is there some value to that prefix,
or is it just arbitrary?

rday
