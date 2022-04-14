Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978A1C55191
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:55 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.102])
 by mx.groups.io with SMTP id smtpd.web12.8572.1649917843233514533
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 23:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=Gs2Aoi6h;
 spf=pass (domain: outlook.com, ip: 40.92.90.102,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eW1mJyBs2qbFnBRPX4GaX1oouhQoQspxny5aXLQQS0NmYde/MM8LNR63ro0ghPyQXmrabFOy549+uWgXOaPh/kbZfptatAL8TMnFxM7bqa/uHd5ye/KtPAl7GGWdAaB2VGnv9cKqMc4n4fpKKA0RfzjdlqaVIhcx+fytXMZ4tlHrkmssJxsgdrzTcojuk3pj2Y2Bc3PWoJBV083WeJFjKSLob3q49ePC4enKboNpaiHQQVxaWp5GYKMQDe285zFmmJFdwx/3ZIsfmoDgnNbpXoYfUyWdosTiDsfreAteCnNjGFOEcU/FA19OcsHKAoARK9WI73J4025MOgQfmAmtVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zBd+iDjlR8TTsRHVLb5XhVFIYTk9T+VSl1dqXyl4zi8=;
 b=b3A39oHHUMNW+GX8OFOAgP9PxY/em7CwLIS4D2HK62L4ymA5mBfDta5itnr3X1lgFeaTksJdUej8eGF+Y8x815cV6bvY7SBNmchnf/ruuL5J4f20rT+RYS/qAz7+sV/oK7qsuuG5AHbrgNHzayIIcNDqJ8goIuu8tpP8kwaqKjSbryv/wIz2VwiWqi6+II86egD0Mz+l3fXy3XWrtovrdP0fkfNSrV9CtzYgOq/J2lSfhD5i00eH1jZdlFn0ZJuXZVf4ivERfd23a/YCj9B9N6UzXxVPTOOang1Fa0VOgc/KwjGxWG2r+lu2+5uLjCinFB9/ntb0vUJz2PRwQDqoQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zBd+iDjlR8TTsRHVLb5XhVFIYTk9T+VSl1dqXyl4zi8=;
 b=Gs2Aoi6hAFCi7M7Rm/5psC60eSYdqIiXTYRKNQaUCEI38oWwSbvy9b6luGcv68iFCnlhTMlfReDI+bADKPB+4suZPBZInnyyt8f7dJFyVhDk9T3Y/rcoQM+9una96YGLMqEwqYmRKksO4exyCCO4fU9KLWEstZIA3um5rlExCcQkf7OmAZ97pTRicPabW7nXq+ZrQ8/CzFR4fb9wDORu1yzhr6IAa+6kTMjyMGLPFuo+BLDZ4xek+Lv7PzM28nEeMk9KQ8SWioSchV340cPqK3joagmx1RXTKAlueDHZaadDtg4ocLgeT4ccabMVXnw8Vx3UPqVqhT+BKcLNW3x45g==
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com (2603:10a6:3:f4::15)
 by AM7PR09MB3672.eurprd09.prod.outlook.com (2603:10a6:20b:dc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Thu, 14 Apr
 2022 06:30:43 +0000
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37]) by HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37%10]) with mapi id 15.20.5144.030; Thu, 14 Apr
 2022 06:30:43 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH v2 2/4] ncurses: use COPYING file
Date: Thu, 14 Apr 2022 08:30:16 +0200
Message-ID: 
 <HE1PR0902MB18010F25B5EE2C406CF29C16A8EF9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220414063018.2413225-1-kweihmann@outlook.com>
