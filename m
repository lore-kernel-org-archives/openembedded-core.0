Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web11.3836.1627338436538551404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jul 2021 15:27:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=nBPEqQPJ;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: fib@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4702; q=dns/txt; s=iport;
  t=1627338436; x=1628548036;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7AHLe8L+McBGqCZOalPXxwizYZYTekW6L18bflV53Ec=;
  b=nBPEqQPJ5OSwjbjOV9K2XKqgxmqK3FE0+EaqMIZhrPvJ6PXuow1+Cd/6
   Aoj6yFqh0O80P3gqtosWK8bsI6PCaPfmEXFaqEVf8fXIzc/MbpAMefeqi
   2oep27LcBRhjzpKThP0YxrQc+cL6OQz30fUvgKkmLcdI01u7pae1TWDhE
   A=;
IronPort-PHdr: =?us-ascii?q?A9a23=3AvNPi4h+3UyC7pf9uWMPoyV9kXcBvk679PQkQ4?=
 =?us-ascii?q?5xhgLVLIeyv/JXnaUrY4/glzFrERp7S5P8Mje3K+7vhVmoN7dfk0jgCfZVAW?=
 =?us-ascii?q?gVDhZAQmAotU9WMCkr+JfisZCs/T4xOUVZ/9CS9Nk5YUM/1e1zVpCi06jgfU?=
 =?us-ascii?q?hXyPAZ4PKL7AInX2s+2zOu1vZbUZlYguQ=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A0J/O3az9+P9fajRFJh4WKrPxdOgkLtp133?=
 =?us-ascii?q?Aq2lEZdPULSK2lfpGV8sjziyWatN9IYgBepTiBUJPwJk80hqQFn7X5Wo3SHD?=
 =?us-ascii?q?UO2VHYbb2KiLGD/9SOIVyEygcw79YET0E6MqyNMbEYt7e43ODbKadb/DDvys?=
 =?us-ascii?q?nB7o2yowYPPGNXguNbnnpE422gYytLrXx9dOIE/e2nl7N6TlSbCBAqR/X+Ik?=
 =?us-ascii?q?NAc/nIptXNmp6jSwUBHQQb5A6Hii7twKLmEjCDty1uEQ9n8PMHyyzoggb57q?=
 =?us-ascii?q?Ksv7WQ0RnHzVLe6JxQhZ/I1sZDPsqRkcIYQw+czzpAJb4RH4FqjgpF5t1H22?=
 =?us-ascii?q?xayeUkZC1QZ/ib3kmhOV1dZyGdgDUIngxesUMKgmXo8EcL6faJNA7STfAx2L?=
 =?us-ascii?q?6wtnDimhUdVBYW6tMW44vRjeslMTrQ2Cv6/NTGTBdsiw69pmcji/caizhFXZ?=
 =?us-ascii?q?IZc6I5l/1TwKp5KuZKIMvB0vFsLACuNrCq2N9GNVeBK3zJtGhmx9KhGnw1Ax?=
 =?us-ascii?q?edW0AH/siYySJfknx1x1YRgJV3pAZOyLstD51fo+jUOKVhk79DCscQcKJmHe?=
 =?us-ascii?q?8EBc+6EHbETx7AOH+bZV7nCKYEMXTQrIOf2sR42Mi6PJgTiJcikpXIV11V8W?=
 =?us-ascii?q?Y0ZkL1EMWLmIZG9xjcKV/NFQgFCvsurqSRn4eMCoYDHRfzPWzGovHQ1cn3WP?=
 =?us-ascii?q?erKcpbEKgmd8PeEQ=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CMCwAdNv9g/4MNJK1aHgEBCxIMQIF?=
 =?us-ascii?q?OCwKBUVEHd1o3MYRHg0gDhTmIYQOKWI9ZgS6BJQNUCwEBAQ0BASoLDAQBAYR?=
 =?us-ascii?q?YAheCZgIlNAkOAgQBAQESAQEFAQEBAgEGBHsThWgNQAEQAYVwAQEBAwEBERE?=
 =?us-ascii?q?RDAEBCQECKwELBAIBCBECAgEBAQICJgICAh8HCQEVCAgCBA4FCAwJBAGCUIJ?=
 =?us-ascii?q?VAw4hAQ6cKgGBOgKKH3qBMYEBggcBAQYEBIEIAS0BCwGDfg0LgjQJgRAqAYJ?=
 =?us-ascii?q?7g38PhmMnHIINgVh4gWo+giBCBAGBJDsVgwA2gi6DFwYBgQ4sIAJuCAEsGwg?=
 =?us-ascii?q?aATorjCSIF0enLlwKgyaBMokFjD1ufYV6EoUqoTmiPoM0lSYCBAIEBQIOAQE?=
 =?us-ascii?q?GgWA7gVlwFYMkCUcZDo4fg1gZhRSBPYQNcwI2AgYLAQEDCYIwhieBaF8BAQ?=
