Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.web09.8010.1616502110445930595
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 05:21:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=J2Yg/gtf;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2361; q=dns/txt; s=iport;
  t=1616502110; x=1617711710;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=upYxu6hhfLv9q8p8VTUUzpcX0J3Nl67/x+niytQmGOI=;
  b=J2Yg/gtfoBTE3Rzf1Tn/QrIoFC3ez22Ic9peesrTdGCOPTAZeNfbcNbQ
   2mpRY7onUXYE4/+YaOUYCuE2tazeWZ1VvHZwqvWgsqwh8YZMqKoJgQ/4G
   rnZPd2FLOIPNkC4OMwgNCsk8VzM47vYsnhnc7Pk0FjyPykaDtS05d4nnK
   c=;
IronPort-PHdr: =?us-ascii?q?A9a23=3Ai/qi7hzy88zMlpTXCzMrngc9DhMPsqjoPgMT9?=
 =?us-ascii?q?pssgq5PdaLm5Zn5IUjD/p1FiVLPQYLBrflDjrmev6PhXDkG5pCM+DAHfYdXX?=
 =?us-ascii?q?hAIwcMRg0Q7AcGDBEG6SZyibyEzEMlYElMw+Xa9PBtQFcDiYEeUqXq3vnYeH?=
 =?us-ascii?q?xzlPl9zIeL4UofZk8Ww0bW0/JveKwVFjTawe/V8NhKz+A7QrcIRx4BlL/VZ9?=
 =?us-ascii?q?w=3D=3D?=
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3ARwWV46w0WfbUIxjxOwNhKrPxVe8kLtp033?=
 =?us-ascii?q?Aq2lEZdDV8Sebdv9yynfgdyB//gCsQXnZlotybJKycWxrnlKJdybI6eZOvRh?=
 =?us-ascii?q?PvtmftFoFt6oP+3ybtcheRysd07o0lSaR3DbTLYmRSpczx7BCkV/Mpx9ea+K?=
 =?us-ascii?q?6l7N2us0tFZwdsdq1m8kNdAgGUDkV5SGB9dOUEPbCb4ddKoCflRG8ead61Cm?=
 =?us-ascii?q?JAc+/IodDKk5yOW29JOzcM7g6SgTS0rIPrChTw5GZQbxpj45cHtVLEnQvw+7?=
 =?us-ascii?q?m5v5iAqiP0+mfP4/1t6aPc4/RZAsjksLlxFhzNjUKSaJ1lS/m+ulkO0ZySwX?=
 =?us-ascii?q?ILtPWJnBs6JcR07BrqDyCIiD/gwRPp3jpry1KK8y7ivVLZrcb0RC03BqN67O?=
 =?us-ascii?q?ozGHa0milQ3u1U665F03mUsJBaF3r77V7AzuLVXBJnnFfcmwtErccvjmdSWY?=
 =?us-ascii?q?ZbSLhdoZ13xjItLL48HTn34I1iLe92DMu03ocxTXqmaRnizw1S6e3pek52Mg?=
 =?us-ascii?q?aNQ0AEtMDQ+SNRhmpFw0wRw9Fatmsc9bomIqM0p9jsA+BNrvVjX8UWZaVyCK?=
 =?us-ascii?q?MqWs2sEFHARhrKLSa7PUnnLqcaIHjAwqSHo4kd1aWPQtgl3ZEykJPOXBdzrm?=
 =?us-ascii?q?gpYX/jDsWIwdlt/g3SRn6+GRDg0NtX6ZQ8mrCUfsuoDQSzDHQV1+ewqfQWBc?=
 =?us-ascii?q?PWH9ypPohNPvPlJWzyXYlT2QnzXIRTNGkeXMUZts1TYSPLnuv7bqnR8sDLev?=
 =?us-ascii?q?faI7TgVRw+XHnkP3cFVD/vYMVMh3rbHUPQsVz0YTfAa0b/9ZV/HOzx5O4I0r?=
 =?us-ascii?q?UAMYVKr0wQgVS97cebNC1avsUNDQ1DCYKitpn+iXi9/G7O4WksEAFaFFxp7L?=
 =?us-ascii?q?LpVG4PoxQLPUPyebMKoM6eZmhWwXuCKnZEPobrOT8ag24y1bO8LpSWyyxnIc?=
 =?us-ascii?q?mgKHimg3wao2/PU40RgbSZ5cDueooxC5EvXKAZL3STKzVF3SJR7EtTYg4NQU?=
 =?us-ascii?q?HSUg70gaK+lZoOGaX0bN9nmjqmJsZStFPSvUiRvtsUW3MeRjKiOPTn2ToGdn?=
 =?us-ascii?q?5xvBlR+7VaqKeckTyvQFFP/tgQARlpUiCrJ55oSC6Cf55Zn7j3fhoYdxb6uR?=
 =?us-ascii?q?WqzzcpemTr8E0OgHfGNiP8Q4CRPnNt/lZFz63t7FR4MkKack4YUAEmjaRNUU?=
 =?us-ascii?q?Lbp310zeiHIpCW7lLUQF4DzuYBWQu1Owc6Kh9yxtyxyR6ekCuDE3Jj3Zk1Iu?=
 =?us-ascii?q?nBFt0YAsHu82LoJ4uSma4cGfhIuJ5jKdD1q+cOFfmSYgmPMVrDeqkU8h3Qon?=
 =?us-ascii?q?YuIy9vrnY41fvuxR3+9WC9tURPScb6MRBjR7sBJcub4HWhT/GU0I9hhdZwue?=
 =?us-ascii?q?erKG3+ZpqHzq7QBgQzYS/7sCqzT+syr4pTsr93vLxvH4PDWT+NzWpZxnwFXb?=
 =?us-ascii?q?DJvVJbRL4+7KHKO4dpccBXcyVF/kAxnNDKKEcwqAT5DuI3YFlFtQ6XA/qZp7?=
 =?us-ascii?q?7T7bY/CEyIowX9fUOS9CBQ5P/JVSqO37xyMdN4HU1GLEwnrHhy9uKLcIPdTB?=
 =?us-ascii?q?iwf+ZY5VygLzuzdqReRKXtI8Rdkj9qp9WT2+mZeCrz1FqO4X91IqdS/32mRs?=
 =?us-ascii?q?33CgSWAuJM+8G7P1PJgqbC2r/HsB7nDT+gL0IfjslZcEZVaMJJgDwrlpc23S?=
 =?us-ascii?q?i/UbafmDNSr3JOpTV80kfw0Y2n6nrBFU5IMQfFkoxbNAMjQESgnIDA66yEz3?=
 =?us-ascii?q?zz7zhOxInbGEpRdt9IHcIMToKfFVYbFeEA+Liy/6QuhSxfYBAhS24k4QqNrN?=
 =?us-ascii?q?9b4Q=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CtCQAX3Flg/5tdJa1aHgEBCxIMQIM?=
 =?us-ascii?q?jUQd2WjYxCogAA4U5iEADmTWCUwNUCwEBAQ0BAR0NCAIEAQGBFgGDOQKBeQI?=
 =?us-ascii?q?lOBMCAwEBCwEBBQEBAQIBBgRxhWENhkQBAQEEATkGAQE4DwIBCBEEAQEfECg?=
 =?us-ascii?q?KHQgCBAESCIJpglUDLwEOn34Cih51gTSDBAEBBoEzAYNgGIITCYE5gnaKTSY?=
 =?us-ascii?q?cgguBEUOCWT6CYASBXAKDSYIrgkYFWiEEDyyBGxlIkTcHCo5TmnwKIYJliAa?=
 =?us-ascii?q?BUotvhziDRYE8iS6GDJAHj3KFEoIOiVGScYQwAgQCBAUCDgEBBoFrI4FZcBW?=
 =?us-ascii?q?DJAlHFwINjh82gzmFFFGEdHM4AgYKAQEDCXyHJwGBDgEB?=
