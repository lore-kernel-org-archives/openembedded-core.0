Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web12.5323.1616663862383294452
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 02:17:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=hJWnjwUH;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=13509; q=dns/txt;
  s=iport; t=1616663862; x=1617873462;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eGea2tWZqzr+ZoZDsqch371iAKpqu9eacXJhT7KTfO0=;
  b=hJWnjwUHNztPYULhdLaitzZobirT+qoCi+CIfLfiosf6YF1HhJMJ5eVx
   0iAfFYHzA6reMkwldGW55lrk1y5941ONFFRyqfCDfzqm3KrOoo/qH2eAE
   W7WbJ5Y89Sym7VBlMU9o/qdgn9sSbtHjnIuo+Sk/CoHY9G8GKFGNNo9ah
   E=;
X-IPAS-Result: =?us-ascii?q?A0AiAgD5U1xgmJldJa1aHgEBCxIMQIFFC4FTIy59WjYxC?=
 =?us-ascii?q?ogAA4U5h1prA4EJiSGEeYoRgS4UgREDVAsBAQENAQEdCwoCBAEBgRYBgzkCg?=
 =?us-ascii?q?XwCJTQJDgIDAQEBAwIDAQEBAQUBAQECAQYEFAEBAQEBAQEBhjYNhkQBAQEEA?=
 =?us-ascii?q?SYTBgEBCQEgDQEPAgEIEQQBARcBBxAhBwodCAIEAQ0FCIJoAYJVAy8BDqAgA?=
 =?us-ascii?q?ooedYEBM4MEAQEGgQYBLAGDZg0LghMJgTmCdopNJhyCC4ESQ4IkNT6CHkICA?=
 =?us-ascii?q?gGBQRoCBUECgwGCK4JKAVkBNAErIHthBgJwkEqpAlsKIYJliVmLcU2BGIVUg?=
 =?us-ascii?q?0iBPJ9Kj3SFEoIOiVKDFI8zDyOEMAIEAgQFAg4BAQaBVDiBW3AVgyQJRxcCD?=
 =?us-ascii?q?Y4fDAEMCRSDOYUUgV2DaHMCNgIGCgEBAwl8hCsPF4EOAYEOAQE?=
IronPort-PHdr: A9a23:TKprqxej1oQq2BQ/xwWtCK/KlGM/QYqcDmYuwpM6l7JDdLii9J3+P
 UvZoO9gl0LNQZ6zw/1BguvS9avnXD9I7ZWAtSUEd5pBH18AhN4NlgMtSMiCFQXgLfHsYiB7e
 aYKVFJs83yhd0QAHsH4ag7dp3Sz6XgZHRCsfQZwL/7+T4jVicn/3uuu+prVNgNPgjf1Yb57I
 Bis6wvLscxDiop5IaF3wRzM8RN1
