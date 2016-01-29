Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BE8336AC4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 17:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 32A412E3D7;
	Fri, 29 Jan 2016 18:48:36 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id NsuV0if2k+w1; Fri, 29 Jan 2016 18:48:35 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 560E22E39D;
	Fri, 29 Jan 2016 18:48:35 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 3DAD2140B;
	Fri, 29 Jan 2016 18:48:35 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id 328354AD;
	Fri, 29 Jan 2016 18:48:35 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by seth.se.axis.com (Postfix) with ESMTP id 2BBCF3E3EC;
	Fri, 29 Jan 2016 18:48:35 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Fri, 29 Jan 2016 18:48:34 +0100
Received: from XBOX02.axis.com ([fe80::bcea:88d5:e1ff:8e04]) by
	XBOX02.axis.com ([fe80::bcea:88d5:e1ff:8e04%12]) with mapi id
	15.00.1104.000; Fri, 29 Jan 2016 18:48:34 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Hongxu Jia <hongxu.jia@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "liezhi.yang@windriver.com"
	<liezhi.yang@windriver.com>, "raj.khem@gmail.com" <raj.khem@gmail.com>, 
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 1/5] base/bbclass: use target path as compile
	dir	in debugging info
Thread-Index: AQHRWruY3oU+kMjsKUuLvO01v2qAOZ8SxMtg
Date: Fri, 29 Jan 2016 17:48:34 +0000
Message-ID: <a17cbe21ef44455c98414ba1a4f1ffdd@XBOX02.axis.com>
References: <cover.1454088695.git.hongxu.jia@windriver.com>
	<51387bed968918e5c45820eb32ee898485cc0544.1454088695.git.hongxu.jia@windriver.com>
In-Reply-To: <51387bed968918e5c45820eb32ee898485cc0544.1454088695.git.hongxu.jia@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.55]
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] base/bbclass: use target path as compile dir	in debugging info
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
X-List-Received-Date: Fri, 29 Jan 2016 17:48:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Hongxu Jia
> Sent: den 29 januari 2016 18:36
> To: openembedded-core@lists.openembedded.org;
> liezhi.yang@windriver.com; raj.khem@gmail.com;
> richard.purdie@linuxfoundation.org
> Subject: [OE-core] [PATCH 1/5] base/bbclass: use target path as compile d=
ir in debugging info
                                 ^^^^^^^^^^^^
Change the prefix to "bitbake.conf" to reflect that you now do the=20
Change there...

//Peter


