Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.105])
 by mx.groups.io with SMTP id smtpd.web10.7976.1591353281055623800
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jun 2020 03:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=Rh933WVS;
 spf=pass (domain: prevas.dk, ip: 40.107.14.105, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIpTvAdrH6JmAnzDD5zcq7S3nN5G2F4qQQm4j7xGacFFGVbVAXZTa8AueEly3z5yCUL/DjxgBAQlz8ZWL1l4BVfz6hwV24FbyVsCG6cy10ZphU9T235UuS5c8y2KtaO2QxgtxpyYRqEf+zkhYXrOpvNw77u+K8tyY40Bgoll5wkEKMJf8YKtWbO2S1QPz1xyr3y3yHpINpf7Ds8lu2xbPerY/F3SOIGlCZUyv6e8FN6ZP2LcHcf5wokBwx4NLTl0jqUuHSiBR9OGt1j6hcJkAYnYmPec0d7vkLc2utHWDWGWXpef6tcjLQ5/0qEGSYyPsXaR8+ZwBEMURdtFQ2Cphw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4/FOKYb7wqCmmfbv/ZpcBSKbDCLJZnx097D1aYooDE=;
 b=NV2vVCKKCMW1MMQG7W5a78cXusXBk/2f1+bJJd042L171KGA95mAHhIuNwIL4C2ViU33agMjpHmAClzr5X0a+62yPHhiKNJp2pRzT6IpQLF8nxa8xWq/skouiG2j0loMNSVRH+gSsFgECkCJbCRwi73/4EwKAgIN5ULfq0Ha9K2Hb9LGdQ5XMDIcZ2l394AXSzxv9l+RR1oWUPjaHyxweLwwUN6G9EbPkIFNNgWiFNiajjRr0BB8rpoe4bMOIdClikWlTqrKI1N9NjiZ8cKTFVzze4kSBP27ZVmrfW60TL6LMy+F3JsfH5GN6PgHvZIdGQgJTxfa3NF8dIfksg5Fjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L4/FOKYb7wqCmmfbv/ZpcBSKbDCLJZnx097D1aYooDE=;
 b=Rh933WVSBnVtDk6oaD35lHsqnEad/mz/SxasPwBasCtJQWhH4IevhdENKUvJsJ9UekE0RIT7aT8tOYtU8E1WqMJx+A5VKCPlL0v8MLwvSAVF2W/VlinqXzE0ESZ6sq0iH7xtyTfYDDFixUkYyUFfUvUeeGjTjWBzpwXatANMXxg=
Authentication-Results: opendreambox.org; dkim=none (message not signed)
 header.d=none;opendreambox.org; dmarc=none action=none header.from=prevas.dk;
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:e1::21)
 by VI1PR10MB3984.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:13d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Fri, 5 Jun
 2020 10:34:38 +0000
Received: from VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa]) by VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f0ac:4e97:2536:faa%7]) with mapi id 15.20.3066.018; Fri, 5 Jun 2020
 10:34:38 +0000
Subject: Re: [OE-core] [PATCH v3] glibc: move ld.so.conf back to main package
To: Andre McCurdy <armccurdy@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Phil Blundell <pb@pbcl.net>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>,
 Martin Jansa <martin.jansa@gmail.com>, Khem Raj <raj.khem@gmail.com>,
 Andreas Oberritter <obi@opendreambox.org>
References: <1614B0E5E96C4272.14405@lists.openembedded.org>
 <20200602121722.32623-1-rasmus.villemoes@prevas.dk>
 <20200602200008.GB2207@pbcl.net>
 <24a52dc42bb9eb49e2f8802a3c7558859160de18.camel@linuxfoundation.org>
 <20200602211524.GC2207@pbcl.net>
 <CAJ86T=X0Jd+_K8xG6G9LB2FfSo51dQ2rL1sa1f_zo2+r8fh0XQ@mail.gmail.com>
 <9ecda083-eae5-428d-42d3-57cbe564ea9a@prevas.dk>
 <CAJ86T=U-V5p-va-MJf=4V3uVhEM+DmVRqU8DJ2=wVzJKfATDpA@mail.gmail.com>
 <5da0a98a98d9b1194ca13315f9986c20b9e5d565.camel@linuxfoundation.org>
 <CAJ86T=Xu+mjNER1D=R4110uN-8oK-s3xk6ij1hChESNVY2U2Dw@mail.gmail.com>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <d48f4fd3-9786-8fa5-7609-4fc337dd3df3@prevas.dk>
