Return-Path: <prvs=36374ddc1e=alex.stewart@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id BBD0960236
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 19:57:13 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w39JulMY005853 for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Apr 2018 14:57:14 -0500
Received: from nam02-bl2-obe.outbound.protection.outlook.com
	(mail-bl2nam02lp0087.outbound.protection.outlook.com [207.46.163.87])
	by mx0b-00010702.pphosted.com with ESMTP id 2h6ut2n7fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Apr 2018 14:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ca3WQScHiYtwt/MxCxupaDn7LZ8lLxJJJXqJO7Gz2dY=;
	b=KKmfpRvfqa3rbBoWRr72oEvmXUzK2q2QfQgS4PAG0ktNQ/ZWCTwW8+ZTG0OCVL2Hm9lJdk59nHwWwqgwiL+6zkksDn+chn6a9/6K+hZxT3Af46Vaq1B9iybWu2yy1U6B6ji/I4c0NZL3J/T3i2jxxti7falFi4oXb1Hnj7sHJx0=
Received: from [10.2.72.122] (130.164.62.207) by
	BY2PR0401MB0967.namprd04.prod.outlook.com (2a01:111:e400:2c7c::22) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.653.12;
	Mon, 9 Apr 2018 19:57:11 +0000
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <20180321185559.30749-1-alex.stewart@ni.com>
	<20180321185559.30749-2-alex.stewart@ni.com>
From: Alex Stewart <alex.stewart@ni.com>
Organization: National Instruments Corp.
Message-ID: <e888d564-5755-deed-92e8-bda4e6b6dacc@ni.com>
Date: Mon, 9 Apr 2018 14:57:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <20180321185559.30749-2-alex.stewart@ni.com>
X-Originating-IP: [130.164.62.207]
X-ClientProxiedBy: CY4PR04CA0044.namprd04.prod.outlook.com
	(2603:10b6:903:c6::30) To BY2PR0401MB0967.namprd04.prod.outlook.com
	(2a01:111:e400:2c7c::22)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 25977faf-925c-491e-4c30-08d59e541599
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(2017052603328)(7153060)(7193020);
	SRVR:BY2PR0401MB0967; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0401MB0967;
	3:xDyN6sYFC/ztVuwGoQdpgMhNCZdOe1nh4LwGkdu8BnhrxKemf9/kf5jPjQti7FV3Jn2pR6i3/crHtGiWILJnR/9SvNMVfpuXFfG8Hk1U7eHZ7Y+NVp307ZIjExRQucra2qryqGvDNLvufSmY5V1Tlqug8PUim3G2EU/pNNRsTI8tieqk/7VYYuUHUILTuDAHK1zbSfCSFg8j/QNGdDrVJw42xwcGZ86KFKsCncHpQz8OnNRdTb0AdSt1TIiAsVwg;
	25:p5u9URun7l2v6O0UF9yrxjdHWMCG3aMrX8al6DEGzisMrorLSlfaNNTq64nYIPOG2Vd4Ie+pTmQEzT+rbFhkmlavd4VP2Z3nT7etPDxCqEZwWIoN8B57pF543FWRGRK7tp/c/izR+7cR5ussJ1CrZNtJmIuYPDfju7ePnf2YBCFmq7dyCQcdnFTYnwFRpNFdRxmnciR/5zYJU4XzcgMW+QHHq7bHuwQO9bpdu8EPGC2/s2OBTZiGiD+kAjbvZ1ILD6IMqVGfDVuRm8xTUGX9plKDiw4BFaKhpv+1UeXI3eVtNjj4ssn2gRFOcTAAolPiF7BCN7f1deqJ/coiBVXa9w==;
	31:coqRPTmx0QvyIkacKC0iwAbqFG9NsPfPujXvcpk7jEb5gB3BB04nfT+pJYoMb8x8MOj9iXVzWd/+ztrYEhSEGURv+sBk44sVeZL07xLHJNqvsFjkhdLKfncESzu+IzFXauk6tUE4h9UPYFUejscbYptGr9sHSSOHd7WclgB6lo6PU8NgSCKyuL3WPIydJKf0wkJyhIXsSyKLQTDScy3c1qGCIEmCGbBnkrzf/Mdgle8=
