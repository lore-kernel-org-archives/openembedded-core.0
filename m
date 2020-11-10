Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.103])
 by mx.groups.io with SMTP id smtpd.web10.32742.1605036046895224837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 11:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=u4ti6UQ9;
 spf=pass (domain: outlook.com, ip: 40.92.90.103, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jrpFdGEjY5xEW/bYRsiGcSZXJe2v6EVj5CoselokvHmAbNITEFjnL9sHaV5VG1tr39lydVln2YUL2Yrkgg3iytCCaEFJqtPjlNgfQ7s+af25Xutnruqyh5AAbZr9V0LO6T7F7hLCMHVnZI5d7sAwon2MLpRFCphdGiWIJfcPMVYhsycecN3dtLbdj1Ek9jtZdMQZ/Paa+AB4bEh6KPTwr6N/pKcNNlIg6che4DR8pJT0j+X3PeG8Hxjp7w8cWfLGa2sG8t4Ti+FOpuTTFMSKqyiBQxxQog5chwN3+RX3ufrYQiJNxmUkjhsAXfXw77dlbYHaTD8vHYBFukanYelbEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHBUO8dWL6aMeQGIlVR6abhuQSSDxfaA19+4VRx7dCY=;
 b=GL6f+Dn931VRvYSqIekVQFot//hgm0wB/GOxSUwHpGavRI5MgmwTiL+oXqqRRXwHmFUFDNv8CkTsJIe5t/w8WItzeS58QLo+VpIBar9583pYrEj53ovFFOzCdL8dRWZapZodQDTMoXv3b/A+5EgM9YWf3kb7+Vffvrq15up/+piifTkuSvPS9AsTsOSSLRK1Y6juL6SoLeoYhPHzYNLeS/Ia2cYTWA2Q2qhtU3Y60BpSRb7VUtoovhf2+Pl/BgW+JytJ+rSOGVKoXqcI6KkHByleYDw86Ja5aO0aJVCKRAV+IRjqvzGGcCr6r6ngC5SkC/JaDB6HEm+KLGWg8BUfYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MHBUO8dWL6aMeQGIlVR6abhuQSSDxfaA19+4VRx7dCY=;
 b=u4ti6UQ9T3Mplao5+T6f5+OMLn/ps8/qg2/nAuaLJh7VOI4vLkbyerO1QXWVqTsTRO4POCn+kzz7TqOkGkqmJgaAnBHNtZnuvk1VnzyelyzBmKaerSS0rCxwDm/eFJA013vcLUcrQrYjRaGZSpWs0fTAAFDlt/z+7xZc6aH9ZE1tnKJuSyEVWvUw/zZoNCm3jVHaxpsrnPcsdS6NZAQL4Ey634wgch6efjGD6JazOW+RXq7R7C7Q8f4D+EtPXVl6IDGtxDmi3hpUeTdEv4GIX8nNOs12ucHSyJLyrfEJQXqNct9qSjDfuziZKxIR+eEqezq22tfFm1uGNqw4bUspVg==
Received: from AM6EUR05FT030.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::42) by
 AM6EUR05HT085.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::341)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.17; Tue, 10 Nov
 2020 19:20:44 +0000
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:fc11::52) by AM6EUR05FT030.mail.protection.outlook.com
 (2a01:111:e400:fc11::61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.17 via Frontend
 Transport; Tue, 10 Nov 2020 19:20:44 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:52AE21EC1C632FF6504CBC347D897FD51EA85FD78F4DC81A6925C0D83D2620BB;UpperCasedChecksum:E3E4FA6E532274B6C7B0C7D7808F1FFE24B2CF7740332987F31B5C2DA088C86F;SizeAsReceived:7341;Count:45
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::10f9:f756:6d75:96c3]) by VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::10f9:f756:6d75:96c3%6]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 19:20:44 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 1/3] oeqa/core/context: expose results as variable
Date: Tue, 10 Nov 2020 20:20:14 +0100
Message-ID: <VI1PR01MB6462599E65E1F7DB274D3491A8E90@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.25.1
X-TMN: [TFgqGP9t1g4GY46VR6caCfkh+vFM5nm2]
X-ClientProxiedBy: AM0PR04CA0083.eurprd04.prod.outlook.com
 (2603:10a6:208:be::24) To VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:154::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20201110192016.2458528-1-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.92.139) by AM0PR04CA0083.eurprd04.prod.outlook.com (2603:10a6:208:be::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 19:20:43 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 45
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 568f9511-49bd-45b3-60fd-08d885adb822
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj3YwmJACMyfymIZI54ViH9OlUGlApSPm62km08jdyJ2LPqm5YaNtxBl+0IKvUs7wqmkZFffez8syg96bPvpicViFt0cFZKInxtEGAEZJ3EqbeCQIeE/dxm2cw4QyNAIR0OUAARuYMgeaBOwku+zSX1HfyUD/iVAp6xlJPl+k3xgInKgwLjAi5pdXGQpoKphkxLoqo+3JxwGQPuP/xb5s72EWH+CvT7piijXdNRr7t89Bss+JmOtgTFm5z80OuZpT31IzjJ1I4ySMn0hVDYfI5Vc7ysehEZzl1XmdwRnv1trkqOx23Jm0pFMCtY4lo2vx645UW+GkngGra3dg35Rs25a/nuCMD3+xGT0SWyPg9ITQ5c5TaXm46NxYIyyMeLl01tZsVLdOacZngjqOQADqsXugr/s7NTmoqo8ZYUDcM7v57XqEiaUYq1dBcNo1PzXlbjVjbhnedwzcsasqR0Q+MIE5az9VZe+T+eyHA/aq4Aev2fo6qSjGnbZ8mne0QuZeB5/snzy39+z1a7GWddwtTBqTyv54kPLCpMc6MXvlxZ3Epc181tHcOa9YZkiK6MWFBYbUc7Qdo3O0HltTv+PZI7Vq769o++8p2x34TBolvlqJXJEIo369Bh22BEIAqoF2tw4HEOIiEDVmEs+WCJJlAl5eT0SXe/N7iQ28sYatQkhxKlqbvHNtTpOQbG2en+YAZRmZtEB8R9shw==
X-MS-TrafficTypeDiagnostic: AM6EUR05HT085:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UAdCbazr729ukQjLxce3VfrAMqJILgrB8iryjdmN9tKUybDct/bXr6BYCnN15aryYyNC0gLexGHFW3EN9zuNujoUvCsfw4OMN7SHOt1iMI9Wm56KmJ1E7YbsoUAmW+r25QD8fsaYs1ayiXRXpkQdUhrqUU+SfSiiccNJ2USDvZwX9soLYgTvC9kPn+XqwVDcigqQOqhgG1uPiloR3uJTbw==
X-MS-Exchange-AntiSpam-MessageData: 
	jqdiywNjhhBAYoJwq1vR+KFgj2MJ/NVx8bsGzKshwwUSC3uVXIariOdbKrOssf6UW3IgGiPcAVGf8765m35/YfJHsHhYhDO1ahWUgm6y3ofkpwX67a2FW3BWqgnVZgj/BA+m1ZCHVICkFANwIfjRWw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 568f9511-49bd-45b3-60fd-08d885adb822
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 19:20:44.4673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM6EUR05FT030.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT085
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

register an unittest handler for testresults and expose it as
variable result.
With this even partial results from an interrupted test suite run
can be made available

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/lib/oeqa/core/context.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 7d3fa3b84a..84b43a93e1 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -31,6 +31,9 @@ class OETestContext(object):
         self._registry =3D {}
         self._registry['cases'] =3D collections.OrderedDict()
=20
+        self.results =3D unittest.TestResult()
+        unittest.registerResult(self.results)
+
     def _read_modules_from_manifest(self, manifest):
         if not os.path.exists(manifest):
             raise OEQAMissingManifest("Manifest does not exist on %s" % ma=
nifest)
--=20
2.25.1

