Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 376806011A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 14:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id B1BC62E63C;
	Thu, 31 Mar 2016 16:42:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id zR8-91135HPw; Thu, 31 Mar 2016 16:42:25 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id DF3742E639;
	Thu, 31 Mar 2016 16:42:25 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id C60F21446;
	Thu, 31 Mar 2016 16:42:25 +0200 (CEST)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id BA745143E;
	Thu, 31 Mar 2016 16:42:25 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id B898D101A;
	Thu, 31 Mar 2016 16:42:25 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Thu, 31 Mar 2016 16:42:21 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%22]) with mapi id
	15.00.1156.000; Thu, 31 Mar 2016 16:42:21 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] scripts, lib: Don't limit traceback lengths to
	arbitrary values
Thread-Index: AQHRi0MI/MGUbUw+qE6Ic7LQ+B4KsZ9zoGPg
Date: Thu, 31 Mar 2016 14:42:20 +0000
Message-ID: <0632c6723e0a41efbba6c400c61d6d3d@XBOX02.axis.com>
References: <1459424798.21672.63.camel@linuxfoundation.org>
In-Reply-To: <1459424798.21672.63.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.55]
MIME-Version: 1.0
Subject: Re: [PATCH] scripts, lib: Don't limit traceback lengths to arbitrary values
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
X-List-Received-Date: Thu, 31 Mar 2016 14:42:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: den 31 mars 2016 13:47
> To: openembedded-core
> Subject: [OE-core] [PATCH] scripts, lib: Don't limit traceback lengths
> to arbitrary values
>=20
> There appears to have been a lot of copy and pasting of the code
> which prints tracebacks upon failure and limits the stack trace to
> 5 entries. This obscures the real error and is very confusing to the user
> it look me an age to work out why some tracebacks weren't useful.
     ^^^^
Change "look" to "took".

//Peter


