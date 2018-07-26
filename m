Return-Path: <prvs=67453030ef=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id DEC3F78C21
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2018 13:37:48 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w6QDVpdI007181; Thu, 26 Jul 2018 08:37:48 -0500
Authentication-Results: ppops.net;
	dkim=pass header.d=nio365.onmicrosoft.com header.s=selector1-ni-com
Received: from nam04-bn3-obe.outbound.protection.outlook.com
	(mail-bn3nam04lp0113.outbound.protection.outlook.com
	[216.32.180.113])
	by mx0b-00010702.pphosted.com with ESMTP id 2kewd5tqqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Thu, 26 Jul 2018 08:37:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=sbYtbGLYr2Cxq8dbiqORGsHYNGie/zfE9/AJ1THMUrU=;
	b=ifDMbfDtKI7tAazP9xDaNAU+cjZHgwuNMywirsocMKsd4RoBZ/nRGUF/bN4hlh/zz4cbJaq8+V+z9hEL/y1hwNK9vzme4ALBK8jHH/zq2POMHPWgSIEvoAw0OQJsRX8bD0ENLAbTn8ZjssAr+V9L2ks6+2Ji6vsXVQkjJ9yOPZI=
Received: from ionel-work (80.97.64.55) by
	CY4PR04MB0390.namprd04.prod.outlook.com (2603:10b6:903:b1::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.973.21; Thu, 26 Jul 2018 13:37:44 +0000
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <CA+chaQddtODqrxpAwB_f0mP=wdt+kVC2o+tp=+6VdHt_Zk4_AA@mail.gmail.com>
References: <20180705085719.3184-1-adrian.ratiu@ni.com>
	<CA+chaQddtODqrxpAwB_f0mP=wdt+kVC2o+tp=+6VdHt_Zk4_AA@mail.gmail.com>
Date: Thu, 26 Jul 2018 16:39:17 +0300
Message-ID: <87a7qejeuy.fsf@ni.com>
MIME-Version: 1.0
X-Originating-IP: [80.97.64.55]
X-ClientProxiedBy: VI1PR08CA0210.eurprd08.prod.outlook.com
	(2603:10a6:802:15::19) To CY4PR04MB0390.namprd04.prod.outlook.com
	(2603:10b6:903:b1::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ef9236c-14d7-4ebd-4090-08d5f2fcf86e
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(5600073)(711020)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(2017052603328)(7153060)(7193020);
	SRVR:CY4PR04MB0390; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0390;
	3:gn4VN92vKiowKsi0+VahWYEs8RksRvQl+xNDNyXYac/01w9+r/R7ilavRuxJwkrxOO9qUKdgCUSkuidNwcyjU4whfrx9aaqG0cdYl3m3cQIf2Lg9d6jkKt87IMei35pjRRAYSuwsVqm7lb8/cCtdF2L1MPpp8SJssqjkZWcjZfQ/Q5MFxtnGZRiO+cLf4C0wMP57YDTgLX2MtwKFRZbaDt5b/zpxg0tGo2jayRVFdIq6G4OCHX9EoZXrgvUvIWdd;
	25:ynHaQ2hsVYovXOTLRC92qZbeM37cU0assz8et6QawSx1Xr0pt6wL2aMLE6LAbEt+F0L+t0ldidE+gj5eJ+veYjSH29F0rfcqTx4xUw7qrtctyymI9HnCqGBLZnXpjR2r3psWsr0cVwijvTCfh2NJ2T/ejSv/xRMtCKoNavWptQaFV30+R6iAqH9CvnTK4DeDRMf9iBFmXjU3KdQGYAcU4ueaaPheaYNpPscstlFnZ9xawP0EDA2aSBpUymFvkEx+0IyQAP+5xvr35inutJNoOJSpCfFtcijiuB2JsfDic23+fWALvklVxE4EsMUNWLdiWBmpZqS3Y8rq5zFjBwKRvg==;
	31:bRNcgANlw6pCDwLU96+OoKrjGIQL2xnjc8pMiMwRjFoxf/jVNW96cnANcjzHyeDizsZf5x/bGjukzyawT6VBkU1e6b841pg2n4fuH1nfOzOy3Sqv9Kf+yHGrKr3+ntdolFdOoGP72YlqyRRXAwZVCfDqemGfE5OnHZ8bwpZJwUrvywC56dGDJIq6peOmifm7uGrZYVNLXyLbiHyO4ENfNgjf1g4LNAldPX8Ez6Lo3Qs=
X-MS-TrafficTypeDiagnostic: CY4PR04MB0390:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0390;
	20:Y6jjwneZSUEF9CRnq08S5On79zIBmTzrTzUQGkcXKkl5OgQUfNKAAEK1u8YLmrGLALeRb0vSP2GEKtzLWg7qYtKIsNdFo3HCrv+7SHOvhPA282I9nvMSBvvLReocmimB/3f94ArIWIvnywMA+Po8OlTIoVHDzSwOqWPnEdxmakqGB3QohkAsiljsQB6q6dBbTj/lOS8tkg08oqruZ2AUKhnkT3eon1nM+lMNyV6BJ3NGG2Rmf9wwU1cPSyE3lEWSUJD7lSKKYLN0VXkHE0apsRSDjs17ZY6vi2b/DkjryfX2xi8FqP4p1qNHtJEcB/d6MfuVfBUxO5X+fYDlecDePtkJqJbEH4Lf18eUn9O29gyPXrCeDae9VJYNd/8McMIHtMVtFw3sDRO+SNHfY/zAZKhiv0c5CMrr2S/KcUJQsxLTut/8tSUZSVTJocJEwkUSQIVBTcN/jlPoS/+AkLD4yIqVCe9pcxNMl+UGVPX1yX+J0EGD7LuQ0sy/jTK+Z8shmwYiwcwLaLgv6TOaAei5vAk8VdSlONhTh2c6IqMzlE2y6m63Yw0jgR+VNeFF/EhY7G+oQcpFMBez4n3ucxggo/ACfpIuwhSoiUeoHFS03to=
X-Microsoft-Antispam-PRVS: <CY4PR04MB0390CF1E330BA38D900228A7F62B0@CY4PR04MB0390.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(10436049006162)(85827821059158)(264703809997249)(145744241990776);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231311)(944501410)(52105095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123560045)(20161123562045)(6072148)(201708071742011)(7699016);
	SRVR:CY4PR04MB0390; BCL:0; PCL:0; RULEID:; SRVR:CY4PR04MB0390; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0390;
	4:7AdUvxzKeQVsNdCUdYt/8DCaVlR/iqzAfRMg3hls9U30aw9L37wxXrz4hEJRTHyKcbKUgKOyBx6daBmRJBwX2AJrDTkrZ6pzllmblaP0CLYEkESyiJr9ctjr9oq4QqUwJEzadb0+CCz6HO8vosqce2PXshC8Cconni3UuSHlX1t8yTuPkMWN/6vTOAIyhf284vqO9usiSRBJA58ijFXL+0j3tfGN2p1Woz1Qj1ZgJF1u5IOm6swGtvBxZTE5vyLxwtcq2eLFbgyX+JnHUIJEMX7ebBPX8jNo4Z0SOyTD88eyEMQW/Qs1eGUphIDKGlae3Nag3yKfF3AKaZnekMvIlmR/iyZTdb6SZmbEVfBqmrEcjTtmjffgPRtJahhqoTCu21uHnH2M04NBqRQFxrT8NCpyfgMGUayGdzkvgaich1I=
X-Forefront-PRVS: 07459438AA
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(39860400002)(366004)(376002)(396003)(346002)(136003)(199004)(189003)(36756003)(106356001)(2616005)(476003)(50466002)(229853002)(8676002)(53936002)(81156014)(956004)(81166006)(48376002)(478600001)(5660300001)(316002)(6916009)(6246003)(6666003)(68736007)(39060400002)(16586007)(6496006)(966005)(105586002)(11346002)(14444005)(8936002)(47776003)(2906002)(386003)(26005)(305945005)(66066001)(7736002)(186003)(6486002)(25786009)(86362001)(16526019)(4326008)(486006)(51416003)(76176011)(53546011)(6116002)(575784001)(52116002)(6306002)(97736004)(446003)(3846002)(107986001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY4PR04MB0390; H:ionel-work; FPR:;
	SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR04MB0390;
	23:TmQcisqVX0jliP1KYTkLc1SEMoPa9C/zyhbi7A4z6?=
	=?us-ascii?Q?pNIEjP+KV3EnS2DLo3z0xexpQvwu08VjAOBmhSadOLakE9ZJ7XHoUlyBxz//?=
	=?us-ascii?Q?68M9QQexUsny4EhhBbZYryXlHMP674NKcoqlAxptDlZGXJ3NmhtVOzbWYb3z?=
	=?us-ascii?Q?3PpwhjehetO02q9XO3+IkSwhVcZS2AhhRYnEIN5NzVK90z9JobIfIZebki6L?=
	=?us-ascii?Q?H8y4ZkoRD2/H2UuwYj6JakXR2HhoDKB7Ezi2Af/ZKsZlXKTKt1lS7hQy94hY?=
	=?us-ascii?Q?V5WdP9TsV4zr2D0+ApDqXFijNai1kmQPV8w31PeQxU54sRFtiBSgEbtE4Iu8?=
	=?us-ascii?Q?T+jV8HvaSKEcRWN0/Bj2YtkRNZYwIj4l97BvpwobE2Che/sKnIuITug817DB?=
	=?us-ascii?Q?fDtv9hVvwLcBeWjvbDRB/WorG57PgQgRepUHJLw5gjDDHKkZms8FxP2/R3M0?=
	=?us-ascii?Q?eMaQ0xwkaNB7AINPBXUkYNHeVoFUS7gGQU58IScuQaDwfaGHXag5qwVYSpLs?=
	=?us-ascii?Q?oVFOFFHHbtA+6+7i6aoKrLW1O/+IFZOj1T+vwPTLcL5c4n+XgXBKza8nGBt9?=
	=?us-ascii?Q?AOncNX01RmKbsjeRPKH9KKq17/2GKLLlgnOe2iUOsNlvdpsN26c+cy5La/1V?=
	=?us-ascii?Q?eRfUeGR9EtFC+f+SmUcCnzqHrHtS2TPWXcjZNFooKRu06ApACAIGUpM+zyv/?=
	=?us-ascii?Q?NkYSY8JA6fXLcoYA8TD99SuvtObqvvdgwl7pGHjy4VtuQd23HZrkZHD20Kgy?=
	=?us-ascii?Q?UNtcQb13YSl0rTz3x0RVIqib8OUooh4nJzAOGVyTULqtTlFMm3TnSCmYH3yc?=
	=?us-ascii?Q?DBKMZDImmX1gqEtfr4Vss8tmSnw5gZ/qAPoaXzvraDceDIQkIuNKTTObLXQO?=
	=?us-ascii?Q?djU401+IpLcbl5E3jDpgjgEfY1sevNU5iQEGykE8/kGnWHYFFdSr2TySrCR5?=
	=?us-ascii?Q?4ftRT0ZR46WKiH+HdfN0vSLS9LQXOALuDJd2PYlYwOiW+zUWmkJq2EagtFJd?=
	=?us-ascii?Q?/r2aOjOh5nNhYXfD9s775xXtcxOTSAmsgUvHKtodsbnO472RNnRn0NFAd5pl?=
	=?us-ascii?Q?JqUbreUkOib+seGeZ4qdUQY+v+jRRppr5cV70Tf+cUz1S5FPoWjkBPMlTYJZ?=
	=?us-ascii?Q?lESZuHWcwIMlLJFIyOHzXgqcSDFnEME6ZMSG65+BmlTWS9SS49X8MNMoIbV6?=
	=?us-ascii?Q?p2YLBL4SvgXzgwoHA2Y9wE5KUey7IIARkXHi9wr2olnv2H7w+5Q1gxLQW2Ol?=
	=?us-ascii?Q?1fjDJGqKmY6KM/wLM2sfsnPM0YYsUsRHD7be8m2d/iL4RKAtaz/CB+Y9yl5m?=
	=?us-ascii?Q?yAwvkPMNR/fojr42WeUWm0=3D?=
X-Microsoft-Antispam-Message-Info: EbJfPw5pl/jcJ+EUVJS5zeQFe37XQX/rG+RFDV7GfX8839GqLIGkIS9x2/+k7WaQYM14Gu8uZf/cQuWQ506WUo1475e9H5vyp+uG3YvOzi989Nx5U0njR1XcO0sLv/Dg5z8AiKe+GbSFt855LBekDOEEOruFC28iKBZzMz1t0BtHqjYHLPHDUjLiTGJ+RQIQRqoTly1DEl2rU/31dCUGlouaoxH5QuWJgYuyewj9VKNErkNKBazzW3HS29Jb77S7kdqDleUlk+f50sChLdNwIGoa5yN6nklPxrKCiJgADcaD3q5EmzuF/rKNHDEHxRMKiQ71fpJ2gMFFE00rooUlTVvMTBSETZVinpLX41Qo1Oo=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR04MB0390;
	6:k6jQjafdWjVDBdvGgJLm6T6RxRPvnppkyn/PMJnlGulXxHX8ZypIpIeXy2zKU+zjgPRh693mHcaAuVr8vf8Ql6JrgsFy5HYMROwze5aZd4SBHorv09KyYK7uops1klWI3PeCmMbFc7dfJedN2iQzaOjejWk9WFBh4cbO6Kp3PvCfwdgcQKYbElFnuBu9O/pIXSM6qpPsSkC7RF5BMstQqFjF/spTKE68m7OzGoGkyfji3PpfhCVGS3PrkX6V7DpIpc5syxKd5fsokWme3VARucp/NpNHMgeh/KUUSr2BGqY/HIAcIhLtedd/+N3lEOpsV0Skb3qI4W3PObMbEmb16yB/dO6mai7dCLDuGX0rG3BsIhjMtFU+CyQlev6TviYs6yQNs9V59a0HZ+JOJWwG44vjbfeMJiR0Kdy5GowYbTgcduPiO8i7VKPRJaWJ+9PuOO6ZP8DOXehPGUiLQRen9Q==;
	5:p04wXN+n+K7DoCB+38jlVxWmKWa06Zw1JV1eVtitBC/Dbu8D1VAVZ8rc7N1AQB9k5RfSn9joPPPmmeFKhtmFXPq5rE9vkvK8AZ1y0CQphIMv8PIiV2jXcmb6Kb9ejFyWgh0qA554q93Op5lLKYcX2QdTxDh3aOS+JWBP1cB5arY=;
	7:BcrfagOsjh4F+YN9Bo7kRYWrAPANIAlDaFhcB+/VA9SZiIOW/JbdoCDWwz+rgKEoY3HQNXMLSui0l72mnbtKCYnOpyoB+QOgmxEQXYvIpdYjFxiN1l9nzUACUHhDhFyP/9s6+myJh+auWWQDL2I8ktqDsLsIb3Y1P4o5TUPMBshV70T3/VPcw/JW0dkSQYOYQlqZcfYbG5HVZycSI6oS+xNYp3MUYc8JpaeJC9CZjUmHOLyFpI/k40+MLjdBfUOc
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2018 13:37:44.9417 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef9236c-14d7-4ebd-4090-08d5f2fcf86e
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR04MB0390
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-07-26_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=1 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=955 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1806210000 definitions=main-1807260142
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] util-linux.inc: add fallocate & unshare to alternatives
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
X-List-Received-Date: Thu, 26 Jul 2018 13:37:49 -0000
Content-Type: text/plain

Ok, I'll send another patch since this one was already applied to
master. Thanks!

On Thu, 26 Jul 2018, Martin Jansa <martin.jansa@gmail.com> wrote:
> This is good, but the fallocate alternative should be added only for target
> build.
>
> nativesdk explicitly disables fallocate in
> meta/recipes-core/util-linux/util-linux_2.32.bb
>
> EXTRA_OECONF_class-nativesdk = "${SHARED_EXTRA_OECONF} \
>                                 --disable-fallocate \
>                                 --disable-use-tty-group \
> "
>
> so now nativesdk builds have new warning:
> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: alternative
> target (sdk/usr/bin/fallocate or sdk/usr/bin/fallocate.util-linux) does not
> exist, skipping...
> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: NOT adding
> alternative provide sdk/usr/bin/fallocate: sdk/usr/bin/fallocate.util-linux
> does not exist
> WARNING: nativesdk-util-linux-2.32-r0 do_package: util-linux: alt_link ==
> alt_target: sdk/usr/bin/fallocate == sdk/usr/bin/fallocate
>
>
> On Thu, Jul 5, 2018 at 10:56 AM Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> wrote:
>
>> These binaries can be provided by busybox triggering a conflict in
>> do_rootfs so update-alternatives needs to know about them to properly
>> create the symlinks.
>>
>> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
>> ---
>>  meta/recipes-core/util-linux/util-linux.inc | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/util-linux/util-linux.inc
>> b/meta/recipes-core/util-linux/util-linux.inc
>> index 8d8f3962ff..ed5c618750 100644
>> --- a/meta/recipes-core/util-linux/util-linux.inc
>> +++ b/meta/recipes-core/util-linux/util-linux.inc
>> @@ -206,7 +206,7 @@ do_install_append_class-native () {
>>  ALTERNATIVE_PRIORITY = "80"
>>
>>  ALTERNATIVE_${PN}  = "dmesg kill more mkswap blockdev pivot_root
>> switch_root"
>> -ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall"
>> +ALTERNATIVE_${PN} += "hexdump last lastb logger mesg renice wall
>> fallocate unshare"
>>  ALTERNATIVE_${PN} += "setsid chrt flock utmpdump eject nologin taskset"
>>
>>  ALTERNATIVE_LINK_NAME[dmesg] = "${base_bindir}/dmesg"
>> @@ -217,6 +217,8 @@ ALTERNATIVE_LINK_NAME[blockdev] =
>> "${base_sbindir}/blockdev"
>>  ALTERNATIVE_LINK_NAME[pivot_root] = "${base_sbindir}/pivot_root"
>>  ALTERNATIVE_LINK_NAME[switch_root] = "${base_sbindir}/switch_root"
>>  ALTERNATIVE_LINK_NAME[eject] = "${bindir}/eject"
>> +ALTERNATIVE_LINK_NAME[unshare] = "${bindir}/unshare"
>> +ALTERNATIVE_LINK_NAME[fallocate] = "${bindir}/fallocate"
>>  ALTERNATIVE_LINK_NAME[nologin] = "${base_sbindir}/nologin"
>>
>>  ALTERNATIVE_${PN}-doc = "mountpoint.1 last.1 lastb.1 mesg.1 wall.1
>> nologin.8 sulogin.8 utmpdump.1 rfkill.8 kill.1 libblkid.3 blkid.8 findfs.8
>> fsck.8 uuid.3 eject.1 logger.1"
>> --
>> 2.18.0
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> https://urldefense.proofpoint.com/v2/url?u=http-3A__lists.openembedded.org_mailman_listinfo_openembedded-2Dcore&d=DwIBaQ&c=I_0YwoKy7z5LMTVdyO6YCiE2uzI1jjZZuIPelcSjixA&r=fzwh7IUt7VYYiD6094geII0kSDP3DkEnN0B8zB62AxE&m=V1fZFZwpNWpU4wVVxA-URTy3cqjalPaY7s7P99Cn6xw&s=J2ilhEzLUQJ5xhlsLhxVBkxW-1jbHNDeulD8sKxaP7A&e=
>>

