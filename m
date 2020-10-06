Received: from NAM10-DM6-obe.outbound.protection.outlook.com (NAM10-DM6-obe.outbound.protection.outlook.com [40.107.93.73])
 by mx.groups.io with SMTP id smtpd.web11.950.1602000448508893472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2020 09:07:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=ClTl7xc+;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.93.73, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoExaj0yAGZR81rJqqgz2uGDFT9MmRIwBqm5kPuFrgaxcGaOf9N7NjHX1WbUeunQGpBoT4S8qRkaCB0vBNNtkLPLbYvfSnZxc+0eEc69XTZVMfqtxqMVB9Rghb6cAuMcA0570k3N4LPAxV+sZRAhgr1kVQ4XNrSD0XtWDmgmAGuhcmUhPWb2es1CV9f6rWG0aakwBmIG5uzCEi/r3+Qp1QdiYONuy/85Abj9ArrOFX5SU7LzOh0JT5umnPc8ehSbmFkFunYC8PLD1eIBt/PbrP7vJXtBQ28Re2s936p2WsoO52iwtn3wT3xQjTWhd8y/Y+xYSKJ6FmVAvdtkoXk18g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sRM4sNU+dDXSrARdfEJlvFMLwLzCMQubimH9kkO7hM=;
 b=ET4IoyI+UfsYH91U0ipWLsDN+fvwz/nKlP5b+TsIO8LMy2jhKK5PG++00PejCi188bVQO5KNFwd/hdR+vOCWFgi+sbj4PKimGdJLhvIB2O0d9VO+3KPCdap9VzcwHO+b0MYjR3TRk+x3a0a2CHk9z+B8DFEev5kfucrTC/oXpcPb0To5Va1pqNn7q3vROC9Dr62edxeCCbEjJN95s3hqAHgwWP28eCUeGXGObXvB3h88k30Y6yR6tS3PfaG+j3jCAFWGUCEetN5OUtmKJtISehse6sJDHdwl02Pso1dmO954wGVTh7YwaZCi2tB6XKaGm5GPlUIjm6ps/1NTadblYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+sRM4sNU+dDXSrARdfEJlvFMLwLzCMQubimH9kkO7hM=;
 b=ClTl7xc+dntQu+ThNlx5m7eHm52K7SgfVEpMI4RIKFOnNiZ5L2eW0WUKFueJ6azzDKXUdN+2r8atIx5etCecHQ9fNwKpmcehujn1lFshJEodmmV668fQu8e633jxnovWzIsrBImDKUdwgYYntKmEg55eRZU5ZrZWLYJoh0D2lX3BEpLLk/y1phfdOYs7zB3AyVJUkPwN+BARuqOAnuqacT1g6Uz71Se1iSZWIKKITy1CspRhANR91Kzi0j3BMKX0oTARqa1a5Uol+lNV4LYdNdYs3pPkLpxadf8wvPb7ZC9jlPSRAVDXJK+7I5feoF6RY4h/SquH+SExFgsAUUSHqQ==
Received: from SN1PR12MB2480.namprd12.prod.outlook.com (2603:10b6:802:22::21)
 by SA0PR12MB4542.namprd12.prod.outlook.com (2603:10b6:806:73::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.35; Tue, 6 Oct
 2020 16:07:27 +0000
Received: from SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d]) by SN1PR12MB2480.namprd12.prod.outlook.com
 ([fe80::d9f4:7430:8c64:d2d%7]) with mapi id 15.20.3433.045; Tue, 6 Oct 2020
 16:07:27 +0000
From: "Chris Laplante" <chris.laplante@agilent.com>
To: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/4] staging: Ensure cleaned dependencies are added
Thread-Topic: [OE-core] [PATCH 1/4] staging: Ensure cleaned dependencies are
 added
