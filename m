Return-Path: <niko.mauno@vaisala.com>
X-Greylist: delayed 18298 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 13 Nov 2018 01:14:08 UTC
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70058.outbound.protection.outlook.com [40.107.7.58])
	by mail.openembedded.org (Postfix) with ESMTP id C307F6C074
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 01:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=oHp192IbCQEi37lw9MGf3iVx8EGbFCZqSVvW7uyiKGg=;
	b=aVl/sEFgbtK04L5ZhZrSRAw7YBfbGS1KExWddMue9N7jeWDatYdGLtJUl3zNHACQn+McMvHjMo0PFNjdbFBZYnjgkei+KsmB7X5FzqN2xNZzA89AWABnB6+usnfjVPC/PJfgxgZWZjob8Om6NoWCp/mif00yuDSdGahL9rrk02I=
Received: from AM6PR0602MB3544.eurprd06.prod.outlook.com (52.133.23.17) by
	AM6PR0602MB3560.eurprd06.prod.outlook.com (52.133.23.21) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1294.21; Mon, 12 Nov 2018 12:40:54 +0000
Received: from AM6PR0602MB3544.eurprd06.prod.outlook.com
	([fe80::70b3:f9f3:a5a5:df3a]) by
	AM6PR0602MB3544.eurprd06.prod.outlook.com
	([fe80::70b3:f9f3:a5a5:df3a%5]) with mapi id 15.20.1294.044;
	Mon, 12 Nov 2018 12:40:54 +0000
From: Mauno Niko <niko.mauno@vaisala.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] opkg-utils: Fix update-alternatives link
	relocation
Thread-Index: AQHUeoTzNnQfYKK0e0CTKoYPqIXefA==
Date: Mon, 12 Nov 2018 12:40:54 +0000
Message-ID: <3b7518cf-1614-2e5b-9bb0-6288dfd06e88@vaisala.com>
References: <20181111153414.26447-1-niko.mauno@iki.fi>
	<CAJTo0LY05Mv=zODUjoA8C_tGvRe9eK2zfi1XuF-O7dH4SwD_jQ@mail.gmail.com>
In-Reply-To: <CAJTo0LY05Mv=zODUjoA8C_tGvRe9eK2zfi1XuF-O7dH4SwD_jQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
x-originating-ip: [193.143.230.131]
x-clientproxiedby: AM6PR05CA0022.eurprd05.prod.outlook.com
	(2603:10a6:20b:2e::35) To AM6PR0602MB3544.eurprd06.prod.outlook.com
	(2603:10a6:209:e::17)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; AM6PR0602MB3560;
	6:XasXBbeuV/8FspNW04jpy3YQvJtV0Qi04qOzwPT8QfsR7nFR6fEj8ZatffKDs1pdcFIRMzgIycUvAXyccBKhaan+KNfZYli0S/h6WRsxXezzF43XGwnRzcDrD7JXqiCFBpEFi6ng3FlFINuyveAHlsb9QvsapKhed7xfZCUkEwRk8xK3b3EWizYQT1kyIUeQvtaBZqJJVZ4cH/DRDyfbzmI/oh+0MVEl5ue1yAkWFLowQtNeostEBr8TdV5Dnsfnn/VJf30PLgJLW89TPU2RbHJF2mHGpBOBC6cXiWjlB/zstGEPH3EBgmKWS5qATvMhp9Ybd156KkYfjZX6Rz2hIVh+s4TVEobPFdsWNWjzxKBqg/lUIuEfRZ7MyWm9wkabVPVHRLjWsLwvpCz1Ca9/0HibyX4wqDvJOIoc46KIHSrerlgzI+TQ+YdNGDM5CPlRlEizDlx7+P/33Q6GdxWvVw==;
	5:0in1GrRdmGm8xzlCG8VJMk6DiZrVqqlNokegZVwJFiWCVLnHuFFrvYshcl1QY+ZY/GohughzQVBvxMixUNMwspYok8k2i0l0d/g9cz1tsSfdaaiNxItmJmPsrRSUX3uVRGH2d4zTWk/sZu2msRk8V73Bbavg6fe4MtCmMFl0974=;
	7:g+MKRy3Q2AQysQDWSBx2SQZQG08vbZwynVmNTWEUwNrniuz0Pu5a+BY12fkD2uRV7hzuYUrrYThEk3TbE2LW12YsKuz6Zu/QqgL5HxwUZwaEG2fGS7kk5BymbSJ0Cpo9yjvCKjHdXZ3FAJteyRI40w==
