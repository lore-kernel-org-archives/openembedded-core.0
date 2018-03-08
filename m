Return-Path: <VINEETHC@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0051.outbound.protection.outlook.com [104.47.38.51])
	by mail.openembedded.org (Postfix) with ESMTP id 1A29678A08
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 08:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=pewbRjVCX/knnydzSaKd/+cW40fep8XR/ZeyrLUUcSc=;
	b=OgZ2XCaeBOAtXczOMjGlKmn3PK4WpCjJ8Yf1sKCPx49q6HQbmXQsGh6yJS80luSJ/bzTs0hf/6eyJZa3n2KyVciLkh7T/o8W7IGyghDbKtj/f4YBKTEZ85CrwZr7mKJX6v28CKpydjZLQ1pG52nGP2G2hxSPB4F7qSSjFxz+Z1Y=
Received: from MWHPR0201CA0093.namprd02.prod.outlook.com (10.167.161.34) by
	BY2PR02MB1297.namprd02.prod.outlook.com (10.162.79.16) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.548.13; Thu, 8 Mar 2018 08:09:54 +0000
Received: from CY1NAM02FT009.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::200) by MWHPR0201CA0093.outlook.office365.com
	(2603:10b6:301:75::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.548.13 via
	Frontend Transport; Thu, 8 Mar 2018 08:09:54 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; prevas.dk; dkim=none (message not signed)
	header.d=none;prevas.dk; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT009.mail.protection.outlook.com (10.152.75.12) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.527.18
	via Frontend Transport; Thu, 8 Mar 2018 08:09:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etqcb-0008Ef-06; Thu, 08 Mar 2018 00:09:53 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <vineethchowz.chowdary@xilinx.com>)
	id 1etqcV-00012u-N7; Thu, 08 Mar 2018 00:09:47 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w2889eeb022372; Thu, 8 Mar 2018 00:09:40 -0800
Received: from [172.23.180.111] (helo=[0.0.0.0])
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <vineethc@xilinx.com>)
	id 1etqcO-0000vG-CR; Thu, 08 Mar 2018 00:09:40 -0800
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>,
	=?UTF-8?Q?Martin_Hundeb=c3=b8ll?= <mnhu@prevas.dk>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1520433689-6357-1-git-send-email-vineethchowz.chowdary@xilinx.com>
	<2b8a0c5f-3787-23ac-d371-56c805064949@prevas.dk>
	<BY2PR02MB3479774AF4664F30E76058DB9DF0@BY2PR02MB347.namprd02.prod.outlook.com>
From: Vineeth Karumanchi <vineethchowz.chowdary@xilinx.com>
Message-ID: <8ff8dc78-c574-1854-d410-e3e6dba1f565@xilinx.com>
Date: Thu, 8 Mar 2018 13:38:52 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <BY2PR02MB3479774AF4664F30E76058DB9DF0@BY2PR02MB347.namprd02.prod.outlook.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39860400002)(39380400002)(396003)(2980300002)(438002)(377424004)(13464003)(199004)(189003)(36386004)(107886003)(31696002)(6246003)(65806001)(65956001)(47776003)(5660300001)(305945005)(72206003)(67846002)(53546011)(106466001)(356003)(478600001)(31686004)(4326008)(2906002)(23676004)(2870700001)(956003)(2486003)(2501003)(77096007)(26005)(229853002)(9786002)(6666003)(316002)(8936002)(64126003)(65826007)(186003)(63266004)(81166006)(336012)(50466002)(106002)(58126008)(2950100002)(6706004)(110136005)(36756003)(8676002)(81156014)(76176011)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1297; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT009;
	1:UOu0TU3bnCIUuAfR1MbHDOTDSgAz6onvlLe/o61WhgQI+sGrJkCpmaAuTJkH/b8HzMVDOZM8dbolXSqZS16fA43T4hnKwDq3jQruHeCVT28Idr3H6hj2NpqeURB22yX3
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0510a4b1-65ea-4b26-4877-08d584cbf925
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BY2PR02MB1297; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1297;
	3:ZcQ581VrVrSctWpPwZBSh6GBp3lx3DXK0YM9zy4T945W4jCztzGdNhh/A1ZrfZygXt8pHZTMcRZH3NZJi0z0rsEk0zTw/lbTdxu72MGClnvMwJTX/zsSfNMO+xSxJs/crzzzFQsS1+LvzIlA/WQMqd2u1PuW+SvnbcUQ8swo22BCs+MKgw9SUzX1ZaLdEvXngvqW0ZDhtDS+EUzkIjCu3+YAAAEKyxnZ/6k9GJ0ej2sfVraW+nxVNpOXIDt8dR4IafZ2SlrG+++CiuikZmKZJ0ldYlhZ+zoV4OfxptGyI6/wH3h7Pfw3LqFnYHReugtUmrrGVRJB0+rVwwQS9KYx/MyjKbgXyGMZyONojveTHYs=;
	25:8kkQ5qySNYkpuZEpip0DN1eTbcQ4zRE8tHbR5W1e9dL82wqew0vOR6xjeqE5nQV7llc5IJ+GH+eY1n/dDw1h3laV4K7fwiHhyhBXnnqCKfNhDpZrJOBA+7zq9f+agJ+zfJUWpqwb13v1MkkFAH0i2bIpq89lY9d/f10M+TyWMQhVDfZWp7k+bV9eKlefZxbEnyhTIY1lpeICKvvdJBYiYq9Gx9cCYK0rBxZqXDqbWXTJmt/C2WQNjCGnRp8v1JBr5iu2/zvlaSw9mq+ScP03Mu4/zqKRsP9B078e6amuSbwR+yFP4rdZa+hO0p5PJd/lshhKtauFSGtrsZM/ukIuhg==
