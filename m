Return-Path: <markus.boos@kistler.com>
X-Greylist: delayed 616 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 24 Oct 2014 09:47:34 UTC
Received: from mx1.kistler.com (mx1.kistler.com [195.49.77.148])
	by mail.openembedded.org (Postfix) with ESMTP id 316EB65D27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 09:47:34 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,779,1406584800"; d="scan'208";a="12760308"
Received: from unknown (HELO kihagsepp01.int.kistler.com) ([192.168.52.67])
	by mx1.kistler.com with ESMTP/TLS/ADH-AES256-SHA;
	24 Oct 2014 11:37:16 +0200
Received: from mx2.kistler.com (unknown [192.168.52.58])
	by kihagsepp01.int.kistler.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 11:37:14 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.04,779,1406584800"; 
   d="scan'208";a="2084810"
Received: from kihagwinex01.int.kistler.com ([192.168.100.23])
	by mx2.kistler.com with ESMTP/TLS/AES128-SHA; 24 Oct 2014 11:37:14 +0200
Received: from kihagwinex02.int.kistler.com ([fe80::10cf:df86:bb65:2502]) by
	kihagwinex01.int.kistler.com ([fe80::d70:7df0:c903:4e43%16]) with mapi
	id 14.03.0181.006; Fri, 24 Oct 2014 11:37:14 +0200
From: Markus Boos <Markus.Boos@kistler.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Discussion about architecure of ptest-runner patch
Thread-Index: Ac/vbDp/PFRk3LIhTGWd4Cah5c52dw==
Date: Fri, 24 Oct 2014 09:37:14 +0000
Message-ID: <345DD4F0215D4B4CB8356943BA192C9913CF0BD0@kihagwinex02.int.kistler.com>
Accept-Language: de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.116]
MIME-Version: 1.0
Subject: Discussion about architecure of ptest-runner patch
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
X-List-Received-Date: Fri, 24 Oct 2014 09:47:35 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

We patched the ptest-runner script to deliver a xUnit file as a rough overv=
iew/indicator over the package tests.=20
Having such a report allows us to use the file in Jenkins and in our ALM to=
ol to display the results of the ptest run.

Before we send the patch upstream I like to start the discussion about the =
architecture of the patch because I think it's worth to extend the ptest-ru=
nner to deliver the results in readable text format (xUnit, JSON, html tabl=
e, csv,  whateverformat).
I think of something similar like the automated deployment mechanism where =
yocto delivers the base class and you can write your own extension with thi=
s class.

What is the best way to add such a feature?

Simply extend the ptest-runner script with the preferred output formatter?

Or

Write a bitbake class with an interface where you can attach your own prefe=
rred output formatter?=20

I'm sure there are other solutions possible as well. If you have one in min=
d, please share it.

Thank you.

Best regards
Markus

