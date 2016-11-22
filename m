Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0051.outbound.protection.outlook.com
	[104.47.37.51])
	by mail.openembedded.org (Postfix) with ESMTP id 789106093A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=OX9LPQ6Px4/2ctSZlbqs7sUZTdtHM+jIy1KWhS0EaRc=;
	b=MwZrvTwkOZRpFJE/PN5kSPd5/90oyYJKzR7RIbnCnELkIPJZFFLeVg/uyKu98GmEOPzFdgKnxvE/td8ZewcG0ZTkEDsut/EvB2mNSryGZHilWHGtSWbOAyJm1/R2x06D5+yEHqW+SwkYUgRd+pLmY0uSeQivStOcAm0we6fkIRs=
Received: from BLUPR02CA038.namprd02.prod.outlook.com (10.160.23.156) by
	BLUPR02MB004.namprd02.prod.outlook.com (10.242.190.156) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.721.10; Tue, 22 Nov 2016 23:40:08 +0000
Received: from BL2NAM02FT048.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by BLUPR02CA038.outlook.office365.com
	(2a01:111:e400:8ad::28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.734.8 via
	Frontend Transport; Tue, 22 Nov 2016 23:40:09 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT048.mail.protection.outlook.com (10.152.76.109) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.734.4
	via Frontend Transport; Tue, 22 Nov 2016 23:40:08 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:; UpperCasedChecksum:;
	SizeAsReceived:1941; Count:20
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:52586
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1c9KfX-0007sA-U0; Tue, 22 Nov 2016 15:40:07 -0800
Received: from [127.0.0.1] (helo=xsj-smtp-dlp2.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1c9KfX-0000NW-Pc; Tue, 22 Nov 2016 15:40:07 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	uAMNe5Wf014161; Tue, 22 Nov 2016 15:40:05 -0800
Received: from [172.19.74.183] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <manjukumar.harthikote-matha@xilinx.com>)
	id 1c9KfV-0000J8-KT; Tue, 22 Nov 2016 15:40:05 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <1479848501-5451-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAMKF1spiS9_qTRf2_01rVRTfwKLoZ+WDYm7Hy4_Dr5On7eDLXw@mail.gmail.com>
	<220ac38a-b960-6a9a-84f1-f9a58c936537@xilinx.com>
	<6c654497-ceec-07d6-7e6e-2e7d06486880@gmail.com>
From: Manjukumar Harthikote Matha <manjukumar.harthikote-matha@xilinx.com>
Message-ID: <6185a963-5078-c206-2c2f-ed5bef5bb863@xilinx.com>
Date: Tue, 22 Nov 2016 15:36:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <6c654497-ceec-07d6-7e6e-2e7d06486880@gmail.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22714.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-IncomingHeaderCount: 20
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(54534003)(199003)(24454002)(377454003)(377424004)(189002)(230700001)(9786002)(106466001)(8936002)(4326007)(626004)(23676002)(65956001)(47776003)(65806001)(8676002)(5660300001)(2906002)(2950100002)(65826007)(76176999)(63266004)(6916009)(229853002)(31686004)(110136003)(6666003)(93886004)(54356999)(33646002)(50986999)(81166006)(7846002)(81156014)(92566002)(305945005)(4001350100001)(1720100001)(64126003)(83506001)(77096005)(356003)(31696002)(50466002)(38730400001)(189998001)(36756003)(39060400001)(107986001)(5001870100001)(19627235001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR02MB004; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT048;
	1:RklUVGNHbGssIm9qBV40xJnLtun2Vfny4McxkMiFerjecpDcpxA7ThX33NetYZry/B3MnEoMIr+5JJJ7BCY/iiOfiaxj7n5bh6MjqC339zb0K9mb885TxzGlSrfzG85tkeE8qjQcUTWvJ/2UKe8Qmm1dWKxtBiPk89xOeiJPMqMHnYRP3HfI55MD4NzNnN+dEXi0JMD2PPmd0TMwArnwSFZcVjDokoJybhM1XDxpZZq+yYw7jUsI1t/tEW022AMIHNhKJdNN3ESjtwXUKKfPoQeLEPnzWrQDcSCg8wDhyil60Cb9lEVl/vWlgjHXUZKQrAld59nRd4Xp0/Cewm0t1p11UPzDvVBVMHPLgdfSoxDiuaSefD3ETslv0OFBmVJO04zoQx1syj4Yd6sB5zdR/yfgViZEybFWVhiA3+Yyq9WeEFpn9mtAiwOTCYwhHM1C0Ie7IdTQeO3tto/BjgJBXne8H683DU8Crokc4pJL6GGhqWdU38oH+uE+0FdAvcwdlFfk35NMmiilmz30E3zrqGR1dSM8IFQoSDs5ezQabsE5Wh+Y7n3q89MPsk0ScVH/K0yBi+eIQ4zMeRW0SKc7qQ==
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB004;
	2:f3BPlY0vR51MjPOnkGstD6RNVhlzT669tJe+osQ6LJXY2eWI5iDZG8qjGmSZMDVW8dZbU92/BpBfWsUS19pwjWBBeC3DY1WbYoVpMekyetkrCKWrRU7G/+FFe4cNP+LE/Va/xBK1QzpwwWZikBP5YI1+gu5I6v4Ia1A20BFFqR0=;
	3:JYL7TuH8y9PdsyFV1Cpc6IvHDwJZzQPfivH0aX7IaLJI61B6ySXHLz+YHs7+TnfnUW345Z+zJEA8rmSrd/b83uEf08iDbzvrmegr+qq1ntcBiWSXHfdL9TT/sKgWeetBb/NdGhpHvtkK1GtaEvd01C7NTsLyxw1CZKATCFM0NhXX0HDN3ycPRPE6d8U3IxVdt1BuyxFB/VPpwLCTUjI82tVVNsRscYi2YutSZ0cOQp4Du7TqezCb8w8TRnj8fs9aF16sNWMRADCMRqamnOKVKXuJhKyYp7M++XPn/FbZ23Y=
X-MS-Office365-Filtering-Correlation-Id: 12e49987-4e07-47f3-7f9f-08d41330e51f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001)(8251501002);
	SRVR:BLUPR02MB004; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB004;
	25:GagLidTBWZ1Vgq3ZY65g/Tcxwrt09QYYowEvcoa+vyda4eP6WiACUInW54K0Dhzmf3fMeub/c0Sg2goDU1us3UlvVQo+uXmuZfSC35NYzoRpR9v9XVD2jxDz7GaBxYNRytqiAOMd14uTETfUAMpdw8cIp4uEGnqC8mQuo6tyAY3g1HcMMPro9Zfp6JyvGN93XG6AiTdqtk7MTYMtncSvSViiNRGVsjMvGzlBA64ldEvrUtNbMgI1+sKzvjOY9O9P1+biAu3yOLsRhv55Jp1hyItIt8/6VNBSA/t4PWg2pXSYzqvh4og7/daBAts0TPO2Xdh63T/G0M+ccHhUkMZEr86uZ3WUHmweF0vp6vkhlwNSY02Q+bciG7YLlnlOZTuXFpA4t0N/WlnV9y1Tk11ScjFcRcg1y762FpAtio00SWafx8KkuL5P9Y26FqwZyY0e5EdWrfY6UbrEfb/0TI/YPmF8MD3JezRjbSXmzuVKrB82nai6mlUJR4COWfGOpfxE891LG6mzKo/YSFgp8r6jasj1g/tYYM1avIVeuwOyoCng1o9Aph+004gWs+i3AzjqsbxZO0S9ZVuO6zf1R16rV82x5HLsO1yfRtreNTIiz0B33+zRnIOTUWIQsXGwso0NVemdkBGqAtsuL3YSn8VvY+4YyKOLzbe+jTFGDPKaIN/vBIXrbuW7moRQQXTXqiTpObK9w35f3JY7Xjujf7n9H4mGygvaxDrhTeqozaxL+sTxpGFAyRqwzlw1qwbfTQ93Sk5W3kVsY/WcDBnfZVCfe+2y2Dp/378PnMK04ZVjSjrqphuSUQ78JOzS389nUhkCd6LMJdySTx4iIDMapsJaHRingVI0KZpboy7olgHunoBegxI+k9/JVW2OcVddQGsMYjY5vGijZWuxvSwV4hFOCtdraE96XZEo7DFkesVFa34=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB004;
	31:tViQDjwJA/RlPzYMj8bNbI183hd3A+HZ+CFl0GkpM9wjmqykP7DerY7ZFygOx5p5WT7p44IGmknvrFR/tRDWF1s6BIaVI3UDLgD+2Spzhau9LosR2om7/SD7ec+SOusG1/plXiZfgbGk5lQPCQcNMQGS2MqKml7UC3ULjNChUnf0lUA/rzEAmoElmYupThNacCgDY6+JLpiLHpkr6Jw3f96xK0zeZ5gRVWwgp8RQZ6WE3qufOkeyQ9gOm73GDxW24cZphAvmokMyswBIbX7Z300Ux5PW1ZuU4SacgYNvfg4=;
	20:mzI1Ou/ZHqcdsXnxKKaemjU5iB/5GtYFL45CUHtenxEGgnh0kuFdAnV3TmJ4Cc4nigzV/amnOW9lpZJwv0RPa13FhSV+SrgftfQZaupJr9r+Xm5KUmNoHIMG11B+oNcbTNwelhlOjA3yI0w8xy4QuL7/WINxYiGqIdJUZ8PKnSHUhoJdVKLnNWYobYiK8DzanxcxGgYXSBI4vjcKb/ImtDqHTXUgfWxKXOz/QSG2N4+L/MZZyBGn/bngMv3ZRpkIO4gCVVSJCaU+EPteXeSHWDfv7oBYp1y6ML+W0F0qzlxNZNxrhViCYu8l+49p1Zp0bBZ3/0ZA4X7uCXekIP7IOaW83RPmtIua8y28+dYnwwELsHBDuxuVWKQDH8JSY7Px0XlrwU4BH12OmH7MZNU7j+fTyHOEnbknonbcv92SYPCivLkSBttL39mMDS/lf//UIKxPkNsLg0ziYty5sHd+vfLhkf/a7cD7dUxBdSMnOkW1vl3CSIPDPSn0hQyXoCSl
X-Microsoft-Antispam-PRVS: <BLUPR02MB004BFF62FABD65A81988623B9B40@BLUPR02MB004.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(264703809997249)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040307)(6045199)(6060326)(601004)(2401047)(13024025)(13015025)(13017025)(8121501046)(13023025)(13018025)(5005006)(3002001)(10201501046)(6055026)(6041248)(6061324);
	SRVR:BLUPR02MB004; BCL:0; PCL:0; RULEID:; SRVR:BLUPR02MB004; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB004;
	4:oAJseNFm2rIHayH+NyjTkl+Q5JJYOn1ZOYPvLU0bD6mGOOL5JEm5sDT+IAEmNWP0hFIm9cFTx2G7a51JtJlDzp6MaoWufS7Fzyz+Au2lG8oxD40nwUYtBiEBA6/9mvkALDPNGK86ZdcTmMYULQwzs1Os4/PHB6sDTCsilhAtUPskWAq1zkJNBb3QAS5YKaf/PFL0GFvqK4btFFqkLwhc7yASA43z22DQuod7vJT75tqG8TsUVYr1ZN4O5tanlPp+/uUkbobp5K90/9gg0Gcdv1ixXu8m1ItCPP8tctOehgFzSHnI1busswxryT4c/KpNdadW+N5KmgLOwGEDGhm4LHUknccTjKf+iMEEooXyzVtJJTPwTWqTvWKFXixNVdwpwvy6UW7gz2wW/TOE5ct0tgi912p4YlZuX+njinFQ42DDoip4VGHQRlB71yiKiyax+nuk9XzBzf5N33Xy7ZKa+/M+kbct1HO5m7HeHv0GNJ7bMYh0fzX47Vhzb3WFThKQZwILa0Qi3uYvpVrFz5n8smrTbDnCstrQEsaTVLEU4zPNMzAUc5IWKpLdNWI+GfRuVRWfC9zm6OaYEayRPgr1g6YA13+KRVNL/9JprhpzZiZB6F3H3cMdfzSEbQdfKwRbIEomwkrAa3PFHY0UEDZ3UnI5EEmUAS9am3OSn6ljFTw=
