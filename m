Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.92.89.93])
 by mx.groups.io with SMTP id smtpd.web11.610.1591130701822784109
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 13:45:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=DeXBHwbD;
 spf=pass (domain: outlook.com, ip: 40.92.89.93, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kBtKsAh5y8n48VeDUK+5MHKhzAAezoxl22VGo5Mn+L1iMilRjx+SND6QI9GQ1LV7//co5yyYQ/9vzu8eIcKPgSoNT5/ZqU1mxuggxiJ7Btx9E/IslID25hC6blKcDqveZ3gn6yXl9xkXflvr8CPJ1IWjfO9cYDlNrJIcqMll2fpBPvhQM+8N2sLut79xcHup8qKwYs3ljzZBR20WitcDo+sDio6BUisNMPfGitKomfRmfWlJByuRKdi3hSSeY7RtcpVue4DZFgibruJELrqzFcO0sKhdmnkRc+SFiJOpKjn15V5ZWRC5X0qce2FXEM8UPYcJueZKBWc85U66bNdjvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVpt+IB7lLHuBp3T2F723cBJ2+MHA4wIcKWhCwP/uuA=;
 b=CcM03aNni3hZvNN+wOVnzHgBJa3uPv3vUFuLIHpVXhJuJZEmf2i8j6LcLVcFJ/AEFkLzwxqtrFAjGozeslonOXGZDrRQT1E0waWqja3GB0fPcQUUz5WVt+86oCKIU1hT7d2YbvVA8DArR/6WbsD/dTyNVmraAfdJEElaDOlVuTb99Y8ezDEYtjuNUXJgXg307/0J+CavSUtpD4+wTYprNdr9PU76e5r7E+1F2DJ8MgdX/bg4nYho4DaHkOxKJI+SSgvZg+z33GkLM19K5fT1TRBo8iXoEmcNT1awl8K1p3pOIvpxHJ5pL9pnNNLq2/TODLfzVwoanDMeQoUpN3e1Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVpt+IB7lLHuBp3T2F723cBJ2+MHA4wIcKWhCwP/uuA=;
 b=DeXBHwbDbyV+i320vlkPsrGk3aNnZ37ISdW6JtAldxLsl3MvLmAW85Rk0frcN4W6Tbu+TBMNUaBu9f41BSKPHB69BVDq2314rM/vcCymZSuKFnPa89/HVg1Xmb2dTnR7dHxstuzmIB7hUcLV4Z5gSe5pd0z1LD92Su3V3zvWJI5lQR/kOpRZ1bCSJwRt9zpQN1ljqxBLMuYnMUjKUA8KXXrK1Lj26p5HcPuYrlDgu+YXQcvk5103V3RBM/1/Tym1rgO5Njgnk61JTBf+7v8lrtxGeQyKe7/Ojb2t7FgP/FNQAJ6pgjvsIkHYR1kYvQzpdVkolbBSB9rJOrpooO6lrA==
Received: from VI1EUR05FT040.eop-eur05.prod.protection.outlook.com
 (2a01:111:e400:fc12::46) by
 VI1EUR05HT073.eop-eur05.prod.protection.outlook.com (2a01:111:e400:fc12::127)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Tue, 2 Jun
 2020 20:45:00 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:fc12::48) by VI1EUR05FT040.mail.protection.outlook.com
 (2a01:111:e400:fc12::442) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Tue, 2 Jun 2020 20:45:00 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:D1C502D724C1E42B29BB8097897243DBD5C79A8632C40B2A49678693A94E2F04;UpperCasedChecksum:97EC03A16D8264F5CA86BA279C61AD56FC3D9611147ECDB8F91E5260B6CF10E5;SizeAsReceived:7575;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%5]) with mapi id 15.20.3066.018; Tue, 2 Jun 2020
 20:45:00 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH] libjpeg-turbo: whitespace fixes
