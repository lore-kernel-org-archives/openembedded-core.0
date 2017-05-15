Return-Path: <carol.zhu@nxp.com>
X-Greylist: delayed 905 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 May 2017 09:09:19 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0065.outbound.protection.outlook.com [104.47.32.65])
	by mail.openembedded.org (Postfix) with ESMTP id B13C36010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 09:09:19 +0000 (UTC)
Received: from BLUPR0301CA0037.namprd03.prod.outlook.com (10.162.113.175) by
	CY1PR0301MB0908.namprd03.prod.outlook.com (10.160.165.19) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1084.16; Mon, 15 May 2017 08:54:07 +0000
Received: from BN1AFFO11FD025.protection.gbl (2a01:111:f400:7c10::143) by
	BLUPR0301CA0037.outlook.office365.com (2a01:111:e400:5259::47) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1084.16 via
	Frontend Transport; Mon, 15 May 2017 08:54:07 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD025.mail.protection.outlook.com (10.58.52.85) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Mon, 15 May 2017 08:54:06 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4F8s0Gs005326; Mon, 15 May 2017 01:54:05 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 May 2017 16:52:34 +0800
Message-ID: <1494838358-28036-3-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
References: <1494838358-28036-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131393120468766006;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39450400003)(39840400002)(39410400002)(39850400002)(39400400002)(39380400002)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(2906002)(6916009)(2950100002)(81166006)(8676002)(50226002)(6666003)(8936002)(5003940100001)(189998001)(47776003)(498600001)(230783001)(36756003)(356003)(86362001)(575784001)(85426001)(105606002)(106466001)(6306002)(305945005)(33646002)(8656002)(4326008)(2351001)(38730400002)(110136004)(104016004)(5660300001)(48376002)(53936002)(50466002)(76176999)(50986999)(77096006);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR0301MB0908;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD025;
	1:rNao+jybGusC7hOdBrG+yfc7KBo9Qfm25bTbsPAutmzUqBn6ehhb7d6yzbnyn/62J0y7jspPzkLQllbHSUwQFyHsNolQyaAthh9ujaoXaKl175t0z3gr/B/OhN/El072RuoEE/I9xQBvMiHifkWLlYmgmnsYGmNaQRMJjZrCGI0KgrZBQiGePIMK8mM1L3t65Q43io20AJh1TTES9mNDg65VcdwP7gJsAtuYAbGbJ4qTZwpJtthudGuolAwT7NB6xbdBS2Ndt7QDIGffelvOvx65IpPzLCvM+rPeEvOlQo8EUIsD0AlB4mLDBvSFJUfABEAcTCRIu7vxPWObtcRb833zxZxM7a4HNLFrIE1MGlFXlfDIascUa/WyqTEOfkcD0phZx4x9FpirtchZbBanZivXxfeI2lle/w2Q4L+GntrG348evgGMT3K2Ri0qVNwEE4T8lSujADONhkb0VZf76SxhYEgr4cUvcyncgC4ig/LMCXDmGi7QBQ3dJxYDFfKtMMtnoGvEWNk4aQRqwVHnw0ItNyLjvBmC0D/5IKSIRcRtv4xVKjJ/tibjluxo14S/WUkou/bk4IUQyvXgyYvPF9+/UgxGwj3/tUC/AdyND+X1kUFjh25E1npAobYfP2Ca8oUZCR4aQv9wXs3MOJj58E8K4DPimWNFyBpjUWjwc0XDr02Y8pyi9ixibj/GPs88pBT7wpFRd4Xw5dbocs0tfK0dwSzw8NUrKKQ8VbtLjNI=
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5412a20b-14e1-47a4-2bd7-08d49b6ff1ed
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:CY1PR0301MB0908; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0908;
	3:brjHscc5786EqjuNvGMGC13U0Dlah8OkswxAQ8BQNsRgW2sZx02TP5SQQvIUvxEFHhF8nHaTvCKk/l6jxWSAouN0G/2em0KKuXpm8ERsW/NL4fwG9qiKPRPiCXEocANSg3B4zsSnGeD8dzjw90l+xhZKJYeZfRtHMIQNyH2IhX8T4PKLlr1wOTBkyiEdeys0u/WUp+aQp+pIF5bP+Y9RAuDvUILOFjqRQPsCJfcu5CwGxK2VdXJrMOihN4/DAkEMOx4Rs5vAvyH9jNQ5wKfutrS8tSyoxG+/xZFYpUmpM8/Ey4yJ5yTLfJMoPmjENx7LwDyoW1Dib+3VhQ+8fAYawffo10Vc3S2jTHmg1IZVbOvb48fne1oKz9o+wNMgxX04JRqpxYdYH28BeeYuCmpESjYD3MitwXz2+hO/17JztMpYbAFCIO10GqrDo5P2AhpI;
	25:kHVPLvtaE16IfchIrF+GbmFKWq3EhHZ+q+xeRoAMGE0wKTVVVshbLlgye/gl/g4dHUFbxzgG/wdaSRFnMvm+VU6OIFgwnxo/kgyXokkC4chTot78p2K9FC8IIL8L1A5FXvjx/I0rtDzz6feqVuE6OLBwaACnRE1IkAJtnnWYRjkSe4ZgiqpIgZa6SZalNaLTnrJ5vr5MfH0oZHxrN/D7+lyiVGeNQNOxzPI885t4IWWakSNqSV0Zt1/QDH7a248f2eTu+RUXPM4Ix1KuUN5EHgKCllOSCtPgXCBcg/+d0mC6ai+E0Pc+IJ33Gr16nvmy3GMhspgS+41oZ6t4AUbCEIQnX5UqcTwRBXWoY2tBxU0tcWFf9hRKYDmxXmCOYZD2BItjSfmk5bzHF2WaIHRH6QH1vQlQ0jLwAi7vVnv5fk9ykz7haanEZuPpbgRXMy8zoT6DuX8CtV6xeKwBgAZePQ==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0908;
	31:CYrnYTagozkYfIWqLStWrQIjSg0wh1PwZu4Px0+Zu0xk888bLwrqTDTLmfxSEe2ENsSEAeyL7Ujvc01wmuA2GF0Lhxs7p1ygNlD49H0/A2H+3i7bo4FWlyvd6N/JyR4wHxpARZHFZRfuqb568Mzv8N8/eP9ABrM6rLYDJComWURXqjpIoz3q46MkWlLipQTs1tnLSGCEKxT7+ON2HTS8W87X3zcllk+azVQZErLsGORI/GTt69/K2JXzl7WHuGh42CnC8/j5BwGkklXRLbTW1Q==