X-Forefront-PRVS: 0134AD334F
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTFVQUjAyTUIwMDQ7MjM6WjJzejRLR2xWQVJjRVBXc21sd0Q3WFJON2Fl?=
	=?utf-8?B?MC9zeEhuT0EyeEh1YVQxYjNYTnZLU0lDZDNUbTBvWkNIa3plU2QvRENZcmxT?=
	=?utf-8?B?NmZaWENFemV4aHJKandtRkFzdnBPenFXRjN1bkFiZ2JzM2o3S1JxQW1FSUMv?=
	=?utf-8?B?UVVPYlBiZENQV2ZWeE1jdjMzS21mVDZVVEs3UDcza1FSSk9UVldGUk81bDlx?=
	=?utf-8?B?OHdyMjRoQjl2ODl0cXZsQWVxSVdwQmE1UEV1Q2Y2NDVoVlUzT1NkLytuVENP?=
	=?utf-8?B?N2ZFd0p2UU5Jd2FMaVgyV3FDdkNRV3MvMjFIcDhOQ2pOM3VlRjB3Z3lPN1px?=
	=?utf-8?B?ZzlWTU00aUxEcURidmpFMHcwNmtRVUIrdFdYTldVYUdzSjYwVDVVeG5SRjhj?=
	=?utf-8?B?OTRDK1UxdWVJV2J3d1VHUmloREpXckE5SXRPRWFKZytCcFdNZ0NPK1ZkbkJt?=
	=?utf-8?B?U09paHdKTExIMW9aZWMxM1U2RXZ3Vm9XM0FNL0tpQmJLSVF3ejdhU3FuRldn?=
	=?utf-8?B?dUJlR0UvYUwyTmwwVlBXREk5d2c3UDQ2d0JLa3Q1M0w0Yk5MQmZkRGhDdTh6?=
	=?utf-8?B?TU56OERFeHJDMnFyOFM2ZTZIWUlSaEVUNUtTYzk4OE5md1VjalVqUGkxcHdw?=
	=?utf-8?B?YjhQL0dGMlRuVDZDbHdsMjhzNllEQm02cEpGYTcwUWpFQVMvMzVoSklJQTdE?=
	=?utf-8?B?RmdBSXJtNDdlc2NHZE9MWmp4bURZMWJXdXBVVWRDakx0MVh5NzRVWUNQcVBa?=
	=?utf-8?B?eEh1bjdXYnNYNXJVeExidFRreXZmWVE3N1BDMW9aalAyQ09BMEtYbEtianl3?=
	=?utf-8?B?eTZXVzJic2lpcEoxamdpS1FQZFFRMUlKQXVWanc1ZUZ4UUlDazFlTHZVNzNL?=
	=?utf-8?B?ZTNvMXduT29ZNXorQ3ZKUlZMdWdzVXN0dGxyWTJMYVIybjJ5NkQzc2pyZk93?=
	=?utf-8?B?RXhDSXhtd3dKa3dwOGV2MHprMFZWeEJldWpYUXp1SWkwSzlidmZJd2NoVU1l?=
	=?utf-8?B?Uk5OSGNDcFc4MzZvZWs2WWV2VVd5QUZpcUljVllzQk1WWm5kdnIya01CblhM?=
	=?utf-8?B?clZaTm12WGwrS1MwMXpkeU5iM1NIcXh6VHZubmR0U0VEYjJVVm14RFM3QzBp?=
	=?utf-8?B?MjVLTHVvV05FNGZNemRybnh2MzYzSkVtbzEwZU00ZjdmSnkzRDJIcXpsZzFv?=
	=?utf-8?B?QjE1b1RsNnhaWFhxMVJNdUs5WXJjWnh4WTR2d2pJZHJNMm8vRU9QQWxPc3FH?=
	=?utf-8?B?Q2ZXT0NKeWtuTXBWb2UvTjE3Q0xnMFFlcUtpekhXSk9NR2I2M3pYTld6YWlB?=
	=?utf-8?B?YmxGUitsc3Jrdy9aK2s0dmtZMjkzLytrY1d3bisvbUFGZjVLWWE2Q1ZXV0kr?=
	=?utf-8?B?QmJId25EbHYxZTF3S1hZZnp2STZITFlPZVVUZnZoUHA1YzFDZkdlb2dMY2JW?=
	=?utf-8?B?OFozb0JEMkhmQy9xcEZpQTRweUZkRWMrNnBLcHB4TnJBckljSzNtenltWnNq?=
	=?utf-8?B?cWMxNU1CTWYyQTNqaTE4MlE5dk9NSnM0SVAwMDJvVHJZcHlpVEdFM1pUQThX?=
	=?utf-8?B?eTJZZ3FkVjJQTkVxU2gveVlZYm1RcWt1WXR0NlIrZEZwV3N0Ymp0WjhleDhu?=
	=?utf-8?B?cEdIejJha081elgzaERoNTArNVVwNS8ra2hkUWtkUWpoMy9zWkhkTjV3ekpn?=
	=?utf-8?B?OW9VZDJvWmRZNk1OZTdjeUlabmZOSjZtV3h6ckVhNlkvbk4yeDhUMHozenBT?=
	=?utf-8?B?RnBqOHlnNDVZaTRRY1pkd1BzdVIzanp1SUl5a25xRldFSUE5UWdMNXFKK21m?=
	=?utf-8?B?KzJ6d2lSUzdYcGlhNVUyOHRQZyt6UlhuczJhZVY5Lyt4dz09?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB004;
	6:U1lYAvOq8SJ01eiokhvsElf4JU0nCQKqGWMxO63iHQ2UWOdKNpGSQkEsNObcZe/cmwho9FcgTXjXdyO6J+5ktlDbhd75NBW6chba3EC3L9aeswUVtUSDYZeUsV9S1f/wr/wJkXv8Tdn+dATt/wn1XPfvVZEjtkG8/1UhsKaDxI27E1CdjwVwj7v0NpoCv+9RYf++m8JU+UHPJKzD5LS/P9EqzULOJ6IbuTA6640gXvacXzIeYozKxQ8BMWs2iaM9JSN7DuwXHDi7i2F5+KKGEo45OkMav4Pp+dExRbMC3RZ+lhRvmxBYiMB7RURdfKyhyOetwIiPOUlrwEHmp+VJO5yhI5m36i//wZNwux33l/pKr6nZNP8loMwgssxlsN5D;
	5:xWMH5FPbxuvY3EflZgn+bBQizQAFZ/ITH272EzaL24jJEDOOR/DIOJHAIhJi4xsKtZYGgmNMRxauVxS1mu4wZgT/8XbFDyGjZsv6xUauT2fs9VeoFp4ZPZP/9h1y7eAgEI3zQCjUV4sO9rxgDhlXVQ==;
	24:4+6J/UUgC222a1KL/hpfPXoDRlKZu7enRk7GnCfUJevbcnOjpNhtqjyaPQQio3v6M29WSKI4YpkY4z+gucSrFtWktJFETwdbMFn8M96y5pg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR02MB004;
	7:NvP7/OQKb29kTVr421LSWzZJhSqxlGVmLUV8MuhgYY8iCCGf8wK5klYsAVOUHt6Ttqba0v0m1n9ZmUMuYdayMfZQ/TomK0k0hqjtekBzA0aipuo0uePR8z765E1Vp4U5tzn08kDHO4C7ntBfUOh+4kcuOK5FymY2NM3jaXCmyJDU5/Q9ny54QTwd2EMstYTe9vlmm7jypsOzh9sdgOJABRQGawquxUhcd9k32QljbDPHUd0EuQFWgYLrSTZpn5KVYMQMvz3JuwswZ74Y4D4RHx+JsAaoX5QxKGOvpQZnyC0ovraTLX/QZQOUX9DOF4PmTrNFQ97Jd2AgElaqa+OgiilBm9iOo8tEz3jiDrPUcbE=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2016 23:40:08.6362 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR02MB004
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][Morty] binutils-2.27.inc: Fix alignment frags for aarch64
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
X-List-Received-Date: Tue, 22 Nov 2016 23:54:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/22/2016 03:36 PM, Khem Raj wrote:
>
>
> On 11/22/16 3:08 PM, Manjukumar Harthikote Matha wrote:
>> Hi Khem,
>>
>> On 11/22/2016 02:03 PM, Khem Raj wrote:
>>> This is ok for master
>> Is there a particular reason not have in Morty? We have arm-trusted-firmware
>> failing to build due to this issue. I have submitted a patch to master as well
>
> Once its in master, it should get into morty subsequently.

