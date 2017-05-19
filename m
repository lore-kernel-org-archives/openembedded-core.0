Return-Path: <haris.okanovic@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 4479B601D3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 May 2017 21:45:31 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v4JLfvsm001711; Fri, 19 May 2017 16:45:32 -0500
Received: from nam01-sn1-obe.outbound.protection.outlook.com
	(mail-sn1nam01lp0115.outbound.protection.outlook.com
	[207.46.163.115])
	by mx0a-00010702.pphosted.com with ESMTP id 2aj89j83cn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2017 16:45:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=BBOqk2m4cpZgh2NEFqF+VBip3p7f33GBJK7RkLybdXs=;
	b=EXU0hRSIR2UiBkEPFIh/QokeG3/IAzbIqcG4CdY6H1AblURwCUdzQDNlmsZoDeFFKpC9X//Ioe3FXady6fOxeDZga6bXKWetEpuopt+TbzQmt1IbQx1fxG0dz8G2SCvpvUZhDjejt9dP61aDK/aSEBkgjaqGVLFhXes3C0AWPLo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=ni.com;
Received: from harisdt.amer.corp.natinst.com (130.164.62.171) by
	DM5PR04MB0701.namprd04.prod.outlook.com (10.172.187.143) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Fri, 19 May 2017 21:34:28 +0000
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170519150121.7707-1-haris.okanovic@ni.com>
	<20170519172941.GA3094@jama>
From: Haris Okanovic <haris.okanovic@ni.com>
Message-ID: <a94b3628-181c-98a8-643c-52931aceada7@ni.com>
Date: Fri, 19 May 2017 16:34:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170519172941.GA3094@jama>
X-Originating-IP: [130.164.62.171]
X-ClientProxiedBy: CO2PR07CA0060.namprd07.prod.outlook.com (10.174.192.28) To
	DM5PR04MB0701.namprd04.prod.outlook.com (10.172.187.143)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR04MB0701:
X-MS-Office365-Filtering-Correlation-Id: 0c54d0c1-4995-4f85-9cbb-08d49efed441
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:DM5PR04MB0701; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0701;
	3:MK410fBbFgTOc5922aD7y3u1mqvpQ4CP/BmJxYoWMHNs+JHjpJSnov7iNdYStApuIQ/iqA0cVsMdn9bdbOXQZMrUlMgOViuYZi1mHPJkyd9re8+PxRD21vbhnG/ZU0BU3P4s0OQVffjt6FlK/Rkj09+AMKVw/Db8jC9773t9IzLlkF00+unMsK89J/Cv2Sa994tc2/pZGpow3RZEvRNTsIImk27ZVwwxKSeRMP9sUp4rnduTNrJJgtAz7kG3xZd4Kz4SzRmwRJ8hAB6JVsxtOjwdnAKM14nSP9UZWY5RqtmggUmCAm4DmRSEacf6S9Zjj59XQv3tkJpbODH8cStf3g==;
	25:kwiAYRFlljN6sLC1jXKDDmeX+G9N1XK+pRvvpZw5ALYb1pVcuwGwrVrq66VvJtrVZnXFqFizuTDbKGNmXfJ29F8NF3jiP3UZ6szo/JmcMkgW6ME/sOQ3sqTPskzBSr10LEsGkIf1QTJiZ2yFbGyCOE8+NokmuerStj/osxjCUil6oEilKNRZKmhwmlrhu+japnuBA/7rwioGfMyxWSHxF7U4lb79dSpGsao/tX2+8lsiXcBS0ubUO9pP376PwWpD6NLHE7uAO2k0CwIR3FjU2L3EVyJizXBkQvHLggf4b+DTdtWsOMMPwhOtaBG9za/bZIGMuysQ9K9pX9w1zepRwvVZckxx2vo3X8x8J3JrlsRMui11KqujlITTx4iDeBir9bmHmHW0TArQ/cnOmuDniJVQW35fo2JsKJUpae2+qk4JhWe/YYfx6PurufUsDDPpr7sqsSQTvU6GT4RPcEwEaw3YBnIl39lZHUJfk2pFlBY=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0701;
	31:uYP2KKZI4p7l40KJeOqaW1JiaxMkFnuQSeyfnVE8FvnEVRkZt+wOd7Edqos60yuT4Dtq4rEX5BoaX3BRdSbanoA1k6p7OaH+TBSwzdSR4FVVHb5ruvyzzQjOGLXLViH1UUSUw0M/AbyxQ9SEdwneZsZ3lBdkaOqIlIectOg19ETyb2JqBWtXOC2Nj6hqipCVXwta5O3NNgB7EMA05hUsWc6EiVoukDMH210daetHTZ8=;
	20:uDaosnDVPrj2TJAoghZKN7KNZERpJzMRyb2Z6+2YED86SiQGWe5rj/qnK5EnlqfYv1ZW1vphcIqT2bXgonlPzw8pxJkVsaR0EsdKqxwlnn33pc/De+8fMa63D0uy78cP48AtiUL8+t0NS+tdALabI5Fi+XAAtC/zQFyXRco1aygtJQ5rCrIDTsKPxu25122KpYUHZWxM1nLdpwhhW5dz1TOXBzz8Pfy43n8DEdvda39Dl4iPEo8VhsYyDFt4rtjklLegAG208MOVUZNJvt/BesI0ZAwJNBBocRBhjED5zLdaxEU/+mgUS5hqTpxbf24yB6kcuQ7Di81Aikdcqz18dfSVAc9RYlwIBoNNUWRi0xBwy4QPbrAxhdCI6eYmJxx4kAkj9ETOR1RMoDOHjKArlTGFzj0htdLP3I6KO0cKR/3rSIdQU6b57/XHJnsAylkraSjNOgKDyhHcVi1P4yEnuX8VX4pVnXCZGicSQg3LP35xuHSHdUz3dugbYzkSiAz4SvyFIixn+kPlHdFdINV+RJpYdYYxY4nT7RVldCG6snMaZF1xdpg3xjYlNdHz9FyNM5A2iOCzZZ0yjy/n/R9MBpmYJsaGievIg3+NU8jbBwg=