X-MS-TrafficTypeDiagnostic: BY2PR02MB1297:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1297;
	31:rFQqPJhqsKogLBylYPDp70B0DLis0EsR5o8z0TnpP7L7b/XZwyFeTOT+ENfMufnqDaNaoraBr6iaHlRGWHAQIhfIdez6Ern1HEbor8Ds3wn6svtMJ0PV3UcCaP1wg71OthK86qwbTrnIt8mIR1Zi1ypAX0UZQo3WVpE/lyeehro53y9a3gL1yiSc2a/BRfmxNYGtHEsz2x9M9v32AR6g6TIWDi8cy07P7JKqLBDXQ4Q=;
	20:zmcSiYNExDh+R7tDoB1OnH99ElgKv0iXTdGiJ2Gs78dqfrHYK6L/G+p+T+bzDzipDfd/4xYqYlNdwxEH3H7LScmV4CHRelf3FaPsLtq2fXmeXE8qfDLGqBV+urEh8J4RyPWL8+DO7LMXVfcUDApc3neGp3Rg587fja1I4OyfG1ox62pjA7fEpqDM710jQHt27c+/NAg8uNRUuZ4rh0YwpAv53kHYLF1YMm7CPXmTdE7YTs1z32q2X0w0pa8gvvu+GSoLQ8bWRo71n/XE/2uy/6rzE5f/4U5yanKLnzb49ngT9NiUrLoh66iAc1H6D5jBbpnFqIhn7oP9iKs8Byo9nIcHFO2k6vS8FzQA3/97NSK+6MXS9ctbNVOQVhTa/q3GR+epXs6KS+EFD7dBGJEUgX2MSmrGw/m6CfweWayTF+Mfx91O0DqFciePzNc6VvtMLt0Y+tBEeY6HyQ9iGyyMw1BFHGPMnSiH4Yj8LuVeyEtpj2ho4nOrVMGBzzIz+GOr
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BY2PR02MB1297692F1065973CC0F9C9C7B9DF0@BY2PR02MB1297.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040501)(2401047)(8121501046)(5005006)(3002001)(3231220)(944501244)(52105095)(93006095)(93004095)(10201501046)(6055026)(6041288)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123560045)(6072148)(201708071742011);
	SRVR:BY2PR02MB1297; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1297; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1297;
	4:ddzaN+WICuGlnDR0pKMxwYJgwLHk7FK7Q1a+nHhmZY2dmokj9HbGxdsBkUfdD51psJ1T3RPHpPe1Q3gSqGEr8nOWMi2QHlOk/sAKXej5vyau8vekBEDzRRJ5xExHT4gXOI+ykSrziLQ3H839N0U2Fqv7zJ9WQj5KrqkKWJpBgMZLFoCcndJOM2gd5tj7M6Et0GsNhzWZrmk3gLlzueLIJD2flXrpDKtFnwqNS4+p7wXT9zfzw5/YMnOFwx5q8c4fK5qulDWPfHlFidGMV5k2Ryti0eUV3ScLdYYDgp4kyNmBq9r1fs/llfRxWnJuTmbnZOAfuiM/9uNFzTKEwAEBBsy+vkIP8aEcPs1g3T2U7og=
