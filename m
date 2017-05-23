Return-Path: <carol.zhu@nxp.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0068.outbound.protection.outlook.com [104.47.41.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9373477E8C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 07:36:01 +0000 (UTC)
Received: from DM2PR03CA0009.namprd03.prod.outlook.com (10.141.96.19) by
	CY1PR0301MB0905.namprd03.prod.outlook.com (10.160.165.16) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 07:36:02 +0000
Received: from BL2FFO11OLC004.protection.gbl (2a01:111:f400:7c09::194) by
	DM2PR03CA0009.outlook.office365.com (2a01:111:e400:2428::19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1124.9 via
	Frontend Transport; Tue, 23 May 2017 07:36:01 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11OLC004.mail.protection.outlook.com (10.173.161.188) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1075.5 via Frontend Transport; Tue, 23 May 2017 07:36:01 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4N7Zo6f015402; Tue, 23 May 2017 00:35:59 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 15:34:20 +0800
Message-ID: <1495524863-28699-4-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
References: <1495524863-28699-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131399985616225316;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39860400002)(39450400003)(39400400002)(39840400002)(39850400002)(39380400002)(39410400002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(81166006)(106466001)(8676002)(5003940100001)(76176999)(50226002)(8936002)(50986999)(104016004)(498600001)(33646002)(36756003)(2351001)(6666003)(6916009)(86362001)(2950100002)(97736004)(575784001)(230783001)(77096006)(305945005)(105606002)(2906002)(48376002)(38730400002)(50466002)(6306002)(53936002)(4326008)(189998001)(54906002)(47776003)(110136004)(5660300001)(85426001)(8656002)(356003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB0905;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC004;
	1:sP924352OLKRlVQSXM8enAprB4LmvQK3PzKUCrA935ZZPT5XpK9YRitYgwanH5DVMxQ+9vQruLDUL53STTRAx8qlhTcsWw6vBmhDg2qnt6JIlvpUIMK7UuaV79iph1hdytrRyZNDMDLanppoLEZUby45r5FDwRtqUajdnhV/nBo1uTGoitD4jCdQEWTj0J3Nk9NYMuDHFVVE+QosjAU/IP3zyGX0EUbc95oGuDqHZq3hQYCvy69N1R5KZZlcL2/wMP3aR+1WJKYJPOcCxGNI8l5n9i7YDcDqwZz0NoZBCZp+KC8NwjikAYAaD4FTeVN5kR7BzvPdg9oLw1+KmeIk9elaOyeCaXOV8IBG/QUNdcwR8T9ef9YGQH+VCcmQmQKsu0Ikv0MJClNMUzoN/QaKqOZ+eUsmPVjW+gDfFhoxsgxPuemfCAoGUQCQ7IxWngNRUjWuQcJ81RwHfM57kDN6YCNnbnhOBem+ddnA3AOo6Eyu478sZnWXufjROcs7k1Y6QMNsFZlv2zIIGEUerERAUelTolW/Naic+zVuKM12WksvcQr9kGQOicm+r9ZzZZ7wbYXfmechdLk4CN1Vp5fFZIRSsAw2dFLCm9s49HahzsAz/N7q1bmXGtuF8qZO1RoQTyWzazLmadZvYy0+IMfmuX2g3rTyC8aoO2kkhuaE/iPZSfcuIi8zGwt1EnzGbXUtwN54E8otT5m8nSNJwvQ2eMw+qGn+pmz/jw1HZmgQxPdpEWaUviqQgq9NgXTvi5Vxf0dIkKy6T3qNjbD09hlGEg==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY1PR0301MB0905:
X-MS-Office365-Filtering-Correlation-Id: 86c26d30-58ff-47d5-22c7-08d4a1ae5c9a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:CY1PR0301MB0905; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0905;
	3:48obs7H5xwAT77mOVU3CKM72oDah8EoJV4WPz6dHpDb0ROrK1fZUNru2JBcr41M2Ojw6hfzwrwTqp1oc2jaTcrj3jvBQj/7Uq1LePO8cAMVfUvstF4G8tJ2NTCNXvpPsUXtnHss1YefgWoDTnhgVj8B0CH7K6Jx/qurApFEh1c4JZ+EKPv3WLtLvGn6deN+r6mrBei8BUzOwnJQycbht2NpgL0oBQ5/yPFJhH1oWCoMmyPFh3PrX2CZ8NYZfdCbH4fDCrR5giBn33T6j0Y2eysCiRCpa7j8clSp2oIPERunmL18qxtp0bBQZgZjI5f5gkZUyNOWeoGbZoFZ2nVvpMBV418yDqVpFH4wxsgfc7iDP/0BdWl+kr9FVEcsjhUinms26DCQa7YpJNHRvnZOIE+j9bNnpzuTcL+NceAnQuE3WqhVwgOZLfOKyCrmVBPbp;
	25:oxfU8vcVcUXE3Qsxj5NuvycNl8jynLsJLedgDxLXBmaAM05AwRtPxUX0M/TdZwU1jzzKxPUdgfS4Goxl/DJAeTZPeCISTkoO5+uM48esiIaviX5sRC7TpHu47YrK2yzntoEnf5DUjU1kWFuT9DKw34LOJI1melMkRJaYqudBfjuobV7LL3AmPtjEa6H/Kd3+xI6gj7iemAM57/2NduNuVkHdrin9NLDl5Zg9tF6UmWx1XY17JjHE89VBC/RnSzw4mcron/Im9mdxCAqEOIbp1tJEx3SNLjnz+t7TUNNY9x7OCYmNNjVlMNzeT06uy7YRuTc06qCNos5XurB74iqrfS/LorDyGLMDPu8bIis9/hMWvYWTT24wIu5OyheAyeULUE+oPLIDvocilmN/4wsCEJESNrw5XrB3oRFCb7v/RKfacckTY05AUvworFn1Mvx3mJ8WPDT1Q36P+zeKLzBjypFp3FKJYA5DsNJlOtGGp1A=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0905;
	31:05HerQASaqUJeOIavre6qjiSY4bv/DBASKhHhMc5+6zJw8203gQbNPSgsqf0fPbH8pVZBHW0nFiVkNDExeGpYI2vRAzCXkP5iOvOCIuLt5CIIrXhdaCO2u8zfgLK4wCAxrVbJVrHWDbrA9XdAGDnvbJSNmo5PCQn8szfAEWGGRWPnsJOJ2MdopafN8leUcT/9MWDvXG+cv/iQrO5Q2Tqsm4uiKm1iGIhLKbeabowZRSnygc1nQjwaHOKkT5ya+s0
X-Microsoft-Antispam-PRVS: <CY1PR0301MB0905138E20F2FC36EE2A2D24E9F90@CY1PR0301MB0905.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13023025)(13015025)(8121501046)(13017025)(13018025)(5005006)(13024025)(10201501046)(93006095)(93001095)(3002001)(6055026)(6096035)(20161123565025)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153)(20161123561025)(20161123563025)(20161123556025)(20161123559100);
	SRVR:CY1PR0301MB0905; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR0301MB0905; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0905;
	4:eHkSmStl5Ff9WNJlLzGtCRsujPmaG44Ui4r+aovD?=
	=?us-ascii?Q?DLcNw9VvmRAtABCZ92oIjsSKpprxvLlRP6978hhZFsJumbihYP4vdXUYV7vv?=
	=?us-ascii?Q?ryxBJ6nvMBGp0rY0fwaqj51H9XXc2nR+A0Go7+27uIr9MOKr7afDgv1xOpyb?=
	=?us-ascii?Q?QN72TY6l3K3iipeKpynSPSSTTD+nSiaAegchwSqq3xfwrv2HrFlNch76Ci8a?=
	=?us-ascii?Q?55OZa/NQRxvXoenADMwnchyju+f6FY5X/fk99JARyUpJvukjsASwDF3rGlhz?=
	=?us-ascii?Q?19HUWVtuzd6ECaYJF4RNYpt+XUW5zjm+xYxEVuJeRXtp9yvVxBznFEiTpJVc?=
	=?us-ascii?Q?GJ6GIL6diXLBX0Upd67PWAe4QxxLzZeqPxauCR5vIk5+Rx23yh4zl3REwDRR?=
	=?us-ascii?Q?LT2EaNz4y0FpUhOCKnOAauVP9sAqo+cNcZsjl7SiWcDOEAeLdxyWOU9E4ljZ?=
	=?us-ascii?Q?LjoNKjP1O5cbkKY6NcSYIEX9WxbZK3WGETPLyv2t2woWB939uJ7ZVoWOX8hl?=
	=?us-ascii?Q?wH/H9u+W8m34d2T8KsZxHmW4NxvQ4Y/2hX0mWCYHNkRfcVMnNOgKwU9nXC8m?=
	=?us-ascii?Q?itEwfBqIueEU84WFBlumKTRy+oLxQ5ix+QHRY39+2+NjVX/2QOXz5B9S0fZ+?=
	=?us-ascii?Q?rW9us2wlDguvJIwPq5RKNsD4wZ2p5lKLhDZfP7dwLhRsMo4ZazvR8btCci03?=
	=?us-ascii?Q?gPaDn55Dj4dp0n2FQAlMUDJD9dcMFqFH5S+a+SA5dvL+RzzGQkNLBELroc1a?=
	=?us-ascii?Q?HEQFGGV0cy6dFpTfg08P04feeUGwXCXqy7jp8Y/rOj+AwpwVsStINjZvgki7?=
	=?us-ascii?Q?MUT1ZzlomL4ZTswyRhxeokszdTC5mcJDtaan3ASw9ZnfXTOSsEuJ8M/Sx4kV?=
	=?us-ascii?Q?FnXv8rizXSe2fDyXZo0xOUWJImtyS3V7omGJup1T66hsN9t6kz9PrbEERFA2?=
	=?us-ascii?Q?TPsiNqlCVB1eOK6UhDahNRiEPvt2UghHu3mJv1rJKA=3D=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0905;
	23:r39kiNJodYqQ9pulbY7acsLeGd+W0pxHYzwaqtd?=
	=?us-ascii?Q?cdtjzNDc2/52rYGiubtcOjjC+Fxi/NL2lJASJNOtlbBxcl66xMt6FzLD6YIH?=
	=?us-ascii?Q?VXp6Ag7BP1Wyc9eIB8r08UEDYzswH0Birje7HftBCDV0TUdb4hsVlfXhc/OP?=
	=?us-ascii?Q?Slins2aHFvcfKZcYbq6kF3F1zmRVYk2XmaAUEARADkowWMDoWeGV2KXVwyKk?=
	=?us-ascii?Q?ftPBSRyLKSTvhNQSABVaY86X3qVQ4S9KFnkTeL5Bux0e3onn44tK0mCejQV3?=
	=?us-ascii?Q?VTsRIet9EaJxCUBY0b4uJzPKTWEa0x6yxBhiY154QVXMi1FvOS7dlLeuq5ci?=
	=?us-ascii?Q?2QmOUny4jpURrE6JutI3kbCyOgqAWThr/LBOK350oKJeuKFjX2XY8ZJ7jgES?=
	=?us-ascii?Q?nSlp/m7m+ZE1pI664LcEPzAsISKQ9M6M2ElmE+pEQcFzfgjTeZaxwmE5+Dej?=
	=?us-ascii?Q?/5crl8A0m4LTnkKZKLmT/oLBuWVsc4rRrN2kwrMIv5oHpUH+T8bTyYXYXGIw?=
	=?us-ascii?Q?Glf1Agb/O/UTfusg2cumu9AhseSJjTwO+QpOHJUleazFi6ES5xsM3Bmpb/rE?=
	=?us-ascii?Q?ON38LRVCJBEhwwyrxISyWaHDw+QEZhmJlXESWyDAXCVR2jkatVU5chQcq15w?=
	=?us-ascii?Q?3kch3QDaKyFDooyn18Q7kCF6qqiG6tMFAUpLauZhP+hxO6szFdO3/J5oFkQX?=
	=?us-ascii?Q?Dw59Ndsz7Kmo+w0Ry2h0fe7HWNe2efq905V2P2hnHTLFNOM2iHGTG3w+hwpW?=
	=?us-ascii?Q?wxU3R0TI19Qvvz58ENpEpIabhyzkPI6KbuMflqU/7X649H0M04vKqHuU5bLW?=
	=?us-ascii?Q?gANCRd3Gjz+5nsYtNgnZLUBiZwRSTrQ0kBVR2NaazLFVk2eaBQFLSiaJu6bs?=
	=?us-ascii?Q?w+6fSn289z+d5SO5NqS+XCowHx5891AEJ1SZh6DGB4xsk/FqtnGfR/VlLD5a?=
	=?us-ascii?Q?VTK1Zi64wPW7UaRvFyBbNjit3vIg9Z4N2joYSnmaLP8anbZzGK+vQ+2+zVD6?=
	=?us-ascii?Q?cQNFgYs2zPaVst+md1j4f+4ueGSNbKSHXEUbAuhRNYLJTFPwZ6/jesZv3DYK?=
	=?us-ascii?Q?5jYkVQNG1gt2HgvYRraejD/YhYBdnmtY2T2Vg317bQe6+rqaagYVKtGcb+d5?=
	=?us-ascii?Q?1mJToCZOuMv2gHqEZ/G3HJuALA+xWx3hXU6icXOFELQ2JlYCT/gqmsoo4ad2?=
	=?us-ascii?Q?rZaGx+XE1W1HTLDggaQQcuK7UZ42NFc4V89EMhynUo208XG0/JrUTUkkOzNw?=
	=?us-ascii?Q?EBOz0eXyjxf9Tyt34ly9mVJXv2StYB+OqrdvAWGqH0pFJTl9jcQ/pIQ3HNiN?=
	=?us-ascii?Q?88QJc3QzC87i+LRpFDn3y93BvBPwis7IW2vWuDXYxNtCM?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0905;
	6:CvcJaZL573gNq5qWab82A07UPbv7cCWsxlcZs9GA8KVcwZZ5XUOdvUqDyaU0P+hccGmol3pq6682SEG9iaE3+cdxlFlbV4H35ormjdbdYVzDd09C8UJwaqXuik2V26gy47QtEvSrfAzU77haA6fx+1q9lRQCaggXi7nk5n+Zoa1YKxZQl0S+XS2WoR+lf/9TF8jyzIwY6tprKSDvFGk2ZxDhLhNCDv4OZ8E3MgYCXEN6bVBnMxZKv1T8RPuxLJi9Yh7mxigiFfbDmoOJfHbrRLset41FqBwooytqLml4pcWuIAzVercaS6Z1+CqmcqT3jyd7ZWm6ZdOtcJaFQDUukqxeCyB8yX41Fra0AeyNfyXNhzokttf3SGeOA5p25R4D/fmcBsJotKRRGQmHxhRcexDolrwUxhUuMJPzXfHE8vJmdWh/ckwXyewe5ZDwddlI/iLNrzbv/9I1/NNuZKUibdzlBcGOvqUm5n8vSXBU34mGW88tIrQIdrDk4rZ5y00u1AyLj4+9QN9zBJkr5XLpIw==;
	5:t3aQCRvHIplZefXr6IonrVmXanBW25KDVHm+3AgrQxdldXOKSeUiIPed9TnyNds7laXYF1RxNQInOzEN1Ct7dT++gw88DYcSbk1+9iHYQDXPFkS2scjlQSxVNGmEj7yw51wXR2wZNY/iE5Gvs3F3giqRCICXycy9ytoFt3lUZGA4nZgdLMI5al0MUgKVO8vh;
	24:7nV6KL/hoM/aWRn40G8OzVjygoSOLM3A+ptXLlN3Od4g1+u++KieZE+l98aNTsXzy5lr1MpQgqCs1/5naBnynyJvNrLEnAg5stfTKxTIOSY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0905;
	7:LdW+B/LUFh3ZOPyL9KX2IQjzqsCGf6k37JGpopmwBqJs0g4V328xVLRoaBRc9tKU5BZv1PfoHw1KDJJE1cP2doUR3SZ1r2JIVeGonZyws2t5gmFkcp9bUCa35+cQd0RE+D+tfueuuCT3JSKJHFZAlALUcjcdNwQp54XPY/4NzYcQa0SfxONAenxHjSxyG1+7ct8+Wdm3/9ZWi/N/3RX+Oyd2mOnL1xXERVcMOh6lV40UT5a1MI20HUjtB6GjctPAK8/PAZnm8FdssXsW61qHGyFtmqplNTn2GrnaC4lM9/apEZOWi7xjBVlFT2IOpAlJTavHYsdbmPB+wqL9y2YnUA==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 07:36:01.4353 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0905
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH v2 3/6] gstreamer1.0-plugins-bad: Add get track number media info API
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
X-List-Received-Date: Tue, 23 May 2017 07:36:01 -0000
Content-Type: text/plain

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...layer-Add-get-track-number-media-info-API.patch | 126 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 2 files changed, 127 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch
new file mode 100755
index 0000000..82e05bb
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0004-player-Add-get-track-number-media-info-API.patch
@@ -0,0 +1,126 @@
+From 573142bb46ea5ffff78bf0672923553877c9726c Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@nxp.com>
+Date: Tue, 20 Dec 2016 18:20:02 +0800
+Subject: [PATCH 2/5] player: Add get track number media info API
+
+Upstream-Status: Backport [1.11.1]
+https://bugzilla.gnome.org/show_bug.cgi?id=773570
+---
+ docs/libs/gst-plugins-bad-libs-sections.txt |  4 ++
+ gst-libs/gst/player/gstplayer-media-info.c  | 62 +++++++++++++++++++++++++++++
+ gst-libs/gst/player/gstplayer-media-info.h  |  8 ++++
+ 3 files changed, 74 insertions(+)
+
+diff --git a/docs/libs/gst-plugins-bad-libs-sections.txt b/docs/libs/gst-plugins-bad-libs-sections.txt
+index 77092f9..8515556 100644
+--- a/docs/libs/gst-plugins-bad-libs-sections.txt
++++ b/docs/libs/gst-plugins-bad-libs-sections.txt
+@@ -2064,6 +2064,10 @@ gst_player_media_info_is_live
+ gst_player_media_info_get_image_sample
+ gst_player_media_info_get_tags
+ gst_player_media_info_get_stream_list
++gst_player_media_info_get_number_of_streams
++gst_player_media_info_get_number_of_video_streams
++gst_player_media_info_get_number_of_audio_streams
++gst_player_media_info_get_number_of_subtitle_streams
+ 
+ gst_player_stream_info_get_index
+ gst_player_stream_info_get_caps
+diff --git a/gst-libs/gst/player/gstplayer-media-info.c b/gst-libs/gst/player/gstplayer-media-info.c
+index bba8ea6..a6c17c4 100644
+--- a/gst-libs/gst/player/gstplayer-media-info.c
++++ b/gst-libs/gst/player/gstplayer-media-info.c
+@@ -791,3 +791,65 @@ gst_player_media_info_get_image_sample (const GstPlayerMediaInfo * info)
+ 
+   return info->image_sample;
+ }
++
++/**
++ * gst_player_media_info_get_number_of_streams:
++ * @info: a #GstPlayerMediaInfo
++ *
++ * Returns: number of total streams.
++ * Since: 1.12
++ */
++guint
++gst_player_media_info_get_number_of_streams (const GstPlayerMediaInfo * info)
++{
++  g_return_val_if_fail (GST_IS_PLAYER_MEDIA_INFO (info), 0);
++
++  return g_list_length (info->stream_list);
++}
++
++/**
++ * gst_player_media_info_get_number_of_video_streams:
++ * @info: a #GstPlayerMediaInfo
++ *
++ * Returns: number of video streams.
++ * Since: 1.12
++ */
++guint
++gst_player_media_info_get_number_of_video_streams (const GstPlayerMediaInfo *
++    info)
++{
++  g_return_val_if_fail (GST_IS_PLAYER_MEDIA_INFO (info), 0);
++
++  return g_list_length (info->video_stream_list);
++}
++
++/**
++ * gst_player_media_info_get_number_of_audio_streams:
++ * @info: a #GstPlayerMediaInfo
++ *
++ * Returns: number of audio streams.
++ * Since: 1.12
++ */
++guint
++gst_player_media_info_get_number_of_audio_streams (const GstPlayerMediaInfo *
++    info)
++{
++  g_return_val_if_fail (GST_IS_PLAYER_MEDIA_INFO (info), 0);
++
++  return g_list_length (info->audio_stream_list);
++}
++
++/**
++ * gst_player_media_info_get_number_of_subtitle_streams:
++ * @info: a #GstPlayerMediaInfo
++ *
++ * Returns: number of subtitle streams.
++ * Since: 1.12
++ */
++guint gst_player_media_info_get_number_of_subtitle_streams
++    (const GstPlayerMediaInfo * info)
++{
++  g_return_val_if_fail (GST_IS_PLAYER_MEDIA_INFO (info), 0);
++
++  return g_list_length (info->subtitle_stream_list);
++}
+diff --git a/gst-libs/gst/player/gstplayer-media-info.h b/gst-libs/gst/player/gstplayer-media-info.h
+index 7ffd6b4..6866ff6 100644
+--- a/gst-libs/gst/player/gstplayer-media-info.h
++++ b/gst-libs/gst/player/gstplayer-media-info.h
+@@ -175,12 +175,20 @@ GstClockTime  gst_player_media_info_get_duration
+                 (const GstPlayerMediaInfo *info);
+ GList*        gst_player_media_info_get_stream_list
+                 (const GstPlayerMediaInfo *info);
++guint         gst_player_media_info_get_number_of_streams
++                (const GstPlayerMediaInfo *info);
+ GList*        gst_player_get_video_streams
+                 (const GstPlayerMediaInfo *info);
++guint         gst_player_media_info_get_number_of_video_streams
++                (const GstPlayerMediaInfo *info);
+ GList*        gst_player_get_audio_streams
+                 (const GstPlayerMediaInfo *info);
++guint         gst_player_media_info_get_number_of_audio_streams
++                (const GstPlayerMediaInfo *info);
+ GList*        gst_player_get_subtitle_streams
+                 (const GstPlayerMediaInfo *info);
++guint         gst_player_media_info_get_number_of_subtitle_streams
++                (const GstPlayerMediaInfo *info);
+ GstTagList*   gst_player_media_info_get_tags
+                 (const GstPlayerMediaInfo *info);
+ const gchar*  gst_player_media_info_get_title
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 6655a86..732fc2d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -20,6 +20,7 @@ SRC_URI = " \
     file://0001-mssdemux-improved-live-playback-support.patch \
     file://0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch \
     file://0003-player-Add-configuration-for-enabling-accurate-seeks.patch \
+    file://0004-player-Add-get-track-number-media-info-API.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


