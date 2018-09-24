Return-Path: <jhofstee@victronenergy.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0137.outbound.protection.outlook.com [104.47.2.137])
	by mail.openembedded.org (Postfix) with ESMTP id DE73A745ED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=VICTRONENERGY.onmicrosoft.com; s=selector1-victronenergy-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=ouQ+fNPsZxOQr/dKpxiK+gp1WeZZtotQPcXM9XtnGaM=;
	b=axn1hWJWKHsekchXD9HpViqZv+lIGMFj1208U/7bZslwWUIH5yUchSb+GpN6qK3wwdTjryy8ZdcmO9VPc9FaVGJDXLO8lvm7MZwBdUfmPV4iGk+nJUu+TJLWRDV5MCemJFSCMo95jz0EkcWLRaeudN+ETXv1JN6BLhZSiVwQF8k=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
Received: from [IPv6:2001:1c01:3b04:4900:8da0:c385:7971:a200]
	(2001:1c01:3b04:4900:8da0:c385:7971:a200) by
	AM6PR0702MB3637.eurprd07.prod.outlook.com (2603:10a6:209:10::27) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1185.16;
	Mon, 24 Sep 2018 19:22:05 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Message-ID: <1b958e43-01e8-c958-7c5e-1f5f3aca227e@victronenergy.com>
Date: Mon, 24 Sep 2018 21:22:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
X-Originating-IP: [2001:1c01:3b04:4900:8da0:c385:7971:a200]
X-ClientProxiedBy: VI1PR0901CA0096.eurprd09.prod.outlook.com
	(2603:10a6:800:7e::22) To AM6PR0702MB3637.eurprd07.prod.outlook.com
	(2603:10a6:209:10::27)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6843e57-4410-4918-c25b-08d62253036b
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR0702MB3637; 
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0702MB3637;
	3:LcCbEXUWpr/gZzgW9mTc6xY4CqjoGfAUMxu45JCF37ZntF7zDUWEgvlAxJy27tKvbq+0RaTwxkrnBT7qakVN+ia5jFIFREqna4ESAaCHS1ohPwrTxVwLNc7bKPJCqJXz7mF01t2VItGENEorZFomoaSqHqsfWA7tWq3VSLNj86kSz+BpZW6U0pSc7OpGtgxru1990qiN9N4rfsP8kjMmTsJ8sZZgc8kaNsrW7iRLYMBpulktqlkHRchdrIQQNRpo;
	25:FeZm3TgMOvJhctuTNiIlXURXb2JEBrb/yr3Va1B4Fzp7nYJc/AATWBEsBVX4G53/ZsjySoIDYSFuKuG4d1VjkJspEGdzi9A51gVLNfUtn3t5oDcDu2T8oQaSjLLVfG7yYskyYuREcFejVmTkmYtAy9MLXwHZGIRbvwa0/1l5l7usA3iZHOiCunMR8+gRra1scpLJYCBpWGdTwDqfrdD5tFHeIqvNaK2kU0j9VHHzsaC9O/L8BHwBGHHS6Il7CnmN3cc3xkYbfL9ZqXefznQQdYCEvPgeu0BFmpEfqaZ0WZ7kKAKTTH7tIC9KXB59RqdAi8l5fjNjBRuhwTMapsO25Q==;
	31:6cr02WEgd2rwhdqs4x39a7B+1MdMx+CBf86FsXEhlkqdMsq856IYeR6lijVlSiRq6/6ymJOs1kCDDXPDIMV7UKwvMgh5XQUhoavwM/4rSsolaL1kRoLfFg20Vn0k6rgNu156g+G1oBVHyFci9m+PheZSO1eqxWO4YBL/cHKzChWhx3QKEQ9dwMvkQTBRfsbT4n2Wjnj59dXrujyTV6Zl6xbJxHf67RxG6m1RrgC4Ro0=
X-MS-TrafficTypeDiagnostic: AM6PR0702MB3637:
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0702MB3637;
	20:k98hcuUwuTGcHQvWLtRHOtgfgcBtX9KUCpKmVrjy3on13Bo1mM3ylB9RouBtDIQrvHFY9hkdN0Tha8K8n9fu0r+M01z9+rZlkKXGfxX5UJbsBzk181VdE4aZRsTAoDRMeZSYpaYt08y6zgO1O7ZP3RYGKqMgEfCCD6tnhPsqTWgFwssy8oAX7lvWZ5Fu8Vgpq9qPJ/NPGeUK2j0EkJnxwbExunsvPyA3o7qpdSNUe81v2TcQok6rqY6G/CtDj2p1;
	4:Aic3LDtJDI5QpQSP/4fKKyTzXU1SME2CszxQ8keu/Z/tC2az/IsC3mfqY+YornIkiELH7oJOyFOC85P6k3VrKj9CZkCEBw5AKuckiGrORcKzAqzOiqsRpf70Cuhl6cUmlCDJvGs3JyLgOrnn/ZD4NQS8FiFB3xeS9D8PUHm/1ScR6KkRXH7F5J+KEhQkSMp4Lark+dU7VM+LYki6V0sIxqQrg4akeVJxNRsZBZrO7YiWyzhZ5yl8jQ9Q4KN9lncC4RFK272t36Vlk4TN0MX4uQ==