IronPort-HdrOrdr: A9a23:rI3A2qiVBAzWoXmLW2OcRCCsgHBQX6tx3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+gsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmu5
 tIW5NVTOf9BV0St6nHySGzGdo43Z2j+Kenme/Rwx5WPH5XQotLhj0JbTqzOEtwWQVAGN4dHJ
 2T+sJIq1ObCAoqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+6LzGz2BACXzRThYoz6G
 StqX222oyPkdGejiXd2Wja8ohMlLLaqudrKcSQhqEuW07RoymyYoAJYczmgBkUp6WV5E8ugJ
 3wpX4bTrhOwlfwWk3wnhf3wQnn118Vmj/f4HuVm2Hqr8C8ZB9SMbs6uatjfhHU61UtsbhHuc
 ohtQ/0xvknby/opyjz68PFUBtnjCOP0AcfuNQOhH9SW5Z2Us42kaUj/VhYGJpFPCX25JFPKp
 gXMOjg5e1beV7fUnbBvmMH+q3UYl0PGH69Myw/k/3Q9wITsGFyzkMeysBatGwH7ogBR55N4P
 mBGrh0lZlVJ/VmLp5VNaMke4+aG2bNSRXDPCa5OlL8DpwKPHrLttre/Kg13ue3Y5YFpaFC2q
 jpYRd9jyofakjuAcqB0Nlg6RbWWliwWjzr14V464VmvKb/AJ7mKzeKRlxrs8bImYRbPuTrH9
 KIfL5GCf7qKmXjXaxT2RflZpVUIX4CFMIPvNI2XE+Pv9LLJoXmuvezSoeVGJPdVRIfHk/vCH
 oKWzb+YO9a6FqwZ3P+iB/NH3PhE3aPu65YIez/xaw+2YINPopDvkw+klKi/PyGLjVEr+gzdE
 t6K7X3j7OjqQCNjD/1xlQsHiAYIlde4b3mXX8PjxQNKVnIfbEKvMjaf3tT0nuBLhp2VNjXDw
 ZbulRy9cuMXtit7BFnL+jiHnORjnMVqn7PZYwbgLe/6cDsfY59EowrQ7VrFQLAFwV8nAFjrG
 srUn5dembvUhfVzYm1hp0dA+/SM+RmiACwOMhOtDb0rkOHv/wiQXMdQh+jWcOamhwVWjJRn1
 F9mpVv24aoqHKKEy8fiP59GEBQYG6XaYg2fTitVcFxoPTXXy1eCU2NnieXjhkvfHGCzTRjuk
 XRaQuOef/KBVJBvGt/yaiCyiIvSkytO2Rtd3t9rYpxUUPBt3ob657WWoODl02Md1AF3uYRdA
 vgXAJXCAZvy9ervSTlxQqqHWk6x5koI+zWBKkidbaWwX+2NIiUj8g9boxp1YcgO9b0vuARV+
 WDPweTMTPjEussnxeYv3A/JUBP2TQZuOKt3B3u926j2nEjRfLUPVR9XrkeSuvspFTMVrKN0J
 9ji8gysvb1OmLtasSewaWSazJYMBvcrSq3SO4vwKok954apf92H5PBVyHP22wC1BIiLN3snE
 dbWb9l+tn6S/lSVt1Xfzgc8ksildyJIkduugvqAvUmdVVoi3PAJduG77fBtLJHODzMmCLgfV
 2EtyFN9fbMWCWOkaQXDK89OmxaYkkx4nYKxpLLS6TATAGxM+1T9luzNXGwNKJHQK+eALMKs1
 J05cqLk+L/TVu25CnA+T9gZqRA/GasTZnsXEaCGetU/8e7PlrJiK2w+8K3hCr2Tzz+a0lwv/
 wwSWUAKsBYzj8lh8kr1yL3TKr9qEcsiUFf7jFqjUSF4Pnu3E7LWUVddRTEiZBXVyRJOneGjc
 7Z4fGVvU6NlQRtyN3GDgNMZdlAFNgbU5jvIypvIcYWuqS0/6BHuFU1XD4+S2gmiD782Ot63b
 C2nPXKMteSe0vVBQ==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,277,1610409600"; 
   d="scan'208";a="708942922"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 25 Mar 2021 09:17:36 +0000
