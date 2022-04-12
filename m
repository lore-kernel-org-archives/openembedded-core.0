Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BEFC4727C
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.92.74.38])
 by mx.groups.io with SMTP id smtpd.web10.7802.1649747425691171876
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Apr 2022 00:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com
 header.s=selector1 header.b=FCK90Hx+;
 spf=pass (domain: outlook.com, ip: 40.92.74.38,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nfTt84TMZaZeVubiNMO0SbYkNYpNNd1qZhrjfS8AgcOYcdlsfrzgflCDgK42moBF1YoLoT1wJEa97SGWebCS3+UygTMKUJSqghtr8exmlrAPeoOyuLOPimI6YcItDiz5bH+YJaO8CzFU2ZyXBKzm5iCAPpIOvMk25bLJcfnzchW3ltviyu3Dr4t6mRzFIW7dtOiAE63ehHkdOuNIU04czCsKhSpAP/dfjC4MWSvcSFAWfn4Gv3CagnsEr3c7E9RLFweKdBhTGCL9C207zMaqJYgvrDKnLkCQ+WPoZ+5rucsc4di5f7HDKIMuj2d6sp0G4W5165g73+vmisBHJRiy2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaZS6Pjr1PXZJF2jzXYyWqRVg4/KDp8tGnxeaSGvr90=;
 b=MHv/Hw9uff8+gLDk4OrwHHw6XRuTUk8zfugeWSNibEpQJn0oOr/PWYr92PphhGUBe4h1NM4HAx6unoKqPyP6zU4rSHfeEf3eyPLZHlGFnvVHxtUbnORA1HrDmtbbWUVp3q3KDBScIVihMyN2C0fEbff/HXoPDgFHa8pU1Tlpi7FSSVqOxS6u8RARhPSQwkrur2mx39ZXsVVX6JHrEtEMmvWjzeISOn9Ng3SlVXp+4ao9xz1V2Kog2efrUNSfoSzF9/B3G7LD7/PjEzUPw7yNjv6kByqDm0R8ZBKAgoLg+37chpmxKDchqZVz5YQHdK65bwYr/9cU+bTvI6QwtwTMQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaZS6Pjr1PXZJF2jzXYyWqRVg4/KDp8tGnxeaSGvr90=;
 b=FCK90Hx+4SK8bjE67UIhbx+PfgQ/i3FuW8jl/VAGZYdk/IzZ74+Cz84D93NKlO6hAKXUxGHsPo3ppMFSajld5N0r38FLXaotSyzp+eNsnA1nZmuU6yaDQey+wehA2FK/oanL6lUVNY1GB0U0RcPFUvz58wmDzG4MY0EDEP3CDH3cDxCO9Dca1JdGtXhGn2uGDXVCJci7x8RmS2e9O1WUoSIhu7M9Ko/ykVBN3+SvOQVq3h8uhPa7rWR6jQNP4MAr+l0LuXME+X62j4/GJv5MtDUI765+H1mV+BcgPtlQlPt9BDn5tVLHFkIHJ9xOSuUd6BI5ycRZV3vVxRDv52U/LA==
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com (2603:10a6:3:f4::15)
 by DB9PR09MB5034.eurprd09.prod.outlook.com (2603:10a6:10:2a1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 07:10:24 +0000
Received: from HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37]) by HE1PR0902MB1801.eurprd09.prod.outlook.com
 ([fe80::6417:4cf6:d61e:ac37%10]) with mapi id 15.20.5144.030; Tue, 12 Apr
 2022 07:10:24 +0000
From: Konrad Weihmann <kweihmann@outlook.com>
To: openembedded-core@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [PATCH 3/4] itstool: add missing COPYING.GPL3
Date: Tue, 12 Apr 2022 09:09:55 +0200
Message-ID: 
 <HE1PR0902MB18017A18D36B73B4A2A0D870A8ED9@HE1PR0902MB1801.eurprd09.prod.outlook.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412070956.1117150-1-kweihmann@outlook.com>
References: <20220412070956.1117150-1-kweihmann@outlook.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-TMN: [3YZAzae2hlvr5AE25Ou2eRhEqxG7zjyDl6UdnqXtUIf3EA9jkMIsiuRGnF4e1cBL]
X-ClientProxiedBy: AM5PR0601CA0083.eurprd06.prod.outlook.com
 (2603:10a6:206::48) To HE1PR0902MB1801.eurprd09.prod.outlook.com
 (2603:10a6:3:f4::15)
X-Microsoft-Original-Message-ID: 
 <20220412070956.1117150-3-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4ecd057-a796-423c-033f-08da1c53834f