Date: Fri, 5 Jun 2020 12:34:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
In-Reply-To: <CAJ86T=Xu+mjNER1D=R4110uN-8oK-s3xk6ij1hChESNVY2U2Dw@mail.gmail.com>
X-ClientProxiedBy: AM6PR10CA0036.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:89::49) To VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:e1::21)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (5.186.116.45) by AM6PR10CA0036.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18 via Frontend Transport; Fri, 5 Jun 2020 10:34:37 +0000
X-Originating-IP: [5.186.116.45]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 341a18c0-32a5-4db4-848b-08d8093c0c6f
X-MS-TrafficTypeDiagnostic: VI1PR10MB3984:
X-Microsoft-Antispam-PRVS: 
	<VI1PR10MB3984FB05E6512D15F3CC646F93860@VI1PR10MB3984.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-Forefront-PRVS: 0425A67DEF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YNvDEr1CfrBsMk96Ho8Q6rifuQw5kYF/ZtgMO59keJEes30E+1IXmwlibVkeU2lNGyHPhOjYaW/dnCsNbnq5m9IwyGgcBuaMzIPYWdWOwKP+2uOZm2yXcn5l4JS8ixXAw4QDle/ARuLVaATrEHu/fl3Qg4wXvhc5HF0gayktWGnFbyEqy4Om3shL9vJBe4fdw28S5fW3s9sKDzQb6tcsxxLHDVtN3N6vSeycLgvy8lPh65FOCNFI4U+JC+k7tqJQwNekDPDHfRpkhglQk/FDpVWe3vBkvsM5CddPXmA/dpiRhl1fb4RNF/s5JEsOz7Ri5Nwc7r6j4VOngmvXU17BnGQ3Ok8qxk5bOJdzEACmjw6u+V0ZaKecEZ8Wk7hwqQrK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR10MB2765.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFTY:;SFS:(376002)(136003)(366004)(39850400004)(396003)(346002)(2906002)(8936002)(478600001)(31696002)(4326008)(44832011)(956004)(31686004)(86362001)(2616005)(16526019)(66476007)(110136005)(52116002)(6486002)(36756003)(26005)(8676002)(4744005)(8976002)(316002)(186003)(66946007)(54906003)(16576012)(66556008)(5660300002)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: 
	RccQglvp9Sp2WIu7n1qKdJWahr6AZK2FCw1ynSsP6nhldujnavIPdeV2TkgkcxRRKuzJtbaiMq8UeoxeWYhhuaCvz4j6tDuZh/9nMVnxLcdHAV172mu2tZUAxj+f4xRJKEmhOScHAhVgEXJdnLz8skp08F5K4nq0+M2Vxmq4LbgYpX/biaUHHOhd1pssqCCwVIfcqQrzXovIvXGtYxuJeTkoUgsC2AD1CGqqoX3CDGmzeEVs6aEggU1gzZb3fHbGi9Hk+B0F9Qr38StIOa+JOtYv+0xX/rhELJzXQRgChXOypVThIR141zRr529T3JF0LaV1/tgl/yf3d3c6CC6T4t5F+YgP2O2vlo1MtPGHAnrSBb7aKO8p5Sl1tUbm3d5CdVLcC8kBWn/xIogF4tQL6LxclP1ln0PYhEzmd5Ka7WL8ex/VPInXQjpaPWuh4578ott3ootGxT5o4wseK2eRKbt0VeTTf28rlC0IXjFNBng=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 341a18c0-32a5-4db4-848b-08d8093c0c6f
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2020 10:34:38.6946
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqQzdfDbTCPSpYIqQsljgQig69vuEfttYN5mKNKjutGakGA/VDBTT8m/NOcu/7TU2aKfLwzhMZQ6Y+Cic93vFa1fE/bhFuo60JYtiGH2Pfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3984
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/06/2020 22.05, Andre McCurdy wrote:

> but I can try to summarise the details related to the actual patch...

[snip]

> There's a genuine bug and I don't see an obviously better fix, so I
> think the patch should be merged.

Thank you for that summary, that's much better than what I could have
written, and also thanks for the conclusion.

Rasmus
