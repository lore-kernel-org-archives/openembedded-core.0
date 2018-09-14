Return-Path: <alejandr@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0087.outbound.protection.outlook.com [104.47.38.87])
	by mail.openembedded.org (Postfix) with ESMTP id 4EF29799DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Sep 2018 17:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=HLF/FTb9wsAijelDq0/XDDowyaka0wUafdd/tgvZiJY=;
	b=E31qUEfnN/6ColsClbTDz7ljApWN+DK+kLGg1cZS2TPkSPplzjA3HvZUCYJzyx5mZHuigLGHJXisSZtloUPbApF75QNA7br8gt7U9pQphODiPIvYwS9iDOtv4ubTN1HAJfaBbWWEyJXsN4/VOJaA0daZgp+mXArTGDS0zynbdI0=
Received: from SN4PR0201CA0051.namprd02.prod.outlook.com
	(2603:10b6:803:20::13) by SN6PR02MB4479.namprd02.prod.outlook.com
	(2603:10b6:805:af::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1143.15;
	Fri, 14 Sep 2018 17:11:06 +0000
Received: from CY1NAM02FT032.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::207) by SN4PR0201CA0051.outlook.office365.com
	(2603:10b6:803:20::13) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1143.15 via
	Frontend Transport; Fri, 14 Sep 2018 17:11:06 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT032.mail.protection.outlook.com (10.152.75.184) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1143.14
	via Frontend Transport; Fri, 14 Sep 2018 17:11:05 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:42656
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g0rcW-0000VI-UB; Fri, 14 Sep 2018 10:11:04 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1g0rcR-0003hZ-Qq; Fri, 14 Sep 2018 10:10:59 -0700
Received: from [10.23.119.150] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1g0rcR-0003hU-1S; Fri, 14 Sep 2018 10:10:59 -0700
To: "Burton, Ross" <ross.burton@intel.com>, Andrew Geissler
	<geissonator@gmail.com>
References: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
	<CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
	<CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
	<CAJTo0LYBrnBuL-jTw6cDXf6qztp8H5YpphBgsrrUyUuaQ-KoyA@mail.gmail.com>
