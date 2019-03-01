Return-Path: <jhofstee@victronenergy.com>
X-Greylist: delayed 3588 seconds by postgrey-1.34 at layers.openembedded.org;
	Sun, 03 Mar 2019 02:49:32 UTC
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr130130.outbound.protection.outlook.com [40.107.13.130])
	by mail.openembedded.org (Postfix) with ESMTP id 503457C864
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 02:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Smko+BHmXOKcsCqlfGaymCRw541z+E3b0M5d2UJgAVs=;
	b=47FhcJz+g3n4tp+fP2sMv+eQt9TG9+DhmLfeoctSQvyrU+Mp5FCCODg8hJGzLywlT3pjduhw95EkrOviI6AkH8WXep3MJtoCrF0CV7QfODZBGJZsNUbDTsGEY5YdHMT7YFf7+lmb09rfUPLkmQLk8v+jK6JK9ZoYfs5UFSmCHPk=
Received: from AM6PR07MB4646.eurprd07.prod.outlook.com (20.177.39.27) by
	AM6PR07MB4630.eurprd07.prod.outlook.com (20.177.38.220) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1686.11; Fri, 1 Mar 2019 20:16:02 +0000
Received: from AM6PR07MB4646.eurprd07.prod.outlook.com
	([fe80::e488:e469:e9b9:7502]) by
	AM6PR07MB4646.eurprd07.prod.outlook.com
	([fe80::e488:e469:e9b9:7502%2]) with mapi id 15.20.1665.012;
	Fri, 1 Mar 2019 20:16:02 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] initscripts: Add support for
	/etc/default/timestamp
Thread-Index: AQHU0GuXFV94yejZgEKP4droBjAufA==
Date: Fri, 1 Mar 2019 20:16:02 +0000
Message-ID: <1551471341-12738-1-git-send-email-jhofstee@victronenergy.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2001:1c01:3b04:4900:d0b8:b883:54d5:7586]
x-clientproxiedby: AM6PR02CA0028.eurprd02.prod.outlook.com
	(2603:10a6:20b:6e::41) To AM6PR07MB4646.eurprd07.prod.outlook.com
	(2603:10a6:20b:1c::27)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.7.4
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b35eeb60-9e79-4d09-5c51-08d69e82ba38
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR07MB4630; 
x-ms-traffictypediagnostic: AM6PR07MB4630:
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; AM6PR07MB4630;
	23:RDsazhuiIOpKo3woneDf6QS/yQFneYW1PYi9XOk?=
	=?iso-8859-1?Q?QL4PdJ55a9HyMcZIdzHGxaH9EGPmumLnbvtyhfZVzqH5yyUzqFXpxAbz5L?=
	=?iso-8859-1?Q?0C0Z1hXdW9cogCAvMCagpPjjW6Qf9ZEhoHh7qfYMReOMsuLfPWpkzd6iyG?=
	=?iso-8859-1?Q?X7A5e9MY0UNQoJXq8D+YmaJWiLjoGMT9Fzw3ynPKFerHqdYrAU7dRUSBQ/?=
	=?iso-8859-1?Q?O8miXcdkij/LjbX3KkALJFfXUPHlSnb9+cIUulvcafHiWHFF9g1nU2o9NH?=
	=?iso-8859-1?Q?ZhRwojWndUx3IuXCYdadM8c1dBCHXpqFScH2rnoNpThJyrQtAQMU8tHKCt?=
	=?iso-8859-1?Q?Z4L7n7PIWQE/ZVQKPjxko9YJHxbGeaslKU7/U5IqW/vgIQXd2dpgVKCufQ?=
	=?iso-8859-1?Q?UODIlVQatt4lGe4b8HxdM/0jTeRbKaGr2G9SDhlxmM/+gdshS1xEgieFdu?=
	=?iso-8859-1?Q?faeMHmgSxCGLKN3tNl1SEIIUvJh+LBh6i+H74nUexyxVPpTVPIgBI57p9O?=
	=?iso-8859-1?Q?qPapimApYQqu4f5E0g/tOCYHfbgBgoT5FfAaKTy4hlfBHz2Xh5FrLih5Td?=
	=?iso-8859-1?Q?3KU3ZIpc2CjjAgQzP/2mIi+GauIYwFGKohAzOxkrNsAOkujVsGfzQ8RWfA?=
	=?iso-8859-1?Q?aoPUGs8YoddpRq+Kp6y/fLHHXFWMJrw2rSPM4lqJtq01h10ZtuwBwTNZIn?=
	=?iso-8859-1?Q?RnNBUAXiyOx0xjMu8ug/mh+O1qI185FcLEMNeUzWqSwDEZ02zWko4h/Bwo?=
	=?iso-8859-1?Q?O1hVvg6pj5eRM3Q9omiQ7i9U59kBLKmgueY0hrl+2kQCgvlqXUyqR5XOtz?=
	=?iso-8859-1?Q?TPy26kU2o15nXRlQUVZRidOgnRS2g18AmOAS05crfFMXPfHbwP9/JoGbEA?=
	=?iso-8859-1?Q?GhxIDbtlHygxCmjEv0cgAuwEj/BJRx+D28gF+LYrEvAcnI4FSqed8KbA8P?=
	=?iso-8859-1?Q?Ad5yuL/9dfaOaNaCUOVsQ8QV6Eiya9varhhM0KrFe6vOH0VkwIQQtR7IW7?=
	=?iso-8859-1?Q?WvymBq04q02it1izdL0a1qdrgU8393OR1SwQV6dXz5zECUy/2tcqHMuknf?=
	=?iso-8859-1?Q?CPo9jmj1mfiglZ2IGvHSn0iskKSl5EVvVOQpAi3jQuXkiylBHGD5Rz+aP+?=
	=?iso-8859-1?Q?oJDNqTyEa7+jdjmmwbylXbOOQ05MfaGMQObKeFHw7ZdFXBjcDc1xHqsb8Y?=
	=?iso-8859-1?Q?TZ3CflGH4kMank1fNr9uOf5HacrbJ5RvPdH7WxQV5X/ebachy/mTK8IlsL?=
	=?iso-8859-1?Q?z+RyY6xDR6oelp4K3?=
