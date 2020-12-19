Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.12040.1608399385598550679
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 09:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PSD8Kfnt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id w5so6416768wrm.11
        for <openembedded-core@lists.openembedded.org>; Sat, 19 Dec 2020 09:36:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:references:user-agent:mime-version;
        bh=Hz9rN85R8VRC+FyrkyvqyTutjjIdzSVi2Csyeif7jcg=;
        b=PSD8Kfntp1O+7wreYcEdS1aVy61NMnM8gsQ54tP8TjEzugjBCPyorfbyzrgKAJsjb6
         8qoQ6OYqQjihDnTijMD1VmyJiwZQZLKir96NmizyV9hDbxqezsRNyJgOCdBIq/fxxrMa
         MZ5oJ0cUHLTQGO8WHgxpNoCsVaYC7AFmRiDMs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:references
         :user-agent:mime-version;
        bh=Hz9rN85R8VRC+FyrkyvqyTutjjIdzSVi2Csyeif7jcg=;
        b=TLGxbUUzRDI9Wl5BpHWijx5wRZFIMFqoTVwPxiE3FnmrsxQvj9tKFdvdhkXgRLW6sQ
         zrsAcQLuoYdYP48NGy6K3src14HGGMdWghVnZtFGqJ9H6FysmzEFJ19Vp4xRCGdpzAZP
         eXSEArRQ9kcOtONhYAoB8OaZdMU/x3hgn7yyAKYD7RncArUR1ouzBeHIDiBlSDnEDC4K
         BWmYnE6461ZHxFeuNzBuvvYGoft8Mug+BS3RhZGr1hB/ejMt/abC16nVVxJvdZGwILP5
         AiKH0H/J8Pqzoc6YpxnRx0KcKToIsS9HIDue1FOldzHcXdhjjTCuIAZfaSK2sd3ijRmL
         xQ+A==
X-Gm-Message-State: AOAM5326QwY1tZ0bNAgagXbp7hYvpI1zpyphRxgMeberYmUx4QhsBuRT
	m7p6ygT8ZH6u9IEb6lEwa/R8Pg==
X-Google-Smtp-Source: ABdhPJw8kNPAHwsDOIumoq3ZUbzA7nSBZcsihrQm0ghGPFzIGyfKIaTpp1pXjFjsfR6aFJdQwHwaSQ==
X-Received: by 2002:a5d:43ce:: with SMTP id v14mr10299188wrr.342.1608399384091;
        Sat, 19 Dec 2020 09:36:24 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (4.4.0.a.d.7.7.1.7.c.4.b.2.1.9.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:912:b4c7:177d:a044])
        by smtp.gmail.com with ESMTPSA id e16sm20082299wra.94.2020.12.19.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Dec 2020 09:36:23 -0800 (PST)
Message-ID: <820250ef6b128796337fb4a730097a3aa80528d7.camel@linuxfoundation.org>
Subject: [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Shachar Menashe <shachar@vdoo.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 19 Dec 2020 17:36:21 +0000
References: 
	<AM0PR08MB361713C43176BFA1C7295477C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-Groupsio-MsgNum: 145901
Content-Type: multipart/mixed; boundary="=-xo6lBRmqIJRfgr+AcYhL"

--=-xo6lBRmqIJRfgr+AcYhL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The OE-Core list needs to be included on this so I'm doing so.

Cheers,

Richard

--=-xo6lBRmqIJRfgr+AcYhL
Content-Disposition: inline
Content-Description: Forwarded message =?UTF-8?Q?=E2=80=94?=
 [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
Content-Type: message/rfc822

Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on dan.rpsys.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.4
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43]) by dan.rpsys.net (8.15.2/8.15.2/Debian-18) with ESMTPS id
 0BJG4ga03678436 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128
 verify=NOT) for <rpurdie@rpsys.net>; Sat, 19 Dec 2020 16:04:44 GMT
Authentication-Results: dan.rpsys.net; dkim=pass (1024-bit key;
 unprotected) header.d=lists.yoctoproject.org
 header.i=@lists.yoctoproject.org header.a=rsa-sha256 header.s=20140610
 header.b=g96NXeOz; dkim-atps=neutral