X-Microsoft-Antispam-PRVS: <DM5PR04MB0701A80796012AFCD901C1C2E5E50@DM5PR04MB0701.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(20558992708506)(264703809997249)(145744241990776); 
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(6041248)(20161123555025)(20161123564025)(20161123560025)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148);
	SRVR:DM5PR04MB0701; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0701; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0701;
	4:3F5QGefptrMVMrROvlztsK50x7FT3sZAi+UQkvK4bS/o+sgyFMUfHvRjU3TyTxLk2F0AeCv2EGuhwZfnKKkHiS+uI+ZOnOfkxuH1pWWN1Jr6oU0jrCsAy22QWXaWxWOfB1f+kXfpUwYcheRin4A57S/VmM4J8g1FZMOTyQRd59yyXyL0qX2FDV9otJTsolwnIYB1IpDRfbLsUr5OoNUoGjOEX9cOgXUb5WdxVQ6lvNTdFToQ86yZ8Ey1vSLCLfMVBqm7t14R6USPiAoM1FQFfvTBwPrIEZpxIZeYhYMYnssRCt1kXxb0IMAKrqqohzt/loBVqOhr6YPejF2VGpCy9GXF8oB7N5lqN96vTdr7/FF6vnqiQMVmAjbndAzN+oIYmmOxjOqLDfI4JGI2hWFH8OuXaosZ5/Ek1Q63F4TmjdyBM/B7MU2ISacICpDZG5Fjslxw59GvCHPrLJHe9sqFriddhcjfxQLtTRuZCeAGPnht0rPIBOC/SvPwplGmR+BJLGVwh7SkNUpnnfMPsuh0/0cvw/mnXM/GEeToCPUZTidcA24hkH4L1+EX0EYPgLIyx7xtB1XW8VgTqvECdYAauaDK6NLg1OdKpEX22Ie6l+vGTgmhsY/LaUemDseC+cziW0NGYm2WwSn/d71PbEwNT/68QU1y3HgLhzuf/qMZFc9acJbkgos+zz8ry2FHCiWBe5qd7nSpwTfQb3lCcQ0W8ghTCQmcn+u/z/RB8gzIXcrdRO7MEJgHhDumdeb/lQPeZjaS1mMFIM8lEa2yh/Dy2u+qzMFrAgXAqKXFIBsv7TIAX9SyQLIomOZuFS/qHwmcfgpmLFWhSS3VQbIP0qk18pkgiIAUDIAO04uW2kC97VJ8nK0Xkl3UC0lwiwph2MRtdL4I/3yWy0b9JZ9KcEW83A==
