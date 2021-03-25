Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.web08.811.1616685654334892922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 08:20:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=RL9E9acg;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=35021; q=dns/txt;
  s=iport; t=1616685654; x=1617895254;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=SAbBxoyaPAWe9RjD/6am4z3EveSuCJtDqAC/v13wKUg=;
  b=RL9E9acgkUp+QK8Ou94YF8pfYTo+7n+srZApgG6E8fgv7Rc23+0DeokT
   Q8EgCIWSs3+s+xOAv0ajSFnM47TaZv9zUIpEZrRXcSB0/YdAZBHIq5SAC
   blFUxOIDB/lFU7TB/RFCKClcdTrXf56sH0WzUnsgnIGrNJHXQDjhwkGao
   Q=;
IronPort-PHdr: =?us-ascii?q?A9a23=3AYXqZRxDROPGYAxWWNn8sUyQVlBdPi93PFgcI9?=
 =?us-ascii?q?poqja5Pea2//pPkeVbS/uhpkEShdZra7f5eivTbqebrXmlTqZqCsXVXdptKW?=
 =?us-ascii?q?ldFjMgNhAUvDYaDDlGzN//laSE2XaEgHF9o9n22Kw5ZTcD5YVCBvXy04SQTB?=
 =?us-ascii?q?BjlcwFyI7e9Fovblc/i0ee09tXaaBlJgzzoZ7R0IV22oAzdu9NQj5FlL/M6y?=
 =?us-ascii?q?wDCpT1DfOEFrV4=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ASlxVQq7RN/9sF4h5OgPXwbGFI+orLtY04l?=
 =?us-ascii?q?Q7vn1ZYSd+NuSFisGjm+ka3xfoiDAXHEotg8yEJbPoexLh3LZPy800Ma25VA?=
 =?us-ascii?q?fr/FGpIoZr8Jf4z1TbdRHW3tV2kZ1te60WMrLNJHBxh8ri/U2cG9Ev3NGI/M?=
 =?us-ascii?q?mT9Jvj5l1qShxnbLwlyg9/BBqSHEEefng4ObMSEp2A6s1b4we6cXMMYcihQl?=
 =?us-ascii?q?UDVe7Pp9rE/aiWLyIuLRgh9QWIkHeU+Kf3eiLokSs2fhFu5fMZ8WbDmxHk/a?=
 =?us-ascii?q?nLiZGG4zLVymO71eUvpPLP0d1Gbfb87/Q9CjKpsQqwYZQkZrvqhkFJnMiKyH?=
 =?us-ascii?q?IH1ObBuA0hOcMb0QKRQkiQrQH20wftlBYCgkWSsmOwunforcznSD9SMaMo7u?=
 =?us-ascii?q?g1Hmq7migdlepx365R02WSu4A/N2K7oA3G+9PKWxt2/3DExkYKrO8Jg3RTFa?=
 =?us-ascii?q?sYZbNBxLZvhX99LZYaECr2rL0gCellZfusgsp+TFXyVQG8gkBfhPiXGlgjFB?=
 =?us-ascii?q?aPRUYP/uaP1SJNoXx/x0wEgOQCg3Yp7vsGOtl5ztWBFp4tuKBFT8cQY644Lv?=
 =?us-ascii?q?wGW9GLBmvERg+JGH6OIG7gCLoMNxv22t3KyYRwwNvvVI0DzZM0lpiEekhfr3?=
 =?us-ascii?q?QOd0XnDtDL+5FX7BbXQiGYUS72ws9To7h104eMBobDAGmmchQDgsGgq/IQDo?=
 =?us-ascii?q?nwQPCoIq9bBPflMC/gAoBM0wriW4RDKHUXXcEP0+xLH26mk4buEMnHp+bbeP?=
 =?us-ascii?q?HcKP7GCjA/QF7yBXMFQXzyKax7nweWc069pCKUd2Lme0T58541OrPd5fIvxI?=
 =?us-ascii?q?8EMZAJtgAUjF++99yaMDEqiN1xQGJOZJfc1o+rr2i/+mjFq09zPABGM0pT6L?=
 =?us-ascii?q?L8F3VQpQELNEvwea0Zu8qWfH1T2HfvHG47c+rmVCpk43hn86O+KJKdgQo4Dc?=
 =?us-ascii?q?i8D26ch3wP4G6RQ4wEga2F78f9cpY+BpIrMZYBTDnjJlhQo0JHuW1DYAgLSg?=
 =?us-ascii?q?vjDTvok7yil4FRLvrYbcNAjACiJtN0pXrTuV6Hn9wmQmIWUleVIJaqqDdrYw?=
 =?us-ascii?q?ARp1Vqt4cDnbKLmF+UWBUCqdV9FGcJVUO6L/ZtCh+faIBdh7bxETsAPFuitH?=
 =?us-ascii?q?i9kBE8em3j6kMIoHfuRBfkIs3jMx56pm1S1Lrs/RdScGiQFngAN0xSgMlaCX?=
 =?us-ascii?q?nMvGp13KuwQpeLl0GValcE34gmQWv4SDMPPwJjwM223haJmDCEUW4r3IkqI/?=
 =?us-ascii?q?a1NsVST5jDnnyqM4GGjqcAArtd+4tkLsnntqsRXfuYYBL9FkKzN8o5nwiUrG?=
 =?us-ascii?q?0iIi96tT0tlu7pwgTs6AGDrTYCKOuXJFRtXLcAJd6Aq2DiWvaTyZ18ydY4p/?=
 =?us-ascii?q?G5PGm0atmIz8jsHnV+AwKWpW69VOczr59I+ao0qbtoBpHeFSLSy2sv5mRIEO?=
 =?us-ascii?q?7k0EcFBKhr6rHIPYFiO8QUZiJC51Is0NCCNlEivAD6CvI3FGtdwkPzLpeM+f?=
 =?us-ascii?q?7FuLAvCkqOqE/rNV6T/zZU8v3FUyGAvIRqQp4YMCBTcgwx+X5i9OSNe8nMEw?=
 =?us-ascii?q?2sbfhE50f/PXmncrNRIZL1VYk4v1J/+ZWPkOCWfSajh1yVsjt/P65U82GoBc?=
 =?us-ascii?q?m1GxmBHOZU89q8fVSA65HalfKbnXPyU3+8bU9dmIhOMUoXZc5HgiM5jII23j?=
 =?us-ascii?q?OpI5aH1H4Ngh9b+3V/ilXp2oK6+2/VEkFNLB3BjvxtLEtuG2nNid6A7POR23?=
 =?us-ascii?q?v86iVUwJXPFE9feddVBtgbJ7KHWxtGOIwXp76n/60mnyRFblMvFgcH+UPA49?=
 =?us-ascii?q?8=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CqBQCzqVxg/5tdJa1aHAEBAQEBAQc?=
 =?us-ascii?q?BARIBAQQEAQFAgVCBUykoB3ZaNjEKiAADhTmHWmsDgQmJIYR5ihGBQoERA08?=
 =?us-ascii?q?FCwEBAQ0BAR0NCAIEAQGBFgFxgkgCgXwCJTgTAgMBAQsBAQUBAQECAQYEcYV?=
 =?us-ascii?q?hDYZEAQEBBAEZAQwTBgEBCQEuDwIBCBEDAQEBHxAhBwodCAIEARIIEoJXglU?=
 =?us-ascii?q?DAywBDqAfAooedYEBM4MEAQEGgQYBLAGDawwBC4ITCYE5gnaKTSYcgguBEkO?=
 =?us-ascii?q?CJDU+gh4rFwEDFoENFAwBGAKDSYIrgUMMXB8BASwtGgcTARMWAlANNDsEExk?=
 =?us-ascii?q?BSC+QJRsGBItCgx2aI1sKIYJliVmHFoRbgWWFVINIgTyBdJdOhgiVBoIOiVK?=
 =?us-ascii?q?DFI8NNQ0NhDkCAgICBAUCDgEBBoFrI4FZcBWCcAEBATEJRxcCDY4fDAEVgQE?=
 =?us-ascii?q?BCVqBaIJkgjCBPSCDaHMCCS0CBgoBAQMJfIQpgTYBMV0BAQ?=