Received: by mail-wm1-f43.google.com with SMTP id a6so5675208wmc.2
        for <rpurdie@rpsys.net>; Sat, 19 Dec 2020 08:04:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=1e100.net;
 s=20161025; h=x-gm-message-state:delivered-to:from:to:subject:thread-topic
 :thread-index:date:message-id:references:in-reply-to:accept-language
 :mime-version:precedence:list-unsubscribe:sender:list-id
 :mailing-list:delivered-to:list-post:dkim-signature;
 bh=cNRBWAi0kGu6aNMeJb4PZpw49CbwpGG7l4TBS/SGFak=;
 b=cmzld30lMFqbGCPmTo7zrchIsgsrEC8zoB+7dpQVuneZmWboArou8YD5Z9+Nz2tqhf
 JX1awxlvfMk+9hPW74lLvITSuSgU5vSCw0vvcT3TvB0HeiWXxTtzeVIdmP7tmznV1yOX
 822libozJbCWexZNWmwHyygXKQ+kHCa38Aexhdf4ryCvEPkixIbyy503XSULIIPel1KW
 HjRYzaEN3Ti6seMl9O5yBAUe3u21y8f4h9Ac6OnBHtAuf9W3WDhIL2+afas++jewt4TB
 6kLruyreTU7zvd7+7L3lvXEuuSz/2/RtZxXI+fQ2L+vc9uWJyLbPs1r2IZwySdMCOMTV 3+Fg==
X-Gm-Message-State:
 AOAM531EUlZb7UQMl9Dzf0fCFdcvcv1/sv8xBeroDlh8rkYLy6Ejpx5Z
 jrIXUEprJpu1Y+Ev1Tc/1eo6pfswcMc2gFfCIyMeNROzn6EnOAIGEnaC
X-Received: by 2002:a1c:5459:: with SMTP id
 p25mr8373459wmi.19.1608393877729; Sat, 19 Dec 2020 08:04:37 -0800 (PST)
X-Forwarded-To: rpurdie@rpsys.net
X-Forwarded-For: richard.purdie@linuxfoundation.org rpurdie@rpsys.net
Delivered-To: richard.purdie@linuxfoundation.org
Received: by 2002:a5d:4307:0:0:0:0:0 with SMTP id h7csp2900035wrq;
        Sat, 19 Dec 2020 08:04:35 -0800 (PST)
X-Google-Smtp-Source:
 ABdhPJyTaEM6r1RjwqgpWWhvvysaZBetm2R85PlTC+fmXaI7KFZ9KEivF1Wu4rUWXZUkvCDIXm0Y
X-Received: by 2002:a9d:4d05:: with SMTP id
 n5mr6560151otf.99.1608393875539; Sat, 19 Dec 2020 08:04:35 -0800 (PST)
Received: from mail02.groups.io (mail02.groups.io. [66.175.222.108]) by
 mx.google.com with ESMTPS id k2si5591955oiw.193.2020.12.19.08.04.35 for
 <richard.purdie@linuxfoundation.org> (version=TLS1_3
 cipher=TLS_AES_128_GCM_SHA256 bits=128/128); Sat, 19 Dec 2020 08:04:35
 -0800 (PST)
Received-SPF: pass (google.com: domain of
 bounce+53652+229+1686473+6695773@lists.yoctoproject.org designates
 66.175.222.108 as permitted sender) client-ip=66.175.222.108;
Authentication-Results: mx.google.com; dkim=pass
 header.i=@lists.yoctoproject.org header.s=20140610 header.b=g96NXeOz;
 arc=fail (body hash mismatch); spf=pass (google.com: domain of
 bounce+53652+229+1686473+6695773@lists.yoctoproject.org designates
 66.175.222.108 as permitted sender)
 smtp.mailfrom=bounce+53652+229+1686473+6695773@lists.yoctoproject.org
X-Received: by 127.0.0.2 with SMTP id m227YY1687808xhQ8L3rigLX; Sat, 19 Dec
 2020 08:04:34 -0800