X-Forefront-PRVS: 060503E79B
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTJQUjAyTUIxMjk3OzIzOkF2elBubElxMU5zOVN0TGkxekxjR2pvT1dt?=
	=?utf-8?B?QVhWdHl2ZFFZai9IaGJiNDlNY0hJbTlwODR6dmMyMUNVbVVVeTVDOHZNbUZF?=
	=?utf-8?B?N3htemlva2lsbHVqaWRUSTV4SHpVa2RQcnl5UEloM3I1dzBOd0pQL0Vlb3pF?=
	=?utf-8?B?eG92WVl6USsrMVo0ZGk1RkpLVWNnNHBWTDBWclZnS3ZWZU1EQTFHT2lnSnJG?=
	=?utf-8?B?U0pKTFVXenp2alo2Nmc1M1pTUHVsdSt3MUdKclUrcG1WTnhlQ3NKR1dkdWdo?=
	=?utf-8?B?SzRrcE93L3hQeEdySXNoSERLVjdwcXM4RFlIR1hEQWd2VUczZGs5aUsxZjYr?=
	=?utf-8?B?c05YakxNNjIydWNaRHNxeTlDRU02dkJ3dGROOXFDZTk2UjFmZmU1S1N5TlFZ?=
	=?utf-8?B?SFNtUGl2MDVhS1BXT1BOT0RSVDJEb2VDT1BWZmF3ZjMzVGVzUktzWlR5UDB5?=
	=?utf-8?B?bU8va3Y3b0M4RFZMY1U1SmQ5RWZjbkJsUXdHd2RuNVhabFVESW1vSk9tTlY1?=
	=?utf-8?B?aUpMeThvbXZXRlU5dkp2OHN1MllydEtIaXpUMTA1ck1sakY5bWxkZ0FKVE5K?=
	=?utf-8?B?N3hWRnFQU09HTllRRU1OajRxZ1RwZ0R6ZmRPSXFRTDZHVTRra1U4WTNQRStC?=
	=?utf-8?B?VjZEdzZNTCszT2tEU082V1JvS2tnR1UraVBERzg1QkJrc1ZvOE1LU2llZnpr?=
	=?utf-8?B?em1acFNybWt3WlFvQW1aQlM0ZXkxbTdEdTkzUEZKMUdsS0psbWozaVoxdlIy?=
	=?utf-8?B?ZzhJZzQwQ2JOUzk4QnlScGpIcmFNQ1ZKQW1qUTFjYzlKWUwrc2pTN01Wdy9m?=
	=?utf-8?B?ZlFLRXVrRmlxQ3NBRFJNRnpWR3NYcnBsY1ZzenAvUnZrUWNJSlF5Q2ZkSHFi?=
	=?utf-8?B?cWJDK0tzQkRDQkF2VkRlOUlzTnVlSnNUbXdIWWtpWFp2dUxPVHBIUDRaS1di?=
	=?utf-8?B?K2FQZjhNUkt1NU9icjdhODFUVzNVUUpzVjNsZU5Oai9ZZ3pHeXNyYlh0NWMz?=
	=?utf-8?B?Z2ZhN1Njc1RrOE1EMUlWbklISUtKK0NTeUM2RVBJbWMxR2x0bmM5bXlGWVI2?=
	=?utf-8?B?eS9DODV2ckorZ09KbncxR1c5enZXVXB6WnZYSDNOWWdnWXgrVVVYZFRuMTkv?=
	=?utf-8?B?QmVycUdITStnTVZoVW00cE1GMWU1OTVuS1lEeEU0eVl6dXE4cDRmcTFoMkFl?=
	=?utf-8?B?Y3FoeDVxaTNreFpkQ1hra1ozZlFRcXVFK2NSYXUzQUkyQWIyQzBKQkNkOUtZ?=
	=?utf-8?B?WFhXbjJCZloyL21LQThQNGFyelVhSVlDdE5xSmwrV1k0M293eUNUQi9ZbmVw?=
	=?utf-8?B?cDFsa1VPNnhkdCthYVRnSFd0dFlJY0Jnbk9SY2ZtSExwajZNbks5Qkord1FP?=
	=?utf-8?B?VlJxRVcvZUZWNThmYmVIdUZkaUZJQ2dMNWVHcnZiSWlqVmtBMFBZY2hDS1hw?=
	=?utf-8?B?MXg5YkhrbmY0Z1V1eW5mcW1ReVZEQnlPYWVhZ2JkQXBjblJWVmZFb1BsN25M?=
	=?utf-8?B?QWM5d013ZnJEVHN4WkdyY2tUNU03TnROU3hGQUdwdTk4Und6M0ZjcUhpdnhV?=
	=?utf-8?B?NFdSaGF1OVFxUEFMbXkrNXRFMGk5SEpHdGI3akhxSk5OSldKNmN5ZGVKUGk0?=
	=?utf-8?B?RnQ5dWNySStReHk0SjIrU2tyTTV6TGc5U1NLT1FPK1VHeHBIOXJURlBwRmpp?=
	=?utf-8?B?RFBjdmFTNkpDZEZlSDlBcmVJT05tQW9aZkM2TVVXSlAza1FwalptRzNFcXBl?=
	=?utf-8?Q?fjuYumDT4nV6KTWyctYwWxvrr6b2Zx6eICOm8=3D?=