Date: Tue,  2 Jun 2020 22:44:12 +0200
Message-ID: <AM7PR05MB6881751BFFDEC248F78C763EA88B0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200602204418.26224-1-kweihmann@outlook.com>
References: <20200602204418.26224-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P194CA0019.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::32) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200602204418.26224-3-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.33.251) by AM6P194CA0019.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::32) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.19 via Frontend Transport; Tue, 2 Jun 2020 20:44:59 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200602204418.26224-3-kweihmann@outlook.com>
X-TMN: [VOyVpX3AdKwswoMyFh53U1jYcKFkuSvV]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: dcdca95d-aa1a-4d96-f452-08d80735d131
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyKnU5wPuodHyLMPzuZ10HBOvBbNuF8KUPa4My62MiPSoFMIZdGZ2bwyboswf7xd0gTVJFv2pYJ8T8dQk/uPcSlh/yHm0Is/Zvyh0iQ+hQBnp7D8Jm7CnDkUTQL8IKgxvdY+C5ovR3NSn/xYCeHczQwsALTsg0VZZt+bFe2DPqZnsIsKilKiuoI170gaGbMS6ACi4zAruOzZAJQ+gj+pjWC3SAdO2IABuScesqFu3jJjxCOiPJ54f9wzA29/bOl+y9F8a4g7kjuUKkmoZNTHNF50vbP9Q6cKLk0HCqeSe5AVeayWqxSaZIIuYPcg/x/4+jA4WS7YY9WdzVFWYWm2zm/qHoEYbmoHNU37zHTuwZxCwBqTULag663AbhdmDT1uO6QLk7SLFNSRtHo8VjdHD2ahlZUmW2AoyCQcXpEesBsLbBQMZOZWFwvMGUGdZ9SDcIkvoSj6iccflZ5JkU/fNwNMiLPp/l13mkzpsw8oO93/n40vwHsVbsAagTM8m6oDqMep9/i5xMEvLYDz2viiDV7RR3qfiRP3F0uhice55JDcNKRjAyPCFs5uqT9Yin3KkYZnhn6DvpfdkZNU4R/KhG0GvIKWy1ir/gt7PRcK7CBbJQeR8oK+tUNpzaKoVlm29NAJHkz6lY0DIUiFRix34cqbktOfxwsZI3QDQzNVQs/fSgkUjRT69TSm4E+ZK7NDJE0BHZ21fi2RYT8aRjnqo4+Wj6EUuk8vOTJmsSA3DWdDEL6E/lpfM/i8aYxROwe5nI8=
X-MS-TrafficTypeDiagnostic: VI1EUR05HT073:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	qM5dddCekO+VFsTXU6RMUFB2Kx/Pq5j4fid0LY950pF33RkwDQPh9AoGNFVqGiSU6cyCPCeJwXiShKCoBRQ206UUq6kOxnUIWgp/eu1P6iN7bt0LATcKG32JntL/Mm49qAFRd5wewsQZe+ZyClw34wkLIl8TiQ+t5IT+9sEJsDkFWCAWQ3hq5n/UcSHE7DMY0Q+MhOQqEZC5lwQUeIXwVEkDwRrzqakQkykruBn8bC6AvILAI9wpazMplKjWW6gg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	jhC9d/jrn2qXa1UcC2UmHhcL9HBeho8ymiCq2RYjpCmDVTM902m91uVyUDtZDtpIPJzOuFSUPrbPI+Qu6PKm8pkfKF8FwsUWh6RMIeQ5CjXmZ7Lobrgua0AwgaH4Jm61RzVsCTOZuNzNeI6nZiZf8A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdca95d-aa1a-4d96-f452-08d80735d131
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2020 20:44:59.9289
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR05HT073
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Added the proper amount of blanks around equation-signs

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb b/meta/recip=
es-graphics/jpeg/libjpeg-turbo_2.0.4.bb
index 1f49fd3d3b..62ad504270 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_2.0.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://cdjpeg.h;endline=3D13;md5=3D81=
84bcc7c4ac7b9edc6a7bc00f231
                     file://djpeg.c;endline=3D11;md5=3Dc59e19811c006cb38f82=
d6477134d314 \
 "
 DEPENDS_append_x86-64_class-target =3D " nasm-native"
-DEPENDS_append_x86_class-target    =3D " nasm-native"
+DEPENDS_append_x86_class-target =3D " nasm-native"
=20
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
            file://0001-libjpeg-turbo-fix-package_qa-error.patch \
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] =3D "33dd8547efd5543639e890efbf2ef52d5=
a21df81faf41bb940657af916
 UPSTREAM_CHECK_URI =3D "http://sourceforge.net/projects/libjpeg-turbo/file=
s/"
 UPSTREAM_CHECK_REGEX =3D "/libjpeg-turbo/files/(?P<pver>(\d+[\.\-_]*)+)/"
=20
-PE=3D "1"
+PE =3D "1"
=20
 # Drop-in replacement for jpeg
 PROVIDES =3D "jpeg"
--=20
2.20.1