x-microsoft-antispam-prvs: <AM6PR07MB46303AEDB6D3088E0A2CE499C0760@AM6PR07MB4630.eurprd07.prod.outlook.com>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(136003)(366004)(376002)(396003)(346002)(199004)(189003)(186003)(6486002)(14444005)(256004)(316002)(14454004)(478600001)(7736002)(5640700003)(6506007)(386003)(4326008)(8676002)(2351001)(6512007)(107886003)(305945005)(53936002)(6436002)(46003)(6116002)(8936002)(81166006)(71190400001)(105586002)(71200400001)(102836004)(476003)(50226002)(97736004)(81156014)(25786009)(52116002)(106356001)(36756003)(68736007)(2616005)(6916009)(99286004)(486006)(86362001)(2501003)(5660300002)(2906002)(473944003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR07MB4630;
	H:AM6PR07MB4646.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pZfiPNXJFBn48EO/h4+orI9qCGVJ5GkbGtUlsCGyUCDgEMWdfSalCwir4uzylVdFoc2pezOGT9C5xCQJWssItqAGJUfU0A4xwjQD1ji2+ibP2aKKb8AkWAiPeOnf1NG7Iehv1WEuWP65X1K6wGlf4eoiB1VIwhN9q+L183r8NC0J6uqvfDNXgVFY3jfHP6ywTe5OkzBFfm0h5VJ2egZvz90k+4pL+Pl+5fSgGdGIPXW/pRFBubrn/bxB6eOrrtDVXpXpeEG0ait8vco0EZTKYRiZ/SMTkyVClo5PtBuURrqeEG3Kx34mvoXqQfKpfYyGDPBdacWDXb+PgFWBLQrpQSKIp7+3m788+LIzfYB27S6BqxS7DXP1aj/Z9dDBwhvSrAqx1oI1XqNuxRE8a36zvAoGaoDjG7hK8QBg0WDrvUQ=
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b35eeb60-9e79-4d09-5c51-08d69e82ba38
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 20:16:02.8928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR07MB4630
Subject: [PATCH] initscripts: Add support for /etc/default/timestamp
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
X-List-Received-Date: Sun, 03 Mar 2019 02:49:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Source /etc/default/timestamp if present. This allows the rootfs to be
read-only / store the file in a persistant location if the whole rootfs
is updated.

Signed-off-by: Jeroen Hofstee <jhofstee@victronenergy.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh | 7 +++++--
 meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh | 6 +++++-
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh b/me=
ta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
index df553bc..591591f 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/bootmisc.sh
@@ -8,7 +8,10 @@
 # Short-Description: Misc and other.
 ### END INIT INFO
=20
+TIMESTAMP_FILE=3D/etc/timestamp
+
 . /etc/default/rcS
+[ -f /etc/default/timestamp ] && . /etc/default/timestamp
 #
 # Put a nologin file in /etc to prevent people from logging in before
 # system startup is complete.
@@ -64,10 +67,10 @@ fi
 # If the timestamp is more recent than the current time,
 # use the timestamp instead.
 test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh start
-if test -e /etc/timestamp
+if test -e "$TIMESTAMP_FILE"
 then
 	SYSTEMDATE=3D`date -u +%4Y%2m%2d%2H%2M%2S`
-	read TIMESTAMP < /etc/timestamp
+	read TIMESTAMP < "$TIMESTAMP_FILE"
 	if [ ${TIMESTAMP} -gt $SYSTEMDATE ]; then
 		# format the timestamp as date expects it (2m2d2H2M4Y.2S)
 		TS_YR=3D${TIMESTAMP%??????????}
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh b/me=
ta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
index 1632a5f..ffa1eee 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/save-rtc.sh
@@ -9,5 +9,9 @@
 # Description:      =20
 ### END INIT INFO
=20
+TIMESTAMP_FILE=3D/etc/timestamp
+
+[ -f /etc/default/timestamp ] && . /etc/default/timestamp
+
 # Update the timestamp
-date -u +%4Y%2m%2d%2H%2M%2S 2>/dev/null > /etc/timestamp
+date -u +%4Y%2m%2d%2H%2M%2S 2>/dev/null > "$TIMESTAMP_FILE"
--=20
2.7.4