X-Microsoft-Antispam-Message-Info: Buq/YYpj9DHamHlcP/VBAVu7lMbvBHIkCWgqG6u4CZBbD7GdCwV66k9J2IwEv9Mmg3qTyHmvzmoSJPBiJjrCkYAMtDXq/MSQVQmm2JnHyD/UMoGG3uZSwemEjfJRzd6+ClDLf8MDhTQe1qMlVN/lvNRcqPRDxRkeQfMYgXcliKNaNsE9AD81h5U1MA4Tv0Kb
X-Microsoft-Exchange-Diagnostics: 1; BY2PR02MB1297;
	6:ZfGKSY2ojyLf5g4afUoaniYjwYj0JaaWI1x2dsoZVoyboa3STGkAhyytgbRLi5SMLioOgNb1D1JJS21kvhpElOa5x3g4DKNgSkU3pcUoVCScX25r9R/gHaQuxHes3qdEPBj7kdGyjKwS/EjdNWVQ3gom782fRhjMmyvJzOql+ChyGLwJRIs6VZgIAnvBlp7omQKQkl/VvTw2nqKedmG9BVxki5d/bfnZgpw3rB+qjfeRC8XydfpY2brX3XzJ2nL5MmYHeWdC28F4rMgu0I6qEHCIHjBWEU4JlG7Hf7OJNJIKSWm3aYS/XRkIFEc8ZohVjAHuvNwUPgHtK+FW94Ah2ZFVURWVngVI8m1bedxRZWA=;
	5:fn7/+FA+Yuk7nTQVInFIT8AcLqL4HczO7f51g207kIZ5pLV4mET9RXn1pvSlgmiDW4Y1D8rSmGLdlmURhAp4pPL2QO7KqGdIVJDZXch3JXzfvLMzWeJ0hkL69HYynQZ3PnKamTN/AnjIC+ljjGENzuEqfXwP+wKCrSOzwLiC6oY=;
	24:3M3gyBwnU+O+dvDJaqyX+c61Hd1Ri3P3AfSGLIjB6nzQpmoOXcAA2mz0hLe5a0HlQrh9dw523ftcreHNcJmBD+xYge/1Of4gM/gkPNCaoBo=;
	7:+33NSP6mD3AaGeRuf6MxTqRVCZvVzXSaCaXn4q4zNrjMKPOPQ12O1DgwZE/ARrnRymDiJ4ljVOPIFV5ouMDR9kMinEON8OOUo8EV2fdCDkCf7IPjVSk2FsFPR1BBbjL2vBveXcOtZ01LSWGbP9mkw+kmEErEU1BIdQB4ZMASdvua3UaHGFIlTDG+0Tu1/WKiDvGuSSGmRXOajLadtBkd7ZOCUJlkiDgbEFUqE2thFnPrm05UkSd5YlMCOjuii/sY
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2018 08:09:53.3647 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0510a4b1-65ea-4b26-4877-08d584cbf925
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1297
Subject: Re: [PATCH] kernel-fitimage.bbclass: Deploy fitImage without Initramfs
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
X-List-Received-Date: Thu, 08 Mar 2018 08:09:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Martin,