X-MS-Exchange-SLBlob-MailProps: 
	c5DxU4rKaXlLDQvAm7PT18i7Csa0fZYuTbkJu7TmmzNn7qQM4m0MWHcEubVstF1QYsYz/c5UwH5Gw6VvA1bO6NwYvXw2YaJ9HY2or2+IFu7bFQF8HlN1VvxEwrtxkeYypusYEBfx0PHGjI1dGhnwRiW7eY/9ltA+bzOBSPuq5THutfKtICGmoYa4lOhm+FZ4Cs1QpH5wqoOoDoBSc51wsw9s+W7KSQ1TT756NoXmUifwHhKKQy5wBR3brtLP6YCagU6t/sk4B6hFKqgJxKfPTfmRQGNznPGPgG0AZNHBIIWw2zNo7wR2mStTKpMWQVLx6v9DqkAnIAKuxx5TBNsgCPO5cb9j+DhCNj3mdPHtX7SspmxCRvMByMXUy1jKWxQVvesW9fY4M0QbkQP/ygVf8+tx0hEjiLHWHSM9SdPwaaab86wfx4vv527qySFvXP1FZIDFrX7E5DWvri6lmSOdV37TO28wELDGmn+ExLFPPNN/w1czFp6x1lHm5fdhK9Q/CCF6/fjCmzuA+3SXjP5ghHlZM8sr7w2Z5KM7605cplIxUPlwQzeqWF9jPon4MuluRNWeEgLzxmEuSKzqL/5xzX5YgsGIEbk5hktrG1kl1X+SavberhKXEuZsFJYHBdyqx/0Pp1XAx48MOnxZ024VIb/424IkA/DTKjh9jgn5CwOQblvgKe/xCDJVel2t51qLBPws4wdMoqRkfd91AmotViyRpSLnAbp2tTG7M0LLZbECqdP/hOlt2O+3SaR6BZQOXl7PRHUOpMGdGlybU/JoRijW1hgfcanMYdpzZVkhb4jCY/bD5b5l93WAEfzjbhJH/lDJuXF9t7bes6TMA6k1cqj6WIP1nb9J
