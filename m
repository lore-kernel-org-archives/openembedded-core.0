Return-Path: <sona.sarmadi@enea.com>
X-Greylist: delayed 380 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 Dec 2016 09:14:29 UTC
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.32])
	by mail.openembedded.org (Postfix) with ESMTP id 535EF77585
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 09:14:29 +0000 (UTC)
Received: from 1cJzM9-0005yo-TQ by out11d.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1cJzM9-0005zH-U3; Thu, 22 Dec 2016 01:08:09 -0800
Received: by emcmailer; Thu, 22 Dec 2016 01:08:09 -0800
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11d.electric.net with esmtps (TLSv1:AES128-SHA:128) (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>)
	id 1cJzM9-0005yo-TQ; Thu, 22 Dec 2016 01:08:09 -0800
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX03.enea.se ([fe80::6ce7:7b51:1edf:e245%17]) with mapi id
	14.03.0319.002; Thu, 22 Dec 2016 10:07:36 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: Lei Maohui <leimaohui@cn.fujitsu.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Made spdx support SPDX2.0 SPEC
	Signed-off-by: Lei	Maohui <leimaohui@cn.fujitsu.com>
Thread-Index: AQHR12rFvmGxbQaqY0ateWZG3b1OG6EUtOuw
Date: Thu, 22 Dec 2016 09:07:35 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48AC0FF12F@SESTOEX04.enea.se>
References: <1466986302-33565-1-git-send-email-leimaohui@cn.fujitsu.com>
	<1466986302-33565-2-git-send-email-leimaohui@cn.fujitsu.com>
In-Reply-To: <1466986302-33565-2-git-send-email-leimaohui@cn.fujitsu.com>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:AES128-SHA:128
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: Re: [PATCH] Made spdx support SPDX2.0 SPEC Signed-off-by: Lei	Maohui <leimaohui@cn.fujitsu.com>
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
X-List-Received-Date: Thu, 22 Dec 2016 09:14:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Lei, all,

> --- a/meta/classes/spdx.bbclass
> +++ b/meta/classes/spdx.bbclass
> @@ -1,12 +1,9 @@
>  # This class integrates real-time license scanning, generation of SPDX
> standard  # output and verifiying license info during the building proces=
s.
> -# It is a combination of efforts from the OE-Core, SPDX and Fossology
> projects.
> +# It is a combination of efforts from the OE-Core, SPDX and DoSOCSv2
> projects.

Why replace Fossology with DoSOCSv2? Why not make it optional?

Has anyone any comments on this suggestion? AFAI see this patch has not bee=
n accepted yet. Is there any plan to do it?

Cheers
//Sona