From: Alejandro Hernandez <alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <20cc8e16-0e80-328e-d084-d36d633098ad@xilinx.com>
Date: Fri, 14 Sep 2018 10:10:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYBrnBuL-jTw6cDXf6qztp8H5YpphBgsrrUyUuaQ-KoyA@mail.gmail.com>
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(136003)(39850400004)(376002)(396003)(2980300002)(438002)(199004)(189003)(65826007)(93886005)(5660300001)(76176011)(305945005)(36756003)(6306002)(230700001)(53546011)(31696002)(65806001)(336012)(65956001)(316002)(47776003)(966005)(478600001)(356003)(77096007)(26005)(64126003)(186003)(8676002)(81166006)(3260700006)(486006)(229853002)(81156014)(8936002)(54906003)(58126008)(106002)(446003)(110136005)(6246003)(2906002)(50466002)(2486003)(39060400002)(23676004)(107886003)(11346002)(9786002)(14444005)(36386004)(31686004)(2616005)(63266004)(476003)(126002)(106466001)(4326008)(67846002)(426003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR02MB4479; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT032;
	1:bvdEX+9DkXcoeZBfIG3UFlsk9VZfNajA8//xXB+kNgb6UDfvId6kjxCc6ZzDeDkeAx/SpDMEsD+a/vgeGO1wjbySLgpdzHH1oK/MIpLug0urCbk8g1fj9zBjJQq6mE3d
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4702de59-d184-480f-9374-08d61a650e7a
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:SN6PR02MB4479; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4479;
	3:lk3U5Nm7HLTW6F1jEccrOQmmrXA5LbkppXzX6TJeFwns+IBIn1eeRibg8juxOnjb4k7TgZGb6aReNYGk2tEMC3bTOmdon6/42yVm8NzZSkP6vzdZqyY6N1jfZyqKQZ2fLXe9drq1iDx5IuYdjrKSYgH++ZjPpF5T1VBvtjbvjTYxvoA3O+/xf+J9NKNh1qHomVwQLrYy49A9kKzp4UHHosDTaZU2rHJt6S2nNcfsikZWQJSPlWQrI4ABfv3zm9t8NmQvFWh18rY3Su3JnpNtEGYLucFPW9TJBrK/KY7F4JpbvEb9s+c5CIgfEzvGWDKhFf+Zjb3oIjRqyzvOsGHx6ddTWar9vHafBJ1h+6cB7ps=;
	25:Cz8N+ZUF8opg5YUACETSBSUJZN4bMr4DDMWoq58SzM4wL5Fxhnc/HB+ReWGarrYz4wsWEJmkuNX9ni3JzrNgtwLgptN6qMGwi5AhThfJI7U+AfIzVNZmIVUh/RhC2C9hS3KcaXm5jc8Vi4fANf4X9A+Yj8sL6W09k60pkOoms6S6dfhmuFUKlYvkIglhHGqBtnRDyUixXEvZb9donH1eEzcuEz7agWIFfW29jkm1d5KVbINsWW+vGYl+nhotvwmXIRe8utXgoDrIDhvQINkEsu9A6+RQ5yK2QzPTZ3P+9b2bFP9xUM16P9oSctm3PkmxupCcwbMYHtk8MnZ2rvBjiw==
X-MS-TrafficTypeDiagnostic: SN6PR02MB4479:
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4479;
	31:J2qCBQoHiuZ564TEFGCQaacTiukjUwcMsGXSdtvAe3dnfp3wwjSsbYW/Z28OxwpRf0VTIdNCd5URwsmdAEnUUw/jaqY8VxCMOdsva9EZDJxun3ztqiz+jIfpmy2hPH+ZPnWzFkwXjQiwwQGkIEKoPaFGws1IV73cnCckBx3phgTgFFbyXzbEny7sM5B5ZaU9B+LJsv2W5cDm/dP6BySzE8/IO6dpuFANY3D1GYEEZYE=;
	20:5hfECfrn1ewfhautDULL/BMEgKSELttjIprgWUi7ryvqfqaeXotp/+qFHqabKSAZAgZg13C1O9mLWMCKrG0SJ10kknKFv1PIcAulyOzoBZflGyMt/sn7ijya2G8b1G+wToNAnD1+5ojN5WVubEnHmaNSZIiriSkzjEFQRpasBw6obt2lZtVRBLpbN7Uomnok6kYeiqrP4o5lxlFlMSuKykkuOY+uQr8k7OJ3TaO5gRpJPhWNxv8xpbTXelHoOSnZOgbYt9fcD4SRD45jyrXxnOw4WQJCZW4PhuSeNT2MNHVlGU15d9FbxVSTXTnuS9zo6SubJzClv49O3TAwzgDLiAhaBe5iEtYD4yQ/ZGw3TpLlPsoQKXdEO6i3TVdpAdh9KVWVTAsTK4u+O5FVWNYJqvEHBTOu8qmKca7Vvezqa8sdO51bEW42lI2PBws7/xgPj9Xt2j8kF1BRJVdErgAXghYR8GqJkPXTGJS+hp0v5uIi7Q5CkmQLgbWGFknNCKxZ
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <SN6PR02MB44791A7639447EDA674A533BAC190@SN6PR02MB4479.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(228905959029699);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231311)(944501410)(52105095)(93006095)(93004095)(3002001)(6055026)(149027)(150027)(6041310)(20161123558120)(20161123562045)(20161123560045)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699050);
	SRVR:SN6PR02MB4479; BCL:0; PCL:0; RULEID:; SRVR:SN6PR02MB4479; 
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4479;
	4:meNgfa50ong+QVdGhoP3pvmzVjUQpzAeH8UyRsT8N6UHwYS+sbFnig0bqhDSNYIYXDka/ZD5wohx4pc6BYmdafMyi8MSrivsPxgYF+S1ME08qZmgeVrB76BFBOO1xJDw1VURFMGikx9zyi6mDh2j8CUC7rQBqfewMAfZtr9sCeWIKdw35nuz8XZjLfQDwamEpsTjq3tYxPWn137+0EL6IUURp1CPliQVMAz2IGQfQEK26MGCA7xZFDMZQbGnlywpz/pFq1VGBbpxEMPqzgQWCHwgOd3vq4vuPw83B4ipV5WYLNOteU5TgiHN6zu3BokihavVCMhJEKlC6p8c29onsVUSyKAfovsQjpLEgklyqKc=
