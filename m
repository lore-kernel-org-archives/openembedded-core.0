Received: from sputnik.urmx.de ([88.198.51.18])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Eibach@gdsys.de>) id 1S3PK0-0004LQ-SK
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Mar 2012 11:02:44 +0100
Received: from mailrelay.gdsys.de (unknown [217.6.197.20])
	by sputnik.urmx.de (Postfix) with ESMTP id 5CF0E6000FAA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 10:54:14 +0100 (CET)
Received: from mailsgw.gdsys.de (localhost [127.0.0.1])
	by mailsgw.gdsys.de (Postfix) with ESMTP id 1B2721F8801
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2012 10:54:15 +0100 (CET)
X-Spam-Processed: srv201.gdsys.de, Fri, 02 Mar 2012 10:54:13 +0100
	(not processed: message from trusted or authenticated source)
X-Return-Path: Eibach@gdsys.de
X-Envelope-From: Eibach@gdsys.de
X-MDaemon-Deliver-To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Importance: normal
Priority: normal
X-MIMEOLE: Produced By Microsoft MimeOLE V6.00.3790.4913
Date: Fri, 2 Mar 2012 10:54:20 +0100
Message-ID: <48D3D52125C49B43AE880038E2E5314BB5BFA4@SRV101.gdsys.de>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: Build for powerpc spe broken
thread-index: Acz4V8dvGE2kPzXtTAeK/7rTL2tQTg==
From: "Eibach, Dirk" <Eibach@gdsys.de>
Cc: <openembedded-core@lists.openembedded.org>
X-SafeGuard_MailGateway: Version: 5.60.3.11066 SGMG Date: 20120302095415Z
X-AntiVirus: checked by AntiVir MailGate (version: 2.0.2-5; AVE: 7.9.10.8;
	VDF: 7.11.24.118; host: mailrelay)
Subject: Build for powerpc spe broken
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 02 Mar 2012 10:02:45 -0000
Content-Class: urn:content-classes:message
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit


Commits
12f0a0d3e1afe90633c8b95d36670ab0f156e912
785962440131f993b912d26cba39dc7ffc91aad4
01fd9be5db633d881c789c5b119f794a3f1000da

break building for powerpc spe, it seems a powerpc-nf toolchain is
built.

Patch "[PATCH 3/4] arch-powerpc.inc: use default value of TUNE_PKGARCH"
was not pulled and I don't see a replacement for it yet. Matthew, do you
have something in your queue?

Cheers
Dirk




