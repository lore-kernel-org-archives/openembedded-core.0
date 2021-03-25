Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.71])
 by mx.groups.io with SMTP id smtpd.web10.4578.1616710289514780259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 15:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=SQppeTBL;
 spf=pass (domain: windriver.com, ip: 40.107.243.71, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=neeSnFrGc4IfTZ/RBQ+WbHVwBTjPolhtpGLbV/Tze8zaqcaWVxNT9gYr4QjwmJn4FxTXHYsjQalik2v/SUKF9gyqLczzEvI4yXMIQjfy4Vd2rxu8cUfr1jQM7QTgj+b0Ii23qqlEvPiM6XQDZYfTod8jP8dm6Y7Qs/cvyiBLdzpb+W/vYNSX6+hmcNg9wXomqLIPFQUYIYx95tHEAg3qkhVmhJxhMKMoks0eCX8QedB6xw/vITxu1Q9E/HqKkZ1YZYhWIsurkQcsajAA9zAffzqQ3+X8z5YLrLrIJzWsWZRYs+d0AsANZWDAmKC91fnYfyjpZRlUYRiih9AgWyv5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clWZccTuV8mG9YHBNCiT/nBoxtDMZA26mzpgSHC0Oc0=;
 b=k//aw7uFydFGs890i4I+JAPwd54vz76bjtM80+r9uQQhM0D8YOv4JN/lfCWWUa0tRYutvMj1ujEsHFqPispPyTjbPDMMXT+e/M5gu6RB1X8jSXLDWJV8hfJy7s6aq1gdzfZuLvl8pjtQnLSv5UCEX00eCzi1b93RFjYemKlJRiNDlGJP8q4z5lF4hS1CDQdOZ4Uu95QTyy0sx8CGhu/nlDryysF8bxQ1wmR332Qip63rwS9pksSQWLasFgA8xgIHfSvEdpKAVpuDi+oiBqcLuxzxVrA8amZn0eDkDVDUfdR23kqEgNiWq632Gg21+K0HIwjC1Hyxsv7CoXD1v4iqwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=clWZccTuV8mG9YHBNCiT/nBoxtDMZA26mzpgSHC0Oc0=;
 b=SQppeTBLSaxr4T4koPOt1DWgnE7VAtSZetT6mQ2EEHK6yOj6lzPCXZiCexkLESH6d5sbHVTbqMEt60YHphqFIUWAIp66KUkky4IU9asbo6EyebwHGgG9plVzyctNejTBS+3cr5rsCrB9SVEubYNg8e2U/LEO9C7Wo2pQnm01yfM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB3802.namprd11.prod.outlook.com (2603:10b6:5:143::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25; Thu, 25 Mar 2021 22:11:27 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::25ca:eb0e:8908:9fa7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::25ca:eb0e:8908:9fa7%7]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 22:11:27 +0000
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: Randy MacLeod <randy.macleod@windriver.com>,
 Trevor Gamblin <trevor.gamblin@windriver.com>,
 Steve Sakoman <steve@sakoman.com>,
 OE-core <openembedded-core@lists.openembedded.org>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Subject: Autobuilder data collection for intermittent bugs
Message-ID: <768fd8d6-09bb-3e87-fd37-267ac9352866@windriver.com>
Date: Thu, 25 Mar 2021 18:11:23 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
X-Originating-IP: [184.147.76.169]
X-ClientProxiedBy: BLAPR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:208:32a::15) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (184.147.76.169) by BLAPR03CA0100.namprd03.prod.outlook.com (2603:10b6:208:32a::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29 via Frontend Transport; Thu, 25 Mar 2021 22:11:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72134e6e-50e5-4016-a8c6-08d8efdaef3d
X-MS-TrafficTypeDiagnostic: DM6PR11MB3802:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB38025684C7E3206EF18C995BF2629@DM6PR11MB3802.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tq2Di4X/xUs9jtzJuI/6cCK7georCAHk1Efxnrs846IVUWuGRSDtljVVxjj46Od2HRFJMsCFMSV4qSyQqYQVCaNKYoBGRyCkbtU3xMYyln8noJyUK5CPANLJ+cNPzLEChTJPPykvPZMqyGqC7jcWlHeSpPOl4WZz8z0ML10RwiVvrqrkwQ2aByzWICsNj+xZqi2UdVqJX68NhD/CmB9J0WkMU51G6IRKCiWkcZcZxYCXyIBXyOWArGmU3D+SKA1D48zib6AVNwGG4SPMqUxEg5EWJpNWPs4UnCkJvAsgFsdMZaIn+enxoZL7WtRUe2Kwa1JugFbzp0EJoxVmZn8BXdkfsTyaxYRxlM50BQJEZlkFGRBi7O9iovwrEsXcLjLDw9LNN6qwecKfZk3r5gSTysqzZJax9lqNteJmF1qs+DKhU1Fubkwh/u0u5oTZr58gC1Qxw7rZgL6yDb11rVDMMTZbQ7Ew4sIHRR1C5b1ISzPLkJ9o72HuwCSV6w2qNwBuvvhG1qURMhqWnzQR4iLIJLOfdD3PZzC6febMDUTWgXmkXqv4ya2J992pAIaaHuCkGgEfyyvIa+CC9YsAS4zDXoJ1rOetO9Br0sr+xwUyC6Ub5VPZDSMxFwvB4SlNVc0eOL/3yY4KMpCSQ3zMZANMiS9l8nldEJy5/wb0IzB07u9c7mZpSyRdfgjFQpOc5GYlakCsBvxVNlVUb3XiYEyxig==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(376002)(136003)(39850400004)(346002)(66946007)(52116002)(26005)(44832011)(16526019)(186003)(4326008)(38100700001)(31686004)(956004)(31696002)(6486002)(8936002)(66556008)(316002)(2616005)(2906002)(6666004)(66476007)(54906003)(8676002)(5660300002)(86362001)(36756003)(6916009)(478600001)(83380400001)(16576012)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?5yxxUWUEqXAgO/hOouKWqMTTRF+HWeqmuSOJZmZpiPgaOziEWmF+qXcXaYHf?=
 =?us-ascii?Q?VaE5EqjAE4v2wFrbMyJdJeiTV/WlUxbq+q1FMCjeGoIOTNqHca8258AYFNri?=
 =?us-ascii?Q?5oi7/TXkzIz2yhYWKsvM26cux8/7aRbxnEYXkSGdVIH0nWgDQhDN+SJxcjCx?=
 =?us-ascii?Q?NSmXdvWQMgE1FZDgAHb/I83UBYoa/7Dh1Klr3agz9fjRW1nz2cz6QikOMICu?=
 =?us-ascii?Q?VSHYxrGVbqrrLe8ye7BzgRAGdXJJ8+uJ+x6XCYISNKjwG/iteKC1wtPsEY2Z?=
 =?us-ascii?Q?xfvOCufgRkKjNUBqHWf/sSLlAka+AGdJbC1uYlGnpiESlkMTu4O5XEOVCivk?=
 =?us-ascii?Q?OfIjwZPmTlWuCW8AwjyKO8m21eCrxU3DcUGhWAPNgp9lFDrLIfG+B+ql0w/C?=
 =?us-ascii?Q?nFx2PtdvPNqLwrtbCV1jiOKHyvzLX5JGceWL/h9Lae899zyBWCuf97h45o0g?=
 =?us-ascii?Q?+nocwFFuXu9Wxiu7HhgxCBtC/i9AcSGc444puItmcl6u7VaEprD/r6gczaAU?=
 =?us-ascii?Q?UPWW01EFlMktHlA4qBObEM7SssiYXhxrB022JtdvxMdK4FNhVN8qYFtwSE0b?=
 =?us-ascii?Q?08S6lK5yF9TFgDrhY+ncWgPrAe4SMhTQ+i0AdJMFFCBdxcYC25WkHn9PyA/B?=
 =?us-ascii?Q?W0cgybSm8lbLoo74DbqisIrmQSZmvcWSl1xWeXYsyrw7djpvtCjwh6GC2YD+?=
 =?us-ascii?Q?rmIp5FbjGcfxDYGR3WJZYq9T7RBDXEjL6h2V3pBr0rnSlyWQ+rd49IdcHyCc?=
 =?us-ascii?Q?yzKzLWCoLnjmLxS3FL3MWMKkSvH7y8H0FOAcwpFeZfLNhUfOiThQxZ8AYgTV?=
 =?us-ascii?Q?2lMUaD7RB5cSxxEYm+6hbivauiI3XnHWChyOGDEd21YaA62F4Dr4I/cje1AR?=
 =?us-ascii?Q?MdHpmlGgP11RvG5bW1bJQj9yaKq4H/3njA351mFHVVZDzTgnbxdQA2KaF6ox?=
 =?us-ascii?Q?8pZ9eUcW2ZCuaTwZFmsVfkn4+4Df8t3cELw6ovRlxM0p5jEcGUkoJuWXlZRD?=
 =?us-ascii?Q?28t5w46qMwWB5fJAv3BWnZECkaotRd/6D1HYeYiTmrDcwyGxabw9lR14yqus?=
 =?us-ascii?Q?xb3whTisqPlGURf75Mrg3opGT4bPTiSr5mQ5EMpbt0pEQUs3yGwaRKvbVuOy?=
 =?us-ascii?Q?VPPsqTQbP6xtThtea5qMvCUUIRQFj/L8nrGrVACDqEqE/ZFftLUAC266Na2X?=
 =?us-ascii?Q?s6EzSJZRNsU2RxTsIj5T5RROK2PmUPS/nl4rDhbNk3zlCxG2BG7bXIn5kqWL?=
 =?us-ascii?Q?BpypaMFZ4sHMcsrKELIAHf329zOIG8pHF1gyKwSseIdhZv9sGPhBvT63uYWr?=
 =?us-ascii?Q?MQ7Vz/HmtHWU8co9dv8DWRdK?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72134e6e-50e5-4016-a8c6-08d8efdaef3d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 22:11:27.0628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /A87AFGPpqtrSqKPmjhZT45uB7MHc5Nlnzydj5aO4xcA/82X44ZuaHCJNlYVOpc9ng9Yod4AJHf2sugaL5at2ztYlFRrd2VJHMrc/Mbj2Ns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3802
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US

Hi Richard,

I have been trying, with help from Randy, Trevor and Steve, to run some=20
experiments on an internal autobuilder instance to collect host data=20
during builds for signs of io latency.

Initially i modified yocto-autobuilder-helper/config.json and added the=20
following 3 lines to existing templates (and created a commit) that were=20
being used so that the builds would start collecting the data.


+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "BB_HEARTBEAT_EVENT =3D '5'",
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "BB_LOG_HOST_STAT_ON_INTERVAL =3D '1'",
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "BB_LOG_HOST_STAT_CMDS =3D 'pwd; ls'"

I also created a template in yocto-autobuilder-helper/config.json

+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "data-collect" : {
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BUILDI=
NFO" : true,
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "BBTARG=
ETS" : "core-image-minimal",
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "extrav=
ars" : [
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "BB_HEARTBEAT_EVENT =3D '5'",
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "BB_LOG_HOST_STAT_ON_INTERVAL =3D '1'",
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 "BB_LOG_HOST_STAT_CMDS =3D 'pwd; ls'"
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ]
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },

and modified a builder to use the template:

 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 "beaglebone-alt" : {
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "MACHIN=
E" : "beaglebone-yocto",
-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "TEMPLA=
TE" : "altcfg-hw"
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "MACHIN=
E" : "qemux86-64",
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "TEMPLA=
TE" : "data-collect"
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 },

Restarted both the controller and the worker, and started the=20
beaglebone-alt build. Once the build started, i checked the conf file in=20
the build directory but those lines were not appended to the local.conf=20
file and hence no log files.

In summary, I have been trying to get the 3 lines from the "extravars"=20
above to appear in one of the local.conf files. However none of the=20
builds seems to have been altered.

I am wondering if the changes that I've made are even being picked up by=20
the controller. Am I missing something?

Is there an easier way to update the conf files?

Initially I'd like collect data on a single node and scale it to all the=20
nodes. Any ideas/suggestions are welcome!


Sincerely,

Sakib Sajal