X-Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.44]) by
 mx.groups.io with SMTP id smtpd.web08.10790.1608393873346602845 for
 <yocto-security@lists.yoctoproject.org>; Sat, 19 Dec 2020 08:04:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B3g1/HMoroCqeJgugMUP+PdxtPA86NAAET26K+XHjUj0emajvKjPL77uqSJXqeaHy0fIag+AlPUaZCMQPAfFj3Ac6kJzlRXl5KLpsmEDMbeh3Rp6Q/OUFL6ZekdxoWV4ahyg09Hl2UWZLA3V2SIjj0uM5xjYo9uoaruh6Hl/FTn0vDAcsc+GlFbO4GOpJDNMmJkipuUpAF8eDBc2zhLnHexhM06t8VKX9p3N4vw1UAwKknq1y9dsRKdsaCfzTKqlrZGP7NArLfXDafFfwQiAevK2cL8bdp49J8jmLR+3M2PnMhE9tUGVA9mYy/ixmXct+LhVDDB2L6PMgOKSOw+fbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microsoft.com; s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ygVAAcL0BMMiulZMPzI2tjN+UgEp5KtgShOXgrnhZ8=;
 b=Iq6S70R90bJBOhUlDFldaPsEo5TqMoUT/Tt5Ln994yoMaJ84qrO/mklyOo08NVBawpUlhIzS3+2iOutnNgaANjqLN9IIZuyqdccID8mZ+SLLthgE3w1Rx4cCjUfSwXrdQxGXJobfuWk/+lWalXaHsJUl99okiLiOHQONFVJF/Qb/qAbjHIyEZPU+gnCH8DyllxbG8fv1Yo5rkqVxwlY9JvZ7tOyapPMHk9Ei+/senqvCHODRQI9O2Ji3hVlw2WH7zDdXHndGKKuo0FLrwJMoKHjn8A3oMAh/WaokZNojIVdurIoYwPaQCRCsRDRhH1Pc/gpArZkA2w9mRHPU36bYNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vdoo.com; dmarc=pass action=none header.from=vdoo.com;
 dkim=pass header.d=vdoo.com; arc=none
