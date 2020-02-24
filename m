Return-Path: <rpjday@crashcourse.ca>
Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
	by mail.openembedded.org (Postfix) with ESMTP id 1628661679
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2020 19:10:19 +0000 (UTC)
Received: from otwaon0812w-grc-09-64-228-70-69.dsl.bell.ca
	([64.228.70.69]:47974 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa (TLS1.2) tls
	TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>) id 1j6J7U-006UrE-IT
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Feb 2020 14:10:21 -0500
Date: Mon, 24 Feb 2020 14:10:18 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.21.2002241407440.5828@localhost.localdomain>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id:
	rpjday+crashcourse.ca/only user confirmed/virtual account not
	confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: does "deprecated" SSTATEPOSTINSTFUNCS still have value?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Feb 2020 19:10:20 -0000
Content-Type: text/plain; charset=US-ASCII


  YP 2.3 migration section describes that variable as deprecated and
likely to be removed in the future, but it still lives on:

classes/sstate.bbclass:SSTATEPOSTINSTFUNCS = ""
classes/sstate.bbclass:    for postinst in (d.getVar('SSTATEPOSTINSTFUNCS') or '').split():
classes/sstate.bbclass:sstate_install[vardeps] += "${SSTATEPOSTINSTFUNCS}"
classes/buildhistory.bbclass:# then the value added to SSTATEPOSTINSTFUNCS:
classes/buildhistory.bbclass:SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "| buildhistory_emit_pkghistory"

  is it still meant to be used?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                         http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