X-IronPort-AV: E=Sophos;i="5.81,277,1610409600"; 
   d="scan'208";a="876469046"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 25 Mar 2021 15:20:51 +0000
Received: from mail.cisco.com (xbe-rcd-003.cisco.com [173.37.102.18])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 12PFKqri003233
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Thu, 25 Mar 2021 15:20:52 GMT
Received: from xfe-rcd-003.cisco.com (173.37.227.251) by xbe-rcd-003.cisco.com
 (173.37.102.18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Thu, 25 Mar 2021
 10:20:51 -0500
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by xfe-rcd-003.cisco.com
 (173.37.227.251) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; Thu, 25 Mar 2021
 10:20:51 -0500
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-001.cisco.com (64.101.210.228) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 25 Mar 2021 11:20:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bu/W4ZbZwMv1Lp9sxg5o11Tm4Ik8zDZFtMfbPv4ePJP/WOxXdo5J/P7rrFHu4NHb7xZ2ovC5FUDnpBKifolUpRET0zxjG5tFmGAT4vFfmyRHCmtBbZmASd/dnhJCKYYrUUD9dRVYCf73ywhtwuzEoHeMv1u2HO126xSOWuJ56KnK91eBs7Yw7zKn/JR2k+Qho6jwti1BiiYrjuKKYw32Y+XJhwsYOiSKLRsQQQnvEF46WCo7Xcyh5AMSiE/ZR+BCbAamSrlbnvAYTXYHADa+y4tXN8z8/mywMJEXV3cjg7kcuia/g3G9u2QTTFMSukq1591WeMO7aOpnaTKT4OOH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0kvIm7nT15ueAxie53n85TGBTFP+PL/PpWfWbnSEMc=;
 b=DFTPf/QnwbXC3C0QmasPqCA+TFHzcB8nxg3Wc48X0pJo/h8n+/wjFRywxpKDJsfHSxvnqfkEAHdHaI2nCwbxV4Twqu9CNjdAzPhN2YzZFCA5vji+jPk0axoKsMtu4TJ/f+KHa3qdbGHFeLl3Ln3m7O2TlqRfQJ5v4hOnUABfnCcONxGan+/0XwiWXqTqUJooQ5TU3PiPWOjFA76Mg5RxlneqUAi2h7maT+DniJj1LR5Qn6A5IKfZ9yCQqLE5J/mrL7ZUz68hJ/qoFyK/RqVduSSwqfm3aQg4WbqNZ/0J4DQJhhLjfrjCS6sC2GqJxu4uiwIFLl1Pr4ck6pvOlFReHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h0kvIm7nT15ueAxie53n85TGBTFP+PL/PpWfWbnSEMc=;
 b=nmxY1hpnvyqUJQKaULgkGFU1ITyS2tSATLDRDVvvZ8wi5nYxN+5IEUhAP1+IlNOH0qs5sYbNsGAqUSw960oxTs35IIGZSeCpUymvLQL8C5zMChOR6TBf3yw/yOPwrB16gfHsIK/eVyDLQ5Q0Vvaut88UrlIi+BCiYiNe6WRwpwI=
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by PH0PR11MB5046.namprd11.prod.outlook.com (2603:10b6:510:3b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 25 Mar
 2021 15:20:50 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::710a:816:d2a7:baf5]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::710a:816:d2a7:baf5%7]) with mapi id 15.20.3977.025; Thu, 25 Mar 2021
 15:20:50 +0000
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: Yi Fan Yu <yifan.yu@windriver.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCH 1/2] valgrind: update 3.16.1 -> 3.17.0
Thread-Topic: [oe-core][PATCH 1/2] valgrind: update 3.16.1 -> 3.17.0
Thread-Index: AQHXICY8b19H0JxO0kS+EWnNxJmRrqqU1CA9
Date: Thu, 25 Mar 2021 15:20:50 +0000
Message-ID: <PH0PR11MB490231DA4BAAEB172A47B98CD7629@PH0PR11MB4902.namprd11.prod.outlook.com>
References: <20210323205029.87251-1-yifan.yu@windriver.com>
In-Reply-To: <20210323205029.87251-1-yifan.yu@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [173.38.209.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fe90c4bb-cc6f-421a-7572-08d8efa192a6
x-ms-traffictypediagnostic: PH0PR11MB5046:
x-microsoft-antispam-prvs: <PH0PR11MB5046C6743DEDA632DCA612C4D7629@PH0PR11MB5046.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bcamWmn2RwNhYwEIzr7XtV/GBocwsmc3hALltU0DkPm9lhk0MJ5/RaPWaNhd81SOuigjYwAi11mxmqNgsqoYFS6ZTi8V6yD1Y3L5NooxzdVwLXvxKTek0o4ADf4jXdoDd1dESSnKnHQbegdlXH5PtSHtfQMDXoH5qxyuG75O8Ni9Nek7ybYqm3u6jxGQ5bopl1Crw5fu9X0al6fVyHOmcu+dFO8qDs4awnhop7pxg3NFw8YlnoU10tyn5ldgwQmJgwsquqYdZzlC89RwP1HyxGiUQRoP7Q6Q3E7EfnIFuBxOWvQbAKoOxlugu2+RAkQiSznXAsnmAnb5OLBy0F9uSkhlcW4KRZbGElPOA1vJb6VCWEg6HqxWxlMSElK8vFzGcmDbjtyVyAuNHtE44FMUcBgkd1DvS8dVPq3iMcZ9V3zxGP7QFG5BYrcY0pPdKTqj2zD/iKQYFzmO4HNoCXnlSm1vDLFaYiHOYFCbhcalw3RaHzZzu+SKB/oHTCFXojC2eEI/2DSX3yt0WehJauIuk26GC79DO6WZwksH8snY1T42NFewbWvS0mDG3R1NvZ0+w15PkFc/MhcEa0aAVWg8hmoNSiDNphw6a6xwASsijALO+1dhc0vSD336SMp1aHcADsa2+Tzv2/e8HS6GtLGJ4zMunQE8TsGA3wYGkwXWaS7bPM2qoTcduDUglrQw9RttruJTkpKVx++IowBeLbKbBWzdesc/h38ddnmPyzTfNsudS+eGZnuEnS6QFhzPgce7FS/A1AmlF8wO/u7YtRTs7g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(136003)(39860400002)(366004)(376002)(346002)(76116006)(91956017)(19627235002)(9686003)(64756008)(7696005)(110136005)(66446008)(66946007)(33656002)(86362001)(15650500001)(66556008)(83380400001)(53546011)(478600001)(2906002)(316002)(8936002)(66476007)(38100700001)(71200400001)(52536014)(5660300002)(8676002)(186003)(55016002)(966005)(30864003)(6506007)(26005)(15866825006)(579004)(559001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?fCXznpE5jNxZM8NbHJn+b2/qn1JeLpxPMztO5FbBJbmCvD3HIdQG/0QPAXPg?=
 =?us-ascii?Q?qqUDOrfa+iS53219whG/ccY2l74nAqyRYAYkJTSwaCVylps++r+jqKtN4xIS?=
 =?us-ascii?Q?SacbhmuWK54Po9yNZEsF9RUYYei7cRARY4b572VcY80UsPywIlUs5TuJYHrC?=
 =?us-ascii?Q?5dH5cXzHu1/5G8shEKscs3cyJpFYfJLPWg8M/JhvqjiNYt3tdQWHk9b0KyZH?=
 =?us-ascii?Q?4V1FhHyMcH39ZeqROi+9+mIuOpKYMsJsZtqMulhcTUKjJlfMJR4Vt5K4+wh8?=
 =?us-ascii?Q?fr2zCxGR9otvJjV6uOmEtxZeIVskeY4GmKBARGzzYi/2GXrSQ7WLXBD0gsc5?=
 =?us-ascii?Q?gzc3hCGNC65znlKfjVWPiqCp306Uf8ylYkCVJS+Dqa+Sv+76jEKGcBgOY4+7?=
 =?us-ascii?Q?wQqZyZ5nptZ+uDEbtgPcU0cXL2faDxkAbHFSQi0aZ7xpL/sRatrLRyDq5pP/?=
 =?us-ascii?Q?8KXqYC/z7+XLoNFFj0kNydgxZjJpxkr+oW0Y1aPOTK+nRSQyiKB8ZKzrapDm?=
 =?us-ascii?Q?d8bi/eESYsWvwbpj4XGDkPYvhD5KQqW5OAefcgX/fpb+6ys6ta7GDoC0Cxb3?=
 =?us-ascii?Q?lapqZd95I8s/vaV5ipdZtNDAUMCAuhMZNTBOjCYh26BIO/9aMOLzLxMkmfqT?=
 =?us-ascii?Q?+WVEuw0pOVhBa6FH3vomT+pMF4MwRJN5456YQxTiJSp70WgmMPaeUO4y73WG?=
 =?us-ascii?Q?4YxF4s0KCwdCiJqmgspbvS0HIdDB6YIL+Nh0ViZStq+ECrYIehPF3JYXKlh6?=
 =?us-ascii?Q?q0PXsOnp8qJs/DcZDE9gCIZi0yxpA26lSPXvlNP4vBwb3TwBDtVwQDtZTC+D?=
 =?us-ascii?Q?twPMc+u/lJo20xkGY6+LaWLQ8Fmrqsbxkk5SRAfklAQZysXIhg17/xBxfCiD?=
 =?us-ascii?Q?AlqmpONnKorsHPbyIIFxq2yhVgP8fLG0iruhdvD/PoYBdMjGUMr1ThdcssFT?=
 =?us-ascii?Q?IJf4VYg0dWMw+mipFOqU+X/N7KQMHJlKdWWzqvLUOVZvnvg58TNfS558uAsD?=
 =?us-ascii?Q?eMXoJBpvVSct2IHQCFkm3+XgSiyWfGHKSyXhLb+WI7dvd/OWJCByIuiRIJPX?=
 =?us-ascii?Q?6EIoKSydBrUgTZ3foqLgWD12tVLscwSAxbefU5zi7FPBJ1i67MWmx0XLML2s?=
 =?us-ascii?Q?k5SPe0PsL6gZkpYuuhrZuD9Kmk3xu0a3JCsakz7EWB0cuNnKpeshexLjXO/g?=
 =?us-ascii?Q?bVopHiGZpV3yTNpgrzxI2jN+kdHBNf5VPRfVO+EMwE7Vmp9xZTpQq5fjugEG?=
 =?us-ascii?Q?RC7WrVF6nW7/dAktmBUHGVs0hYs5ub8BLVbQ1OGvyFB9tDEY99u3NKn5gStZ?=
 =?us-ascii?Q?CSo=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe90c4bb-cc6f-421a-7572-08d8efa192a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 15:20:50.0687
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: unirG5lJ7oJjovCgsEbXrO1deVuBVJNDV030kmAoZGoE1M8hH5N0zmX6zo3rVAS3xP6X7Z+l3bIJ13FLElGTjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5046
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.18, xbe-rcd-003.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Here is build and link to the diff-html:

https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/126
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210324-x8y0w4=
3u/packages/diff-html/

Regards,
Oleksiy

________________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yi Fan Yu <yifan.yu@windriver.com>
Sent: Tuesday, March 23, 2021 22:50
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][PATCH 1/2] valgrind: update 3.16.1 -> 3.17.0

Notable changes:
* libdir is now libexecdir

Added patches:
Add musl.supp: missing musl.supp in 3.17.0

Dropped backport patches:
* nlcontrolc: found in c79180a3afcf65902e578646c3b716cc749db406
* drd Fedora33: found in 15330adf7c2471fbaa6a0818db07078d81dbff97

Other dropped patches
* helgrind intercept: found in d2d54dbcc74244adfc0c80b40862edf2b82f53b9
* drd musl fix: found in d2d54dbcc74244adfc0c80b40862edf2b82f53b9

TESTING RESULTS:
qemux86-64:
FAIL: drd/tests/swapcontext

      3.17.0  3.16.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
TOTAL:  736    726
PASSED: 694    688
FAILED:   1      0
SKIPPED: 41     38

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
---
 .../valgrind/0001-Add-missing-musl.supp.patch |  72 +++++++
 ...gtest-hanging-on-newer-glibc-and-or-.patch | 200 ------------------
 .../valgrind/0001-drd-Port-to-Fedora-33.patch |  48 -----
 .../valgrind/valgrind/0001-drd-musl-fix.patch |  31 ---
 ...01-helgrind-Intercept-libc-functions.patch |  54 -----
 ...ated-PowerPC-insns-aren-t-allowed-on.patch |  62 ------
 ...eak_cmsg.stderr.exp-adjust-tmp-paths.patch |   2 +-
 ...ntext-APIs-are-not-available-on-musl.patch |  50 ++++-
 .../valgrind/valgrind/fixed-perl-path.patch   |  20 +-
 .../valgrind/valgrind/run-ptest               |   3 +-
 .../valgrind/valgrind/s390x_vec_op_t.patch    |  24 ++-
 ...{valgrind_3.16.1.bb =3D> valgrind_3.17.0.bb} |  20 +-
 12 files changed, 160 insertions(+), 426 deletions(-)
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Add-missin=
g-musl.supp.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcont=
rolc.vgtest-hanging-on-newer-glibc-and-or-.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-t=
o-Fedora-33.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-f=
ix.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-helgrind-I=
ntercept-libc-functions.patch
 delete mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-lmw-lswi-a=
nd-related-PowerPC-insns-aren-t-allowed-on.patch
 rename meta/recipes-devtools/valgrind/{valgrind_3.16.1.bb =3D> valgrind_3.=
17.0.bb} (93%)

diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Add-missing-musl.=
supp.patch b/meta/recipes-devtools/valgrind/valgrind/0001-Add-missing-musl.=
supp.patch
new file mode 100644
index 0000000000..2a73f7e81f
--- /dev/null
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-Add-missing-musl.supp.pa=
tch
@@ -0,0 +1,72 @@
+From 61bc8664f93cd980831c9da4a3e8a385b089a0ab Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Tue, 23 Mar 2021 09:32:22 -0700
+Subject: [PATCH] Add missing musl.supp
+
+3.17 did not ship musl.supp in the tarball.
+
+This is a workaround until next release.
+
+Upstream-Status: Backport [dde556d51f8226a6de564a00bf82536bb7042c54]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ musl.supp | 46 ++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 46 insertions(+)
+ create mode 100644 musl.supp
+
+diff --git a/musl.supp b/musl.supp
+new file mode 100644
+index 000000000..864172a24
+--- /dev/null
++++ b/musl.supp
+@@ -0,0 +1,46 @@
++# Suppressions for musl libc
++# See: https://www.openwall.com/lists/musl/2017/06/15/4
++
++{
++   musl-dynlink-false-positive1
++   Memcheck:Leak
++   fun:calloc
++   fun:load_direct_deps
++   fun:load_deps
++   fun:load_deps
++   fun:__dls3
++   fun:__dls2b
++   fun:__dls2
++}
++
++{
++   musl-dynlink-false-positive2
++   Memcheck:Leak
++   fun:calloc
++   fun:load_direct_deps
++   fun:load_deps
++   fun:load_deps
++   fun:__dls3
++   fun:__dls2
++}
++
++{
++   musl-dynlink-false-positive3
++   Memcheck:Leak
++   fun:calloc
++   fun:load_library
++   fun:load_preload
++   fun:__dls3
++   fun:__dls2b
++   fun:__dls2
++}
++
++{
++   musl-dynlink-false-positive4
++   Memcheck:Leak
++   fun:calloc
++   fun:load_library
++   fun:load_preload
++   fun:__dls3
++   fun:__dls2
++}
+--
+2.17.1
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vg=
test-hanging-on-newer-glibc-and-or-.patch b/meta/recipes-devtools/valgrind/=
valgrind/0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or-.patch
deleted file mode 100644
index 98cbcd132c..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-Fix-nlcontrolc.vgtest-ha=
nging-on-newer-glibc-and-or-.patch
+++ /dev/null
@@ -1,200 +0,0 @@
-From 83c24e31df6932a6d4fced179050c6d8d8c6f3b5 Mon Sep 17 00:00:00 2001
-From: Philippe Waroquiers <philippe.waroquiers@skynet.be>
-Date: Sun, 7 Mar 2021 22:29:27 +0100
-Subject: [PATCH] Fix nlcontrolc.vgtest hanging on newer glibc and/or arm64
-
-This test verifies that GDB can interrupt a process with all threads
-blocked in a long select syscall.
-The test used to terminate by having GDB modifying the select argument.
-However, modifying the select argument works only for specific arch
-and/or specific versions of glibc.
-The test then blocks on other architectures/glibc versions.
-
-The previous version of the test was:
-  * first launching sleepers so as to have all threads blocked in long sel=
ect
-  * interrupting these threads
-  * changing the select time arg so that the threads burn cpu
-  * and then change variables to have the program exit.
-
-The new version does:
-  * first launches sleepers so that all threads are burning cpu.
-  * interrupting these threads
-  * change the local variables of sleepers so that the threads will
-    block in a long select syscall
-  * interrupt these threads
-  * kill the program.
-
-With this new version, we still check the behaviour of gdb+vgdbserver
-for both burning and sleep threads, but without having the termination
-depending on modifying select syscall argument.
-
-Tested on debian amd64 and on ubuntu arm64 (to check the test does not han=
g
-on an arm64 platform).
-
-Upstream-Status: Backport
-
-From commit on master:
-c79180a3afcf65902e578646c3b716cc749db406
-
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
----
- gdbserver_tests/nlcontrolc.stderr.exp  |  4 +-
- gdbserver_tests/nlcontrolc.stdinB.gdb  | 57 +++++++++++++++-----------
- gdbserver_tests/nlcontrolc.stdoutB.exp | 25 ++++++-----
- gdbserver_tests/nlcontrolc.vgtest      | 12 +++---
- 4 files changed, 56 insertions(+), 42 deletions(-)
-
-diff --git a/gdbserver_tests/nlcontrolc.stderr.exp b/gdbserver_tests/nlcon=
trolc.stderr.exp
-index ac75bb3da..b63a9a988 100644
---- a/gdbserver_tests/nlcontrolc.stderr.exp
-+++ b/gdbserver_tests/nlcontrolc.stderr.exp
-@@ -3,9 +3,9 @@ Nulgrind, the minimal Valgrind tool
- (action at startup) vgdb me ...
-
-
--loops/sleep_ms/burn/threads_spec/affinity:  1000000000 1000000000 1000000=
000 BSBSBSBS 1
-+loops/sleep_ms/burn/threads_spec/affinity:  1000000000 0 100000 BSBSBSBS =
1
- Brussels ready to sleep and/or burn
- London ready to sleep and/or burn
- Petaouchnok ready to sleep and/or burn
- main ready to sleep and/or burn
--
-+Gdb request to kill this process
-diff --git a/gdbserver_tests/nlcontrolc.stdinB.gdb b/gdbserver_tests/nlcon=
trolc.stdinB.gdb
-index 667ece18d..ea4fcd530 100644
---- a/gdbserver_tests/nlcontrolc.stdinB.gdb
-+++ b/gdbserver_tests/nlcontrolc.stdinB.gdb
-@@ -9,32 +9,43 @@ shell ./simulate_control_c --vgdb-prefix=3D./vgdb-prefix=
-nlcontrolc 1 grep main nl
- #
- continue
- #
--# Here, all tasks should be blocked in a loooonnnng select, all in WaitSy=
s
--info threads
--# We will unblock them by changing their timeout argument
--# To avoid going into the frame where the timeval arg is,
--# it has been defined as global variables, as the nr
--# of calls on the stack differs between 32bits and 64bits,
--# and/or between OS.
--# ensure select finishes in a few milliseconds max:
--p t[0].tv_sec =3D 0
--p t[1].tv_sec =3D 0
--p t[2].tv_sec =3D 0
--p t[3].tv_sec =3D 0
--#
--# We will change the burning parameters in a few  seconds
-+# Threads are burning cpu now
-+# We would like to fully test info threads here, but which thread are Run=
nable
-+# or Yielding is unpredictable. With a recent enough gdb, check the nr of
-+# threads by state using pipe commands and grep/wc.
-+init-if-undefined $_gdb_major =3D 0
-+init-if-undefined $_gdb_minor =3D 0
-+if $_gdb_major >=3D 9
-+  | info threads | grep VgTs_Runnable | wc -l
-+  | info threads | grep VgTs_Yielding | wc -l
-+else
-+  echo 1\n
-+  echo 3\n
-+end
-+# We change the variables so that all the threads are blocked in a syscal=
l
-+p burn =3D 0
-+p sleepms =3D 1000000
-+#
-+#
- shell ./simulate_control_c --vgdb-prefix=3D./vgdb-prefix-nlcontrolc 1 gre=
p changed nlcontrolc.stdoutB.out
- #
--echo changed burning parameters\n
-+echo changed burning parameters to sleeping parameters\n
- continue
-+# Here, all tasks should be blocked in a loooonnnng select, all in WaitSy=
s
-+info threads
-+# We reset the sleepms to 0. The threads should still be blocked in the s=
yscall
-+p sleepms =3D 0
-+shell ./simulate_control_c --vgdb-prefix=3D./vgdb-prefix-nlcontrolc 1 gre=
p reset nlcontrolc.stdoutB.out
- #
--# Threads are burning cpu now
--# We would like to test info threads here, but which thread are Runnable =
or Yielding
--# is unpredictable.
--# info threads
--p burn =3D 0
--p loops =3D 0
--p report_finished =3D 0
-+echo reset to sleeping parameters\n
- continue
--# and the process should stop very quickly now
-+# threads should still be blocked in a loooonnnng select, all in WaitSys
-+info threads
-+if $_gdb_major >=3D 9
-+  | info threads | grep VgTs_WaitSys | wc -l
-+else
-+  echo 4\n
-+end
-+# Make the process die.
-+kill
- quit
-diff --git a/gdbserver_tests/nlcontrolc.stdoutB.exp b/gdbserver_tests/nlco=
ntrolc.stdoutB.exp
-index e8a5ff8ba..2e8dc8498 100644
---- a/gdbserver_tests/nlcontrolc.stdoutB.exp
-+++ b/gdbserver_tests/nlcontrolc.stdoutB.exp
-@@ -1,18 +1,21 @@
- Continuing.
- Program received signal SIGTRAP, Trace/breakpoint trap.
-+do_burn () at sleepers.c:41
-+41       for (i =3D 0; i < burn; i++) loopnr++;
-+ > > > > > >1
-+3
-+$1 =3D 0
-+$2 =3D 1000000
-+changed burning parameters to sleeping parameters
-+Continuing.
-+Program received signal SIGTRAP, Trace/breakpoint trap.
- 0x........ in syscall ...
- * 1 Thread .... (tid 1 VgTs_WaitSys)  0x........ in syscall ...
--$1 =3D 0
--$2 =3D 0
- $3 =3D 0
--$4 =3D 0
--changed burning parameters
-+reset to sleeping parameters
- Continuing.
- Program received signal SIGTRAP, Trace/breakpoint trap.
--do_burn () at sleepers.c:41
--41       for (i =3D 0; i < burn; i++) loopnr++;
--$5 =3D 0
--$6 =3D 0
--$7 =3D 0
--Continuing.
--Program exited normally.
-+0x........ in syscall ...
-+* 1 Thread .... (tid 1 VgTs_WaitSys)  0x........ in syscall ...
-+ > > > >4
-+Kill the program being debugged? (y or n) [answered Y; input not from ter=
minal]
-diff --git a/gdbserver_tests/nlcontrolc.vgtest b/gdbserver_tests/nlcontrol=
c.vgtest
-index bb5308403..09edfcaba 100644
---- a/gdbserver_tests/nlcontrolc.vgtest
-+++ b/gdbserver_tests/nlcontrolc.vgtest
-@@ -4,16 +4,16 @@
- #          and modify some variables
- #   the user can control-c an process with all threads in Running/Yieldin=
g
- #          and modify some variables
--# sleepers is started with argument so that it will compute during ages.
--# The variable modifications means it will exit in a reasonable time.
--# This test is disabled on Solaris because modifying select/poll/ppoll ti=
meout
--# has no effect if a thread is already blocked in that syscall.
-+# sleepers is started so that it burns CPU.
-+# We then interrupt the process.
-+# We modify variables so that instead of burning cpu, sleepers blocks
-+# all threads in a select syscall.
- prog: sleepers
--args: 1000000000 1000000000 1000000000 BSBSBSBS 1
-+args: 1000000000 0 100000 BSBSBSBS 1
- vgopts: --tool=3Dnone --vgdb=3Dyes --vgdb-error=3D0 --vgdb-prefix=3D./vgd=
b-prefix-nlcontrolc
- stderr_filter: filter_stderr
- # Bug 338633 nlcontrol hangs on arm64 currently.
--prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/arch_test arm64 && !=
 ../tests/os_test solaris
-+prereq: test -e gdb -a -f vgdb.invoker && ! ../tests/os_test solaris
- progB: gdb
- argsB: --quiet -l 60 --nx ./sleepers
- stdinB: nlcontrolc.stdinB.gdb
---
-2.29.2
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedor=
a-33.patch b/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedor=
a-33.patch
deleted file mode 100644
index 37f6ea667d..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-drd-Port-to-Fedora-33.pa=
tch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 15330adf7c2471fbaa6a0818db07078d81dbff97 Mon Sep 17 00:00:00 2001
-From: Bart Van Assche <bvanassche@acm.org>
-Date: Sat, 19 Sep 2020 08:08:59 -0700
-Subject: [PATCH] drd: Port to Fedora 33
-
-Apparently on Fedora 33 the POSIX thread functions exist in both libc and
-libpthread. Hence this patch that intercepts the pthread functions in
-libc. See also https://bugs.kde.org/show_bug.cgi?id=3D426144 .
-
-Signed-off-by: Bart Van Assche <bvanassche@acm.org>
-
-This patch was imported from the valgrind sourceware server
-(https://sourceware.org/git/?p=3Dvalgrind.git;a=3Dcommit;h=3D15330adf7c247=
1fbaa6a0818db07078d81dbff97)
-It was modified to remove the changes to the valgrind NEWS file,
-as these are difficult to maintain and don't impact the valgrind
-code itself.
-
-Upstream-Status: Backport
-
-Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
----
- drd/drd_pthread_intercepts.c | 9 +++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/drd/drd_pthread_intercepts.c b/drd/drd_pthread_intercepts.c
-index 58c45aaec..c2882e5ab 100644
---- a/drd/drd_pthread_intercepts.c
-+++ b/drd/drd_pthread_intercepts.c
-@@ -174,7 +174,16 @@ static int never_true;
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
-    { return implf argl; }
- #else
-+/*
-+ * On Linux, intercept both the libc and the libpthread functions. At
-+ * least glibc 2.32.9000 (Fedora 34) has an implementation of all pthread
-+ * functions in both libc and libpthread. Older glibc versions only have =
an
-+ * implementation of the pthread functions in libpthread.
-+ */
- #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
-+   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;           \
-+   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
-+   { return implf argl; }                                               \
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
-    { return implf argl; }
---
-2.25.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patc=
h b/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch
deleted file mode 100644
index e96bf3c611..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-drd-musl-fix.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-The changes in 0001-drd-Port-to-Fedora-33.patch break builds on musl. Thes=
e
-need a __GLIBC__ guard to ensure musl builds continue to work.
-
-Upstream-Status: Pending
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: valgrind-3.16.1/drd/drd_pthread_intercepts.c
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
---- valgrind-3.16.1.orig/drd/drd_pthread_intercepts.c
-+++ valgrind-3.16.1/drd/drd_pthread_intercepts.c
-@@ -180,6 +180,7 @@ static int never_true;
-  * functions in both libc and libpthread. Older glibc versions only have =
an
-  * implementation of the pthread functions in libpthread.
-  */
-+#ifdef __GLIBC__
- #define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl;           \
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBC_SONAME,zf) argl_decl            \
-@@ -187,6 +188,12 @@ static int never_true;
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
-    ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
-    { return implf argl; }
-+#else
-+#define PTH_FUNC(ret_ty, zf, implf, argl_decl, argl)                    \
-+   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl;     \
-+   ret_ty VG_WRAP_FUNCTION_ZZ(VG_Z_LIBPTHREAD_SONAME,zf) argl_decl      \
-+   { return implf argl; }
-+#endif
- #endif
-
- /**
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercep=
t-libc-functions.patch b/meta/recipes-devtools/valgrind/valgrind/0001-helgr=
ind-Intercept-libc-functions.patch
deleted file mode 100644
index f66df3d2d2..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-=
functions.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From cdec010444df5a4328e90d07a2024fdeefcc74b5 Mon Sep 17 00:00:00 2001
-From: Paul Floyd <paulf@free.fr>
-Date: Wed, 18 Nov 2020 12:49:20 -0400
-Subject: [PATCH] helgrind: Intercept libc functions
-
-PTH_FUNC definition needs to be modified in order to
-intercept posix thread functions in both libc and
-libpthread. In order to handle this in helgrind, weak alias
-the pthread functions in glibc.
-
-Upstream-Status: Submitted
-
-Signed-off-by: Paul Floyd <paulf@free.fr>
-Signed-off-by: Stacy Gaikovaia <stacy.gaikovaia@windriver.com>
----
- helgrind/hg_intercepts.c | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/helgrind/hg_intercepts.c b/helgrind/hg_intercepts.c
-index a10c3a4a3..316140ca6 100644
---- a/helgrind/hg_intercepts.c
-+++ b/helgrind/hg_intercepts.c
-@@ -77,6 +77,11 @@
- /*---                                                          ---*/
- /*----------------------------------------------------------------*/
-
-+#define hg_expand(tok) #tok
-+#define hg_str(tok) hg_expand(tok)
-+# define hg_weak_alias(name, aliasname) \
-+  extern __typeof (name) aliasname __attribute__ ((weak, alias(hg_str(nam=
e))))
-+
- #if defined(VGO_solaris)
- /* On Solaris, libpthread is just a filter library on top of libc.
-  * Threading and synchronization functions in runtime linker are not
-@@ -91,9 +96,16 @@
- #define CREQ_PTHREAD_T Word
- #define SEM_ERROR ret
- #else
-+#ifdef MUSL_LIBC
-+#define PTH_FUNC(ret_ty, f, args...) \
-+   ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args); \
-+   ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args)
-+#else
- #define PTH_FUNC(ret_ty, f, args...) \
-    ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args); \
-+   hg_weak_alias(I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f), I_WRA=
P_SONAME_FNNAME_ZZ(VG_Z_LIBC_SONAME,f)); \
-    ret_ty I_WRAP_SONAME_FNNAME_ZZ(VG_Z_LIBPTHREAD_SONAME,f)(args)
-+#endif
- #define CREQ_PTHREAD_T pthread_t
- #define SEM_ERROR errno
- #endif /* VGO_solaris */
---
-2.17.1
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-lmw-lswi-and-rela=
ted-PowerPC-insns-aren-t-allowed-on.patch b/meta/recipes-devtools/valgrind/=
valgrind/0001-lmw-lswi-and-related-PowerPC-insns-aren-t-allowed-on.patch
deleted file mode 100644
index 7c62144978..0000000000
--- a/meta/recipes-devtools/valgrind/valgrind/0001-lmw-lswi-and-related-Pow=
erPC-insns-aren-t-allowed-on.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 0748ed5403a75c12ad9137b3fabf9d8397206ed8 Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mark@klomp.org>
-Date: Tue, 1 Dec 2020 13:57:39 +0100
-Subject: [PATCH] lmw, lswi and related PowerPC insns aren't allowed on ppc=
64le
-
-lmw, lswi and related PowerPC insns aren't allowed on ppc64le
-
-Newer binutils produce an error when the assembly contains lmw, stmw,
-lswi, lswx, stswi, or stswx instructions in little-endian mode.
-
-Only build and run the lsw and ldst_multiple testcases on ppc64[be].
-
-https://bugs.kde.org/show_bug.cgi?id=3D427870
-Upstream-Status: Backport [https://sourceware.org/git/?p=3Dvalgrind.git;a=
=3Dcommit;h=3D74b74174d572fee4015b8f4e326db3cd949bcdc3]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- none/tests/ppc64/Makefile.am          | 9 ++++++---
- none/tests/ppc64/ldst_multiple.vgtest | 1 +
- 2 files changed, 7 insertions(+), 3 deletions(-)
-
-diff --git a/none/tests/ppc64/Makefile.am b/none/tests/ppc64/Makefile.am
-index 9bc0d0a..9d1e8b7 100644
---- a/none/tests/ppc64/Makefile.am
-+++ b/none/tests/ppc64/Makefile.am
-@@ -54,16 +54,20 @@ EXTRA_DIST =3D \
-
- check_PROGRAMS =3D \
-       allexec \
--      lsw jm-insns round \
-+      jm-insns round \
-       test_isa_2_06_part1 test_isa_2_06_part2 test_isa_2_06_part3 \
-       test_dfp1 test_dfp2 test_dfp3 test_dfp4 test_dfp5 \
-       test_isa_2_07_part1 test_isa_2_07_part2 \
-       test_isa_3_0 \
-       subnormal_test \
--      test_tm test_touch_tm ldst_multiple data-cache-instructions \
-+      test_tm test_touch_tm data-cache-instructions \
-       power6_mf_gpr std_reg_imm \
-       twi_tdi tw_td power6_bcmp
-
-+# lmw, stmw, lswi, lswx, stswi, stswx compile (and run) only on big endia=
n.
-+if VGCONF_PLATFORMS_INCLUDE_PPC64BE_LINUX
-+check_PROGRAMS +=3D lsw ldst_multiple
-+endif
-
- AM_CFLAGS    +=3D @FLAG_M64@
- AM_CXXFLAGS  +=3D @FLAG_M64@
-@@ -175,4 +179,3 @@ test_isa_2_07_part2_LDADD =3D -lm
- test_tm_LDADD =3D -lm
- test_touch_tm_LDADD =3D -lm
- test_isa_3_0_LDADD =3D -lm
--
-diff --git a/none/tests/ppc64/ldst_multiple.vgtest b/none/tests/ppc64/ldst=
_multiple.vgtest
-index 87e668e..22dd46c 100644
---- a/none/tests/ppc64/ldst_multiple.vgtest
-+++ b/none/tests/ppc64/ldst_multiple.vgtest
-@@ -1 +1,2 @@
-+prereq: ../../../tests/is_ppc64_BE
- prog: ldst_multiple
---
-2.31.0
-
diff --git a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak=
_cmsg.stderr.exp-adjust-tmp-paths.patch b/meta/recipes-devtools/valgrind/va=
lgrind/0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.patch
index d641998d72..e421ac6c80 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.s=
tderr.exp-adjust-tmp-paths.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0001-none-tests-fdleak_cmsg.s=
tderr.exp-adjust-tmp-paths.patch
@@ -19,7 +19,7 @@ index 6e5a797b9..0ede1ab18 100644
 @@ -25,10 +25,10 @@ Open file descriptor ...: /dev/null