X-IronPort-AV: E=Sophos;i="5.81,271,1610409600"; 
   d="scan'208";a="850546140"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 23 Mar 2021 12:21:48 +0000
Received: from mail.cisco.com (xbe-aln-005.cisco.com [173.36.7.20])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 12NCLm9F009314
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Tue, 23 Mar 2021 12:21:48 GMT
Received: from xfe-rcd-004.cisco.com (173.37.227.252) by xbe-aln-005.cisco.com
 (173.36.7.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 23 Mar 2021
 07:21:48 -0500
Received: from xfe-aln-005.cisco.com (173.37.135.125) by xfe-rcd-004.cisco.com
 (173.37.227.252) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Tue, 23 Mar 2021
 07:21:47 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (173.37.151.57)
 by xfe-aln-005.cisco.com (173.37.135.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3
 via Frontend Transport; Tue, 23 Mar 2021 07:21:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XneM9ar9CmhZX82sRjy9ru29bIfp3MPI2tWRahkBOKxp+pNbiamKRYRMrt4Z8aJfZxX3IyAzg4P7Q6WxC3dEJm+C7NMvzdvS9mOAF3DTc14ObNtCRifG6IVEuNe+pj5rgttyiZ69YjQTl4GZkbC5bTKpXlbcgW1XB7RipsujkM0cxyE32fPC2fYtMbVb1OA+DycU/kqsgJs+Liy/Iz76KJuyNA3yBs64drm5E5BSSX4bHv6ZJiuZ7KGsg67NpVIwRN10jE3mK6aXNSz52E68n06nsXFQhS6M+xC+kAsco+aNnes4iq0s8pOjBmg0Llr1f3Oi8ZLxyBzaplhyN2bYfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZoA1Vosv81DVktbdA46YTFn7jyvgUaR9JBKMnrQzLU=;
 b=KAJnKZxvn+Ji9uVWML7pVJ/hJuBJrRAwVWUdj8NrQ/4Pyh7MmQayWwzdpg4Uj0mM9d0IGljgXjEsOQRm5z1O4YdIf1V2uzkCw7PzcVZM/wxUg9LMAZzSmkqyHt6yVp7VVFqtl1bW4RU5amTGVQ2RiGHmA7OWnfch/TXFaHKcmMHlDD8PkB8jTT2MVXTJETgb7GJIz+W8P0xmlNiBA9NIPLK5gqjE9OOi0JAFR7UWjr8HSuBHX3qpgQFOkqE/w24VZxsVH1dKA0Esm/9YlYd+iDEJCaa+02YbxDZHzjJ9AcJKgcPJY0kftkDz9Hn1QQFDEWZf7+0S8c7Z5Kr/IISy1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZoA1Vosv81DVktbdA46YTFn7jyvgUaR9JBKMnrQzLU=;
 b=LxsU3OOG+LqPFvKDPxKzkVSFvIPC6CWv2afpNRe5i/hSxbWD4X++YNlNJY6t3AqJk+Y9H/gsTvoJTpbeZpJSL2OICvjzruL+xwd+V3EW2W+dbovyltITGVBhZs90fZ3s7NdT/8wG69XrKTIWBw5NRzwlwz3fWsDiRHTR8O5VJbk=
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by PH0PR11MB5045.namprd11.prod.outlook.com (2603:10b6:510:3f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 12:21:46 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::a14c:c696:84f:31cf]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::a14c:c696:84f:31cf%5]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 12:21:46 +0000
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: Awais Belal <Awais_Belal@mentor.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2] rootfs.py: mask run-postinsts systemd service when unneeded
Thread-Topic: [OE-core] [PATCH v2] rootfs.py: mask run-postinsts systemd
 service when unneeded
