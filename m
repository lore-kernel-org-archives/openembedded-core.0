Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.101])
 by mx.groups.io with SMTP id smtpd.web11.42007.1589808324439816628
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2020 06:25:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=OiMdisKd;
 spf=pass (domain: prevas.dk, ip: 40.107.20.101, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EcUFy5du0p6q8VFLgJGlPxD2dOtQdndyAaIosG8jOaE01uj8xOijPhjVMtKHPz7fU0WdMxR/fY0xSurOnxyamwgLqz+cTBLGBbuiYgxT87rdXwrKeufma09Ia3yjGicnwCy2nT9EyBJ91/pl6EWhYqDmCbIS46oQQvJrABOZ6sStASatvJYgxxXpN1FAT9ZSskTuRZ+cAayy1ULv5pCe8FGVRFNujMmF3kMek7FCH/5h9/Xv7Qn4WuL8LbHIO+bjQBb1R49GwEWgspZY8ne3bsVdUh6SPn6RmcgkUHQmGMhomzTu+BpGHxFUXQSCKG4kdv3sOUEUJwIDRbq4tgf/1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L97t2KvAu8POotncQXRUJ9pbKbz57qE9Dh4y2emBQ8E=;
 b=gWgL46rT97F0NokRQXZ7n2VhjOzniSNk8E73iGwzKxKKa7qQdY0lvy05EYOYlBXXeeCTSMW8F4iNV2/5+TAqWYaSVV35xk07/JD14Iw+qIVt5eWEyY6u4fmZVZQu3YoYIZtqjZEfjDsKipG3QpRI28PniRYQEB8xxU4quBoOLtsaBnIOmFLVTNAqKgxujmsC8/84VUVeXe0zDaR6cOwA1fwKn680QO3WOzPk6txQPc7HwMksnvNLttytYstr8zevepVflLBV0/3a6QdbByi0eFeCwJc4gTG18VYepK/ozYOxlp8G4jTKNd31QRpOc/tcBHJtPpJA5lW0+OvpAbKdDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L97t2KvAu8POotncQXRUJ9pbKbz57qE9Dh4y2emBQ8E=;
 b=OiMdisKdc5HTp0mkhtJEUOP2mFH9PQihFUzYdqxj2cSEGgWEOtmQRFoN4YXrAD+oJJw5IcL+bZPdx7g7NjCS0qc/hHbAp4FcicRvYWUMY56Hdi3wyudJSv6MYdslYXXllGivAAeA/vq/IvFD8ak7DzmGnVN3p5LLzegaWMkxtrw=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=prevas.dk;
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
 by VI1PR10MB3327.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:12e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.25; Mon, 18 May
 2020 13:25:21 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa]) by VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa%7]) with mapi id 15.20.3000.022; Mon, 18 May 2020
 13:25:21 +0000
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Subject: Re: [PATCH] glibc: move ld.so.conf back to main package
To: Andreas Oberritter <obi@opendreambox.org>
Cc: Martin Jansa <martin.jansa@gmail.com>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Khem Raj <raj.khem@gmail.com>
References: <20200518113617.31831-1-rasmus.villemoes@prevas.dk>
 <CA+chaQdZQRYMwbaAdE-TE9SNuJpwO=0Z6Qy7SR6kZxN7kpJ3qA@mail.gmail.com>
 <0397befe-9f5d-a704-be07-00926fd3fffa@prevas.dk>
 <20200518142959.57fda0cc@opendreambox.org>
