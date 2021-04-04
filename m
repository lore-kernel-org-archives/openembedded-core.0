Received: from NAM02-SN1-obe.outbound.protection.outlook.com (NAM02-SN1-obe.outbound.protection.outlook.com [40.107.77.75])
 by mx.groups.io with SMTP id smtpd.web09.46833.1617566302701223132
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Apr 2021 12:58:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=iR//Yipy;
 spf=pass (domain: windriver.com, ip: 40.107.77.75, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QVHpGnX1xy4ls1E9IgTWcDikODLPUAR1OPSgG5Kz99K1KsZ+vqKTTrEBf1C8YQvnSninoleS5jRNmReq7DBV9Y2iOm2oXt9jF4B/6sBlV+o0Y6e8IyNGG6y7TIsddALFeqNmUqPNGkExl8mRSoKkFbdsjBSNDEDAtU+hhjOIdAStkOUrNG4X7XXuL31AmDzAraYRs0QkcccWignugTZvvrOFFoy3ACnhU23RaO1JbCw8TQoFY+unRGQRk5PCtd41k0FZzciJSCMp7yDFjlOK5MgUmNXE+MPB6ASQjtDmMaYsvPvSQjTkbWpu9qGcdUKTQFtzK/NYLUIX5o1wzG0TKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJWTJVGwO6tMWUtJ3HwiPDzvd1wDSoxZXqXPK+o3oMw=;
 b=YLOcpeBI9Jhw1W2sXL1Qs0xvlJ2sFCrnypao9I+JHpfzCtQ8L9qlUXljyhDkZapC9dRgkV40O09tHSjtSmeHCqkm2gnmWYyy8Ee4NB2/x3EhzsqnCcGPbQv7gXuUXHer6kxtBhSKqKJCQhdyEsFcXLQgBripBYlqasH7MdjOHLlXX+HG8vK/PbAtxyVHq0xbPuqBUhx3eraVW+v9/5jUMOaBZxy6Ou6fdt+HhJGgP4WC+05soGrkvclfk+YkOatjwjYSLy2Gpi8lGwNTYFkhUTf+qBQoy+zpVWvlMzojjI8xIwV1iP6QjtBpcrOVXSeD+fbVeVBzxjMt9RhQ2AO5YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJWTJVGwO6tMWUtJ3HwiPDzvd1wDSoxZXqXPK+o3oMw=;
 b=iR//YipyURg5AsTTMGPMH1d/a9qcYcNW0fge//uh4SlIrImv3mEUOCVXUSQRrst1DPjAfRGusQKuE6G7r7Ql3xLD16HpR090OOKDRGTwqwMa1Er/79UWz7gBilrw6uodvjQiS1voHuYsE2IQexf29F4UNXLCBbtGn5G0ga0I+20=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1787.namprd11.prod.outlook.com (2603:10b6:3:112::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Sun, 4 Apr
 2021 19:58:20 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3999.032; Sun, 4 Apr 2021
 19:58:20 +0000
Subject: Re: [OE-core] Autobuilder data collection for intermittent bugs
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Sakib Sajal <sakib.sajal@windriver.com>
CC: Trevor Gamblin <trevor.gamblin@windriver.com>,
 Steve Sakoman <steve@sakoman.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <768fd8d6-09bb-3e87-fd37-267ac9352866@windriver.com>
 <e2a237d0cc34d56882de9d064287b81858a48a56.camel@linuxfoundation.org>
 <afde9c35-3113-3663-75e1-791b73eeac65@windriver.com>
 <9cea6a57043657d69ed020b6d6f773a9b8b69ffb.camel@linuxfoundation.org>
 <5bf201ae-4bd9-3a80-5917-a09f17521b2f@windriver.com>
 <f1a4b9050c271bc21e0fb68fe5701efbddcb56f4.camel@linuxfoundation.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <e3306564-a457-4735-1ad2-0d06a484c8f9@windriver.com>
Date: Sun, 4 Apr 2021 15:56:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <f1a4b9050c271bc21e0fb68fe5701efbddcb56f4.camel@linuxfoundation.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: SJ0PR03CA0031.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::6) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by SJ0PR03CA0031.namprd03.prod.outlook.com (2603:10b6:a03:33e::6) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend Transport; Sun, 4 Apr 2021 19:58:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 249ea359-75eb-47e7-75e2-08d8f7a3fef1
X-MS-TrafficTypeDiagnostic: DM5PR11MB1787:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1787B6DB6FF34BE24A4A46C6F8789@DM5PR11MB1787.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lANkyMUwUi+R4WsyKuNLaSFhYABylU+EKoO59vVzzRoUoIXk0L8tNeuiELaq457vo1KAI2MYc1wFQWWt9uquY1GtogrkhLnEj3lQsBnVrZ++6xKl0XAGjUqWZcUIOzJ4nzHSbALAP7kUBwtxafyejs1LxgMaBsbpqw2Eif/698Fy7IbhgNkTkVenyLe5QWvuwvOJEeFd5sfJxU9W6P0hB+DLr26M5cU5zvRqk2zGrGClvlJg6GNQ94AwOrM2nyxEHF2NR2BmACLoq6UdJWsTVrZg5jmYtThimbkX7aNDvSRCNFHVfTi4rnAmEGed43Et1Qg0G1t98z4PQVhOG9TxvpVYsWQQFmkDHR72X0GD4zYm7re8Je9HmMUspfdQhICGuKKqSnWowvKsvoRzeCR9veqsvCdT81Q8y15yvwqpubU1GPRs2YZlWyc0xF0Zv1Gm/fJpSRcC1MdcEJvQENik8kQKcYR1F/Tvqk1evI9VOcBmvrac1ufqMNCvjq5wfxzz4QnSVR+opsT/IPjyA555RwP8D6DGc5K75xrleUwSIBzH631BZCcjrjmCHTbtxTKHBtCm50hNR+ctf0x0CQ1weMeZvJDbprhUNWBGC+grt+RgNDulfMdRHv25cjfOJ+ALPAYohBw8zVYL7qcXJhjk72OLo0g4iLUY8nbH1DriFVrU7RU8mLz9hfATO27x7+hmY7OD9IcLNdZ1G0MdzcLkF7GAfqYYmpYzHeLdcN1lY1h4eQ/TylzsOaGt1hYAGRwC/HqlE2U5k+pUZY+Lu3TlB+pjd4LZ+xpWzQKzQbyZv9w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(366004)(346002)(39830400003)(376002)(16526019)(54906003)(186003)(966005)(8936002)(66476007)(38100700001)(110136005)(52116002)(8676002)(2616005)(6636002)(478600001)(26005)(6666004)(316002)(66946007)(6486002)(53546011)(66556008)(31686004)(86362001)(16576012)(4326008)(36756003)(5660300002)(2906002)(83380400001)(66574015)(31696002)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?mW45TocDFNqsAKgLCP7gxmruNzgYkg8cMyY6UkaGfB4I/ulVB1Dmw7pdmK+x?=
 =?us-ascii?Q?dxtZvI/RPnxBQVfoTvLjTqf44hdMJ+kBQaLiOHCMoyPgxNd0Z8ltvOaxDxyp?=
 =?us-ascii?Q?AyGGbdM7s1EB51KHXuO7IieSD05WPFdkmYZg/ftY7mvEpsIJI3TTcCzDzohH?=
 =?us-ascii?Q?Lr52gowpYCZC20SVhsiZjA4w4J5weeXTm4smRvrXOJX61OsVVG7QvAe5zDoK?=
 =?us-ascii?Q?6Bakf+qRDxl7Q+uxbzFpHr4pDbmREWQwp3wRnZWcSoIStG4F/+qznqPJ1doX?=
 =?us-ascii?Q?j2m2vr1Eb60/psPjUWzOE3R9hIRhpZ6k2OA8/wQxchZuTtDx4Y4+aaDdwiOO?=
 =?us-ascii?Q?4+C7jG3Q17+VDdSmggMocJl+MYnIY/1k8l/w6uV8CIT++dk0xMGnHN+d5uUa?=
 =?us-ascii?Q?NIgdfK7sVntRxpnNAp9jgDwVWjFeloBtxUzzRJ6uvbdqJ7KPqhKFqLYQdvHV?=
 =?us-ascii?Q?VqNaDeHMowU7SE0noqSyrEsRLv0pSMvcMRpn6XmtL77Rut5Fud/P/UVVcZG9?=
 =?us-ascii?Q?ynzHFlgSV2Deip5x6PKlRprzIC0SI8j6ud18l/asjtFX/sv0OZlXxKZAk3QU?=
 =?us-ascii?Q?S+lSObOVrGytjOCtSoBN3Xf/7gfJ9pkzKcj7qtr3geNu+V8wVFc2zHodpucT?=
 =?us-ascii?Q?ooHfLT06fpSwrJKfjdeOUj5txgo6D8ijGu7yG4W5oE9Ox6qsYzRHE66OdwWw?=
 =?us-ascii?Q?TPdP7ET70dYZviH0RX8baTyzCxoMtB6Q15R6k5P1af74wko8X0dbzl59/Zip?=
 =?us-ascii?Q?5vsHf0CrQn5/B6wxDTun9YZLlP4cjolVRbp4uHj6ZlfTq8UKmNSishfa3ltm?=
 =?us-ascii?Q?Gbs0MvhjUa4A0/E53FrvGRnVVNp+wvIWk0K1Cmio9JthGj5fo1fFRgbEM4OE?=
 =?us-ascii?Q?FlJCQOkBnmG0cwuO+S8xnc9XetyeldbcuJrQ8I66qtAiOWfnb5RD+4t6C5Dn?=
 =?us-ascii?Q?Pp64i5W/cbuqpWUE8AuEhmugp13o6++Xzs95XJT/BcQ6wbmpFvJLmUXX5dsv?=
 =?us-ascii?Q?GZ+DjZ9PyREeBO/iAUGZBw36trw6YTk1Zna7xeal8nYcjzIRv3KZzAAVMcLD?=
 =?us-ascii?Q?VD2cXJ50ghph1ZpCmH4RFIJYE+95K+XOKtFsfxny3FgH879tjPvmnkkJmJiL?=
 =?us-ascii?Q?BryTe0LcL8Nfl+frHk/gNiGs6z3CliW2c63VBD0oS28+85TWK7+8gFb0vJtQ?=
 =?us-ascii?Q?1JLXL3v8Zo/rJ1T7gCPXH0HsHgWh762RorjlC8R6cL3NpzE1owGE479Z5LJw?=
 =?us-ascii?Q?lRCDWSlM3Nwtr3u8kvLHKOHHtRn/fhX+60vM2flI5H8yXbNefYdidoQzHFtY?=
 =?us-ascii?Q?gYEt6db1Iw/ui9OUgG5sjMC6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 249ea359-75eb-47e7-75e2-08d8f7a3fef1
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2021 19:58:20.4270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ln+gZ86COeA/agbGn6lwoPCcbiJVWpniKTMwzUGVhWeZbszIYPzm2uuAb5Qua06masGV1NC3Glp9qNvZRD0RxcwGJu6pPHQZC2vjCdtCW6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1787
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: quoted-printable