- FILE DESCRIPTORS: 6 open at exit.
+ FILE DESCRIPTORS: 6 open (3 std) at exit.
 -Open file descriptor ...: /tmp/data2
 +Open file descriptor ...: ...
     ...
diff --git a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-=
not-available-on-musl.patch b/meta/recipes-devtools/valgrind/valgrind/0002-=
context-APIs-are-not-available-on-musl.patch
index 480fe33247..7f0e38cb95 100644
--- a/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-ava=
ilable-on-musl.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/0002-context-APIs-are-not-ava=
ilable-on-musl.patch
@@ -1,18 +1,58 @@
-From bd4e926e7e14747b3cd4d7b2a1bd5410b22f3ea2 Mon Sep 17 00:00:00 2001
+From 26c104adf6c5162572b7aa2fac89d0835b7f8f0b Mon Sep 17 00:00:00 2001
 From: Randy MacLeod <Randy.MacLeod@windriver.com>
 Date: Tue, 16 Oct 2018 21:27:46 -0400
 Subject: [PATCH] context APIs are not available on musl

-Upstream-Status: Pending
-
 Updated patch for valgrind-3.14

 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
+
+Apply same patch to drd/tests/swapcontext.c
+for valgrind-3.17.
+
+Upstream-Status: Submitted [https://bugs.kde.org/show_bug.cgi?id=3D434775]
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
+ drd/tests/swapcontext.c              | 6 ++++++
  memcheck/tests/linux/stack_changes.c | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
+ 2 files changed, 12 insertions(+), 1 deletion(-)

+diff --git a/drd/tests/swapcontext.c b/drd/tests/swapcontext.c
+index 622c70bc5..5e72bb0f3 100644
+--- a/drd/tests/swapcontext.c
++++ b/drd/tests/swapcontext.c
+@@ -20,6 +20,7 @@
+
+ #define STACKSIZE (PTHREAD_STACK_MIN + 4096)
+
++#ifdef __GLIBC__
+ typedef struct thread_local {
+   ucontext_t uc[3];
+   size_t nrsw;
+@@ -67,9 +68,11 @@ void *worker(void *data)
+   swapcontext(&tlocal->uc[0], &tlocal->uc[1]);
+   return NULL;
+ }
++#endif
+
+ int main(int argc, char *argv[])
+ {
++#ifdef __GLIBC__
+   enum { NR =3D 32 };
+   thread_local_t tlocal[NR];
+   pthread_t thread[NR];
+@@ -94,6 +97,9 @@ int main(int argc, char *argv[])
+
+   for (i =3D 0; i < NR; i++)
+     pthread_join(thread[i], NULL);
++#else
++    printf("libc context call APIs e.g. getcontext() are deprecated by po=
six\n");
++#endif
+
+   return 0;
+ }
 diff --git a/memcheck/tests/linux/stack_changes.c b/memcheck/tests/linux/s=
tack_changes.c
 index 7f97b90a5..a26cb4ae6 100644
 --- a/memcheck/tests/linux/stack_changes.c
@@ -48,5 +88,5 @@ index 7f97b90a5..a26cb4ae6 100644
      return 0;
  }
 --
-2.17.0
+2.17.1

diff --git a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch =
b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
index b431d3356e..db6867f625 100644
--- a/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/fixed-perl-path.patch
@@ -1,4 +1,4 @@
-From 67e7a690107efb16d6d5aebfe420b64a552accdf Mon Sep 17 00:00:00 2001
+From d85cc45e0ddeda68adf594dead715964cb32d0e7 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 31 Aug 2010 22:51:58 +0800
 Subject: [PATCH] valgrind: fix perl scripts
@@ -22,10 +22,11 @@ Signed-off-by: Maxin B. John <maxin.john@intel.com>
  cachegrind/cg_diff.in     | 2 +-
  massif/ms_print.in        | 2 +-
  perf/vg_perf.in           | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
+ tests/vg_regtest.in       | 2 +-
+ 5 files changed, 5 insertions(+), 5 deletions(-)

 diff --git a/cachegrind/cg_annotate.in b/cachegrind/cg_annotate.in
-index 69365e8..978265d 100644
+index fea114b..5e814fd 100644
 --- a/cachegrind/cg_annotate.in
 +++ b/cachegrind/cg_annotate.in
 @@ -1,4 +1,4 @@
@@ -35,7 +36,7 @@ index 69365e8..978265d 100644
  ##--------------------------------------------------------------------##
  ##--- Cachegrind's annotator.                       cg_annotate.in ---##
 diff --git a/cachegrind/cg_diff.in b/cachegrind/cg_diff.in
-index 395460b..05873cc 100755
+index 9d9258e..d0f0ec7 100755
 --- a/cachegrind/cg_diff.in
 +++ b/cachegrind/cg_diff.in
 @@ -1,4 +1,4 @@
@@ -45,7 +46,7 @@ index 395460b..05873cc 100755
  ##--------------------------------------------------------------------##
  ##--- Cachegrind's differencer.                         cg_diff.in ---##
 diff --git a/massif/ms_print.in b/massif/ms_print.in
-index e6fae89..3b85b40 100755
+index a206ce4..df1bc31 100755
 --- a/massif/ms_print.in
 +++ b/massif/ms_print.in
 @@ -1,4 +1,4 @@
@@ -55,7 +56,7 @@ index e6fae89..3b85b40 100755
  ##--------------------------------------------------------------------##
  ##--- Massif's results printer                         ms_print.in ---##
 diff --git a/perf/vg_perf.in b/perf/vg_perf.in
-index 7a80cb0..28f6156 100644
+index 90ee1d2..c585096 100644
 --- a/perf/vg_perf.in
 +++ b/perf/vg_perf.in
 @@ -1,4 +1,4 @@
@@ -65,7 +66,7 @@ index 7a80cb0..28f6156 100644
  ##--- Valgrind performance testing script                  vg_perf ---##
  ##--------------------------------------------------------------------##
 diff --git a/tests/vg_regtest.in b/tests/vg_regtest.in
-index cb05b52..032e947 100755
+index 0fe6341..1b45eb7 100755
 --- a/tests/vg_regtest.in
 +++ b/tests/vg_regtest.in
 @@ -1,4 +1,4 @@
@@ -74,5 +75,6 @@ index cb05b52..032e947 100755
  ##--------------------------------------------------------------------##
  ##--- Valgrind regression testing script                vg_regtest ---##
  ##--------------------------------------------------------------------##
----
-2.4.0
+--
+2.29.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind/run-ptest b/meta/recip=
es-devtools/valgrind/valgrind/run-ptest
index e8a1a668fc..3e0205fe6e 100755
--- a/meta/recipes-devtools/valgrind/valgrind/run-ptest
+++ b/meta/recipes-devtools/valgrind/valgrind/run-ptest
@@ -7,6 +7,7 @@
 # Randy MacLeod <Randy.MacLeod@windriver.com>
 ###############################################################
 VALGRIND_LIB=3D@libdir@/valgrind
+VALGRIND_LIBEXECDIR=3D@libexecdir@/valgrind
 VALGRIND_BIN=3D@bindir@/valgrind

 LOG=3D"${VALGRIND_LIB}/ptest/valgrind_ptest_$(date +%Y%m%d-%H%M%S).log"
@@ -33,7 +34,7 @@ fi

 cd ${VALGRIND_LIB}/ptest && ./tests/vg_regtest \
     --valgrind=3D${VALGRIND_BIN} \
-    --valgrind-lib=3D${VALGRIND_LIB} \
+    --valgrind-lib=3D${VALGRIND_LIBEXECDIR} \
     --yocto-ptest \
     gdbserver_tests ${TOOLS} ${EXP_TOOLS} \
     2>&1|tee ${LOG}
diff --git a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch b=
/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
index eea671da0a..bde1241dc7 100644
--- a/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
+++ b/meta/recipes-devtools/valgrind/valgrind/s390x_vec_op_t.patch
@@ -1,3 +1,8 @@
+From 8154d38bac5cdb3675cfdaf562ab9da01988b263 Mon Sep 17 00:00:00 2001
+From: Yi Fan Yu <yifan.yu@windriver.com>
+Date: Wed, 17 Mar 2021 12:16:31 -0400
+Subject: [PATCH 19/20] remove s390x_vec_op_t
+
 s390x_vec_op_t is not needed anywhere, only elements of enum are accessed
 removing it ensures that valgrind can be built with -fno-common option

@@ -6,14 +11,25 @@ ld: ../../VEX/libvex-amd64-linux.a(libvex_amd64_linux_a-=
guest_s390_helpers.o):/u

 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ VEX/priv/guest_s390_defs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/VEX/priv/guest_s390_defs.h b/VEX/priv/guest_s390_defs.h
+index 9054290..dab8002 100644
 --- a/VEX/priv/guest_s390_defs.h
 +++ b/VEX/priv/guest_s390_defs.h
-@@ -286,7 +286,7 @@ enum {
-    S390_VEC_OP_VFCHE =3D 18,
-    S390_VEC_OP_VFTCI =3D 19,
-    S390_VEC_OP_LAST =3D 20 // supposed to be the last element in enum
+@@ -284,7 +284,7 @@ typedef enum {
+    S390_VEC_OP_VBPERM,
+    S390_VEC_OP_VMSL,
+    S390_VEC_OP_LAST             // supposed to be the last element in enu=
m
 -} s390x_vec_op_t;
 +};

  /* Arguments of s390x_dirtyhelper_vec_op(...) which are packed into one
     ULong variable.
+--
+2.29.2
+
diff --git a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb b/meta/recip=
es-devtools/valgrind/valgrind_3.17.0.bb
similarity index 93%
rename from meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
rename to meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
index 2b1d185575..d887f249c4 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.16.1.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.17.0.bb
@@ -42,14 +42,10 @@ SRC_URI =3D "https://sourceware.org/pub/valgrind/valgri=
nd-${PV}.tar.bz2 \
            file://s390x_vec_op_t.patch \
            file://0001-none-tests-fdleak_cmsg.stderr.exp-adjust-tmp-paths.=
patch \
            file://0001-memcheck-tests-Fix-timerfd-syscall-test.patch \
-           file://0001-drd-Port-to-Fedora-33.patch \
-           file://0001-drd-musl-fix.patch \
-           file://0001-helgrind-Intercept-libc-functions.patch \
-           file://0001-Fix-nlcontrolc.vgtest-hanging-on-newer-glibc-and-or=
-.patch \
-           file://0001-lmw-lswi-and-related-PowerPC-insns-aren-t-allowed-o=
n.patch \
+           file://0001-Add-missing-musl.supp.patch \
            "
-SRC_URI[md5sum] =3D "d1b153f1ab17cf1f311705e7a83ef589"
-SRC_URI[sha256sum] =3D "c91f3a2f7b02db0f3bc99479861656154d241d2fdb265614ba=
918cc6720a33ca"
+SRC_URI[md5sum] =3D "afe11b5572c3121a781433b7c0ab741b"
+SRC_URI[sha256sum] =3D "ad3aec668e813e40f238995f60796d9590eee64a16dff88421=
430630e69285a2"
 UPSTREAM_CHECK_REGEX =3D "valgrind-(?P<pver>\d+(\.\d+)+)\.tar"

 COMPATIBLE_HOST =3D '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-li=
nux'
@@ -110,7 +106,7 @@ do_configure_prepend () {
 }

 do_install_append () {
-    install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
+    install -m 644 ${B}/default.supp ${D}/${libexecdir}/valgrind/
     oe_multilib_header valgrind/config.h
 }

@@ -125,7 +121,7 @@ VALGRINDARCH_powerpc =3D "ppc"
 VALGRINDARCH_powerpc64 =3D "ppc64"
 VALGRINDARCH_powerpc64el =3D "ppc64le"

-INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libdir}/valgrind/vgpreload_memch=
eck-${VALGRINDARCH}-linux.so"
+INHIBIT_PACKAGE_STRIP_FILES =3D "${PKGD}${libexecdir}/valgrind/vgpreload_m=
emcheck-${VALGRINDARCH}-linux.so"

 RDEPENDS_${PN} +=3D "perl"

@@ -137,7 +133,8 @@ RDEPENDS_${PN}-ptest +=3D " bash coreutils file \
    gdb libgomp \
    perl \
    perl-module-file-basename perl-module-file-glob perl-module-getopt-long=
 \
-   perl-module-overloading \
+   perl-module-overloading perl-module-cwd perl-module-ipc-open3 \
+   perl-module-carp perl-module-symbol \
    procps sed ${PN}-dbg ${PN}-src"
 RDEPENDS_${PN}-ptest_append_libc-glibc =3D " glibc-utils"

@@ -224,6 +221,7 @@ do_install_ptest() {

     # handle multilib
     sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
+    sed -i s:@libexecdir@:${libexecdir}:g ${D}${PTEST_PATH}/run-ptest
     sed -i s:@bindir@:${bindir}:g ${D}${PTEST_PATH}/run-ptest

     # This test fails on the host as well, using both 3.15 and git master =
(as of Jan 24 2020)
@@ -238,7 +236,7 @@ do_install_ptest() {

 # avoid stripping some generated binaries otherwise some of the tests will=
 fail
 # run-strip-reloc.sh, run-strip-strmerge.sh and so on will fail
-INHIBIT_PACKAGE_STRIP_FILES =3D "\
+INHIBIT_PACKAGE_STRIP_FILES +=3D "\
     ${PKGD}${PTEST_PATH}/none/tests/tls \
     ${PKGD}${PTEST_PATH}/none/tests/tls.so \
     ${PKGD}${PTEST_PATH}/none/tests/tls2.so \
--
2.17.1