X-Forefront-PRVS: 07954CC105
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtTTjZQUjAyTUI0NDc5OzIzOndWZ3VhQnRHSDVTMkttVHFnR292c1g1RGIy?=
	=?utf-8?B?Nk1FN0NSalIxYWExQ05xK3l1TnVtVUhyY0RmdDVwMXRaK3oxSlJjcTBIb2Vy?=
	=?utf-8?B?UkFka256bXB1ZjYyRytrdmo2SS9VdmFoK08ySWZlR1NOWnlEdld4Z2VvRlVG?=
	=?utf-8?B?Q2VqdTZQVmVQeElScUFlbEc2d2pkYzJmd05YVlc1SkNVM1pWRXVvRXZoSlZH?=
	=?utf-8?B?K2tIQUhzcXZFM3o4ei85K0c0Rk5ONXVtVFF2TEJ6dzRsOGdCbExEVzR0MzQ1?=
	=?utf-8?B?bUpCZCtIQTZOQ0l0cUREN0hTaTlxNDYwclludk5jdlFPaEtTc3oxRGRya2JR?=
	=?utf-8?B?a3dRdzBXbVVLajEzMllwUWV1akJSZzQyMXVTbUtsY0hHK1JqTGdJQTZJaEx5?=
	=?utf-8?B?MjRLZ2tJZDNrK3RIVU9VQzUxWUQzeUJKdGZ4Mk8zdlNDQWlpaDBFTTlWS1FX?=
	=?utf-8?B?cWpoWXcvaloweXZ6QlNkcHRURGE0WmN2WStNZDMxN0JxSkt4UzErRUxoaEpG?=
	=?utf-8?B?c3NDQWlYcG5jU09CbUVsMGE5clVZN29jQ2NYSG5hYVRTVm4vSlo1MjM1Rzkx?=
	=?utf-8?B?WHhHS0JtcmJnT2tWejF3a1hCRlA4dldhcy85Y3l0S1Z1SjE3OUE3ZFcxa043?=
	=?utf-8?B?NTNYVERhWCsxbHRXRW5iYm9kK3ZHNUNPMWVWc1lXaFN5SHRqVGpLWkRrZCtN?=
	=?utf-8?B?Q29VVVNaMk83KzhRWVZJR2NGaytLb2RFN1lLeDVzV3JnRld4amtIaWE2bEtE?=
	=?utf-8?B?Y0g3M2hVdGpPZEdRRXNpckhYK1NoYllFMlNKTnNIWGlZS2xsY1dWNlV5UytW?=
	=?utf-8?B?U3VDV3hYNG44M3p6Sk9tMzNLbURrTWFyRjFrTTJxZzlRaWN2U1d6N0FZL3ho?=
	=?utf-8?B?TlY1QVRLUEpGQzd6aXNiY0ZEM0hJU3E3NFdOTFkrckRGZjd0L085S1ZKalBL?=
	=?utf-8?B?SXVlUTh5c1pRMVZodEFGOThDTUlvMUtYSEZ6ZTFUMG13cjNqbEMzR1hDNlpu?=
	=?utf-8?B?dkFVSk95WEZYSXN6OXpQMnE1LzlyY3hHREZNMUdxZ2JoVWhxbHJTc1cwdmc2?=
	=?utf-8?B?QWc4cEU0bVl4WVBkWWxibFB4TzBkRVZTcnVLcGk1OVhZSjVkWjArUjEwVy9n?=
	=?utf-8?B?REtxMUs1UWovTGVYZ29sOEpiZDd1YmhJWDVQWmcycFVyWk5ZZUdjdXF3ZDJt?=
	=?utf-8?B?bG1QaEtyK2tRZ3hLOFM2LzVZcDN0emdOY0xpTXpnYnp3RTh4dVJIUEZpRTBr?=
	=?utf-8?B?d1lxazVlUE1xMWppQUFYYndOYXI3QjdXYm5kYmhhN0lYMktzR3VmN0RjdXlS?=
	=?utf-8?B?UmpsMnB5alRzRTFMNVdjWjdNWFBnV3gydGdpVDBwMmcra2J1R3Nub0ZmZmJ6?=
	=?utf-8?B?TjhtalR4bW1pM1FKa1JSWjQ2cjBBRUQ2WWhLR3VjK2x4aENRL1BoQW1Mc0Rv?=
	=?utf-8?B?b1FwUFExZ1pQSndyZ0FvQjZZQmVwOTkzRXpkOUxWK2xVRWU0ZFVhUVorUHFU?=
	=?utf-8?B?eTFhQjNHSk9iaHkwYjhEV1pRbXlDTVl0UnEvTE55NXljdTBrczQ1VSttWXZI?=
	=?utf-8?B?Y2Z3YkVmTXkzZitRdjUyRTBZRnoxQlhWVkIxbGdhNUpDZmlLelBFSzY5WHda?=
	=?utf-8?B?Q1J4RmtXWm1iUjRIaVV3bG9FMGNvOW5zUjJpTG9vRlFPeWpkNHF3TnNxTHA1?=
	=?utf-8?B?RFU0SlVrMXhPWU1NczV4QU5Oa2ZlK3BwT2w2UUVrbE5zM2V0OFNIdTVaeUZr?=
	=?utf-8?B?VFkvd0RSaUJvZFRzdkMxMUp6L04wNVNTVGxKdVcxcG1Nb0pKcFpKUVFPWExt?=
	=?utf-8?B?YnU4bEl3b2YyeHRIM0hoZFVxTks1SGRRd1BaN0IwWFhXblRnNXhyRUMzZEFC?=
	=?utf-8?B?ZG1MSkFPSmN0b1Y2aDRhVzY1SG1aUjZRMDRnSHJxNmN0VFFHWkNWVDdqenpS?=
	=?utf-8?Q?GkXPV7LhtEOZjeXdz6rJtCGkASFJh4=3D?=