X-Received: from AM0PR08MB3617.eurprd08.prod.outlook.com
 (2603:10a6:208:db::12) by AM9PR08MB5939.eurprd08.prod.outlook.com
 (2603:10a6:20b:2d9::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3676.25; Sat, 19 Dec
 2020 16:04:30 +0000
X-Received: from AM0PR08MB3617.eurprd08.prod.outlook.com
 ([fe80::4494:259b:d85f:c413]) by AM0PR08MB3617.eurprd08.prod.outlook.com
 ([fe80::4494:259b:d85f:c413%4]) with mapi id 15.20.3676.030; Sat, 19 Dec
 2020 16:04:30 +0000
From: "Shachar Menashe" <shachar@vdoo.com>
To: "yocto-security@lists.yoctoproject.org"
	<yocto-security@lists.yoctoproject.org>
Subject: [yocto-security] [PATCH] openssl: drop support for deprecated
 algorithms
Thread-Topic: [PATCH] openssl: drop support for deprecated algorithms
Thread-Index: AdbWHlrVfB78095ZTc64dfQve/9rEwAAiJVw
Date: Sat, 19 Dec 2020 16:04:30 +0000
Message-ID: 
 <AM0PR08MB361713C43176BFA1C7295477C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
References: 
 <AM0PR08MB3617B053AC97B2A4AF7305D4C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
In-Reply-To: 
 <AM0PR08MB3617B053AC97B2A4AF7305D4C5C20@AM0PR08MB3617.eurprd08.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [79.176.198.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id:
 07bac3be-1786-4065-1cb5-08d8a437c4e8
x-ms-traffictypediagnostic: AM9PR08MB5939:
x-microsoft-antispam-prvs: 
 <AM9PR08MB59391FF35B0EA978A99771E7C5C20@AM9PR08MB5939.eurprd08.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 
 LxYdXOG9/zqx50mIXa5ArYigVXAUr5SZm3X/gEbbMEYeioq3zqAAYm9tm3bQu2bJxEH2JuCOonEvJt+PpT3I3Kxz2IKFNHifEL4tyEIVfCzY2kntJ7DtiXF/+FhXm5KZkrtHDKP2H/UDGO4gk66m8z1x9Gyk3X3b3w8/NFDwJzaI2Tdafj/tlwByX5Y1rxLgK+MKTPTxDOThdmFGBmdtU3pKV4VYr0H3ttHm2A3R6LuNs98CHFHJEZoauTEjI+JRsmgrTh0SCiCTjcShFAx2eAkcR9WrshnjFKaQzcymLO6BEbXphxiQEQFodN92+glE1geF1oKRqy3r+SulFCRxcZ4RmWpsh4dPQUxAJxQgCPh8gPaQpt8Vd04xymX9H6xlAVTpfVblBrREyvAhPrSj8g==
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?teyh96z0qqTaI97p5yIQApxGxtxLGawpt4kGqovxN5Y2PiaJWG51T/ZC8oA8?=
 =?us-ascii?Q?+o/LEyZiy6B8SktosZWBA5VF6F4syL3DSLeMxwkfvA6h0MAPQ5tLTGYTbb95?=
 =?us-ascii?Q?M4NOR45vcBHtYdXX+yqUQNNr9X/P7/CDzS+ukMKFgscPjk8LxD1BCrc67W3T?=
 =?us-ascii?Q?BPb9qcvBKQr/JY7t10OHvi2LyZWyZEjv2cZzbSNJzt075jdAVPyIHYAGUYIy?=
 =?us-ascii?Q?K9sFPhTxeD6C3E+NVuFKK468DHtDzAu9E1tC2fmJnQJrt5Oka020BhDePop2?=
 =?us-ascii?Q?d6g1vC3sjMKTgJLwZ69EQ1ieS3RBjUVjo6fPLFBAeOzBRqof//cRHBDo8W7/?=
 =?us-ascii?Q?6GjTiWBeaMqCLWHIug30WKLBBXUrsPqjRUFS4F19Ku7mpNPEIKa5WVc9jA8e?=
 =?us-ascii?Q?QPp4KVrtfAELzsKDyKKiQZ7EhhV+xuHxFqT+DBltLkeX1IrLWHTSc8tkLs2p?=
 =?us-ascii?Q?MJ31ajhR2/hTZElDALQI5D9GFJbdDjxyrx00y+En5nqZDlJ8oVizt1ysvkXq?=
 =?us-ascii?Q?r+ordlUeylkitVXEmGbuV5KQGdKz8n16Z5gsuPfk5OVm/yiA4DDnVRJNw7+y?=
 =?us-ascii?Q?93PcQt0XRW/iVjr5vrXW4jvEqQJTyLoY4sHizK0ui0ji9PjKE7Jgy3E5N1aP?=
 =?us-ascii?Q?+3gjX42NmvLNImw/BdBHa/+L3Lr6zmkw6tpyQlBHxA+WiQ5vHdB0ECK9xIzy?=
 =?us-ascii?Q?I4MwE1w0AwNLM0vxF6btHhWV/LGlhasu+PpME7RHN9s70l4Cx6TDIye263wu?=
 =?us-ascii?Q?d+WGVy6/DpYl7BXtJzK+uCQYnVQZ239/KZP5So5O0v+ky/0LPLRJ6dV9Q0qD?=
 =?us-ascii?Q?bzu0nCBupiVSDxpZA+3zwAzxbNwruGC39bypBSkmxlIKxPb4fSwxCybQ6zqs?=
 =?us-ascii?Q?FYoz6rB+Dqgn7ZwCGqq6IkQuefmkHo/kfCqhTbS3SB/sBcXZKFocAlXXg5IQ?=
 =?us-ascii?Q?kw4xFqqhkpcR79X+QkpYmXz9dwZGWrH8Af9xxBi7cOY=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vdoo.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource:
 AM0PR08MB3617.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id:
 07bac3be-1786-4065-1cb5-08d8a437c4e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2020 16:04:30.5868
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a81b5702-409b-4c2e-9bda-9307e6e5c027
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname:
 TWnyVLA5tcW3mjojumsCtirXScbMe5GQFA7aBpK3YgjevmWoG70YQWU1kduY+jIhY4MTVxH8PzrxKEpISIasng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5939
Precedence: Bulk
List-Unsubscribe: <https://lists.yoctoproject.org/g/yocto-security/unsub>
Sender: yocto-security@lists.yoctoproject.org
List-Id: <yocto-security.lists.yoctoproject.org>
Mailing-List: list yocto-security@lists.yoctoproject.org; contact
 yocto-security+owner@lists.yoctoproject.org
Delivered-To: mailing list yocto-security@lists.yoctoproject.org
List-Post: <mailto:yocto-security@lists.yoctoproject.org>
Content-Type: multipart/mixed; boundary="jO9GfYyJPTga3ENA8FBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=lists.yoctoproject.org; q=dns/txt; s=20140610; t=1608393874;
 bh=TDWw7f8oCnjjewb0VEu1EbjkR9BrTRXzrDfJuovFyQ0=;
 h=Content-Type:Date:From:Subject:To;
 b=g96NXeOzNbfx9UffyNGsM/5EJRr5HbgFmT1qEDkHCSLqA5BQ8FLWIuFGQ3+vMzBkD5z
 kljpEP9+QjBIpUoJ88b6tW89RKyexVTKMcEzW28QDuSpLK01Naj5HdlF0sxy9kvGbPOzO
 sXy8uaaLcbt0a3cAOT2EVZ2B6D5dfkz7aEI=
X-Virus-Scanned: clamav-milter 0.102.3 at dan
X-Virus-Status: Clean


--jO9GfYyJPTga3ENA8FBN
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

1. Drop support for many deprecated algorithms by default
2. Allow dropping support for TLS 1.0/1.1 via PACKAGECONFIG

Signed-off-by: Shachar Menashe <shachar@vdoo.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/rec=
ipes-connectivity/openssl/openssl_1.1.1g.bb
index 8159558..f9764bd 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
@@ -33,6 +33,8 @@ PACKAGECONFIG_class-native =3D ""
 PACKAGECONFIG_class-nativesdk =3D ""
=20
 PACKAGECONFIG[cryptodev-linux] =3D "enable-devcryptoeng,disable-devcryptoe=
ng,cryptodev-linux,,cryptodev-module"
+PACKAGECONFIG[no-tls1] =3D "no-tls1"
+PACKAGECONFIG[no-tls1_1] =3D "no-tls1_1"
=20
 B =3D "${WORKDIR}/build"
 do_configure[cleandirs] =3D "${B}"
@@ -52,6 +54,10 @@ EXTRA_OECONF_class-nativesdk =3D "--with-rand-seed=3Dos,=
devrandom"
 CFLAGS_append_class-native =3D " -DOPENSSLDIR=3D/not/builtin -DENGINESDIR=
=3D/not/builtin"
 CFLAGS_append_class-nativesdk =3D " -DOPENSSLDIR=3D/not/builtin -DENGINESD=
IR=3D/not/builtin"
=20
+# Disable deprecated crypto algorithms
+# Retained for compatibilty - des (curl), dh (python-ssl), dsa (rpm)
+DEPRECATED_CRYPTO_FLAGS =3D " no-ssl no-idea no-psk no-rc2 no-rc4 no-rc5 n=
o-md2 no-md4 no-srp no-camellia no-bf no-mdc2 no-scrypt no-seed no-siphash =
no-sm2 no-sm3 no-sm4 no-whirlpool"
+
 do_configure () {
 	os=3D${HOST_OS}
 	case $os in
@@ -122,7 +128,7 @@ do_configure () {
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF,=
 as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables =
instead.
 	HASHBANGPERL=3D"/usr/bin/env perl" PERL=3Dperl PERL5LIB=3D"${S}/external/=
perl/Text-Template-1.46/lib/" \
-	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=3D=
$useprefix --openssldir=3D${libdir}/ssl-1.1 --libdir=3D${libdir} $target
+	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} ${DEPRECATE=
D_CRYPTO_FLAGS} --prefix=3D$useprefix --openssldir=3D${libdir}/ssl-1.1 --li=
bdir=3D${libdir} $target
 	perl ${B}/configdata.pm --dump
 }
=20
--=20
2.17.1

--jO9GfYyJPTga3ENA8FBN
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#229): https://lists.yoctoproject.org/g/yocto-security/=
message/229
Mute This Topic: https://lists.yoctoproject.org/mt/79085238/1686473
Group Owner: yocto-security+owner@lists.yoctoproject.org
Unsubscribe: https://lists.yoctoproject.org/g/yocto-security/unsub [richar=
d.purdie@linuxfoundation.org]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-


--jO9GfYyJPTga3ENA8FBN--


--=-xo6lBRmqIJRfgr+AcYhL--
