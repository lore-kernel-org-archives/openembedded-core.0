Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.20])
 by mx.groups.io with SMTP id smtpd.web12.32585.1605036048241395537
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 11:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=JdPd6IvL;
 spf=pass (domain: outlook.com, ip: 40.92.91.20, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=maQI7zJl+Gf4I05uq8wXx9gbPmEi4KynI4F1Vf6Pf4ktk3KvZI0XiM6/p5aiPqUzIQdBGbWjbx1LaDdJ8yAqX6L14Ihd6g2DZbZx+Q5OAl0aD4c+Vs/WWlRvjH3d7CrntIHd0k/WMII4niaI+bcXaG1uviwxrL2ulrEQtAh84HZSJmgU2L6YL5zt0/lf1RDcd0OxSwngmq77mYSrhruWuOJRqvKI6i8CqEvoJx+JM22shtlGD9GGcs6wq2H+QExSRpU/VnlbNn8UExQYWtPrKzlMkBQ5M6hG07cMg2lXzE4RzkevwehEForR5cW/J8uIkM4EAVUL3l26uXxEaHulbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ze9H1DRZzi936lTXgxA4Jh4LWVVSV7dQMqNslMe2JPw=;
 b=MLMECrKLxGDQkV3UBVYYUqaSevYawp2YkiteTl2qZy2DqyJl0KVhkvqJxpAirlfJFdmFduWJYXiXh2AE8WnJP0KsyHlm6s4+g8o4vObvwEtSdZ/w+H4eyXwQJX8/T+USwdN0ELW0lL2gpEjY6s/u3/9m/3lGXKSyMJTX5CA2yFzG1X0l7wWJbcdaXfm9dnuzM1e1WIopAcFSYA4j5dYW2dIA0sA8N0maxJMzQoBQmkdtcFbjYVHrNTA9Q/5g7sGaTfvguB+QPXCwhcmTqUCXA7gqr/H/iwinOw2t4Lk55fa/YwBF7VN0VnRNcBoQaM2dL9iAK7EEUf5oAI7ByqQMFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ze9H1DRZzi936lTXgxA4Jh4LWVVSV7dQMqNslMe2JPw=;
 b=JdPd6IvLxOkS6iIvN7R8BtIBNSCKGdJS3jf4y21NE3Ah7mwPO9zMTklF7QfWS0oNbIoZ8kza498j9HNYFAxID43W1plmAzLlFZvPWH5RZUL4hDBh/4rFnrV5c1E/gmxkEdSSVIwhhgMoGJKkAI4ERl7ku3gKlkhWcdxp/6/1P0yL3Nr+PCr4OYTC4IskeX+VjCyg186x/BZHTsGOP/t+qNyVDHE5AKac1OKulDQBjLpvDT+5FR0xIksAlGPRjnfi3Py5QKJTYkyudnS2wr7abwSgg+SbywGvGOAUZBtPgMMYYIdvVwFpTTCXG7xVg6cOc4NadxILgMhvkUWVCuKt3g==
Received: from AM6EUR05FT030.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc11::46) by
 AM6EUR05HT231.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc11::338)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.17; Tue, 10 Nov
 2020 19:20:46 +0000
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2a01:111:e400:fc11::52) by AM6EUR05FT030.mail.protection.outlook.com
 (2a01:111:e400:fc11::61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.17 via Frontend
 Transport; Tue, 10 Nov 2020 19:20:46 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:1AC4E842771DB33436524811B47819F51FD516A04E82F98743D9B69A6325BBDA;UpperCasedChecksum:244A6FC2058FF5F1F1741EAF0AE9A1FC55F47CEA79B586DE28D899F84A754388;SizeAsReceived:7466;Count:47
Received: from VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::10f9:f756:6d75:96c3]) by VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 ([fe80::10f9:f756:6d75:96c3%6]) with mapi id 15.20.3541.025; Tue, 10 Nov 2020
 19:20:46 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 3/3] testimage: print results for interrupted runs