X-Microsoft-Antispam-Message-Info: AAMsZSqSSpY+JWDgGdAOSF4e9Dl2iS9fp+DJ8Ral5qTb6P359IZWjpdG9XpInCTfrtQFga4KqiHS5K3flY2LxGS3yfZTigA7cDLo4V5l6wr3lSPMfUmqcK7FMbEa3P7YPiFvJdsKErkXqdTfwdHScyQ6lCoyOguH0vLNCj2Mro0lbcOLXbqvTi5DfPSwDJv9QOs8T+njIc47yQqquUWvVXPHry5eWlUTefMDAwDwIvAKHSi/pF5sWPi9DNpJpKmwPuWtxBx5u6ig9UYbgfm4Z7+p6ydzrP06QgBOSbmY3gZ6soMHNr4dY9iuF4+ludKsuOepZIKJPIExzD/2xYBFjO40tBxKh6woIYhmSGkd4fg=
X-Microsoft-Exchange-Diagnostics: 1; SN6PR02MB4479;
	6:CaVsXtx9STM1K6rGYbtDJCksriLjlDten3+64LxyPFERP3BuyGJslWFnZe2sAXtn7FPFasTmjk4Vrl9Zp2xn27c1i71dN1lmUAp68t73g1vhOzhqQi7Dyj1i0CwofF2RQzZVtfTiLBAei+9vNQ8iQhS+rM0zhPWGFA9tURw1hHw5OZhph/lkxbshgu2upGhfgT5VrytOcT8h5OFTlovNwz/EIbaLdwbqiqCb8NaCNO/cLo+WmUeypSHlithJOpXnuAjGBze2KaOzCPWVp1v0MvjcOLY4V7am6SvRtZVTezu7ZMeseV1+NIGWCrjpBvo5/1n7qCs5z/4y9zTty6kq9Q/wI9W4c6X9VUH/odD4KWm1/wRW8pRlIl+NIuE8u1yDAS+R0vXa1u2UCyFvrj5QcJ2lLA4qizYj+fNTQdxhPYVr9NR24MHT7w80g/wPFxGhKSW50+gOy0QBjeRMkxtC5w==;
	5:6cr29wxLwoMJXDvcoT0GRcX+Yb7DSGopAdJlr+xM9S+rre3HjpOQW4xoytvpe0xFYeIcWMQh89wU740g6UByYklPcMV95jOA7QynmYrzbhuMuLABfkDkXyZRlTPYIR2X22lyIS0uoAU/MobbzUZtOYBdf/xrA2G5F9Awb2s66vo=;
	7:qg3cVRpjtKyWB92QrtOj30ShYYVUd+gihykFZSJf+sCCUN/RjG4Zkhq0bRxRt3od6y39llx3U9PXie4c0OM1U2vB7+KJpckqWUEyQ51SZldOArBM/gTDP3oUqX6JWeQWsdWsNWCpXNqHNHb9yMNpFmiCzqzl9041hCWwb0YgrHGRDIKhYZanKRF+2Levz6ijGVkecAWWEtXhy6JHdt+t7Macdd28PhYipe2a4ObwCLKH0tQpH2Ynv27WZcaDeIi8
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2018 17:11:05.4249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4702de59-d184-480f-9374-08d61a650e7a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4479
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Fri, 14 Sep 2018 17:42:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Thanks Ross,

Acked-by: Alejandro Enedino Hernandez Samaniego <alejandr@xilinx.com>

On 9/14/2018 6:06 AM, Burton, Ross wrote:
> On 14 September 2018 at 00:49, Burton, Ross <ross.burton@intel.com> wrote:
>> On 14 September 2018 at 00:30, Burton, Ross <ross.burton@intel.com> wrote:
>>> I suspect simply adding python3.5/*/test/ will catch the bulk of this
>>> now and in the future.
>> Gave this a go and annoyingly the manifest generation must sort the
>> list because the glob works for everything apart from packages after
>> tests alphabetically, so the tkinter and unittest tests don't get
>> moved.
>>
>> I guess we could change the manifest to put the tests package at the
>> top of the list, and be sure to respect the order when generating the
>> lists.
> So I went and did this.
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ross/manifest
>
> Does anyone have a problem with this?  Basically all the test code is
> merged into python3-test, including the previously separate
> sqlite3-test.
>
> Ross

