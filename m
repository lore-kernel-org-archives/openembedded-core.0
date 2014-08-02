Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 648816FE76
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Aug 2014 08:13:41 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20140802081342032
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Aug 2014 08:13:42 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=47917 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XDURc-0005g1-8Y for openembedded-core@lists.openembedded.org;
	Sat, 02 Aug 2014 04:13:36 -0400
Date: Sat, 2 Aug 2014 04:13:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.11.1408020410230.13352@localhost>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: any subtle uses for hardcoded /etc instead of ${sysconfdir}?
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
X-List-Received-Date: Sat, 02 Aug 2014 08:13:45 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  occasionally, i run across stuff like this (here, under
recipes-support):

$ grep -r "/etc" nss*
nss/files/nss-CVE-2013-1740.patch:+ *
(SSL_ForceHandshake/PR_Recv/PR_Send/etc.) needed to finish the handshake.
nss/nss.inc:    mkdir -p ${D}/etc/pki/nssdb/
nss/nss.inc:    certutil -N -d ${D}/etc/pki/nssdb/ -f ./empty_password
nss/nss.inc:    chmod 644 ${D}/etc/pki/nssdb/*.db
nss-myhostname/nss-myhostname_0.3.bb:		-i $D/etc/nsswitch.conf
nss-myhostname/nss-myhostname_0.3.bb:		-i $D/etc/nsswitch.conf
$

  is there any reason for hard-coding "/etc" into those filenames,
rather than "${sysconfdir}"? i can submit a quick patch to tweak that,
but i always wonder if there's something subtle going on underneath
that i'm unaware of.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


