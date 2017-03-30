Return-Path: <pkonopel@visteon.com>
X-Greylist: delayed 10891 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 30 Mar 2017 18:07:47 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0115.outbound.protection.outlook.com [104.47.2.115])
	by mail.openembedded.org (Postfix) with ESMTP id EC1EF77D46
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 18:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=visteon.onmicrosoft.com; s=selector1-visteon-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2B7TRCujSarKXO5JY1T6+inQPo4UWky4L5t3QKuGZ/I=;
	b=BpVD/EX+HSRpKHmVsq61u4gDASBnWg2j1G7sqJDI5C7GPz9sOn0xqDN0tkqayi03KJp4zpyORo3x6Ppgg0uYor9ZHdwX8zrpoNROKFIlgmPO5FVo6d1PnOqsHMP1dHgKnIb1Jy16I1djkU7OS4saTQP70pJSpQFngLYwi6f5JOg=
Received: from VI1PR0601MB2045.eurprd06.prod.outlook.com (10.169.135.140) by
	VI1PR0601MB2046.eurprd06.prod.outlook.com (10.169.135.141) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.991.14;
	Thu, 30 Mar 2017 10:32:33 +0000
Received: from VI1PR0601MB2045.eurprd06.prod.outlook.com ([10.169.135.140]) by
	VI1PR0601MB2045.eurprd06.prod.outlook.com ([10.169.135.140]) with
	mapi id 15.01.0991.022; Thu, 30 Mar 2017 10:32:33 +0000
From: "Konopelko, Pavel (P.)" <pkonopel@visteon.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Subscribing to openembedded-architecture list
Thread-Index: AdKpQLA+lfn4lN7/RHGdwDPBJlZ3ZQ==
Date: Thu, 30 Mar 2017 10:32:33 +0000
Message-ID: <VI1PR0601MB204589915BEAFCD77E7F9E42C5340@VI1PR0601MB2045.eurprd06.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=visteon.com;
x-originating-ip: [77.10.91.193]
x-microsoft-exchange-diagnostics: 1; VI1PR0601MB2046;
	7:BYMaG0rCPmOIF1/s2ltGn1Jx1ouEJ37ditBHk9+cxAtOy4R7XuWZbjp9ESlDK1gaYUTf2wX13FOhJ9bXtZNy2O9WdN6F7zigkwmO3k0jJWHnCSi/LJdQq3r0wvjbAQNNJaGZ8+1CSrxluIyQJbPBeFg2f0eRgq0Q2qgwhgKlAXn0w8OV31e9rE+C/VUvxOGu0CV00IBjW+r+bC5GtKCRjmuudjDcpAV0joZ+D8UgIdcbKvPgRb0GSDiU96liw4mPm0YeM+/CmA269Qn76ZQkkMUipFvuZd4/fg8Kwddvj1Q5aiJ8yCbSpDTOe/qp+CLbqKXaYrPT+lEhPbfUsj3cDw==
x-ms-office365-filtering-correlation-id: f0f14cf7-4d91-4f93-6288-08d477581387
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(48565401081)(201703131423075)(201703031133081);
	SRVR:VI1PR0601MB2046; 
x-microsoft-antispam-prvs: <VI1PR0601MB204693D26E317BC18B12EF2EC5340@VI1PR0601MB2046.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001)(6055026)(6041248)(20161123555025)(20161123560025)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(20161123562025)(6072148);
	SRVR:VI1PR0601MB2046; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0601MB2046; 
x-forefront-prvs: 02622CEF0A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(39850400002)(39450400003)(39410400002)(39840400002)(39860400002)(39400400002)(53754006)(54094003)(86362001)(3280700002)(189998001)(122556002)(2906002)(6916009)(7696004)(33656002)(2900100001)(3660700001)(9686003)(6306002)(8676002)(2351001)(81166006)(8936002)(50986999)(3846002)(5660300001)(53936002)(6116002)(102836003)(6436002)(99286003)(6506006)(77096006)(305945005)(25786009)(19625735003)(7736002)(74316002)(110136004)(38730400002)(53376002)(66066001)(55016002)(1720100001)(5640700003)(2501003)(3480700004)(54356999)(966004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0601MB2046;
	H:VI1PR0601MB2045.eurprd06.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: visteon.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2017 10:32:33.2137 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7a147aaf-01ec-498c-80a1-e34a8c63c548
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0601MB2046
Subject: Subscribing to openembedded-architecture list
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
X-List-Received-Date: Thu, 30 Mar 2017 18:07:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello everybody,

I wonder if openembedded-architecture list is closed, invitation-only or so=
mething.  The OE wiki [1] does not mention any restrictions.  Nevertheless =
I seem to be unable to subscribe via the web interface or via an e-mail req=
uest (tried several times over the last couple of weeks).

What am I missing?


Thanks,
--Pavel Konopelko

[1] http://openembedded.org/wiki/Mailing_lists



