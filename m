Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.81])
 by mx.groups.io with SMTP id smtpd.web11.372.1617227136236800164
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 14:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GNkGEp0Z;
 spf=pass (domain: windriver.com, ip: 40.107.94.81, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MRtzB08TJimFH/pZTI9U0/NftVjA/5krlPpjFfoGBEqUwSDjGvQ4bi2Rhp4extbK4qfR3poDNpR2IWyA3G+Fx9bBjfrQKyqFZPCZNJeeS+YjN0KMwSjIgy6Irw5JU6wwH+nALjpobom+WxMWpJQ2cUl72ybQZz5ap2uxy7sUqX6+2oyrp+edodTxGT7ieLpZ/u+mp1DhwLmur0ApSIjswUqHnjSosVILutXmJXZzLkgT+zTfe0eTH6uzk+3MUD37zl+GJiRL0GBneuR/itQ2G1wKM5pn7IWmtM5GGcbUSujMEbVtdzWZK1TPRT8o6Sy63H/vtyRelPg5pSUqoBo4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsSTIUn6o0iQFbGV//F1UhUjzRy2wNOubHw6SPm5jgE=;
 b=PAKutak1jKuT7rzPHg5Pvi0gJVUH4zYeXulcEZLmFK8TZOOIx9+Lkp/8GpJjio+J59SseD5+YD7kNgAh7EUHeVMq3Nbi7UwsAC+jfeV9uQKIFdQpLSjaZhCrLnS6Gzm3vFo0YLgTkEUV7fi72IvZosQXtSM30XQ5lJNnj2otkG4xPS6Jp5S2tO7OELrtB4BsFabpa3B+5SOO46FqxpVmsTKQ65kRgWeurIn6I5Ctdtm+vmzcmsIFDSPE9Red7jB63hit3ii3dPSiPJrkjv22EFLYmphDe6XY5Ce/j/G2gBmn4XcZPHcQ26X1EYKPsVwy2xshG7glGdmeAxNvPMwy0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GsSTIUn6o0iQFbGV//F1UhUjzRy2wNOubHw6SPm5jgE=;
 b=GNkGEp0ZEhi3yYu9gdlEmHKkCXEog4PLy1rFZb97KEDFJkzAKKPyUL4uJ2QZlY/7QYBcTvEKMB3xHNzUFG9y2Vq1PFByFOdWXO2TSWTcd9Xx2MxUfUj64plFT5J/xDWmnv9/xzQT4+IpaAiDUbxIqkCPJq7m1eh8afEblnyk0uY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR1101MB2188.namprd11.prod.outlook.com (2603:10b6:4:53::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.33; Wed, 31 Mar 2021 21:45:34 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::25ca:eb0e:8908:9fa7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::25ca:eb0e:8908:9fa7%7]) with mapi id 15.20.3977.033; Wed, 31 Mar 2021
 21:45:34 +0000
Subject: Re: Autobuilder data collection for intermittent bugs
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <randy.macleod@windriver.com>
CC: Trevor Gamblin <trevor.gamblin@windriver.com>,
 Steve Sakoman <steve@sakoman.com>,
 OE-core <openembedded-core@lists.openembedded.org>
References: <768fd8d6-09bb-3e87-fd37-267ac9352866@windriver.com>
 <e2a237d0cc34d56882de9d064287b81858a48a56.camel@linuxfoundation.org>
 <afde9c35-3113-3663-75e1-791b73eeac65@windriver.com>
 <9cea6a57043657d69ed020b6d6f773a9b8b69ffb.camel@linuxfoundation.org>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <5bf201ae-4bd9-3a80-5917-a09f17521b2f@windriver.com>
