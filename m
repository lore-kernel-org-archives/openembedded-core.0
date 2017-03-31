Return-Path: <pkonopel@visteon.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0138.outbound.protection.outlook.com [104.47.2.138])
	by mail.openembedded.org (Postfix) with ESMTP id 5323777D57
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Mar 2017 15:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=visteon.onmicrosoft.com; s=selector1-visteon-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Yqrz2de58xrUbub9eC0g9VhxZDSNSPLA2eUZBU/OPgI=;
	b=HHo6IKxSaQyKJ8Xxx8xM8yCo9AzAB8mbJFzDBQAXCVA+yrR2nqaDmKHMcmCZtGBNfLE10SoahtJWYc/rnBuuW8FajYr//ZpNKhvMY8lTEoq5vYD9Z3v0I/2c4eXaTY48pzSzGEUtYcdZ+fwvRChdkA7TzkQ/UfHNTlMSupI9HlA=
Received: from VI1PR0601MB2045.eurprd06.prod.outlook.com (10.169.135.140) by
	VI1PR0601MB2048.eurprd06.prod.outlook.com (10.169.135.143) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.991.14;
	Fri, 31 Mar 2017 08:34:22 +0000
Received: from VI1PR0601MB2045.eurprd06.prod.outlook.com ([10.169.135.140]) by
	VI1PR0601MB2045.eurprd06.prod.outlook.com ([10.169.135.140]) with
	mapi id 15.01.0991.022; Fri, 31 Mar 2017 08:34:22 +0000
From: "Konopelko, Pavel (P.)" <pkonopel@visteon.com>
To: Philip Balister <philip@balister.org>
Thread-Topic: [OE-core] Subscribing to openembedded-architecture list
Thread-Index: AdKpQLA+lfn4lN7/RHGdwDPBJlZ3ZQAQUW+AAB3JOqA=
Date: Fri, 31 Mar 2017 08:34:22 +0000
Message-ID: <VI1PR0601MB2045F8FE2BE3944C67D1346AC5370@VI1PR0601MB2045.eurprd06.prod.outlook.com>
References: <VI1PR0601MB204589915BEAFCD77E7F9E42C5340@VI1PR0601MB2045.eurprd06.prod.outlook.com>
	<7752ad18-af62-78ed-2795-931aff3ce186@balister.org>
In-Reply-To: <7752ad18-af62-78ed-2795-931aff3ce186@balister.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: balister.org; dkim=none (message not signed)
	header.d=none; balister.org;
	dmarc=none action=none header.from=visteon.com; 
x-originating-ip: [77.10.10.200]
x-microsoft-exchange-diagnostics: 1; VI1PR0601MB2048;
	7:nQBmYue/uT8wtPIrwPNQB9y+LN0CQutvf0v7EYTma7MbZt0QsRsQ7mMyo3BFUzw3mdcVmxfnGWaTI32efBDRzir3YKFOK7JkeNeR6HDBFlO5dmjZxi/qfnbXo2h50eu1n2yfuKHLwq2axId2jXPnm7wIHJX3Mma71z1zzG+5AhYuPw8cBsDK2P0Y8mVAXgCaDAymsYrbxzItjI0QI+2eaxglC5srXTuzjQsJIzLixim9gmFcmqshwsuRynB3QpYAkgJsw6osTC75gpCccRlWp/Di/Yq2TDYGGWwOjOIRmPn3iRaowmwM9DulSTUMBe+omrBsXItpT2tiWUyWM/jYMQ==
x-ms-office365-filtering-correlation-id: 78f6ab1a-d4e3-4404-8882-08d47810bbae
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081);
	SRVR:VI1PR0601MB2048; 
x-microsoft-antispam-prvs: <VI1PR0601MB2048A70D08A8253D14C07B2AC5370@VI1PR0601MB2048.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(6072148);
	SRVR:VI1PR0601MB2048; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0601MB2048; 
x-forefront-prvs: 02638D901B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39840400002)(39860400002)(39450400003)(39850400002)(39400400002)(39410400002)(377454003)(24454002)(377424004)(53754006)(8936002)(8676002)(81166006)(66066001)(74316002)(7736002)(305945005)(5660300001)(122556002)(110136004)(53546009)(2906002)(3280700002)(25786009)(53936002)(966004)(2950100002)(6916009)(189998001)(3846002)(6306002)(53376002)(38730400002)(6246003)(9686003)(77096006)(6436002)(4326008)(99286003)(55016002)(3660700001)(6506006)(6116002)(102836003)(229853002)(19625735003)(50986999)(54356999)(76176999)(7696004)(86362001)(1720100001)(2900100001)(33656002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0601MB2048;
	H:VI1PR0601MB2045.eurprd06.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: visteon.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2017 08:34:22.8769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a147aaf-01ec-498c-80a1-e34a8c63c548
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0601MB2048
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Subscribing to openembedded-architecture list
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
X-List-Received-Date: Fri, 31 Mar 2017 15:06:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Philip,

Philip Balister wrote on 2017-03-30:
> You should be able to join. Did you get any messages at all?

No responses at all.  Neither for web interface nor for mail requests to op=
enembedded-architecture-{request|join}.  The only time I've got a response =
was when I tried to send the question below to openembedded-architecture an=
d the message bounced.

Regards,
--Pavel Konopelko

> On 03/30/2017 06:32 AM, Konopelko, Pavel (P.) wrote:
>> Hello everybody,
>>=20
>> I wonder if openembedded-architecture list is closed, invitation-only
> or something.  The OE wiki [1] does not mention any restrictions.
> Nevertheless I seem to be unable to subscribe via the web interface or
> via an e-mail request (tried several times over the last couple of
> weeks).
>>=20
>> What am I missing?
>>=20
>>=20
>> Thanks,
>> --Pavel Konopelko
>>=20
>> [1] http://openembedded.org/wiki/Mailing_lists
>>=20
>>



