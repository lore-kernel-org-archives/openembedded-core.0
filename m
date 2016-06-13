Return-Path: <urs.fassler@bbv.ch>
X-Greylist: delayed 1806 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 13 Jun 2016 15:16:57 UTC
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0062.outbound.protection.outlook.com [157.56.112.62])
	by mail.openembedded.org (Postfix) with ESMTP id BE6A26018C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bbvSoftwareServices.onmicrosoft.com; s=selector1-bbv-ch;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=YZxuOosLOgOW/DA8crSBIuFMbAztvvRVs55XLvGw5K0=;
	b=SPrqJcJO3ilyiUQ/9kSzKVj1nDoAI0hIc3OLu9DA9nGJZCvGbvYqZA8eIZl6ucdOUxyeQ0ZaM3EQ2td2zcl0kL1abNb8Wnfgq7FzS/Q689JLzhAPtaCor8nYFt8F4WXecvZdY560bN62cs/7eJq810af1TYMjHoTDsbLf2vYI3g=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=urs.fassler@bbv.ch; 
Received: from talon.bbv.intern (46.140.25.6) by
	AM4PR03MB1825.eurprd03.prod.outlook.com (10.167.88.149) with Microsoft
	SMTP Server (TLS) id 15.1.517.8; Mon, 13 Jun 2016 14:46:50 +0000
From: =?UTF-8?q?Urs=20F=C3=A4ssler?= <urs.fassler@bbv.ch>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Jun 2016 16:46:21 +0200
Message-ID: <1465829181-23218-1-git-send-email-urs.fassler@bbv.ch>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
X-Originating-IP: [46.140.25.6]
X-ClientProxiedBy: VI1PR06CA0056.eurprd06.prod.outlook.com (10.163.160.24) To
	AM4PR03MB1825.eurprd03.prod.outlook.com (10.167.88.149)
X-MS-Office365-Filtering-Correlation-Id: 499c47fe-51de-4ca9-d3b9-08d393998d9b
X-Microsoft-Exchange-Diagnostics: 1; AM4PR03MB1825;
	2:9MEE7M/yt0rBJgLGSFItiDlSxGu5RwsrUPTNodODHUTaxx6mQHudfrXvK1GRVZmO6nvfGWJiiQmjd/8VugL6aUAPeYqJfnnzjcPERT+TgdJlDcGsBz/O3xwPIg3IHVwpf3ZkAU7dPUrp2pc9SedeOi75T9qP6z8vtjYV/m29bsmcizMnMAYLnofrvuosSOSK;
	3:kCDHh5+Yp1BOoVSdSW/5K0M8ky8TyEaQCFin6u3+vGlaZxI4sjDuesu81PMcjxgen7uylkUcG7TqrANP1K/oVpXZeQ3H6LrF4607XrGoKiWbekfUmDOO4H+hb10TfDPf
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM4PR03MB1825;
X-Microsoft-Exchange-Diagnostics: 1; AM4PR03MB1825;
	25:XyF14sxoR+LCSHCQWdTde0eClK6ZCTstjDfIAk8fkBOVLh2DIi0JIn+YtVBS/jpEVekL+rCk5OsXWDePZ12IWG577ckgA7ubUZ9vPnw+WeFIA6BesiHunKQxfUiLyxcuy/u8J7bgpISzHtO329HqE23eesYF91ZovKMivxtIHNM374SctjWeWSDT/R0/SA2wbtqfvUm6XcXBlqql7pHZ93oc2CZYoUOGWXBJQB2emFPaHr8jTh9j5JaEEWrajdiIoaMBcxOiTFtvRVTaUruzCf5qgX5kBHimA1ssGtzuTaH1i97d9W+OzDWKyesxqWIUwAsd5dfXBqfxKHTwWNfI81tARo95BR0BOk+mlHBChFnr6p55AtIQuyQjjB4hIna6AsF27Ir+LqTLjfqpHeJoEAyKt5agxretuggOJTsIANGAvl2oaLDVPBNsxRp9iw8lz0i36VR5rlhBC+sXu3OfHgsGpFCLODGRaDe85vUcn6Oan1YV3wIJvdDwbBdNR7QIcy76L7/n51h3MIuBMsKqjwDmDmqfNvEFT33+7IhS4AdQF70wthyR6utY7BWN3Gyph2oBF3dPxz/SdSVIRps6xdHPDFdby1q2bjonxY5f3VHzLR2I+b6hj5clLShlFvSYUq1a0ydx6Ukn9dUzbP8B/EUjFNokqrYu30I0eQCGl3kPEnP3sHqz8+YU3g2uQScS3khgANffyFQUTPI1zgmjdA==
