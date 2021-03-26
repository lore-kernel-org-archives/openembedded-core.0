Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.41])
 by mx.groups.io with SMTP id smtpd.web08.5694.1616716807288825121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 17:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=hMJh9V/g;
 spf=pass (domain: windriver.com, ip: 40.107.237.41, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEZhpRg7eessHxgiyfD/kW6D6vPr+IyaUE77BRrf216T4duZsO7AT+RTRtqSqxDKnvTNRPiUkaSp/kHS65YY43gFMSZo+vJOm3ZC5EEyBB7WUXGvfxPTvWwnV4dByEBLjTjYv74WeTrr5gVlcS6VoT/7syzcGXInqEczk/YBkoPi0ukNPl5wMN9umT1hAxwhwvHmLngZtkegjFW8WH+obLZPtdSxxs9DbOQCu7oIPkrAFzIAdYpnMQY77ZnZhEcfXeKZH4NbxLGs0cdcfG/lZAeQX+LP/1xuCQfI9Ci0vPh1CsdwQnrpjriNsgpXSd3nRanRS4VMVbD9r13kElnBLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDXs5oaWbrM1UPxbwY588PWwmmAgVrbmIhogNku+YHk=;
 b=TjZXDBnDVxSseS8FpYrJhL3ju/jR0rBJUdUFAAgCAQ8EKh0TZKmEVvvhAcj3f1ir99j1CDbt+R2iYj2469OUJV8v65nPah1tukxdghk8aifhDZQHYlp4cvS/MmGZheeFwZN9AUBSvMbDGw+js1DhfrbmOjdD2zpufLxEkb2jv/2Fb8DTTo34D14FLv6Yei8+X75Oc5ubf54xc5Ppsrj8bGyCjspE5tgGPwLzJEgHhAZyRhqvi4xzKl/ZBy4bfD7xKUpg+NeIBNP9rSqpFSIl2tHy1hZPEwFV9R+i7Oi3mMhFQWWpgh2L44oGlALxXYtkrWT0Zyng7TLGlHSyVAhgKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDXs5oaWbrM1UPxbwY588PWwmmAgVrbmIhogNku+YHk=;
 b=hMJh9V/gv20azhMMrxsyfR5TjCSS2NWNL7ZPMQcamL9VWt2ox12wGSLFer9Rv5ZNXkYcLU3W/2EWOP1AvpmsANxkvQOPUZaTRhyomxa/AECwS98y7TIUJ6LSbDXTOE1YNK7iv/tgYUYqiGTjkw6th7L/PVZr+QEDAB+42aGTm4o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 26 Mar
 2021 00:00:06 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3977.024; Fri, 26 Mar 2021
 00:00:05 +0000
Subject: Re: Autobuilder data collection for intermittent bugs
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Sakib Sajal <sakib.sajal@windriver.com>
CC: Trevor Gamblin <trevor.gamblin@windriver.com>,
 Steve Sakoman <steve@sakoman.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <768fd8d6-09bb-3e87-fd37-267ac9352866@windriver.com>
 <e2a237d0cc34d56882de9d064287b81858a48a56.camel@linuxfoundation.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <afde9c35-3113-3663-75e1-791b73eeac65@windriver.com>
Date: Thu, 25 Mar 2021 20:00:01 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <e2a237d0cc34d56882de9d064287b81858a48a56.camel@linuxfoundation.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR05CA0106.namprd05.prod.outlook.com
 (2603:10b6:a03:334::21) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR05CA0106.namprd05.prod.outlook.com (2603:10b6:a03:334::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.15 via Frontend Transport; Fri, 26 Mar 2021 00:00:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8ca1c6cb-faf1-4ed6-ead8-08d8efea1cbc
X-MS-TrafficTypeDiagnostic: DM6PR11MB4625:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB46250C3DFF1D1C9DBC09FF2FF8619@DM6PR11MB4625.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iWPAeIZX/ppu0v+dslkFwwo/ProNG9fUHVsyxGPWBEy9Uj9IP3iJhIibvRd2xKelotO36mpce7A7qYsyzLT8zr0tUhAH0xpwnKjoKzRyWKPIto2gZ8boKI01rryU5iX9Cc9bCkPEivD9Mq3n1TPaMmREIgY4fkfIwyZtUIVcenY+7J+lsb4HOm4zCWZBQnxE6sg7IghLRRNli+UahuO5P08LSjXJs1RUz+9giJQG4G2SzbS8FCTnw0oIpxDCihDIwFR3GFB9oS47C7lDTTCZ+ApDmuPH8XoSk+cUH+f+KPfxiDJ6Y5ro70dF9UPkXUHcKOOCqmvMILiwnpKcmBuJYdO2BWWDJf9YGIcDOOWU7x72UJPE+aeS/Uge9YMd/hiKczDewaBau8hIqyAAFVFZldps2gJfgqmKk7Qn24J5NH/ytm1A12Ga9f2KVpDXjO31UWed8wwXpzdAWujWtWLyTPqewVAi/KQjcBXXyySDKUvNBD95rGPMCW/g7rNmBxZYiC4eV72MKjipk3ZyJ2Oef7Mc23UBOx6pL57pElYrHBry7046u2m+fBwCgcjL59OpewLZJC2eazsNdLPWBhRDoZKO3f7Q3tdPIFQYvsillL0BJiCdfS9rUqbFkUqE7T6Ap0BUeH8SZLPfktwXsn4TsiMykpPHMyhWSfaiqWMK2tsst9EkBuD8nU0eEGXRk1noGxohfxcK0KWHKXTY+OT0tdifveYKURKhQifqgBCMnHr7AZWihp9xPYraOk1KsnfzKwOflG7S9KHB7faVOs3Iu+iaMFVAfAVYIkJgbWSDN1babuqAWbjcG4so+UoN/u+T
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(136003)(366004)(346002)(38100700001)(6666004)(36756003)(110136005)(54906003)(83380400001)(6486002)(52116002)(966005)(16576012)(31686004)(53546011)(6636002)(478600001)(2616005)(66556008)(8676002)(66476007)(16526019)(186003)(956004)(316002)(2906002)(66946007)(31696002)(4326008)(8936002)(86362001)(26005)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?vp1Q3tCvyowONUgMRsPUXc3m+Z0kdqfcjO7GyVSXPjx8IpfIfyELcnI1wh/S?=
 =?us-ascii?Q?X0B6/anItRsBb8Jt4x8blusYskix729F3Kw56i2xdwTOs9KBYEbWiUOHym2a?=
 =?us-ascii?Q?NUPT66G3RfeMZyH/fd5nrpKKUajphXy/FANoq9+Us6GiSDqfjzFNGr7+Qu7E?=
 =?us-ascii?Q?HMB15O/MXHsSYEtfT7U6TonSXyOFCxBRaHbWasRJaRLUkuKxnQSuQ4k+DlPZ?=
 =?us-ascii?Q?8uc/b6TskGb9NgYBj/PxAR53M0Hq5RVJpS5fUzJcqAby9HUtPoEsVpweABPR?=
 =?us-ascii?Q?UcHfo63EfkuAvpGgm5QFBe8jjJXZ/WdX3Ycz+AnwReCyVYk7LRcH9e8T+aLg?=
 =?us-ascii?Q?P0wXnOedSox8amUc6eWn4r3VnTknbQx6NdMadS6LnlMqsedURyDIx45oMIyh?=
 =?us-ascii?Q?/pdnGnCBXh6oHEKxitI+6PloSsuPTcaBcVC+MqqcefUgAN4IUxPjKglv3TLr?=
 =?us-ascii?Q?zN7I2hjlwef21jyBY6xnQ7WDXA4AaViDO/KXXpQ6b1JAYx/LSrAq+pTG3jD+?=
 =?us-ascii?Q?wsyGJQaHxNRMaze0D4e4k0OAbOGeZRGuw5kVVUwFr+SbDjjzCukNwSsDcAh1?=
 =?us-ascii?Q?vcf9sFnBnXkRkrpnE5nWleBasMvnSv66bYpAXL7x0vfY3L12lOCiiEBjBFyh?=
 =?us-ascii?Q?beJfxGXy0hoWiCKuzQApfcbFEFe3RPZq+5bTABOwleIpSzqI/attrHaPtZNc?=
 =?us-ascii?Q?A63F1Q9hhqHxwD2MzojJQOq5yOtyMC3hM6seaUwYQdMcchKIK2fRqTh7YIih?=
 =?us-ascii?Q?dSoC+1LxV1fRm0/EgFp5RsyoG+rJWDk7EsNiqSWtZSwMiK1TRlxoxzx3dkvj?=
 =?us-ascii?Q?YSE+qZHEkoiijH/YDKAaUbF/EMIhsra2qnCb5VIt7Rb6VMN/hchwuxcieE4i?=
 =?us-ascii?Q?OtILoU3V2VrdyrAVAcLmGCqC0evtaWUhE/Y8bALLCzBVUwUZFRteiQptt2PU?=
 =?us-ascii?Q?rAjsXaQY0ysk49s0Lx94jTFthES2snxVLZ95VnJdII2M/lNZH0TDyrJOKmQM?=
 =?us-ascii?Q?8L7gK9PM1N/uBtiyIGPBll0B9B4J1+HQ8q5c0FPEKiikOFiA9rZPUH0SR5Zq?=
 =?us-ascii?Q?kjHJzM++ng1XDqnCL60GD1uizvSdLlPxg2PN254SS0qMLyTgscr4by/8ikK9?=
 =?us-ascii?Q?fnw7+Rm1hCfoxxWkLpG+RbOT9paL/+iK5oSf6eaOljZTebfim49r5xQChLGi?=
 =?us-ascii?Q?B6p8tfV1lkCSGgriW4W4XzHQKKI3yqhRgrlYGpjC0bbheJQ1oP4VhaxkGnvO?=
 =?us-ascii?Q?lULcxqJFd1iyQYk+U7AEcGotGiHgVGNVSJVDJyEJEsJ6A6njIm8xsNxxKOEQ?=
 =?us-ascii?Q?Gt2+r8ih0QhNm/1xHRPRpYzf?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ca1c6cb-faf1-4ed6-ead8-08d8efea1cbc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2021 00:00:05.7962
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WFA2+faF0sWCv6ZPMO+7Xw118fW0V4O3yLDmxijXa3K/RskLyy2jAP96xqA2viynfUROc8CHOc82kRVDTrYvcO43yU2gyCZkYijvPNLYGMU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-03-25 6:23 p.m., Richard Purdie wrote:
> Hi Sakib,
>=20
> On Thu, 2021-03-25 at 18:11 -0400, Sakib Sajal wrote:
>> I have been trying, with help from Randy, Trevor and Steve, to run some
>> experiments on an internal autobuilder instance to collect host data
>> during builds for signs of io latency.
>>
>> Initially i modified yocto-autobuilder-helper/config.json and added the
>> following 3 lines to existing templates (and created a commit) that were
>> being used so that the builds would start collecting the data.
>>
>>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "BB_HEARTBEAT_EVENT =3D '5'",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "BB_LOG_HOST_STAT_ON_INTERVAL =3D '1'",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "BB_LOG_HOST_STAT_CMDS =3D 'pwd; ls'"
>>
>> I also created a template in yocto-autobuilder-helper/config.json
>>
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "data-collect" : {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BUI=
LDINFO" : true,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BBT=
ARGETS" : "core-image-minimal",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ext=
ravars" : [
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "BB_HEARTBEAT_EVENT =3D '5'",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "BB_LOG_HOST_STAT_ON_INTERVAL =3D '1'",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "BB_LOG_HOST_STAT_CMDS =3D 'pwd; ls'"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>
>> and modified a builder to use the template:
>>
>>  =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "beaglebone-alt" : {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "MAC=
HINE" : "beaglebone-yocto",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "TEM=
PLATE" : "altcfg-hw"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "MAC=
HINE" : "qemux86-64",
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "TEM=
PLATE" : "data-collect"
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },
>>
>> Restarted both the controller and the worker, and started the
>> beaglebone-alt build. Once the build started, i checked the conf file in
>> the build directory but those lines were not appended to the local.conf
>> file and hence no log files.
>=20
> You shouldn't need to restart the controller, the worker should pull and
> use the configuration from the helper branch specified.
>=20
> I'd note that it writes the config to auto.conf, not local.conf.
>=20
> It should also give output in the logs about what its doing. For example:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/106/builds/2144/s=
teps/10/logs/stdio
>=20
> is the "Write config" step of beaglebone-alt on the autobuilder where it
> clearly says:
>=20
> Writing /home/pokybuild/yocto-worker/beaglebone-alt/build/build/conf/auto=
.conf with contents:
>=20
> What do your logs say?
>=20
>> In summary, I have been trying to get the 3 lines from the "extravars"
>> above to appear in one of the local.conf files. However none of the
>> builds seems to have been altered.
>>
>> I am wondering if the changes that I've made are even being picked up by
>> the controller. Am I missing something?
>>
>> Is there an easier way to update the conf files?
>>
>> Initially I'd like collect data on a single node and scale it to all the
>> nodes. Any ideas/suggestions are welcome!
>=20
> What you're doing should work. Its hard to comment more without seeing to=
 logs
> but check you're looking at auto.conf.

Thanks for the update Sakib.

We're planning to follow Steve's example of getting commit access to
contrib branches of y-a-h and poky and using the YP AB to start custom=20
workers/job initially.  We'll also keep working to duplicate the
AB behaviour locally. Trevor has asked Konrad for an additional system
or two since when jobs are running, the web UI is
painfully slow since it's runnig on the same node right now.

The one part that Sakib didn't ask about is how to get all the workers
to do the data collection but that's not urgent since we'll be doing
some smaller scale experiments tomorrow. If you can point out a helpful
example, that'd be good.

Hopefully we'll have a good collection of data showing what processes
are running when the IO latency is > 5 seconds sometime next week.

../Randy

>=20
> Cheers,
>=20
> Richard
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux
