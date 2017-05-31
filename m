Return-Path: <chunrong.guo@nxp.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0138.outbound.protection.outlook.com
	[104.47.37.138])
	by mail.openembedded.org (Postfix) with ESMTP id 1433A77756
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 05:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=tQQB+1AS65A47doSPAKJa59lf4bOG3GNAs69ELCNuK8=;
	b=pnlv8aMKXnsMb/8D3Dlr+5YR/ZIRMcknY3sidZF1kh3PJq9VcTi3Z75Vj4zM3bLBau9Jq/xtc2NpGsJTcSJl8rA8YA22m6vY4BOfmO7FCdRKhUZv2rrF3JqPoM58kOad1nubKjjD3KcOqHXCWjfincZ057ye5a+0LU8SF7ov4lo=
Received: from BLUPR0301CA0030.namprd03.prod.outlook.com (10.162.113.168) by
	BN6PR03MB2658.namprd03.prod.outlook.com (10.173.143.145) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1124.9; Wed, 31 May 2017 05:23:14 +0000
Received: from BN1BFFO11FD033.protection.gbl (2a01:111:f400:7c10::1:156) by
	BLUPR0301CA0030.outlook.office365.com (2a01:111:e400:5259::40) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1124.9 via
	Frontend Transport; Wed, 31 May 2017 05:23:13 +0000
Authentication-Results: spf=neutral (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Neutral (protection.outlook.com: 192.88.168.50 is neither
	permitted nor denied by domain of freescale.com)
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD033.mail.protection.outlook.com (10.58.144.96) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Wed, 31 May 2017 05:23:13 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4V5NAQq016055; Tue, 30 May 2017 22:23:11 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 May 2017 13:23:03 +0800
Message-ID: <1496208185-25064-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39450400003)(39860400002)(39400400002)(39840400002)(39410400002)(39850400002)(2980300002)(199003)(189002)(9170700003)(48376002)(50986999)(8656002)(36756003)(6666003)(77096006)(106466001)(5660300001)(6916009)(2351001)(54906002)(5003940100001)(4326008)(47776003)(50466002)(81166006)(105586002)(42882006)(8676002)(110136004)(107886003)(356003)(189998001)(2906002)(8936002)(38730400002)(305945005)(104016004)(508600001)(50226002)(53936002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN6PR03MB2658;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Neutral; MLV:sfv; A:1;
	MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD033;
	1:GIy+Jf12kT2DkaYQ+UcncTeyWOrHgJlt78Ajq0IQ37RhVvDnZ1b6gR5TD7RFkylMCd0lzOsz5o0cj6SyZ43s8aO86y83QiacNMrXOjPsmoJ8hUhm3Ffc4VNrqdKcVXWtAC2I2HkqxNcbF3GZI8j0Lwt7bQb64wmwlWP2d8o7xyiFv0U7OuAqgNDLW4yHZPtr1ghU61NrNtH88i/h+Es+fal4rK8PM9+jqTBni89cvErflD6TVHSfdJ7TACQKfFYX2qyqJtnTatoy0HNbNrTFPpVPNd30WZc6Hh3cLfvgTbULZT8GD/6D2JXJfjOxpb5q0RLzKn55ZaLEiPj/X1KdWrurdO0yTWcq+p7XoAAwV473lwWcZUXA0FCCX2vC349jT00VGVP+6kLMhZoAwzC3YDziYfMTiNBQ2MknvOiC2dQyseFqrUc32FjL4zwfsS5q2hTlfW+trhD3WKTSv0K2eBneZiv2cH7gjU9HaIF7knJA3RybS6j2q/V5+wpwI3vKikuEDp10j1mBqvuMyZVsHQ==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR03MB2658:
X-MS-Office365-Filtering-Correlation-Id: 67d3cd1f-689a-46a4-62bc-08d4a7e52299
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:BN6PR03MB2658; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB2658;
	3:zKv+w6zSr+OJKdDzRJTOLjEZLC+5FvKPYPYTcWlvwZczxegwnIbTXbvNDib4RHa6TvyIKu9CSwiNuPbXkeufT0S3f1mCvf7xCuGdmZZ7usTO/61xssOXFGQeoXIG3gFLZITjilv1TEmW/k9r8jG4KZuOonDvPb5l6aOHZAGrg5cX5q3ulHdGtRicgIvQ+4QbmGKnYAPT8YubFBAfcr9mTu8YC/6ro1iO3hhRlhZP6Ll3lrpI6K8b7UFf72jcC5FhCJqQ1Vg9doNJR+sPL2omOq2UMKPEtsDwytBAq/pJifpRkRCNhjjUzfF2bS/xyLhAbJaXgP9GDr7hmszHyeUKTZSa9HMWQY/C3n3Jv32xqSscYlX+ag31z/m9p0So2iwW6WAevo8jTXfl9b7Us0BBFR/HClK4rrPdhBksU3LoZixstnoGCCkJReidSzo6MjfaQkzFdsWsgdnri9szmO5Uig==
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB2658;
	25:PIohU2eAv0ihSEgbV1kwIgrW/qTTlH4ZQG2QzH8caoWvvYvQrO56wmIjiHe183t/DfRmQkN58bpGzGEa2eEkKAWFlXlwllb7rUCjWVM4m56iM/rQ9llYHvIMxQo3yMMJFVH/11lkO0XAasG1PMkUleR9Y4fNGXjbGbSJYz6ZQwveEOujbSe25UNbJmv5dL5PMCmSmslN8vVS6le6s8a3VUcMP7xcn7ZbQes1NkI435l/PLrfOgjadAZEnMAqo/anTHRoyrC4vgWqKRkCk7brVIhFExhmlMzGQuQKI87zTkMbFxgb6V3QFDbGRUyUxHN09Xc3u1hHMWnlfiVff84OaG8FdjnGGYNILqkQioNRpNgsGPP4LPzmePD3V5K1pbdHAEuLpBLih65JFBkXy66F0aEeQmGo+Hatcg1YNAq3pGTc8oUrGLg4flsGanuHDCoehVe+rpzyUp9Fm1RDK8o9BjYmOl/FAOD9Mr1fJVRnsvM=;
	31:l7CWHttg6dCEI56kDplXlKQsULTvd5jqa2kQfj6pf5HQyl3TFdKnqlsDFMICAYgd+zwViOXEIupdOYwtqwuqfY7zPayZHex+uguzHBS2DdBK99hUCu5UV7QMInMFpdkTNJyRKIFmhHo+U9Fre9n/BsnJBan94SRfjPIhfysEGYvkS3+uNGHLWSDZqbsHLwYXfe658eq1yEcLVU9sDpJhiPqL4gGZtE09nMGdt2Wgb/eE4ad+XRa13ZNFK7vmLkqaHupYZ7QjNq+coQSqr2nqIg==
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB2658;
	20:VsHx18YCGk5YP1YvCFE+5VMXgs8cQTWAfjBR+A8CLOtRIHFEioHdfn3G/Rn7fg4jbpd0gKzCRkEHmF2qZFETsI09g5821SkovMxh4H+WH7CbmPoFADEw0pHa3vKu2574uEqQYLYAJmfevbIvpZpctU7+XhV5KcIXqI9pZDKWaSmz5aMwlHj4MQy1ysCMyp0mB3mAXh0WLE0s+j+ka4pviKvRHm3Avj62oyYdXTXjg/MuBsmSQLuuE3GncFuJyOAUD0SR3L3pFHobIjOrbPjnIaMuYl87ONgNgdTPeUIKhmTDLBMuYbE7tW/3qh0RWWPYrU4QCo9cLdJXqXFm+tOI/LiwfeqBAddUEzxsJa60TdEJ19dtTY8pQv4ppAx/6+9FijkKyUFSQ3c/gSDJIqechVRgHcgvgl3DU4/g4xIJMHeQwuXayIFvI87jhDY4J/pJjwu+PpHHN/3jsru7IGSuFaS/HK5/55n3AUtLqwW+aNQgkTNBeYqaElyA7SCpVcykpNRejKNrynzhL7kdrnLVN1zrZEmWV5Dbs4AfEqBAdRjBfuOfnXxLUhPUwUdRymBfB4Tcbkr7ddo/qmgfxW57Al5yiM85rMS4SqRy4KM48n0=
X-Microsoft-Antispam-PRVS: <BN6PR03MB2658C2B1D03E86C0F632E2B684F10@BN6PR03MB2658.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700073)(100105000095)(100000701073)(100105300095)(100000702073)(100105100095)(6040450)(601004)(2401047)(5005006)(13018025)(13016025)(8121501046)(93006095)(3002001)(100000703073)(100105400095)(10201501046)(6055026)(6041248)(20161123564025)(20161123555025)(20161123562025)(20161123560025)(20161123558100)(201703131423075)(201703011903075)(201702281528075)(201703061421075)(6072148)(100000704073)(100105200095)(100000705073)(100105500095);
	SRVR:BN6PR03MB2658; BCL:0; PCL:0;
	RULEID:(100000800073)(100110000095)(100000801073)(100110300095)(100000802073)(100110100095)(100000803073)(100110400095)(100000804073)(100110200095)(100000805073)(100110500095);
	SRVR:BN6PR03MB2658; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR03MB2658;
	4:SWJRZSYCkJLCHXfzWTaJQGZh2wJt5vbjzF+v98nxu/?=
	=?us-ascii?Q?UUoRaihVYv5gNnHCi70As1UUyhAKkp3eDwgF6jada4dND59jZhwr224LtLKb?=
	=?us-ascii?Q?lniM3izsjZbzx4j4qMJ24JN80ytnjsPwNwWiktHZJtVu9JVZF6X+tEk/JyN0?=
	=?us-ascii?Q?ercXVsSPXT889D2uKehFLddxsrWnb+GR2vHb/lxR4aUl+avqAyqcRQea9GNA?=
	=?us-ascii?Q?kjZa1BmDjAH21NB/2Sq3VuxXoWopt+owX+jVQAIegaaANLKlXqAQbcmWWNOP?=
	=?us-ascii?Q?rIhx1PizL/ElFFS+oJNMUeHk4XWl8U3/FU83EX60o7aqht+Q0P2jZSfMMRHC?=
	=?us-ascii?Q?JE7i6dKITl8ngVC+m1ewOu9BZT7qdf0gMTn4RXXcpjN6pdcjcXL7EEXWLooc?=
	=?us-ascii?Q?AiJX8h8uZLep/VxomBDTqTaGn9SusavFVFiZmUQmDG6ZD3Za80ko9bBLWfuc?=
	=?us-ascii?Q?ZGTnB0B5qg4F7WDEhNk/cWoGeEqQ4SpZmCM5Kn6VyOPNsWr6VbsaGuhJdvME?=
	=?us-ascii?Q?ShVwsnlda4ni0Ro7XBsFL2pkyruk9/SkHTzAIIynvFjG1nU4fX/5JD38M26j?=
	=?us-ascii?Q?aiunm+aOpaOgE1MaWSG58RjdwPg+zfZoar5/0xYKvfF+JOvIzhxAMklVJpRd?=
	=?us-ascii?Q?FF+T6YkD9cOmGrRtiZKSybl++mKXZWt9Lr323nwjPP+PqZ2bBGLggIiHY7Ql?=
	=?us-ascii?Q?zVfN3/9r9DyhXzZK7BLwfsCeFVLCAjf4E3vIPoq4/LwtZLH6nPoWO5RlP+Bg?=
	=?us-ascii?Q?xHNDd6AuO8EihqlbEDwEU2tWFgt0AF/ibUNk/9nqoaeKbe8aAfu6Cck2/0XX?=
	=?us-ascii?Q?s8UZkG/lsivyYYxFHCe6I0K/yZvKVrmcFUpJQkxtN5Ssef3vkpI1cFtdG9iF?=
	=?us-ascii?Q?32rrhNJFq7B2uOGYYPe0UfeX2fP/xkbhzMi/0bzElj9PqoETPzNK+Pc1u0QW?=
	=?us-ascii?Q?9U5sHCNKMNlf/EO0F/otRbK8w1doxHlSeiArVb34L9UZlJYp29hfrvOqvG5A?=
	=?us-ascii?Q?a0lY/E7TYRlE9O6WAEIj2e4lLtA2jzxmi5tLbjBOXBjwwTF0MaXjcf9D41Ag?=
	=?us-ascii?Q?/V3x+zeu8r3YQaNwcip0cAJtSIz5WMW723/qX83q0nU2vIvQT4jGiV7P9r28?=
	=?us-ascii?Q?p+OzYNlW9ehHCnQyr4diU2ezmEbd9cnBJtkp4bpqMkkbTGF2kkYslcUxtavT?=
	=?us-ascii?Q?Qjybqtyt12IcsKeCEJVFIL72IBu3J1R4Y+Ip3oAjlA0JYfJTXNxBbr+QWGS5?=
	=?us-ascii?Q?x6WBP/nNFz6mON0AS8vSWspPVNRdTJq2WSfIZa?=