X-MS-TrafficTypeDiagnostic: BY2PR0401MB0967:
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0401MB0967;
	20:bRIxHhqZGMvzHeZWS8zz1t9h/ALyIu5llQkjyW1b2mxepp2eehzEaYYzMCbQa++t3NmL/fmnvfdoq11wtXwQ9tCfBhPHCz4oiGclMxriXftJCI4exjOrunVq4m8zIRAdMRsGGabA3MxgkAtXFRKrJyjE6/IkcQ5tiE/lYGO9B3XznOQoRbW21bV9IW9eM742r8iBi2k6zA8y49Teogx6TQUb41jXHbubIbzokyBH2T+E57CU41NTB1qaZ4+Sm2x2OLMEWFjspcNId/K+QgLhip8NljdH+RjHloVuyxjdYal3vcZqKLBJ4HNNculeoNt15wCgCQ6sry/SNF4u2TDWerj2CxfptMjkqKCbYamY1Uu1zrcJIwfoW5pcLmj2XznWVzoHyLEGHjHVNyYBTaQ1Hy3oJWv2PGAbYrNKxkzHzZnTcwbyn4CMXG9nroQ1OPoP5tedSotfmeAJrq5NUZml8vCZpH/jdlBURBinpk7Ayy5qV7HWcMTIYv47DKYrwPWlsSiorQSixEeRM+zV93LxPzlm1mQcFpwMO/g/8IlFe37P6y0BRO8Bng/ktHozrDd3t4q+2TD9aHQe+c8rZ7jMsUhYqhB/Rhn2ZKpv/npNWrA=;
	4:DLQ/DW5MCDd61SRTXavbQfth1JkCr/aEsRdO/IFfYvMK/ZO1/h/W5rLw/nfrWuH2K2sloV4wX4BSwgCir2B6UoF8BFC/L5zU6THkCsS/AHxGNCZOdbc63mmYbb+C8NI9bXIEn4OS8rSOOu+hr01syeex8fsif4Srta5KGM7elzzZl78uAijx9CQgkQfeN8eio4jLMZoeaihppcxgZKpbRg3Z3Begv4BGyOfuxKG/2gC7Whzp6VjDs/3ea+4ZnLL2HoAQCsT39KJZlYC4F7biovHkDKW3TO0Gg2+svPqZIipaqKSP1374zwi+hudLij0/
X-Microsoft-Antispam-PRVS: <BY2PR0401MB09679899B96ED9BBE4771F3FFEBF0@BY2PR0401MB0967.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(145744241990776);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231221)(944501327)(52105095)(3002001)(10201501046)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(6072148)(201708071742011);
	SRVR:BY2PR0401MB0967; BCL:0; PCL:0; RULEID:;
	SRVR:BY2PR0401MB0967; 