x-ms-office365-filtering-correlation-id: 2c3756f6-53de-4d6f-6f75-08d6489c15fe
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390040)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR0602MB3560; 
x-ms-traffictypediagnostic: AM6PR0602MB3560:
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-microsoft-antispam-prvs: <AM6PR0602MB356047A000235358A5CC127D81C10@AM6PR0602MB3560.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231382)(944501410)(52105112)(3002001)(10201501046)(93006095)(93001095)(148016)(149066)(150057)(6041310)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051)(76991095);
	SRVR:AM6PR0602MB3560; BCL:0; PCL:0; RULEID:;
	SRVR:AM6PR0602MB3560; 
x-forefront-prvs: 0854128AF0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(396003)(39850400004)(366004)(346002)(376002)(199004)(189003)(478600001)(8676002)(6916009)(66066001)(81166006)(229853002)(2351001)(3846002)(966005)(81156014)(99286004)(6116002)(6512007)(6306002)(58126008)(8936002)(316002)(305945005)(25786009)(64126003)(7736002)(65826007)(36756003)(53936002)(52116002)(6246003)(256004)(31686004)(5660300001)(97736004)(186003)(14454004)(14444005)(6436002)(486006)(65956001)(65806001)(2616005)(476003)(11346002)(446003)(2501003)(386003)(53546011)(106356001)(6486002)(86362001)(105586002)(71190400001)(76176011)(5640700003)(2900100001)(71200400001)(6506007)(26005)(2906002)(102836004)(31696002)(68736007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR0602MB3560;
	H:AM6PR0602MB3544.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: wjNrGhS4/Ji7eSKQqvHNKcNQVrOysRmwFVBbiH7pZVP4G1AmVydcdgvDkU/bXkp7jj6CCvDsRjxphI1EQIlqFycfujQR1D4Xa01w99L4qWgLhBamM9xPx9TRHMLUl9b2q03dtAKNB3umO7a/4Uiv1Hom6eC1KFpdayVH+jTPw2guZlRsOo71qdOybkxbVil9cElIY5Omdd/kZLabQhLzQcIaodAYwOdrAtYWqHFl78lo9AptCqUV8Lbgke06rFKDXSham/b9dDBUv1LARmEmJwBVRbUuz1k9eGMFYMDcLDZvWpK9ml2vW4nCkTXzdhpzi38EumFraopkYCJaH5Dat7q11Q4Johz4dXmJUb6+FvE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c3756f6-53de-4d6f-6f75-08d6489c15fe
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2018 12:40:54.4504 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0602MB3560
Subject: Re: [PATCH] opkg-utils: Fix update-alternatives link relocation
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
X-List-Received-Date: Tue, 13 Nov 2018 01:14:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <B226D6E174CB554DA556BE69FD545366@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable



On 11/12/2018 12:55 PM, Burton, Ross wrote:
> On Sun, 11 Nov 2018 at 15:44, Niko Mauno <niko.mauno@iki.fi> wrote:
>> +Upstream-Status: Pending
>=20
> I saw you post this to yocto@, so this is definitely Submitted.

Thanks, indeed I failed to reflect appropriate status as per instructions i=
n https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_H=
eader_Recommendations:_Upstream-Status

Will submit v2 with correct Upstream-Status later today

-Niko