Received: from mail.cisco.com (xbe-rcd-006.cisco.com [173.37.102.21])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 12P9HafN018748
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Thu, 25 Mar 2021 09:17:36 GMT
Received: from xfe-rcd-001.cisco.com (173.37.227.249) by xbe-rcd-006.cisco.com
 (173.37.102.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Thu, 25 Mar 2021
 04:17:35 -0500
Received: from xfe-rcd-002.cisco.com (173.37.227.250) by xfe-rcd-001.cisco.com
 (173.37.227.249) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Thu, 25 Mar 2021
 04:17:35 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (72.163.14.9) by
 xfe-rcd-002.cisco.com (173.37.227.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3
 via Frontend Transport; Thu, 25 Mar 2021 04:17:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HkVhjzcwLorNJFk7hqrk1ME0o00GxO7FD6dAeuRbrfhmIbRaYOfSetWYfkuN/d6KM1pe744UqN42lCGHQnGTc6Z5+lyFwdg1OOrpm2Y776HAlzydXQkmn+0NLnAogFHJECmBoSEj1LDyHzPbc/Ikxb9KsEfMyDhrNSpqpHBYywlVbE/c9kWyd2yvR2EWgUFNZ4/uSPD9phXshGbCkRPNgqeDQjHBh7MsBGncBEni4Vu7IXsj1YDoU6vstjv6IX1V1OZmLqU3VnmlmQ2fG8ZlvnLOAoQxjwyzyIWhVMuoRoY/AdHvAcKf+VO25ekKuJeXn7eKJYZ5ibJoGDCBv4AXyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUDnC99QH1Gf5at+hCqW6i9G9q6iY6ZuaZ2wEDKGtsQ=;
 b=ZWo+iPGRcdcV1MtAWQ6rKCS/34hPmBR95OpogttHmHScmVFWcjQ5AO9O+fjnMK1iK1QTM3CrST6Un5InJlhyDKu59ernCkV6YScuah+qBaWzp8TYJoCMO6zGAnephHnz8OQsRuWr8UmrdE3b5n7cBoO9Q811OXeBhkBgLQWBtaDtJax5EYktqdzxorrGwjoqzusr9ChzZLvjbUTJmqVW6KttErf7XN+e65+42WKamIRPjhSIbIMynVrJBTJEd6hcG7j6NTZPlwfaGVLPoTNxr1kZ8+hN5Nr9uK1Vc+z3xsMHWio7IBQgIV6LmOLQK2d8tEkN9SpppnrRcEFyO7HiQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cUDnC99QH1Gf5at+hCqW6i9G9q6iY6ZuaZ2wEDKGtsQ=;
 b=viCD1VsiFFaBnajaKyYMtvOConc5+gXkWeHTdt/Oes92YNKMJ17NPmv8zZm2226c0b3qHPUQLqKEz5hQKtPrlBBDiSHAZsMeNgZkLub/JHR5X1GbYrpkoYimZwUfxv0mGa6JACKD0VBuxSmVrNNTgUqvo2oXhN59Kf6b0rUaw84=
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by PH0PR11MB4998.namprd11.prod.outlook.com (2603:10b6:510:32::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 09:17:33 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::710a:816:d2a7:baf5]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::710a:816:d2a7:baf5%7]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 09:17:33 +0000
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: Luca Bocassi <luca.boccassi@gmail.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>,
        "bluelightning@bluelightning.org" <bluelightning@bluelightning.org>
Subject: Re: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to allow bootstrapping
Thread-Topic: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe
 to allow bootstrapping
Thread-Index: AQHXFoit9C+Szm6URU60QwgH5Y3aZaqUgg98
Date: Thu, 25 Mar 2021 09:17:33 +0000
Message-ID: <PH0PR11MB49023E90CAB5E58C2B603899D7629@PH0PR11MB4902.namprd11.prod.outlook.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>,<20210311150959.782186-1-luca.boccassi@gmail.com>
In-Reply-To: <20210311150959.782186-1-luca.boccassi@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [173.38.209.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94c58e2d-2885-489c-485c-08d8ef6ed2de
x-ms-traffictypediagnostic: PH0PR11MB4998:
x-microsoft-antispam-prvs: <PH0PR11MB4998BEB3038307BE8F92D1E0D7629@PH0PR11MB4998.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1TQv2wpOQbDZ3FnjuZqABMkJLGFQWuryxOZrr4z6lLk1VBFWBwZD0wxU75tt4YHXJm3KIw8ZNT1JhBOR235xffb+BRvvyLFisSXdmeThg4GmwYeyTT32ZvkjtJBRhtK+x9CIegpnF5SUix7koQqRr3EbujBpJ9asme9wbkAyNbdk+QpDoAOfeN5bpL8Xo0XaNXLrr8nxzrtvMt7mPLkEmjFi9HeL+PLpPu2caBDlMBESIbNU3W1O14W+HmSrtkPiVPSW2rsR6o3TsKL7VPgS4jgcRswJoxvN9f3jqpjfedc7U4OGeaRGxTAKebbj7+w4kL9M8eJtMLwUvMCjfE1xoyKpLmGljrcFHxNwsRkPCvKctQpS4quaD0N5CICxIWjhqe2UIws1TE5zvuwWopSqnQMXR/F+dY25qeEnFTfjo02ZW+6DRkqP3LKYBwuF7tlSbrlFAUU6bEMvKGDtclb3zCh1xuC1f+YUuyEjcoXmkIhlDF8bxrRTmfd1VV74fCzA8y+0LygAtBQPV3JfeBi7Q+eHAtYf3UY6FjPuPLmCW8DuzZ+6rqWNWu5vYsYjCADJGitLg3qLvW0yIEpzrVIAP9FMV5IksZ0ltxlOmqY3QMYXF9UM36XAQih3QXIFwaYz5ksyoq7cKMOTMEK0TfVK/bsGOBHa+bHMYkUW1cDIeIgP00ETLx9R6+O97pRKOjW8r7G2AkzzTXrE3nKto/2YZ+PUUPPEQwMN2tmqYBBQSzUmsDbE5RHgb1eU1LxDYguMLtTvVr0dCo5eGwHhVKro9g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(396003)(346002)(39860400002)(136003)(376002)(26005)(91956017)(83380400001)(66556008)(76116006)(8676002)(66946007)(64756008)(66446008)(66476007)(186003)(86362001)(8936002)(2906002)(7696005)(71200400001)(6506007)(316002)(53546011)(33656002)(966005)(478600001)(38100700001)(110136005)(5660300002)(52536014)(30864003)(4326008)(54906003)(9686003)(55016002)(20673002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?94kIIKosYiVWOjqZ9GWjztKm6+FpHNNZnsks5obSn/P99hmVqVLewemUN2yF?=
 =?us-ascii?Q?sCP2IaORszyIMGimMgohOa0P7S3WMU8sfQqKs0KlDDPJgwFa07NLi50YnEWo?=
 =?us-ascii?Q?7b5CS6I1rqrQ0Iz04bSTNZ7VNIhB8r3TtB95hsUUd85+HD5ZTfizB6ePxZ8I?=
 =?us-ascii?Q?z3vRCVO6oq3DSZxfrkg/amwPjX9VpwWMeptrYzjtyzzDHs3cYd/E5akHDxSr?=
 =?us-ascii?Q?Gn+a9ZaGNXHygYtwt4CfvGN1rTSwxqpm/0xp2IsfFX+It0dtRGY81cVT4Cbz?=
 =?us-ascii?Q?WwhxJKlvdTmY8CJDnd8DA2ubnSoWL6rwgTP6Vu9P+FxK1BZ/skRm9km9/pYk?=
 =?us-ascii?Q?ZmecNCraNughaWFBdkMRtDUre0zixZvBhn466q/ekryEZ8XFRRgYe56v3LUy?=
 =?us-ascii?Q?l2XoaxkUFTSzDGTIBeogOq9RiTMeOuQw1Wa2g1bDNgjJq0B9SWtHv6D1Ic04?=
 =?us-ascii?Q?NipcZnkdufzIsKR0iPEoJzUZrxwjCmmzAFBUII8NLZSVpI9MIJCqaBdPskMt?=
 =?us-ascii?Q?7/P6uM21TbXgbl6/Fe2enoBUd9Jk9ANb3r8S/KRmnLTtbBMaue6RPcGf2wbP?=
 =?us-ascii?Q?EhjahAuPJ6NGmZdcnJfWyG4ih8IU458nTK7eDslezAUJFtJQXowWurMoMfBq?=
 =?us-ascii?Q?HWP8DZpjx1NGIZNLK8Gbrye0945Lhpu3E9MQ5o7fLMLCdJmIpsBa4OX9Sdn3?=
 =?us-ascii?Q?iNC8zkc2+ahR7BWk8nNYtVDYmOhfh1OZMcFwL6BE+7nYGiQGAOyinrLduIL7?=
 =?us-ascii?Q?M4eZOVyCC7iK5G2FHec9t4zqRGSW6eOm7qUZLRAeO4oeBvifAm+6yGo21kwg?=
 =?us-ascii?Q?Yi7cYvC5idIPvY8Mc7chG7HcQFv3HtvITdeWG4kDGmqf4noJUG8Jf6e9P51T?=
 =?us-ascii?Q?QjPmvfQHmjpDmby2BRWw+hS1XDG3ktxwiiw3HGj4GwXn6SQkuL1IydJp0Tde?=
 =?us-ascii?Q?Yuigo1os8R6iKjjRO8vFJcFpHXFfhVzaR5S7NULoByXrAzG+1Wii+GB4WSwe?=
 =?us-ascii?Q?aUk34Sv7vg5bVdBD3LK5qfNKy4UMS7EfGkPVWq4PENbbpbkuSM5OBaEc2Jd4?=
 =?us-ascii?Q?ygQ0z9ZpTPNkWjW8bGUaP6hdzSKbeAL8x3JAmXkYVU9X6yRTuCGJsk0LJzeA?=
 =?us-ascii?Q?meSUeiOnXD1Oa7p5ViW7ZfkhvlUCU0fBc/+u4tSbFw6t3ndaDRCFsUvVM3RR?=
 =?us-ascii?Q?JcPQwLd4bs/VZZ+5hoK1mEJNRejmJczie7eUsovQlnZ/nZvliQm31N2eUyVm?=
 =?us-ascii?Q?qEtS5M722WDBnlIwVO30MWJFvW83GvsY7IFesFnTv3E/9MPwxg0iINWP6/3M?=
 =?us-ascii?Q?cVE=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c58e2d-2885-489c-485c-08d8ef6ed2de
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 09:17:33.4705
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x+CFdn5SkogOv0Fs9kHxq5GQBe0M8/D+pEOeWVAfYlUsR5cWAkMBf+iLSK1hSCrqnHHspR4GX/pqAO1FAsU+2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4998
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.21, xbe-rcd-006.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Could you look into this warning.

WARNING: util-linux-2.36.2-r0 do_package_qa: QA Issue: util-linux-dev rdepe=
nds on util-linux-libuuid-dev, but it isn't a build dependency? [build-deps=
]

https://autobuilder.yoctoproject.org/typhoon/#/builders/61/builds/3226

Regards,
Oleksiy

________________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Luca Bocassi <luca.boccassi@gmail.com>
Sent: Thursday, March 11, 2021 17:09
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org; bluelightning@bluelightning.org
Subject: [OE-core] [PATCH v11] util-linux: split uuid in separate recipe to=
 allow bootstrapping

From: Luca Boccassi <luca.boccassi@microsoft.com>

Recently util-linux gained an (optional) build dependency on libcryptsetup.
But libcryptsetup build-depends on util-linux for blkid (optional, can be d=
isabled)
and uuid (mandatory).
Split out util-linux-uuid in a different recipe to break the cycle.

https://github.com/karelzak/util-linux/pull/898

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v1: util-linux 2.35 is not out yet, but I'd like to get the preparatory wor=
k
    underway as I'm not sure if this is the best approach or if there are
    alternatives. Suggestions and comments very welcome. Thanks!
v2: changed packages names to reflect old ones (eg: libuuid1 -> util-linux-=
libuuid)
    and leave uuid build enable in main recipe to allow for uuidgen build t=
o happen,
    as it does not have its own autoconf switch. Delete the library manualy=
 from
    the main recipe after build instead, and add dependency.
    Might help to break loop python3 -> util-linux -> libselinux -> python3=
, as it's
    only libuuid that is needed, see https://lists.yoctoproject.org/g/yocto=
/message/47570
v3: rebased and refactored to have a common util-linux.inc file
v4: added RDEPENDS on util-linux-libuuid on various packages to fix QA warn=
ings
v5: remove RDEPENDS and instead have util-linux RDEPEND on util-linux-uuid.
    Removed PACKAGES_remove and instead filter out libuuid via the package =
generation
    regex.
    Rebased on util-linux 2.36.2.
v6: install libuuid.a in libuuid-dev
    change rdepends on uuid to use binary package rather than source
    add rdepends on uuid-dev to libuuid-dev
    remove rprovides of libuuid-dev from uuid-dev
v7: do not use '_append' for RDEPENDS, as it is not supported by BBCLASSEXT=
END, use
    simply '+=3D'
v8: added missing libuuid-staticdev package
    remove libx32/libuuid* too
v9: set RECIPE_MAINTAINER_pn-util-linux-uuid, same value as RECIPE_MAINTAIN=
ER_pn-util-linux
v10: removed DEBIAN_NOAUTONAME
     remove lib64/libuuid* too
v11: use ${D}${base_libdir}/libuuid* instead of manually specifying /lib|/l=
ibx32|/lib64

 meta/conf/distro/include/maintainers.inc      |  1 +
 .../util-linux/util-linux-uuid_2.36.2.bb      | 20 +++++++
 meta/recipes-core/util-linux/util-linux.inc   | 41 +++++++++++++
 .../util-linux/util-linux_2.36.2.bb           | 57 +++++--------------
 4 files changed, 77 insertions(+), 42 deletions(-)
 create mode 100644 meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
 create mode 100644 meta/recipes-core/util-linux/util-linux.inc

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/in=
clude/maintainers.inc
index 3d8e3d5de0..c6a97bc280 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -720,6 +720,7 @@ RECIPE_MAINTAINER_pn-update-rc.d =3D "Ross Burton <ross=
.burton@arm.com>"
 RECIPE_MAINTAINER_pn-usbinit =3D "Alexander Kanavin <alex.kanavin@gmail.co=
m>"
 RECIPE_MAINTAINER_pn-usbutils =3D "Alexander Kanavin <alex.kanavin@gmail.c=
om>"
 RECIPE_MAINTAINER_pn-util-linux =3D "Chen Qi <Qi.Chen@windriver.com>"
+RECIPE_MAINTAINER_pn-util-linux-uuid =3D "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-util-macros =3D "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-v86d =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-vala =3D "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb b/meta/=
recipes-core/util-linux/util-linux-uuid_2.36.2.bb
new file mode 100644
index 0000000000..65e4d23b7e
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux-uuid_2.36.2.bb
@@ -0,0 +1,20 @@
+# To allow util-linux to optionally build-depend on cryptsetup, libuuid is
+# split out of the main recipe, as it's needed by cryptsetup
+
+require util-linux.inc
+
+inherit autotools gettext pkgconfig
+
+S =3D "${WORKDIR}/util-linux-${PV}"
+EXTRA_OECONF +=3D "--disable-all-programs --enable-libuuid"
+PACKAGES =3D "util-linux-libuuid util-linux-libuuid-dev util-linux-libuuid=
-staticdev util-linux-libuuid-dbg"
+FILES_util-linux-libuuid =3D "${libdir}/libuuid.so.*"
+FILES_util-linux-libuuid-dev =3D "${libdir}/libuuid.so ${includedir} ${lib=
dir}/pkgconfig"
+FILES_util-linux-libuuid-staticdev =3D "${libdir}/libuuid.a"
+FILES_util-linux-libuuid-dbg =3D "/usr/src ${libdir}/.debug"
+
+do_install_append() {
+       rm -rf ${D}${datadir} ${D}${bindir} ${D}${base_bindir} ${D}${sbindi=
r} ${D}${base_sbindir} ${D}${exec_prefix}/sbin
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-cor=
e/util-linux/util-linux.inc
new file mode 100644
index 0000000000..b4f817ed82
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -0,0 +1,41 @@
+SUMMARY =3D "A suite of basic system administration utilities"
+HOMEPAGE =3D "https://en.wikipedia.org/wiki/Util-linux"
+DESCRIPTION =3D "Util-linux includes a suite of basic system administratio=
n utilities \
+commonly found on most Linux systems.  Some of the more important utilitie=
s include \
+disk partitioning, kernel message management, filesystem creation, and sys=
tem login."
+
+SECTION =3D "base"
+
+LICENSE =3D "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
+LICENSE_${PN}-libblkid =3D "LGPLv2.1+"
+LICENSE_${PN}-libfdisk =3D "LGPLv2.1+"
+LICENSE_${PN}-libmount =3D "LGPLv2.1+"
+LICENSE_${PN}-libsmartcols =3D "LGPLv2.1+"
+LICENSE_${PN}-libuuid =3D "BSD-3-Clause"
+
+LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D0fd5c050c6187d2bf0a449=
2b7f4e33da \
+                    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
+                    file://Documentation/licenses/COPYING.GPL-2.0-or-later=
;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://Documentation/licenses/COPYING.LGPL-2.1-or-late=
r;md5=3D4fbd65380cdd255951079008b364516c \
+                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=
=3D58dcd8452651fc8b07d1f65ce07ca8af \
+                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;=
md5=3D263860f8968d8bafa5392cab74285262 \
+                    file://libuuid/COPYING;md5=3D6d2cafc999feb2c2de84d4d24=
b23290c \
+                    file://libmount/COPYING;md5=3D7c7e39fb7d70ffe5d693a643=
e29987c2 \
+                    file://libblkid/COPYING;md5=3D693bcbbe16d3a4a4b37bc906=
bc01cc04 \
+                    file://libfdisk/COPYING;md5=3D693bcbbe16d3a4a4b37bc906=
bc01cc04 \
+                    file://libsmartcols/COPYING;md5=3D693bcbbe16d3a4a4b37b=
c906bc01cc04 \
+"
+
+FILESEXTRAPATHS_prepend :=3D "${THISDIR}/util-linux:"
+MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
+BPN =3D "util-linux"
+SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP=
}.tar.xz \
+           file://configure-sbindir.patch \
+           file://runuser.pamd \
+           file://runuser-l.pamd \
+           file://ptest.patch \
+           file://run-ptest \
+           file://display_testname_for_subtest.patch \
+           file://avoid_parallel_tests.patch \
+           "
+SRC_URI[sha256sum] =3D "f7516ba9d8689343594356f0e5e1a5f0da34adfbc890234377=
35872bb5024c5f"
diff --git a/meta/recipes-core/util-linux/util-linux_2.36.2.bb b/meta/recip=
es-core/util-linux/util-linux_2.36.2.bb
index 19950a2726..50a70cd452 100644
--- a/meta/recipes-core/util-linux/util-linux_2.36.2.bb
+++ b/meta/recipes-core/util-linux/util-linux_2.36.2.bb
@@ -1,46 +1,8 @@
-SUMMARY =3D "A suite of basic system administration utilities"
-HOMEPAGE =3D "https://en.wikipedia.org/wiki/Util-linux"
-DESCRIPTION =3D "Util-linux includes a suite of basic system administratio=
n utilities \
-commonly found on most Linux systems.  Some of the more important utilitie=
s include \
-disk partitioning, kernel message management, filesystem creation, and sys=
tem login."
-
-SECTION =3D "base"
-
-LICENSE =3D "GPLv2+ & LGPLv2.1+ & BSD-3-Clause & BSD-4-Clause"
-LICENSE_${PN}-libblkid =3D "LGPLv2.1+"
-LICENSE_${PN}-libfdisk =3D "LGPLv2.1+"
-LICENSE_${PN}-libmount =3D "LGPLv2.1+"
-LICENSE_${PN}-libsmartcols =3D "LGPLv2.1+"
-LICENSE_${PN}-libuuid =3D "BSD-3-Clause"
-
-LIC_FILES_CHKSUM =3D "file://README.licensing;md5=3D0fd5c050c6187d2bf0a449=
2b7f4e33da \
-                    file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 =
\
-                    file://Documentation/licenses/COPYING.GPL-2.0-or-later=
;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
-                    file://Documentation/licenses/COPYING.LGPL-2.1-or-late=
r;md5=3D4fbd65380cdd255951079008b364516c \
-                    file://Documentation/licenses/COPYING.BSD-3-Clause;md5=
=3D58dcd8452651fc8b07d1f65ce07ca8af \
-                    file://Documentation/licenses/COPYING.BSD-4-Clause-UC;=
md5=3D263860f8968d8bafa5392cab74285262 \
-                    file://libuuid/COPYING;md5=3D6d2cafc999feb2c2de84d4d24=
b23290c \
-                    file://libmount/COPYING;md5=3D7c7e39fb7d70ffe5d693a643=
e29987c2 \
-                    file://libblkid/COPYING;md5=3D693bcbbe16d3a4a4b37bc906=
bc01cc04 \
-                    file://libfdisk/COPYING;md5=3D693bcbbe16d3a4a4b37bc906=
bc01cc04 \
-                    file://libsmartcols/COPYING;md5=3D693bcbbe16d3a4a4b37b=
c906bc01cc04 \
-"
+require util-linux.inc

 #gtk-doc is not enabled as it requires xmlto which requires util-linux
 inherit autotools gettext manpages pkgconfig systemd update-alternatives p=
ython3-dir bash-completion ptest
-DEPENDS =3D "libcap-ng ncurses virtual/crypt zlib"
-
-MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
-SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/v${MAJOR_VERSION}/${BP=
}.tar.xz \
-           file://configure-sbindir.patch \
-           file://runuser.pamd \
-           file://runuser-l.pamd \
-           file://ptest.patch \
-           file://run-ptest \
-           file://display_testname_for_subtest.patch \
-           file://avoid_parallel_tests.patch \
-           "
-SRC_URI[sha256sum] =3D "f7516ba9d8689343594356f0e5e1a5f0da34adfbc890234377=
35872bb5024c5f"
+DEPENDS =3D "libcap-ng ncurses virtual/crypt zlib util-linux-uuid"

 PACKAGES =3D+ "${PN}-swaponoff"
 PACKAGES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'pylibmount', '${PN}-=
pylibmount', '', d)}"
@@ -87,8 +49,9 @@ python util_linux_binpackages () {
 # we must execute before update-alternatives PACKAGE_PREPROCESS_FUNCS
 PACKAGE_PREPROCESS_FUNCS =3D+ "util_linux_binpackages "

+# skip libuuid as it will be packaged by the util-linux-uuid recipe
 python util_linux_libpackages() {
-    do_split_packages(d, root=3Dd.getVar('UTIL_LINUX_LIBDIR'), file_regex=
=3Dr'^lib(.*)\.so\..*$',
+    do_split_packages(d, root=3Dd.getVar('UTIL_LINUX_LIBDIR'), file_regex=
=3Dr'^lib(?!uuid)(.*)\.so\..*$',
                       output_pattern=3D'${PN}-lib%s',
                       description=3D'${PN} lib%s',
                       extra_depends=3D'', prepend=3DTrue, allow_links=3DTr=
ue)
@@ -141,6 +104,7 @@ PACKAGECONFIG[pylibmount] =3D "--with-python=3D3 --enab=
le-pylibmount,--without-pytho
 PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readline"
 # PCRE support in hardlink
 PACKAGECONFIG[pcre2] =3D ",,libpcre2"
+PACKAGECONFIG[cryptsetup] =3D "--with-cryptsetup,--without-cryptsetup,cryp=
tsetup"

 EXTRA_OEMAKE =3D "ARCH=3D${TARGET_ARCH} CPU=3D CPUOPT=3D 'OPT=3D${CFLAGS}'=
"

@@ -165,7 +129,10 @@ RRECOMMENDS_${PN}_class-nativesdk =3D ""
 RDEPENDS_${PN}_class-native =3D ""
 RDEPENDS_${PN}_class-nativesdk =3D ""

-RPROVIDES_${PN}-dev =3D "${PN}-libblkid-dev ${PN}-libmount-dev ${PN}-libuu=
id-dev"
+RDEPENDS_${PN} +=3D " util-linux-libuuid"
+RDEPENDS_${PN}-dev +=3D " util-linux-libuuid-dev"
+
+RPROVIDES_${PN}-dev =3D "${PN}-libblkid-dev ${PN}-libmount-dev"

 RDEPENDS_${PN}-bash-completion +=3D "${PN}-lsblk"
 RDEPENDS_${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs grep ip=
route2 kmod mdadm procps sed socat which xz"
@@ -234,6 +201,12 @@ do_install_append_class-native () {
        rm -f ${D}${base_bindir}/kill
 }

+# dm-verity support introduces a circular build dependency, so util-linux-=
uuid is split out for target builds
+# Need to build libuuid for uuidgen, but then delete it and let the other =
recipe ship it
+do_install_append () {
+       rm -rf ${D}${includedir}/uuid ${D}${libdir}/pkgconfig/uuid.pc ${D}$=
{libdir}/libuuid* ${D}${base_libdir}/libuuid*
+}
+
 ALTERNATIVE_PRIORITY =3D "80"

 ALTERNATIVE_LINK_NAME[blkid] =3D "${base_sbindir}/blkid"
--
2.29.2