References: <20220414063018.2413225-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [izvaGtxK76bVXP3r+d8g9+wWfDki/QLcp24jg0JVPabWUqV74TdNg3LCbPm9V+Im]
X-ClientProxiedBy: AM0PR01CA0076.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::17) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220414063018.2413225-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc7310b0-10f9-4ab9-a748-08da1de04d2d
X-MS-Exchange-SLBlob-MailProps: 
	citmFLqyTFR8bB3whAFXzM9oiQFHszB3GqJM9zRtDY4HfyYbneTAwOv2cIM4/rahbmORhJWeneVBPoJ8sN9F3x6TsxaaRJBNQ7Da9PZm2/ap+0R/9cmhSgzxfuLJxicFa5LYoixqlSnUllddD1Xhid6fZctDHaorYtm6WA+IlT4h493H5zxhozUYhybcjSwPb5DqvmSSCaf+eAhSYW8X/8CsQYYF13RsRBzp4PTzv0BrleywR8laKTuF1eYaV+i6HpAyLN6dwAd35jC3UQqKnbpL2bwcyn5TQ4Iawfsc5eI/uzEnxlLPkpKwRmzYLW/KSvxTTtt3vw8CI9e9VrUXN2//7KctOrHB5ijxZ4BRVl0EdWP+8kivx5b5kSBVmUAf/JEW4Wyko8DsShdsLazPzB6C5urZ21dxDKDxykOpfD1qJcAni7o3u8w4RkA1u7kR7M5WPAslFNz7wgheWiOUTRmIyjbdn5/x5bOTge2iW2nDIf6QDOO+e4QgCq99u/Uih5za0PDTRXvj1bfL678Gq/IQniQ4ov9CheKMFijM1xli7ERGDRR60r/0R06iqLK2lisGlZlf3SCVr/lay1Q114YUwcVwKaAJwMXqZMabl2wzPlho5XgZtXrksgX+uS4IdtxaJC4SOv5RDrC9FRzFvzeSZfDp64/xb0vnub12Y4uQB4vfBvXNmDq+8dkyUB2ZotvJI575nZpeWdwRTks1ReH1WfCliYY7ks6649ziZSrXRXj2AXjep0aSkiq8EnMISqxkXEeddeAHb+On4oMLckaXbdBHavUvn6tZCiNDit4=