X-Microsoft-Antispam-PRVS: <AM4PR03MB1825B1F4159A5D83DE74CF418F530@AM4PR03MB1825.eurprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040130)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041072)(6043046);
	SRVR:AM4PR03MB1825; BCL:0; PCL:0; RULEID:; SRVR:AM4PR03MB1825; 
X-Microsoft-Exchange-Diagnostics: 1; AM4PR03MB1825;
	4:Rhgxr2wgfFPqWs2Y8t7NYbg/Jn5MnWrDzN81reP6mWmnhT+E3tJ2Y3947ymJlJOJoqFJiWXlkivIyHp69BCYKLPqcDKR/ncnLATP6diX+SZRll4Z8urrrNHwLuzs4751rMTjhtCLZjHuSON1jP8ZOslDYdftd0tH4llT1NdNbLtCeSa0uXLJ3620KOaw9SlxYOW+N9azqGiL4gotaQeNwX69sTXchC7EplakyhgSxolceJcwF+DymdvmVtsW4QvpBl+vaN5WqK/eHnDbJ0tjoB/Vpud4+WvRYen6cA5gV7/dxRN37pwaB7BJqqUbI0oJfmI3m9q8VVEfHGYPtwUcybFq+f+/EC4xLGUeVWXOm5gtC1YgW3dif5+g/V4p+7ttdBfBsNHWq2gT1QYERdzRnV3OJ0IcIAPka0/HThmlGGk=
