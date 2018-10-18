Return-Path: <mike.looijmans@topicproducts.com>
X-Greylist: delayed 46943 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 Oct 2018 00:37:18 UTC
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30043.outbound.protection.outlook.com [40.107.3.43])
	by mail.openembedded.org (Postfix) with ESMTP id 111107456D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 00:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wsyDhzVAQ7imtfsSWXxsvuY298ZfN+W5K8GLJa+Ptu8=;
	b=fFCgjsibYmFOgRdUc7b+/fgJX4bbDM76PPbXEGXL2WkSboOK/ObU23m/RGHWYNKZU1b941dXI4TaB2RVg32WU2mZEvo0BwjwaFXD/knmoNINiXA3C5Fus81bbQWOoaPTQU/el+SG1nnAK9FFl6T2ESWgG3TazFlj0xDAJJ+ovAM=
Received: from DB6PR0201CA0009.eurprd02.prod.outlook.com (2603:10a6:4:3f::19)
	by AM5PR0201MB2451.eurprd02.prod.outlook.com (2603:10a6:203:35::8)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1228.25;
	Thu, 18 Oct 2018 08:01:35 +0000
Received: from VE1EUR01FT058.eop-EUR01.prod.protection.outlook.com
	(2a01:111:f400:7e01::205) by DB6PR0201CA0009.outlook.office365.com
	(2603:10a6:4:3f::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1250.21 via
	Frontend Transport; Thu, 18 Oct 2018 08:01:35 +0000
Authentication-Results: spf=pass (sender IP is 52.166.56.231)
	smtp.mailfrom=topicproducts.com; gmail.com; dkim=pass (signature was
	verified) header.d=topicbv.onmicrosoft.com; gmail.com;
	dmarc=none action=none header.from=topic.nl;
Received-SPF: Pass (protection.outlook.com: domain of topicproducts.com
	designates 52.166.56.231 as permitted sender)
	receiver=protection.outlook.com; client-ip=52.166.56.231;
	helo=westeu2-emailsignatures-cloud.codetwo.com;
Received: from westeu2-emailsignatures-cloud.codetwo.com (52.166.56.231) by
	VE1EUR01FT058.mail.protection.outlook.com (10.152.3.136) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.1250.12 via Frontend Transport; Thu, 18 Oct 2018 08:01:34 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (213.199.154.247)
	by westeu2-emailsignatures-cloud.codetwo.com with CodeTwo SMTP
	Server (TLS12) via SMTP; Thu, 18 Oct 2018 08:01:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=topicbv.onmicrosoft.com; s=selector1-TopicProducts-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=wsyDhzVAQ7imtfsSWXxsvuY298ZfN+W5K8GLJa+Ptu8=;
	b=fFCgjsibYmFOgRdUc7b+/fgJX4bbDM76PPbXEGXL2WkSboOK/ObU23m/RGHWYNKZU1b941dXI4TaB2RVg32WU2mZEvo0BwjwaFXD/knmoNINiXA3C5Fus81bbQWOoaPTQU/el+SG1nnAK9FFl6T2ESWgG3TazFlj0xDAJJ+ovAM=
Received: from AM0PR02MB4083.eurprd02.prod.outlook.com (20.177.108.209) by
	AM0PR02MB4307.eurprd02.prod.outlook.com (20.177.43.23) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1228.26; Thu, 18 Oct 2018 08:01:29 +0000
Received: from AM0PR02MB4083.eurprd02.prod.outlook.com
	([fe80::a1e1:91ea:196b:72ce]) by
	AM0PR02MB4083.eurprd02.prod.outlook.com
	([fe80::a1e1:91ea:196b:72ce%3]) with mapi id 15.20.1250.020;
	Thu, 18 Oct 2018 08:01:29 +0000
From: Mike Looijmans <mike.looijmans@topic.nl>
To: Joshua Watt <jpewhacker@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2] initscripts: populate-volatiles: Speed up
	processing
Thread-Index: AQHUZrjGEXAx5Xd4O0aBBt8Ywv+LAQ==
Date: Thu, 18 Oct 2018 08:01:28 +0000
Message-ID: <6255e31b-77de-3e83-50ef-41759dbea8cc@topic.nl>
References: <20181011180843.13983-1-JPEWhacker@gmail.com>
	<20181012162409.32746-1-JPEWhacker@gmail.com>
In-Reply-To: <20181012162409.32746-1-JPEWhacker@gmail.com>
Accept-Language: nl-NL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
x-clientproxiedby: AM6P191CA0105.EURP191.PROD.OUTLOOK.COM
	(2603:10a6:209:8a::46) To AM0PR02MB4083.eurprd02.prod.outlook.com
	(2603:10a6:208:da::17)