X-Forefront-PRVS: 031257FE13
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(39840400002)(39400400002)(39450400003)(39410400002)(39850400002)(24454002)(377454003)(36756003)(66066001)(6486002)(65956001)(47776003)(53546009)(6512007)(6306002)(64126003)(5660300001)(23746002)(305945005)(966005)(6506006)(8676002)(4001350100001)(53936002)(189998001)(25786009)(83506001)(81166006)(50466002)(478600001)(110136004)(86362001)(42186005)(38730400002)(6246003)(65826007)(4326008)(230700001)(3846002)(229853002)(6116002)(31696002)(1720100001)(2906002)(31686004)(76176999)(6666003)(54356999)(2950100002)(33646002)(6916009)(50986999);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0701;
	H:harisdt.amer.corp.natinst.com; FPR:; SPF:None; MLV:sfv;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?Windows-1252?Q?1; DM5PR04MB0701;
	23:+JbROIXluLJ7S0v5gkNxvTo3dt9yxSdMAKFfP?=
	=?Windows-1252?Q?UrhXAZrZOI4pKrSuPOzPSUypA0/lqk1AJkSjvD4dGOaEtXhuE6C4HwQm?=
	=?Windows-1252?Q?vQ2HmV8v8reY89dWrbLn8DIa7/KXD8pF8S5fsSc4Gd/Sy3vu88wKFecO?=
	=?Windows-1252?Q?icCdzsQPq4oqqmAHugSAw1Lu3XaXItRhKUtKsUAw1fjvMd1VnGKMW0yq?=
	=?Windows-1252?Q?quAisAwA2T0ByZzTa3scKim6UFqvXuGmT7CYtZbM5knKhtL9hYy6V+M5?=
	=?Windows-1252?Q?nEXLkmYePmicGASjbLeBW4AgdpQQXKWLDR+rz62Q/ocA3WQxE+ZxIaK5?=
	=?Windows-1252?Q?QJV4np+R8XsDc2R9equ+57pEYi5dy5Vi7b35v4QArQPbXrBQDnCuzYm1?=
	=?Windows-1252?Q?rDjkAaDH1koVrXF9EdzFBYW5rFDcgBGzXjyw9JnLjxOWtqVAonsoqYLR?=
	=?Windows-1252?Q?pEN5zxktv6lPkcNu2p/y5E8+BKKpOSv8VE1DMB69ApSDrXF3v7qv3FKM?=
	=?Windows-1252?Q?LCIX2WyM4wFSZfajc+lsMtidfoFwairksw5BBmXO4qQkg8w/ZkzbC8wb?=
	=?Windows-1252?Q?ADCN+gQc/RryeSyL4iMFDcUn2IQafIxpg/N6FX2KntY8x4frcV+VWF+q?=
	=?Windows-1252?Q?dLpBjGzbioU5EOpERSeuPlcP1I0gf7bSpOFZ3SuIwLqmLz1XRoTkoAcr?=
	=?Windows-1252?Q?xoSO9TYEwYAsxd3bxUBN2nIh7bTq2SRVbIewbnbhP93BbrW/fu0Wq5VJ?=
	=?Windows-1252?Q?QIBeLUiYhLRDUKMTNvhmN89qZL+koOhh2psSXNVO0Pey3l0MX3WBl1v/?=
	=?Windows-1252?Q?qk+uDAmgK94bBAjSV1Xxunaw1BBlTjlitUPT7PCYaE8ADKK+eRd+KD4/?=
	=?Windows-1252?Q?ric/YejH/KQ2JgiGAL1Ior2ZwgxKt/7m9LuYZrlNn+DG/I+fTH2Id3n1?=
	=?Windows-1252?Q?7F/8XGnIEBULLqUwqOvSIp5nT3cYMSaENWNI29ienCqNXOId6p2wjCj5?=
	=?Windows-1252?Q?HqRji0vUJDxbY/0OYXc/L69hxP+vU7LdfIjiJvLO67UYQeylGTJVU9js?=
	=?Windows-1252?Q?6EctbmgTtVvncj6fWDA4rJ2k9o5nHkjg4mO751C1M1J3WJ0YyHvVbC6R?=
	=?Windows-1252?Q?kug7gWZfxUuiaiAiHXeKjzQNSBuOy/pz1HTdS+RNESqQhI5z6ovM23zD?=
	=?Windows-1252?Q?XK6cJL3m5E22qV4o9hdiYOL8EZGre3j+5ap5f8CWxyrV1Ggzc0PlkHgj?=
	=?Windows-1252?Q?3ru9+6KeN1Z2BgAioabqzR5tRF/ayC2CgHl251Q4e2FiGfsk23q++Tji?=
	=?Windows-1252?Q?AOK6oT10SUxKQNGefkM/RUHEl65Eb//jctKJbOuQh93taCWsO5TAwdUy?=
	=?Windows-1252?Q?E0fouiipMAool6tSRbJuZ2gs0UNr5eisYgFICjFvsbeHu5tFf4pvJoUm?=
	=?Windows-1252?Q?Q/W7TcgBfgWNFOPvPaP?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0701;
	6:drwskx1tDRxVk6rmv6R2TtUdqNZX9EpMxdAAn+hglrrqedge2eE/sMYvf4AaRTF7GZIZYN8Ij7hMM6mtKJrlDHe8yWEDhYA+9h7aRX51eyJ12uqmiCbyGYXEjB6Eb7mS6HsC7Ws/ewAv7GTYGrTkexDeUQaKfeCCa+LfywUlSjpngEvd4yaFUFU8CJnwCx+3VG5hpKvA2g2kCL/sy1Tu+1ITTRC38oBrnig2FiUW923CC9HS5kwHF+uQMFYXndjrOmj+/xBnxlZh32r6LyBeYY3sk5dXqljYDSoEr+4hS91cTOhAAWFD6CLiLRJDE0kn1EoskFWa85ylYNyfghd0++fehRN1mDKoyghQZhUFUSR8y7ILQPL2PBFR379u1B8qAfAw8gzc/aHSsxsemoWo81uhv62oIzV2+g6MG9X2hV9IFWm0YTrNkpvxpBH7pjfRiBGggoPhjA1HwIl5A2X5ELZPi2NUS6IjhPR0cwwt7naoXmvNEXUA1dcCFq12/8n4m6HXxOkVF951SBaFro0j+g==;
	5:3qqjFboMYtkZB3zfBhdBMdKyCaM3CTKO948daJU6WS62diqg4wxn/yDdHrWPCZrA+rkA3jKp/XjNK4CpnKuywK9FddNhMDdKuD8OzYPrKW+7O6dq04G5qBRHVUAZDAciCdLyAChKGolMoHbYbp4obQ==;
	24:Ql5sTdrQw+3jk1TiTEsHgqn2nwmEZiJGVyrVFnv9C3KOWaOL/K1dPKnyrSPIwi5+uvjEue7U6ctNfpoaSbI0naQBR2qEsubKfGQTfAyIx3Y=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0701;
	7:Mx9XUcCHs6WNHDQHj5BCcs0FbjIJjS0VgioFrmj7sglewgS9J7ERG7Frd1sunnOvyudoWkiDFuo0RF4FxuZP/Le5cIdt0Zai3dUyGyQpE82ALsOokqpK4JjWUmGnHcIVcYAbaffLxm2/0SqB1fDhtLB0Ka3wz7bJnqaF/Rka0kChdZ25XWoALGWcmd1HiJ7aCzdZ7SjiAZ947/0aMrWEtZ/iC4/VuzJM7UKRVRDdhsSXG8Uq8uwRfDdgJTp/X6RnTCLMQYcxBY93HKZOGKulNnz1u3E1/usikJd6x7801/8/jTxYkrxxm+QKuQUgoPRrreTQrxrxYFEBJLmHiNgCtg==
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2017 21:34:28.1430 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0701
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-05-19_14:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1705190137
Cc: Haris Okanovic <haris.okanovic@ni.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] package_manager.py: Add PACKAGE_ENABLE_FILELIST option to OpkgIndexer
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
X-List-Received-Date: Fri, 19 May 2017 21:45:32 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

