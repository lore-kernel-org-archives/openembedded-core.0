Return-Path: <niko.mauno@vaisala.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0046.outbound.protection.outlook.com [104.47.2.46])
	by mail.openembedded.org (Postfix) with ESMTP id 2454A747FD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 May 2018 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kQebd6v02CuaTb/YikU86hKaSsDCAzB8FBJyOofUqGc=;
	b=m4qiDzzlJOfQegDw00odGaDdFvwM5k++9ai6GR9DLFwTeu/nHYX9A85rS5layHzIl8WccRwfPnbHJ2Zr5BWXQ+rG0oTusi7uE68RrjFfrkxHh4bDx37aUrioLUgDhSL39FH39wpXCzyoQ58aGlM8X5Chonybtb/EZqPhT+FQy8I=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=niko.mauno@vaisala.com; 
Received: from hel-eptripper.corp.vaisala.com (193.143.230.131) by
	VI1PR06MB1887.eurprd06.prod.outlook.com (2a01:111:e400:c544::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Fri, 25 May 2018 12:37:58 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 May 2018 12:37:39 +0000
Message-Id: <20180525123739.73219-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: AM6PR0402CA0015.eurprd04.prod.outlook.com
	(2603:10a6:209::28) To VI1PR06MB1887.eurprd06.prod.outlook.com
	(2a01:111:e400:c544::21)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR06MB1887; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1887;
	3:AOHwso3eAlL7SyRJFr2hQslCapEgwDtwupH5CdfpTPUVpQnItRQiG5We3lhQCj1xKstRR7fUF5tM4vY/MW8XfmKorDBhOZ68RpbuuWHIvQABmtgBtlDM6/GRMiaeG6E02VfjEalO8zwedUgxZj3F7tS57oWWTylftlDoBmalybziZWSR5rskL5h5MQTALEtrXN6Pf5jLUKodmWbJi+vfr1zqG1/qW3OY+JZmnAGYQsOP9d3AKnITgdh5Uf8Eeaz/;
	25:UiWkxhRRqrx8ZvBXT2nz9xi9MLaEY1BQhv4WO/MBVbHUxDMxrO1Jvt4FCAuXUyepZZ/srTDT5L9Wk7fuOqevfnXMtHBH3/h73RQ9nErtLHUURVeN7ePvdl7RbvHtPk0PUcddNrKqiNuCno9MhoXD2cEa8zHNUTTo/4wVFrdheZ50Sq0VlVlxCYIBDNyU5UpiY7dJBrgRBnmCKNIY/ntN/OlAfv0QS6VeCF49kINQUoE+92WYTIwkjZHaDisF2+XnsGdkvLtFvcKkeGxaWoIk4nPImqx8YLsJAGZTn6JmvyOkxWXfdjMuEWJTiDpodWyWWwEoCfEpg3kNWzLcg29R2w==;
	31:QcH+vuvuCrXluujXdWnb/yTDEluLPoIbnheNpr3MpWjMiH110R6mZeegtP2mevyFlSr+CVmPxs5pSxDHaSHy4w8MxagfSd1fksu26qlJLYGV5O8vSo8EErktuAr/VfcytgM0sSr24CkUwWMg4R1F1+ODBUImpI+/P2KobBckpb8uN9gSsOsr+H7ZWIUYpZPcB5fvMKZa4vzHPDXYVAjAcYyhCpK+PaczCcIKhUYkHgk=
X-MS-TrafficTypeDiagnostic: VI1PR06MB1887:
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1887;
	20:O6antDXcUlMUgElvwwUINwu98ohLNz6F0fFq/QI+GlFWIyvG78CKNJFNjEb3aTz1v/c/isLCtofxQM7lRzaTyzOBLcelCI/zWO8nPutFCsLF09p/7wevsnBdkw0xUDQPtyoYOKILuqSPTnCLuUz1g25RjpiQDrzup6fHlME2A+A=;
	4:mbUQiAGkT/wOD75KPKqGyQOcKlXULe9IPH/Ie9gOAk11WeiwHjE8IxtnsqkFrxOt1eLKcS1sTEqZluIU3qv5KJ3A/1knTKa6qCeJAsOUXU+19rRIgOflSbAomOLaBB/oNQwwK3vKurfcmbn+ufkth2DUkEyZL0HPoZRbyd7fJ60T1qlsxfJ4R3jjUD/UG4zyxRj5yDuiGORc8ZAV143kngrU2wbNNdm2XNiGS3sWKVKDIXaACcBGccN+H03H9O9+0uVuQgXKZ5jgf9m1+TdZAg==
X-Microsoft-Antispam-PRVS: <VI1PR06MB1887757DE89FAA2CD9965E6281690@VI1PR06MB1887.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231254)(944501410)(52105095)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:VI1PR06MB1887; BCL:0; PCL:0; RULEID:; SRVR:VI1PR06MB1887; 
X-Forefront-PRVS: 06833C6A67
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(396003)(39850400004)(376002)(366004)(39380400002)(346002)(189003)(199004)(50226002)(7736002)(36756003)(16586007)(8676002)(97736004)(316002)(25786009)(386003)(6916009)(47776003)(59450400001)(5660300001)(4326008)(186003)(305945005)(16526019)(51416003)(52116002)(66066001)(7696005)(26005)(1857600001)(86362001)(6666003)(956004)(2616005)(486006)(476003)(44832011)(48376002)(50466002)(3846002)(2351001)(6116002)(1076002)(2361001)(106356001)(105586002)(6486002)(2906002)(107886003)(81156014)(81166006)(68736007)(53936002)(478600001)(8936002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR06MB1887;
	H:hel-eptripper.corp.vaisala.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR06MB1887;
	23:rC+c5V9yrczJeEAFOWwBwF2W3BXDAIXreVDJ0W4VM?=
	=?us-ascii?Q?zeJYoNnAwPiaFv2G7twkIymwLnSVAkfOkjitOkrQhOqwtmgXFfkwy2xYHdpW?=
	=?us-ascii?Q?tzsPPPJhlE6YV+mu42yJYqzAiJato5HpvNLWTnCGFVsDPACrzAe9wsKldnrW?=
	=?us-ascii?Q?3eUzsEnO1qGbPSbDBQQe0o4iz90OOZuRXeFLdRlXmWgc4zTnt5uUSBuGkbsK?=
	=?us-ascii?Q?n6j+BT1MVrw1ELEBjAuHAHIBxr8cXGJq/DQOmjk9Ch7XOYJ3WV1vKcSYCtF7?=
	=?us-ascii?Q?MHWY2bUxAEQgLqTRMu5BZdc9DAKm8LvfYKy2oYtUP5wIhynMaLUA5cSHczMQ?=
	=?us-ascii?Q?trEJjp7YceslwDgLX6TPOwtzwc/1tUzkLxE6Cxo/3FUWSXN3DnZ0bPigYaim?=
	=?us-ascii?Q?J59kyMsfI0NecFop+nftCck6knoOUsg3kFvgflWAMxd7tFVWDRratKIOJe0i?=
	=?us-ascii?Q?FMH1GvDc2pCrg4OeWxP2KNGkcPRXG/hYNIIDaT/43SnTBzhYLmz1QrCKR2V3?=
	=?us-ascii?Q?45VAwTrdChFFn/h6HDuTRPhMfNR/AYUS2dIronSvlTn8mv9mTzTbjv1USCmd?=
	=?us-ascii?Q?eUac0mnZdugvQsVauD6cwvmuAXlAdG/vDtvsOXwjpfZd4IWK05e9ZyLQCMlw?=
	=?us-ascii?Q?lrUU2+H29eH0Qt58aZYwMvMjqTU8/NMkadzxvvOiVaueT3zoLu3vlR1Aslsx?=
	=?us-ascii?Q?fATP7XdgEgb0wpLLanIbu1hcX+D9e18P2YvA5m1VYz7VLV3NahaeR51ISjB6?=
	=?us-ascii?Q?fOvkZynZrRsGaPjdubScdFnqoki9cCWiBVWbbMnCRmCe4eY//qAnIXUL1wLf?=
	=?us-ascii?Q?zYMzAR9rOOnskZvc6tHB60bK0Uyo9ucV6tDN8psfM1uF6HGAwgBkkyxxN3tT?=
	=?us-ascii?Q?0WC8j8epDKOoMCHuNYNVn+lbPVssR/yD67mDYCC1yBqzhN6emFCUHwHeO5eR?=
	=?us-ascii?Q?jmT4hPhXukpIG5FjZqcVp6Wtwt9KxBZ5QEhDlGz15PiSdBEI+jWX78VfCf43?=
	=?us-ascii?Q?tBHLc67hOgMAlXqWO0ItEvXnscqwMm3gPJNksLwKqaJ6mXfNAmIg3aZdy35D?=
	=?us-ascii?Q?2vSDDwSY6Nkyz/Q01AYPUPwl2h1NBZttQV3z++0W0CZYK78CmMwj5uYnp7Oy?=
	=?us-ascii?Q?4+5pEKTY3E3SCUDWNoQ9Ip4nZrxkzlQiFiKeur1tMVN/E6VdRkFLIVR77xpM?=
	=?us-ascii?Q?m91tjkpQ+n62+rKT1VQYW7qyyhf12GJvoKdKokFg516dv8OBdV9+y6/qG/gP?=
	=?us-ascii?Q?76iIy+hnLeOQq1OkJc=3D?=
X-Microsoft-Antispam-Message-Info: MqweUBFlJeC8aEAdh4Y4aAWA73M3g5EuUsEq3GA56qLuukYv0gxYS/J+nrBI0bU/SbPXwXDVa0Rt3RhEHHXka7OqrUXexT8NeNz0mribY2v68AMl97NQrW9CaRY129Y6y25yBxkmRs6SFAGfp/jUduz73bZ/vj4Ba/+Jo2/AHgnyZcba/1i5Q2Wk2rZWEmwI
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1887;
	6:52ajvX/DGvwxJJQSdiaRVt2Nq4CCYNRf+e/2KFbsQTOv0ZdR3+DnsupBysbQ8NDsVyoKMQzT0trT0woluWmyc4FJf4bRYTI+uazJnTvZty9GtXLm9ukdHnWXfSxsISoXaBCWbWaKcxyCIJB+wjhS1b5UxYS3+HapI8Spa+J0eofkRsgC0oIxK/SaJNQ5EFY/WBUj1s6UNn1H5DZ9ZPydVCV7esj8cF8ttf20QIUXsHl98q7/RQLVh/icCL785Dh0n0ry88ZS5gOBdmlNXblcGlVwCc0ea+Kv5DYfwLyM1zEcOw9gZ875nZuTPlILKozN5aXDLT5DAfhUeoAsrNn02Z3vWY2e0NRovnYth6ltmsk7fSeQYacJDK5k1kOk8xnzU4Yqhu5FMRhyis0Dz43HqKCg0bToB3mbjkjfvL2OgENGBXY4BpB5p9l19tJIEywQ6HdG6v70isBPxhYgbqCbYw==;
	5:eXwPdjazvSGqaCDEprdwk1trVvi5dWUUAxFjVUaLPKlS7gjMM1ivHOPyej8z+NbbVkjxjGwGzOGcDXg6cADhhsP/K8kkLtb6+dvK8/xvUq5AmQNN6zaGbHJQ5wrCu/3y+WMMQSYUP5mueHl+MvCJm13xqV0t/7hVr0fjkzbhcUo=;
	24:D3y9HZp0L45T9IcO1k+lLX93DXP0B4jPERIZDfoJexrW2cPOPd7IwRtrLN6NHHkhbOzsaLIBG/RxkRoTdzeLwS3xJCVCgG09dzSDUsIfGAU=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR06MB1887;
	7:wAgnmdnmU4T6bZNAfO7QKzln0qtF/e/h/PPDl68woQg0t3J1AeY+C21RC+q5IduHZoTcCPKHGeG0VuNyrhU3ZYf7TPf+9VgpOQdY6OErXiADy65k8GYpTMySVolByB0QHcH+K+lIwHBUPNrWD8EqE73jk7aqX0l/58/GGpAS+R8th/uOTrFHqDlfgkN0eP/nc1/lFiNYhGN428l6wsA3+Tthl9SCoBgRNp5JhZg5TDDsfZJSIQAsyyhvDAheSq9A
X-MS-Office365-Filtering-Correlation-Id: 22ebe97e-746e-4374-4400-08d5c23c58ab
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2018 12:37:58.2051 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ebe97e-746e-4374-4400-08d5c23c58ab
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB1887
Subject: [PATCH] cmake: Export SSH_AUTH_SOCK for cmake at configure
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
X-List-Received-Date: Fri, 25 May 2018 12:52:30 -0000
Content-Type: text/plain

Update cmake_do_configure() to export a set SSH_AUTH_SOCK variable
before calling cmake.

Otherwise, if cmake call during cmake_do_configure() resorts to
ExternalProject directive containing a GIT_REPOSITORY entry, and git
authentication scheme is based on SSH agent forwarding, it fails
followingly

  | Cloning into 'foo'...
  | Permission denied (publickey).
  | fatal: Could not read from remote repository.
  |
  | Please make sure you have the correct access rights
  | and the repository exists.
  |
  | ...
  |
  | CMake Error at .../tmp/foo-gitclone.cmake:66 (message):
  |   Failed to clone repository: 'ssh://...

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/classes/cmake.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index fcfd5dda4f..82d36be8ff 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -137,6 +137,11 @@ cmake_do_configure() {
 		oecmake_sitefile=
 	fi
 
+	# Allow cmake to perform eg. git clone in context where authentication relies on SSH agent forwarding
+	if [ "${SSH_AUTH_SOCK}" ] ; then
+		export SSH_AUTH_SOCK=${SSH_AUTH_SOCK}
+	fi
+
 	cmake \
 	  ${OECMAKE_GENERATOR_ARGS} \
 	  $oecmake_sitefile \
-- 
2.11.0