Authentication-Results-Original: spf=none (sender IP is )
	smtp.mailfrom=mike.looijmans@topicproducts.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [81.173.50.109]
x-ms-publictraffictype: Email
X-Microsoft-Exchange-Diagnostics-untrusted: 1; AM0PR02MB4307;
	6:N46oJ4USDoKKX2iN7mKcBybt7jfNB8Nea9ZsDBmVUu2ojOoc94Yt2zBGtNkfZ8Pd+wRRxCWIQogdRtK4Os6W0QtK+l2cTQq+wbNN+8GE9kzto6zjj7KOLUgt2Sh17L1pIrBKxz/uAW4HYVwkslvny513mZwZbT87V9lGvnJhSBe8lCqcA4pLNHQ+7nAzObBpoZuDlqraBE3653krRpOOQJCV6Iem0Cn1F8nlDqWK1S4gxunCfUWdBp8XhalG/zcDS43328dWB2diu+KGYYSqA98zg441y9yeQQFNkFiz3zfOWsR68o/3AU7t08d4KPFUalkD1fz9Y/b0ilT1HQXo1yR2yxAQ0rZVjVJK5/dMpYptoQZxjQI8kTPVnce2NnKqKED/9eXPe9fUithGYX0r+RHjgkv+mVSn9+N028f56ux5M/xzepGv9/IKVzkxGkGw4aaT22zKRr5u5qLBm9PcAg==;
	5:qBLVEMdfIjNc8MGVVWpwxafKqkatbuZh4PwNF4Kg3x7Y9lvh444ErWV+UHuVZ6gOMpPEjCzOJBrG5gUs77U03fP0kB28wXeouvPgn3HTo0XbTEjr6NPFZns3PBKshkJG3gdBdfWmw9XjEMnK2fCguqcIWmLEThNBgoIKnmWsRq0=;
	7:gE2AnfEd2w6xU3+6hIc7Pe/+kDaOAR+vYwvNHHFkJHGQzf8oX8eteFhAueH8xiqswpiHwBa7KWgqb0ROBzKqITVMV1DKZdUQ/wJ6ka5SWuZ6r5tmE/tyhWbO6EKYOVJbjs+XKAohgJ9+hizeFH3vLkxXYyXbB1jScT2uggkgk+CzFV3Kyk1SPeLwSU/7IYqBQ5Bwg3ypZXQZ5Rn/9yRvR8dTUotQi+2OvdJX/hl90kgi9Yqsj0lk3WPXeNBBN8xG
X-MS-Office365-Filtering-Correlation-Id: bca8a18b-ab21-4259-8b71-08d634cfec8e
X-Microsoft-Antispam-Untrusted: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM0PR02MB4307; 
X-MS-TrafficTypeDiagnostic: AM0PR02MB4307:|AM5PR0201MB2451:
X-Microsoft-Antispam-PRVS: <AM5PR0201MB24518B8AFE920D8B4AFA2DCD96F80@AM5PR0201MB2451.eurprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(788757137089)(85827821059158);
	UriScan:(85827821059158)(788757137089); 
X-MS-Exchange-SenderADCheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(10201501046)(3231355)(944501410)(52105095)(3002001)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:AM0PR02MB4307; BCL:0; PCL:0; RULEID:; SRVR:AM0PR02MB4307;
	BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3231355)(944501410)(52105095)(3002001)(149066)(150057)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(20161123558120)(20161123560045)(201708071742011)(7699051)(76991095);
	SRVR:AM5PR0201MB2451; BCL:0; PCL:0; RULEID:;
	SRVR:AM5PR0201MB2451; 
