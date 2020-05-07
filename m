Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.73])
 by mx.groups.io with SMTP id smtpd.web11.330.1588826152951247540
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 21:35:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=gbdJ+yxx;
 spf=pass (domain: windriver.com, ip: 40.107.243.73, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CajKB249dot0Ws3k1dVD3IHKk6nDghmuOojunBuBz04UTTKAfznntRRIKANYAiumSeSsP4X3BnOOk+gsBOYWORo6tz4ueLMXnSAzvFGujxZ3purMFv550wcJJl+rOkgXV3ua6kvODHgZbuUb/Ia9KliQJ9TJH2Q2eBFOHrGHsh02MgPprM86lnkQG3YAp499kWszSBxFk7uQEiFigNuw6oDjj4lzLxuffMR/CkBnT6yEkUPBXl+gK/Rk+a6cFyKchx8x/KSXcWkuN4eO8REoR7ApmT/8g/DH7JNlaQlUx1rot+7k9SPV9WhF5hdpswcazXTkqr5MFy+RKF0RHXrkLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3zLYH4xKxcPrHOD18z9YfpQcnk/GaJedfustWU5uGs=;
 b=i9iBkJ2QG+ZJmwB3A7sb4Eowf4o7L+SWe0wVO5bYDuuPTPF8RkrzDbpFAbhh8SDckR8nigd95eFeDA6epHiOoWq+oWmnF42dz3G7aTG2qXTCJQTtoSC74Jr/9HjbT9SOd2+Y2bW7yPXFj4l6L9zfjuhgdYIj52PkXRZwu4JglrzVoghe8AdVfquGJI2qp/cIPdkq0eFzOAX6WnMD/5MCw5S7oomu7Nr5XqKRr/eaesL1g+DW4zrApEa0tVE8yFcSf+wymJAoft7ESVbVMdMErtlXGxWqbuvjzmj3FDayNFYhwY7kS0DytGMj9lB/m5nf8aLaLbKAA6DsdS2UVY4e8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3zLYH4xKxcPrHOD18z9YfpQcnk/GaJedfustWU5uGs=;
 b=gbdJ+yxxvlwBX6e3+8En8XFMvSWVruALce6pmw2FC6NepO8t/eodyMw6K9DF2fZBdoqBvzgbAsEDI/Y/AZ9AqqagKuCw1hFxBTK15+RK1RKywi9mP6xc0DInyqC+w5k8uFte8OJ8ZzG9Rk9P/Eqelpja/iMpinMRjl6/9tuDpEk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3589.namprd11.prod.outlook.com (2603:10b6:a03:b3::22)
 by BYAPR11MB2709.namprd11.prod.outlook.com (2603:10b6:a02:be::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19; Thu, 7 May
 2020 04:35:51 +0000
Received: from BYAPR11MB3589.namprd11.prod.outlook.com
 ([fe80::d58f:306c:6ca5:221c]) by BYAPR11MB3589.namprd11.prod.outlook.com
 ([fe80::d58f:306c:6ca5:221c%4]) with mapi id 15.20.2958.030; Thu, 7 May 2020
 04:35:51 +0000
To: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Yi Zhao <yi.zhao@windriver.com>,
 ChenQi <Qi.Chen@windriver.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Subject: [JUNK] [Please ignore] test mailing list
Message-ID: <bb27b92c-e4d5-282e-352b-80329f37bce7@windriver.com>
Date: Thu, 7 May 2020 12:37:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0184.apcprd02.prod.outlook.com
 (2603:1096:201:21::20) To BYAPR11MB3589.namprd11.prod.outlook.com
 (2603:10b6:a03:b3::22)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38f02da1-02c7-418c-f85a-08d7f2401eee
X-MS-TrafficTypeDiagnostic: BYAPR11MB2709:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB2709D4DBBC92B7B5C1984F15EDA50@BYAPR11MB2709.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Th3HNF1NgOyyzAV3OTNTlpkLy1vE0OxlWVAYAGdjxGbKBoABbZMM2WZI/oPOWd4CN399PX0R3qVN2+Z3Zr7IY0RIYSclwcrFKdpo4vXaBdOKHnua9/eZF3mO8zDQGL5tyumwG1NcSUmgMyO332UkyqcFa+0XlrBn0PRxsADXUzvh8cSv6kW6Xmwwqj/MExIHscw+guKNns70i8jjRpDahHWokkNz+Upb5SaWFK3e2t4fcXqCyslbytBJw2/iuuBItIKxWqmGRjKy4Tg9kV4zEaaTimOuoc/TZ3nuhiLjiVYeFQEw3fuldW0omoGrTtZqvrLS/q8XjNeVNgJgOiBKA0xNiqPdPgUVtjzykQXKVtjRf9OQlV/SOnRNu3KWGS3kuqRA8MKlk6j0yKjpeWEB5CSjqaoM/lf/CySne+hnoKbBbuk8RAjpixwfaGf52bqxbHaLudyNctCMrmJzVih2HlyNogJdXbnZWi9lvn0iJCaHXl+nXOt7zTcmnAiazRMkJ7PyjXA7UTuIdJYMWLg/ZFpoGOu1FtUdDwS44tsfk8TS49bh4Lyjnr8+mqT0vLfu6A3yqnWJ0pqB3vHuAmU9lw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3589.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(39850400004)(376002)(136003)(366004)(396003)(346002)(33430700001)(66556008)(66476007)(52116002)(558084003)(31686004)(66946007)(478600001)(31696002)(6506007)(8936002)(110136005)(186003)(8676002)(19618925003)(2616005)(316002)(86362001)(36756003)(26005)(6486002)(33440700001)(6512007)(2906002)(83300400001)(83320400001)(83280400001)(83290400001)(83310400001)(223123001)(130980200001)(43740500002)(558944008)(19559445001)(15288005002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	98jvdtL7V7hrFGvAO9t6zAveMFUSKLzxQb5ujye6bp7roG6AN3FhZNqD5ECvrJ72o6z2gb8H618Pgpifm3trqKORDypyj8YB0r+TLTE4epMTSiwKN+be+uA7hENfT5GU19tacKNSEbnOymFO65tyi7DY4g5BOXEXDwplyueRuliQPb98IJ5ejkGe5M14V1/iT47Gt+OZU1YocM2RpO4u7niL+eJA1TwzR9lsDjO0WaMrsjQV7wlIbnWP8sbbKv+O5SEFzgZtAQj0OAVtHn+oLnqE0PE7MZ+mycxT5UTYbEV6/NPReVR444LEATHRxHzbUbDAya2Gm2h0atlpMGY9OF1BvFDRGINVxHEPnJzMGBlAliOFwLd9mFtadekZVuviCIU2EbH/jkFPsbtB+bF7fNlFIflf67tOE2SnGlogzId+3LaOSHMxEtrG0LjNkDNt6ShTgqK5JKR+8Gtk2CGzlklKJa1FSuzT2JgsBkjUK6yt0d07GRWG6yNzptbgLluFA7w8GcfOZAuKwQtDTfebgGHKVAIJHVDOXokOHiB8QEv8tl85UKfXbBbbSLv6l5IDWsjhpI8A1l2PrzE9dirsav75OHa+Y4F+xS1Vty2adR4bhukPuSJ9e0+Xn8BelhC9pfhTDKtzTYvOJgz6oklYebti8D1ReCyur0fxM+NelVhb+PpuUTLoD/Oe4/oTAe10q6aZ0JL8MdBjJ/BQ5Zq3x5SbLCa2hZ1Z8fafrUjb4gWauCOxVhQVZVPduSw5UrDxg+Y/iBjDdEVmra7U1p3mpZtqvLxs4Glx4PUQtNN8/aY=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38f02da1-02c7-418c-f85a-08d7f2401eee
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 04:35:51.1158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xSCzPr19iMVmIuYxh199qQohkoSFR9ZSPJsXWSw3E3auXcYbc42jozQ5X0ZREOXRCIBgOxtQRzX6E9tEsqU57A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2709
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

test

