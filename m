Return-Path: <urs.fassler@bbv.ch>
X-Greylist: delayed 3601 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Sep 2018 09:15:35 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0067.outbound.protection.outlook.com [104.47.2.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1521B79493
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2018 09:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bbvSoftwareServices.onmicrosoft.com; s=selector1-bbv-ch;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/Es9XTLfMWVqIQuibVi5M+vO5vR8Og2tziZr9e1SkPg=;
	b=l+vBdwveo3iflPx8/RGo7ZlssnNULOcoqYuGs9vmPM8EgIQcyUNDPPbima8SD1pz+Fk4VYPFtW9/nyJJgmem5oRD6ExEdAeYIpBOg4VzodLqgL7x4n/RYzFLVX8KtgBgS/ftoMcaaPIgaF8qGCOdFiMT21AqlyklqtrzKHlzODs=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=urs.fassler@bbv.ch; 
Received: from localhost.localdomain (85.3.213.111) by
	VI1PR03MB3837.eurprd03.prod.outlook.com (2603:10a6:803:68::21) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1143.18; Wed, 19 Sep 2018 06:41:52 +0000
From: =?UTF-8?q?Urs=20F=C3=A4ssler?= <urs.fassler@bbv.ch>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Sep 2018 08:41:35 +0200
Message-Id: <20180919064135.30249-1-urs.fassler@bbv.ch>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-Originating-IP: [85.3.213.111]
X-ClientProxiedBy: DB6PR02CA0009.eurprd02.prod.outlook.com
	(2603:10a6:6:15::22) To VI1PR03MB3837.eurprd03.prod.outlook.com
	(2603:10a6:803:68::21)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 38314123-5733-4a15-ece4-08d61dfafc2a
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989299)(4534165)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR03MB3837; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR03MB3837;
	3:nhMtBEUv2cXAoZYED6ibM4ZU5OMRoLGboQyx0vdgyGiTk65n6AmNUzz7/893cyIa81cMsytGKicK45af97AkDZILNB5VjmjC3D2nPZu9ZElZL993C5WsK9mrammfhOlg+yvfq9kQZscsBdjevJTvmU9sLH8/zilK2yM6PAx+4QBacvwx2SchXsxLuEfyFz7UjBHv7jEgQIxCt2Rv+wlCcWAJmDHIv7xOAjXjB10b0k2LJLIU2G5f/sYz5iM1Ghdj;
	25:3zKqZ25JN2b8jkAdKE/0F/Ri1cyNqtVCSa34noq1sG2y0kOsQ/TVHBDNXmYolqb8bw/8RqEY7SjvIb+OVa3RtAbns1d2Z7cZgIXNswm3/IAOvoo4HMekuwMLJGxQqMeqSBv8eW+zCXmVZuSAXDBrTGeurlxLoa3o4VY4lJxkkiGpVQgcUByUCTf9tY3v8E43pxjuwFWBGsuR1jFI1qC3fM6S0vMHzNbUDw5eeLhSB/KJx7fbyoWckEgYaxyafzltZevOL6Rn118fxGVyHAhTVQfL47D+LijZcRVkP8QmOuv62YLV3SVDFeXkgTeHSkrLhA+EhjrvgWec0gGK4abF4Q==;
	31:k5kDosg4DQBXdtoYgNkDKW6xNSDPnNFS5ztG5YpJpW0G+iuOoIOelZUhXq/RLQWcB8hOuqpLvtDbonWKms9hpISXv1uF6rGxciXbkrbLjiz2WQj5PClyH15yR+l1lNP55+O2f0rsrS9XGZ1Y5QI8VyzgEmicZAmm103EbXdCSPNNvcWXZ5lxDMmJ/7M2e7PcBXfNr+RvUDWythXoLcP/zatLuSiI25ZR3xGAn4wm+ek=