X-Microsoft-Antispam-PRVS: <CY1PR0301MB0908B430181E2A7164E48303E9E10@CY1PR0301MB0908.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(131327999870524)(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(13023025)(8121501046)(13018025)(13024025)(5005006)(13015025)(13017025)(93006095)(93001095)(3002001)(10201501046)(6055026)(6096035)(20161123561025)(20161123565025)(201703131430075)(201703131448075)(201703131433075)(201703161259150)(201703151042153)(20161123556025)(20161123563025)(20161123559100);
	SRVR:CY1PR0301MB0908; BCL:0; PCL:0; RULEID:(400006);
	SRVR:CY1PR0301MB0908; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0908;
	4:1vc7yCo8BZmcTj/c9t+1m1wbOT4/7NgDUODYq/ye?=
	=?us-ascii?Q?j41mXAP2vOBObN1KNkW1M1wZFknPNU6tvbR6kwi4RSQzfMCZDu2kTUaKgU3Z?=
	=?us-ascii?Q?v5N/yCOZQvOPJuXiHBdlnzp41p4JZPpc+5y9Q57FHeCTxyFrHYQZ2dHKOZFy?=
	=?us-ascii?Q?hKart+LpHgcMtH7IrbbMOn4tfPMwM1VCdQn35oeCOpTCPpvDaRw0XuM31sFm?=
	=?us-ascii?Q?UtEf2DOb6+MoWYj3oP+qGo8KLQmSf5zcDO0bLs/BRcBN7+RCh7WSiUR4PM53?=
	=?us-ascii?Q?0qjZIMFm7LPBeOl5sFuqqJlbkyxsET772IYUGyY8f5Bd87dtGhSAxXylAnks?=
	=?us-ascii?Q?UnWY9S26u9YCI4CUxFbnri3EWEBwO9AjwIPy4J1r3/06XXpsNUVZkq0szSkq?=
	=?us-ascii?Q?73vYNRwbCWpQPhsM7POaKlWTZQPvWExLhflaByf/E8K0mdHD5S4iB4oqfLsN?=
	=?us-ascii?Q?FIcmvTsNz6yREc/C/wZSX7816ce2lIoGTzD3BXB+Yv5l0+L9nulodvhrprQn?=
	=?us-ascii?Q?hF3CAks7Es9r9oCc2kyu6mcDtCmqsKyRHZv9bIjqmaeEm0+QaBcXQtMg94kZ?=
	=?us-ascii?Q?/MvCOULMfuSHfMJUnJa+sfkovCy1rvAGXv/TUBMLPYFNxoKTdrDcjV+VppD5?=
	=?us-ascii?Q?wafQ/4PDzxpCQsMMOBCnlNzgtW1++W21+V/WdX1AX1iRxvVwp4BTzNm6S6q4?=
	=?us-ascii?Q?uMJSCwCjLUoJJ1/yWbaVOPziP8itjxV4NUcgTMDVYQiZ3IAE4TCnFOloQKWY?=
	=?us-ascii?Q?D7qjCVA/091zDfrBXr6MSrpMCPEHbS9J78yFK+sFcWHybC7ozqSd+ECuF8sK?=
	=?us-ascii?Q?nOxLTFV7J2VBibpEeo2yv0PHNksYCeyBgYjPw+KbC0HfYXTUxVQRTL3b3Qhd?=
	=?us-ascii?Q?5p0jlRHnf+eRFnIY+JEWZJNkiQe84QmL/NnMP+k4sgI0tK+zSqt1MZUQotD+?=
	=?us-ascii?Q?2Wy3P+HLTtv9Sm8Hcm5zzR8pQ/Ay6SXDEUStqI/n5wdVglItkgxOE0O5oof/?=
	=?us-ascii?Q?Eqk=3D?=
X-Forefront-PRVS: 0308EE423E
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB0908;
	23:FY/Dd7dwb1+SvH+CtVQdZw8GpwaXzWjxXICdYWm?=
	=?us-ascii?Q?AGicug03Ls8thlQrKEUxkSBLyy1GYAd679hBTGDy34aZv09Eo+0ddVrP6YOS?=
	=?us-ascii?Q?LDE2EUreUe6FKuwxb1+ab8vDBph05JbVruzJ0D2dNGto1Vl5P81KQkZjJ52I?=
	=?us-ascii?Q?LlkChpsRCf/OpE+i/WftfeBLm/W83UwjvzJb5xiGVysmip5IEuIucYxTo2l4?=
	=?us-ascii?Q?ANGzNDUxeHfDzz/awchLOg3QUAr+hVeBAK/qXPKq2dUWUj9r3oajWNtfisJ6?=
	=?us-ascii?Q?e/R/zzQUDbK//qc4Wg4Qkpx+hLXf3s27c51zaVsEnW3pN4KPmnqR0xAHPHWL?=
	=?us-ascii?Q?/3E2IS5fnIbdSThVp/B0Dh++dRas3fP+EtZ7BmpdhoEuotVmUOp0ylAKARZ1?=
	=?us-ascii?Q?Juh1bQPzP9hSyp8JT45Fsa21TBNGimgF7/zKkN1uDEcD//OQM0dHpZcZGsZ5?=
	=?us-ascii?Q?a9G3+4ZtBmc9jyMYxaU3IkLy63jySJ+/oXL9kwUzpC0VDKqmNpD4YlxL+UDO?=
	=?us-ascii?Q?CYdgrVzxMa/cLSy8VJtEPb/cJDNDjw+DoiGg6w7I5Yb0Wnd6ARvQfnXt+h/t?=
	=?us-ascii?Q?ixtp0jPLxCDDTqWNP+1BICqu/o6JGDElYTeUSmX2IvwnX4NhiwNU8qQqm+Db?=
	=?us-ascii?Q?sW8hNyqZFqeY4Hot9+FFwG47xrvhFulkWHacoUqUNr1iUh6XDuQYKMR+5n72?=
	=?us-ascii?Q?t2DqwDqNSyTI/HmTc9xCYsGDlR1k8TxiEY9oMmn50ips6zVswd8QV1dO2Mvl?=
	=?us-ascii?Q?IWy9mfPeNpJXjRlzebn7c0lIrH4HIemt8bhpJT/CCqSHLFCIfzoUQEUjd0a/?=
	=?us-ascii?Q?O7DblwSY9Y8QqHXs5xKabYafF/UU4kT0EgD+wMhpWDAKlE70zKRUsz4AD3Dj?=
	=?us-ascii?Q?8XbyWv+uX6ZaPA/pKWHiTovbsjiAOVtpTh+X0FLYfApXcXNTQmy++/KOwhMX?=
	=?us-ascii?Q?R1siEP68P6HzReYyOex9anRMtpMdMg5LtjYbAKWQ+ROXy2MnulwghDmM5BCh?=
	=?us-ascii?Q?5hNgNi32XvDQ1LIQr+5y9Nts3boAZmXlfedeQCdjpOre4gixGjc4wHwVJQ+I?=
	=?us-ascii?Q?pSQYcj+etauGkt7hYfgLokA+6PchwNqLeXR4gLH7nh5EXgfi9ckh/uN+lCKh?=
	=?us-ascii?Q?KYLXV1SeMTvGlLt4LWQR8lWB5LMdS8XqesResH1J0ATE8GJ3FMFuXiCd9v0d?=
	=?us-ascii?Q?4vMzLBZw+EyBvEIEnCmXIYRBn07ck3VwFy2/ME0Tw4OfSWcbUQ1ptXTh1tVX?=
	=?us-ascii?Q?Agvb2ZYI/f1GbaOyX03RS1+6DtVPVRs0Sc7sudHB0PHj4PojSuguJfFvUPsz?=
	=?us-ascii?Q?LQg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0908;
	6:eDdM0BLDh4lyhSFx+xsY7PkX0ZcQFE8CglRSRZTRSdvgWDsZqKuPzBk7YXzAhCVbuer1Sbw1Ne7F0u6TzDEqQkdsPqzJpegwAeGcVN/TvyoRaepARJUGJQpZ7bgjmR3NZPorK11sKVtYqp3vQZAMTGAMTuJL6RhBlLu3cWsxATykLAlQcqwrAxC3DW2mCNXlH65XTcoj+sYHk6IYywPToM6r4Lt2neN+gLGregG5J5txRAZZSsPPEEnyONAv+QCUcLHUZhVyiith/2menAdZxlZmGRAdA0ck2t8SarPuQzACpsqZ9yaoLJ1MifODug00XitD6CLrcjL1YZIURdXbApljgnkxf47YhyixrfV+6od2/UY2YSOapmvQkrzpwsu+8jkAc8jN0Izjkn+oFeA3Ktw7k3Bnoc0pkTPVV7AfuGW0OKeQK2ogOwpFLHnMi+4OSEdR4t45QZtI9k7oZlQFG2Ww/HxpyTgEwr92c6GaRB6xAqaKelBSiq7diAaR8uHxqd5I6sbRQKB6Qq2p+23VFA==;
	5:ZA9NvwN7VDG+Z6IovuZuR1C8ZfoyWmak5OY9eG0QHZfo0cnvdCEAT4El9+Otwu/sPIdtdaBOlfGyB+7Y5ke+fjJ8DL6YNBj7/4XWaplj5LCOPB0hNSBqiUZvnYQzLUlC8WYmhLzzQYyUuAfBbjXMYMwciWIT50qNQgU0KFbFdHRs4e/Y/dEvcto8BwwK5TwV;
	24:kTMFEvxvhKpFY82zDAeaTpqHrNbvkmpPtpJKjFmkNPBLBQxYSDbhnRVd6yvhBER0VPOU9xRxMpXvXMH3F6883h0urafgvyi2/llJ6+KTcSI=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB0908;
	7:FZgJwFJnyZ4hyELN6b/MeFwL8QVzNUNMDAxocu3apJSe3ZC4nZUpCqOrBrc9sYRixOwjn6LUFRbHiFmYjlSTQe63C7+G/c9uWLnl+2yJBVHQv7CoArz+apOFRwAXHBkCth13wzCc2pDFolzwQ3qrl7oyQ0srH3fr8HQyNr5LILiTu/fvZml+xF33kPiYHqL8IPJiJZ9+a0/J/+aJpRwxQ46RtUy8HZvn6YwDn1yJkSeyA3bSe1CRSH0WJAiRWJlswhdQN8MPgiqildxbwTgh+BLgDk4fpiAVJ0TFiFihSdgVP2EYBZrnxQHeP930EFWY7OOVx2e/jOPL48Ycglx20A==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2017 08:54:06.6894 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB0908
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [poky][PATCH 2/6] gstreamer1.0-plugins-bad: Add configuration for enabling accurate seeks
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
X-List-Received-Date: Mon, 15 May 2017 09:09:20 -0000
Content-Type: text/plain

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...configuration-for-enabling-accurate-seeks.patch | 148 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 2 files changed, 149 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch
new file mode 100755
index 0000000..46d602c
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0003-player-Add-configuration-for-enabling-accurate-seeks.patch
@@ -0,0 +1,148 @@
+From 698fbfbf955af2fb9b79f9e6e8091b8750c886c4 Mon Sep 17 00:00:00 2001
+From: Lyon Wang <lyon.wang@nxp.com>
+Date: Wed, 26 Oct 2016 16:28:10 +0800
+Subject: [PATCH 1/5] player: Add configuration for enabling accurate seeks
+
+Upstream-Status: Backport [1.11.1]
+https://bugzilla.gnome.org/show_bug.cgi?id=773521
+
+---
+ docs/libs/gst-plugins-bad-libs-sections.txt |  3 ++
+ gst-libs/gst/player/gstplayer.c             | 60 +++++++++++++++++++++++++++++
+ gst-libs/gst/player/gstplayer.h             |  3 ++
+ 3 files changed, 66 insertions(+)
+
+diff --git a/docs/libs/gst-plugins-bad-libs-sections.txt b/docs/libs/gst-plugins-bad-libs-sections.txt
+index dbab6f7..77092f9 100644
+--- a/docs/libs/gst-plugins-bad-libs-sections.txt
++++ b/docs/libs/gst-plugins-bad-libs-sections.txt
+@@ -1953,6 +1953,9 @@ gst_player_config_get_position_update_interval
+ gst_player_config_set_user_agent
+ gst_player_config_get_user_agent
+ 
++gst_player_config_set_seek_accurate
++gst_player_config_get_seek_accurate
++
+ <SUBSECTION Standard>
+ GST_IS_PLAYER
+ GST_IS_PLAYER_CLASS
+diff --git a/gst-libs/gst/player/gstplayer.c b/gst-libs/gst/player/gstplayer.c
+index 313bca5..d9ff524 100644
+--- a/gst-libs/gst/player/gstplayer.c
++++ b/gst-libs/gst/player/gstplayer.c
+@@ -85,6 +85,7 @@ typedef enum
+ {
+   CONFIG_QUARK_USER_AGENT = 0,
+   CONFIG_QUARK_POSITION_INTERVAL_UPDATE,
++  CONFIG_QUARK_ACCURATE_SEEK,
+ 
+   CONFIG_QUARK_MAX
+ } ConfigQuarkId;
+@@ -92,6 +93,7 @@ typedef enum
+ static const gchar *_config_quark_strings[] = {
+   "user-agent",
+   "position-interval-update",
++  "accurate-seek",
+ };
+ 
+ GQuark _config_quark_table[CONFIG_QUARK_MAX];
+@@ -266,6 +268,7 @@ gst_player_init (GstPlayer * self)
+   /* *INDENT-OFF* */
+   self->config = gst_structure_new_id (QUARK_CONFIG,
+       CONFIG_QUARK (POSITION_INTERVAL_UPDATE), G_TYPE_UINT, DEFAULT_POSITION_UPDATE_INTERVAL_MS,
++      CONFIG_QUARK (ACCURATE_SEEK), G_TYPE_BOOLEAN, FALSE,
+       NULL);
+   /* *INDENT-ON* */
+ 
+@@ -2967,6 +2970,7 @@ gst_player_seek_internal_locked (GstPlayer * self)
+   GstStateChangeReturn state_ret;
+   GstEvent *s_event;
+   GstSeekFlags flags = 0;
++  gboolean accurate = FALSE;
+ 
+   if (self->seek_source) {
+     g_source_destroy (self->seek_source);
+@@ -3002,6 +3006,14 @@ gst_player_seek_internal_locked (GstPlayer * self)
+ 
+   flags |= GST_SEEK_FLAG_FLUSH;
+ 
++  accurate = gst_player_config_get_seek_accurate (self->config);
++
++  if (accurate) {
++    flags |= GST_SEEK_FLAG_ACCURATE;
++  } else {
++    flags &= ~GST_SEEK_FLAG_ACCURATE;
++  }
++
+   if (rate != 1.0) {
+     flags |= GST_SEEK_FLAG_TRICKMODE;
+   }
+@@ -4199,3 +4211,51 @@ gst_player_config_get_position_update_interval (const GstStructure * config)
+ 
+   return interval;
+ }
++
++/**
++ * gst_player_config_set_seek_accurate:
++ * @player: #GstPlayer instance
++ * @accurate: accurate seek or not
++ *
++ * Enable or disable accurate seeking. When enabled, elements will try harder
++ * to seek as accurately as possible to the requested seek position. Generally
++ * it will be slower especially for formats that don't have any indexes or
++ * timestamp markers in the stream.
++ *
++ * If accurate seeking is disabled, elements will seek as close as the request
++ * position without slowing down seeking too much.
++ *
++ * Accurate seeking is disabled by default.
++ *
++ * Since: 1.12
++ */
++void
++gst_player_config_set_seek_accurate (GstPlayer * self, gboolean accurate)
++{
++  GstStructure *config = self->config;
++  g_return_if_fail (config != NULL);
++
++  gst_structure_id_set (config,
++      CONFIG_QUARK (ACCURATE_SEEK), G_TYPE_BOOLEAN, accurate, NULL);
++}
++
++/**
++ * gst_player_config_get_seek_accurate:
++ * @config: a #GstPlayer configuration
++ *
++ * Returns: %TRUE if accurate seeking is enabled
++ *
++ * Since 1.12
++ */
++gboolean
++gst_player_config_get_seek_accurate (const GstStructure * config)
++{
++  gboolean accurate = FALSE;
++
++  g_return_val_if_fail (config != NULL, FALSE);
++
++  gst_structure_id_get (config,
++      CONFIG_QUARK (ACCURATE_SEEK), G_TYPE_BOOLEAN, &accurate, NULL);
++
++  return accurate;
++}
+diff --git a/gst-libs/gst/player/gstplayer.h b/gst-libs/gst/player/gstplayer.h
+index 0ac66be..8426be5 100644
+--- a/gst-libs/gst/player/gstplayer.h
++++ b/gst-libs/gst/player/gstplayer.h
+@@ -202,6 +202,9 @@ void           gst_player_config_set_position_update_interval  (GstStructure * c
+                                                                 guint          interval);
+ guint          gst_player_config_get_position_update_interval  (const GstStructure * config);
+ 
++void           gst_player_config_set_seek_accurate (GstPlayer * player, gboolean accurate);
++gboolean       gst_player_config_get_seek_accurate (const GstStructure * config);
++
+ G_END_DECLS
+ 
+ #endif /* __GST_PLAYER_H__ */
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index a5fc913..6655a86 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
     file://0001-mssdemux-improved-live-playback-support.patch \
     file://0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch \
+    file://0003-player-Add-configuration-for-enabling-accurate-seeks.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


