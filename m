Received: from NAM10-MW2-obe.outbound.protection.outlook.com (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.135])
 by mx.groups.io with SMTP id smtpd.web09.685.1631566865601307474
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Sep 2021 14:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@melink.onmicrosoft.com header.s=selector1-melink-onmicrosoft-com header.b=HXnFyB/e;
 spf=pass (domain: melinkcorp.com, ip: 40.107.94.135, mailfrom: bevenson@melinkcorp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GUKpoGS1zXzKClbVa9xpbBBUcIJkR9++3DCMXAVUm39tD/oMeUKNexEZVr46R4U2yUgHh95UsvAmalQd9vN/VlodLpjY0D3Pr5/v6qRKPFOJvbkyQtN4KAwbFQt/T/91YYbpeLjjdljXjbFjal9hQ9ax5NHgeeEj+PkT2bDpVAClIn5DSZ7BguAsVxGi8kfJKYuK5qrp5wsrIu1DczS7+sz9OPync0JBJBln/N3lGsHJUXY3eKOd4H2HVtWGJ6Vndt+17AF4+D9aI/3v4xo2hcUt9iup3K9TnRhU59Afi8Ue6Bb1Cgx1Q2hohLOXFZZbB6vejak0xmBIzptMUbPsRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=oxPuGMtEhiS4wLOnoMZ4Rr2LtfMgK7TjgbNelBROIWI=;
 b=K6sC2v/G7wjTfuSIUYVZz6+oSqqI8BYgf6HCticN7ZgdfRrLZpFXj89gY8a6IFUbUb/cLffCZN8jOZgWqa0zBvWsiIr9j7yJf3d1Uu38t5qMVDuAupKBsGXTeYQqiVyy+RfGVJK3LXZJXev97W0UAtn6uuApZ77yFBsOJ3Z695ow6WA9t0uU1sk86Vyt8pl3Bbg4qQlFlAniNjCGiYQ5WC8DoVaxK1l0pUECchUpNwDQt1wky/K3kQ+txr7+z1FVxzmSY4gPU+bTIDMlSXcuXfv7RXwD/juMDm6vbNPNvcHQYU9FOxXEm+0qE4rmqJ60FdmmCo5hrWMW6tJie/Eh0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=melinkcorp.com; dmarc=pass action=none
 header.from=melinkcorp.com; dkim=pass header.d=melinkcorp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Melink.onmicrosoft.com; s=selector1-Melink-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oxPuGMtEhiS4wLOnoMZ4Rr2LtfMgK7TjgbNelBROIWI=;
 b=HXnFyB/et/xIVFfjdKdt4p2BxkwJdLjc/OiN0QqUl/T3ODAmfj7BNj0xXiXmbyHIR719Ig/hAwBtbRXQ/M/sECJXAbVvIEQplneygkBN1DOf7IDZ5GY1H6lv4NnW5daZNyvWypNsO2vCNnyMhLeAL4mHp9wSDUAO8g+oALqXg/aEYueaiJznc0CWzHO2bKj26G69mhbWXfZfdpb70nGpxkoUq6y3NK+/qdnpeZHdiW/ia4e/OalENSabcScFIORuyW8neJghezkb/HycAMmrAssQGc+TfB/Nm4GT2WslEy6KdwZ1YGJ8qQA8IyShBCdOzdBS6LKZPmZIVncvlJ3a8g==
Received: from CH0PR20MB3948.namprd20.prod.outlook.com (2603:10b6:610:c6::22)
 by CH2PR20MB3109.namprd20.prod.outlook.com (2603:10b6:610:6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.15; Mon, 13 Sep
 2021 21:01:03 +0000
Received: from CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::f002:4a83:9bb6:f33d]) by CH0PR20MB3948.namprd20.prod.outlook.com
 ([fe80::f002:4a83:9bb6:f33d%6]) with mapi id 15.20.4500.019; Mon, 13 Sep 2021
 21:01:03 +0000
