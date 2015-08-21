Return-Path: <bartlomiej.kucharczyk@nokia.com>
Received: from demumfd002.nsn-inter.net (demumfd002.nsn-inter.net
	[93.183.12.31])
	by mail.openembedded.org (Postfix) with ESMTP id E462260557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 16:04:40 +0000 (UTC)
Received: from demuprx016.emea.nsn-intra.net ([10.150.129.55])
	by demumfd002.nsn-inter.net (8.15.2/8.15.2) with ESMTPS id
	t7LG4d9k021731
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 16:04:39 GMT
Received: from DEMUHTC002.nsn-intra.net ([10.159.42.33])
	by demuprx016.emea.nsn-intra.net (8.12.11.20060308/8.12.11) with ESMTP
	id t7LG4b2R001592
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 18:04:37 +0200
Received: from DEMUMBX005.nsn-intra.net ([169.254.5.210]) by
	DEMUHTC002.nsn-intra.net ([10.159.42.33]) with mapi id 14.03.0248.002;
	Fri, 21 Aug 2015 18:04:36 +0200
From: "Kucharczyk, Bartlomiej (Nokia - PL/Wroclaw)"
	<bartlomiej.kucharczyk@nokia.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Get patch of all manual changes done in sources.
Thread-Index: AdDcKxM2bF4s5T86Ry6IAsDlTaOiug==
Date: Fri, 21 Aug 2015 16:04:36 +0000
Message-ID: <6F44F925AFE971408EDDDD548F9B486F198BD299@DEMUMBX005.nsn-intra.net>
Accept-Language: pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.159.42.120]
MIME-Version: 1.0
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
	further information)
X-purgate-size: 619
X-purgate-ID: 151667::1440173079-0000676C-4C040B3C/0/0
Subject: Get patch of all manual changes done in sources.
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
X-List-Received-Date: Fri, 21 Aug 2015 16:04:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello!

Is there any automated way to get diff of all manual changes done in recipe=
 sources?

Use case is:
1. bitbake something -c devshell
2. # manually modify sources #
3. bitbake image
4. bitbake something2 -c devshell
5. # manually modify sources #
6. bitbake image
...
n. bitbake image

And now I would like to automatically generate patch from changes in step #=
2, #5, and next. Is there any way in oe core to achieve such thing?
=20
And if needs to be implemented, do you have any suggestions how to start? (=
e.g. doing another task, create a bbclass, or? )

Thanks in advance!
Bartek

