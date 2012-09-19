Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TEAMm-0005gY-3K
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 04:50:20 +0200
Received: from mail136-ch1-R.bigfish.com (10.43.68.248) by
	CH1EHSOBE020.bigfish.com (10.43.70.77) with Microsoft SMTP Server id
	14.1.225.23; Wed, 19 Sep 2012 02:37:38 +0000
Received: from mail136-ch1 (localhost [127.0.0.1])	by
	mail136-ch1-R.bigfish.com (Postfix) with ESMTP id A62FBE017E	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 02:37:38 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 1
X-BigFish: VS1(zzzz1202h1d1ah1d2ahzzz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2h1288h12a5h12a9h12bdhbe9i1155h)
Received: from mail136-ch1 (localhost.localdomain [127.0.0.1]) by mail136-ch1
	(MessageSwitch) id 1348022257162885_11703;
	Wed, 19 Sep 2012 02:37:37 +0000 (UTC)
Received: from CH1EHSMHS024.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.236])	by mail136-ch1.bigfish.com (Postfix) with ESMTP id
	2460B3A007E	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 02:37:37 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS024.bigfish.com
	(10.43.70.24) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 19 Sep 2012 02:37:36 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.124]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0309.003; Tue, 18 Sep 2012 21:37:36 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: multilib errors
Thread-Index: AQHNlg+6OMS/xOqYcUClQ5N5275vdw==
Date: Wed, 19 Sep 2012 02:37:35 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A68BAF6@039-SN1MPN1-001.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: multilib errors
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Sep 2012 02:50:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E34D663DF18FB7498C6C56B1CD0702E6@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

Is anyone else seeing:

WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
entry trailingslash.patch: file could not be found
WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
entry prefix-manpage-fix.patch: file could not be found
WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
entry rename-with-sysroot.patch: file could not be found
WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
entry use-sysroot-in-libpath.patch: file could not be found
WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
entry fix-final-rpath.patch: file could not be found
WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
entry avoid_absolute_paths_for_general_utils.patch: file could not be
found
WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
entry fix-rpath.patch: file could not be found
WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
entry respect-fstack-protector.patch: file could not be found
WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
entry norm-rpath.patch: file could not be found
WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
entry prefix.patch: file could not be found
WARNING: Unable to get checksum for lib64-nativesdk-libtool SRC_URI
entry fixinstall.patch: file could not be found
WARNING: Unable to get checksum for lib64-build-appliance-image
SRC_URI entry Yocto_Build_Appliance.vmx: file could not be found
WARNING: Unable to get checksum for lib64-build-appliance-image
SRC_URI entry Yocto_Build_Appliance.vmxf: file could not be found

With multilib enabled? Have not debuged but it looks like something is
parsing SRC_URI for recipes under multilib when it should not be.

-M=