Message-ID: <3c2fa255-4f8b-1f4f-df79-32fd1ac72d62@prevas.dk>
Date: Mon, 18 May 2020 15:25:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <20200518142959.57fda0cc@opendreambox.org>
X-ClientProxiedBy: BE0P281CA0035.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::22) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.116.45) by BE0P281CA0035.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:14::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend Transport; Mon, 18 May 2020 13:25:21 +0000
X-Originating-IP: [5.186.116.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27d4925c-9f37-43e8-023f-08d7fb2eea4a
X-MS-TrafficTypeDiagnostic: VI1PR10MB3327:
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB33278349ED81A62460063EEE93B80@VI1PR10MB3327.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5a+N7QOSZQNmEN2sNvl+vc9JvnCYNdX/tOzY78AY7NCa6QzAz+IQfdst6ypoPADiSrNIA5oFGdHx85rY9i1uVo4emSLf3zqoErN9y3mbteLiimjEXqw7BZaPbCZ0XGwH4kUH6pzCDawbhyMUBUP/wKNjrWNF7izYekDDIeLfdKWNfSHzkxPtmjoSLEgUb6y5fQCc25pCqwV6I8y2d36LziWyMMZUsZgrLiYOhKWGWFz2FyeXfs6lHp/8gFA9yZZ+UXOvbW+66YEu7cIk21NwBEC0K3X6beQRlT3+6kv3gc3xPSMw78P/yRRBo1UN48/mj8bL9vYzqU74bjZaPOevkmSOK8iRBJTf5wjxNoKCRf1HvhO8KucgylWMKXDmJUXnY3A0izjOyJEsPx8H+Hyx3zDlo29qY3W8ay/rKUWCEYCSeCqhkUCznmcKa/1mnx9bJHSGZh6r/PWHj+zE8QgSJPAkEPyAaPq5zPhRMJ4/f6GZbLil5yx5QICRQ0rNJRUm
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(376002)(346002)(39850400004)(366004)(136003)(396003)(5660300002)(8936002)(8676002)(186003)(16526019)(2906002)(8976002)(86362001)(66946007)(44832011)(66476007)(66556008)(2616005)(956004)(31686004)(6916009)(6486002)(31696002)(478600001)(316002)(16576012)(52116002)(54906003)(26005)(4326008)(36756003)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	l6WC9mcwGbIn2BFwXSKrKTR+Xt3c7yPkZ6rwnpxvgtEN8Aku1ElTHbKnE4aJKdYOSABiEY/zZQxpyFPQvv1rIBxnyETqA3KyLs5xl3gg74nAkCRYildsVW4qN3zxU/jY8WDHBA+JMFKY0FvjV1FTDe4K3sHNJAwirEXPSZ+7w6XAkXE32n4MxlmeOqxsN103AR78NIpLcAsL3S4309qxT5Ezc6LQdw/ufqnYMZxpxui25/zw1S9nRQXfbPNviGSi6iIpiYaHAH9EHkG0/Y7KfHv119jV9S/+J+E7FSHo6Q7JShHpOmHMwF87yT8Pca7UUAS6clMRQIBIwb7v4nhvx1RJ567/elaw5PbXCI2x2TpcFHc9URyEUpEifz/6nBKO7F/yi9yhX+k6o1gUNh8dA1+LXMiQZautWmN0lUD+fprqsIC2L2wwKTRKiwTuvPMgNTKdsOv1UwJ1B6lRM8ZfwHwPdvhJK1O4zoxQnTG3qPQ=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d4925c-9f37-43e8-023f-08d7fb2eea4a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 13:25:21.6609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9z/FUVetkwYE+ew5QFJETYlxF++vo7qiDu1XbZJ47IN8k/OLBGO7FVEek2IEAsn6PyiECTv/ZtzCPCZCUtQESNUd/nDJXS00nqbikpUj0ac=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3327
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18/05/2020 14.29, Andreas Oberritter wrote:
> Hello Rasmus,
> 
> On Mon, 18 May 2020 14:12:43 +0200
> Rasmus Villemoes <rasmus.villemoes@prevas.dk> wrote:
> 
>> I'm certainly open to other ways of solving this. But can we agree that
>> it is a bug that the ldconfig done at build-time does not take
>> /etc/ld.so.conf.d/* into account, and that that should not depend on
>> whether one has ldconfig-the-binary on target?
> 
> have you tried installing ldconfig and adding it to ROOTFS_RO_UNNEEDED? It might be an improvement to include it in ROOTFS_RO_UNNEEDED by default.

Thanks, but I don't think that will work:

        self._uninstall_unneeded()

        if self.progress_reporter:
            self.progress_reporter.next_stage()

        self._insert_feed_uris()

        self._run_ldconfig()

so if the ldconfig package (including the ld.so.conf file) is just added
to ROOTFS_RO_UNNEEDED, it will be gone by the time we get to doing the
build-time ld.so.cache generation. And I think it has to be done in this
order - if some of the packages removed by _uninstall_unneeded remove
shared libraries, one doesn't want stale entries in ld.so.cache
referring to those.

> Please consider use-cases where writable filesystems ship without ldconfig, but a user installs it from a package feed when needed.

Do you mean I should leave /etc/ld.so.conf.d/ alone? I can do that. But
I'd say that also in that case the current behaviour is buggy - if any
package in the rootfs ships with an /etc/ld.so.conf.d/ entry, that entry
should be taken into account at image build time, regardless of whether
ldconfig is there at image build time or can usefully be added later via
a package installer.

Rasmus