X-MS-TrafficTypeDiagnostic: DB9PR09MB5034:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NbTQBW97wEjqYgMaFgvEPhbHY2i/Kk6CvQCz9aTqCUCo+IgSMOn2OzXKsbffNdjRK4xPKcsekGV/5G2WDkVqw+QXVVDK++dO0do/2H4jtL5Zh3Wk0WrrA3hJ/RHbBt/gz3cao9r3A1qRe5oQH6TKqU3HmxQrd+hf0mbuOlNbxfLI9YbcsqbjFHz+CsgbxfP+EH0OV5BHPZQcqzzEOOFn/FAXA0mry40BXq/Pe5kqCSgMQ8wgVtrNm43SvEruea+WPvd+6QXMOW0pwHFzOzA7BjUeyMLj/14ulVNbKGjNIs4PKQhhjcKR2J2sxpOOpB1w5LnNfdETmiVtv1r/M1bq55yBzhUTJYKiXxwwHHFRah2qIG23mM7srvRX2EkGWqhXEu7Rmx0jSxPaCdF5iqPnQyKhIRftRLWbwObHExY+48eXQd+ePY3ZAhPEhcxnc8rf661EiyTKki3eYif2Lt9Ym1u8e6KR2eJXr4zjrMRnTJS+gy/Xj3+rBgP1E+WVpXTlE3nqDNV2+344TtifhAuFt95Ss2bFTVlHxrKOJqTqiZEnuXbluTKLuvwUUOvzWjWeaCNLLdZ86Gz1Zr5ypi91bw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9OMzThYJq18bD9ZmjyhX5CFRxXczs+I1r1iehpFLSFLHt9TAmzQ9YdexEMLn?=
 =?us-ascii?Q?XtONHknsdYBsesdZcb0FUBDFtfGDie9TF2LGsfyGQywHtbd/lxzkskMFip6h?=
 =?us-ascii?Q?qzY9bUCRNkpssQQqfZHkV72s/EsknYvPztjie13WGC5kfS0QtD9SlIzGLpIs?=
 =?us-ascii?Q?uCc9MgtaWes8AKMPmhGnB3F6CTbD1DBk6jv6ONmIx1VfirPVZ9Wbnan+kXjk?=
 =?us-ascii?Q?05WVeTwF6JpDenXnXTNthQnjb2CvjMpgJ+jnO/MMQix2yYB8nYLci3IDPLuY?=
 =?us-ascii?Q?4vwegHD1luxyEge/1VwlzjyHX10my1u5k3T+Ag8RcizzdK2Oabfgw5aisS2h?=
 =?us-ascii?Q?9YULNJUJLuqAt5V7zRUjmwnuzCCgyN2DolU3j0/LtOJAA12kGP3J5I0KuB4N?=
 =?us-ascii?Q?NSC6KYcF6G6jZg28XSwWLKL5rNBgp5v3cei4B1RTw3zMXc+uTWeAgcRm/L95?=
 =?us-ascii?Q?f8AVLmDn5jeEiVd3JArz7s3SWaLAp12L6CMRbcYBWerrgOVdqYWfYIfEI5RQ?=
 =?us-ascii?Q?a4ZE2sI+NN2hZy9t1+STe8UG2kSJItcexIp2T08m8blkltjoJfoxY3IOhQ0q?=
 =?us-ascii?Q?aoEdA+bdhbhe0aNb/6MOrkxJJgMpy5EP1eqp/pADp4U0hV6/RXnHsLzBETge?=
 =?us-ascii?Q?vU2iOlJXcuu8dhqUWyi+Jpc7ObVGjCPFju8NQpq1D9G2KByccSKZbcj+vlo+?=
 =?us-ascii?Q?hph/D0QPLq/m5K9le/WdTErRtxW6fXe/SpHj9SluN5xhhN/akAI8vj28VSJl?=
 =?us-ascii?Q?E2oV1oQ09wvPPgwGhjetptST5381X2I82N3thqg8ZvQK3FQ9ua4kyFqWqvcI?=
 =?us-ascii?Q?fG+Atx6hnvFANuA5xYV0KOz58kGGX+NfkPbte5t6rL/oTP9JkJkbBR5/BQ/5?=
 =?us-ascii?Q?C/sENdNIw1HzidB2bCVNJokijACwXxpX8NWzqkHHdG9iPHbDwzkzoleTgNWu?=
 =?us-ascii?Q?gjFM6EPBcvB2obDFlEeQJo03hoPWi7sP/GyzKloj48PNA3ppSLZ0scTNMRq2?=
 =?us-ascii?Q?fucJMxXNfVLT5dYWq62uhJy3L6fyewIIYd6JpGNoXQ4VrE3/MPlHrlf29sde?=
 =?us-ascii?Q?61iFRzfD+zeYSKCYm28+ow7X55JpSnvyy4/57bos5Be2S0tzRalYuTyT8PkO?=
 =?us-ascii?Q?oUm+blhhJ6TcH5xu+kIWCBDSKCtj8ZTjsgTUoWCD6tCLU9Hz5Z9+jILTAHL+?=
 =?us-ascii?Q?76V16dekFhv6Xkf0heuqcrIZL38YdyHjEFuZhrA0Cq/NCfFLG2VD9IEoTT78?=
 =?us-ascii?Q?zmZupYepji6Cnr7fYO5GzhIMnVYlemmiXMJXwaP8W7D/AwlG53TfMJSh3uE4?=
 =?us-ascii?Q?0u0uCo5Amz9fGrEun2XVTu6L6LZiDs46kjf6LtefFTO+AyMFWlLx+Gq/8uvJ?=
 =?us-ascii?Q?HyuSkqDlfCKVp21Bc3Sz/lvTZ4rfNgOQIVr2Dcxbe7IKTpoi6aA4FnyAi2tl?=
 =?us-ascii?Q?mJ2GIlf/XOriMRJezsB7B9OW4a1Ed8/SJqiFr66NGXfrgeUuYyqEykKkAaz0?=
 =?us-ascii?Q?4sSAN/VpC5PU0PQ=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f4ecd057-a796-423c-033f-08da1c53834f
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0902MB1801.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2022 07:10:24.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR09MB5034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164257

to LIC_FILES_CHKSUM.
Format the list for better readability.
Remove useless line continuation from SRC_URI

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta/recipes-support/itstool/itstool_2.0.7.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/itstool/itstool_2.0.7.bb b/meta/recipes-s=
upport/itstool/itstool_2.0.7.bb
index 5af16995d7..7af231b1f2 100644
--- a/meta/recipes-support/itstool/itstool_2.0.7.bb
+++ b/meta/recipes-support/itstool/itstool_2.0.7.bb
@@ -5,14 +5,16 @@ XML files. It determines what to translate and how to chu=
nk it into \
 messages using the W3C Internationalization Tag Set (ITS). "
 HOMEPAGE =3D "http://itstool.org/"
 LICENSE =3D "GPL-3.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59c57b95fd7d0e9e238ebbc7ad47c5a=
5"
+LIC_FILES_CHKSUM =3D "\
+    file://COPYING;md5=3D59c57b95fd7d0e9e238ebbc7ad47c5a5 \
+    file://COPYING.GPL3;md5=3Dd32239bcb673463ab874e80d47fae504 \
+"
=20
 inherit autotools python3native
=20
 DEPENDS =3D "libxml2-native"
=20
-SRC_URI =3D "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2 \
-           "
+SRC_URI =3D "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
 SRC_URI:append:class-native =3D " file://0001-Native-Don-t-use-build-time-=
hardcoded-python-binary-.patch"
 SRC_URI:append:class-nativesdk =3D " file://0001-Native-Don-t-use-build-ti=
me-hardcoded-python-binary-.patch"
 SRC_URI:append:class-target =3D " file://0002-Don-t-use-build-time-hardcod=
ed-python-binary-path.patch"
--=20
2.25.1


