Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0643E65CC2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 09:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A9A0118197
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 11:57:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id qmUfrmGioJmy
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 11:57:56 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 4D72618178
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 11:57:56 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 323CA169A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 11:57:56 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 278E4FE6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 11:57:56 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 25DA210D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 11:57:56 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Mon, 18 Apr 2016 11:57:55 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%22]) with mapi id
	15.00.1156.000; Mon, 18 Apr 2016 11:57:55 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "OE Core (openembedded-core@lists.openembedded.org)"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: file-rdeps warning from localedef
Thread-Index: AdGZVTgZwoUpdcZKSAO9Hp5vGfU77w==
Date: Mon, 18 Apr 2016 09:57:55 +0000
Message-ID: <fb094f31248b402c90aafb3a1a4f4219@XBOX02.axis.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.55]
MIME-Version: 1.0
Subject: file-rdeps warning from localedef
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
X-List-Received-Date: Mon, 18 Apr 2016 09:57:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I got the following warning the other day when I built core-image-minimal=20
(Poky master at 5c8124df):

  WARNING: glibc-locale-2.23-r0 do_package_qa: QA Issue:=20
  /usr/bin/localedef contained in package localedef requires libc.so.6,=20
  but no providers found in RDEPENDS_localedef? [file-rdeps]

Is this known?

//Peter


