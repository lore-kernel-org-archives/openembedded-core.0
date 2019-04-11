Return-Path: <prvs=9974216f9=Mikko.Rapeli@bmw.de>
Received: from esa8.bmw.c3s2.iphmx.com (esa8.bmw.c3s2.iphmx.com
	[68.232.139.97])
	by mail.openembedded.org (Postfix) with ESMTP id 148C07D316
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 13:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1554989950; x=1586525950;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-id:content-transfer-encoding:mime-version;
	bh=RVlhOW1lkyWvZygZqZZ5gGvQckBXAr5suzZGX3BDo2Y=;
	b=GNNxCALyLpxzJlNBOp6fzvjSMoBW21xBNv1gtniqbGS/0rKrkWZzkcWZ
	3AmeKApomuzJ9OOcFdphmuavL1IBy/nXsPQDMH0goCoU6yVPk/K09CabX
	GZq8OGs5ToMbxFScW3Jm0za941d9VyylrZb36gq5emS7WJIaCSpVKbmIC M=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa8.bmw.c3s2.iphmx.com with ESMTP/TLS; 11 Apr 2019 15:39:08 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw3.muc with ESMTP/TLS;
	11 Apr 2019 15:38:47 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb2.muc with ESMTP/TLS; 11 Apr 2019 15:38:47 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Thu, 11 Apr 2019 15:38:46 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.003;
	Thu, 11 Apr 2019 15:38:47 +0200
From: <Mikko.Rapeli@bmw.de>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2] elfutils: remove Elfutils-Exception and include GPLv2
	for shared libraries
Thread-Index: AQHU8FekvNVS8rChpkmNt/dayb+JOKY21Y8A
Date: Thu, 11 Apr 2019 13:38:46 +0000
Message-ID: <20190411133846.GI20077@hiutale>
References: <1554981223-7867-1-git-send-email-mikko.rapeli@bmw.de>
In-Reply-To: <1554981223-7867-1-git-send-email-mikko.rapeli@bmw.de>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.40]
MIME-Version: 1.0
Subject: Re: [PATCH v2] elfutils: remove Elfutils-Exception and include GPLv2 for shared libraries
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
X-List-Received-Date: Thu, 11 Apr 2019 13:39:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CDB6FD08A110E049BD7F205D6CEA1F81@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Sorry, this wasn't rebased to latest master with elfutils 0.176. I'll rebas=
e
and resend.

-Mikko=

