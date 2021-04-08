Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.6056.1617877042876907806
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Apr 2021 03:17:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:42352 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lURiz-005wNP-2x
	for openembedded-core@lists.openembedded.org; Thu, 08 Apr 2021 06:17:21 -0400
Date: Thu, 8 Apr 2021 06:17:19 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: is there a standard for pkg_{pre,post}... and appending/prepending?
Message-ID: <122e62-d2a0-c117-67d5-9a93baca6e8@crashcourse.ca>
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


  just noticed the following (probably harmless) inconsistency in
oe-core/meta:

classes/manpages.bbclass:pkg_postinst_append_${MAN_PKG} () {
classes/manpages.bbclass:pkg_postrm_append_${MAN_PKG} () {
recipes-core/dropbear/dropbear.inc:pkg_postrm_append_${PN} () {
recipes-core/busybox/busybox.inc:pkg_postinst_${PN}_prepend () {
recipes-core/busybox/busybox.inc:pkg_postinst_${PN}_append () {

for consistency, should the package name go before or after?

rday
