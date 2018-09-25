Return-Path: <prvs=8806058be4=adrian.ratiu@ni.com>
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 6510D71A0F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 09:47:13 +0000 (UTC)
Received: from pps.filterd (m0098780.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w8P9k8Ji016847; Tue, 25 Sep 2018 04:47:13 -0500
Authentication-Results: ppops.net;
	dkim=pass header.d=nio365.onmicrosoft.com header.s=selector1-ni-com
Received: from nam03-by2-obe.outbound.protection.outlook.com
	(mail-by2nam03lp0051.outbound.protection.outlook.com [216.32.180.51])
	by mx0a-00010702.pphosted.com with ESMTP id 2mnmeggfk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Tue, 25 Sep 2018 04:47:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-ni-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=+jl0mhM1kqOUifH/mXuqm/18dkgd9wwDo0pNLATnk+A=;
	b=McTFSQKvBIXAFf8i4Np0+H4Rh+MXj12zoOkzHHvPcgXUVk2+fWfORhaPwxXOR+3OkZjRozSKIBuJPH7C4RcRYUt7E30sTQDfqmV2tkB7i3CymYzx3U5/VPjO4IKou91E8grgQ4vVWz+AnQ5sgubXUGvmo0ScaFyRzDkRPnmgBVM=
Received: from ionel-work (80.97.64.55) by
	DM5PR04MB0394.namprd04.prod.outlook.com (2603:10b6:3:9d::15) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1164.22; Tue, 25 Sep 2018 09:47:10 +0000
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
In-Reply-To: <f23622c2b3d94603c6072c80e4958d0d291b06f9.camel@linuxfoundation.org>
References: <20180924132500.30363-1-adrian.ratiu@ni.com>
	<be7a233326b1d6709c57398e1a01ed5a371ddb3b.camel@linuxfoundation.org>
	<871s9jj5yr.fsf@ni.com>
	<f23622c2b3d94603c6072c80e4958d0d291b06f9.camel@linuxfoundation.org>
Date: Tue, 25 Sep 2018 12:48:49 +0300
Message-ID: <87efdhj4am.fsf@ni.com>
MIME-Version: 1.0
X-Originating-IP: [80.97.64.55]
X-ClientProxiedBy: LO2P265CA0166.GBRP265.PROD.OUTLOOK.COM
	(2603:10a6:600:9::34) To DM5PR04MB0394.namprd04.prod.outlook.com
	(2603:10b6:3:9d::15)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7eb24290-9d53-4b8e-785c-08d622cbdd6d
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR04MB0394; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0394;
	3:ZSqyHRx3NF/e1TAGqtAY3sH69FXeoJsyDAOB3glQu7tlIpikqdlhWPt/0K/pYCPGCyf6Uu5FXKFXlcCnbl03SyHetNfFdXQG9o0aVsVqbX3giKORYxibZNam3llMNrwHrmjhYleZsyCFF5/xCvuQcH8BC0swmnY+u+nMp+UEdf/psT7Uo0gu1Kkz/DCokrxSN1Su9eU0CJ0znOAjooVWlXt9WXvpkfSzllQGLdJl9iM4oAWU6iwBxTxoJoRNM/IR;
	25:cGBPZ/SnaISZq4PrDc3RunCZOb4OSHrSLUreZSx2eZ/CcZWZ4i0Q9YPLfBwRtFJaAuiWCnNv+V+QL2ABsXMVN/44TDo8Xbr6d8MQ7LnUs7gvzAs5vTlQ1ThYLBJrxjIh9VkqrlKv4Rz01nVdO2XoNLKtfsketv7OUXQ3gYk/qqmhO5wAZHIo13ZPow8Iv/+SpnWIzdQRKmg6cV3Ld/P9hLn7/IKuqYr0Dtn3L/sK9jSpb23EU1+O0SHdTwb7kd76IX0FFpZFXfBfpk2fEqO95R+r54fgz/VFN+2YLTCospkunKSPMKjmq+O3EevB2n/g0zLfJ4JrUyAk5KKCIVBwzQ==;
	31:ejE7fmOc9ypL2MEFdtpFi1xZlzrkk3A/o7erB+v1BQpVLzGWl9JpjF1G0eKEl1hJu5QKL+ojWOZWSh+Im2LvohQUv04vcVRdm/3cjjW1pTRY8/p5lVnTPLnXFGFFh4XC13jxf5GVrjF8rKpuMZJzWrcmsLhtXR1SV9AF5tPoOGK3lIoDydXMTPRFZHNgOLvRpl3PHtwqYsPi+H/PUcld/FxBdmnfQxoUwesW6hfgbv0=
X-MS-TrafficTypeDiagnostic: DM5PR04MB0394:
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0394;
	20:LJ7fBa3v0i2mltNTRni535rp6mCaWeNWxD+NgCz0eL2oDv9nipJYn72vxWxlOgk4Mh62mzxg9S8AhOAEQqyB4a+vM0VPUBXbvVx6lPQ3nLbUy5tn7ZifWeOC3tmEeCdxnxxma+8A9l3+AH39DhHEttWafg9ZZSBmtiEbSu9cWyDO1PscvbG9qz6QSVpWtBFDPoyBkaXRWNB1H/ucyRcM3ZMhOvdeNUMvEvz0vMxMiCVe1xQwJ44S4rkzI1oD3sJJZ6zJZwVwy68OYIQTEWuyhwLzhh4Cw1HjSmJwnRCgEGLC/JnwUMehzmJ1djGutopaE/Xt3DS6y7IHgwNhomBtEDJyICT2zYt0zwbdIc72XqCaCPLTLYF6JHr7ruRA8hryE+ng14R/lWJPSekfCQ2xZD0g1AaWmFpIWr8k96ErLdluMhSVPGFTRx3eN/mCb5I19odfvfXQIM7kSa7I7P8WTi6UySvFp3KqHRMJDDsMQ4OKhxm/1UnapqGgf6L6p+jelef37w4lvht7V1sf4whJvLfy6GBQMZfZzkO6S1VF3utpXJMm2frhb/cQZ6axi9901Jq1Gvnl9flESHrtjM/lNWeJsnpVqx4Ry9BItlgcC10=
X-Microsoft-Antispam-PRVS: <DM5PR04MB03945E7D5FB2583DB527114CF6160@DM5PR04MB0394.namprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(158342451672863)(145744241990776);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(93006095)(93001095)(3231355)(944501410)(52105095)(10201501046)(3002001)(149066)(150027)(6041310)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(201708071742011)(7699051);
	SRVR:DM5PR04MB0394; BCL:0; PCL:0; RULEID:; SRVR:DM5PR04MB0394; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0394;
	4:pH5ltG6VQ7zPpxXhZtKdvZlztjm3bg35QKvdVNuO6jbMYW6FLf4atXk67kcBHHAxneH7qhP4UnMpashLOUuOddwbwB3cLmVUsnfOX1w1a3qXIXjPUPxnH71gaIwR9+DtgEAyIUkcdpmu57SVaG5RwpNrLAx1kBc/qvB9KvzGQmQ0OgiToU6myNLh9SsW6B+WUJ8HHaJzxqHJZ6JdTc10udQ1iPJY8sccNc3wO6t/cF1mncuAKnvh6i99irFo70ZuBH/kw0nmkAfK0kioUc7tP8M/zVJymS0rD4WMR0WHQMR4PC6TM0tneaycMwFSKzbiWBvLe9kl/DIZwEZtKKuc/plU5JUtsR7c5FsyGpJp86Y=
X-Forefront-PRVS: 08062C429B
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(346002)(366004)(376002)(396003)(39860400002)(136003)(199004)(189003)(386003)(51416003)(2420400007)(52116002)(76176011)(48376002)(3846002)(81156014)(6496006)(36756003)(6116002)(66066001)(25786009)(50466002)(316002)(6486002)(53936002)(6306002)(8676002)(305945005)(7736002)(16586007)(10710500007)(2616005)(956004)(478600001)(8936002)(81166006)(86362001)(105586002)(446003)(476003)(966005)(11346002)(486006)(106356001)(229853002)(2906002)(93886005)(47776003)(7110500001)(186003)(26005)(6246003)(16526019)(5660300001)(14444005)(97736004)(15650500001)(6666003)(68736007)(107986001)(376185003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB0394; H:ionel-work; FPR:;
	SPF:None; LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR04MB0394;
	23:rUVyhZzHuSE2sF5TQPgs4iVdaBi1hUuBtchmMBjm2?=
	=?us-ascii?Q?A1ErmGgtd1TeNJLgzn/L9HWAzDLOdmhIp7gj46yrsCz7tEMXj0RzoJ39v2YZ?=
	=?us-ascii?Q?vDB4UB157d2Pa5UNCE1yoMGLICBeR43ezVDA9KE0XPWaIjR9YHZ5j/ilfsaF?=
	=?us-ascii?Q?qUMY85U3dPavvhzRMZb+AhskSPNqPVejtLa4S6myVaeDQWf5jbYtuaaDmPu7?=
	=?us-ascii?Q?bAsaUBlbpt/OQr2noGGW80uAg3kftel5oq53Lp+VCn47bcBHi895wh0r5RWn?=
	=?us-ascii?Q?gZ0c22QPMYz0yQRez/UPWsNJAZzrFcIV9sLY+aUgnqwuq/iRGN0VEQND3/kI?=
	=?us-ascii?Q?31PdLppCChDLvvRBPm9OuK4TBWZmRiY45bNudPeVvTUDxRcLQqGLMlWDjQxm?=
	=?us-ascii?Q?Jn21TjvjEEvrHz15xwqJGCt53bKo5vBsnJ9BV6v9djDcp9+i/IEFBEMKvlG0?=
	=?us-ascii?Q?SufUTu4KkKgtpUb3fNMX+KdRl4n7+2C4XiQ+VAzzSstg5eow8ZdXJH6Rimn8?=
	=?us-ascii?Q?QhWmU7gyz2SP7jWdXAn4rKzs8WEO/oYLzwbXzgzdFGu7m/0e3Gf3bTIYKeiX?=
	=?us-ascii?Q?DF1zc5bI/bLkzbNt+g6UUMdQ5SwmDGW9BNf47ZDmK/38Y3EZoWYgTEH3mbYo?=
	=?us-ascii?Q?CM5xr/wgQyQG0e69kQBpAuLWoh8UzlhY3RwRujEYFxh96hyMtA//X5BmfrYl?=
	=?us-ascii?Q?KEQDeP1QHHiJPINyFQCi4zx3STqEkWAvs2JcLbfZ9IvWfHeJE9H6zlPIielU?=
	=?us-ascii?Q?rdmYAmN5ggaLLOqLC+VCAL2rkRvQmRGfmOitDml8Pf+TCQickMIg0kab1fSm?=
	=?us-ascii?Q?UgtWa7BDDex+RTFsU6leGiNMBF1kawQmVB7Omh7qbyhLMkZOVfWpeIlEmeRa?=
	=?us-ascii?Q?LIpKXxAh7kDngUjSoaF1h+uHF7MNAiajcOHxonBIqNiM85eaSnS9tgJZIGWJ?=
	=?us-ascii?Q?n+jczdbZBAt+WS8+rVeitbRgoguAy/8fSZyK3q1RF8UZMUfBoc9fObwpokyB?=
	=?us-ascii?Q?PYM6i6htQn6PAkfKdN0L0rdx7qywDi8yIVSO9WRptOsQhCN+M5p0HciUiRS+?=
	=?us-ascii?Q?Rr4bMOX/a75sWuYIojrFupjoJ08Bw5Znf/Ku52Wqp+4qALrPBUq8Yq3uNWEu?=
	=?us-ascii?Q?Xmg+urJhRUs028Uq0Hg/lx0tbDRGzrYJxZp4J+Gvh0eFwLeoYsirXUxWhzUw?=
	=?us-ascii?Q?F+aHZ7nR1ap1ZzPTezfEPUXliYhTTNGR3AdlJUTsbDNg7doYHrcZdNsosTMv?=
	=?us-ascii?Q?LQKMkKZ4hqXKWE9IpUtXjmw5banfE+fzgAVHrkEtj01bZ9CnaIaMC+2fXyu8?=
	=?us-ascii?Q?EN1uzI54/XY13feQd2SYb/bUp1qy4S208lUnrQvXA1YGGtf8Jw+CAIpI0DDf?=
	=?us-ascii?Q?GyVZw=3D=3D?=
X-Microsoft-Antispam-Message-Info: 7LcC8rotCPEWeavoElv1mHu/UZlhNgBqAn6oe+SDlML2JUgdvOUzpKjzO3QJnxqmBZktLjzzjUw+zlxTc3vNzP8HSeeihn9CMUQrxRdtxO+SaKmai0O+UfCga4A+peSrzr2h+SlH3jSc+pzByS+Xfepz6hrgiDpagYUEdhU/xos3osm2Qjuz9oQwD2e0jYw7k+Q3hc2004RDnnmvVqwQbB3w3h3HMmGym/iVUVUcHYr6CacqG5tkF2OFP9+BWDQbvTwWQVT2FTCJCdaCTETwag4D6iYDrYoo1HccQh7vZKJwn3apqm42uadSqJ+c1TMJsbJ4XG6uqBbFtvQf2gjeUKOlcITjSOxGTqnFEcJ7UgE=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR04MB0394;
	6:+xe8Dxrr57m52t/LwaFg/U6X4xaYgtd7mnqhb/9lyVMRTJYaRQY26I4WwiAt2N7aTphcjJVnHMlDpC1AY/hm5Vhf9pGE268oDQYB+Fym56dxPGxHDc/uQZs3Dspy/WsZKj1ArjxRnHnZa7WaLfXZAJP4kh6sHmDl2boHoSaqkaVHVqRseEduNhmqId2VkdL6uGkQpyiPnyNdaEn3NHelgm/GD0QUOnGyZ2ohYfQCk5vuJvwzwo6c0CGNphQiiMzwbrklHKBtJttkZrYZhpKjfUEM4A4GiU8eRlG9TzQ+sTGG+Kt0vw1VCmS6zFP1mIariljcqYwS4p+B2iDD5iQzUmhFAHDq3DQevmXJbjDkOJVa8yEmX0hyiBoHdOvi0ZdQQpB12eQpiee/gOxb6inPDMgQiX8LaPpFV9QQ8A3qX8bEd2ZIcmKhBF6q6ae1A07iEq7kDVztzXjJfcRJmbw8cg==;
	5:x7M0g1r5OlBAlaXwVIfAAEMsIhhkYx8MzbYfXBR5M8/CpvW8pyrfiXFBIg58pfZwkgbE5q3WOCAFfAK8RTgVApESaFk1WXX0EZaI5lUqquzbXJ+pJVfK79s8u8tg5LUzZymzW6eONQqgOFBc4WmZfW8yknJVJ8U7qu2D8J1lqcI=;
	7:Sud2CTZB3S72mTakMbuAYLbu+rWdU/mjPb04pyQeajHa2QKbEg6AGrXC3Z3TDHRLC7T6yM+78FcTFmzSDPWPK8de+x0A8lj6ch37f3yto2OaXtQryu5jSGukU0TWQeBaZYs+p8XaY7suf8yvyRA8UZy8FkYrbjAVUzn2HVHzupqQCF8yyACgx28v0OiiFVn22K0ZXBL51cArtX7xrO9UpCy7Xjiv9qd3seww3RxyOPC2pX4bWXaQr7Mzkx+lMcZZ
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2018 09:47:10.0960 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb24290-9d53-4b8e-785c-08d622cbdd6d
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB0394
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2018-09-25_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=2 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1807170000 definitions=main-1809250102
Subject: Re: [PATCH] rootfs: always update the opkg index
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
X-List-Received-Date: Tue, 25 Sep 2018 09:47:13 -0000
Content-Type: text/plain

On Mon, 24 Sep 2018, richard.purdie@linuxfoundation.org wrote:
> On Mon, 2018-09-24 at 18:00 +0300, Ioan-Adrian Ratiu wrote:
>> > With master, a copy of the feed is constructed under WORKDIR which
>> > is
>> > then indexed since other image generation or package writes could
>> > occur
>> > and the index isn't static. I'm guessing it doesn't do this for
>> > external feeds and assumes those feeds are static.
>> 
>> My description of the problem mirrors my understanding of the feed
>> construction process which might be limited especially if it changed
>> on master post-Sumo, but the answer is yes, external feeds are
>> assumed static.
>
> Ok.
>
>> > I am wondering what happens if you put a remote (http://) url into
>> > this
>> > though? Does that still work or does it break?
>> 
>> It still works, we're using http paths all the time in our distro
>> (public feed server is at http://download.ni.com/ni-linux-rt/)
>
> That is good to know and worth mentioning in the commit message as that
> isn't clear.
>
>> > 
>> > I'm also worried about what happens if the file:// path you point
>> > at is
>> > owned by another user and isn't writable.
>> 
>> Thanks for pointing this out. Looks like it enters an infinite loop:
>> the
>> do_rootfs task is stuck at 3% and a worker process pegs a core to
>> 100%.
>> 
>> Without this change, do_rootfs gets stuck at 12%, worker pegging a
>> core
>> if the feed is owned by another user with no write permissions.
>> 
>> This was unexpected :) I'll roll up my sleeves and start digging.
>> 
>> Do you have any pointers about what might be happening?
>
> I was expecting it to error, not hang. If I had to totally guess, I'd
> guess at the bb.utils.lockfile() hanging.

I can't reproduce the hang anymore (with or without my change)... I
tried re-using the sstate, clearing it, all combinations of calling
bitbake packagegroups, package-index, image, etc and still no hang.

I'm thinking the hang was caused by a build race I can't easily
reproduce.

Now I get "operation not permitted" errors every time like this one:

Exception: subprocess.CalledProcessError: Command 'cd
(...)/tmp-glibc/work/core2-64-nilrt-linux/safemode-image/1.0-r0/deploy-ipks; 
find . -type d -print | tar --xattrs --xattrs-include='*' -cf - -C (...)/tmp-glibc/work/core2-64-nilrt-linux/safemode-image/1.0-r0/deploy-ipks
-p --no-recursion --files-from - | tar --xattrs --xattrs-include='*' -xhf - -C (...)/tmp-glibc/deploy/ipk' returned non-zero exit status 2.

Subprocess output:
tar: ./core2-64: Cannot utime: Operation not permitted
tar: .: Cannot utime: Operation not permitted
tar: Exiting with failure status due to previous errors

ERROR: safemode-image-1.0-r0 do_package_write_ipk: Function failed:
sstate_task_postfunc
ERROR: Logfile of failure stored in:
(...)/tmp-glibc/work/core2-64-nilrt-linux/safemode-image/1.0-r0/temp/log.do_package_write_ipk.21668

Seeing that the hang is not related to this change, are you ok with
integrating v2 in which I'll update the commit message to mention
http:// URI's still work as expected?

>
> Cheers,
>
> Richard