X-Forefront-PRVS: 0972DEC1D9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(199003)(189002)(229853001)(50986999)(66066001)(2351001)(97736004)(68736007)(106356001)(50226002)(42186005)(101416001)(5004730100002)(110136002)(50466002)(586003)(81166006)(8676002)(81156014)(47776003)(189998001)(5008740100001)(105586002)(92566002)(3846002)(6116002)(23676002)(2870700001)(450100001)(2906002)(74482002)(4326007)(77096005)(86362001)(33646002)(19580395003)(5820100001)(19580405001)(36756003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM4PR03MB1825; H:talon.bbv.intern;
	FPR:; SPF:None; PTR:InfoNoRecords; A:1; MX:1; CAT:NONE; LANG:en;
	CAT:NONE; 
Received-SPF: None (protection.outlook.com: bbv.ch does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtBTTRQUjAzTUIxODI1OzIzOkd0TVdRRDhLMm1WTWpXU3dBWUtuU3pmdWdY?=
	=?utf-8?B?NmpEVDJJT0xIREZOZmNrbzhGMEhJSGxkOGYrYzBwY0tjTHdQdDJSdEdsdHl4?=
	=?utf-8?B?Nlo3MXIrem5RaFNCcFk3ZzV4bjl0aG16UlFPOHBvbFRwS29lV2FkelpnUjhC?=
	=?utf-8?B?NjdZTnFkS2FhcFg5aDdqV3ZSeHFyQit6Rmp6anpUUVllQXVwWWVmWFNyVzBM?=
	=?utf-8?B?L1liWUxUUGR4QjliZzR2L00zMGlDRm1kekVIbGxTK0JnelJhR0Z0YzdXMmFr?=
	=?utf-8?B?eVNiSndrZWh0M1cxQ0ltOHozZlNYOHlsVkN5bEFnNlhlSHVYekhsRkJpY29u?=
	=?utf-8?B?a1ZtM3RrVGZLVlY3cm1YcmJrTWlHUHNRZkxNMEpCa3ZOWTVpWEV0elJuWmdi?=
	=?utf-8?B?djcrVVU3Zmw0OEM3WXRFdms3TFlVZUs4Qm5QVyszdnhraG5CUCs1ZU1EMkhk?=
	=?utf-8?B?L1Z5TEhQUGpvUFFuaEtZN0FJMndPQTh3bDR4RkJQY2JuZkY4OEFid1VmVXlK?=
	=?utf-8?B?bFVzUyt1VSsvN1VqV2RrUHUzbkNqd2RQQUtDeXpRKzVIMzhOc2c0NERubEdC?=
	=?utf-8?B?eElYQkw0c1FGRTJFVFVwd010K21NeEJ3cGEydzhtRDY2eVZDbFNoM216NjB5?=
	=?utf-8?B?ZlVCSWQ2cW5pTTlrVkFJTnNWbk5IUnZUWlBLWFRaRis1clVoaFRCc0J6UUMx?=
	=?utf-8?B?dEkwQzNqeG5GMXY3MXFsdmN1TS9EeXFJUlJHZnR4YVAvV1FHdVZOY0t6SzJS?=
	=?utf-8?B?eXpnbE5PTUk2Rmw1MnA3NWVNYk53dGN2eU5rMExwY1d1LzA4YlE2aXJnSWxE?=
	=?utf-8?B?ZitHbWNZanhZbW91TWpVSkhWKzJIdjRkVTU1VVJpT2M1L3E4V2VFcHlPL3Yz?=
	=?utf-8?B?Mkt5eStLVmdBZENBU25selU1cmRRelVzNTFMVEtZZkNNMmExTEFGS3JZcXhw?=
	=?utf-8?B?MXFod3JLQ0lCOERCSkI3V0JZdE1Kc1BGSmlCdTM4L0JmLzRhL1J2bjF1L1d1?=
	=?utf-8?B?SzV4OFEvVFJDVktGaU1hQ2RZdmZLT045SnhOeXpGYmg5ZkdmZTg2VnlMV1B6?=
	=?utf-8?B?WmRiTU5idUs3eE9pV29KNEJTbHJiVUtnZXpZRHV0SVNPWDBnUVVGY0lBTXp0?=
	=?utf-8?B?L2tNaC94N3V1VGhQRWtnN0VVNjBWRXpDZTNsaFFJTTFlVHhyZy94ZzE2dUxu?=
	=?utf-8?B?RkVHd2pnNUh2V3AwYjJoelZ2bllOWndqdWcyUlZJeEgxeGppN3ZYYmZ2eERq?=
	=?utf-8?B?U1hMNHgyNjV3RjhJcU5ubldJY0lzTUNiS2t5OXAreEljTUptTUd6UlMxSFBW?=
	=?utf-8?B?WnJRcXZlTXRlUWR5WjVmLyt2UExaQXIvakZGR1V3S3dnQ0tvWXdzNS9ZbXg0?=
	=?utf-8?B?UGZ4akZjRzdZWmVrSGl0OHFORVRVQmdmYlo0OUhzUmF3MWhYbzNVc1R6UlZO?=
	=?utf-8?B?UGpCbkowVE9zZnRTN2J6Ym90Wk50cUQxb29nUWRBZW5zUmdXUkhicFh3OGV2?=
	=?utf-8?B?VGZ2Zz09?=
X-Microsoft-Exchange-Diagnostics: 1; AM4PR03MB1825;
	6:cxzYoqCv3/+9fPAIzGIS1P+t5WEFm5UHoK62mvfUhlLNmr8sNvP3k49cslu7cJPI90m5X1yzGYAg9RfLxcdWlgmiuF7hMW9aYMNrs5a8JFkSutY/mEHzx6f4geXh32Z5lYcEe0KDt/h22yg3BoHEztYcESs8NZlJn5D61On6YA78kyyu8wvAi4GcJcyCeLiges3hrxjcQ3DBllPHwUxbXHvCTxopKVSypq7J9HyqAnWTFhLZWfrsE5EqDwS0C2Li89hfqH5UKlYnVq04y7TW2M9JvkoJUwT95Vvrd657QdcglUnIhdlfv6EkD4Q2ZIIL;
	5:LM7bnHTka9G7wmnCGos3OYe6kthbYioQkiXys0vY2eK/l7QqoAgHsTZzCnQJQyCHJ5iuMua4emxsNRIj4ichcsEpcYicykvqi4kobdr2ZkZHc2kvqEEy3TlDccwdQmhyYuHGEOaQOaOaWFaASMDD1A==;
	24:2FmmjgLkkC7u9e7gMcm6GDFWs5i6GdaG6sB7oOvOJ2LYjhMYJGRZmcaUJqHTIo7qBjQJncUfk+IYa1wuMr6FVRrYezcnzZZu0bzX/VO+6uw=;
	7:Kz6xaugwY5c7lH0mhbzm0vQuTuqC+gC+AEqfOJzapuHOjdDQaMr+sDxgDp4ZL4PxnKE9cQUDcWf3rZRnQIxysKUh6xxyN/zIGnjRr6KMtugjFVmWY102dZh1FnDcfLe/t54tqaNAXZWBmOJURKa6TLfHFotIBP1mi1cqLWfxFdhGnl76ksXmK8TGwfcFnPP3DdOp5pBEQPX013SUEu1p9Hn8R56HV/ZR3f+D8bwd1bc=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: bbv.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2016 14:46:50.2559 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR03MB1825
Subject: [PATCH] xinput-calibrator: add missing dependency for xinput_calibrator_once.sh
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
X-List-Received-Date: Mon, 13 Jun 2016 15:16:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

xinput_calibrator_once.sh uses xrandr to read the resolution but is not in the dependency list.
Busybox is unable to parse the corresponding line, hence depending on bash.

Signed-off-by: Urs Fässler <urs.fassler@bbv.ch>
---
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index ac5b70c..98ce7ee 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -34,5 +34,5 @@ do_install_append() {
 }
 
 FILES_${PN} += "${sysconfdir}/xdg/autostart"
-RDEPENDS_${PN} = "xinput formfactor"
+RDEPENDS_${PN} = "xinput formfactor xrandr bash"
 RRECOMMENDS_${PN} = "pointercal-xinput"
-- 
2.8.1