X-Forefront-PRVS: 0324C2C0E2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR03MB2658;
	23:7Nzqh+bgkW5G1UqYSwO6oFrScZ7ppR3U+Am3PFrSr?=
	=?us-ascii?Q?lcCD47YcR61+JPHZI46lIjKaScjIHy5VZwCbl56z4kICuamljpzQrVHvQnw0?=
	=?us-ascii?Q?MRHitILuIiQwRh/NsliLGHhHdRyGxZ+IZ92/jNXUShvnYF6QYfbV+BaKC9mA?=
	=?us-ascii?Q?l5w0uD0fhbKtCJDoAAa25G0T6C6Sno/QPnE6oM665dIh1CAdu/AIHZt34JGC?=
	=?us-ascii?Q?kaaY/cxLSDhSQEY1oz2KESV2kCfjKYQg69RRfTOjeZ3zOAQ/nqrQxkV0Z2kM?=
	=?us-ascii?Q?fM8p8oY/H8niRUB26oLZSSCvvR/sAqE0i8xgJFLcRcPSs+rwUA3YYyLRt90K?=
	=?us-ascii?Q?D8aYvB05nsFXaaS0JOLQEc8XcA1vlJ5fPsI8RJTn6eNUafNN6e4sfSX7QVNz?=
	=?us-ascii?Q?0ywxZBUeXDbgCBSbG6iYvD0dpZh2aawXtgrEBU3R0l66XPxzxAYnH27owZTL?=
	=?us-ascii?Q?+FEmTpiCs4JsNcXsK9FhbTZiMbP/WZPkvE4XckoEdRZibodNhuWrDhNEbrb/?=
	=?us-ascii?Q?Iy0k3/uwZPgkvtgaIx66EyG1tMEvJuXrToz8+rNwQ1UwO8sj6i/+kKIj+8nj?=
	=?us-ascii?Q?UoSfZab4k+lNdHBAmkL73vgEG4JUqumum74gAWg1hNCOz+r0NI46y3yLszAy?=
	=?us-ascii?Q?pEfuL2iNm86p0MP9yZJrMQdL/jA7WvR3FPjhwoANDYbszN4RYzXYffHXjAOA?=
	=?us-ascii?Q?ZWPaGdrp1bdcQNgXedae4palkHKem8vedmRiGqgAamTOMhTkW3UZLSuWZFBX?=
	=?us-ascii?Q?cegbx9RqBLvI0ka71QzLIJVoPncGMorNQlZNZX2m59MxMAsbdFYkIqD0UDRw?=
	=?us-ascii?Q?oAasKjm0+Tz89vyy9vQxLaGhUdSgVofjCizJdeu9mbSvr2RkRAJSVJE5TDd3?=
	=?us-ascii?Q?RIgUNco8GGxzruCfp+MawBy04Ss095oO5LTavvn3k11klqVXeVTYYzt10mzL?=
	=?us-ascii?Q?4KwhnzKzqytabC6IyGU1AnNtcyCQxL5Z7mMLIfVwIHzC7pb/keTgLlZovrCH?=
	=?us-ascii?Q?osX7wFsUJLF6e5hnj1ApP0pzheyQA1d3xCr9f1L2pspoTO055589FW5SVVju?=
	=?us-ascii?Q?KOJY7BZAq7x5wY6bM6GGX7pGAmp?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB2658;
	6:CFbw0+s4yLGoG3nV8KKCnFQGY6uTEhIMT+EM9fRyPA0skMwScPsUP8DijUIRPij0XPrNRmepECvN7VOWYV4eShcgMv2nkG4LuNccsXB+aM5LNvzvbSLmiNDNg5fZIApK/jeH9WHVgXOX0rle7PVGGPJRiOcEGlXXcpvLZ/XzaPI7NoDV6J1INR460immhPm3nnL299lzjxBBU1Mx4j3QZWyj+JtN8/F7QTdrSlFXC8ZEXity4fV0kherpzguOZYnxhmG/wRtQJOSF8js5Sf1Nkq8jxTIL6c8y50ojMndjkcOF71jbGB/xdbKQSKZhVTbjPpqFunng2CLCQVdZS8/KgAJ8OktoFRkGXeAMe10Ua34kM/CyiQjvNrMj5Pon3+iar7i0432feRFB8KAlDIbH1JMELUNcCxNZ+tvfp+jH0uVnXXXrEeFOgO4dQoTBQiOaNBcoyWeMI0IWwjZSQmsJV0+IACJFvUDGEoTa3A61+RPSmLCdkgFKAObGbSd8I3N6+eM8i8NClRj9W7md+abvg8Kilpq5NytlePsJfVLS8U=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB2658;
	5:Ig5YaJ8McB6oYPSLF23zqVXp8fpIIX5UrnjiOx16xbGV1J7oJWHcIO2eoFGywhOQ+84fXrpVcsaazldBCAiwE+n5PWgkcBtINS8bnSpYR7RplNQ/lCMQ3Ygqh1uph69JVVP+2fhPaBZzRayQFhLij9l4hpLmq4bQkZ+jWPUZjPVp2giQTtu0N0D8GAMlT7lhHZYnGZuk7Y52y2qOrmvu75R82KHZc2dYv0shPOelOiEFyZaj0Tlu0EVpXCsqG2Fn8yBLXm4drcCkEFkhcRGX2TNF2GxXbBkVDygWRA90uvjLLbhkXlaujcpvw6yuJ+CSB+kudm8aj5gpDe18DOptG2AIDcOOSDwBmTSXucL9BDyMF0ivo54u6QO30RWbk9gM7XyVeOFNfNnIB+xVo5Hbu4bmBY9lK/Pk8tnzDSqGRUDfMf/85Bp4In8lRbmX6EJgGc7BIJH75HSXdKq6wpaEhCSAAWGauO098gYXWd8EpJOpzYHJ0yngMDSs893nA6F8;
	24:lf30/vj3nEr9meGD51x5dXqddWialkfjcmvpFj+fvVmtnwutr5toN1TBiJutvbV9SZS49QQ1WyRV5wwFqqo/zZLXeoPqBw1kvu3gLt62mzs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BN6PR03MB2658;
	7:4891q2+ITFvCze0fYByHOWez9YCDqg+vfiXIllOSrkbM4phzJ/jUjzeIfP8JEujU4/DhBD6sjh4wacW2tOwXlkWI9An2hF/ydvaddPqKeTHdz6YDrgrPuIki7cIrezNMs4TFtdVJ7Cgf9huDKHllxE3FzNsP/fZ2OdnwKJLpSyC7h46u1DAkvwtX5cNP66ljH+saueX10qvdPv26SkiP3Q+I/4BoGCNNSly8uYaAPzvigdXPzHF59dNBEP6i2fE1nh0SYemSigPTfKAU6LKS8sxTtDS6AFk3dJ39vxk0Ukur4qd/gp2tj0uJVIqSdlbHOYKazC1F8Uzg64rrE+456Q==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2017 05:23:13.4037 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2658
Cc: chunrong.guo@nxp.com
Subject: [PATCH V2 1/3] kernel-fitimage: Support ext2.gz filesystems
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
X-List-Received-Date: Wed, 31 May 2017 05:23:14 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2630b47..f40fbf3 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -369,7 +369,7 @@ fitimage_assemble() {
 	#
 	if [ "x${ramdiskcount}" = "x1" ] ; then
 		# Find and use the first initramfs image archive type we find
-		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
+		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz ext2.gz cpio; do
 			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
 			echo "Using $initramfs_path"
 			if [ -e "${initramfs_path}" ]; then
-- 
1.9.0