Thread-Index: AQHXHxMb/gWigHR7gUmde+vqH8HMeKqRf6EO
Date: Tue, 23 Mar 2021 12:21:46 +0000
Message-ID: <PH0PR11MB49022C7AFE9DE374C2E70713D7649@PH0PR11MB4902.namprd11.prod.outlook.com>
References: <20210322120035.6186-1-awais_belal@mentor.com>
In-Reply-To: <20210322120035.6186-1-awais_belal@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mentor.com; dkim=none (message not signed)
 header.d=none;mentor.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [173.38.209.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ebb5ace-d524-4b30-93df-08d8edf639f1
x-ms-traffictypediagnostic: PH0PR11MB5045:
x-microsoft-antispam-prvs: <PH0PR11MB50450377E4A04CACEC41F567D7649@PH0PR11MB5045.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wv+tEN5y+4VqArqiSBiTG4qrDofLtqIpCHgzeDkrSHANeCxRo5ZTkjGqM0lNrQsA4q5WVICx1U2AeguDr5YMqDILcRD1Gpr0C+aYD3zlEIqLx/Vt4Gj9CNjDnSlSCCSiM22wpPMxgqvRiJxuTGsjf8bOh05uDNvIkwiUciXr/PhcWg46L6TLATIlE9cOc63D7jFOQiSPCJa41nxVe+6gkdQnsDGUDgiABN/BpblH1XgeeUnt+8JOUmmqJ/WegrN4Yle2pCXiruFmAKB4033fIi39ugRk/9ByeM39ZDz3le60yVAPragJNrvmkXDWpSBD72rvvpW6fjppHO1Gf4X7dpfhBHQkPvDbPHgy/BEtHyVKgrVx4ZGpbBOulaQztzeUZzxkDj04GRmw5ldparbTNSWfBm+qw0W+Fe1dI8zapsZt3nClK5bAfU0eC5GRSleshz9VtTFZ4PvM5yH2qP3V4tCDFKa+Z1xmyzEdG+2HzAImGp0ZqckdvlT3VWgUhXfAkw5kJ9J4G19PEmjpTqH23idCBdsHiVm74PXajA9DSDWpwP3ZorNYWIq5F/spgc/GTbNOzoIRMeoupRlsGNrdT6uIGC2s68GnzeM6jERyPZzF6NR8UeCcm2hZoG6+xh7Xvt7nYmSqXbNeLD9QSTC9Vr17On7iXLRbbWbUcU0sMtBF1h43w9o8jltkf+cGUPjlXPRTuRQGOqVsGBZX1SmxIzZZ8GtziIawXF+SIrKt0zCCJJU+QZ2iPV83l3DSyMrH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(136003)(396003)(346002)(376002)(366004)(39860400002)(66556008)(8676002)(66946007)(66476007)(5660300002)(7696005)(8936002)(53546011)(86362001)(52536014)(91956017)(76116006)(2906002)(6506007)(64756008)(83380400001)(55016002)(478600001)(316002)(33656002)(66446008)(186003)(71200400001)(966005)(110136005)(9686003)(26005)(38100700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?M3uSl6lyL6yvnTCsMMG3H5F+pW9iNNlhxDwwI36Cnlmx1KWKvl2iURrYip7d?=
 =?us-ascii?Q?UExW/Li3Shn5b6fuedcNWKkzRR30jzdccvNrrzHy5eAQsq3s75b+qsPazgwg?=
 =?us-ascii?Q?umQ1c3EJsBnnWqAmttVC6IukKpAmv8w9Wl4nQ7n7hcFLKQy0rLfT7NTsOgwX?=
 =?us-ascii?Q?fKVTD8Do6qYtFnmVYypx5Wknmxg1DrEw+at44EidMmKg2rYY3dbSnjLmLQgJ?=
 =?us-ascii?Q?R86aYEJLO6F1w21NcQPwFcSNJgb8wP6QMqvRWI36sTP44L7r5QcROt//EmVh?=
 =?us-ascii?Q?XjU19XSPEHlewpUGOIHPHWZgTtK+INEuo1p+KCO5jS5u8gkhFeljTdnNkbS9?=
 =?us-ascii?Q?NowOXkCDjIL3AuDE1hA4+J867/e008Nlpe5xCSScYM4FzFXCO09w0WQFtYSJ?=
 =?us-ascii?Q?DbChEQQTCzbeyDTi7wzB+AUO62V4IcfsRf1K8/I2bLNc43mIEIW9lo7KB7vx?=
 =?us-ascii?Q?RwIRaTM7chUGcWfnBH1YPPo9+jFJdnpXmss1rnABuYSbRmpjJUDDbA/IQjmD?=
 =?us-ascii?Q?hXh6ASjxNLj50pMbw9tmZ+a398wLb38PTSU8P2xfoW5IAIVGPJM1D0Lgj5Sf?=
 =?us-ascii?Q?T26Kng11KbxLOaEMtzmyKf0/yYql49ZZXfC+qoDMA2SgJopubQpgU1Uxdf76?=
 =?us-ascii?Q?SFwd3WbbzLp7FwV25P6btInu1Djhjt+OPAeg2hJQeGt094QtXQVc6iXdOG9b?=
 =?us-ascii?Q?fa55TMrT8A10q2mbV9zHtjN8Zdo4YJH0BQOwPCWqS2LmO116+m+QN8h9CmKI?=
 =?us-ascii?Q?JTO0dTHCWc1apcfM7ZwCn2H4xFfGDukINJn1cy0gXNaYarJTGP8aNXTVcPAb?=
 =?us-ascii?Q?gg+9JHtc3YzjatmfqKxSgFxMMqgSojGA4tLF3EKniOBcQLKQM75gy23hUC4l?=
 =?us-ascii?Q?YQhEWzJXK9XMhX8V4R7VSduYqx8xxKjmFDPKh6sY4CJr0WOq8iO9QH1ufezH?=
 =?us-ascii?Q?KlaouyiutirOOmiF2U1yHcc0L1HC7dIl8fHEumPgE/uN+AdBAT9AUS2rd0GF?=
 =?us-ascii?Q?WQ2NzFPkZfncv3Cho6cRTEX/cctIZsimFAEI9vF6QY9gKSPGBWQb+aU7ILvb?=
 =?us-ascii?Q?wg2jDfu9EfM/XaAeWO3OMdH1MR1mnqXKS03Hn0e2+k3rZa5m0pf9LPTA+s3C?=
 =?us-ascii?Q?0KgtFiTxwGBp80+Ygh6wgBaY+6Fqo16vwsuNej+qSHJx6yiP40/m0nA/H+86?=
 =?us-ascii?Q?A5HM2m6v0LOhavEx37gUwSl4K/4mAU7Vgu5R+Pe+wlFjA3SePM9zSExtQ6g2?=
 =?us-ascii?Q?f9zol2M9G3Gl1vp7WsP0kbKq73V+RFi590bIKhWytChf7hQ65ppObgMHkrki?=
 =?us-ascii?Q?gIY=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ebb5ace-d524-4b30-93df-08d8edf639f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 12:21:46.1342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5i3yjF7PhWKPv+8Cexlcm0hzgAZntyfj1x8MMFKPGE2T21dv3r3gS9IarooE+Pw0gRgjcmkdfoLZh6uAEoDRrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5045
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.36.7.20, xbe-aln-005.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Could you please look into logs.
Seems that path cause failures.

https://autobuilder.yoctoproject.org/typhoon/#/builders/101/builds/2114/ste=
ps/13/logs/stdio

***********************
Central error: 2021-03-23T02:03:58+0000 ERROR Error in POSTIN scriptlet in =
rpm package run-postinsts
***********************
+ systemctl
+ OPTS=3D
+ '[' -n '' ']'
+ '[' enable =3D enable ']'
+ for service in run-postinsts.service
+ systemctl enable run-postinsts.service
Failed to enable unit: Unit file /etc/systemd/system/run-postinsts.service =
is masked.
%post(run-postinsts-1.0-r10.noarch): waitpid(11256) rc 11256 status 100
warning: %post(run-postinsts-1.0-r10.noarch) scriptlet failed, exit status =
1

Regards,
Oleksiy

________________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Awais Belal <Awais_Belal@mentor.com>
Sent: Monday, March 22, 2021 14:00
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH v2] rootfs.py: mask run-postinsts systemd service=
 when unneeded

The service is unnecessarily run even when it is unneeded.
This was handled correctly for sysV systems however the
service still runs on the systemd systems as it is not
disabled/masked when not needed.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/lib/oe/rootfs.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 249c685dcf..fe35ce5b70 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -257,6 +257,10 @@ class Rootfs(object, metaclass=3DABCMeta):
                 self._exec_shell_cmd(["update-rc.d", "-f", "-r",
                                       self.d.getVar('IMAGE_ROOTFS'),
                                       "run-postinsts", "remove"])
+            if os.path.exists(self.d.expand("${IMAGE_ROOTFS}${systemd_unit=
dir}/system/run-postinsts.service")):
+                self._exec_shell_cmd(["systemctl",
+                                        "--root", self.d.getVar('IMAGE_ROO=
TFS'),
+                                        "mask", "run-postinsts.service"])

         image_rorfs =3D bb.utils.contains("IMAGE_FEATURES", "read-only-roo=
tfs",
                                         True, False, self.d)
--
2.17.1