X-MS-TrafficTypeDiagnostic: VI1PR03MB3837:
X-Microsoft-Antispam-PRVS: <VI1PR03MB3837C65096873BA5944ABD478F1C0@VI1PR03MB3837.eurprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(181554191321653)(126837547833334)(33711482430040); 
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(93006095)(93001095)(3231355)(944501410)(52105095)(149027)(150027)(6041310)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123558120)(20161123564045)(201708071742011)(7699050);
	SRVR:VI1PR03MB3837; BCL:0; PCL:0; RULEID:; SRVR:VI1PR03MB3837; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR03MB3837;
	4:UEvzd8dR2L7vkHetn6UL4KMtyFpjsBQTxz783AGL9WRjagvFPKaSAYAk7jdH/acPe8lRugSBcB/S91+wd49tOp3lyZUYsxCisev2cN/L+ujhB3OxuJ0BPgU5NnFr67roZyZvHgxXE1vQ5pHqEMMec0rru3p2wvIeGhOeiJVK+q1Hvi9wRGm5bKZzDzwtmQQJrppSO7njVF30oe3DMu5RwvfT8U5tZWELq4rLHYXi4YckU8JsTqnAXdBCVfJL0830EblJdSuFkuo1a/lsq9q+86K11Zwcah38DEN3M5JSkkXoTzr8TYN6S9ZqBWq5kqk9zQtWjt3AmBtIxQDz2TuNXDpUou3X60Gh2Nwvb+PVDpn1GCX707iFKiq3Z9vIZXd8
