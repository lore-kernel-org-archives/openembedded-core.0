Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.3982.1620807806331271273
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.onmicrosoft.com header.s=selector2-intel-onmicrosoft-com header.b=G91JQAIj;
 spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: sangeeta.jain@intel.com)
IronPort-SDR: 8JQakElPY4k3GP7lwhi8Fa8l+vTDqXpyGGFMvtXqCHbaFEIqZtjO3l5tLhvHDONniP6aq5kFlM
 +HXdwzp3pebQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="187077320"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="187077320"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:23:08 -0700
IronPort-SDR: jsPr5E5nv66lQNGa/IAOBsnkXZW0O9uUZt9joE2sHjuCZvtIvECju4vnQzyRbCp4jHt0va1i8I
 MVqUh8dKnUyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="409163190"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga002.jf.intel.com with ESMTP; 12 May 2021 01:23:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 12 May 2021 01:23:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Wed, 12 May 2021 01:23:05 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.47) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Wed, 12 May 2021 01:23:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEeW/+VhUl69W7iy+d4YJiwazTrUGjZDHG+faPEsahJ53b/7ZOYfNIbdlo6xeG5T9uf1SMF55c4TM0LxXKjcTJxusPMeZnhqJkJcJMlM1tXW2aUkn0YYV0Si2qNcqBsc/Vt8gITJPHofsrZBmUWatmVni2Z6+6NxIAqVmKe6dj/1iG/sd7YYfpfbA9Z35RTdNLhKXX0VMP2beqkw09Es4pFSOGgCG7XumD+uyNtCRh4MW1yottucfq+aJoWqgt0imGcuaRNPODn6NbPHSt7XD+DW9UcZ6B4z8cW+IDbat2zeQaR9X6Vg+vnCI+hE/UlkPikkZzTO7zY6nx+gp03gOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCON8tbxGB7DbzoRmj/4WsAQf3RQ5DxZoiYCQS4uy6E=;
 b=RGY9q2zpzSfAGzyXnPxTBrx+jIr06fpfm6+lEGsposVWBge+pC6QWXGgzl6Xg5Hq+R7JFnODljuFwytkgx1Ee2GlXM5aTWxDx3CBHYVNweNi9u76TZ7FPfPZK9xvjVF6B8QeH5ifZd26qkESloEB1jybTs2KDKfGYf+PYj0QzYnllHViQu8rSe7lvGF0jJBbYiF+HXZJsl9QeWDOdz/I+JuAuMPYPpuqdaWeQa/gkNmoGnfrsmK84Y+AvJLHxJk3DoWcrny9MQF/IDputAuXCQwBhDI++LRHmM67OTjjUNotwsH5BDOfe72FVtCEyb1PGF+w8gHPGCY8ZHnfXS/58Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DCON8tbxGB7DbzoRmj/4WsAQf3RQ5DxZoiYCQS4uy6E=;
 b=G91JQAIjCsgeqdAup1HFMshbQBhqZoEYIAwFU0lcHJsfd5vG430e6aF19ppECUdFRbJjJtVaj0QX9SMSrWjB2MX1VtesIeHXnD3G1CSR/em8HF9fMxb8ZX4iNNlRcyDCHvNeXWN9DIe0wl1lk9+0vq2nugqV6DFfLPNfq+rcVKs=
Received: from BYAPR11MB3624.namprd11.prod.outlook.com (2603:10b6:a03:b1::33)
 by SJ0PR11MB4799.namprd11.prod.outlook.com (2603:10b6:a03:2ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 12 May
 2021 08:23:04 +0000
Received: from BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::ed3d:ed46:9fd1:3d10]) by BYAPR11MB3624.namprd11.prod.outlook.com
 ([fe80::ed3d:ed46:9fd1:3d10%5]) with mapi id 15.20.4108.032; Wed, 12 May 2021
 08:23:04 +0000
From: "Sangeeta Jain" <sangeeta.jain@intel.com>
To: "qa-build-notification@lists.yoctoproject.org"
	<qa-build-notification@lists.yoctoproject.org>,
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [qa-build-notification] QA notification for completed autobuilder build (yocto-3.2.4.rc1)
Thread-Topic: [qa-build-notification] QA notification for completed
 autobuilder build (yocto-3.2.4.rc1)