X-Microsoft-Antispam-PRVS: <AM6PR0702MB36377054B05E91CDF5D6B2EFC0170@AM6PR0702MB3637.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231355)(944501410)(52105095)(93006095)(93001095)(149066)(150027)(6041310)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699051);
	SRVR:AM6PR0702MB3637; BCL:0; PCL:0; RULEID:;
	SRVR:AM6PR0702MB3637; 
X-Forefront-PRVS: 0805EC9467
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6059001)(366004)(136003)(396003)(346002)(39850400004)(376002)(189003)(199004)(58126008)(1706002)(486006)(65806001)(476003)(2616005)(386003)(52116002)(67846002)(6486002)(47776003)(230700001)(46003)(186003)(16526019)(65956001)(25786009)(31696002)(2906002)(52146003)(23676004)(52396003)(81166006)(8676002)(81156014)(50466002)(86362001)(2486003)(53936002)(478600001)(31686004)(68736007)(105586002)(106356001)(8936002)(36756003)(97736004)(6116002)(5660300001)(65826007)(7736002)(6916009)(305945005)(64126003)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR0702MB3637;
	H:[IPv6:2001:1c01:3b04:4900:8da0:c385:7971:a200]; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTZQUjA3MDJNQjM2Mzc7MjM6YjBsNmRLcFNLVXFRNDNGaU1DOXNMSzl1?=
	=?utf-8?B?SlAwWjU5eDVCdFNibG53bi9yQ2dBZ3pJM2cvVlZnYTJQWFhrTk9YVVRFczN0?=
	=?utf-8?B?MVd1ZVE5cERjZm1PZmd4Nlo3RkNsdFRJVk5BMUhWd3RXUXJrZHlQNDZQVmpX?=
	=?utf-8?B?YXk3VXkzOE1RNjh6eCtvNjgwVVRtTFc3Si92OFBBUm9wd0l5SmpuOGZ1Z0NH?=
	=?utf-8?B?Z3BBTGVjQTQ2R1lmeFo1MjZXaGE5SGRSdVUxSzk4WS9wL3M2U1dyMDR3Z2RW?=
	=?utf-8?B?RzU2KzNRNGRBZ0dBSXZYa3VrMFhsbHJ5aExlTyt0QkgwQXBkMnNvak1VUmdr?=
	=?utf-8?B?TFJmdHNKUENmbDE0dFhqMDBzMjVGek42dzdLQ2dITGloU29KanZsbW8rdkt4?=
	=?utf-8?B?NlNJVEVMSjZxMFBkS1N1ZjNFbEJtQ3dLQjA2RnVwMWRhcGFtS05yNWFmNnZU?=
	=?utf-8?B?dk9BaERzODJMZFJYaUxTblZ1Vmh5a2xRR1JrU0lCTGNkVEJVMWxZeDUwc3ZB?=
	=?utf-8?B?eHNpMUxRRWlFU1A5dENrZVVIdmRUVmMvZTB6MGJLaGR4WXNoeWZDcXo5Q3VS?=
	=?utf-8?B?VFptUWJWRm1zUGtmRGV3aVF2UUVWOHp1Z0YvL3M1Ty90SThXdURxQWlVR1d6?=
	=?utf-8?B?TFNFb0pEeVJHa2lDa2lIS0JabXpHeG56SjlxNzA4bVlHSTRPSS9CZG1Xc2hh?=
	=?utf-8?B?UUxHV2FmbERrb2xuMkNIYThWZlhVRTBVTldoZCtBZlJyTjZKY0ZOTXFmNU9K?=
	=?utf-8?B?cE1vdEtQSDJGNkpxWWZpZEtXZU02a1E2ZEtDTWJuRjNoR1FCTzdFcjJDK3dF?=
	=?utf-8?B?NGVmc1NaUXR2bHNNbCtZdzNEK0V5SXdIenB1VzFGOU5hYitVb3Q2d0h1M1k3?=
	=?utf-8?B?MzFFTW11OXp0bktTd0RhQ2MyNzFXWFE4NU0zM1ZnQlFXSWdnNFF5QVNBcGJq?=
	=?utf-8?B?SVAzcEFldFNoS1FOczc0R0tNNGVicU5Sb3k5VUJUcEtoTFFoN203L0dFSGxu?=
	=?utf-8?B?ZllJbFRuSE9iL09xa2FiVjJRUlAyUTBJbGNWQmd6NVA2SEVodGkzS2c0blNm?=
	=?utf-8?B?d0lVVDdqaXd4c2UwOU5TdDBCOGN0dHVXVXhZOVlMZDVIWHluaTU0eTJod3FN?=
	=?utf-8?B?aUlzdXFCSW9uc1BZTUVVV2pOTEZrTUluWGRMV2xwdEVtekEwK0ErL2dpL3Jt?=
	=?utf-8?B?dEdlbWZ3LzVPMk1sRGNTQnpDQVpsM21IZmRMZWRtUk9wSkNNQ0JWV1BHcVJa?=
	=?utf-8?B?dGZnQzlWQXZVSlRPL2lheldtcy9oZWsrWHBFcU12bWNVOVltSUlrSGpqZU9q?=
	=?utf-8?B?Q1hqRjVkN2RTUFNkZzd1S1R6OWpMaGhPTHpwRVRCSmlqY0NqTktJWkt6RHlm?=
	=?utf-8?B?NFp5YldwTE5hT01PZzdpelVTc0hjKy9Ua0NFdytuV05PK1NjSmxFbjRlQk91?=
	=?utf-8?B?RVBwd0NFRHRucFgyMEFNeW5YUmU2dnQvbmhZK3VHQ1I2bnhvcmxwYXEvaHRG?=
	=?utf-8?B?MXBadkFkcXpKeFQxd3VzbUQzOXhSZ1MySXVsZmZXaFBaSXNXSTBNNDk5WkdC?=
	=?utf-8?B?MWoxdW5YaEtySFE3YUZHNzY5dHA3Y3hmRDlKK2pGM1FQc2Qzd1hFcW1zelRW?=
	=?utf-8?Q?NfzzboUsnu2aRHryWZT586?=
