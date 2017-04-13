Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id D6DFF77DFF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 12:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 87F952E5D0;
	Thu, 13 Apr 2017 14:35:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id rMFn+lZrTZZR; Thu, 13 Apr 2017 14:35:30 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 133142E5CF;
	Thu, 13 Apr 2017 14:35:30 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 031501A066;
	Thu, 13 Apr 2017 14:35:30 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E9A9E1A064;
	Thu, 13 Apr 2017 14:35:29 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Thu, 13 Apr 2017 14:35:29 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id DDBD73210;
	Thu, 13 Apr 2017 14:35:29 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Thu, 13 Apr 2017 14:35:29 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Thu, 13 Apr 2017 14:35:29 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 3/3] devtool: extract: drop erroneous
	bb.event.TaskSucceeded
Thread-Index: AQHStFF2A1Pcgw4h8UOjkjSyjfNxQqHDO82Q
Date: Thu, 13 Apr 2017 12:35:29 +0000
Message-ID: <744e147709714db5841c35720c153b19@XBOX02.axis.com>
References: <cover.1492086458.git.paul.eggleton@linux.intel.com>
	<3542d868bf888db6595c211aaea6b49a398ba509.1492086458.git.paul.eggleton@linux.intel.com>
In-Reply-To: <3542d868bf888db6595c211aaea6b49a398ba509.1492086458.git.paul.eggleton@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] devtool: extract: drop erroneous	bb.event.TaskSucceeded
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
X-List-Received-Date: Thu, 13 Apr 2017 12:35:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Paul Eggleton
> Sent: den 13 april 2017 14:28
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 3/3] devtool: extract: drop erroneous
> bb.event.TaskSucceeded

Correct "bb.event.TaskSucceeded" to "bb.event.TaskStarted" in the subject.

> This is a non-existent event - we already have the actual
> bb.build.TaskSucceeded further down in the list hence why it wasn't
> noticed earlier.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  scripts/lib/devtool/standard.py | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/scripts/lib/devtool/standard.py
> b/scripts/lib/devtool/standard.py
> index c3b65fb..5ff1e23 100644
> --- a/scripts/lib/devtool/standard.py
> +++ b/scripts/lib/devtool/standard.py
> @@ -530,7 +530,6 @@ def _extract_source(srctree, keep_temp, devbranch,
> sync, d, tinfoil):
>=20
>          tinfoil.set_event_mask(['bb.event.BuildStarted',
>                                  'bb.event.BuildCompleted',
> -                                'bb.event.TaskStarted',
>                                  'logging.LogRecord',
>                                  'bb.command.CommandCompleted',
>                                  'bb.command.CommandFailed',
> --
> 2.9.3

//Peter