On 2021-03-31 6:01 p.m., Richard Purdie wrote:
> On Wed, 2021-03-31 at 17:45 -0400, Sakib Sajal wrote:
>> We were able to follow the example and collect results in:
>>
>> https://autobuilder.yocto.io/pub/non-release/20210331-18/testresults/qa=
-extras2/2021-03-31--20-32/
>>
>> host_stats.0
>>
>> host_stats.1
>>
>> host_stats.2
>>
>> We are renaming the files to host_stats_<step>.txt so that it would ope=
n
>> on the browser.
>>
>>
>> We were looking at generate-testresult-index.py and would like to appen=
d
>> a new column called "AB INT" and hyperlink each file in the folder wher=
e
>> "top" was triggered. Normally there should not be any links.
>> Occasionally, we should see 1 or 2 but not more unless things go really
>> bad. Do you agree this is a reasonable approach? Who do we contact abou=
t
>> testing the changes? Trevor has an internal instance running, we could
>> try it out there.
>>
>>
>> Below is the diff of the changes we plan to make for the index. We do
>> not completely understand the script yet, we are working on it.
>>
>> autobuilder/yocto-autobuilder-helper$ git diff
>> ./scripts/generate-testresult-index.py
>> diff --git a/scripts/generate-testresult-index.py
>> b/scripts/generate-testresult-index.py
>> index d9d577e..27fe06f 100755
>> --- a/scripts/generate-testresult-index.py
>> +++ b/scripts/generate-testresult-index.py
>> @@ -33,6 +33,7 @@ index_templpate =3D """
>>  =C2=A0=C2=A0=C2=A0 <th>Performance Reports</th>
>>  =C2=A0=C2=A0=C2=A0 <th>ptest Logs</th>
>>  =C2=A0=C2=A0=C2=A0 <th>Buildhistory</th>
>> +=C2=A0 <th>AB INT</th>
>>  =C2=A0=C2=A0</tr>
>>  =C2=A0=C2=A0</thead>
>>  =C2=A0=C2=A0<tdata>
>> @@ -57,6 +58,11 @@ index_templpate =3D """
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"{{bh[0]}}">{{bh[1]}}</=
a>
>>  =C2=A0=C2=A0=C2=A0=C2=A0 {% endfor %}
>>  =C2=A0=C2=A0=C2=A0=C2=A0 </td>
>> +=C2=A0=C2=A0 <td>
>> +=C2=A0=C2=A0 {% for abint in entry[8] %}
>> +=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"{{abint[0]}}">{{abint[1]}}</a>
>> +=C2=A0=C2=A0 {% endfor %}
>> +=C2=A0=C2=A0 </td>
>>  =C2=A0=C2=A0</tr>
>>  =C2=A0=C2=A0{% endfor %}
>>  =C2=A0=C2=A0</tdata>
>> @@ -145,6 +151,11 @@ for build in sorted(os.listdir(path), key=3Dkeygen=
,
>> reverse=3DTrue):
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if os.path.exists(buildpath + "/qemuarm=
/buildhistory.txt"):
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buildhistory.ap=
pend((reldir +
>> "testresults/qemuarm/buildhistory.txt", "qemuarm"))
>>
>> +=C2=A0=C2=A0=C2=A0 abint =3D []
>> +=C2=A0=C2=A0=C2=A0 for p in glob.glob(buildpath + "/ab-int*/host_stats=
*"):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abintname =3D os.path.basen=
ame(os.path.dirname(p))
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abintreports.append((reldir=
 + "testresults/" + abintname + "/"
>> + os.path.basename(p), perfname.replace("buildperf-",""))) #todo
>> +
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 branch =3D get_build_branch(buildpath)
>>
>=20
> Rather than messing with the main index which is "production", could you=
 just create
> your own for=C2=A0now for testing? :)

Yes, we've figured all that out, thanks.
We'll send you a patch once we've completed testing on our instance of
the YP AB, early this week.

>=20
> FWIW I added tmpfs testing for qemu images into master-next (needs ab-he=
lper
> master-next too) so it will be interesting to compare builds running wit=
h that
> with the previous build bug trends.

Any conclusions so far?

../Randy

>=20
> Cheers,
>=20
> Richard
>=20
>=20
>=20
>=20
>=20


--=20
# Randy MacLeod
# Wind River Linux