Date: Wed, 31 Mar 2021 17:45:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <9cea6a57043657d69ed020b6d6f773a9b8b69ffb.camel@linuxfoundation.org>
X-Originating-IP: [184.147.76.169]
X-ClientProxiedBy: YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::18) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (184.147.76.169) by YT1PR01CA0139.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30 via Frontend Transport; Wed, 31 Mar 2021 21:45:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c17467a6-6ffd-4bea-7e39-08d8f48e4fcb
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2188:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB218867BA21C8AABFEEC32E9CF27C9@DM5PR1101MB2188.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4l46mnGDs/InfInlF/b5HZUH7YPJwp4eO2WO+5wCPFRRx552U6Zk2Cm5n272SDby/800mpmH8h7KB/v+4xymq/Rel5jnh7MiAKVdRvVMbM+vE3KAzQeX2ZXLixjltykd+wOFoXSb3tIH/jmZLG7gV+yWSW11KPcI446j/7LS51T19GJHwJncSTdn6cuVZSkV0LGSUUXRl2qI0iq3sdavwxt6dNkmcORdgdl4hMnaYmoFculGoqyLgVLiiyVrIFJzrBSL3DYjaSe16qjlbR745S8pyanlVr32Numx4QwIqgw+gGE/XFOLy1povuHSWnneN/Mk1JWDZ2fBNtuel9vQIUFo6kgUCfGjYe3wLhpUX6St4cNA8kXwHne3UHChUm/EaIHxkBph8YLlTW7ndWiANlVTAF68KsAEvuV/5Wq6NSPiP1m3/3CORj11Gm2crQb+TytjT78P65qAhBSlZgDZFfLS8ihnsX9PMNc9oxJuDHeUeAqcWr/dYpwDbGn8k74XQY5sR8ceJKhoknxqUX3IRoQfTOV4wLjz7+6uvhCrhj6e/cDBvWQftEFu07Hn03hkjWxNVF37Ur3CyhOqo234/pEsYJPBqHWSUDY4bELm2RlCwHzigxkuC5UkoLqvUPmhqMJxsuYK76Kpb5IqPuffiCDqIqNBAps5CucXbj17B/GQxlm7o/EA6E9bJlZIWLhnU6WzBhntppbaYtB9xjNKjBjBDlxKVfvQ/4jGCtICweKjghD1kRhTZqlFFvxumhFiJqgTKT0z6C/rVAX57Aj6wB6HVaSzSlR4aNXXCsRDrqo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39850400004)(366004)(54906003)(110136005)(8676002)(83380400001)(16576012)(316002)(31686004)(5660300002)(53546011)(38100700001)(2906002)(52116002)(2616005)(36756003)(4326008)(186003)(16526019)(956004)(66476007)(26005)(6636002)(478600001)(6486002)(966005)(66574015)(66556008)(44832011)(8936002)(66946007)(86362001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?anLQ9SkaVH71xviHDB6vpWxnVuE2rNMuQBn9lTR9hU9SWYM1+VW3jAoMEO/G?=
 =?us-ascii?Q?8hb/KdOPy0uxY0BPUDEfWrhfHvpg2wuzmcwT23HKpUUP0U4L/jW5VQSulcJn?=
 =?us-ascii?Q?UL3koMVQHCSat5uUYs9LiAOzmSoiuT6yq3bXdcMA1CKQHf/olfrAYCOIGQbz?=
 =?us-ascii?Q?BusesarOi+y6FcaOfTmMc/1kbRiYXsOPxqCE7fxM4qQSTK8W686MrQQxkz+D?=
 =?us-ascii?Q?oeIC77yQ9QsA1LquU/hm7Wk0hOk3WygHwT7pa+xXG0CyYf7+B624OORmOmD6?=
 =?us-ascii?Q?4SRMZIwQIHIhuC3nGqYZ25a3r0RVufZOmKpsnEEKk3CKKeWSpBDJnLAudDRz?=
 =?us-ascii?Q?YsSYy2l/lyUi8yolz6WFZ8kRxc4z2XXwrjEDGbpKxorMxaiZZzFkG59Zqm+i?=
 =?us-ascii?Q?oNhmkT0aC39a8UElmjtAFTskhiL5/D6rrsLHnhsba9wL3RIO8vJoP7pEwi2N?=
 =?us-ascii?Q?AdY/PnoE9xSunaWd75Q6iDvy5Uj3YaJNt2cc0JEkumE3Bp4q6gHaqbHVmyPh?=
 =?us-ascii?Q?p1GvR3RvXvAi/uG81O5jbQ1syelE+zIrEqERBtdC+a7XX46+KQn+Yjp4Ao/h?=
 =?us-ascii?Q?O+W+c8NsgRHBVdobh+8NQ5JzPZwGSnycsGRdH5DEK8d4rjjCZBEGcJTQbBh8?=
 =?us-ascii?Q?7p7aU+BOHSA8rGFvY7xEw4jEXghLrhH7AupqumrX7C9qv5QnOmISBpMd7s/8?=
 =?us-ascii?Q?lmnyFSd5Gb95ssGYmqI6MtZPAMXBV98k1uGnDl+ifumWP+xbL5HS8Ird5zTb?=
 =?us-ascii?Q?HpltFTLcuvQfRVTPhfggRy8bQ73nW39PuyF/QRbtoH0mmCrJuqwQZjwir3I5?=
 =?us-ascii?Q?GvaO1YEoTAwopk7GWmsLFl93EpLuo/ZaYeCNwqw8Os4XhCCGGsUxACuKKki5?=
 =?us-ascii?Q?tT5BmkSNJMRBLJ9N+Y863W0toJDrfEghqqlervkRicTE8gMl2zoNB8DxIyLb?=
 =?us-ascii?Q?OI1Zr6sE6+G6HzEejzEUcc0PvqHklnpTVoyVrG2XQoGuL608jb4P+nUfTBSF?=
 =?us-ascii?Q?IOksY0DGcX7lB27V5drkBKqK8rPL8WPL71JCKU+zRW9jzIwyB2On0De2JraW?=
 =?us-ascii?Q?iLRX1GJ1LGrvmzFzUKN4ldUdErarLnoWGtIg7cGdoPJmpYDJMMtKVd730zfk?=
 =?us-ascii?Q?clNZQSdBYkKDsOVR6ofMDpxfJ6ITPfuN9GdW0fZWkGWifLW3RQ3WYvH/VQtc?=
 =?us-ascii?Q?dXbc+1CTjvj7XONIMHmEcHpEyNhAO5IBqbrFa2qN1F/5pQdg6FEK2DL0yjIv?=
 =?us-ascii?Q?IzJT3NYDsZsR2GqPgk6yrECctVQZkDUp6iYNehCcwVssOQI5yKtds2sSVALC?=
 =?us-ascii?Q?HCw0Qg9N6quUAodbs85aY7tJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17467a6-6ffd-4bea-7e39-08d8f48e4fcb
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 21:45:33.8602
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02HGPMqZzuR4ie5UJWjMTVFESn3XCEYw+JX5woaRwXGfZxDvHnkmfd6xMXxPgFP5dutclPfJkdBcIfOEB0Gj7EmH8MZdNysFTxN3reC9DLI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2188
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US


On 2021-03-26 1:50 p.m., Richard Purdie wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Thu, 2021-03-25 at 20:00 -0400, Randy MacLeod wrote:
>> Thanks for the update Sakib.
>>
>> We're planning to follow Steve's example of getting commit access to
>> contrib branches of y-a-h and poky and using the YP AB to start custom
>> workers/job initially.  We'll also keep working to duplicate the
>> AB behaviour locally. Trevor has asked Konrad for an additional system
>> or two since when jobs are running, the web UI is
>> painfully slow since it's runnig on the same node right now.
>>
>> The one part that Sakib didn't ask about is how to get all the workers
>> to do the data collection but that's not urgent since we'll be doing
>> some smaller scale experiments tomorrow. If you can point out a helpful
>> example, that'd be good.
> The easiest is the fact that the workers all share an NFS mount which
> is at BASE_SHAREDDIR in config.json. See also WEBPUBLISH_DIR and
> WEBPUBLISH_URL.
Ok. We have not gone there, yet.
>
> We use this to share the reproducible build failures and to share the
> reproducible build failures/diffoscope and test results, e.g.:
> OEQA_DEBUGGING_SAVED_OUTPUT=3D${BASE_SHAREDDIR}/pub/repro-fail/
>
> or perhaps more useful is scripts/collect-results:
>
> """
> #!/bin/bash
> WORKDIR=3D$1
> DEST=3D$2
> target=3D$3
>
> RESFILE=3D$WORKDIR/tmp/log/oeqa/testresults.json
>
> if [ -e $RESFILE ]; then
>      mkdir -p $DEST/$target
>      cp $WORKDIR/tmp/log/oeqa/testresults.json  $DEST/$target/
> fi
> """
>
> would let you do something similar and DEST here is specific to a given
> build (date stamp + number). An example would be:
>
> https://autobuilder.yocto.io/pub/non-release/20210129-3/
>
> and then you could create a folder per target. You may need to
> include the worker name in the log.

We were able to follow the example and collect results in:

https://autobuilder.yocto.io/pub/non-release/20210331-18/testresults/qa-ext=
ras2/2021-03-31--20-32/

host_stats.0

host_stats.1

host_stats.2

We are renaming the files to host_stats_<step>.txt so that it would open=20
on the browser.


We were looking at generate-testresult-index.py and would like to append=20
a new column called "AB INT" and hyperlink each file in the folder where=20
"top" was triggered. Normally there should not be any links.=20
Occasionally, we should see 1 or 2 but not more unless things go really=20
bad. Do you agree this is a reasonable approach? Who do we contact about=20
testing the changes? Trevor has an internal instance running, we could=20
try it out there.


Below is the diff of the changes we plan to make for the index. We do=20
not completely understand the script yet, we are working on it.

autobuilder/yocto-autobuilder-helper$ git diff=20
./scripts/generate-testresult-index.py
diff --git a/scripts/generate-testresult-index.py=20
b/scripts/generate-testresult-index.py
index d9d577e..27fe06f 100755
--- a/scripts/generate-testresult-index.py
+++ b/scripts/generate-testresult-index.py
@@ -33,6 +33,7 @@ index_templpate =3D """
 =C2=A0=C2=A0 <th>Performance Reports</th>
 =C2=A0=C2=A0 <th>ptest Logs</th>
 =C2=A0=C2=A0 <th>Buildhistory</th>
+=C2=A0 <th>AB INT</th>
 =C2=A0</tr>
 =C2=A0</thead>
 =C2=A0<tdata>
@@ -57,6 +58,11 @@ index_templpate =3D """
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"{{bh[0]}}">{{bh[1]}}</a>
 =C2=A0=C2=A0=C2=A0 {% endfor %}
 =C2=A0=C2=A0=C2=A0 </td>
+=C2=A0=C2=A0 <td>
+=C2=A0=C2=A0 {% for abint in entry[8] %}
+=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"{{abint[0]}}">{{abint[1]}}</a>
+=C2=A0=C2=A0 {% endfor %}
+=C2=A0=C2=A0 </td>
 =C2=A0</tr>
 =C2=A0{% endfor %}
 =C2=A0</tdata>
@@ -145,6 +151,11 @@ for build in sorted(os.listdir(path), key=3Dkeygen,=20
reverse=3DTrue):
 =C2=A0=C2=A0=C2=A0=C2=A0 if os.path.exists(buildpath + "/qemuarm/buildhist=
ory.txt"):
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 buildhistory.append((reld=
ir +=20
"testresults/qemuarm/buildhistory.txt", "qemuarm"))

+=C2=A0=C2=A0=C2=A0 abint =3D []
+=C2=A0=C2=A0=C2=A0 for p in glob.glob(buildpath + "/ab-int*/host_stats*"):
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abintname =3D os.path.basename(=
os.path.dirname(p))
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abintreports.append((reldir + "=
testresults/" + abintname + "/"=20
+ os.path.basename(p), perfname.replace("buildperf-",""))) #todo
+
 =C2=A0=C2=A0=C2=A0=C2=A0 branch =3D get_build_branch(buildpath)


Regards,

Sakib, Randy

>
> Cheers,
>
> Richard
>

