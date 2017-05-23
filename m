Return-Path: <carol.zhu@nxp.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0052.outbound.protection.outlook.com [104.47.32.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7620671C27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 May 2017 14:09:40 +0000 (UTC)
Received: from BN3PR03CA0065.namprd03.prod.outlook.com (10.167.1.153) by
	BLUPR03MB168.namprd03.prod.outlook.com (10.255.212.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1101.14; Tue, 23 May 2017 14:09:41 +0000
Received: from BL2FFO11OLC014.protection.gbl (2a01:111:f400:7c09::166) by
	BN3PR03CA0065.outlook.office365.com (2a01:111:e400:7a4d::25) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1124.9 via
	Frontend Transport; Tue, 23 May 2017 14:09:40 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=nxp.com; nxp.com; dkim=none (message not signed)
	header.d=none;nxp.com; dmarc=fail action=none header.from=nxp.com;
Received-SPF: Fail (protection.outlook.com: domain of nxp.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11OLC014.mail.protection.outlook.com (10.173.160.144) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1075.5 via Frontend Transport; Tue, 23 May 2017 14:09:40 +0000
Received: from carol-OptiPlex-3020.ap.freescale.net
	(carol-OptiPlex-3020.ap.freescale.net [10.192.241.17])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4NE9YgT029059; Tue, 23 May 2017 07:09:38 -0700
From: Yuqing Zhu <carol.zhu@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 May 2017 22:08:03 +0800
Message-ID: <1495548488-12280-2-git-send-email-carol.zhu@nxp.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
References: <1495548488-12280-1-git-send-email-carol.zhu@nxp.com>
X-EOPAttributedMessage: 0
X-Matching-Connectors: 131400221802146940;
	(91ab9b29-cfa4-454e-5278-08d120cd25b8); ()
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(336005)(39400400002)(39410400002)(39860400002)(39850400002)(39380400002)(39840400002)(39450400003)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(305945005)(5660300001)(189998001)(50466002)(2906002)(48376002)(498600001)(575784001)(86362001)(104016004)(5003940100001)(8676002)(356003)(54906002)(6306002)(36756003)(50226002)(81166006)(33646002)(4326008)(8936002)(85426001)(47776003)(106466001)(2950100002)(6916009)(6666003)(2351001)(110136004)(38730400002)(230783001)(8656002)(105606002)(53936002)(77096006)(76176999)(50986999)(129583001)(146423001)(17423001)(121003001)(156123004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BLUPR03MB168;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:ovrnspm; MX:1;
	A:1; PTR:InfoDomainNonexistent; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11OLC014;
	1:1d+ZYAndjr5363NNzqR2ek33xTeywsEGqfQ8KYzVUlHvmdIRyU4IyuZp7KOvEuPt1KnBuh1MkemrIqnTo2PehooHHR4GEAC1x8DhUoUQBuYB2bJuCZ3nsBu9zQoLEQO6eAJtB/G5mSEEAEqeQQAYtbv3w/Jxp7tAGc0YhdZCko/+db8Pg3RIcSXC6YkHdK8N6hJwEos/OrYw8mIgf9DkEXoXBmuhOtTOzlhgsqySp7HzmHr4774q/FIyFwfL/YLVJEXUTnaOgACXiCuUQr+D8Rmg/y/EenZb3bSmVMa9hOXLZHVx9SaoLuZedwoM25wiXHIlsmLE4hRG0kxwqjPaIMLo79KDrfJjMtCCHt85Yz6QplW9cyJ7DJ0dJkQrMq6rqARuTO/rGZtuBUD24P3ClAy3zjJMJBWuExJmx+hgOYy7XCEPdVz6G4ga/UVPY9TO/cpsf8zU+bKRAsDwRSYOjuY2Zwp0iebL7h0/E5j9TwFahco63SLz34xdhBoZqRGKDjEQCCIkq4qaPj3uWmu0Kyf0VlS9NOABDK/yo84oihHvaZvoJPIihT/tBJHEek/N1k/SOHNDgEWzvxIJFEhnvMuV52YXTUhkOiQJnmWx70kUCcpdx4aPe5YWrvTjyo3ZgJHtMFi7VclK5yMDelSNgUuhC96ycs1SAdKDE/lQ+pTlgzoxvegT7rAjXyIvteZ+pfHGUa/WbhQPuhyzdxetRLnkk6osiG4Ja5cWKDQyv4ak9nJrSgCVN02e3vxATgIGlUGScf+8/+6hefuaMMZKHg==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLUPR03MB168:
X-MS-Office365-Filtering-Correlation-Id: 87d973ba-7a20-40c0-ac7c-08d4a1e55a63
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131430075)(201703131517081);
	SRVR:BLUPR03MB168; 
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB168;
	3:wo9yVESLMRGCS+ZpyGNl/9aThmf2U0Hk7yoMTaBciI5ox4+20L0ONcJe/TNzBET1YfbMVx9f3dMkbeJz9Kt9pEbtjzuoH9feH2GwMFzt7s8Aj3P0qZ5YTA0/HBPRJROFVWd/EzwhQ+ZtgMczlM4Dw2amS/YQd2Om8FX30s4TVSZr0uDJwFcg5S17V5rXvkF7MCEMoS4gLD8FJ98MqPPk+o3Wtsxtm/ErrsQjqqSkKEaLt7cYvR8hSCGdza9hjB6HB4rwvZasxM1ETlc8of3vfCZEG+bDm0KSiw+uoxj9v8nURVJI/KnOv1h2jjeY/zlqx43alb291QShqaxtnepJOnYx3KdbhqGNu4aaIlF9r3FChLk8MZ8zD3wGFCPQ8l29VlAyiZApwZCUOKEdQu/YNF5eOY7re2bi5jalnbP2jbev7B1RR/sK4sLe1xInXQRM;
	25:/6Z91H6XiDBl0yOpBuAKtMtdYLkiYaWdErHNrS+wweTqnNOs1Qs8m34WUPAOoG0fxF0ZkmDr8x/Qdu3t8WVO1MJRDsXmqwyhCo+4xAg/umfpZReD0cYfIlzfs+p3XdPliyK9ZulMXwwA/1smsfT2mqq8jgrYwVBejRH8++rigkepCdmddEiLI3SRiia5Gm0VbAUh+h+n4xgQgPZ07TXo/+Tc7OWHFt8OVoQudWtcOLiaXJXYMdNvbHNEhBCkQpprP9mGkF/66GUV9qG+VBmMQqj6ZnOGD4o9B3WMnOaOJCCW/kQ0oHr86sh8ubBKO5qHZwTR19rr7zy3uw4lPpdWshnVUT6Yz7cWuvzvNda8BfQ1H6GdB8OVoJxvhaIzB1MpNlt0dizQg2MLbjxdkaksf22GIsrEkdsAL1zMjIBMAORvhsFPmKyjig/37Ee5760sblSjmUA1ubCHfBtQhbU/wNSzIpV1CXfwRq5zj2YmHKc=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB168;
	31:jTEd/ZU1g/cEvCNTbYfLCMg+QCqji51thWEXYjZsSdz4NoP0b4PWF7Qs5dr8gA8DMyEq5bA8qo/H/bYIE0PsCbTwUyvtyhpHtFVsxyclERmwoBPGXB5A84A5B2gqzc5CwlDgthL+Y8wv/7ow4/037GwOr2+R1sTsbtC02QIHlAdm3by3nVewxBFxF3IOrjXjDprXi1Ij+k+9Stc3elqBrNNX/81MKE9aA2KcOZyQ3/dtwQU+GrONVJHzj2kdFJ4cgf1nPByF86NT9jxMq4+YrQ==
X-Microsoft-Antispam-PRVS: <BLUPR03MB168111FEA9FEEC754BAEA8CE9F90@BLUPR03MB168.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6095135)(601004)(2401047)(5005006)(13015025)(13017025)(13024025)(13023025)(13018025)(8121501046)(93006095)(93001095)(3002001)(10201501046)(6055026)(6096035)(20161123561025)(20161123563025)(20161123565025)(201703131430075)(201703131433075)(201703131448075)(201703161259150)(201703151042153)(20161123559100)(20161123556025);
	SRVR:BLUPR03MB168; BCL:0; PCL:0; RULEID:(400006);
	SRVR:BLUPR03MB168; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB168;
	4:t2sMq4ttIkTfG4me4mnwB8+RvXsvoXptPpAi7lXZPoT?=
	=?us-ascii?Q?O73Mcza5Cx+IFoq0SeUb5Bz8CRl//Mxlt3NzRgX3uvrTwej4kzlAdvgCmntD?=
	=?us-ascii?Q?8HaRTWWpVkRKdOZ3M7vgEqoes4Zx0BgaFahQQkAkgw5bd7N7Svaxu82bVSfD?=
	=?us-ascii?Q?tnptCqHyom7ARa+CyNQk8nQ6o3LAM6RxWeKtwaUc/RHqbRfNI6lwYjOxjomi?=
	=?us-ascii?Q?2dX97LvGjd3FuyeroVoah0n3tO9bQ5dGisxrBC7KjmGfN99dLVZKf4OH6mJE?=
	=?us-ascii?Q?JuG0vkvhk0tDQ4z5+qeTDTNKZ19fUHpHjG8qZMGcZpETjhHFJPFH2Ht25b2n?=
	=?us-ascii?Q?mihECa97IkNWZWxQdhfgzUybFS+oDv2fShBJKVLTX1apmPSgxPaKIYXJL3EV?=
	=?us-ascii?Q?ot9gPKQpMoP+B6dwwghV0TWYEIdPwBO60J7UaQmU20OU0ybvJys8rmokt+56?=
	=?us-ascii?Q?vGz+iPczrVBGSlPjZigR2QcYnH5v0dBh9zkq9Vp/3Vi5j969ORGzRHho8qpu?=
	=?us-ascii?Q?JGpxy0M6dmYXpFgFdOSqcuS37CMWLSTy6Ql6DFRgJGx0GcoXhXR7y+jD63pP?=
	=?us-ascii?Q?VvmAhVazJy2FSGYJIMnq0eEB+9Riu0xsz1rBAda78zns0Gx/IJnf8uSDeXn5?=
	=?us-ascii?Q?V+EIyOtw77gAKrjRSxJyLs4YOSCCFLZAsOrs5sHMY2UYQzVCUt0li5Jsg71G?=
	=?us-ascii?Q?aWTfQa2LQ7T55LDReHJ2uQrX3dorOKH3IDRiOxZmsDtGFrycMue3W7tELILE?=
	=?us-ascii?Q?GYym6GUjkQBqIsxcsVFbFIEGsole0pDKePBdEhDgxnHaYLSahoSjZZ/Y1cWm?=
	=?us-ascii?Q?uyj33rTrpMxHpBwYdzA8/BVl+mChuIQ5tvxlxD8y09iU9Rhs7nsdI/6fGvpr?=
	=?us-ascii?Q?UjjEn5B/lXjcvNn6QW6ptq2OJgc1FofIAuDbZR2Ttk357Rn3Wfug+9jCLJeD?=
	=?us-ascii?Q?IIwmvgVyaH4jzPU1JbcWGCsCuMoBDHva1WAI+qQ=3D=3D?=
X-Forefront-PRVS: 0316567485
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BLUPR03MB168;
	23:f8D2c56vSNA9xTT0/IN78khBOv8v5f+wvhZrp5Pe1d?=
	=?us-ascii?Q?kcyJH3S7+HHyR3Cam4x0PcZLtGjANl/g1+P0oH64Kj3dZNdsrJ5OpMgp9BkX?=
	=?us-ascii?Q?XVkHPAe4enTeLBcXdiU/ELI8zemUJz8pAsgPbsuIcpFGxOP7Jc+wpaFGvLXT?=
	=?us-ascii?Q?zjHgrsXC6u/ta0GwIQshhzIC5QXhVMxdXRAZhjvaOhaBVGCd+sf3w2kWpbQS?=
	=?us-ascii?Q?8ERA81iUSgjsPBDyD/FGzRAlCcS8BvKzAocUwvzVNWKwyKYqkTkXh9I1c32e?=
	=?us-ascii?Q?WqJqOyZ5U6w77DZ2AhKUnFAi1DfdpHsDsW7gZHDxnf23L+6wT5cfNnIVozML?=
	=?us-ascii?Q?Sm5unkZ9mWDJ8jI5G806W73a1WcOmo34aYD6XNN03nbSUtG4+wUB7o0llCO1?=
	=?us-ascii?Q?9fe90Rzv5Q9vQhsU6VCQh0ZTBDgG1gHKqItI0d8RO89RDfh3Pxf+225j3Mkd?=
	=?us-ascii?Q?HqEIq0sEMkwmNA+DugT6dncYJrs1+2bjsOX4d9lkyDRxpIl8aI4VVl7+ybP4?=
	=?us-ascii?Q?PGFR5A2VhTfwRHcCchmCKfXb0im9wQG6z3T9zdqkJjYBnmKAfhHQsWnTyvMO?=
	=?us-ascii?Q?m9Qo8MtIpl5avjMnF+HJmzOKtoubetvxP3bCNW/XepF3bVqPremVZsPyheKT?=
	=?us-ascii?Q?DW8kTWZRqaDhACrAZZajgvFs31QhlBix3HSzHuGMjvze1GlQZXnAs0ab39NH?=
	=?us-ascii?Q?KNXB2KO21E4CU9lO+upOZQgvdhDEQtzbwvfOuBC962LWSe5MynObBFsaCNG2?=
	=?us-ascii?Q?BUB2Sgz9pgjI6Jy1E54Y+6DaQX+gvgITVy97CjzG4PI39JcneIW/JNGQfbVe?=
	=?us-ascii?Q?B8pifU0KfUKI3Jo8mZkpSDF6OjI5de2hWh3EfSJI9Jt344GjrP8RL/vFBiyc?=
	=?us-ascii?Q?UVFCHRg0ykJZkjmSVs33WGb162aqlzEYch5MSdscfQBPgK9O23HQq80bTb9H?=
	=?us-ascii?Q?xJYkEeKH1sGcqvJCfk7NRwRu2eHfKjxMbVqONjX3O43LJSpgXQenDyPSnCBe?=
	=?us-ascii?Q?l7NyPKcvhjJam8/McG/Ju95YAbON/dl7aJBpzhIsqHnGXcA/tDv1s3aER7OS?=
	=?us-ascii?Q?PLIf1labOR5s8mgjpITUidwKUUxmnpLLnxi0dQvcxsRuVMQzU1LVnfaWsE4A?=
	=?us-ascii?Q?R/jNNDlX8LgdaQ4+XTIKJa4EaoOT9XvfoAHOJFI9l2W7TgLOsvcQXGrtdXTX?=
	=?us-ascii?Q?qh0nEi+YYz7rIE6XQeSbs5eoyOGcuKYH4olDo7zz/J+acvBiOZ3FclfYkHnT?=
	=?us-ascii?Q?laDZdb/BnpJxuHNuhHws668QkyTuPWjsaN2qW2GDdhA+oTWiwoUxykEIQkYe?=
	=?us-ascii?Q?6pOcZ6jmOkfP+QkgyHSgm9Nw+vTdEqHdFTwzOsH2KsbfZJsaSOMn/Z5IEGW2?=
	=?us-ascii?Q?GmXLTndJegF4e5j3RH0q2Vatl+Yyi0oJmmtM6PCrzmD1c7pyzXgRSGhwHnMX?=
	=?us-ascii?Q?9mCRyYTA=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB168;
	6:FUVY4RMEIjtAzzltGqC0saFeBgZ6bIKreIje6FK5ops5jYPbZM2cNGYSuIyRbABlVK76HM7d+xX16Ta15DtJJxH8E9iuqvKpZONtNP2BFM9vk0Q7P3rEQFmSJZ4Y2bBspLdD5XhPrIPIL23ClEefEItudTiBQiKSY0qySwHg5fyddMe0i6mTcM/ARVtEKc1g0zllfJPEN5o5fm/oEOp7sjZHGButq8N9rDUT2jEqTI5c8+R1pcXTuyOZQliQp1OZ7/bKQYogiDYlu7+QTBkLXZKL76HW/lF88qWL8aFhGhtPhDWytBb2yr0xDHDJ0oReoLAziQkWqEn7YT82AZTmyc39ECsew0Ay/jQR+irDjKQ5nOzLgmB48/ahqSW/7RHakZRGVPDRZY8PYr99LJPbYMszRZ+0OBYbd558c3XR9cZg9ceErk0q3rtIDlk0ggeG0S0DWG52R2/AIOqu+NfP0S+NB7BlKgfQnN2kzAnOETqA4+4moyr0ME+0d8627Lr/19Y6pEJiO3/ixFXLAHlHsQ==;
	5:XXyueiVL78zaPiRQGZxNF7ic8YJh0ZnGratu3ZFhD3TiR/PTllfylEcmWKROh411ZClqnMgwz+9v/mQIHTF1DF2/ucoKHcBG7sZWgpovJDPdkI+q2uuAkB8mvzZT3KCDuM/76zp+kzruxDiOsEcU9C+7fbx9CyQVLplazccCrJizhpvWmQyEngIY+1Psgjl1;
	24:hJeU3N9wTdOGoOkqjn85b2ieejZERLJoKsoaxdqmfVrITXgar1v7Zb7H1L71NfnruvwB5Bh8Z54W7ayAnvkD3pqJofFm2z/YTxivbLjv5o4=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BLUPR03MB168;
	7:eOVoyLHrmnwpOFe/D6FTzDktYpWruzwsZM1WBKy1vQQ3a3a49IkgKtH3z8UcNOWGSkpS2RfIDg0B1G+mjvRdI95AsyBDmqeMIy1Gl+byKUGM745+QNsyxS2ORAAeRlRgl88tVW7/yn/pKpvP3zJPxKSnIWxs7j4+ij0W9v0bH+x+kvo2LJpMPe+w5HAI1jdWAnaUcS9fVFxsQuz2t5Xce3jkPvnmKS5a1Ja4MdJDYta/6yCmyWYK8cx94ptHJLUQJLjcGVl+W3I1RZJkbSl/NDtEnOtQRZ3SzEFEx9TuExvJaLW0ACVKcTK11/QDCd9sNuDVmTJfjOzPKulcU5x37w==
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2017 14:09:40.0430 (UTC)
X-MS-Exchange-CrossTenant-Id: 5afe0b00-7697-4969-b663-5eab37d5f47e
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=5afe0b00-7697-4969-b663-5eab37d5f47e;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB168
Cc: Yuqing Zhu <carol.zhu@nxp.com>
Subject: [pyro][PATCH 1/6] gstreamer1.0-plugins-bad: Add two enhancements for qmlglsrc
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
X-List-Received-Date: Tue, 23 May 2017 14:09:40 -0000
Content-Type: text/plain

1. Need set use-default-fbo to qquickwindow during set
   property to support change render target on the fly
2. Calculate qmlglsrc refresh frame rate in qtglwindow

It adds some common features for qmlglsrc to make app development much easier

Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
---
 ...2-qmlglsrc-some-enhancements-for-qmlglsrc.patch | 170 +++++++++++++++++++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb   |   1 +
 2 files changed, 171 insertions(+)
 create mode 100755 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch
new file mode 100755
index 0000000..b4e662f
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch
@@ -0,0 +1,170 @@
+From f55cc58325ed5df0b0d5fd0a61ebb32d735c2481 Mon Sep 17 00:00:00 2001
+From: Haihua Hu <jared.hu@nxp.com>
+Date: Mon, 7 Nov 2016 16:31:02 +0800
+Subject: [PATCH 23/24] qmlglsrc: some enhancements for qmlglsrc
+
+1. Need set use-default-fbo to qquickwindow during set
+   property to support change render target on the fly.
+2. Calculate qmlglsrc refresh frame rate in qtglwindow
+
+Upstream-Status: Backport [1.11.1]
+
+https://bugzilla.gnome.org/show_bug.cgi?id=774035
+
+Signed-off-by: Haihua Hu <jared.hu@nxp.com>
+---
+ ext/qt/gstqtsrc.cc | 14 +++++---------
+ ext/qt/qtwindow.cc | 34 ++++++++++++++++++++--------------
+ ext/qt/qtwindow.h  |  1 -
+ 3 files changed, 25 insertions(+), 24 deletions(-)
+
+diff --git a/ext/qt/gstqtsrc.cc b/ext/qt/gstqtsrc.cc
+index 3cfc709..350f70d 100644
+--- a/ext/qt/gstqtsrc.cc
++++ b/ext/qt/gstqtsrc.cc
+@@ -132,6 +132,7 @@ gst_qt_src_init (GstQtSrc * src)
+   gst_base_src_set_live (GST_BASE_SRC (src), DEFAULT_IS_LIVE);
+   src->default_fbo = FALSE;
+   src->pending_image_orientation = TRUE;
++  src->window = NULL;
+ }
+ 
+ static void
+@@ -147,6 +148,8 @@ gst_qt_src_set_property (GObject * object, guint prop_id,
+ 
+       if (qt_src->window)
+         delete qt_src->window;
++      qt_src->window = NULL;
++
+       if (qt_src->qwindow)
+         qt_src->window = new QtGLWindow (NULL, qt_src->qwindow);
+ 
+@@ -154,6 +157,8 @@ gst_qt_src_set_property (GObject * object, guint prop_id,
+     }
+     case PROP_DEFAULT_FBO:
+       qt_src->default_fbo = g_value_get_boolean (value);
++      if (qt_src->window)
++        qt_window_use_default_fbo (qt_src->window, qt_src->default_fbo);
+       break;
+     default:
+       G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
+@@ -508,7 +513,6 @@ gst_qt_src_change_state (GstElement * element, GstStateChange transition)
+   GstQtSrc *qt_src = GST_QT_SRC (element);
+   GstStateChangeReturn ret = GST_STATE_CHANGE_SUCCESS;
+   QGuiApplication *app;
+-  guint64 frames_rendered = 0;
+ 
+   GST_DEBUG ("changing state: %s => %s",
+       gst_element_state_get_name (GST_STATE_TRANSITION_CURRENT (transition)),
+@@ -553,18 +557,10 @@ gst_qt_src_change_state (GstElement * element, GstStateChange transition)
+ 
+   switch (transition) {
+     case GST_STATE_CHANGE_PLAYING_TO_PAUSED:
+-      qt_src->run_time = gst_element_get_start_time (GST_ELEMENT (qt_src));
+       break;
+     case GST_STATE_CHANGE_PAUSED_TO_READY:
+       break;
+     case GST_STATE_CHANGE_READY_TO_NULL:
+-      qt_window_get_total_frames (qt_src->window, &frames_rendered);
+-      if (qt_src->run_time > 0) {
+-        GST_DEBUG ("qmlglsrc Total refresh frames (%ld), playing for (%"
+-            GST_TIME_FORMAT "), fps (%.3f).\n", frames_rendered,
+-            GST_TIME_ARGS (qt_src->run_time),
+-            (gfloat) GST_SECOND * frames_rendered / qt_src->run_time);
+-      }
+       break;
+     default:
+       break;
+diff --git a/ext/qt/qtwindow.cc b/ext/qt/qtwindow.cc
+index 3d96751..edb6b24 100644
+--- a/ext/qt/qtwindow.cc
++++ b/ext/qt/qtwindow.cc
+@@ -29,6 +29,7 @@
+ #include "gstqsgtexture.h"
+ #include "gstqtglutility.h"
+ 
++#include <QtCore/QDateTime>
+ #include <QtCore/QRunnable>
+ #include <QtGui/QGuiApplication>
+ #include <QtQuick/QQuickWindow>
+@@ -71,6 +72,8 @@ struct _QtGLWindowPrivate
+ 
+   /* frames that qmlview rendered in its gl thread */
+   guint64 frames_rendered;
++  qint64 start;
++  qint64 stop;
+ };
+ 
+ class InitQtGLContext : public QRunnable
+@@ -146,6 +149,12 @@ QtGLWindow::beforeRendering()
+ 
+   g_mutex_lock (&this->priv->lock);
+ 
++  static volatile gsize once = 0;
++  if (g_once_init_enter(&once)) {
++    this->priv->start = QDateTime::currentDateTime().toMSecsSinceEpoch();
++    g_once_init_leave(&once,1);
++  }
++
+   if (!fbo && !this->priv->useDefaultFbo) {
+ 
+     width = source->width();
+@@ -157,6 +166,10 @@ QtGLWindow::beforeRendering()
+           QOpenGLFramebufferObject::NoAttachment, GL_TEXTURE_2D, GL_RGBA));
+ 
+     source->setRenderTarget(fbo.data());
++  } else if (this->priv->useDefaultFbo) {
++    GST_DEBUG ("use default fbo for renderTargetId");
++    fbo.reset(NULL);
++    source->setRenderTarget(NULL);
+   }
+ 
+   g_mutex_unlock (&this->priv->lock);
+@@ -256,9 +269,14 @@ QtGLWindow::aboutToQuit()
+   this->priv->quit = TRUE;
+   g_cond_signal (&this->priv->update_cond);
+ 
+-  g_mutex_unlock (&this->priv->lock);
++  this->priv->stop = QDateTime::currentDateTime().toMSecsSinceEpoch();
++  qint64 duration = this->priv->stop - this->priv->start;
++  float fps = ((float)this->priv->frames_rendered / duration * 1000);
++
++  GST_DEBUG("about to quit, total refresh frames (%lld) in (%0.3f) seconds, fps: %0.3f",
++      this->priv->frames_rendered, (float)duration / 1000, fps);
+ 
+-  GST_DEBUG("about to quit");
++  g_mutex_unlock (&this->priv->lock);
+ }
+ 
+ void
+@@ -410,15 +428,3 @@ qt_window_use_default_fbo (QtGLWindow * qt_window, gboolean useDefaultFbo)
+ 
+   g_mutex_unlock (&qt_window->priv->lock);
+ }
+-
+-void
+-qt_window_get_total_frames (QtGLWindow * qt_window, guint64 *frames)
+-{
+-  g_return_if_fail (qt_window != NULL);
+-
+-  g_mutex_lock (&qt_window->priv->lock);
+-
+-  *frames = qt_window->priv->frames_rendered;
+-
+-  g_mutex_unlock (&qt_window->priv->lock);
+-}
+diff --git a/ext/qt/qtwindow.h b/ext/qt/qtwindow.h
+index 8cb5a2c..697f389 100644
+--- a/ext/qt/qtwindow.h
++++ b/ext/qt/qtwindow.h
+@@ -65,7 +65,6 @@ GstGLContext *  qt_window_get_qt_context (QtGLWindow * qt_window);
+ GstGLDisplay *  qt_window_get_display (QtGLWindow * qt_window);
+ gboolean        qt_window_is_scenegraph_initialized (QtGLWindow * qt_window);
+ void            qt_window_use_default_fbo (QtGLWindow * qt_window, gboolean useDefaultFbo);
+-void            qt_window_get_total_frames (QtGLWindow * qt_window, guint64 *frames);
+ }
+ 
+ #endif /* __QT_WINDOW_H__ */
+-- 
+1.9.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
index 0bb4053..a5fc913 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.10.4.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://0001-smoothstreaming-implement-adaptivedemux-s-get_live_s.patch \
     file://0001-smoothstreaming-use-the-duration-from-the-list-of-fr.patch \
     file://0001-mssdemux-improved-live-playback-support.patch \
+    file://0002-qmlglsrc-some-enhancements-for-qmlglsrc.patch \
 "
 SRC_URI[md5sum] = "2757103e57a096a1a05b3ab85b8381af"
 SRC_URI[sha256sum] = "23ddae506b3a223b94869a0d3eea3e9a12e847f94d2d0e0b97102ce13ecd6966"
-- 
1.9.1