x-forefront-prvs: 08296C9B35
X-Forefront-Antispam-Report-Untrusted: SFV:NSPM;
	SFS:(10009020)(136003)(396003)(376002)(366004)(346002)(39840400004)(189003)(199004)(74482002)(97736004)(11346002)(446003)(6246003)(2616005)(476003)(39060400002)(2900100001)(5250100002)(102836004)(386003)(53546011)(6506007)(2501003)(186003)(486006)(42882007)(478600001)(256004)(36756003)(52116002)(316002)(76176011)(14454004)(31696002)(305945005)(7736002)(110136005)(6436002)(99286004)(6512007)(58126008)(31686004)(53936002)(2906002)(71190400001)(71200400001)(6486002)(65956001)(66066001)(65806001)(64126003)(6116002)(3846002)(68736007)(44832011)(65826007)(5660300001)(25786009)(229853002)(26005)(8936002)(81156014)(81166006)(106356001)(105586002)(8676002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM0PR02MB4307;
	H:AM0PR02MB4083.eurprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:3; A:1; 
received-spf: None (protection.outlook.com: topicproducts.com does not
	designate permitted sender hosts)
X-Microsoft-Antispam-Message-Info-Original: buQtcdDXSRAAayDv/GlD4GzEKWFAnUMStD/YiFQnNMc/GSjXqtCKUuIfjJkWuoKy6l2KjSQ/xFPGYN9p528rZ128i4M64zSqTWgYxdzRE6+Y19W+Csx7ivsRAb3wj9T8oB604xJUVBR6i3aqcK4W/RIN/WrRZ4JEYuWDd9nyszUpntcGekhuW3AjSLdz29/21Y7bUFyPd8YAt9e7JHu0R0h/m8Mllk3Cdw4kdRaZYC7ra7rOD/LzdoK6XZZiNeN0wXjK/kDJaddRKUWsiQTuNtxbcWxBT1WgIc0zOL6rqzDTQ7daeztxy4Q7We+fYF0UqHlPQ8de81Yq+LiS1tR3GDPH4reawkK9NveiM46tVk8=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4307
X-CodeTwo-MessageID: 20181018080132.ce49db15-db3d-4798-9010-64dd08bffbf8@westeu2-emailsignatures-cloud.codetwo.com
X-CodeTwoProcessed: true
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR01FT058.eop-EUR01.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:52.166.56.231; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(136003)(396003)(39840400004)(346002)(376002)(2980300002)(438002)(199004)(189003)(106466001)(3846002)(6116002)(2900100001)(14454004)(31696002)(478600001)(2486003)(23676004)(186003)(44832011)(26005)(99286004)(50466002)(106002)(336012)(436003)(42882007)(486006)(11346002)(76176011)(446003)(126002)(31686004)(476003)(58126008)(2616005)(53546011)(356004)(6506007)(386003)(110136005)(102836004)(305945005)(7636002)(7736002)(2501003)(6512007)(5250100002)(47776003)(229853002)(36756003)(65806001)(6246003)(65956001)(316002)(246002)(25786009)(39060400002)(74482002)(8936002)(8676002)(64126003)(66066001)(6486002)(65826007)(2906002)(5660300001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM5PR0201MB2451;
	H:westeu2-emailsignatures-cloud.codetwo.com; FPR:; SPF:Pass;
	LANG:en; PTR:westeu1-emailsignatures-cloud.codetwo.com; A:1;
	MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; VE1EUR01FT058;
	1:R+8RlVuATU0pyWgNStPx5yRtMpzJpQ2ZwLnI37TBoRk2RhEo0lVRzCDqMPCbYCf9rTel5E8ai+l1Ohjz0uIS1FCqKzScYvjlh+tQrFxDWxx6L5fxTrsgqdoaE5LVZ8/E
X-MS-Office365-Filtering-Correlation-Id-Prvs: 06549d88-a8a4-4e44-c374-08d634cfe8a6
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(710020)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM5PR0201MB2451; 
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0201MB2451;
	3:7m2NLkmaGXEuA4H9xjlPhPStqwcLb1J7c18X+rTX4giSOhV7AgmSCh/6ijUp3W5dbfAYVzYm90P/a7kv9LGKJi6B3kweWWJHI1RqqpKWFtpPCPveDu3kgNU5orrFYKtmgd/IaLpmdHuGG2B5rdH5iI3UVMcUl7gibry9Z66C7qZzFNUvMjNg+no2r7XBqg8p2TP68gXJC4usWZTwJyNlnR8J5RieM72bvYRBpqGPC9q3TcauTEeUfshUq59hsh0mCkBqDrkvDATYCc4YDPycXRNSP6+iSklXkgVWwNBz046ABgsxdQPuKHop1WbFhkBgOwS4APlsvA/3HAVh4IBe7MgJp8Ype5ayZvwoXqnJOdI=;
	25:BdHXm4BV+XxiKRh43vnDohTjSavQ5U5QA/t11ySLM17VnkGDSkCT06jGypVOxD1hVfP7AuwRozXscq/oQGCYXUi3i7PrdZp9lNPpLQqNcgncEPgG9y/Gh4M9CvKPyzkV7aGicaiPT+VtQe97Fs95z2B/SEGuCDpCFitwuuLyUVh/WXzStNII9PU2O4/pHxSxs1aNSPG51AcB31HkQt0dOBMLdHV04pQ9ZEag8KQUAQZX4XBkIci/MhOodFsgW/T2ECzl0BphUshpIobsscGEJTL5Zw4UUXLOLs4Sy5/aqEHdr27+mNJSqejdmpxFUCx6q68JpLPLdGEvXo7bsHChCw==
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0201MB2451;
	31:kNTFQjJlJymeH3XIrhCVmQJHedKwPGXf+xWk1hfmo1y6JLJbPZ5hLcrIvR2yuPw70Wy5WBPwrmaterf4sR/LuVBLAyt1LgDgRJUyREszQcKM7Rm3R/KxdQqiAnNmtTcqNh3uEjucrXbs4O1ROCVHcesB0QZjsElNU8eZXAipvBfxZaCZm9Yxg3bQMPEOMqrXx3FbR7iVrvyKczdIVUfxNaFXjReEuos8B6EDXidTuOo=;
	20:EE3ZeFbhPyJ0dSxhlQeBFpGv41/nruVEZiFggQDl8/fu/jG7F9QdftBIBmlieUQxr4FyZpsI2fvUnJMjs3sNOmD9R18w6ExBsJjSmHx8iURqbhQGrZUpx2P5HWiTr8LmJFjMxk4zZ23ds9PISF9UNcGbTRM8iQxJlsj6p7b9ZVw=;
	4:4bBR+WdkcnukWd+l04vjvrpwc29ZlHFtUIfVS95vM2NJxZF8FaDht0vG/OcJ+8m+BF8pTDHaT/xiX7DnfTeCbPx50iBIGHJPF60KfO1BANillmGe6CMVv1QWdcyj+qN3HN1alEEOfg2K5IQyuBbgWg5qZp7EGD0t4YDe1PJ+Ussl46s4zWyQFtukvvtWenH1bgs7LMUDsMvqG2pGykoLM548NpVK5/DJgfYDJlRMa0H2C6g4oPpy6qU7cmKHyreqOlFhFS0d2mBMwv8U79i0Cfj4s+6ImzO/Q04Ck8ejXijyy0C07lFC4d7gNF8Gz+lDYwCDXURtASBIy75wskPq6Q4hM0PG9CNRqVaE6DZ80DY=
X-Forefront-PRVS: 08296C9B35
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTVQUjAyMDFNQjI0NTE7MjM6WDJtQWduSU5MSnNpckJ4eDBIMlNZcmQ4?=
	=?utf-8?B?TXVtR3gxbHpkS3NEeHJsSVZaNGhXWEU5eWJCY25tcEw3T1E1ZzRqdU9kODZH?=
	=?utf-8?B?U29mVGRZYldiOHl2RHdKWnJ1M2szMkQwTlFaLzFhR25VRkpWd2N6TG9oeXRk?=
	=?utf-8?B?NGE2K3N2RmxPakRjd205NG9hbkxrSUFkMEd2UDZLN0NXSmRXVWJJWVJIMFdv?=
	=?utf-8?B?VXIwbTNGL0RBaXF4bWM3a21QWDFDa3dNZTlDakpneWljaFczQUV6QW9oVS9R?=
	=?utf-8?B?NFRydWtCTzhNYVZickZ0UGxkMXMraGNuY24zblIvTGNWUERvNTdKZVBHR2NP?=
	=?utf-8?B?blBkNjViTXhmUEswUEQ0ejdhSzVSenkrLy8vUHVQb1dDaHZqVHd4c09BQzc4?=
	=?utf-8?B?WVN3WjAxakxLNGd3dTFYNzhQOVA5WnkwK3hSNHk5QW50dEFmWVZhODUxT3hC?=
	=?utf-8?B?TXNCemhIZmNzK0IwcHdEMVc5cWZFaDh6R1J0U21weXMzSEVvNGFKN2x2bUdR?=
	=?utf-8?B?OW1NOGlsby9zV0pQYk1TbFdXalpvV0lEMFNvaExrVzFlWGNXandsVEpwMFA1?=
	=?utf-8?B?K3ZVenRmNGx6cWh2eTlGRytPbm1Oc2pvUnNDam1CNmhmOFlvYWJaMEtKRnU1?=
	=?utf-8?B?TmZ2bWUwVkhQVlRjK3hlZkh2Mk5NZHhrcW1ZY2QxZktyVkc1aWFQVFUwMlNI?=
	=?utf-8?B?VUxnTnl3eVhncFJHR2tZZ01DYUtvbnFxQVpZelp6U1kzSHhCSUJvZFJ6Nmhq?=
	=?utf-8?B?L3hweit3VFpoSkViWHhydjkzNkhNN3V5UndLSS9UVFRYUjBDU2ptR2t5UmJ0?=
	=?utf-8?B?b1VobW1qUlpDQVlGQlBHYUYxd2hkMXYwVUFHa3RXQzhsVm0xVWpNNFlPb3Ry?=
	=?utf-8?B?Yk1OVkFWS1pHalhtYTJ3bFdOenZYL2dkU2t2TkVjM1Zsam1sWDhvN2JmcnJN?=
	=?utf-8?B?cUFrbVBjdVROby9Kc3B2Qm9XakQva2dGdmJKS2pMQkY1L01QbitjRDZicWtO?=
	=?utf-8?B?RHYyOW9xWEczYldCQnY2dnYzMVhxYzZ4OE0wbFdydHRNdmhSWnFJaGUzeWVi?=
	=?utf-8?B?ZXBxNU1VZDJuMldvVWtEYVVTV2NTaGJUMXRRVjRJOXArQUFwVEpRQWYzSHVp?=
	=?utf-8?B?R28wK2dPQjlhbVJjWWRLSWI2NjNnY1k4bmRFTllWK3ZYLzZDOHJHajVSMStl?=
	=?utf-8?B?MVZpS3hHSjQ2TXBadjdJZWlCa1BtQjlDRFU1Zy9FNzZONGpyUkxWM3p5Tm4w?=
	=?utf-8?B?cGZhbERzOCs4cFBXQ2lrQkxwSWhteHJ6bDZLQVM1dzdYVjQxQ0pnWGJBUW9H?=
	=?utf-8?B?M1llbjRhZHg4bFo0MnJReTBRSUltRmtOK2VSSExiT3BpMGdwaXRqb2xNaS8v?=
	=?utf-8?B?QTBYTnh1L2hqMnFkMXhrcThmejRNWjU2YW9GNkR4WlQySGZMcnNabVpLdFV5?=
	=?utf-8?B?R3NXY3RuWkZ6V2F4VWg2QUZzbjYwSGlDM0ZvVmFiMWx0ZjBtUFhPbzlNUnhx?=
	=?utf-8?B?NjB6ZVRFMmpxZDQxVXhQeHZuMnVFY0VPL1A3TTJCMW9xc2M2RVJjRDhWZjI1?=
	=?utf-8?B?RGl0L1IrYTZOMHp0NlFScEtHa3Z5a055SUE2SDRDc3FuV3ZaYlFmUGpPcXdK?=
	=?utf-8?B?bnFHcThjM0RBMGZiUzB1NlRpdzJLQ0hleUhLaE1DTW9Da0wyYktZMFdDQWtE?=
	=?utf-8?B?K1Z2YkhNNk5vdTNGVUg2QWkzMTFJVWhJTDVqRElWTHlkNVJYdWZhbzg0YmNu?=
	=?utf-8?B?bjMycTA4R1BmTXdIcDRWZFRoK09TSDFzdEVObTdxQklYRWVqNGJwKzQyMG0v?=
	=?utf-8?B?aSs5Zk9hODBQalJuSkdiS0lPTjJuUmdNTWFCZUtQaFp4NTRuRW5OcUhhVGJ5?=
	=?utf-8?B?a1RKVEhXenV6WTk3YzRXUzlMWUprUHA3ZkIyVXVkMWNmWEVrc0pQbXJCbldR?=
	=?utf-8?B?Zk42eGNkUWJvMmJNNWZSQ0hTN1dYSG5wYjZmcVhnQXUwVEo4d0pzczNRdlJK?=
	=?utf-8?Q?2o2a/KyW?=
X-Microsoft-Antispam-Message-Info: itQDvVAiJTQ8Bp2WH3ovT/fcr3e8L7937UT3ziwjuKvzAY184T7IiVexSLPO4rymGZBp+YjW//1tM1Lg7X1oTFr1slGLK5hvew+PFUL9vGKz7y/GYZQuumgyVraTn1QTfZt00aeHaceL+KdRqegzk0Qoesf0vfssYNhBwDKE7x43cZiLSG3SVyMytsU/N0pE8FDSKhcGwSpEs7X+k/S1xbYMZQ349w29iKYjeZn0hOsl360QVfLeE/LySDxyr9UOBklRtuW3xlOMvEJ878WPgGmaly8uZ13FvY4fedWZFAMK2k5iALuYJv5XfBXhmhvrRfyCgkQ4TBembIjBD5+7D6cvVVTFjXj8F5dQrH6i1EU=
X-Microsoft-Exchange-Diagnostics: 1; AM5PR0201MB2451;
	6:plWg94xdx0d90IbkQ+SK1GnbZyX9ahaH9w8U9CPeVHxSRECSk+jejdON7T8nozNX66tJpo+FU1PTjjFGUYFKsQMNAjq7HUR1YptJGa9+zlFrIqJKESka9QONj/ZDqgR1oiGW+sQR4H5itTd8rZji6yO9yREg57ftqWXGDTgfvIHKtGAvhWGkVWKTWGJRcBkMZ59wG1dETOJntQMgIpEaO3p8O0J0YUUdqPta9wKAoRklmY2PaN/DVtDEXJIpClH4GKTexHDWve8KMKNOfhA8/O7JgKeoEXDMi1VZZv579Nph5zBng2rBhHtmAsfDJ9m9XPW6bEpGvTOomHZ9HkTId67OialhQSAufYnUCLDbfhHNt3P3ET3fFoDY40F9HH3b6bAC/olOJEp9/xSB8fbOFA0eHn5fRmjqUmtBJEUpUZIM7MattsUu6o95FyHXMe+1ALDUOgQ+BGlGthfbd3iOUQ==;
	5:Qj/DRlG3S18/LLoXSKCFtvdco2tVe4hoyrWb5Sg6nK7vpLJ9Iz9WpvZQrd7+ciVeO1lNoBmgPNsGzez7he96BUnpK7fi14a+C2IuP5+Sd+zN61hEe4dBfSogYVL7M/zQLU9FWoJVFXpeQbwocMcYVTKOYaX22bF7H8jZhP8HEr8=;
	7:TrClQKUk1Jnb+02L9WPpzTgredvYa75TsP7TtuvJUf4F/GWTFS+aHYaSGOYqbsrFbHehCAmfY5HbRjM9KL5Zk+iqYMTAX3bXSuv6zNMYxW9rA+WZkkHsgyaP8Qg8O/bBDNDdMaEx/YCsEZJBu0FfEwE9C6CrZNqS80cRDWObFiMRd9PjbGYPy57kOcmNhxUIxYcVao65gvzdkQnBZeYfYkTvHiY/h4IRQnYQz2lCkqQg/zd54ZvqBdS4R1esT/vM
X-OriginatorOrg: topic.nl
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2018 08:01:34.9580 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bca8a18b-ab21-4259-8b71-08d634cfec8e
X-MS-Exchange-CrossTenant-Id: 449607a5-3517-482d-8d16-41dd868cbda3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=449607a5-3517-482d-8d16-41dd868cbda3;
	Ip=[52.166.56.231];
	Helo=[westeu2-emailsignatures-cloud.codetwo.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0201MB2451
Subject: Re: [PATCH v2] initscripts: populate-volatiles: Speed up processing
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
X-List-Received-Date: Fri, 19 Oct 2018 00:37:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <371581EF332F0C4187CAD2EF0E60E7D1@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gMTItMTAtMTggMTg6MjQsIEpvc2h1YSBXYXR0IHdyb3RlOg0KPiBDaGVja2luZyB0aGUgcmVx
dWlyZW1lbnRzIGZvciBlYWNoIHZvbGF0aWxlcyBmaWxlIGluIHRoZQ0KPiBwb3B1bGF0ZS12b2xh
dGlsZXMgc2NyaXB0IGNhbiBiZSB2ZXJ5IHNsb3cgd2hlbiB0aGVyZSBhcmUgYSBsYXJnZSBudW1i
ZXINCj4gb2Ygdm9sYXRpbGVzIGZpbGVzLCBlYXNpbHkgY29uc3VtaW5nIG92ZXIgODAlIG9mIHRo
ZSBwcm9jZXNzaW5nIHRpbWUuDQo+IFRoZXNlIGNoZWNrcyBkb24ndCB1c3VhbGx5IHVuY292ZXIg
YW55IHByb2JsZW1zIHNvIGNvbmNhdGVuYXRlIGFsbCB0aGUNCj4gdm9sYXRpbGVzIGZpbGVzIHRv
Z2V0aGVyIGFuZCBwcm9jZXNzIHRoZW0gYXMgb25lIGxhcmdlIGZpbGUgZm9yIGEgImZhc3QNCj4g
cGF0aCIgb3B0aW9uLiBUaGlzIGVuc3VyZXMgdGhhdCB0aGUgcGVuYWx0eSBmb3IgY2hlY2tpbmcg
dGhlDQo+IHJlcXVpcmVtZW50cyBpcyBvbmx5IGluY3VycmVkIG9uY2UuIEluIHRoZSBldmVudCB0
aGF0IGNoZWNraW5nIHRoZQ0KPiByZXF1aXJlbWVudHMgZm9yIHRoZSB1bmlmaWVkIGZpbGUgZmFp
bHMsIGZhbGwgYmFjayB0byB0aGUgc2xvdyBwcm9jZXNzDQo+IG9mIGNoZWNraW5nIGVhY2ggb25l
IGluZGl2aWR1YWxseSBzbyB0aGF0IHRoZSBvZmZlbmRpbmcgb25lIGNhbiBiZQ0KPiBza2lwcGVk
Lg0KPiANCj4gVGhlIGNvcmUgZmlsZSBpcyBoYW5kbGVkIHNlcGFyYXRlbHkgYmVjYXVzZSBpdCBp
cyByZXNwb25zaWJsZSBmb3INCj4gY3JlYXRpbmcgdGhlIHRlbXAgZGlyZWN0b3J5IHVzZWQgYnkg
Y2hlY2tfcmVxdWlyZW1lbnRzIGFuZCB0aHVzIG11c3QNCj4gYWx3YXlzIHJ1biBmaXJzdCBhbmQg
d2l0aG91dCBoYXZpbmcgaXRzIHJlcXVpcmVtZW50cyBjaGVja2VkLg0KPiANCj4gW1lPQ1RPICMx
Mjk0OV0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvc2h1YSBXYXR0IDxKUEVXaGFja2VyQGdtYWls
LmNvbT4NCj4gLS0tDQo+ICAgLi4uL2luaXRzY3JpcHRzLTEuMC9wb3B1bGF0ZS12b2xhdGlsZS5z
aCAgICAgIHwgMzcgKysrKysrKysrKysrKysrKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzMyBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1jb3JlL2luaXRzY3JpcHRzL2luaXRzY3JpcHRzLTEuMC9wb3B1bGF0ZS12b2xhdGlsZS5z
aCBiL21ldGEvcmVjaXBlcy1jb3JlL2luaXRzY3JpcHRzL2luaXRzY3JpcHRzLTEuMC9wb3B1bGF0
ZS12b2xhdGlsZS5zaA0KPiBpbmRleCAzNTMxNmVjMmJhYS4uODI0ZjhmM2E2YmEgMTAwNzU1DQo+
IC0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL2luaXRzY3JpcHRzL2luaXRzY3JpcHRzLTEuMC9wb3B1
bGF0ZS12b2xhdGlsZS5zaA0KPiArKysgYi9tZXRhL3JlY2lwZXMtY29yZS9pbml0c2NyaXB0cy9p
bml0c2NyaXB0cy0xLjAvcG9wdWxhdGUtdm9sYXRpbGUuc2gNCj4gQEAgLTExMiw3ICsxMTIsNiBA
QCBjaGVja19yZXF1aXJlbWVudHMoKSB7DQo+ICAgCX0NCj4gICANCj4gICAJQ0ZHRklMRT0iJDEi
DQo+IC0JWyBgYmFzZW5hbWUgIiR7Q0ZHRklMRX0iYCA9ICIke0NPUkVERUZ9IiBdICYmIHJldHVy
biAwDQo+ICAgDQo+ICAgCVRNUF9JTlRFUk1FRD0iJHtUTVBST09UfS90bXAuJCQiDQo+ICAgCVRN
UF9ERUZJTkVEPSIke1RNUFJPT1R9L3RtcGRlZmluZWQuJCQiDQo+IEBAIC0xNTQsOCArMTUzLDEx
IEBAIGNoZWNrX3JlcXVpcmVtZW50cygpIHsNCj4gICANCj4gICBhcHBseV9jZmdmaWxlKCkgew0K
PiAgIAlDRkdGSUxFPSIkMSINCj4gKwlTS0lQX1JFUVVJUkVNRU5UUz0iJDIiDQo+ICAgDQo+IC0J
Y2hlY2tfcmVxdWlyZW1lbnRzICIke0NGR0ZJTEV9IiB8fCB7DQo+ICsJWyAiJHtWRVJCT1NFfSIg
IT0gIm5vIiBdICYmIGVjaG8gIkFwcGx5aW5nICR7Q0ZHRklMRX0iDQo+ICsNCj4gKwlbICIke1NL
SVBfUkVRVUlSRU1FTlRTfSIgPT0gInllcyIgXSB8fCBjaGVja19yZXF1aXJlbWVudHMgIiR7Q0ZH
RklMRX0iIHx8IHsNCj4gICAJCWVjaG8gIlNraXBwaW5nICR7Q0ZHRklMRX0iDQo+ICAgCQlyZXR1
cm4gMQ0KPiAgIAl9DQo+IEBAIC0yMzEsMTAgKzIzMywzNyBAQCB0aGVuDQo+ICAgCXNoICR7Uk9P
VF9ESVJ9L2V0Yy92b2xhdGlsZS5jYWNoZQ0KPiAgIGVsc2UNCj4gICAJcm0gLWYgJHtST09UX0RJ
Un0vZXRjL3ZvbGF0aWxlLmNhY2hlICR7Uk9PVF9ESVJ9L2V0Yy92b2xhdGlsZS5jYWNoZS5idWls
ZA0KPiAtCWZvciBmaWxlIGluIGBscyAtMSAiJHtDRkdESVJ9IiB8IHNvcnRgOyBkbw0KPiAtCQlh
cHBseV9jZmdmaWxlICIke0NGR0RJUn0vJHtmaWxlfSINCj4gKw0KPiArCSMgQXBwbHkgdGhlIGNv
cmUgZmlsZSB3aXRoIG91dCBjaGVja2luZyByZXF1aXJlbWVudHMuICR7VE1QUk9PVH0gaXMNCj4g
KwkjIG5lZWRlZCBieSBjaGVja19yZXF1aXJlbWVudHMgYnV0IGlzIHNldHVwIGJ5IHRoaXMgZmls
ZSwgc28gaXQgbXVzdCBiZQ0KPiArCSMgcHJvY2Vzc2VkIGZpcnN0IGFuZCB3aXRob3V0IGJlaW5n
IGNoZWNrZWQuDQo+ICsJWyAtZSAiJHtDRkdESVJ9LyR7Q09SRURFRn0iIF0gJiYgYXBwbHlfY2Zn
ZmlsZSAiJHtDRkdESVJ9LyR7Q09SRURFRn0iICJ5ZXMiDQo+ICsNCj4gKwkjIEZhc3QgcGF0aDog
Y2hlY2tfcmVxdWlyZW1lbnRzIGlzIHNsb3cgYW5kIG1vc3Qgb2YgdGhlIHRpbWUgZG9lc24ndA0K
PiArCSMgZmluZCBhbnkgcHJvYmxlbXMuIElmIHRoZXJlIGFyZSBhIGxvdCBvZiBjb25maWcgZmls
ZXMsIGl0IGlzIG11Y2gNCj4gKwkjIGZhc3RlciB0byB0byBjb25jYXRlbmF0ZSB0aGVtIGFsbCB0
b2dldGhlciBhbmQgcHJvY2VzcyB0aGVtIG9uY2UgdG8NCj4gKwkjIGF2b2lkIHRoZSBvdmVyaGVh
ZCBvZiBjYWxsaW5nIGNoZWNrX3JlcXVpcmVtZW50cyByZXBlYXRlZGx5DQo+ICsJVE1QX0ZJTEU9
IiR7VE1QUk9PVH0vdG1wX3ZvbGF0aWxlLiQkIg0KPiArCXJtIC1mICIkVE1QX0ZJTEUiDQo+ICsN
Cj4gKwlDRkdGSUxFUz0iYGxzIC0xICIke0NGR0RJUn0iIHwgZ3JlcCAtdiAiXiR7Q09SRURFRn1c
JCIgfCBzb3J0YCINCj4gKwlmb3IgZmlsZSBpbiAke0NGR0ZJTEVTfTsgZG8NCj4gKwkJY2F0ICIk
e0NGR0RJUn0vJHtmaWxlfSIgPj4gIiRUTVBfRklMRSINCj4gICAJZG9uZQ0KDQpZb3UgY2FuIHJl
cGxhY2UgdGhhdCBsb29wIHdpdGggdGhpczoNCg0KY2F0IGBscyAtMSAiJHtDRkdESVJ9IiB8IGdy
ZXAgLXYgIl4ke0NPUkVERUZ9XCQiIHwgc29ydGAgPiAiJFRNUF9GSUxFIg0KDQooQW5kIHRoZSAi
PiIgaW5zdGVhZCBvZiAiPj4iIG1ha2VzIHRoYXQgeW91IGNhbiByZW1vdmUgdGhlICJybSIgY29t
bWFuZCBhcyB3ZWxsLikNCg0KPiAgIA0KPiArCWlmIGNoZWNrX3JlcXVpcmVtZW50cyAiJFRNUF9G
SUxFIg0KPiArCXRoZW4NCj4gKwkJYXBwbHlfY2ZnZmlsZSAiJFRNUF9GSUxFIiAieWVzIg0KPiAr
CWVsc2UNCj4gKwkJIyBTbG93IHBhdGg6IE9uZSBvciBtb3JlIGNvbmZpZyBmaWxlcyBmYWlsZWQg
cmVxdWlyZW1lbnRzLg0KPiArCQkjIFByb2Nlc3MgZWFjaCBvbmUgaW5kaXZpZHVhbGx5IHNvIHRo
ZSBvZmZlbmRpbmcgb25lIGNhbiBiZQ0KPiArCQkjIHNraXBwZWQNCj4gKwkJZm9yIGZpbGUgaW4g
JHtDRkdGSUxFU307IGRvDQo+ICsJCQlhcHBseV9jZmdmaWxlICIke0NGR0RJUn0vJHtmaWxlfSIN
Cj4gKwkJZG9uZQ0KPiArCWZpDQo+ICsJcm0gIiRUTVBfRklMRSINCj4gKw0KPiAgIAlbIC1lICR7
Uk9PVF9ESVJ9L2V0Yy92b2xhdGlsZS5jYWNoZS5idWlsZCBdICYmIHN5bmMgJiYgbXYgJHtST09U
X0RJUn0vZXRjL3ZvbGF0aWxlLmNhY2hlLmJ1aWxkICR7Uk9PVF9ESVJ9L2V0Yy92b2xhdGlsZS5j
YWNoZQ0KPiAgIGZpDQo+ICAgDQo+IA0KDQo=

