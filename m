Return-Path: <JAEWON@xilinx.com>
X-Greylist: delayed 92862 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 08 Jun 2019 23:07:29 UTC
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
	(mail-eopbgr690067.outbound.protection.outlook.com [40.107.69.67])
	by mail.openembedded.org (Postfix) with ESMTP id C94FD7E530
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2019 23:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=hEkAmu+QBtlgaR31v5vdnKzOcjfvZU1Qq6mn4ESlAKg=;
	b=DYhXizVfzdpQUQBnmoNRzalxLz7rHXSvaJqECyJMMrPOvh7q65hQDZnWgLxVZ60NJtBxru2/VUEyvCOomTpfUzTQ+vzmgk7NyjwvIPA0NgwVKpMA+hZv9mpFjIYL5dtCosxOulVVCi06E+BVHxRGIf4qwlIkevR1GM8hxO9LtQ4=
Received: from BYAPR02MB5816.namprd02.prod.outlook.com (20.179.62.217) by
	BYAPR02MB5768.namprd02.prod.outlook.com (20.179.62.74) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1965.14; Sat, 8 Jun 2019 15:34:50 +0000
Received: from BYAPR02MB5816.namprd02.prod.outlook.com
	([fe80::8d21:3b8:a726:29d2]) by BYAPR02MB5816.namprd02.prod.outlook.com
	([fe80::8d21:3b8:a726:29d2%4]) with mapi id 15.20.1965.011;
	Sat, 8 Jun 2019 15:34:50 +0000
From: Jaewon Lee <JAEWON@xilinx.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] devtool: build: add deploy to the tasks run
	for devtool build
Thread-Index: AQHVHfPTafRG9EtX50+KY7zCmDeanqaR44M3
Date: Sat, 8 Jun 2019 15:34:50 +0000
Message-ID: <E6056B73-2F37-4B1A-9961-589ADC39522F@xilinx.com>
References: <1559945821-18316-1-git-send-email-jaewon.lee@xilinx.com>,
	<75b09b73c57e0717cda78e6732e73d91ef670f45.camel@linuxfoundation.org>
In-Reply-To: <75b09b73c57e0717cda78e6732e73d91ef670f45.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=JAEWON@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 09db5217-b915-4895-f2b1-08d6ec26d864
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR02MB5768; 
x-ms-traffictypediagnostic: BYAPR02MB5768:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BYAPR02MB5768AF6BD53BED9BFBD72465AF110@BYAPR02MB5768.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0062BDD52C
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(346002)(39860400002)(366004)(376002)(136003)(189003)(199004)(33656002)(6116002)(3846002)(14454004)(25786009)(68736007)(76116006)(6916009)(486006)(446003)(478600001)(71190400001)(71200400001)(7736002)(6436002)(102836004)(83716004)(66946007)(73956011)(2616005)(76176011)(476003)(53546011)(6506007)(66446008)(2906002)(11346002)(99286004)(66556008)(64756008)(66476007)(14444005)(256004)(53936002)(4326008)(66066001)(8936002)(966005)(5660300002)(8676002)(82746002)(81166006)(186003)(26005)(72206003)(6306002)(6512007)(305945005)(81156014)(316002)(36756003)(6486002)(86362001)(6246003)(229853002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB5768;
	H:BYAPR02MB5816.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: g1YmcaMVKcF33w9CXAGj++glbe1YYns3YgzewvPlRDUM0H1HahxOoycYW9MN+iN7vX5SSjbtWgsTYvpkJ6OOYtUh9dID3cknsLr0bWqKtLwVnieeSWLCjgYpW/oY7hWa867tcjcx1d1wyhH7lAfmqbZFNoUWp8GIJbO4x50KJlPQyCDicZEQsgyVADqjfaba+u6MJilupAiz9xI3f+aw7jnB6YMqDLWIS9qOFRvHNtmcMUjj1mX34VvdVGNH2PKmHNEkiGyXEyeBJu3KwQjALJUUtQeG1o2hvetBSymduxBk3kIZgn/ZpuzpZVreZFJaF70wAlA8krV8aYp71U4fU47XIfN1FcogVafDrptVBqX4KTreKvuUcdsPEQSE8aX/5jRodv7XxYCLmn+M3Y35IW2IvN0pbiTpSk0jplyu5dY=
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09db5217-b915-4895-f2b1-08d6ec26d864
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2019 15:34:50.1371 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jaewon@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5768
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: build: add deploy to the tasks run for devtool build
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
X-List-Received-Date: Sat, 08 Jun 2019 23:07:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry about that Richard=20
Will be sure to test with that=20

Thanks,
Jaewon


> On Jun 8, 2019, at 5:15 AM, Richard Purdie <richard.purdie@linuxfoundatio=
n.org> wrote:
>=20
>> On Fri, 2019-06-07 at 15:17 -0700, Jaewon Lee wrote:
>> Right now `devtool build` runs populate_sysroot and packagedata
>> tasks.
>> Adding deploy to this list so that the newly built artifacts are
>> available in the deploy directory.
>>=20
>> Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
>>=20
>> [YOCTO #13382]
>>=20
>> Signed-off-by: Jaewon Lee <jaewon.lee@xilinx.com>
>> ---
>> scripts/lib/devtool/build.py | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/scripts/lib/devtool/build.py
>> b/scripts/lib/devtool/build.py
>> index 7543398..aff5710 100644
>> --- a/scripts/lib/devtool/build.py
>> +++ b/scripts/lib/devtool/build.py
>> @@ -37,7 +37,7 @@ def _set_file_values(fn, values):
>>     return updated
>>=20
>> def _get_build_tasks(config):
>> -    tasks =3D config.get('Build', 'build_task',
>> 'populate_sysroot,packagedata').split(',')
>> +    tasks =3D config.get('Build', 'build_task',
>> 'deploy,populate_sysroot,packagedata').split(',')
>>     return ['do_%s' % task.strip() for task in tasks]
>>=20
>> def build(args, config, basepath, workspace):
>=20
> This frustrates me a bit.
>=20
> The key question you have to ask here is "What happens for recipes that
> don't have a do_deploy task?".
>=20
> The answer is it breaks:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/506
>=20
> *Please*, when sending devtool patches, test with:
>=20
> oe-selftest -r devtool
>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20


