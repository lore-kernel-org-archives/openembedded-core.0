Return-Path: <soren.brinkmann@xilinx.com>
X-Greylist: delayed 28492 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 03 Jun 2015 00:31:04 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0098.outbound.protection.outlook.com [207.46.100.98])
	by mail.openembedded.org (Postfix) with ESMTP id 78EC673D6A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jun 2015 00:31:04 +0000 (UTC)
Received: from BN1AFFO11FD011.protection.gbl (10.58.52.30) by
	BN1AFFO11HUB041.protection.gbl (10.58.52.152) with Microsoft SMTP
	Server (TLS) id 15.1.184.11; Wed, 3 Jun 2015 00:31:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BN1AFFO11FD011.mail.protection.outlook.com (10.58.52.71) with Microsoft
	SMTP Server (TLS) id 15.1.184.11 via Frontend Transport;
	Wed, 3 Jun 2015 00:31:04 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:47687
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1YzwaF-0008Lv-Hz; Tue, 02 Jun 2015 17:31:03 -0700
Received: from [127.0.0.1] (helo=xsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1YzwaF-00051r-Cs; Tue, 02 Jun 2015 17:31:03 -0700
Received: from xsj-pvapsmtp01 (mailhost.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	t530Ubbr028668; Tue, 2 Jun 2015 17:30:37 -0700
Received: from [172.19.74.49] (helo=localhost)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <soren.brinkmann@xilinx.com>)
	id 1YzwaD-00051c-6f; Tue, 02 Jun 2015 17:31:01 -0700
Date: Tue, 2 Jun 2015 17:31:01 -0700
From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20150603003101.GH8863@xsjsorenbubuntu>
References: <1432592959-11553-1-git-send-email-soren.brinkmann@xilinx.com>
	<556E497B.40200@windriver.com>
MIME-Version: 1.0
In-Reply-To: <556E497B.40200@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-21584.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD011;
	1:1VtFipRt4lV5Kh0Q0HKjjJipnUc1SBIeWF7IyNINl1wp3dY2U0m/+M6rZ08Xl5nu/mYfGsuVBMaP3H76Nzgvfw2bQaU6Fb1odq5D7DL1CEiFer22+Tb7J+E93iab/GZFs7NwuZT/d7b/s3Wfqu/pb9H/s/bJE3eBgiErCd9a1ANziC9SyK86I6XRilw6WqxNLlL0PScw9otaTYHOFxQTabTS1HbWrdc7AVi+CE1UQw40JWgSvC+o+yC1bDu5fdY0frSeaTuQh5pKp545Jdqq6hmqpWj3aTH4CGEw2htrVWW1Hg/6w1OTKUdeBsg3Gxow
X-Forefront-Antispam-Report: CIP:149.199.60.100; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(438002)(199003)(189002)(24454002)(51704005)(377424004)(93376004)(63266004)(6806004)(54356999)(76176999)(106466001)(85202003)(33656002)(57986006)(77156002)(76506005)(23676002)(62966003)(50466002)(2950100001)(33716001)(5001860100001)(15975445007)(86362001)(19580395003)(83506001)(77096005)(85182001)(87936001)(47776003)(189998001)(64706001)(4001350100001)(4001540100001)(92566002)(81156007)(5001830100001)(50986999)(46102003)(110136002)(5001960100002)(107986001)(5001870100001)(15302535012)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1AFFO11HUB041;
	H:xsj-pvapsmtpgw02; FPR:; SPF:Pass;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB041;
	2:lqwAPTQXinTcmJEjTTkROHStSLyfXLA4hGWAFM87yrhJkS7eVQajbrvfG0U+mPbX;
	2:lcSaqhbqtMLCm/pvR+Oaz301O1QNqkFdIsjt8pznno++sfr7CChgs0Vsw6CeUUtkw6//giW9N8PAgZ7sHHKOu+a+Ws11GU9b0+BGiCiAP5pYz8+4KwQkRrc8YBMCEEJgdCuAxx1th1qdebg1irATWhb8DCgDTQHa+QZlmvKm9KLPuBk7HjzJ67tZAOCOXNa1aHZwSF/BN7dCSiWQndRAVFdo526Z15t1/yi1pOGoUjT5OzE4X1jJ2i5CvMBA0Gi3;
	6:SIE8UU4pyPTW/rgA1zPC3XkBJAjReeIBerXdeDWWrN3gKpLVUaPFSuCbnICNn/pAQI3T9jE3CgFHvmIUbHFyKraqC0EeXgCeRCdgrsH35QoszU02uNBrv9P6PHU+6DSQpECAC5yVDazkRC7ng7HFMkB51PT2C4nf4He8UqEv0qT+B6SGL2AaXDBCaf5EIXoZHy7DLc7U1WUC8XU+g39nKNB9G8ETNnb6RuIWn6Z1fo7FiHgUJ+W60yN5WRTEZ6rI0IiPYbO2GqabTK+0zMKho7Pe3bneVuXhgVYf+oaPWkNTQiO01yBD1B7cFtQdKc9pD3DYCnewhV3/fSbhfjOPf4jygcakbOfqcXKDB+55i5Jy+aAI4YqzcHEN9ljHlIRK2vPrETJV9P4zEqhVveWi6kvZBj/yrWt2Hk4mQumAjQVBxc/YxVHhD3db0NSVFsQ7H80sHk+N81puYX5yPsLnK+8jvj9RZgbl4OZMxxIjFLxMVEWevxKyrt4eMqJR6W3J
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BN1AFFO11HUB041;
X-Microsoft-Antispam-PRVS: <BN1AFFO11HUB0416AE1A650167A4749537C8CB40@BN1AFFO11HUB041.protection.gbl>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(520003)(5005006)(3002001); SRVR:BN1AFFO11HUB041;
	BCL:0; PCL:0; RULEID:; SRVR:BN1AFFO11HUB041; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB041;
	3:f96qgOzXoDlKm0ry7Vd9FznPGkKPB2D7fGPRryP7dcqAT9RWUgNmxhmsHSMDBw8atLxXtO4MrCzJHdlHL5mWEv3RAFxJKC7aK0aww77JutqyzURZzO9eD0GKcFK9oKyQDMjJAnHz2BuCnXJloP59zGfXlmsOBSk44E+pcNxVkMyMTKyBqDCnuEe7crH+lnkI9Y1kGUGITT0ouYRYsNyHMp95tEaL4MwnplP6+QGX7SGT8ytyZ54NhWalzFYIhmsaoutEIW7vFaf072ebdZiWnRAB63J6J+Iy5DzzZwvDDcgJUvjK09vnUUvcvYkQQnjN
X-Forefront-PRVS: 05961EBAFC
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjFBRkZPMTFIVUIwNDE7OTpMQmVjemduaGRIbXZOYk9vUlhtS2kzdFMy?=
	=?utf-8?B?VGI0OTV2WEJLcUJjTExjWWlMbmlqbU5zWDBRUzkwczhnWVZPWTI3eWJzNEcz?=
	=?utf-8?B?OHR0NkVwd0FmeXp3QUdGcXRzOWI2Ui9XMkcyc0s5M2tTck5kUmRobTBlOVd1?=
	=?utf-8?B?OGVGbUJRZ2VQT3pSV2c5cGRxT1IzbEN5c1IwdTByREZIK05Fem9Lb1BNMzVp?=
	=?utf-8?B?MmxCTFdZdUM3ZXVHOUVxekhXSDR5Z0NZb2lLQjRHTC9xSkF5YWFicFJEelV4?=
	=?utf-8?B?MlpjZG9qYzNFdUZseFBZTTJVM3czUlJwaHBNQm9MTGQ5QWNDOWFnam1tbmxv?=
	=?utf-8?B?OHNMREl2VWkvbzcwSzZqNHZiaTRBQllHZUo1QTdJeHV0eXNZelk5WnFSNWpt?=
	=?utf-8?B?bUJSdnZLZDdrMEp3ZnJhMHBFTWlBUHJRcE03eER6UFJlMXAwMTMzUmxRZmQx?=
	=?utf-8?B?OERSTFEzOThaQlRpeEgwUUwydWFnK3lVdlo5Si9IVmxJRXRiUCt6aEVHYnhI?=
	=?utf-8?B?QUNBcG9Wb0x6aWIwNWhyelRxdSswSE85Mm9uOGtUUUxpYkJyaERQdGJPQkFl?=
	=?utf-8?B?RmVxa05pQkFLUVNsc0FtN3VRS2NzNnZhM1BSRUFmdVZwRDMzMSsyeC9XVVBq?=
	=?utf-8?B?cVRjQ3Q3MXd2cGhOb040a053MFhuYTg0eWFLcnJwWHpxWVp3anExYzV2aWJZ?=
	=?utf-8?B?Q1dTVm5nK3dmdUlPSGlYbERZZHVyMkxoNFM5MXdiMGJOMk5ZSmxvRVk1bmNS?=
	=?utf-8?B?ckxnMFZlZlJZd1NaLzV6czAxTzY2VmFoanBuRS9pNVhOZVVkd01HcjA5QUds?=
	=?utf-8?B?WUdqTDliMHhWTkZiUTBxandEVmpTdGZhMlVCOFFCN2kzbFFxR1ZpTWt5WU4y?=
	=?utf-8?B?SnRaNFZJTnhDWE80L0h3aUVGd1o3eFphQWZPWVYyL2JKbFgwNFQ0UjcyR040?=
	=?utf-8?B?ZVQ1ajBUTk1hOTN1RzJBVVlTVll5ZVBNSWYrMzdSTGhBYjVzc3h2NUl1Y0Jp?=
	=?utf-8?B?VzJHSHF2ampjdGdVZHlGUndDeURoWFVRSCtRR2JmVFdDYm95VnUreXhlMXF4?=
	=?utf-8?B?NjkrYWJQQVJSTUk4eWdIQStOTmdVOFhncXNrM1RXczFxUTNrWDJPa2NuQ2cy?=
	=?utf-8?B?UXpkSG0rcnAxMXVmcnZJbHFpM0NLOVhRRURmakoxa1FiWXZVR3M5a3pEaWpJ?=
	=?utf-8?B?ZXVBbmtHM2tOWE9zNVR1M3dVbFU1U2ZXL0tpNVQ3YU9SWlFmQngwUHB1bVRQ?=
	=?utf-8?B?SGtGUzZJZ2x2YzgvbU1LTmYyTnV4MGRGRE1HQlFDMmt4THo2YnBwaUhkSjZO?=
	=?utf-8?B?K3A5ZHlFbUVJdU5ldEpxNk9Ud2xEWnZzR0RhNlROemNnR3YrL0VjcDNyRHpJ?=
	=?utf-8?B?bmRkTWs5OU9mY0NuZnNaTWt3TjNvSDkxOHBhRW5Cb3BUQ0VJa1RsRHd0U244?=
	=?utf-8?B?emE1VmlIc2ZkM2hyRmFPYlNvMkFNYWtzaExDeDFIWU9JNUtXeWZOL2JJSVVw?=
	=?utf-8?B?NUNFN2h3L3ZWQTZGZUhGTEwrQkhzU3JkaHl3d2FIMGthOVJ2QWVRNFhmVW1u?=
	=?utf-8?B?Ky8xbmU2S3NSRlRhUTV0NkhTb0RZQzVMb09jZ2hDSXlMeEhKT1lSMEZSVFpz?=
	=?utf-8?B?U0hSeDdZNFJ6Yk8ySmVkTGRZNzJUOEdOakdYSmJtUjZ1K09qSExtYnJGSlIx?=
	=?utf-8?B?V0duRzBLTXNCbkNZYmVaVUYrV3FoVW1qSEpZbGQwM3poc1ZMcFJ0SkRUV0pI?=
	=?utf-8?Q?kyyngqH3mYTD6LyZb2mX+Hz55z33fm77OJn0Kc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11HUB041;
	3:8sSt+wH9v50bgluOwX/UQJjVUWSJ5jaK+WADHmD8CH6hBOpvxJxP1aFbziGfixD8nYnmKZ/IPNuX5WnDlorzpEuNs4HDflNl3RgyjEQOBTH/cOy2Yz6IlJs7i61Xi+LaYceXF9uXDnql2NwBBB1G0g==;
	10:l+ZZJLNFYgoOWmb5RnOrHwebX5A0zr3aCfO1Ukh2xcszFn1sgK6iFTvt9NRM5kgMStKiUcACnxYrrqYncE3TkFqsQILqprE8mo/ElPjDx38=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2015 00:31:04.4324 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1AFFO11HUB041
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] dosfstools: Add recipe for v3.0.28
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
X-List-Received-Date: Wed, 03 Jun 2015 00:31:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, 2015-06-03 at 08:25AM +0800, Robert Yang wrote:
> 
> Hello,
> 
> Why not remove the old one dosfstools_2.11.bb, please ?
[...]
> >v2:
> >  - add recipe for 3.0.28 additionally to the 2.11 one

There was a reason for this to be changed:
http://lists.openembedded.org/pipermail/openembedded-core/2015-May/105053.html

	Sören