X-Forefront-PRVS: 0637FCE711
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(6049001)(39380400002)(376002)(346002)(366004)(39860400002)(396003)(199004)(189003)(50944005)(53936002)(16526019)(575784001)(26005)(77096007)(65956001)(86362001)(65806001)(50466002)(2906002)(68736007)(66066001)(36756003)(3846002)(4326008)(6116002)(230700001)(8936002)(478600001)(64126003)(25786009)(97736004)(81156014)(65826007)(8676002)(81166006)(2616005)(31696002)(5660300001)(956004)(386003)(53546011)(11346002)(446003)(6916009)(476003)(6666003)(105586002)(16576012)(316002)(305945005)(106356001)(59450400001)(7736002)(31686004)(58126008)(6486002)(67846002)(47776003)(36916002)(6246003)(23676004)(52116002)(6306002)(76176011)(486006)(229853002)(2486003)(52146003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR0401MB0967; H:[10.2.72.122];
	FPR:; SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCWTJQUjA0MDFNQjA5Njc7MjM6S2NmWlBEbDZjODg3dkpiNWxYb3VKRVBq?=
	=?utf-8?B?ZTlKWExRS00rc1pWOFM2ZEkvSUVxKzRFbmpHOHp3WnN3VnRVYk1YcEZ6aGpT?=
	=?utf-8?B?NFBlUm5nWUpPaU5aZmZPMndJcEdhdUJoekx1MGhCczFIazRYVkQ2a0FXanIw?=
	=?utf-8?B?NzBHenFla2tpZ3ozSjhwbDlndUIxVld2OW9WdngyVEF1RUV4RGxGQ0RXS2tP?=
	=?utf-8?B?UER6M2RsTHQzMlh1WlZ3ZG9kZVZPNDBIRFIrdFpqQVRPRWJHR3NxWExMUU8y?=
	=?utf-8?B?UTIvVWRPQUtwK3NQNnc3NWtRSjYwZExHZmdMVkFWNmdidVp5T2l4T1VXQVRY?=
	=?utf-8?B?ajdid3NORlNFUXJrOFhpMmZvYVo3S2duK3RLS3BWbHRDYXEzV3hsbE04NCtq?=
	=?utf-8?B?aWVoeVE0ZFI1YklhZzlEd1dBQmN0M2x1bzJoM3prZXk3VmxYSWFyK3ZodTds?=
	=?utf-8?B?OHEyNnh0NlNNYjhReDAvZzNOQXVxK3pSV3NQUUR3Ryt3Z2wzbjl2SkpQNXhr?=
	=?utf-8?B?VnRrSk1XOVNaUTVhTVVpN05kQVBJZzhIeExWNjRTT1hxR09ackliQkhQejVo?=
	=?utf-8?B?MXB6VUk3THRlM2ZkdTJuc20yTzJzL1FxN3hLOWdSYXpuRUlLU0FFN3RSL1Jy?=
	=?utf-8?B?RTJpdHc4dEwxTUdqdTZGb0ZaUkpoN01pUE1pVlVlc2I2eUF1ako3cm9JeHFF?=
	=?utf-8?B?engyRUtmUTIxeko1L09DMjFVckNYeDVKb0RHZVVsbUxZWlllTW1XUDZnSjAz?=
	=?utf-8?B?RUxZY2NpS1F0d29nTW5TRVkwNit4V1pNWnUzOWlXT2c3SDg2cFJZOFl4dk9u?=
	=?utf-8?B?MCtMQ1AyY2h6Mm1HZzhBRnBvWVlubnh5T09jNWdtdDZuc2o1Rkp5MjZjWUVU?=
	=?utf-8?B?UGZkM3BKbzNkams0UFAyUE5uMVpyZnp6b0RrdkpMWFdYNzFFbEFJV0VjTW0v?=
	=?utf-8?B?d1FXeGkrZmllMHgzUjhqTnBqUWVITkJlQXl1dUZLbG45OW9zczZYTDB1MjB3?=
	=?utf-8?B?a2RoemF5UjU5Y0RnRHZFczNjL1ZObnFnemY5S3EvZFR6N2JoRTZtclpuNEEx?=
	=?utf-8?B?aXMrVXJFZ2lxbmFXTm5ITkw5Skt4c1VSUi91eFE4c3p5TDd3VytiWHFOZERp?=
	=?utf-8?B?UG9mN3N4Y01RSjZ6elJkbVhVWDlHOHRWRDBlL0RhdUQ5enlXZS8zQ2UvOHlL?=
	=?utf-8?B?bW1yckNnTjhodVhlV1V0WGxYRjluSTZGOGZOaFI0K1dSdkdrQjRodmc3MVhM?=
	=?utf-8?B?QzlvZnpQendwN2VMWkF0QnJManFNSHBtQnlqMDF6MHZ2Nm9uU1RDcEVSRjlZ?=
	=?utf-8?B?ZnU4aXdaaFlFcGNWRnU0QzRxdGE0dXpxdVpDVUQ4SEhrQWZUN2xuK0x1U05u?=
	=?utf-8?B?V0VjYS80QTJiNXpheHgwNVUzTmhUb3VNR3k2c2VwU3E3MGdwdkZIRzRjTkxD?=
	=?utf-8?B?NXh5Wk4wZm1tejFZT0lyL1hTZ2IwS3JyVzFqOVA0cEQ1bDB4TjNIbGdkaVpx?=
	=?utf-8?B?b0hVRzZRb1BCTDRVL3FDMnJjQnRNdDdQWnFpblI3b2VOVUpLbjNkKzA2M01m?=
	=?utf-8?B?bGtNWE0xNjlkKzFITHpQT1ZVbXJyd2xoR1czWjhsaTBCV0VqbE0xOXE5YXlz?=
	=?utf-8?B?YnJWQ3FkYlhGNlJicHZlenljZjE3bmV1RCtaczNzUUJUb1NHYnpKZEF5dGNp?=
	=?utf-8?B?ZzlJZS8xTUhLQW8rSC9tRzd2UWdNU0NIVzJTK1VKVWZWdWl5Q2ZyS093UzRz?=
	=?utf-8?B?TElBWnZ6NWE1SFpuekFDTWVKL1RYcjhSUy9mOXN0djRVWGJLV0hrZjhHMXFG?=
	=?utf-8?B?anpkcy9SV3NFVFIvL2NFUFpScWd0bnZML09ocXlOTkdKb3FqS3p6R01kR3JT?=
	=?utf-8?B?Q0FPSE0zNlpjRjRISU1FSkxDeEFzdWF1Z2grWDhiMVhjZExLR2o3TlNOaGFz?=
	=?utf-8?B?MHVySWFyQ3pGUjVyQXQreEtrWjZlN0VWTTgrd0w0cC9QdmJXMDdMaVhUQmpU?=
	=?utf-8?B?OTRjVlcrWFZMRzMvTm9paG9WZUhUMXhQclpibjZ5U0Rwb2c5cDBuQjBNaGNw?=
	=?utf-8?Q?0SzYEQhW/5TpouFfiaTc6/iCrT9?=
X-Microsoft-Antispam-Message-Info: WOjPfu7FBotJeifvVA3yoFcUC0Y4ouVRQK2RyrzR7WTIOOizPNV8tgD3UxFHfH7EEnLGrN+i9a2grro2Hdmm1lXBYgOZwfekf1WSzn0MaADDgGnx2tvb3HpVq+6EQ3Tr0CCB7DKCD6FqKL0SDe5i9/YS3ZlnnwWZDBjemyEFUw71Keqz97nxeSCmdETHxRDN
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0401MB0967;
	6:9LkOdlxL9OmPQJJAeRcvRlXJJCe2lyKGrdY/gRhW9w5ZPaotoIZrTFlmlCVQ6Y9wGcde5qko9TC9cc9HVwdXuQccGqY1SQ0k+fw41eA0AkxVV5EtMbJzK7Rb6cObIqHl9N4rlw/sBYElgivBKDfLdA8ShPTZ/PYDS0E29iBDiuN7A88kYPlXMRj2rhNt9rpJi0zn0P0TbhV8VybEjWg/H4+z7jdcWG5Q2GYLGCqIF3HeF1EURKVffoKxW4lzTuM4SWX+0z4bp3/1q/HwmFvrPkhFHR6XqrCObItS/8+oINt+hGnHye1WBip4SPunZwnXlF1MM8IvyCW0665rHXNZwp0zbarbzM6Qgdw3xRCD2NqAOXkiNweoDAwUDZOeKBcXt59YPwmpH8hF4E8KVUDcJPXlVj7xOUjbZ7Sl8E2/pLghQnW7i21QzPukMSi6qehEI45KDyvRdibSsEaIfFAlYg==;
	5:ZQYUN2IjRu3UsT0bL2VnGEjNIWbOzRA1r+A5WUcMqlAHoXRU6AcGwGcT1u3gfT0zzAYhUwuDDbN7ZEhhEu3H+ewG0w3tsP7IX88yf4B0KW41TpJekdrWPSMtaudcCLTm18WY+CG1jBqGwDykWpSkOpeHdIVzdo2R0ViCGh89LQk=;
	24:azZRIHofxrABIlUGYLMFB9yJKO8Ix+C8AKdSj0hPpdVwbgDde6IHHktfoxbwMw4FYPfDFieGXhIALWj5hRp7bM6erWdGWdhxNvIAbr0RM7U=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR0401MB0967;
	7:PXUOjnQrORrJhjZVTcfhNzPzu5PoIujR6M4N4sehxGJVDnd0xHqS5mc0XhLtLtyeL5dDlWc3yVdrEiLhhTdoR2YYqr7LbhkpGlOkyp5incGjeLAk/o33LTbtxfbqrPTVC7BFANd1qy8ax4wpbJRbi7SCT9CmSM78wj4JwuTS0S0kzQJBRwer5EczmhSt52CVn6DoL340I1UKCy6hFdBf5/wb3q6DSidOUeMnaLvmLUSDBBb37MqrX/ucdaHLiQNh
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2018 19:57:11.6633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25977faf-925c-491e-4c30-08d59e541599
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR0401MB0967
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-04-09_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1711220000 definitions=main-1804090201
Subject: Re: [PATCH v2 1/1] recipes-core: breakout hwclock.sh from busybox
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
X-List-Received-Date: Mon, 09 Apr 2018 19:57:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Bump.

Did this patch get blacklisted for inclusion or does anyone have any 
outstanding concerns about it?

On 03/21/2018 01:55 PM, Alex Stewart wrote:
> * Move the hwclock.sh initscript from busybox into its own package and
>    recipe (hwclock-init). This script is generally useful for distros
>    that get their hwclock implementation from sources other than
>    busybox (like util-linux).
>
> :busybox/*
> * Remove the busybox-hwclock package, as it no longer has a purpose.
> * If busybox is configured to include hwclock, the busybox package will
>    RDEPEND on hwclock-init.
>
> :util-linux/*
> * util-linux-hwclock RDEPENDS on hwclock-init for its initscript.
>
> Signed-off-by: Alex Stewart <alex.stewart@ni.com>
> ---
>   meta/recipes-core/busybox/busybox.inc              | 16 +++--
>   meta/recipes-core/busybox/busybox_1.27.2.bb        |  1 -
>   meta/recipes-core/busybox/files/hwclock.sh         | 83 ----------------------
>   meta/recipes-core/hwclock-init/files/hwclock.sh    | 83 ++++++++++++++++++++++
>   meta/recipes-core/hwclock-init/hwclock-init_1.0.bb | 31 ++++++++
>   meta/recipes-core/util-linux/util-linux.inc        |  1 +
>   6 files changed, 124 insertions(+), 91 deletions(-)
>   delete mode 100644 meta/recipes-core/busybox/files/hwclock.sh
>   create mode 100644 meta/recipes-core/hwclock-init/files/hwclock.sh
>   create mode 100644 meta/recipes-core/hwclock-init/hwclock-init_1.0.bb
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index d1675c37aa..50cc837335 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -20,19 +20,17 @@ export EXTRA_LDFLAGS = "${LDFLAGS}"
>   
>   EXTRA_OEMAKE = "CC='${CC}' LD='${CCLD}' V=1 ARCH=${TARGET_ARCH} CROSS_COMPILE=${TARGET_PREFIX} SKIP_STRIP=y HOSTCC='${BUILD_CC}' HOSTCPP='${BUILD_CPP}'"
>   
> -PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev ${PN}-hwclock"
> +PACKAGES =+ "${PN}-httpd ${PN}-udhcpd ${PN}-udhcpc ${PN}-syslog ${PN}-mdev"
>   
>   FILES_${PN}-httpd = "${sysconfdir}/init.d/busybox-httpd /srv/www"
>   FILES_${PN}-syslog = "${sysconfdir}/init.d/syslog* ${sysconfdir}/syslog-startup.conf* ${sysconfdir}/syslog.conf* ${systemd_unitdir}/system/syslog.service ${sysconfdir}/default/busybox-syslog"
>   FILES_${PN}-mdev = "${sysconfdir}/init.d/mdev ${sysconfdir}/mdev.conf ${sysconfdir}/mdev/*"
>   FILES_${PN}-udhcpd = "${sysconfdir}/init.d/busybox-udhcpd"
>   FILES_${PN}-udhcpc = "${sysconfdir}/udhcpc.d ${datadir}/udhcpc"
> -FILES_${PN}-hwclock = "${sysconfdir}/init.d/hwclock.sh"
>   
> -INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev ${PN}-hwclock"
> +INITSCRIPT_PACKAGES = "${PN}-httpd ${PN}-syslog ${PN}-udhcpd ${PN}-mdev"
>   
>   INITSCRIPT_NAME_${PN}-httpd = "busybox-httpd"
> -INITSCRIPT_NAME_${PN}-hwclock = "hwclock.sh"
>   INITSCRIPT_NAME_${PN}-mdev = "mdev"
>   INITSCRIPT_PARAMS_${PN}-mdev = "start 04 S ."
>   INITSCRIPT_NAME_${PN}-syslog = "syslog"
> @@ -284,9 +282,6 @@ do_install () {
>   	if grep "CONFIG_UDHCPD=y" ${B}/.config; then
>   		install -m 0755 ${WORKDIR}/busybox-udhcpd ${D}${sysconfdir}/init.d/
>   	fi
> -	if grep "CONFIG_HWCLOCK=y" ${B}/.config; then
> -		install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
> -	fi
>   	if grep "CONFIG_UDHCPC=y" ${B}/.config; then
>   		install -d ${D}${sysconfdir}/udhcpc.d
>   		install -d ${D}${datadir}/udhcpc
> @@ -375,6 +370,13 @@ python do_package_prepend () {
>       else:
>           set_alternative_vars("${sysconfdir}/busybox.links.nosuid", "${base_bindir}/busybox.nosuid")
>           set_alternative_vars("${sysconfdir}/busybox.links.suid", "${base_bindir}/busybox.suid")
> +
> +    # If busybox is configured to provide a hwclock implementation, add a
> +    # package dependency on hwclock-init for the /etc/init.d/hwclock.sh
> +    # initscript.
> +    with open(d.getVar('B') + '/.config', 'r') as fp_conf:
> +        if 'CONFIG_HWCLOCK=y' in fp_conf.read():
> +            d.appendVar('RDEPENDS_busybox', ' hwclock-init ')
>   }
>   
>   pkg_postinst_${PN} () {
> diff --git a/meta/recipes-core/busybox/busybox_1.27.2.bb b/meta/recipes-core/busybox/busybox_1.27.2.bb
> index 36a6342aaf..78d8e14a6b 100644
> --- a/meta/recipes-core/busybox/busybox_1.27.2.bb
> +++ b/meta/recipes-core/busybox/busybox_1.27.2.bb
> @@ -8,7 +8,6 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
>              file://busybox-udhcpd \
>              file://default.script \
>              file://simple.script \
> -           file://hwclock.sh \
>              file://mount.busybox \
>              file://syslog \
>              file://syslog-startup.conf \
> diff --git a/meta/recipes-core/busybox/files/hwclock.sh b/meta/recipes-core/busybox/files/hwclock.sh
> deleted file mode 100644
> index be5f94d86c..0000000000
> --- a/meta/recipes-core/busybox/files/hwclock.sh
> +++ /dev/null
> @@ -1,83 +0,0 @@
> -#!/bin/sh
> -### BEGIN INIT INFO
> -# Provides:          hwclock
> -# Required-Start:
> -# Required-Stop:     $local_fs
> -# Default-Start:     S
> -# Default-Stop:      0 6
> -# Short-Description: Set system clock
> -# Description:       Set system clock to hardware clock, according to the UTC
> -#                    setting in /etc/default/rcS (see also rcS(5)).
> -### END INIT INFO
> -#
> -# WARNING:      If your hardware clock is not in UTC/GMT, this script
> -#               must know the local time zone. This information is
> -#               stored in /etc/localtime. This might be a problem if
> -#               your /etc/localtime is a symlink to something in
> -#               /usr/share/zoneinfo AND /usr isn't in the root
> -#               partition! The workaround is to define TZ either
> -#               in /etc/default/rcS, or in the proper place below.
> -
> -[ ! -x /sbin/hwclock ] && exit 0
> -
> -[ -f /etc/default/rcS ] && . /etc/default/rcS
> -
> -[ "$UTC" = "yes" ] && tz="--utc" || tz="--localtime"
> -case "$1" in
> -        start)
> -                if [ "$VERBOSE" != no ]
> -                then
> -                        echo "System time was `date`."
> -                        echo "Setting the System Clock using the Hardware Clock as reference..."
> -                fi
> -
> -		if [ "$HWCLOCKACCESS" != no ]
> -		then
> -			if [ -z "$TZ" ]
> -			then
> -	                   hwclock $tz --hctosys
> -			else
> -			   TZ="$TZ" hwclock $tz --hctosys
> -			fi
> -		fi
> -
> -                if [ "$VERBOSE" != no ]
> -                then
> -                        echo "System Clock set. System local time is now `date`."
> -                fi
> -                ;;
> -        stop|restart|reload|force-reload)
> -		#
> -		# Updates the Hardware Clock with the System Clock time.
> -		# This will *override* any changes made to the Hardware Clock.
> -		#
> -		# WARNING: If you disable this, any changes to the system
> -		#          clock will not be carried across reboots.
> -		#
> -		if [ "$VERBOSE" != no ]
> -		then
> -			echo "Saving the System Clock time to the Hardware Clock..."
> -		fi
> -		if [ "$HWCLOCKACCESS" != no ]
> -		then
> -			hwclock $tz --systohc
> -		fi
> -		if [ "$VERBOSE" != no ]
> -		then
> -			echo "Hardware Clock updated to `date`."
> -		fi
> -                exit 0
> -                ;;
> -	show)
> -		if [ "$HWCLOCKACCESS" != no ]
> -		then
> -			hwclock $tz --show
> -		fi
> -		;;
> -        *)
> -                echo "Usage: hwclock.sh {start|stop|show|reload|restart}" >&2
> -		echo "       start sets kernel (system) clock from hardware (RTC) clock" >&2
> -		echo "       stop and reload set hardware (RTC) clock from kernel (system) clock" >&2
> -                exit 1
> -                ;;
> -esac
> diff --git a/meta/recipes-core/hwclock-init/files/hwclock.sh b/meta/recipes-core/hwclock-init/files/hwclock.sh
> new file mode 100644
> index 0000000000..be5f94d86c
> --- /dev/null
> +++ b/meta/recipes-core/hwclock-init/files/hwclock.sh
> @@ -0,0 +1,83 @@
> +#!/bin/sh
> +### BEGIN INIT INFO
> +# Provides:          hwclock
> +# Required-Start:
> +# Required-Stop:     $local_fs
> +# Default-Start:     S
> +# Default-Stop:      0 6
> +# Short-Description: Set system clock
> +# Description:       Set system clock to hardware clock, according to the UTC
> +#                    setting in /etc/default/rcS (see also rcS(5)).
> +### END INIT INFO
> +#
> +# WARNING:      If your hardware clock is not in UTC/GMT, this script
> +#               must know the local time zone. This information is
> +#               stored in /etc/localtime. This might be a problem if
> +#               your /etc/localtime is a symlink to something in
> +#               /usr/share/zoneinfo AND /usr isn't in the root
> +#               partition! The workaround is to define TZ either
> +#               in /etc/default/rcS, or in the proper place below.
> +
> +[ ! -x /sbin/hwclock ] && exit 0
> +
> +[ -f /etc/default/rcS ] && . /etc/default/rcS
> +
> +[ "$UTC" = "yes" ] && tz="--utc" || tz="--localtime"
> +case "$1" in
> +        start)
> +                if [ "$VERBOSE" != no ]
> +                then
> +                        echo "System time was `date`."
> +                        echo "Setting the System Clock using the Hardware Clock as reference..."
> +                fi
> +
> +		if [ "$HWCLOCKACCESS" != no ]
> +		then
> +			if [ -z "$TZ" ]
> +			then
> +	                   hwclock $tz --hctosys
> +			else
> +			   TZ="$TZ" hwclock $tz --hctosys
> +			fi
> +		fi
> +
> +                if [ "$VERBOSE" != no ]
> +                then
> +                        echo "System Clock set. System local time is now `date`."
> +                fi
> +                ;;
> +        stop|restart|reload|force-reload)
> +		#
> +		# Updates the Hardware Clock with the System Clock time.
> +		# This will *override* any changes made to the Hardware Clock.
> +		#
> +		# WARNING: If you disable this, any changes to the system
> +		#          clock will not be carried across reboots.
> +		#
> +		if [ "$VERBOSE" != no ]
> +		then
> +			echo "Saving the System Clock time to the Hardware Clock..."
> +		fi
> +		if [ "$HWCLOCKACCESS" != no ]
> +		then
> +			hwclock $tz --systohc
> +		fi
> +		if [ "$VERBOSE" != no ]
> +		then
> +			echo "Hardware Clock updated to `date`."
> +		fi
> +                exit 0
> +                ;;
> +	show)
> +		if [ "$HWCLOCKACCESS" != no ]
> +		then
> +			hwclock $tz --show
> +		fi
> +		;;
> +        *)
> +                echo "Usage: hwclock.sh {start|stop|show|reload|restart}" >&2
> +		echo "       start sets kernel (system) clock from hardware (RTC) clock" >&2
> +		echo "       stop and reload set hardware (RTC) clock from kernel (system) clock" >&2
> +                exit 1
> +                ;;
> +esac
> diff --git a/meta/recipes-core/hwclock-init/hwclock-init_1.0.bb b/meta/recipes-core/hwclock-init/hwclock-init_1.0.bb
> new file mode 100644
> index 0000000000..74200450ac
> --- /dev/null
> +++ b/meta/recipes-core/hwclock-init/hwclock-init_1.0.bb
> @@ -0,0 +1,31 @@
> +SUMMARY = "Initscript for hwclock utility"
> +DESCRIPTION = "\
> +Installs an initscript that updates the system clock based on the available \
> +hwclock implementation."
> +
> +SECTION = "base"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> +
> +SRC_URI = "file://hwclock.sh"
> +
> +S = "${WORKDIR}"
> +
> +inherit update-rc.d
> +
> +INITSCRIPT_PACKAGES = "${PN}"
> +
> +INITSCRIPT_NAME_${PN} = "hwclock.sh"
> +INITSCRIPT_PARAMS_${PN} = "defaults"
> +
> +do_install () {
> +	install -d ${D}${sysconfdir}/init.d
> +	install -m 0755 ${WORKDIR}/hwclock.sh ${D}${sysconfdir}/init.d/
> +}
> +
> +PACKAGES = "${PN}"
> +
> +PACKAGE_ARCH = "all"
> +
> +FILES_${PN} = "${sysconfdir}/init.d/hwclock.sh"
> diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
> index 5e40b2019a..6df5723d5e 100644
> --- a/meta/recipes-core/util-linux/util-linux.inc
> +++ b/meta/recipes-core/util-linux/util-linux.inc
> @@ -302,6 +302,7 @@ python populate_packages_prepend() {
>   }
>   
>   RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
> +RDEPENDS_${PN}-hwclock += "hwclock-init"
>   RDEPENDS_${PN}-ptest = "bash grep coreutils which util-linux-blkid util-linux-fsck btrfs-tools"
>   
>   do_compile_ptest() {

-- 
Alex Stewart
Software Engineer - LabVIEW Real-Time
National Instruments

alex.stewart@ni.com