X-IronPort-AV: E=Sophos;i="5.84,272,1620691200"; 
   d="scan'208";a="915876148"
Received: from alln-core-1.cisco.com ([173.36.13.131])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 26 Jul 2021 22:27:14 +0000
Received: from mail.cisco.com (xbe-rcd-007.cisco.com [173.37.102.22])
	by alln-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 16QMRErQ011205
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Mon, 26 Jul 2021 22:27:15 GMT
Received: from xfe-rtp-002.cisco.com (64.101.210.232) by xbe-rcd-007.cisco.com
 (173.37.102.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Mon, 26 Jul
 2021 17:27:14 -0500
Received: from xfe-aln-002.cisco.com (173.37.135.122) by xfe-rtp-002.cisco.com
 (64.101.210.232) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15; Mon, 26 Jul
 2021 18:27:13 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-002.cisco.com (173.37.135.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.15
 via Frontend Transport; Mon, 26 Jul 2021 17:27:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KRnJ4gece7zDITCiqfjF8dQadpPqW/j27U9AAo/w8sSA77s1q4KWH7K4S6iAfB8ObnhFNYUW6rvRMs59chqi+NQojTk6q+CxdEmbA+4YNZm4ziH/XD2pdG3PVmpsutz1h5w35N0LwJ6JpFo3rA8uLtcdljabkuf2tvkZwotYqo3Co4lJG+CdLio4ALPnhCtk60EviDUPQhJGgdOMckAx3rWVpIKLMeWrfrNNd0uNAvmowOR+eKNntjcK5CgSMSrI/a6ZbmiXSepGlzaPTz9WXf/CQ4lcGHXyj9Vel0T+GT6WXxQGFVUCq0lGZchbFuRNbi/pITIzb2n3SpPkHvAamg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AHLe8L+McBGqCZOalPXxwizYZYTekW6L18bflV53Ec=;
 b=k+py9Jx39zyY67wN8CxYuXG34azw+UnAhx2sJ2vDrl5HZQfwPL9Z3Zfkl7vOhAJaH60Q+F4z/7U0IfXOHg1fj/2boQZiIJ/VvipuueIPFteeVpoyTungW6eh9lmRfVsR6b2LaYX9Z3VSqc2hyy2k6H5S7+qhb3+n78BE+gazcljR4jIsgGVsyH6gMQb8yfE0qAwzJUge0FGPqrpPEX5eA+IBtYXB2cwB/nKW5MEm+0lGAHcVNSUqCduYUzvRke1ZaME17tBjP2ri0tsIbVhPYIxs7JgoF5P4yCBcJmsVstFSRAJkeMF/e3L2RUY/00DKNSl90Nc8XZoA3fCjDqHC6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7AHLe8L+McBGqCZOalPXxwizYZYTekW6L18bflV53Ec=;
 b=IveRsrOc7CZq+ql4GdwfUPi36NUJD7nhwcaR/JZwLy5QsHMlCFqne8X9DzunLWv5g+kOhVhb2baq1lzUIE7KX1YdE9DHDAiCrAMAVtc8rJ9NMSl5eg8wSjzen6GHKL6T+c/05wZVfL8j582AWTpeChG4ULqCVg3EHNQaVQXhxKI=
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com (2603:10b6:a03:2da::6)
 by BYAPR11MB3349.namprd11.prod.outlook.com (2603:10b6:a03:1c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.25; Mon, 26 Jul
 2021 22:27:12 +0000
Received: from SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49]) by SJ0PR11MB4784.namprd11.prod.outlook.com
 ([fe80::d0f2:e7fd:c028:9c49%5]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 22:27:12 +0000
From: "Ruslan Babayev (fib)" <fib@cisco.com>
To: Steve Sakoman <steve@sakoman.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
        Samuli Piippo
	<samuli.piippo@gmail.com>,
        Samuli Piippo <samuli.piippo@qt.io>,
        "Richard
 Purdie" <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][dunfell][PATCH v2 1/3] cmake-native: enabled zstd support
Thread-Topic: [OE-core][dunfell][PATCH v2 1/3] cmake-native: enabled zstd
 support
Thread-Index: AQHXgAwd2/ZuSWqlp06L1V9RW0BwYatVXw+AgAB5FPA=
Date: Mon, 26 Jul 2021 22:27:11 +0000
Message-ID: <SJ0PR11MB4784D0CF9A35F4D8A63630DBADE89@SJ0PR11MB4784.namprd11.prod.outlook.com>
References: <20210723214527.2225841-1-fib@cisco.com>
 <20210723214527.2225841-2-fib@cisco.com>
 <CAOSpxdYek8qF+oYVSuTGfzP6zq++f711QHJJur9P=xbrFVEWeQ@mail.gmail.com>
In-Reply-To: <CAOSpxdYek8qF+oYVSuTGfzP6zq++f711QHJJur9P=xbrFVEWeQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: sakoman.com; dkim=none (message not signed)
 header.d=none;sakoman.com; dmarc=none action=none header.from=cisco.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee108b65-7a60-4937-8867-08d95084836b
x-ms-traffictypediagnostic: BYAPR11MB3349:
x-microsoft-antispam-prvs: <BYAPR11MB33490A4E822921C070E314DAADE89@BYAPR11MB3349.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EwlysMxbaLHtWFJn/lVRaijg+VsncWg1lZoCfdPg+o4cuj4RRZ2/rI8ngKU3MYIRGzTjmA1R/bpx4v1ebXXP6wuaq5JdSnbOqJBQa4sBvGa1GoRubmDVsbiXqwqGBrku9SWtv7izGnq7sDEr6X75bVHFAmnE4sKkcvIeG8QsGVphPYMoRCEZ9RhCmFKf+gbRUSB9Ax4uL5JXKNMibtVwSg57thAPgMhpNQOPpxfnOHFcmHueWJHJ9DQdGFhDtVlKO6fVjHDAM3k7Pr7yvCHTtl3p54w54J2p2zSJ2xoRakMnT++C50o1zrt2bxCbRcAoxEsm+ymo8y6q187Hja4qUXga9mHHr22z1kFJFxENTw5GW4R5Iaf15UpgCsh7hfJUuRvTvTjVcSqTRLD077JxzgaqhNY6sUFk3ANPSj0ZlVdD0BW+KEC+YJktF7CFD37Ecc3akdmRVboUDxQUFGmx0kQ6H/Y6y5eC4oKnvyrQzQneympRTXpxWeJj48dk9Y/Th4H2ACAzVQY4QA5fbzXY5+vYpQbybR1oIamVyLsbJ5uO6mOfbZShn+0v9buoa3k5bFbvlEudpaPkAGF0EMKdx1hJTDO1hLgxrRLeLeHvh9pD1Q3BH+i/L9izP4UJICJ4RqmBi2tU6IZTfTB3Wd4tzGlWRkTr2PigLGb9HkRhaYG9Gvr4OeqFjXvcDV80B6nSj4pL63B4o+XitjQoedJE9hUvHLm7BQk0sFoYadCS414bs6h5RHrcTOigU0hqiQc619xnhDhYeLNEHU8s2KRex2W40SFPD/LV614VOSmRD7c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4784.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(39860400002)(396003)(136003)(376002)(366004)(84040400004)(6916009)(66946007)(71200400001)(86362001)(54906003)(186003)(5660300002)(4326008)(53546011)(26005)(83380400001)(6506007)(316002)(966005)(38100700002)(52536014)(7696005)(66476007)(66446008)(64756008)(66556008)(76116006)(478600001)(55016002)(8676002)(9686003)(122000001)(33656002)(2906002)(8936002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEhFTVphT1hLZS9mQ0RJOUxuN0VBS1UzYW4rQ0ord3Z1bzlXSExSNC83b0k4?=
 =?utf-8?B?RVFiRFBwL25tekE1VjNVV0dKaXV2cHgzblhhdWNqcUFMOFdYZ2VtNkxmdThG?=
 =?utf-8?B?WjZjQjBzYUU4YjUwUlg1WHF5b0NSMWgxTjlEL3NJc0QxV3daWWp2Qnljdk9p?=
 =?utf-8?B?QWk2bGpoOUpsMlo3ckpRWit4NWZOSU9CRHRHMDl4UEIvTlpWWXZuKzV6K2Jy?=
 =?utf-8?B?YVplRERxQ2pWaU1HRUR0cElHWXdlQndUbDhJL1lFa29uNGhWYWFyNVpZTmFz?=
 =?utf-8?B?TkVWbEdiRmNzWmdob2dva3ErZ1ROREQwSWZ2T1J5K21mcWFVRFVmSzJDUEp3?=
 =?utf-8?B?bldQNXo1WnRLSG5EV1hpeWhCSWpWOTd6UGgwTnowNEYxZFJiZDFSN0ZBZ0hG?=
 =?utf-8?B?TFRnVDlPQUp6TnVBcmkybUZDbEJaVUkzakVVZXJ5enJ4dWEvc2pCcEJrdjc3?=
 =?utf-8?B?Zzg3ZzA0TEZBbkxNTldWeVVtY2FNQU8zNnFFTHBId1U2NTJLTnZMV09vQ0Fu?=
 =?utf-8?B?Z0hLMmU2Nm82QVlZMi9SWjFVaXVXK21NVFhMVmY2cUZyRExYL0U3eUNPLzdQ?=
 =?utf-8?B?RVo3eHhQLzQ1RHprZFYrL3dTL1J5NXdSUDVBSmZsQU50THhLNHBCK2k4WUJ1?=
 =?utf-8?B?VHhrT0p0cERpWjJMTG5vNU5neDZnVEZudnZ5YnlXMGZoaXQ5WE9FN2tZYzRD?=
 =?utf-8?B?SWk5bVNLNFFlN3A5L1ZDUkJCN0pQdk03K01PUVpBcjE4L2lCNzNNL0RrUFdR?=
 =?utf-8?B?cUhNaEFMZWNEYUNBS1dpcmdiYWlsZ1N3TVFlUGsxNVZ3bEIya2pmUFYrU05s?=
 =?utf-8?B?b0YxYlQ0c05lQ0JlZ0NZSG9jMnZkd1ZYK2dISjJjSWF5TWFaQm5UdFcweVpQ?=
 =?utf-8?B?cHZVZHJPaTB0NkI1UmRGeTg5VGJsSmdpaHZiZXN6TTZOTVNDb1F0aVVmazNp?=
 =?utf-8?B?NC9xd0EwVHF2cXJOMVpYRS9GcVNIOXlJL3BiWXVYOGpvMG8zZnpsOEF1RDVx?=
 =?utf-8?B?bVFqQmViQlpkR2EvS2ZYTHlxeElVOWRwSXQ3NStsN0RJOE84MjBpNHlVRGJs?=
 =?utf-8?B?djdzajFRYk51emxyVUFCbllyV2I2aGFTbjhxSXJmSk9xWUdUK25kakxGNnBM?=
 =?utf-8?B?SkYvaG9aYUdpWlpzckw3SFY2TXptMTNEZDhpUjd6OWl5UFJ4c21VOUt4Z0tD?=
 =?utf-8?B?anVSVnBJdnRXT3RwYklQMmFNcGVpWVh3S1RWOFYwWWJtZGJWK1loNWNVR205?=
 =?utf-8?B?MUc3aXlNamVoZEI0N21mQk1uVlA3MWE4VUs4RUNMVGxYMzJ6Q2RncllQa3VN?=
 =?utf-8?B?a3dOQnhxYXNVZkY0bWtPckxRUlpXQjU1Rll6Yyt2Ulg4T0ZUTTI0WDJtN1Jr?=
 =?utf-8?B?UGxsWktMRm9zYjRZbXhVTXNxSFJnRXFvZWx1S0RYdzlKRkhZTnova0ZyRk80?=
 =?utf-8?B?YVAwVGpQUmFISDZQL2IxeFdLaGZCOHAzVUQ1OEhjakhwOHNxVUF3T1RPS0d3?=
 =?utf-8?B?bTFKdDlSQVBVMjJGemNUYzZoV0t4YmpJN3JTNnA0Sk95MnIvajVlcHBpUFNw?=
 =?utf-8?B?aDQwYlFkeGs3d3N5Z0M0WEF5L1ovRTIxeGhqREx6elVFNmdNZld4bUk3UW5F?=
 =?utf-8?B?cm4xRDJWREVTc2JjenNXZTBLczZBZ05MaDg1cW9RM2pJMU9WRmtIamhpZGM3?=
 =?utf-8?B?L0tZR1lJcnpPNlJGamZuZ3dDZEZ6YzVyQ2JwMUdIMEtNNU56emViL0tlZWRh?=
 =?utf-8?Q?ft9G1JSCuymRNvga78=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4784.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee108b65-7a60-4937-8867-08d95084836b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 22:27:11.8979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /LBLU5ZSZOCjEz9CNgStwhlFp+acnHguem87vyxFUCdhYFYsxg632qc1/EDEsljr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3349
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.22, xbe-rcd-007.cisco.com
X-Outbound-Node: alln-core-1.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgU3RldmUsDQoNClRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoZSBwYXRjaGVzLiBJIHVuZGVyc3Rh
bmQgdGhlIHByb2JsZW0gb2YgbWVyZ2luZyB0aGlzIHBhdGNoIGFzIGlzLg0KQnV0IER1bmZlbGwg
Y3VycmVudGx5IGhhcyBhIGhvc3QgY29udGFtaW5hdGlvbiBpc3N1ZSBvbiBzeXN0ZW1zIHdpdGgg
enN0ZCBpbnN0YWxsZWQgYXMgcGFydCBvZiBiYXNlIE9TIHJlc3VsdGluZyBpbiBicm9rZW4gY21h
a2UtbmF0aXZlIHJlY2lwZS4gQ2FuIHlvdSBoZWxwIGJyaW5nIHRoaXMgdXAgdG8gdGhlIGF0dGVu
dGlvbiBvZiB0aGUgc3RlZXJpbmcgY29tbWl0dGVlPw0KDQpBcyBmb3IgdGhlIG90aGVyIHR3byBw
YXRjaGVzIGluIHRoZSBzZXJpZXMuIERvIHRoZXkgbG9vayBPSz8gRG8geW91IHNlZSBhbnkgaXNz
dWVzIGluIG1lcmdpbmcgdGhlbT8gT3Igd291bGQgeW91IGxpa2UgbWUgdG8gc2VwYXJhdGVkIHRo
ZW0gZnJvbSB0aGUgY21ha2UgcGF0Y2g/DQoNClRoYW5rcywNClJ1c2xhbg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogU3RldmUgU2Frb21hbiA8c3RldmVAc2Frb21hbi5jb20+
IA0KU2VudDogTW9uZGF5LCBKdWx5IDI2LCAyMDIxIDg6MDUgQU0NClRvOiBSdXNsYW4gQmFiYXll
diAoZmliKSA8ZmliQGNpc2NvLmNvbT4NCkNjOiBQYXRjaGVzIGFuZCBkaXNjdXNzaW9ucyBhYm91
dCB0aGUgb2UtY29yZSBsYXllciA8b3BlbmVtYmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZz47IFNhbXVsaSBQaWlwcG8gPHNhbXVsaS5waWlwcG9AZ21haWwuY29tPjsgU2FtdWxpIFBp
aXBwbyA8c2FtdWxpLnBpaXBwb0BxdC5pbz47IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KU3ViamVjdDogUmU6IFtPRS1jb3JlXVtkdW5mZWxsXVtQ
QVRDSCB2MiAxLzNdIGNtYWtlLW5hdGl2ZTogZW5hYmxlZCB6c3RkIHN1cHBvcnQNCg0KT24gRnJp
LCBKdWwgMjMsIDIwMjEgYXQgMTE6NDUgQU0gUnVzbGFuIEJhYmF5ZXYgKGZpYikgdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgPGZpYj1jaXNjby5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+DQo+IEZyb206IFNhbXVsaSBQaWlwcG8gPHNhbXVsaS5waWlwcG9AZ21haWwuY29t
Pg0KPg0KPiBDTWFrZSBkZXBlbmRzIG9uIGhhdmluZyBhbGwgZm9ybWF0cyBzdXBwb3J0ZWQgYW5k
IGJ1aWxkIGlzc3VlcyBjYW4gDQo+IGFyaXNlIHdoZW4genN0ZCBpcyBub3QgYXZhaWxhYmxlOg0K
PiBodHRwczovL2dpdGxhYi5raXR3YXJlLmNvbS9jbWFrZS9jbWFrZS8tL2lzc3Vlcy8yMTU1Mg0K
Pg0KPiBRdW90ZSBmcm9tIGEgQ01ha2UgZGV2Og0KPiAiQXMgZmFyIGFzIENNYWtlJ3MgZGVzaWdu
IGlzIGNvbmNlcm5lZCwgd2UgaGF2ZSBubyBvcHRpb25hbCBmb3JtYXRzLg0KPiBBbGwgc2hvdWxk
IGJlIHN1cHBvcnRlZC4gVGhhdCdzIHdoeSB3ZSBidW5kbGUgc3VmZmljaWVudGx5IG5ldyANCj4g
dmVyc2lvbnMgb2YgbGliYXJjaGl2ZSBhbmQgbGlienN0ZC4gSWYgYSBkaXN0cm8gYnVpbGRzIHdp
dGggYW4gb2xkZXIgDQo+IGxpYmFyY2hpdmUgdGhhdCBkb2Vzbid0IGhhdmUgenN0ZCBzdXBwb3J0
LCB0aGVuIHRoYXQgaXMgbm90IGEgcHJvcGVyIHBhY2thZ2luZyBvZiBDTWFrZS4iDQo+DQo+IFNp
Z25lZC1vZmYtYnk6IFNhbXVsaSBQaWlwcG8gPHNhbXVsaS5waWlwcG9AcXQuaW8+DQo+IFNpZ25l
ZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBSdXNsYW4gQmFiYXlldiA8ZmliQGNpc2NvLmNvbT4NCj4g
LS0tDQo+ICBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvY21ha2UvY21ha2UtbmF0aXZlXzMuMTYuNS5i
YiB8IDIgKy0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQ0KPg0KPiBkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5h
dGl2ZV8zLjE2LjUuYmIgDQo+IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5h
dGl2ZV8zLjE2LjUuYmINCj4gaW5kZXggYjI5NTJlZTVmNS4uNjAzNGI2NTRkYSAxMDA2NDQNCj4g
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjE2LjUuYmIN
Cj4gKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2NtYWtlL2NtYWtlLW5hdGl2ZV8zLjE2LjUu
YmINCj4gQEAgLTEsNyArMSw3IEBADQo+ICByZXF1aXJlIGNtYWtlLmluYw0KPiAgaW5oZXJpdCBu
YXRpdmUNCj4NCj4gLURFUEVORFMgKz0gImJ6aXAyLXJlcGxhY2VtZW50LW5hdGl2ZSBleHBhdC1u
YXRpdmUgeHotbmF0aXZlIHpsaWItbmF0aXZlIGN1cmwtbmF0aXZlIG5jdXJzZXMtbmF0aXZlIg0K
PiArREVQRU5EUyArPSAiYnppcDItcmVwbGFjZW1lbnQtbmF0aXZlIGV4cGF0LW5hdGl2ZSB4ei1u
YXRpdmUgemxpYi1uYXRpdmUgY3VybC1uYXRpdmUgbmN1cnNlcy1uYXRpdmUgenN0ZC1uYXRpdmUi
DQoNCkluIGhhcmRrbm90dC9tYXN0ZXIgdGhlIHpzdGQgcmVjaXBlIGhhcyBiZWVuIG1vdmVkIGZy
b20gbWV0YS1vcGVuZW1iZWRkZWQgdG8gb2UtY29yZS4gIFRoaXMgaXMgbm90IHRoZSBjYXNlIGZv
ciBkdW5mZWxsLCBzbyB0aGlzIGNoYW5nZSB3aWxsIHJlc3VsdCBpbiBmYWlsdXJlcyBmb3IgYnVp
bGRzIHRoYXQgZG8gbm90IGluY2x1ZGUgbWV0YS1vcGVuZW1iZWRkZWQuDQoNClNvIHRoaXMgcGF0
Y2ggaXMgbm90IHN1aXRhYmxlIGZvciBkdW5mZWxsIHVubGVzcyB0aGUgY29tbXVuaXR5L3N0ZWVy
aW5nIGNvbW1pdHRlZSBkZWNpZGUgdG8gYWxzbyBtb3ZlIHRoZSByZWNpcGUgaW4gZHVuZmVsbC4N
Cg0KU3RldmUNCg0KPg0KPiAgU1JDX1VSSSArPSAiZmlsZTovL09FVG9vbGNoYWluQ29uZmlnLmNt
YWtlIFwNCj4gICAgICAgICAgICAgIGZpbGU6Ly9lbnZpcm9ubWVudC5kLWNtYWtlLnNoIFwNCj4g
LS0NCj4gMi4yNi4yLkNpc2NvDQo+DQo+DQo+IA0KPg0K
