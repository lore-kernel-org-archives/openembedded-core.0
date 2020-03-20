Return-Path: <mike.looijmans@topicproducts.com>
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
	(mail-vi1eur05on2069.outbound.protection.outlook.com [40.107.21.69])
	by mail.openembedded.org (Postfix) with ESMTP id 9DCD56101C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 14:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pkOSpRvP5b/a2uWk6ewEqVleAnBeDHAi99F/zvO/Wa4=;
	b=qcSPBDywpzZ1Dv50bqKC0o2YuNIiWHuotOk2FHA/dYcGthhge1J/VSTpoIqJEnuFXxi/lFsoiZ3YVsPofEWVf1Dt2Gk9xBP6t4ccLFGpe1fPQ3H0XosYRoNz7Bv+ved/FRx+zp2IQZOIC7Iwy1JOiLcE9kwqmS7n08xXAlGUctM=
Received: from DB6PR07CA0166.eurprd07.prod.outlook.com (2603:10a6:6:43::20) by
	AM0PR04MB4180.eurprd04.prod.outlook.com (2603:10a6:208:5d::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2835.18; Fri, 20 Mar 2020 14:48:08 +0000
Received: from DB5EUR01FT031.eop-EUR01.prod.protection.outlook.com
	(2603:10a6:6:43:cafe::a4) by DB6PR07CA0166.outlook.office365.com
	(2603:10a6:6:43::20) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.9 via
	Frontend Transport; Fri, 20 Mar 2020 14:48:08 +0000
Authentication-Results: spf=pass (sender IP is 13.81.10.179)
	smtp.mailfrom=topicproducts.com; lists.openembedded.org;
	dkim=fail (signature
	did not verify) header.d=topicbv.onmicrosoft.com; lists.openembedded.org;
	dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
	designates 13.81.10.179 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=13.81.10.179; helo=westeu13-emailsignatures-cloud.codetwo.com;
Received: from westeu13-emailsignatures-cloud.codetwo.com (13.81.10.179) by
	DB5EUR01FT031.mail.protection.outlook.com (10.152.4.253) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2814.14 via Frontend Transport; Fri, 20 Mar 2020 14:48:06 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (104.47.12.54) by
	westeu13-emailsignatures-cloud.codetwo.com with CodeTwo SMTP
	Server (TLS12) via SMTP; Fri, 20 Mar 2020 14:48:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=n2ZcmLN8ridUKm7EYMRtTOvJZTAMbl79GRFoCCvIon/UGi+MNt0BWpapudy9bWjqwnSRZ9SwKKPcTd6EG22zu9hdjw2452OMeZWXolYqIsVMS+LwMu+od1phejaf0c2toLEITTFKC5MQ464lJQmzg3Y53sXVAEPEa77r9ElEgKiBJ+Z+C7F4tr/JGj/Fqti4YBfGtpnXIBre8VqdEodyvd4coWVLTsHQI2SSDVRpxrYYCfT6WX9CzQ+l9wWm4qCH365PAnL65MRS9JMNuWUmbgS9QVM6M+g4veJJct0t5wuRQVL1u7BTLgFGw/cj2bEY1gwNTHAZVvaH83PnPVdylA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pkOSpRvP5b/a2uWk6ewEqVleAnBeDHAi99F/zvO/Wa4=;
	b=NT7vBPYAeK3OfHpTQS3Ue9nRWRiuPP5EoPMqlsiA94vjLMvwe2iJjgWOE9OpX7OHIcU15mp9b5kkwGY1ua73PpsoBGbT27ccWEMCV3Oy+BlSLqMVs/o2YUXViSyD+3rMtoaecWQpVP/kmFgq0hFwYiCRDIfni3CNW/SwmEb6txApNk6L/xJXjlhtJqAt3faYPNUQSlWx2eq8nminmIgOL2AUqWffoPhnmnfS+DXb3+FwLuq0791RhaEBb3xjGGNuzNpwMFatL2jhVFS3aFH+zqm61NgtJ+ivVyDJ8qifUwrXbv9mlu90akTm7bA64QAF8E8nGiUIWKQ28gNina0NFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=topicproducts.com;
	dmarc=pass action=none header.from=topic.nl; 
	dkim=pass header.d=topic.nl; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector2-topicbv-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=pkOSpRvP5b/a2uWk6ewEqVleAnBeDHAi99F/zvO/Wa4=;
	b=uMu9MSiY/k/CbhtDxCefcppJQqPZj42DOEaTNNuNgKBPfjls8EmiMUvB0ILqP4qG8Y9VyBpmGZ9HYO2c+IeOc/9ax3K4tV4AbP4edp1eN29ZO/Lna8ENLjox0N2MYzXzuQZZ1eRLPtioiB0B2LFbnv45gswfSP8FVuDY6QJYN/M=
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
Received: from DB3PR0402MB3947.eurprd04.prod.outlook.com (52.134.67.147) by
	DB3PR0402MB3787.eurprd04.prod.outlook.com (52.134.73.25) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2814.21; Fri, 20 Mar 2020 14:48:02 +0000
Received: from DB3PR0402MB3947.eurprd04.prod.outlook.com
	([fe80::380e:f722:2d0d:9c71]) by
	DB3PR0402MB3947.eurprd04.prod.outlook.com
	([fe80::380e:f722:2d0d:9c71%6]) with mapi id 15.20.2835.017;
	Fri, 20 Mar 2020 14:48:02 +0000
To: Adrian Bunk <bunk@stusta.de>
References: <20200318122156.23599-1-mike.looijmans@topic.nl>
	<20200319113736.GA28081@localhost>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <aa4de5d3-3f2e-6f18-21bb-bc47b62dddfe@topic.nl>
Date: Fri, 20 Mar 2020 15:48:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
In-Reply-To: <20200319113736.GA28081@localhost>
X-ClientProxiedBy: AM3PR07CA0067.eurprd07.prod.outlook.com
	(2603:10a6:207:4::25) To DB3PR0402MB3947.eurprd04.prod.outlook.com
	(2603:10a6:8:7::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.130] (83.128.90.119) by
	AM3PR07CA0067.eurprd07.prod.outlook.com (2603:10a6:207:4::25)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2835.12
	via Frontend Transport; Fri, 20 Mar 2020 14:48:01 +0000
X-Originating-IP: [83.128.90.119]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e206bfb-067c-4844-2f2c-08d7ccddb344
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3787:|AM0PR04MB4180:
X-Microsoft-Antispam-PRVS: <AM0PR04MB41804D617BC5E39BF9E6869F96F50@AM0PR04MB4180.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-Forefront-PRVS: 03484C0ABF
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(346002)(39840400004)(396003)(376002)(366004)(136003)(199004)(31696002)(6916009)(81156014)(81166006)(8936002)(16576012)(44832011)(8676002)(186003)(16526019)(2906002)(26005)(316002)(53546011)(66946007)(42882007)(5660300002)(66476007)(36756003)(4326008)(2616005)(31686004)(66556008)(956004)(508600001)(52116002)(6486002)(36916002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB3PR0402MB3787;
	H:DB3PR0402MB3947.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; 
Received-SPF: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: EU/IwO7B2sFU3sVgnUkkdW5K5iq5YgLAjJ7WZMS+mC1l5Vrh0dF+XNLTeKk6Gkn14PmY4UPb195bBvRnljJtGGp9wwO2eizM3QZYtfZvQqS9SzmJpy3wXmlBv3qjLRAuEs42JXFs6tdmcHx7eIdjW4vG+C4HKbzwlAbayQY3ihD4+8ozhfhdv5MQOKpyp8hcHmq8sJNiWmU+KjBb8Rt7YPIIV6j2K6q9uoq7lHPwBbuBsuSiARwAJeQE8zLJ00h4xSVCrr53LUrjHR8zcd2CUH1jQvLm8b/wYqFcdsbScd1voxL8Mq4YjlmX5nSD6Z0cs9fjXs2P42b4VOOC+lXPZCdpaxz33WDH6YqeUUnSk9gJjtjJabtrQH6KLzv4ofN16ZVgdHygk708jzAZ56EEccsWbgxbOg/KQaNgsu3pq87nqm7wzKrLQWXrIaljnb5a
X-MS-Exchange-AntiSpam-MessageData: 8i5b7IxH7nozGvkwVWQLEglnmgr51ie/JgGqqL3ycyxiuUX1wiGsc3JXUZ7OeGwu4ym+ULe0A6jDtcdxFpWMRm0bqRS3DwUILB/KfSWiWxrpgi+HPgfuVw0DJoMnWz/yl8V2S4N12pClsVdaqEkctw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3787
X-CodeTwo-MessageID: fbbb223e-f857-424a-9487-8146f46b5fae.20200320144804@westeu13-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR01FT031.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:13.81.10.179; IPV:; CTRY:NL; EFV:NLI; SFV:NSPM;
	SFS:(10009020)(136003)(39840400004)(376002)(396003)(346002)(199004)(46966005)(36756003)(336012)(7636002)(7596002)(5660300002)(2616005)(6916009)(956004)(42882007)(6486002)(47076004)(186003)(356004)(16526019)(26005)(36916002)(8676002)(44832011)(70206006)(246002)(82310400001)(31686004)(53546011)(2906002)(508600001)(4326008)(31696002)(316002)(70586007)(8936002)(16576012);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR04MB4180;
	H:westeu13-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass;
	LANG:en; PTR:westeu13-emailsignatures-cloud.codetwo.com; A:1; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2be19843-5c9e-4c55-1c20-08d7ccddb092
X-Forefront-PRVS: 03484C0ABF
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X+1aAKgQqhyoaKxS2T2IM9sZY3LNfB3M2tMpDFULNBY2t++dXmZ4gpXHsOz2I1KzHE/pFoWbE4brefERocaO8WVlqboXZ1o85qsy85R26pZ+IutDWDADNNVdZXzaYtzH/p7kgdIQAHWjBxPM6sN+C/5ortEN2kCntzWk5aB2nL0FgAXD1JADudP5O6Es+W7Ge7bg+pogEDgdxwR7XDpt7eimiW3DH+OrnwKQqfFKzx1IroKidkfMuQE4q3BRHijc8LGpj0dUQ61fzr0cpxZFyF3/L+kiBKK4fil9Y7mKBkpuCydipdHFNi9+24UwqZ7ZuMGZrycp7UjA0tBqdgLKNfnNtcL59XfdFFYpySEkZQSOMSCeOkzf/kIhgxP0tqt29uqYWDoEtQ6Tbf9Q7KIPwT6isn/dc8oeXei7ATTfZxMhwVV9RWdgRU+JpJ49DbTaRJy/aRApm3y5WFZ0u4QHBEKhWzYXHc5QA7DVeoWn2zmnG4X93HP0dqxC+QrUwnJ3m0Tf+CJZAgwFF9/29kqe2Q==
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2020 14:48:06.2963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e206bfb-067c-4844-2f2c-08d7ccddb344
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3; Ip=[13.81.10.179];
	Helo=[westeu13-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4180
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] classes/populate_sdk_base: Implement xz compression options
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
X-List-Received-Date: Fri, 20 Mar 2020 14:48:09 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 19-03-2020 12:37, Adrian Bunk wrote:
> On Wed, Mar 18, 2020 at 01:21:56PM +0100, Mike Looijmans wrote:
>> Building an SDK on a machine with 8GB RAM resulted in excessive swapping
>> due to the xz compressor using ~20GB of memory. This is because xz is
>> being called with "-T 0 -9".
>>
>> To allow tuning the compression versus memory usage, introduce a variable
>> named SDK_XZ_OPTIONS that defaults to a more sane default:
>> SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${XZ_COMPRESSION_LEVEL}"
>> Thus, inherit any XZ tuning already done, and allow users to specify
>> overrides for this task in their config by supplying SDK_XZ_OPTIONS.
>> Since XZ_COMPRESSION_LEVEL defaults to -9 this does not change the standard
>> behavior.
>> ...
>> +SDK_XZ_OPTIONS ?= "${XZ_DEFAULTS} ${XZ_COMPRESSION_LEVEL}"
> 
> A problem is that XZ_COMPRESSION_LEVEL compression would now be used for
> unrelated usecases, and lowering the compression for being able to boot
> on low-end targets (<= 64 MB RAM) shouldn't impact the SDK.

Clear. I wasn't aware that this was for the targets...

> 
>> ...
>> -       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz -T 0 -9 > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
>> +       d.setVar('SDK_ARCHIVE_CMD', 'cd ${SDK_OUTPUT}/${SDKPATH}; tar ${SDKTAROPTS} -cf - . | xz ${SDK_XZ_OPTIONS} > ${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.${SDK_ARCHIVE_TYPE}')
>> ...
> 
> Replacing "-T 0" with ${XZ_DEFAULTS} should solve your problem.
> This already takes both cpus and memory into account.

I'd still want to have control over that -9 though.

It's not worth it to spend 15 minutes compressing just a few megabytes 
better in a development environment.


-- 
Mike Looijmans