Ok thanks for clarification :)

>
>>
>> Thanks
>> Manju
>>
>>>
>>>
>>> On Nov 22, 2016 1:31 PM, "Manjukumar Matha"
>>> <manjukumar.harthikote-matha@xilinx.com
>>> <mailto:manjukumar.harthikote-matha@xilinx.com>> wrote:
>>>
>>>     There was bug with alignment frags for aarch64 in binutils. This is
>>>     fixed in master of binutils. This patch backports the fix to binutils
>>>     2.27 version.
>>>
>>>     Signed-off-by: Manjukumar Matha
>>>     <manjukumar.harthikote-matha@xilinx.com
>>>     <mailto:manjukumar.harthikote-matha@xilinx.com>>
>>>     Signed-off-by: Nathan Rossi <nathan@nathanrossi.com
>>>     <mailto:nathan@nathanrossi.com>>
>>>     ---
>>>      meta/recipes-devtools/binutils/binutils-2.27.inc   |   1 +
>>>      ...eration-of-alignment-frags-in-code-sectio.patch | 139
>>>     +++++++++++++++++++++
>>>      2 files changed, 140 insertions(+)
>>>      create mode 100644
>>>
>>> meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
>>>
>>>
>>>     diff --git a/meta/recipes-devtools/binutils/binutils-2.27.inc
>>>     b/meta/recipes-devtools/binutils/binutils-2.27.inc
>>>     index fc81721..90518bf 100644
>>>     --- a/meta/recipes-devtools/binutils/binutils-2.27.inc
>>>     +++ b/meta/recipes-devtools/binutils/binutils-2.27.inc
>>>     @@ -37,6 +37,7 @@ SRC_URI = "\
>>>           file://0015-binutils-mips-gas-pic-relax-linkonce.diff \
>>>
>>>     file://0015-Refine-.cfi_sections-check-to-only-consider-compact-.patch \
>>>
>>>     file://0016-Fix-seg-fault-in-ARM-linker-when-trying-to-parse-a-b.patch \
>>>     +
>>>      file://0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
>>>     \
>>>      "
>>>      S  = "${WORKDIR}/git"
>>>
>>>     diff --git
>>>
>>> a/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
>>>
>>>
>>> b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
>>>
>>>     new file mode 100644
>>>     index 0000000..f8b46be
>>>     --- /dev/null
>>>     +++
>>>
>>> b/meta/recipes-devtools/binutils/binutils/0017-Fix-the-generation-of-alignment-frags-in-code-sectio.patch
>>>
>>>     @@ -0,0 +1,139 @@
>>>     +From 4a4286465b5d6c28968bc2b29ae08daca7f219a3 Mon Sep 17 00:00:00 2001
>>>     +From: Nick Clifton <nickc@redhat.com <mailto:nickc@redhat.com>>
>>>     +Date: Fri, 18 Nov 2016 11:42:48 -0800
>>>     +Subject: [PATCH] Fix the generation of alignment frags in code
>>>     sections for AArch64.
>>>     +
>>>     +PR gas/20364
>>>     +* config/tc-aarch64.c (s_ltorg): Change the mapping state after
>>>     +aligning the frag.
>>>     +(aarch64_init): Treat rs_align frags in code sections as
>>>     +containing code, not data.
>>>     +* testsuite/gas/aarch64/pr20364.s: New test.
>>>     +* testsuite/gas/aarch64/pr20364.d: New test driver.
>>>     +
>>>     +Backporting the patch from binutils mainline
>>>
>>> +https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=7ea12e5c3ad54da440c08f32da09534e63e515ca
>>>
>>>
>>> <https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=7ea12e5c3ad54da440c08f32da09534e63e515ca>
>>>
>>>     +
>>>     +Upstream-Status: Backport
>>>     +
>>>     +Signed-off-by: Manjukumar Matha
>>>     <manjukumar.harthikote-matha@xilinx.com
>>>     <mailto:manjukumar.harthikote-matha@xilinx.com>>
>>>     +---
>>>     + gas/ChangeLog                       | 10 ++++++++++
>>>     + gas/config/tc-aarch64.c             | 10 +++++++---
>>>     + gas/testsuite/gas/aarch64/pr20364.d | 13 +++++++++++++
>>>     + gas/testsuite/gas/aarch64/pr20364.s | 28 ++++++++++++++++++++++++++++
>>>     + 4 files changed, 58 insertions(+), 3 deletions(-)
>>>     + create mode 100644 gas/testsuite/gas/aarch64/pr20364.d
>>>     + create mode 100644 gas/testsuite/gas/aarch64/pr20364.s
>>>     +
>>>     +diff --git a/gas/ChangeLog b/gas/ChangeLog
>>>     +index a39895a..fad06dc 100644
>>>     +--- a/gas/ChangeLog
>>>     ++++ b/gas/ChangeLog
>>>     +@@ -1,3 +1,13 @@
>>>     ++2016-08-05  Nick Clifton  <nickc@redhat.com <mailto:nickc@redhat.com>>
>>>     ++
>>>     ++      PR gas/20364
>>>     ++      * config/tc-aarch64.c (s_ltorg): Change the mapping state after
>>>     ++      aligning the frag.
>>>     ++      (aarch64_init): Treat rs_align frags in code sections as
>>>     ++      containing code, not data.
>>>     ++      * testsuite/gas/aarch64/pr20364.s: New test.
>>>     ++      * testsuite/gas/aarch64/pr20364.d: New test driver.
>>>     ++
>>>     + 2016-08-03  Tristan Gingold  <gingold@adacore.com
>>>     <mailto:gingold@adacore.com>>
>>>     +
>>>     +       * configure: Regenerate.
>>>     +diff --git a/gas/config/tc-aarch64.c b/gas/config/tc-aarch64.c
>>>     +index ddc40f2..74933cb 100644
>>>     +--- a/gas/config/tc-aarch64.c
>>>     ++++ b/gas/config/tc-aarch64.c
>>>     +@@ -1736,13 +1736,13 @@ s_ltorg (int ignored ATTRIBUTE_UNUSED)
>>>     +       if (pool == NULL || pool->symbol == NULL ||
>>>     pool->next_free_entry == 0)
>>>     +       continue;
>>>     +
>>>     +-      mapping_state (MAP_DATA);
>>>     +-
>>>     +       /* Align pool as you have word accesses.
>>>     +          Only make a frag if we have to.  */
>>>     +       if (!need_pass_2)
>>>     +       frag_align (align, 0, 0);
>>>     +
>>>     ++      mapping_state (MAP_DATA);
>>>     ++
>>>     +       record_alignment (now_seg, align);
>>>     +
>>>     +       sprintf (sym_name, "$$lit_\002%x", pool->id);
>>>     +@@ -6373,11 +6373,15 @@ aarch64_init_frag (fragS * fragP, int
>>>     max_chars)
>>>     +
>>>     +   switch (fragP->fr_type)
>>>     +     {
>>>     +-    case rs_align:
>>>     +     case rs_align_test:
>>>     +     case rs_fill:
>>>     +       mapping_state_2 (MAP_DATA, max_chars);
>>>     +       break;
>>>     ++    case rs_align:
>>>     ++      /* PR 20364: We can get alignment frags in code sections,
>>>     ++       so do not just assume that we should use the MAP_DATA
>>>     state.  */
>>>     ++      mapping_state_2 (subseg_text_p (now_seg) ? MAP_INSN :
>>>     MAP_DATA, max_chars);
>>>     ++      break;
>>>     +     case rs_align_code:
>>>     +       mapping_state_2 (MAP_INSN, max_chars);
>>>     +       break;
>>>     +diff --git a/gas/testsuite/gas/aarch64/pr20364.d
>>>     b/gas/testsuite/gas/aarch64/pr20364.d
>>>     +new file mode 100644
>>>     +index 0000000..babcff1
>>>     +--- /dev/null
>>>     ++++ b/gas/testsuite/gas/aarch64/pr20364.d
>>>     +@@ -0,0 +1,13 @@
>>>     ++# Check that ".align <size>, <fill>" does not set the mapping
>>>     state to DATA, causing unnecessary frag generation.
>>>     ++#name: PR20364
>>>     ++#objdump: -d
>>>     ++
>>>     ++.*:     file format .*
>>>     ++
>>>     ++Disassembly of section \.vectors:
>>>     ++
>>>     ++0+000 <.*>:
>>>     ++   0: d2800000        mov     x0, #0x0                        // #0
>>>     ++   4: 94000000        bl      0 <plat_report_exception>
>>>     ++   8: 17fffffe        b       0 <bl1_exceptions>
>>>     ++
>>>     +diff --git a/gas/testsuite/gas/aarch64/pr20364.s
>>>     b/gas/testsuite/gas/aarch64/pr20364.s
>>>     +new file mode 100644
>>>     +index 0000000..594ad7c
>>>     +--- /dev/null
>>>     ++++ b/gas/testsuite/gas/aarch64/pr20364.s
>>>     +@@ -0,0 +1,28 @@
>>>     ++ .macro vector_base label
>>>     ++ .section .vectors, "ax"
>>>     ++ .align 11, 0
>>>     ++ \label:
>>>     ++ .endm
>>>     ++
>>>     ++ .macro vector_entry label
>>>     ++ .section .vectors, "ax"
>>>     ++ .align 7, 0
>>>     ++ \label:
>>>     ++ .endm
>>>     ++
>>>     ++ .macro check_vector_size since
>>>     ++   .if (. - \since) > (32 * 4)
>>>     ++     .error "Vector exceeds 32 instructions"
>>>     ++   .endif
>>>     ++ .endm
>>>     ++
>>>     ++ .globl bl1_exceptions
>>>     ++
>>>     ++vector_base bl1_exceptions
>>>     ++
>>>     ++vector_entry SynchronousExceptionSP0
>>>     ++ mov x0, #0x0
>>>     ++ bl plat_report_exception
>>>     ++ b SynchronousExceptionSP0
>>>     ++ check_vector_size SynchronousExceptionSP0
>>>     ++
>>>     +--
>>>     +2.7.4
>>>     +
>>>     --
>>>     2.7.4
>>>
>>>     --
>>>     _______________________________________________
>>>     Openembedded-core mailing list
>>>     Openembedded-core@lists.openembedded.org
>>>     <mailto:Openembedded-core@lists.openembedded.org>
>>>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>>>
>