X-MS-TrafficTypeDiagnostic: AM7PR09MB3672:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z+4MCaTcze+rUDt/y3dItn3wCZtI/ZZKuWHKLyWlkfN+Mius+ZrDUKn2+4Wjjp6PzdLP9mqNujKOWcAh/h+QAUDud9ZRrCG7u6JGKxgYrbg6Cj6hdDaxWEBmOwizRDTAAxZZ2qtYQdSyObpp0ueJcMXbe8Lu7agXyl4qTk3KtIBCj/kYjsN3FChaaPlhLsh9XOQUTYtdKXHG+Le3Yw4+Gx3LrX8kavC8IjYFj4MPcAE+OODAeokk+GXNSy20R+IQEJJML8hdZv3mcU/aquN9bix3aibroBANF6qyqX6y3EzNVVLEZjls5u5h4Y6Iyc5nyIAA9ZSA26Jxf1b4rX3ze2OUTMNDIBCzwkiauQD+G58jz3rxdopEkBwJ0ksWIJOef9CsVMjVSxLcg+lwQegz23wD4qQWFSvQAZ2f4u1b85pEwKCXrblgh44LmrbFUqIJesMH3V8Z6ax9cnbI6zfjEvnhis/x8/KIUdqIuD854KJxpX1r6YaEbs+ALBectUWqxuATv75H0dVU+xHYltbvTIkB+Dh6xpuB+xkeNi63jw8CaJaYvfW2VgfyoC/I4k6plutUS3++f9TYv5tkF5ExSLxZsQBRjcMmtSLSWoBeTlzFD6CHiLcvaXyRABq88hCh
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jChVJkkTqNf1HdBrdmG3ydvFDUmdAKymO9Qs/uUq+eQo5QVo6+GxTRXGxLRO?=
 =?us-ascii?Q?O1uiBDiBYpYvxJhVVzq3ThXjb4NRsOQRIG39EGR9rL1Xmpa9Vmyx+C3YvQDA?=
 =?us-ascii?Q?A1vfMWoYG1S8vONSAgYokOQkUruusDSCPaf7c40gQRbkabWKQu3NQLpqNu7r?=
 =?us-ascii?Q?vAgkET46HVTgefHPYGQ6uIOuuZVtXLH+s51jqCfsbLyJd5/RFgj4jnagesrG?=
 =?us-ascii?Q?5/kowZRxy1QI3GGthg8QoVeExOypJn45FTvIHhaIq85GfjRTCAVxeXCLF8SX?=
 =?us-ascii?Q?GG4qwBYkNNVimcDt64ZCtDDRizuFR47jkFEC3ByJq8iClR060md/90gCReh9?=
 =?us-ascii?Q?ufWU1MnpChNtYJWJWe2CCbrxouutSc0BD6OMz8NK7HjblBF7VCwVcn/gXAtq?=
 =?us-ascii?Q?7LFdV5RL8kkfx4SI8VYKi9UxqYafI0lRolIrrQTPrY/Pn1mgWY+AIZdZp5Yr?=
 =?us-ascii?Q?jMiLW0e3kUR/idhbCOxZeKPsFxBMVAft6TzBTO1SQWJSGG6inmimHbha8D7b?=
 =?us-ascii?Q?yZHMk4gH5QJg5NORTO+ugAT9V9IakhxYrrMrwd8jIO4I5qj9OMHpQ+mJR6FW?=
 =?us-ascii?Q?Of4Ny6YeBEx35VHTzfHq1Pk4RfTjweKWG6oKEtfwfzXFOkZPhc2D0CnVXQsw?=
 =?us-ascii?Q?qag9uAJ5Lxf6XcmqTG/TP+9zGyVbDDZ8MGwGFPexUjeM+bm0SKM8MdxMuxX5?=
 =?us-ascii?Q?MpZxWA/U/H5BiadoMODBhOOKUdenNGM+iR9z9KSs6BKOJMqgAxZfObE0dvkc?=
 =?us-ascii?Q?kpFQ8gZSvq8n/Tqprmi2m6avW/S5hI/SdrD/kpN2yEz7bXFbrdZpzh8H6yS4?=
 =?us-ascii?Q?qPaclfKlCZvISEVj/NT79dujDLiQpTvTaQnhOLn+aavQvs+OaS4ci7wVc135?=
 =?us-ascii?Q?OUU5J2RRwIu9tKMmoKSLx+UJrq/pWbuzEXdNctU91aGWYn2hOX40dwDTLkKw?=
 =?us-ascii?Q?fHjX8Pb4heP9thklptTQckROPxqoKCCDmmBU1Xn513LpFIjP8TaTF3iQtCoC?=
 =?us-ascii?Q?nNV4ecgKxX8SY8DJBY4WEtVRf+gJKanW4crDWaEv8mq28lA/Ao9L4vASA61j?=
 =?us-ascii?Q?ZOU+//mmMle8ivjf+9dz0kDoOzvF/ZJGeweiddAho2q6zqlY0kMe2gcyg+ue?=
 =?us-ascii?Q?04LL+tlkqokMszOvvDvD/zAXvEVy3SMqy8vfbvL/SUYB3xJz9tcbL1Jk3543?=
 =?us-ascii?Q?iXX38f5mHEC/owIn7A2h06aayKliU0ttOk57ceFtujUemXY9UW/xenDH+lGU?=
 =?us-ascii?Q?xRDMKACi2a4yRbCR6psho5cilJVafmMi4DPUJCS7yoWlGM14SBuSrZCMsfqr?=
 =?us-ascii?Q?LrDGM4dt6yKsPjP6GwCdS0xNRnlH0LWqdAVQ/ydCLTZ3Ad5BF7HEedFlMDHU?=
 =?us-ascii?Q?/8NyKW88rvnM1CkMZe6NelWF4dY44vOxwJn4Hic1htOqXHphfPxsRg5wxjaW?=
 =?us-ascii?Q?vuJOEo8jrtaWG7TZwagB5LS23MBn18DZCRdWF6r85NLiykTj+/xY97jj4aHW?=
 =?us-ascii?Q?3WrwHKlOaOCPN9c=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bc7310b0-10f9-4ab9-a748-08da1de04d2d
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2022 06:30:43.4188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR09MB3672
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164392

which has the same info as the in-file header used in before

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
v2:
- strip control codes at the end of the copying file

 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncur=
ses/ncurses.inc
index a0ecd8a80b..7a7c7dd227 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY =3D "The New Curses library"
 DESCRIPTION =3D "SVr4 and XSI-Curses compatible curses library and terminf=
o tools including tic, infocmp, captoinfo. Supports color, multiple highlig=
hts, forms-drawing characters, and automatic recognition of keypad and func=
tion-key sequences. Extensions include resizable windows and mouse support =
on both xterm and Linux console using the gpm library."
 HOMEPAGE =3D "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://ncurses/base/version.c;beginline=3D1;endline=
=3D27;md5=3D5526f2f3a29edc95538b368a4771edda"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9529289636145d1bf093c96af067695=
a;endline=3D27"
 SECTION =3D "libs"
 DEPENDS =3D "ncurses-native"
 DEPENDS:class-native =3D ""
--=20
2.25.1