> Why not use files-in-package.txt reports in buildhistory?
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5870

Practical reason: files-in-package.txt is an OE-ism. Our opkg-based 
distribution provides software feeds built outside of OE. We use 
opkg-utils to generate feed metadata like OE, so it makes sense to reuse 
logic instead of rewriting it. Others may be in the same position.

Philosophical reason: I prefer to build the file list (and index) from 
actual packages (I.e. exactly what we're shipping) instead of OE's 
environment. This makes the file list and index more easily reproducible 
and insulates that process from OE bugs.

-- Haris


On 05/19/2017 12:29 PM, Martin Jansa wrote:
> On Fri, May 19, 2017 at 10:01:21AM -0500, Haris Okanovic wrote:
>> Setting PACKAGE_ENABLE_FILELIST option generates Packages.filelist on
>> `bitbake package-index`, which is index of files provided by each
>> IPK package in the feed. It's useful for figuring out which package
>> provides a particular file/program/library/etc.
>>
>> Disabled by default since generating a filelist involves reading the
>> payload of every package in the feed, a time and IO intensive operation
>> many users won't want to run. Those who do may flip this switch.
>>
>> Testing:
>>  * Built an opkg index with PACKAGE_ENABLE_FILELIST unset and verified
>>    no Packages.filelist are generated.
>>  * Built with PACKAGE_ENABLE_FILELIST="1" and verified each subfeed
>>    has Packages.filelist; took ~3min longer for 8,200 IPKs.
>>
>> Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
>
> Why not use files-in-package.txt reports in buildhistory?
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=5870
>
> That should work for any package backend and better to generate it once
> in one place.
>
>> ---
>>  meta/lib/oe/package_manager.py | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
>> index b4b359a8c6..5e1fc48500 100644
>> --- a/meta/lib/oe/package_manager.py
>> +++ b/meta/lib/oe/package_manager.py
>> @@ -161,6 +161,8 @@ class OpkgIndexer(Indexer):
>>          else:
>>              signer = None
>>
>> +        enable_filelist = bb.utils.to_boolean(self.d.getVar('PACKAGE_ENABLE_FILELIST', True) or "False")
>> +
>>          if not os.path.exists(os.path.join(self.deploy_dir, "Packages")):
>>              open(os.path.join(self.deploy_dir, "Packages"), "w").close()
>>
>> @@ -175,14 +177,18 @@ class OpkgIndexer(Indexer):
>>                  pkgs_dir = os.path.join(self.deploy_dir, arch)
>>                  pkgs_file = os.path.join(pkgs_dir, "Packages")
>>
>> +                filelist_cmd = ""
>> +                if enable_filelist:
>> +                    filelist_cmd = '-l %s.filelist' % (pkgs_file)
>> +
>>                  if not os.path.isdir(pkgs_dir):
>>                      continue
>>
>>                  if not os.path.exists(pkgs_file):
>>                      open(pkgs_file, "w").close()
>>
>> -                index_cmds.add('%s -r %s -p %s -m %s' %
>> -                                  (opkg_index_cmd, pkgs_file, pkgs_file, pkgs_dir))
>> +                index_cmds.add('%s -r %s -p %s -m %s %s' %
>> +                                  (opkg_index_cmd, pkgs_file, pkgs_file, filelist_cmd, pkgs_dir))
>>
>>                  index_sign_files.add(pkgs_file)
>>
>> --
>> 2.12.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>

