Return-Path: <niko.mauno@vaisala.com>
X-Greylist: delayed 45624 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 01 Sep 2018 11:19:04 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0073.outbound.protection.outlook.com [104.47.2.73])
	by mail.openembedded.org (Postfix) with ESMTP id 80E6E7916C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Sep 2018 11:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=O3DnHzun9CqRM5hLiJgnG3CopEDNiFv2KTpCZ08B568=;
	b=txjM4E4v2HieF8cyhsai6JXyEjJhjC0K/O/bHaNvjz6XzeUtHe0mnwjUdeodCV3I+U02riEZS9OkisXhsUngEjkDkSF2gNVO3Odt/UYzPrii6E6e2T0yuQ9KCIPRHUJJLFJorvTBtYo4nCEpajTFS3CSlUKuTupKW7QQI0fWS2Y=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
Received: from [172.24.64.128] (193.143.230.131) by
	AM6PR0602MB3541.eurprd06.prod.outlook.com (2603:10a6:209:e::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1080.15;
	Fri, 31 Aug 2018 15:41:23 +0000
To: openembedded-core@lists.openembedded.org
From: Niko Mauno <niko.mauno@vaisala.com>
Message-ID: <ed7c4dec-e2bd-905a-cf2e-9c5a0ed31cf2@vaisala.com>
Date: Fri, 31 Aug 2018 18:41:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: AM6PR0502CA0065.eurprd05.prod.outlook.com
	(2603:10a6:20b:56::42) To AM6PR0602MB3541.eurprd06.prod.outlook.com
	(2603:10a6:209:e::14)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c3a4817-afb2-477c-f989-08d60f5834a5
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR0602MB3541; 
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0602MB3541;
	3:fEW8fBDiog6Y4E84JLqIDYWqyNS4qcMWOjOllVSAFcV6lUUMpUb9h9j8m9LfaFERmFCkaIOH628nECHZCH9AQL5yStaR+DCM2ZepK3JfLzZf0d35Fq7KFuQl5G5ao5Fq3XOJVfXLP/DPku0Od6u77Mri37cZUoiAj1N3o4Z2E7EBGJns5uANU+ckqdaLiVoq6Xp5NsWRcIJN/6JAH11ViUzx4fa1UtfUvpDVluSS11nVZ6b7NY4He0B6+MCj7tGX;
	25:Lcz6bIyUQH+PFG6cHH/lpODCWouOZ91En5ytAkHw8FtjDxkEM25+p3Sdm9GMngiqw7v/IAyi78BAfTYOtJRX6vEzaJ9aQAUJqiZPdvh1+lg5ReM/kKB3I5nTI/2Fa4K5s5ZW3gQsdYCMi1ZkCA7Z6V9W2Yk21w4dnXGJKH3dmDmyXWYqafpHSVZX128YHG4XL3Md1djjDsHeU566FK1H8XDHp9FB/g+zSOosGopVW5C2W1X33En5GMzu0lz4/+p66aQW22YVTULsM5hQ8ixKhd0xTzLTqQRE/Oip9C7KTSeePKk6Ph7d8yJ9RQscn5w4AsuZr++X0vl4voC9dQyqiQ==;
	31:ZZkBt7qFDJdd6fDmKocbuBi1Wj8M+mWTd0EMoL3dIJ76cMMSi2q5gf9jLrW+Lgs/48co/DT5pZm5n+u/Nr3ibQTgp817EJuWzCCvLiybtKL/kZY9HBzWoyrZrbJoNVa8w1ZJDQO8VRKvTGHHfyJwBMp2PpWZmJHJ227I6tmTJBKjeV0j50aMJCscADYS4KfgK+FoPhCMM5+ee6IljfJCYYriRPI5FB2sUNDfRSL8dTE=
X-MS-TrafficTypeDiagnostic: AM6PR0602MB3541:|AM6PR0602MB3541:
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0602MB3541;
	20:HeYSoPsJTZq4cgbtfH+lmllcO1RoUXTQQvMM18iYgJGIWPCaJaAUl+h1llBI+craWKJ8hG5Ay93SWj7kkp2ZrZfZRTEKuAAthm51a+AxMtMAlmF8QMgiWJELfu0Tz9LgIgSoCoxX3761D7CVhHoTNRYygWwpwCUD16oNGkRrWug=;
	4:oZWUbj6yNlTTHSaUYbcE++cV5aQdqNCQk9T7PsTAYarVRnomqpOo4OlDF+kD1xNY6Ol/D7IUw0FReo1KDkj/o1qngvfY0AW5nXhiOHfIRmMCAYTmdDHKORshm59ihQfvK5Sj2zpErWx8ktwFF5qIm4ZKsij7NHjBZOttUl/4L2JwUfivE6jwobpRtDrRZoH9yrVZ0khe4CrifoioqnHmWxSJ0cz6e35FVWHhqk/TNh46NLLrVHz1nOLvcn5740IZaVNeSb7phFTIuCqmjnDDAA==
X-Microsoft-Antispam-PRVS: <AM6PR0602MB3541C8071E1D67DA0535AC34810F0@AM6PR0602MB3541.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231311)(944501410)(52105095)(93006095)(93001095)(3002001)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201708071742011)(7699016);
	SRVR:AM6PR0602MB3541; BCL:0; PCL:0; RULEID:;
	SRVR:AM6PR0602MB3541; 