From: "Bryan Evenson" <bevenson@melinkcorp.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: busybox: rm and sed not available during upgrade
Thread-Topic: busybox: rm and sed not available during upgrade
Thread-Index: Adeo2WW86GpcFtbeTxSzssymQc9x5Q==
Date: Mon, 13 Sep 2021 21:01:03 +0000
Message-ID: 
 <CH0PR20MB39489F504BBAB4423EA78499BBD99@CH0PR20MB3948.namprd20.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 9271cb7b-94bd-4c31-a741-bf50c49a5f30
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=melinkcorp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0ed8c4d-124d-4e06-2869-08d976f99907
x-ms-traffictypediagnostic: CH2PR20MB3109:
x-microsoft-antispam-prvs: 
 <CH2PR20MB3109C019F9ACF267BE8C0E46BBD99@CH2PR20MB3109.namprd20.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 a/xFmQ3aT+Ku/u8+Oek/p/gCWF5a3xzwqL0YIJwGB+1H2ABneoqlFg9O8C2KINsPUuHhjmg0urZLLIjVLdxKpEpYQvAQucy5HneLMoiIWR3EJ9j8ucPyjb54kSXT6BD6KiJFhFf3XwFwR9L3dVX0VFuRM0KR17HF5mJQIlMKQGiKjIVCEGH5i2D4q/fOgg3ornZrcV3OZ5hXSTw5yH8JhthsTCofZe6MgV22v+jdUm8VwdmEeTkDbdlXo1ixEIIitki6qbMHNwpa0gp2aHP3LuKeQyQuuPxLxcJWwZ1BlE/zQxmQkMLz1LgJm0FhTYiXDeiu2i5R/xo4EdDzfT7ZNCI9XwcOf2AnLhwVwaTTZdSMbpZrAUBTyr1TDU5U8e0DXjfs2aunRckDLi2NClJMeKCWPKpv321+vT1iw3apszkHLpuHGqb9mrEAf0mMEvg5RdxVD/SowkNhhAveX+r5rVZhY8wksU6UGPOOpVjJbo8QRC87MRkHwqZdoG6KMynthzqaNpcZXTRboI6tg4fb0SwZM3qWyLiuGy044jP9euRikCBr/PpqsdkoH9HhfXPWxcvsxnMy5mL7m/39Bw/CpMfyvrKI5XPM0a7NIKvDM5GvH70tEDI1aZ5xjinC0WsYPSwesNyE00RaPHb2j91qLh4J9ygN+ELsvzMrA+xSdMAaHAMyDS3G/t14fT7oZOrRRIn5FLMcDbEzeA9hsCwFGQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR20MB3948.namprd20.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39850400004)(396003)(136003)(366004)(376002)(76116006)(38100700002)(26005)(33656002)(316002)(66556008)(186003)(6916009)(2906002)(71200400001)(52536014)(66446008)(86362001)(5660300002)(66476007)(38070700005)(8676002)(8936002)(83380400001)(7696005)(66946007)(55016002)(122000001)(478600001)(64756008)(6506007)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?wpjeR3WLpEGUIGVkOqlHWVT1Vi+6XvADiNoLpJOb5CmcwDSRZmA22t3sRmfJ?=
 =?us-ascii?Q?6fGgPwLOTusIqW5ZH9rb2up0H7M2+628F7TZOAm2WZhN3vS/Hj0N/S4o8wiY?=
 =?us-ascii?Q?q7aLrHfMt3XRcN544vdVCH/fzQGeFWN5WWjz+ivP733JVpQ+74aIiMuNSE82?=
 =?us-ascii?Q?0YywMBLaQDfEfizVQQdadkMTC5K+lhKnfOygjRTSFpQiBS2Ns41qbKbxH54k?=
 =?us-ascii?Q?HIG+9IQBX69bnN6CbEGOoqHgXjl3bdVoI/huYlDJSxZadHYDTENRRIhmXA7t?=
 =?us-ascii?Q?uhbRXQtDzm+iizEuEvcrShRwJYxVETiBScYBEAOHOCZwMJIavtAfrP8trKwG?=
 =?us-ascii?Q?L+HxzRuWs/e6O2gERZoxUWS9yAY4lugIeCV1rXWDdDBB0fdmET4l0ZhAAnTb?=
 =?us-ascii?Q?EEXYp1+c3ZCi20RfrrTCHNh/891A163HyeISGXiQjgDYXlzEfQ3sPSnuN6/q?=
 =?us-ascii?Q?uwqWjGxuoU0TFr37dEkEi6CeWFqf/JwLBR1I5wsRNUwlltaUHu8LmV9WNswz?=
 =?us-ascii?Q?ALLinhjaEQ/weDHmXC62d40xDGM0LAKXzkIpq0R16oYH/timbP2JAqJOdE15?=
 =?us-ascii?Q?el/eLI1+lqfUzb3eySJ+Iy9nSBNfxLZJ2OALNtG1+UPg8lIf7bpN9BOAtdKg?=
 =?us-ascii?Q?OHZDa1BTabF+fAHYd9gHpVpzErdn58gRCRV3HELhLof9Y92xgdgs86qQqAZ0?=
 =?us-ascii?Q?5/FrBIOok4jqATm7q3Ep6VUTp3zcynzlrlneESfkkontdEipYj6XIBsaA9kX?=
 =?us-ascii?Q?zYF7GHqLA4gxrZulftzMZLTCmC/SC+HSm2pC8/SqGZNXdxzrPVaDPGcuZ0xj?=
 =?us-ascii?Q?Pj0PxNyXpEpucPKoFMr3lxPOr6IUriti5UvGwFX5uNoenv43oj7Hw4mb1siS?=
 =?us-ascii?Q?xpARK2Oni13++Va4J7wVaR01VqiItxFzZT0w4d8y5f6qjLtQwP6MKLQrpoSK?=
 =?us-ascii?Q?Aj31KdQGOCR/sGQCQP8Ck94Zkk7rWNSFuHzV0a5fZunAgcVKHy0jHLLEcMAa?=
 =?us-ascii?Q?7lJLWsJW5K6F1D9Z+Fl1frQpwWbIzPu07S29DJx3qFF0WwyVwKSL4ZO9/zDN?=
 =?us-ascii?Q?TxpGjyVFmBz9XFjR09jvMKiIKZXxJMoQZxW9Bw5gXe6di/QcXU5lu7gwtOLT?=
 =?us-ascii?Q?qr4Twk1SaqEKuv6Z3VI+nslDthm/LKycKa/wFQcgLUVGvh47Y5t/uRaffIIT?=
 =?us-ascii?Q?7+8L+JxxItfhqcF0jWOi93MVb4IQtY7iC6Gb+QIUpeTWm9D/a6Lcq5FMV6gc?=
 =?us-ascii?Q?stLrQriJc4413LHQs29Tj3h6Sm5x/yTZ9W/VJGQ+0utj4UzWjrqdekIRj+JK?=
 =?us-ascii?Q?I0SzPk9ELJy9Kx5bG7TGoYbz?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR20MB3948.namprd20.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ed8c4d-124d-4e06-2869-08d976f99907
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2021 21:01:03.5191
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BV+oelnHFU/qKvQAXMcZGQWICt9mPK3627JgAzRzQ2BaO8+U/e0uCG5mTQ5gtq3v2Asp03L4rrEnlSMWwLl2CQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR20MB3109
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

I have custom image based off core-image-minimal that is on the morty branc=
h.  I am working on upgrading the image up to the latest supported branch, =
one step at a time.  I updated to the pyro branch and got an image to build=
.  I am using opkg for a package manager.  I test firmware upgrade by execu=
ting "opkg update; opkg --download-only upgrade; opkg upgrade" and then loo=
king for errors in the output.  I am seeing some errors during upgrade that=
 I don't know how to fix.

When opkg removes the old version of busybox, updates-alternatives removes =
all the softlinks for busybox.  Then, it proceeds to upgrade other packages=
 prior to running upgrade-alternatives to create the new softlinks for busy=
box.  As a result, the preinstall script fails on several packages because =
the preinstall script can't find rm, sed, tr or start-stop-daemon.

I don't remember seeing these errors previously.  Is there some flag or set=
ting that should force busybox to complete its upgrade prior to uninstallin=
g and installing other packages?

Thanks,
Bryan Evenson