Thread-Index: AQHXQpH3CbxwtyK+T0q+NGow23tKRKrfisJQ
Date: Wed, 12 May 2021 08:23:03 +0000
Message-ID: <BYAPR11MB36247609D06EBA3904523E93E3529@BYAPR11MB3624.namprd11.prod.outlook.com>
References: <20210506160550.3455E3A0321@ubuntu2004-ty-2.yocto.io>
In-Reply-To: <20210506160550.3455E3A0321@ubuntu2004-ty-2.yocto.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.6.0.76
dlp-product: dlpe-windows
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=intel.com;
x-originating-ip: [60.53.116.239]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af4b2fcd-0163-45de-82c5-08d9151f29e1
x-ms-traffictypediagnostic: SJ0PR11MB4799:
x-microsoft-antispam-prvs: <SJ0PR11MB47996F2D42B473E85746E8EEE3529@SJ0PR11MB4799.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BR+RGBouyf3yKLkNFdZZzcdDGhf0w8diNoUX1zMf4h4NGeidAMXotsnOFDHDmSuAlT7y0xRcjwgBPQ/k5lGZNCA7pbJXvCFiQtOMGWTbdwxw8IBY5i5+kVvsuHDH5fAU/MUH3nfpCaYeNENo9v+Q94qc+mjKzcI0GzU6MnoUxDs6JCSBJzgGUz1zzgu/IYTrelS7dxW6zPdYFVhCKkpNiBt0kSNb25gv4h9RJN1hlQQzxX0OLzheJj+VN3lJEymlM1xt5wuQsXxTtq4vuIzHJ0cF+g7u3TCtmA/4ojzbv8dQwtfzSGyh00gDag7k4weSabbKkcUlDEALLc3XSCnkF+Rk5ZGfof5yUquKEsL2GSJ8ILHLo/B9btfNLBZTrpl/dbz9lAHdjwxWzhF+EOd8kdQEqW1ljqYIRy7Z1G+xswPlYlIxv+sVj9pDTTCzzvuTRUMRt175timtuWU46TZV2pX2o+8z29GdGg2OiYf/dokOSE/A/SgY6Rs/E3hkfDxg0vCDuo95j66UGUtpr7Qc455n3CUqrXYGT0QJKdN/GGHJzG8Py/4TekHiMqbq4oBFEK5gkNCEgvQIWrJoFgMRlFqlAtwImw1VILeofxKLR2pDoal7LMp8rUYpR1jXEP1cszkgai2VhrJryXhBR4GpWqUhFwvZvIg0hGjfOcvwWDOOCAk2Yg3xPe3mGFAaOAfpSjioMWzme1v/2DxMMbATa1+QXcxWNBluNG53KR6VgbI=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3624.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(366004)(346002)(396003)(376002)(39860400002)(8676002)(38100700002)(55016002)(33656002)(26005)(9686003)(53546011)(6506007)(15650500001)(71200400001)(122000001)(7696005)(110136005)(64756008)(66446008)(52536014)(66946007)(66556008)(8936002)(66476007)(316002)(2906002)(86362001)(76116006)(5660300002)(186003)(83380400001)(966005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0H+acKPGIt7j1DSxZZSOWtaBkLTy7NT31QFk8+oi1gLaGP0OffcmMRo6QS6L?=
 =?us-ascii?Q?/mfiMnji6y4Ol3Xjdw9C8gCHNs+7SEYCTs8gV9gssLo68KUIQSGMnKyj4R5y?=
 =?us-ascii?Q?xSkz7g0Whb+19xGZw9Aq7WCFhjtg1lTZ3yoBFL7WIiAgzPCR2a+ZjgaqAJLw?=
 =?us-ascii?Q?9vIglZEs4urQTpcy9rXDilwu3AzKQnltVuugSxO5kKGqBuA1AzJsonIBQj9K?=
 =?us-ascii?Q?nuqAd93K0dGNbAw2Pr1wUtPTMfH16mBf1m8eh7bXw9FXLLwagqVn4IkIRAs2?=
 =?us-ascii?Q?9TJpjS/9wU9iSuNU295SHgg27Q60yu49BzVly8o2o20V5DBBLOM7D+LuBtUA?=
 =?us-ascii?Q?kWe1eUY0Ek/ftsinx0jswTuGIqhQijmKg/cug2EUltyySvdPIx26zitzqsy+?=
 =?us-ascii?Q?p7DBWQ4ErNA1jupTna1yJBaZKai8X2QgS7iY5Tu87sQPVz0zUJuK5oDXfl8r?=
 =?us-ascii?Q?0sZDFadZZk1UvwGPsseHpbPE+Ol5KFXFth6+1/p1wquY/VCbTwSb8N4HmLln?=
 =?us-ascii?Q?txk9QtIOozNk9TAuPX18WrrQY2Os6N/i3CwTkSNsutzFosgaj1Bj6sUEU9Y2?=
 =?us-ascii?Q?w3A5kZ9MlVCpEB2PVrBmTI8M3m1nR2fnTHo8qOtAxtC2V/P2HG6Pi+CF1xNP?=
 =?us-ascii?Q?/pIY0192kDatAdo7wOtdv8IcI5nFKwY6bAkOD4RM/cBjckboSGBEzGqXsDck?=
 =?us-ascii?Q?TWFq/Ef2c2Bk2uxVJ3NdWZW8a2wUgjpbRSEV2dPSPbGuy79tFCNB8vMn2KPv?=
 =?us-ascii?Q?MJLUrdmOe2j+X8HA+lSb37zlVNUp8ExPUcNEp+EHWNAKyIlXUTbzd8Trw3sb?=
 =?us-ascii?Q?N19fjfaLo74ZcST01OHCbE2AlXcTmE80lmAe8u95NIb7lR4NeIl9O18Z3hX6?=
 =?us-ascii?Q?NPC4/n09uiLW40VcRbN4figg3Qr2CB9XAgz8KBhRcfs9lQKzWQwrkIF8YtNP?=
 =?us-ascii?Q?6z8vr6FyIwX88i/+cgurMpy4BohWWB8RMpfr82x4PEcN/0/dY0jRhfG8L4wb?=
 =?us-ascii?Q?mlBZ+9Fg64CTVBLNIqnIyfS88baBclU5PR6s/yvsf1ByMcm1kMBhwB+ToBnI?=
 =?us-ascii?Q?Cg/Ya1kkJmsd9tfjCAvtB5unSUrzDhlS2MdDO18vsx3AJ+W9QleuB8ODFdOU?=
 =?us-ascii?Q?vDziaRtPQjv83hYtgWxXjAifh9ZOaxVAnTW6StMgKmRIN8EC6uxAvq1qLKuq?=
 =?us-ascii?Q?H9a+dWwVrjpiWD4Zb1/JBaVoVYqCr350Sx3f9xBbfpcyFyjh2eb5TsH2GgiB?=
 =?us-ascii?Q?eVUtyS+pygpiQaD3XtI3PRyt1ce6gnMLq69p+viKQJ0RICSAlHgXgdZgk58h?=
 =?us-ascii?Q?Tg6UpOhq2Cyrg8gsurFl0iRc?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4b2fcd-0163-45de-82c5-08d9151f29e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2021 08:23:03.9131
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jiXTzQYHZ55E0zaOaxNiVz6AbpJUQVswQQvAdDoDd57Pb1cMtLqA5AfnrY00AfBRY5XWN71r4RR0yr1Yh+Vykg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4799
Return-Path: sangeeta.jain@intel.com
X-OriginatorOrg: intel.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello All,

This is the full report for yocto-3.2.4.rc1:  
https://git.yoctoproject.org/cgit/cgit.cgi/yocto-testresults-contrib/tree/=
?h=3Dintel-yocto-testresults

=3D=3D=3D=3D=3D=3D=3D Summary =3D=3D=3D=3D=3D=3D=3D=3D
No high milestone defects.

One new issue found:

Bug 14392 - [QA 3.2.4 RC1] failure in ptest : ptestresult.lttng-tools.tool=
s

  
=3D=3D=3D=3D=3D=3D=3D Bugs =3D=3D=3D=3D=3D=3D=3D=3D
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14392

Thanks,
Sangeeta

> -----Original Message-----
> From: qa-build-notification@lists.yoctoproject.org <qa-build-
> notification@lists.yoctoproject.org> On Behalf Of Pokybuild User
> Sent: Friday, 7 May, 2021 12:06 AM
> To: yocto@lists.yoctoproject.org
> Cc: qa-build-notification@lists.yoctoproject.org
> Subject: [qa-build-notification] QA notification for completed autobuild=
er build
> (yocto-3.2.4.rc1)
>=20
>=20
> A build flagged for QA (yocto-3.2.4.rc1) was completed on the autobuilde=
r and is
> available at:
>=20
>=20
>     https://autobuilder.yocto.io/pub/releases/yocto-3.2.4.rc1
>=20
>=20
> Build hash information:
>=20
> bitbake: e05d79a6ed92c9ce17b90fd5fb6186898a7b3bf8
> meta-arm: 39bc4076b2d9a662111beaa0621ee9c1e37f56ea
> meta-gplv2: 6e8e969590a22a729db1ff342de57f2fd5d02d43
> meta-intel: c325d3e2eab9952dc175a38f31b78fecdcdd0fcc
> meta-kernel: 4b288396eff43fe9b1a233aed1ce9b48329a2eb6
> meta-mingw: 352d8b0aa3c7bbd5060a4cc2ebe7c0e964de4879
> oecore: d47b7cdc3508343349f3bb3eacb2dc3227dd94d2
> poky: 60c8482769f38a4db6f38d525405c887794511a9
>=20
>=20
>=20
> This is an automated message from the Yocto Project Autobuilder
> Git: git://git.yoctoproject.org/yocto-autobuilder2
> Email: richard.purdie@linuxfoundation.org
>=20
>=20
>=20
>=20
>=20
>=20
>=20