On 03/08/2018 01:25 PM, Manjukumar Harthikote Matha wrote:
> Hi Martin,
> 
>> -----Original Message-----
>> From: Martin Hundebøll [mailto:mnhu@prevas.dk]
>> Sent: Wednesday, March 07, 2018 11:26 PM
>> To: Vineeth Karumanchi <VINEETHC@xilinx.com>; openembedded-
>> core@lists.openembedded.org; Manjukumar Harthikote Matha
>> <MANJUKUM@xilinx.com>
>> Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: Deploy fitImage without
>> Initramfs
>>
>> Hi Vineeth,
>>
>> On 2018-03-07 15:41, Vineeth Chowdary Karumanchi wrote:
>>> This patch deploys fitImage (linux.bin + dtb ).
>>> The use case is to have 2 partioned sd card, with FAT partition having
>>> bootloader + fitImage and
>>> ext4 partion having rootfs.
>>>
>>> Signen-off-by: Vineeth Chowdary Karumanchi
>>> <vineethchowz.chowdary@xilinx.com>
>>> ---
>>>    meta/classes/kernel-fitimage.bbclass | 5 +++++
>>>    1 file changed, 5 insertions(+)
>>>
>>> diff --git a/meta/classes/kernel-fitimage.bbclass
>>> b/meta/classes/kernel-fitimage.bbclass
>>> index 50a91e1..25884d5 100644
>>> --- a/meta/classes/kernel-fitimage.bbclass
>>> +++ b/meta/classes/kernel-fitimage.bbclass
>>> @@ -464,6 +464,10 @@ kernel_do_deploy_append() {
>>>                   linux_bin_base_name="fitImage-linux.bin-${PV}-${PR}-${MACHINE}-
>> ${DATETIME}"
>>>                   linux_bin_symlink_name=fitImage-linux.bin-${MACHINE}
>>>                   install -m 0644 linux.bin
>>> ${DEPLOYDIR}/${linux_bin_base_name}.bin
>>> +               fitimage_base_name="fitImage-${PV}-${PR}-${MACHINE}-
>> ${DATETIME}"
>>> +               fitimage_symlink_name=fitImage-${MACHINE}
>>> +               install -m 0644 arch/${ARCH}/boot/fitImage
>>> + ${DEPLOYDIR}/${fitimage_base_name}.bin
>>> +
>>
>> Isn't this already handled by the "linux_bin_base_name" variable just above (i.e.
>> fitImahe-linux.bin-${MACHINE}).

It is linux.bin which is generated at the time of fitImage creation.

- linux.bin and arch/${ARCH}/boot/fitImage differ,
- uboot fails to recognise linux.bin
- arch/${ARCH}/boot/fitImage is the fitimage.

Thanks
VIneeth

>> I have various fitimages, and as far as I recall, a
>> non-initramfs fitimage is already deployed.
>>
> This patch seems to do the right thing.
> 
> linux.bin is being copied as fitImage-linux.bin-${MACHINE} , and I think it is incorrect.
> It should be fitImage, which is generated in do_assemble_fitimage
> 
> If you look at initramfs case:
> install -m 0644 arch/${ARCH}/boot/fitImage-${INITRAMFS_IMAGE} ${DEPLOYDIR}/${fit_initramfs_base_name}.bin which is correct
> 
> Thanks,
> Manju
> 