Date: Tue, 10 Nov 2020 20:20:16 +0100
Message-ID: <VI1PR01MB6462AF64876A57F6CA563F92A8E90@VI1PR01MB6462.eurprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201110192016.2458528-1-kweihmann@outlook.com>
References: <20201110192016.2458528-1-kweihmann@outlook.com>
X-TMN: [08I7nQ2WbZxJB8Vx0IIuN7+/sfjvX8QR]
X-ClientProxiedBy: AM0PR04CA0083.eurprd04.prod.outlook.com
 (2603:10a6:208:be::24) To VI1PR01MB6462.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:154::12)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20201110192016.2458528-3-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.92.139) by AM0PR04CA0083.eurprd04.prod.outlook.com (2603:10a6:208:be::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.21 via Frontend Transport; Tue, 10 Nov 2020 19:20:45 +0000
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 47
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: eb88cc11-5cda-41c8-548a-08d885adb92b
X-MS-Exchange-SLBlob-MailProps: 
	NS9Gj58uCj3YwmJACMyfymIZI54ViH9OLTRGgoVJk1bACcIhFpaYrt0jhfXBUJogSJwTqEEtaqRMnc+kthwiLJFGmyrfYXHLgUwFB4DVOSYrIBuYP60uQ8WEev1xMsAcX296agMvG652QOQ2nYia/pKMCl+dDw54Qw4qFLx+HE5PqhLkaL9WCBWTOt2SNUFVvUjwi74sjaGEsBuJf76TLyajmBOWk4iVGZCsvpGvmjFwmt+tWvSgO2IA/XJaE0ehJjditwN53fqKSTyAS7UHB7gtW3Wdxrgcj4PSD2oMSb1izZb3fJ0ohendVZHSMzszSUxKSnqrFNwhsqoHTxLxd7Qco4DeYwev9cVPEKYcmko5rawWegvMHZrmIbx/luzDjv4r/Ot/J0jiu99OZrfDD23J1LbsbGKG6KzyoNSKzBud5CBW/bwluEJ6UUKwB2Z35jTRzHK3c0NTd7L53y79z/7sea1uOvW6mGhhpwp5V0sueAnt6tMRonmuCd2zM1Pf9vlAWaKR8U1ZYtEk3qx28IE8WajQ3hf4F27JatAKKvKEag0wU/lRnmpz1OxHi1EII5+6zXy0c0vM6JUYb6IFpU444eP1V7d9e6OI2RQHdKDq6pWrg6fU0wePjG12CwxkziYt7oQxyV9DaJD5NrBDoed2W/qZd5JvM5emR9Lpg7HEt3xekvDn1jHeJPIkQPns5++XHiqik15bAku8iHtYsQ==
X-MS-TrafficTypeDiagnostic: AM6EUR05HT231:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Lopr+gcuvhN+Ssm/Yus7y3CazWYiu/3/SxTfDKoIz9CXiUV96AE6fZjbkebUC7JgO0qmdfbkX7oB5YtYm9Ytxy6+iYwVrRuK6FP0c6qJJLwQlg9XeKLr3kIZ+p7S/L//ATDJIawr88IsaDtbZqHOdpFmdnZFPOeCIsYzd5NipKc4tbrWk8neHy7KP1J5LYFDABnUwtIXKQEqYCPjVV0d0g==
X-MS-Exchange-AntiSpam-MessageData: 
	EIZOmGRNq/rSmfbVXWg1feRpuadUrmeVve/GfMoWzHqleKBitImdrAnRD1fw+ZjLkzLm/4dKS0nlR6v+DLvF0YRAZxMOHeFZD5n7zuEiHr/Dlhxa2DP7sjAvZuldrlKO1Rl2cnt0o24FdxnY18jq3g==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb88cc11-5cda-41c8-548a-08d885adb92b
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2020 19:20:45.9737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	AM6EUR05FT030.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6EUR05HT231
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

When a run is ended by overall timeout, print the already executed
testcases, to provide some hints which testcase might made the
test suite reach global timeout.
Nonetheless make the testrun exit with an error

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/classes/testimage.bbclass | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclas=
s
index e3feef02f8..78da4b09bd 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -367,6 +367,7 @@ def testimage_main(d):
     package_extraction(d, tc.suites)
=20
     results =3D None
+    complete =3D False
     orig_sigterm_handler =3D signal.signal(signal.SIGTERM, sigterm_excepti=
on)
     try:
         # We need to check if runqemu ends unexpectedly
@@ -378,6 +379,7 @@ def testimage_main(d):
         except ValueError:
             pass
         results =3D tc.runTests()
+        complete =3D True
     except (KeyboardInterrupt, BlockingIOError) as err:
         if isinstance(err, KeyboardInterrupt):
             bb.error('testimage interrupted, shutting down...')
@@ -385,20 +387,21 @@ def testimage_main(d):
             bb.error('runqemu failed, shutting down...')
         if results:
             results.stop()
-            results =3D None
+        results =3D tc.results
     finally:
         signal.signal(signal.SIGTERM, orig_sigterm_handler)
         tc.target.stop()
=20
     # Show results (if we have them)
-    if not results:
+    if results:
+        configuration =3D get_testimage_configuration(d, 'runtime', machin=
e)
+        results.logDetails(get_testimage_json_result_dir(d),
+                        configuration,
+                        get_testimage_result_id(configuration),
+                        dump_streams=3Dd.getVar('TESTREPORT_FULLLOGS'))
+        results.logSummary(pn)
+    if not results or not complete:
         bb.fatal('%s - FAILED - tests were interrupted during execution' %=
 pn, forcelog=3DTrue)
-    configuration =3D get_testimage_configuration(d, 'runtime', machine)
-    results.logDetails(get_testimage_json_result_dir(d),
-                       configuration,
-                       get_testimage_result_id(configuration),
-                       dump_streams=3Dd.getVar('TESTREPORT_FULLLOGS'))
-    results.logSummary(pn)
     if not results.wasSuccessful():
         bb.fatal('%s - FAILED - check the task log and the ssh log' % pn, =
forcelog=3DTrue)
=20
--=20
2.25.1