X-Forefront-PRVS: 0800C0C167
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(6069001)(136003)(346002)(376002)(366004)(396003)(39840400004)(189003)(199004)(50466002)(386003)(316002)(36756003)(54906003)(305945005)(86362001)(7736002)(68736007)(50226002)(5660300001)(33896004)(81166006)(81156014)(6666003)(6486002)(8676002)(4326008)(476003)(486006)(956004)(2616005)(52116002)(23676004)(8936002)(6916009)(14444005)(66066001)(478600001)(1076002)(6506007)(6116002)(74482002)(47776003)(3846002)(53936002)(6512007)(106356001)(2351001)(105586002)(2906002)(1857600001)(25786009)(2361001)(97736004)(16526019)(2870700001)(26005)(186003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR03MB3837;
	H:localhost.localdomain; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: bbv.ch does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtWSTFQUjAzTUIzODM3OzIzOkdZbC9TNXhlWC9sU01ENDlZcUhlLzBkWjJk?=
	=?utf-8?B?RnExNWt1ZFI0VFVzd2ltMGlmOVF5VTAyT0ZwUUNPelhwTkc1Q2VjTVRTODND?=
	=?utf-8?B?NVdSS2tLbGxwM3Q2eFRzQmVJVjhxdkZLTW5WQjhMU1lBWWJPZjl0dmplNzRj?=
	=?utf-8?B?bDZzSTh2S2UweDVzUTRjUXRqY1ZnZ3RLZmF1a3FPV1kxZTVJQ1VGV1IwKzFM?=
	=?utf-8?B?WW5uYlZsc1VWeXdtWU9yZ2ZTdWR5YlZ0WDE5ajlweWhGZUg2ckNocHJhMXlJ?=
	=?utf-8?B?SGdKWjI4ZVJpeFJLSWF2NmRUSDR3dXZMSDRoTytOY0QzVGJ2ZXlNUkFiTDdl?=
	=?utf-8?B?OTZjcTdZRWZsWmdaMmtyb3JkQzJRbFR1U3F6U2JhWmlqc0F1OWpyTm1vYmpt?=
	=?utf-8?B?UW5GTUlPdDZ2bDNVZzBKaC84NWlvYmZYbDZpRnd5TnhrdFkvZGRzS1RrUUVM?=
	=?utf-8?B?Y2hzYU1YR0JwTkpTdlpmdUxnSTB1QWIwelJnQmhUcUZRODFaaGJFcHV6d0pv?=
	=?utf-8?B?UC9aZGNKT09MQWgvRUgyQmk1MVZXMkM5bmhGa2s5KzJPcjlZNFgwbVR3WWw0?=
	=?utf-8?B?SFdWVWtnTXVzZUhjMnZJd04zMWNwRXh2OWp1bFhJeFRsMWQ0WkI3eml6aWhG?=
	=?utf-8?B?K25PVHViOVpFNHJJYUd6S25JOUxKcG1Dd0wwdUw2QlVRbytnQ1BLcWxKRk1Z?=
	=?utf-8?B?aVp2Tm92RzcvK3hHbExCOFlSM1pIOWZrTlh2d1lRSXpsY1BDV0hKTlFENXZM?=
	=?utf-8?B?TGJXMCtIOUpVZWhXbE1kdUhpQXY5R29EMENUWmJDZzg2WXlpeVU5WndtVFlk?=
	=?utf-8?B?bTZqb2g5UFFOOWpNYWlwY0k4eGVmR2RLbFBWdE9rUmJ0ajdJS09jcTdzZUVj?=
	=?utf-8?B?dlpoSXJPVHM0Zm8rdlNoTE5zSDlZOUs2dE9hVTZ3cXh4dDloZDhWSjl4L0Vm?=
	=?utf-8?B?dnFySHBYekEyRGZWODB3R2RxYkFmRUdQOWZaSnBVY2FxLytXUUNSRFNBSUxC?=
	=?utf-8?B?RWMzMDRoZnl5RzhsSHNSMHQyUnEzeGtJU0FnYWJjY25KeDdNdFFrYVNPaWRu?=
	=?utf-8?B?Vkk3SVJvKy8wdXhmS3FlUTlLOTVhbmc2ZWx0QVovTWtaVkROOTdZbG92UFo3?=
	=?utf-8?B?TFlicXJQVkgwWG5nRjU1NFcxeTdZb005QTNBV0RGREZnUnBNUjJQWlU2dVMz?=
	=?utf-8?B?bU5OekdMeEkxdlJQU1RYMWp4R09RdHU1b1NNQU51SU9vVkF6ZG5TZk9rcjB1?=
	=?utf-8?B?Z1NFbWFkM3Z4WXZacWFXUG93U3hkUW9mRjdqUWI0YmhJMEdKVnhNRTFqbFI4?=
	=?utf-8?B?UEd5SW0xY3pjYm02ZkNiTjByYnA5WmhwRFRrOTlUSDdEMkpTVS93Y091cXEw?=
	=?utf-8?B?WkpFNTdnbUtZMnNCeTF3NUZ3YitZRmtyZ3Bxd2R1cStvaCt6WDhYeitYSFlH?=
	=?utf-8?B?dXQyMW5OOHZFdXVVMjhXYy9FdjM1bjF4bDBRQnR4aklwVE9RblBUcE1WMS8v?=
	=?utf-8?B?Z0J4cHBkWHZ2cFJONlRDczFxaG1NOFFEdXNCbHg0aG5DVFZlbTIyU0d6alFt?=
	=?utf-8?B?dkg4WXRDNkpnN25FN0xoSlRwRVBDK3plWjBMSFMxbDZUTFhmWGV1NzV0b3BY?=
	=?utf-8?B?WUJsenY1KytoaGFhME54T1lBVDJPb2pCOXlxb01laHdBa3prSGE3OHdLVy9t?=
	=?utf-8?Q?tiQ/V+VcAg9qfJsJJmtnJGJvjgPRUyKBStqgTba?=
X-Microsoft-Antispam-Message-Info: krWNJMZsWDXxFWAQfbd+Sn6oJDKn8owMKwI43hbLbblXqGwH1vN8uxWdBMfOa1NfcDrafX9sB+fEvwEkBl76T7kogTFMGnCVhCi6XjVHBHYzelmq6j6M0IuMcsfgXkWaiXmeTXAOfK8qolSlWvvn9spAHSjvyQ5rv8AzH5HLbpE4XpzfaujUYzAEUnTZM7vNbMz6Ogm2i9SbOIJuN8kjabrQQZp8hjEyBK09xGDUb4BJluShWdWyN2wYqF5W7GA8adqNxBhzfwQ5VpVvsECIZZWw8pUXIAl8t1pf++Gkk2XNl3kfJgkNjhxETjwPxoLKW2fDkLR6TqBS7zYUY+pZ5N8Mtr/BpujXWGBzS/2tQgg=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR03MB3837;
	6:L8TAImVdpe/Br9jtqRROxORl6L3Drm3bSPbV6NIS52EP4GRgcgCN/PoJ03zts51zpxl6Q0BqBELkYkmlXNQ9JtJewD217xbqhdT33ny4pcvAnAZ6/92XZewppp76f0DKrZVZu5JCXGGdJ7/66yH0BAcUTD9ezybTijRPvxPC8gr3eZ9G/td7JNzdH7A4dxOPnXV0zLPlRXP7DEOIsnrXXTdQQwOt4MeVtyHUjq+1oOEyYMEl3DEj8PICcveTTCEYNM+j/F2P1ay4JGD9G1yKx71p/2W/VZaJn5QVnDmI/7GkpnHABfaAH3GTyJCQ7mpMacaRKsqWo0Hj0oMrxhk47DgWpyhuZzDEBqOGNqptc2dIluSZA3BSTMJsrxPjzaPAXWWQRvroOb6B2U9d62llGgbB2/ILeBSQG2J098mkTj3pSiV3cHMp2kMJjx+KEKyEBsxm2tMq7JoqNxaqLAqfrQ==;
	5:9PmlYS4EhjZmNbPYWyYUc2sOM6q15fmSpExJLwQw7LSZlv1zX1kaadlQVLJGWv+5olr7svEnNqOQVTs93+b0XwwtaLXmOIq1LHP6BeVjIA9zdpKChoz06nJ8l3bnVQlHtl/SsNEUkDIzXvs1FwFkVPDV34K5qHSW9CyJsPHqd6U=;
	7:9tYKop5xvpEAYDD+n38R1lkSml0AGhxzcwp2V9/OPJe6u0AKI+n7yedaBq4zrMzqPSm/3a9aUDdE7dce2fTjvCk1Fprg4HeLKesxvkijW0seUzlE3VTjaPM9EbJc9usXzBGgxC6mCa46ndP2Z7WmHMMwFpH9420bMxtjd6T7JIgPkjAOIhTZY3AlYb8/WbIz/iXkRNyZOXd/VcK/LK5BI7xS3y4k/zZtifGXrLP9Ivm9Q9tbW0SE5fDgwIc/KRcY
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: bbv.ch
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2018 06:41:52.5252 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38314123-5733-4a15-ece4-08d61dfafc2a
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 279985bd-2077-4d9d-9797-42238cfc06e2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB3837
Subject: [PATCH] openssh: resolve install conflict with openssh-sftp-server-dev
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
X-List-Received-Date: Wed, 19 Sep 2018 09:15:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Image generation fails with the configuration:
  EXTRA_IMAGE_FEATURES = "ssh-server-dropbear eclipse-debug dev-pkgs"
This is due the dependency eclipse-debug -> openssh-sftp-server ->
openssh-dev -> openssh. openssh can not be installed since it conflicts
with dropbear.

By adding the package openssh-sftp-server-dev we have no dependency to
openssh-dev nor openssh.

Signed-off-by: Urs Fässler <urs.fassler@bbv.ch>
Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 meta/recipes-connectivity/openssh/openssh_7.8p1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb b/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
index f4b295f2df..2782cdb2ad 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.8p1.bb
@@ -132,7 +132,7 @@ do_install_ptest () {
 
 ALLOW_EMPTY_${PN} = "1"
 
-PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server"
+PACKAGES =+ "${PN}-keygen ${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-sftp ${PN}-misc ${PN}-sftp-server ${PN}-sftp-server-dev"
 FILES_${PN}-scp = "${bindir}/scp.${BPN}"
 FILES_${PN}-ssh = "${bindir}/ssh.${BPN} ${sysconfdir}/ssh/ssh_config"
 FILES_${PN}-sshd = "${sbindir}/sshd ${sysconfdir}/init.d/sshd ${systemd_unitdir}/system"
@@ -146,6 +146,7 @@ FILES_${PN}-keygen = "${bindir}/ssh-keygen"
 RDEPENDS_${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen"
 RDEPENDS_${PN}-sshd += "${PN}-keygen ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit pam-plugin-loginuid', '', d)}"
 RDEPENDS_${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make"
+RDEPENDS_${PN}-sftp-server-dev += "${PN}-sftp-server"
 
 RPROVIDES_${PN}-ssh = "ssh"
 RPROVIDES_${PN}-sshd = "sshd"
-- 
2.18.0