X-Forefront-PRVS: 07817FCC2D
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6049001)(396003)(136003)(376002)(346002)(366004)(39850400004)(189003)(199004)(478600001)(31696002)(316002)(26005)(966005)(50466002)(6666003)(65826007)(5660300001)(6916009)(77096007)(305945005)(58126008)(7736002)(230700001)(476003)(386003)(16576012)(64126003)(8936002)(486006)(956004)(2616005)(36756003)(16526019)(23756003)(1857600001)(68736007)(186003)(6116002)(3846002)(6486002)(53936002)(81156014)(81166006)(8676002)(31686004)(2361001)(106356001)(105586002)(44832011)(2351001)(52116002)(25786009)(97736004)(2906002)(65956001)(65806001)(66066001)(86362001)(6306002)(47776003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR0602MB3541;
	H:[172.24.64.128]; FPR:; SPF:None; LANG:en; PTR:InfoNoRecords;
	MX:1; A:1; 
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?iso-8859-15?Q?1; AM6PR0602MB3541;
	23:m85v/t1HQdK5XmaBgJFfoiFNwGuRG7iND56A?=
	=?iso-8859-15?Q?Sd8OViMADf1bvCcyTvM8u/8doARVfItBxQaYu0NKGQHyVrTP3lmx0qXA2?=
	=?iso-8859-15?Q?YiAq7m/nxjk2zwT+cSCxqomi+9khGhXSrATf4/yRt/1YfDjQVcX9MCr7f?=
	=?iso-8859-15?Q?AkO/Gw/bk9h25gJwZtNJkMwxX9UlKKxWokrSz7HAQ+zDKVA7vR0faBXsF?=
	=?iso-8859-15?Q?BtzNSSZtL5jLyABsNIwrm0r0L8VHq45l019F4/A3IF11yZ8iwuIpfWWFY?=
	=?iso-8859-15?Q?xu3HCQMo2KBlqbKPkmhYK9CYEoSw34ib6gQXg5vbCpbA0OWOlKHNIKEAl?=
	=?iso-8859-15?Q?KzGhvpo70+bTRtbd+leNQlOArKAWi8W0/3dB7BO7hKd0vpNz+ajc9dFUp?=
	=?iso-8859-15?Q?3tdRYEuTYPNNyzIJq005ZDq9JwWSSRkjejo5FnueP1nZBCHHVMn/Op+Yo?=
	=?iso-8859-15?Q?UxchUOcaPuNAcwZTcghCC81v20hN5nJh53DimQh2QAotapNQeNnEwl8Zr?=
	=?iso-8859-15?Q?W6T33jwyzjsDQ/z6+uhT25f8dp5EwvinSZ0fmKF145VGuKl3xTvNW2gkS?=
	=?iso-8859-15?Q?a0pvKAu/KaW+oCMhBj7stpG+gp8lx+HBVBKv5pbDlD6aqRQETyfS9Li/C?=
	=?iso-8859-15?Q?JOd9ozgx2xILyKUNW6pk8ZIIK99t6+hFJ1WtGM4+2scOMPNi7zyp+x2GL?=
	=?iso-8859-15?Q?GIdzyJmCa0CvgymPXJvn4Y4hD4KMISAG4HD5730bSR31Au/cy6E4Suemf?=
	=?iso-8859-15?Q?bdVxq5a1hsh3F4Olmq01qx1AzUAP28hla0v8cxY0125sH3Mgc9bBt53i+?=
	=?iso-8859-15?Q?Ath7B6UAjGXr/YBsrbvECiZha2zKCvuF/J+s/is+SMwGG3Ca7TI1xRWYO?=
	=?iso-8859-15?Q?yE6fVQzuCuCNX/uIsvlQhMWBKjA+CabrdnnbWh7zohI4p3ci4GdeTChmI?=
	=?iso-8859-15?Q?H2IFHsiTrEIwS2avCHW2JCrH5gn18cKvVWiHmsMVQrIjNK5x+X/N155Xc?=
	=?iso-8859-15?Q?p0Zwfx4vFh+NTXezlhExwF+bdX3vgiLnSgZ6SYc48tOnvZqt+P01sHq9H?=
	=?iso-8859-15?Q?qhotwU+bHtxVVm8oVk5a2B+iov6EnBSe/mCbHsyzVMG2aoUxa4/i65HsH?=
	=?iso-8859-15?Q?tH1wy3B6k61qzQbE02Db3BVdcr16B22fEK6A9aZV6XyZkBiTTT4tcaHkn?=
	=?iso-8859-15?Q?ATIq7gu8Uv0e68nJ/LWYTaP4vVhIy3HxrI3NgjIo0AwsSrgPF7JNaoGCi?=
	=?iso-8859-15?Q?QJv+na62d/fiM+3cBcBdmwZ+4mXzfXh5PE9DgjpZcGYRE3c00gKSLc2CR?=
	=?iso-8859-15?Q?a7zPHytQ8Gq9t3II4u34QL+E5PvId5gXUrVZBUZEA3Ou7vh3N1Knvj3Vk?=
	=?iso-8859-15?Q?LjBl8+WIJ/OMXQ/aUxQ+fp+eJbKwoQntbw9LgR1v0P5l0dtvXXnQWD?=
X-Microsoft-Antispam-Message-Info: TEuCJMch9ptiD1og+5NhaxtIRW/TtsCVtJPKv054Qx1TLz/75JUE3oXVob/gCAsMw/GbJvJtn7RgGiV9pgkhoN+kiBEjg3ptxJLDh5+ZZEmoC0/ymxxS6n7zn1k8X/RXa3l2AE79nTYXGIcnpQg0E9QO2xsbp7A+2WLXX1v+aPDTGXA/OJkFuCMNEfNsCUUie2Fd3bqPACC/Xmtw07NShsfzAOk7qGY/Rpvr6kgNqItVNJS6HOLsKXSfiu3H7TDGOC05rcIBjbjrqBcSP9DbOBPp4fzZqfHs2WtG8mzpCMxMu68eJPpYpP0HBB8Xh++VJcvt+1zu4e1aKhXnJhlpnKLBCIXDzUrL+JsE5hHOc6I=
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0602MB3541;
	6:l75CC/zV7yzMX8waFJTF12SZn7qrk+eDAgLo7zbQ5/FsyqUoJ1ZI9DsXoXR0iDV3I5pxLrs7Slk7EjNQI6t/cn98KjPLwTBSHOCCGERznnvTwt5lKUr0qf+nLAXHmW+Kt5xiEQtwKIMN/qsjV1eRDSM47XN9/HN40tqCi2QxWosd1oijTX6Yvx/XU6D//UbmZA27CzzPkcqL07fgvqe2wnGebIh2SlXFoVxadRAW4pZzaH5lhaXcBfnbjvv1GTPco/pYmxQQA7l8E/T5y5CuqMG5jNwf4G+itBUm+ud8fGqcozk7Kq8iX3RoWSyNHkxZPjDY5/Dc0TdEi0VEaUwHISlPxksFopaKtwqyJzEM9QmEYtlLQnXm/l4ckW0L5AX45OBPP/z2miKWUvZrFRw7E8YRVUetKu9vjZRtVoL1BfVvlVpRRgPiIYKvmPf+UlSUChyJQWOt6xdXwUVc4/HM9A==;
	5:vSkZYpfK8HkJ8BrMx221D0O8Ce2aFAT7F2Sr8y05x1wVlyJUBAgRP9b02GjD07hpFtVrlfp0G7a0/HU7DPjOue73jVa903G2jc1kz0UBst2BcFjbEJ9bpGPHo+Ny3KpWRDjbWge3iJnA5VuEVhhWRZdQQA4iKtig3U1PDLts9BY=;
	7:moiU/s97shRMQxrttXzPKQHTxHI4O7tK9qMJHB5McIB8/IeL8sTPLIF0rsiUfwnM/rmSV6+9u+h6CTgotF//uloHqdDj7vV9x8kxOgHeO1ivSigw9jQhJfnIJpqLC8RE9tsDYmR4o6Dni6WUOAxvo33yt1/GzMoYHtIJwHljpzO/dIIPEWNbgR4rhZdRFFZ5LXSgupQPiV2eTqoARa88I9/QIIc1i/rurzMPSc5T8JRy3eozcMse26pU1WJfaHQC
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2018 15:41:23.2934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3a4817-afb2-477c-f989-08d60f5834a5
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0602MB3541
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0602MB3541;
	23:9EZv+81ixosDwOB11DkVqLg7GLrsvLYM3dsnJof9cjN7nEyhg12cNqa88adwPJEifyA8+GsIqlLF6+uPOxKB8DPn/ul8TNB5eZaHJTJ30EWhzSMNFfy/g6mGvljS8DUueEdtOdGvxbbfj6Ft4TKvjw==
X-OriginatorOrg: vaisala.com
Subject: recipes-kernel/linux-libc-headers/linux-libc-headers.inc question
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
X-List-Received-Date: Sat, 01 Sep 2018 11:19:05 -0000
Content-Type: text/plain; charset=iso-8859-15
Content-Language: en-US
Content-Transfer-Encoding: 7bit

https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=eb24d4aeacaad9d41ddcbefd8d2ac96e95548183
apparently is needed for 4.15, but it breaks with 4.14 as we get

  ERROR: linux-libc-headers-4.14-r0 do_install: oe_multilib_header:
  Unable to find header asm/bpf_perf_event.h.

I used following to work this around in our own linux-libc-headers_4.14.bb:

  do_install_armmultilib_prepend() {
      touch ${D}${includedir}/asm/bpf_perf_event.h
  }

but curious if somebody could suggest a better mitigation

-Niko