X-Microsoft-Antispam-Message-Info: h7j2v/fvgh4sq63HGm0ArSydTewBaMs0YPW0eToo+IVnmgKKkwyluZNufPB7S3HSwJ2Bb+AYMRc1hWQ94pNuFrSRTxUE2Oz0INg9BsIZuS3MwFqkyiJNVw1LsCRs4xmIVjFyzPkWxdjgYIPqJ7ZL7FcI2aoLQ+3EBf3kijKATY3fgIVtAosAoMVt6BQqkNxYDftZNKABGa+LxhyXrKGM0MvN9XYyYUjpHjkQF7tr7Lr5wj6Q7A+z40061cXGDApITM/EfHlQqkJfcdiXFh+9TepH7zEaJGkt1r1muW3dQ7n4aKlP51r8/wl+Q31v3CcWIDn+mEDJQt2n1eI/r/jAeOt13D8/JQji2EiXmE/qeI0=
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0702MB3637;
	6:pszuiGPw1vOlv4pNFpHq4xzXq6Al0GQlqtoIwhXoNaMMwFB8wmU45XJLclCzWXFAVBPgS7fyYqiy+WJVszU2QcyYsIvBB3FxsgNCjUEUD+AVc8rmE/cFS1+azX0N3+WkbNZVLlGc4s9CXEbVkd/HUnnIYNurdE6rOVsZzF96naV4b9TFjVPDX5JjM78HnVYSR7CgE70gshF6JXXqvBWIv+QWvFifPRksHow06ySlrYwC+ScypAgk1HKd8PoeVRdiD4YOKXkRdUjqGFwmEmMafHRn4cGFptrq6XBMKM4flv+KMjpMZZ+fLMWJx31NGNOqk6Bi9Wti27rGS0kuR5Ym6ge5J+fDw8Q6Laz4H4L5BCLPetIPuadqod4V2SPWd/o/O7R7j4bDJF3MFg6H892qF3jMJeqzZg5PD/N6v7U60xHGtvHh1AiDZMTDQtKXfyehG3ryhImxT64E+RY+QdBrEw==;
	5:jccUXnBhxydJRwgB/n5a535BxuDQghBWX1sAOaesfllA6ZoIkLBQ1xLBbH5eN6FUg0aGfxSIHp9uElB2caalD/hLHyjHJyfXeEVFGEGshyYPq1ORTfIQBeR5UU9/KJpi9GYDkxB0TgfsPLnnZ575gbg54jmFCV/1JOvIG3EHrc8=;
	7:/yTA18bVEgSYT/aO8XfydVdL8QApBQ9MMrlh2UWYSc+jw0eQNp43m+T3pZcx091wKZLiv+dVkdGvL63unpB1WjrBSK6YHCYWkgCWYYJjRdn8FH8HYy6tXUzKqVfaK2MyHsnHH4j6pqqpIbI5bIskhAklhy+htglIR5Lqt5J5njOWttnEhqVbsxTx4iFEdMSJEZrZeoNsGBAHrACI423UWUrb54dDdD4Ygka59wbCKtw9/05T+Hhji10kAjejlfMo
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2018 19:22:05.2965 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6843e57-4410-4918-c25b-08d62253036b
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0702MB3637
Subject: python-sqlite3 packaging
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
X-List-Received-Date: Mon, 24 Sep 2018 21:54:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

Not sure where to report this, so trying here. It seems the
/usr/lib/python2.7/sqlite3 ends up in the python-misc and not
in python-sqlite3.

This causes statements like:

import sqlite3

To error with ImportError: No module named sqlite3, when
python-misc is not installed.

It looks like the python2-manifest should at least include the
__init__.py, but the logs suggest the manifest is generated.

Perhaps it is easier if someone who knows more about this
looks into it..

Regards,

Jeroen