Thread-Index: AQHWlZygHIczyD9sPkqHZe4YWbbZnKmKygsw
Date: Tue, 6 Oct 2020 16:07:27 +0000
Message-ID: 
 <SN1PR12MB2480083B16B34A4A0C9119978B0D0@SN1PR12MB2480.namprd12.prod.outlook.com>
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=agilent.com;
x-originating-ip: [2607:fb90:18d1:d4bd:44c6:6087:ebb4:b521]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc5a93ea-6741-441c-5774-08d86a11ebc8
x-ms-traffictypediagnostic: SA0PR12MB4542:
x-microsoft-antispam-prvs: 
 <SA0PR12MB4542ACADCB10CBF2D3C781188B0D0@SA0PR12MB4542.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 GTgr9tQpSpenmcMNCSLU3VT3rzro86xXNJ5lAVmpIadlPCKmTzg4TJbe92UWlgIW452f18dhniSLznLPcWT38OAF1b66Z/8VTG1SpDjD+jFPNRQ2oM/CIq+E2bJ63xOsaiIII4xEshwARGGQM7x5wxWULE1wCgHcL8548nNXKN2TZ9RpHCfuT9MQEEYbiwQHtvOX8VCKf5/NwC6AChWjIj6vP/XNKWmKiYbX4/QMkK/FrpUv+UKYZVMbCE2lvNGw/qb4hiV3seUqBzUZ4sM1PrMWu4TqaCI/Jk6Q65AtXm9TAexo6Y/6No0pR3PBdT89+ij4Y1jMnMp9vFaObi883IqAMCt8scXSBcu7Yh4ZjAtkY5BtM6ctOWvzOLt/1Dfc
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(366004)(376002)(346002)(29502001)(4744005)(55016002)(2906002)(52536014)(5660300002)(6506007)(478600001)(9686003)(33656002)(8936002)(110136005)(76116006)(7696005)(316002)(186003)(64756008)(8676002)(66556008)(66476007)(66446008)(71200400001)(86362001)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 kzjrPg1oAYaS0Y7A1nRtNAQS9DDTRjvlT8Vggw4Anh4Jxr/bav/W0PSpIT3DPLU8MJz6tQxDEiJrOhtuA7iZ6tnfi5AL7A3mU5aOeiQ30FW2yxxJ0vK7jpm7IqGasbXI5wQi18bPjJY52h/pApJ17inaJJ7vnbLShuP7vgtuMdPK49ws7XnBBpcHevaOSMnye3BJsVebuZ6Mj6OFeogFFF4IqyCQLqfpbNpMtIg2wXQLqOo30IGiUN9d7sBIHw2l6HvvGYOacS/CdXLVGQQSBVUutdUsjbrV7KW5pyyMDYTrWa9JgUcatRpTWUYOlwTdBuzaSIxYRVL/wwjDkQ2+eE4GxauzcFHuceYqeIy0SDBlGXEHvct8u7XdILRGCQ2MB/7LLCWQsIZ4BAAekRGJ4jsojIkxRXU1H5B9fArBC8gCsGyXkgXdfnM4iMTgEhYFlLscmLRiKeIUhesqYySlmn2SNVj5eCnF/wEuz+fIPE7anFbu0IJ51ELZIctqeh3lzC4s2F/bARh066CZ3sbaIUTC3v8Mp0e2QHSC3/Y4459Odj7GCLaFsLlN+WFMRa/neQE8ziqL8dKcWA7JcCGbe5JOAaa7cJXS0fvsRmb93+VeW5+EztxjuBAgNg/pr53Cp5CwvJzLrmndtdoomvH6IxxgJcNcqYs9RV92l6730uhjkSFxxjgbHw1NkvbQGkelvO3TEh4oKJxR81qjwe8jhw==
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5a93ea-6741-441c-5774-08d86a11ebc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2020 16:07:27.4659
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5UMNsONq7C5PlXCNcgqWTFUXZs02cvu+FSfWOIYREoWwnWQptaNH5sRYwaoQdNJcF3LZdifD+7xcvPFbIQbwkZ6PWVAbOif6SZdOTtJyXl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4542
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

> Most recipe-sysroot dependencies are handled by these prefuncs. "configur=
e"
> is special with a decidated task, prepare_recipe_sysroot which runs
> beforehand.
>=20
> do_prepare_recipe_sysroot does not have to be run before/after
> fetch/unpack/patch, they're independent tasks. If fetch/unpack/patch have
> sysroot dependencies and those tasks rerun, stale items from the sysroot
> could be uninstalled and since prepare_recipe_sysroot doesn't re-run, the=
y
> could be missing by the time configure runs.
>=20
> Fix this by adding the prefunc for do_configure which would ensure the
> sysroot is in a good state.

Is this patch something that should be backported to zeus and friends?

Chris
