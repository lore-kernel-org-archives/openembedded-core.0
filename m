Return-Path: <asparmar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C8EC44507
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 05:40:57 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7465.1784266849769091482
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 22:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=H94bNzpI;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: asparmar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=22432; q=dns/txt;
  s=iport01; t=1784266849; x=1785476449;
  h=from:to:subject:date:message-id:references:in-reply-to:
   mime-version;
  bh=vjbOp3NuAYsbcYPZgublaRKQYm1XhzCXXk2nCdYMv14=;
  b=H94bNzpI6bHuI19XJXTMuC+u4FHRsla/2JHRVF0EVCXA7ayI4FYS/ihh
   E673+B7acr5yKtlq3LrJ6Qs9QKzM4iiCK+zXG1HJi5jSKwn4MxHg3BWgY
   RmuS3XMiCvu//XJXIm3KcD6PxkWirR2mFdSRf1t7xssbMaPmEgOuu4x/H
   Wg2tbZSBlsUZw3Ze2+I9x8Am5rJtQ4Re8RMhB+HY0jFbkrFSgdy9fAyjO
   8oXLSWFA8uz42HR0v8wXnh0gpbLouJ4TZGHyy264nmCPsTMDOfEB/MKUy
   8q+2Wj4LcKMUScAQnpn58gQ9NvBXKcPb7PpdLwpTbAb5uBkCaB2Dutur+
   g==;
X-CSE-ConnectionGUID: EXHiroM4SciCCqVKKlHjsA==
X-CSE-MsgGUID: YDnudk+jT+ySAT6D4Bl0jQ==
X-IPAS-Result: =?us-ascii?q?A0BqAgByt1lq/4wQJK1agS6BK4E9ATBTFnICgSFJA4ggA?=
 =?us-ascii?q?4UrhliCIQOeG4F+DwEBAQ0CLgEVDQQBAYUFAo1SAiY0CQ4BAgQDAgMBAQEBA?=
 =?us-ascii?q?QEBAQEBAQsBAQUBAQECAQcFgQ4Thk8BDIZaAQEBAQMBERUkAT0CAQgRAwEBA?=
 =?us-ascii?q?S8nCh0IAgQKCQgagmGCHRZBAwECDrFhAYE9AolZGjd4gQEzgQGDKAE/AkPbf?=
 =?us-ascii?q?gELFAGBOIU/gxwBASqBNYJdgSIYAYJJgjMnGxuBcoEVQnkvgUE+gQWBXAIDg?=
 =?us-ascii?q?SQQERoeg3WCMASCInoSG4E8Ax6BfIFfgRiLDlJyIgMmMywBVRMXCwcFgSNDA?=
 =?us-ascii?q?yovLSNLBS0dgSMhHRcWHlgbBwUSICpBRSMDTz04C0MFgVYCgghOIx8DOX+BL?=
 =?us-ascii?q?3VKdy1qAhAXaUEkghSBPgMLbT03FBsDBIE1BYxcB1sjgh8gAR5vASsEEzgwG?=
 =?us-ascii?q?YEUBpRojiCOYJUXCiiDdYwhjT6CBIYuF4QEjRSHA5JRC5h9I4I2izGVNIVaA?=
 =?us-ascii?q?gQCBAUCEAEBBoFoPCuBLnAVgyIJShkPji0Wg2CFE8kleQIJAy8BAQcCBw4DC?=
 =?us-ascii?q?4FokAACJgeBTwEB?=
IronPort-PHdr: A9a23:dKAGbRBn4idSONTYUAIMUyQVXRdPi9zP1kY9454jjfdJaqu8us6kN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+hmG
IronPort-Data: A9a23:NQAYVanQXZ7JNXbzjj4zZ9To5gzZJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJKCDyEPPaLZzGjft93a43jp0kEu8TQydBnQQQ5pCs1FFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZC31GONgWYubDpLsvzb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FaAo2udtBkQSz
 vcZAxsUUDOgg8K025vuH4GAhux7RCXqFIobvnclyXTSCuwrBMiYBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkEXUrsUIMpWcOOAj2LneiddoUi9rqss6G+Vxwt0uFToGIWFI4zaFZwKxy50o
 Er302LkDhJZNuDc2AGsziyA2sXLxSHCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO+Q+7AfIzu/f5ByUQzBfCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ22JW9QnOG/bDSpjS3URX550dYDcPYZWPpO+Xenbw=
IronPort-HdrOrdr: A9a23:yNaIraozv5B3c0o+ZDsZAUsaV5siLNV00zEX/kB9WHVpm5Oj5q
 OTdaUgtSMc1gxxZJh5o6H+BEDhex/hHO1OkPcs1NaZLUXbUQSTXfpfBOfZslnd8mjFh5JgPM
 RbAudD4b/LfCJHZK/BiWHSfadDsby6GeKT9JrjJhxWPGdXgtRbnn9E43GgYzRLrWd9dP0EPa
 vZzPBq4xCnfnMaZNm6AH4qY8jvzuegqLvWJTQ9K1oC8gehsROEgYSWLzGomjsOWTJGxrkvtV
 PCjxH44aubtfS6wA/31mPY7Zha8eGRhOerAvbituElbhHXziq4boVoXLOP+Bovpvu01VosmN
 7Q5z89IsVa8RrqDyGIiCqo/zOl/Ccl6nfkx1Pdq2Dku9bFSDUzDNcErZ5FcyHe91ErsLhHoe
 F2NiOixthq5CH77WDADuvzJlZXf42P0DwfeNso/jliuE0lGeZsRMIkjRto+dw7bVPHAcgcYZ
 lT5YfnlbdrWGLfSWzFtW9yx9HpdHEyEhCaBnUmgKWuomNrdLQT9TpE+CTZ9U1wrq7UR/R/lp
 f5G7Utm7dUQsAMa6VhQO8HXMusE2TIBQnBKWSIPD3cZeo60l/22tfKCY8OlamXUY1NyIF3lI
 XKUVteu2J3c0XyCdeW1JkO9hzWWm2yUTnk18kbvvFCy/DBbauuNTfGREElksOmrflaCsrHW+
 yrMJYTB/P4N2PhFYtAwgW7UZhPLnsVVtETp78AKhizi9OOLpevuv3Qcf7VKraoGTE4WnnnCn
 9GRzT3LNUo1DHcZpY5ummnZ5rAQD2KwXsrKtmpwwE68vl5CrFx
X-Talos-CUID: 9a23:5lf1dm8Jcv+vL4qlmSyVv2MkOsE/dViB93zRCGShN0VKTJ2XUnbFrQ==
X-Talos-MUID: 9a23:tShl3wXW+XREsJjq/A7AgixuN4Rq3+e/M2kxz7lakc3cNxUlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:40:48 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id B0D80180001FA
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:40:48 +0000 (GMT)
X-CSE-ConnectionGUID: DN1f5oitSuqBZ0rOdb/v7g==
X-CSE-MsgGUID: TbJH7+iIT12tLjEY4zN71g==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.25,168,1779148800"; 
   d="scan'208,217";a="55965047"
Received: from mail-westcentralusazon11010068.outbound.protection.outlook.com (HELO CY7PR03CU001.outbound.protection.outlook.com) ([40.93.198.68])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 17 Jul 2026 05:40:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TenUa61511Ljcm2JDLvNe1/XV9gxcTxvgbpj5WHDvP4dEJFmwnUAEcxj+K8FjjdDtEcmZBvZkuUrY85jFJVfEhXrbcKomhEMu8vNjRmESqJVqyfRIyeNLP3VWyT+XMttBR7/WE36MjGivCaMVQ6JAbBr86T9j/6+0pEYZv58oJ3HevvLU1ViYGf0rOgp63/8oRazWZuRwxcwRPWOk/3+GtJDf9OGxJXHQnbQ3dpPs0PSERP38Qxhhw1BE2sW+7YzLHIPcUbgeJQi0JfZqKCMzViEr72OfIfRcBQslHl4HXn03hd/bpLunKctssyaR2tbhN0fMsgwCypVjQ04tmdJmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjbOp3NuAYsbcYPZgublaRKQYm1XhzCXXk2nCdYMv14=;
 b=odboCzNUOsUbxNw7oUS15Wcd0b8mEHcQ5SmFJ2UGmjvzOyyv5ku10xFugmp8/gSLFjlhQYG6Ihd2I7WzsyjYyqJHaoX8PAkKR2x/+18uJvCe3CCvKYbvseb9rDZS9ELs9vWA0CSUYwSo8tAjZ5kGYHmBIyAKSotfEXTgIGfZ+xKiaT9pldsSB5089tjDjHw7U6kZM21E52dEPKmPmn2zvXUNHJFxF1sgLxm5SSA8DAjtGsXLOpsTdRqnsjZld+taNsQE3Fkn+KEMrPv7AAJClhrJdODK32m1IIvPEk1IY4ZukdddeAtGIKdU26RqHsl47QFM61s74yocJpXKw9K5LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from PH0PR11MB5902.namprd11.prod.outlook.com (2603:10b6:510:14d::19)
 by MN2PR11MB4744.namprd11.prod.outlook.com (2603:10b6:208:263::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:40:46 +0000
Received: from PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37]) by PH0PR11MB5902.namprd11.prod.outlook.com
 ([fe80::f95a:602a:34d3:5d37%4]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 05:40:46 +0000
From: "Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at
 Cisco)" <asparmar@cisco.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [wrynose][PATCH v2 4/6] rsync: Fix CVE-2026-43620
Thread-Topic: [wrynose][PATCH v2 4/6] rsync: Fix CVE-2026-43620
Thread-Index: AQHdFawTzq5X50lzZka0yCWhbh/PjbZxMkew
Date: Fri, 17 Jul 2026 05:40:46 +0000
Message-ID: 
 <PH0PR11MB5902C9F6C333AEBFCB6A673BCFC62@PH0PR11MB5902.namprd11.prod.outlook.com>
References: <20260717052059.773645-1-asparmar@cisco.com>
 <20260717052059.773645-5-asparmar@cisco.com>
In-Reply-To: <20260717052059.773645-5-asparmar@cisco.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5902:EE_|MN2PR11MB4744:EE_
x-ms-office365-filtering-correlation-id: aab51c99-ffea-4ecd-2797-08dee3c5f380
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|12006099003|16056099006|13003099007|22082099003|38070700021|18002099003|8096899003|56012099006|11063799006|10067099003|3023799007|4143699003|6133799003;
x-microsoft-antispam-message-info: 
 CGxmdizCilWP4g0aY3i2pDeL7UUcuogvFxKXWccdk3whTu8xvJE0gM5JwEhnZycuvhB5efOrEWDXfqOzF4eWzgMYZmXC5srWP0MfiGKd1DD1EcGSCyGGGUcMwvgWAxSip7Qb9tnK7DsIJV0EQ1MULUln9UhdjrPlaihWGBBeZpRJx90otf8CksLzVEatpe8KROr3FKbpFZa7C7A2Z9RWXQOHMd5/To5/qiqUc06ogQE7RWgdzDYzNiXzbKyQzeXdMs3B7P4HE3iLNnn/YVPofr+lcSfUMO30SQbRtGC269x20u6S7lu/39RCSphufTOaQBmFexSi9jckfm1BtIDwpZyeV9LypPZ/Bq4yDufLGz8atc8E9l8UPfCDY7+qpIXnf5M6eURgLeOhsKeYBgwkRFg5EGzvW8nDr5A0BJTNMoCXD5da1fqJ7e86hY2dLxXgGKtfMtq5cO7vEe+GK06yBkSk5nNOde4BJuP859qzX4GMYCX01QnZo4fDYSz8GUy+DyEOCzqjIpxmUJULp3n7cayV7vGBEItWHqU0ozYlxMWIVmt8T9avhRe06ba47KQseYsIL7cTlSdEqUdpoPUjPve6Bn7qmp7nIwvpSqqNMZ+DuFVLzD8T0GZNKoxoj3xIIe7ciVowQu5UF5iKhESppH3E3CwuzDs+AAQWvHEUy1w=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(12006099003)(16056099006)(13003099007)(22082099003)(38070700021)(18002099003)(8096899003)(56012099006)(11063799006)(10067099003)(3023799007)(4143699003)(6133799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?gZzOLQ7Yoo+Mt+iLQ1yC4l0rC2cjQTOS42n//M3D5AqITUj8xmG0kXUySZ0R?=
 =?us-ascii?Q?5ouShCWC6Bf3ABYlIKsEWQDakkuHIN0JJOCTgOkAr3Bv4FH2XuQUWM5Zfpx3?=
 =?us-ascii?Q?SUJW/l173i3NX/Hqr8M49CR0nJ9xXjA/HnU4M7L+DcjeHwrDEF2RgZZajOuT?=
 =?us-ascii?Q?t4tEu428eTYKTUk3jdiH0byyiVkBvhMOCTSfiCIfR1EjvDXgSGxBTSCGU25D?=
 =?us-ascii?Q?YlNYWSpEo8y2HjiQ4rP8JPzDqGX7CjdMw6hqFxPAuMfUi72lXAQa1QZvNJt3?=
 =?us-ascii?Q?9P0bfPCU2Culykkn8MNfxBEbhMX7qj/JHdcdUT15+2v1hQjn5k5rwF5qQCZg?=
 =?us-ascii?Q?/kz+wioxY/ETZ7OfY/9IBlcbvVieVK7PYbIyx6ds4fTeS/aUHNI9347rPDBd?=
 =?us-ascii?Q?lMbpakvHzEgcMPskhpDyrR6c0e2cMlHzf3jabplAviE4ru8oxLId279TKdc4?=
 =?us-ascii?Q?NjmL1BD6LmBIqz5LmeeMM2Kd+sbQiS1s2POcV3a9XEwC0S3h82G0wTCarTMz?=
 =?us-ascii?Q?VvrbXcR3uP2cyXA2JRQ3y83K27upQSZMCvZLrb2NSmMtWRd4f10S7ZkohAAg?=
 =?us-ascii?Q?scxeGxflxZyZ6HOA3oCc7g6oAxXW2at17UoT0RGitgMF0KGUVj/75esf82bk?=
 =?us-ascii?Q?5quaGt+kuL8D3Sbm+pUjTPFpTEPsSdpe9gH9jUe06qZ4/zRvcW8gk9LGI4QP?=
 =?us-ascii?Q?uOoG/rpz/KxtvBNeX1gv+HajQ/Br3tv4GHUBDIx4A6RBaiIPxmcglXQ/lfVO?=
 =?us-ascii?Q?HYKG/c5sHjBHvRsoxnRwwcpvnno507C0zNjQyzvXFNSkS/r6t3qxqf4PvLjV?=
 =?us-ascii?Q?PueIRyz7yx4b4JTZba7zZQgk2M14d+LFWXJT+LlJwp0LukDERsFxKQNKQDew?=
 =?us-ascii?Q?WcqC6frwRRG6aXp815rUp0W+tEOJvE8eNZJX4ylzk1ksNAb3ExCJnIvlxVm3?=
 =?us-ascii?Q?3P4aYj6jPCVyXFdUD25jJqh/Aa+6cBHPC7XEUfC3khau2gXY7PxoreXuTeEx?=
 =?us-ascii?Q?HpdJ4Ul9lwNFFMlKZIaQUGGX5FHql/GRoIVyg3gqPPnP3oP00ecAUXW62/Cz?=
 =?us-ascii?Q?MmvLgyM15vQm4sLQ5MqSTEH03Dxg/UoAVrLIHv1y3IvY0t9dbTcGEdovGcIr?=
 =?us-ascii?Q?HwxvQt55vqDF3tVlFl/J3SXuoC5e1fhG/D2yCcd/JC3n7kUv71wSri8nJLph?=
 =?us-ascii?Q?O/vaCyxOTMH4Kqcb9OqIAnlAtADQaM6QgFOwB0s0t8pDleQA5Ln5LKJJXZV/?=
 =?us-ascii?Q?kQv69POqItxezqoSsWz6RFPnlaWDQc8hjH1FfI1ci/dh6qwy7M0B4pvGDxXu?=
 =?us-ascii?Q?d8c2w6v62gd8LrXTu8EU3kbYDYaJhWIrmgwTARX97hGQkpuqlAY/txdMQ2uY?=
 =?us-ascii?Q?L+Q4ZF+M4kuEB7OeB23e8JBBQA063/LzfuhB9WRarq5AS/mBgZYmMUdJxU2j?=
 =?us-ascii?Q?fuDsgXexDyXJ3DZJULB83H/DIBaLGT+Ngc9KS7MvII60GJOG889YH30rvkv2?=
 =?us-ascii?Q?H6ExTiPofQms3iembbwRaC6WiLZjBI3OfoAuY7bjFQXFyqyZndK5rpOi5mEY?=
 =?us-ascii?Q?qW4XY8Wo3TTohg0aoLU5RgepzxXy4oh/p4UU4vzWMRu9hn7x45E9d3q6Dd1t?=
 =?us-ascii?Q?1RZnx2NwcagS7sGfrtwVNr7k6pElbCeWAyvVXDzSY2FX2tXxfZSXvtfxi3Y8?=
 =?us-ascii?Q?EsY8U7jkNxO7xeyhgOow0IebYAHnU2mMxrsKMPIcQ4CRxKmz?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR11MB5902C9F6C333AEBFCB6A673BCFC62PH0PR11MB5902namp_"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
	hC2IFeQo1j0eLLldiZ4pUcOHp/w0MK9WKTkEYys9tcQbZSJk1aJtChjQNIAcb8vEt1TzhkH6bbDDsfseJVqbm4saRxBodUhLWDgFKaMdL0SmJryYW5Izs9KC1ZXUrq0o6he5AcqvJnkyaTGQURitqEADQgD7+YIzYrJk4/KB0QHaxBl1awo/BziATYM9kesml0miZQO6Uyt8hzEGW5K6rWvorGQXlZWCLDxAco4aoVett+8g7MocXeBSYoY8arXHyX77QBsPnnks/qyWOmup0t3oofuGra0oiqbFkd+fl2hYNGDr+o48y0MFKIlh+8jKZmZQLc3twOaUC/7VsZeNsw==
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab51c99-ffea-4ecd-2797-08dee3c5f380
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2026 05:40:46.6302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VqWYt0HR6tLRFx5O6Nj7Y5XYR0GQ0MeLoHZxcYycJmeas1eGlgJqLHwiWPlqLv+gZ0b7eX+LYsros+bfYcfnGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4744
X-Outbound-Client-TLS: ANONYMOUS;alln-opgw-2.cisco.com [173.37.147.250];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:40:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241132

--_000_PH0PR11MB5902C9F6C333AEBFCB6A673BCFC62PH0PR11MB5902namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

Please ignore this patch series. I will send corrected patches again.

Regards,
Ashish.

________________________________
From: Ashishkumar Parmar X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco=
) <asparmar@cisco.com>
Sent: 17 July 2026 10:50
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco)=
 <asparmar@cisco.com>
Subject: [wrynose][PATCH v2 4/6] rsync: Fix CVE-2026-43620

From: Ashishkumar Parmar <asparmar@cisco.com>

This patch applies the upstream v3.4.3 backport for
CVE-2026-43620. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/RsyncProject/rsync/commit/0cf200ecbb8baaf58070d825c4=
fbd892b4a63b69
[2] https://github.com/RsyncProject/rsync/security/advisories/GHSA-28pw-r56=
3-rxvm

Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
---
 .../rsync/files/CVE-2026-43620.patch          | 122 ++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.4.1.bb    |   1 +
 2 files changed, 123 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43620.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43620.patch b/meta/=
recipes-devtools/rsync/files/CVE-2026-43620.patch
new file mode 100644
index 0000000000..2852b74b8d
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43620.patch
@@ -0,0 +1,122 @@
+From 271771f089f5f7acff5cce1ca3242849b0f6a6a0 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Tue, 5 May 2026 16:48:16 +1000
+Subject: [PATCH] receiver: add parent_ndx<0 guard, mirroring 797e17f
+
+Commit 797e17f ("fixed an invalid access to files array") added a
+parent_ndx < 0 guard to send_files() in sender.c, but the visually-
+identical block in recv_files() in receiver.c was not updated. A
+malicious rsync:// server can therefore drive any connecting client
+into the same out-of-bounds dir_flist->files[-1] read followed by a
+file_struct dereference in f_name() one line later.
+
+Reach: protocol-30+ default (inc_recurse) makes flist.c:2745 set
+parent_ndx =3D -1 on the first received flist when the sender omits a
+leading "." entry; rsync.c flist_for_ndx() does not reject ndx =3D=3D 0
+in that state because the range check evaluates 0 < 0 =3D false; and
+read_ndx_and_attrs() only validates ndx with the ITEM_TRANSFER bit
+set, so iflags=3DITEM_IS_NEW (or any other non-transfer iflag word)
+bypasses the check.
+
+Apply the same guard receiver-side. Confirmed: the same PoC (a
+minimal Python rsyncd that handshakes with CF_INC_RECURSE, sends a
+no-leading-"." flist, and emits ndx=3D0 with ITEM_IS_NEW) crashes
+unpatched 3.4.2 with SEGV_MAPERR si_addr=3D0x4101a-class in the
+receiver child; with this guard it exits cleanly with code 2
+(RERR_PROTOCOL).
+
+The attack surface delta over the sender variant is large:
+the original was malicious-client -> daemon, this is
+malicious-server -> any rsync client doing a normal rsync://
+or remote-shell pull.
+
+Reported by Pratham Gupta (alchemy1729).
+
+Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>
+
+CVE: CVE-2026-43620
+Upstream-Status: Backport [https://github.com/RsyncProject/rsync/commit/0c=
f200ecbb8baaf58070d825c4fbd892b4a63b69]
+
+(cherry picked from commit 0cf200ecbb8baaf58070d825c4fbd892b4a63b69)
+Signed-off-by: Ashishkumar Parmar <asparmar@cisco.com>
+---
+ generator.c | 4 ++++
+ io.c        | 3 +++
+ receiver.c  | 7 ++++++-
+ sender.c    | 2 ++
+ 4 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/generator.c b/generator.c
+index 311e9b78..89f99db4 100644
+--- a/generator.c
++++ b/generator.c
+@@ -2146,6 +2146,8 @@ void check_for_finished_files(int itemizing, enum lo=
gcode code, int check_redo)
+                        if (send_failed)
+                                ndx =3D get_hlink_num();
+                        flist =3D flist_for_ndx(ndx, "check_for_finished_f=
iles.1");
++                      if (ndx < flist->ndx_start)
++                              exit_cleanup(RERR_PROTOCOL);
+                        file =3D flist->files[ndx - flist->ndx_start];
+                        assert(file->flags & FLAG_HLINKED);
+                        if (send_failed)
+@@ -2174,6 +2176,8 @@ void check_for_finished_files(int itemizing, enum lo=
gcode code, int check_redo)
+
+                        flist =3D cur_flist;
+                        cur_flist =3D flist_for_ndx(ndx, "check_for_finish=
ed_files.2");
++                      if (ndx < cur_flist->ndx_start)
++                              exit_cleanup(RERR_PROTOCOL);
+
+                        file =3D cur_flist->files[ndx - cur_flist->ndx_sta=
rt];
+                        if (solo_file)
+diff --git a/io.c b/io.c
+index bb60eeca..c654a7ba 100644
+--- a/io.c
++++ b/io.c
+@@ -1090,6 +1090,9 @@ static void got_flist_entry_status(enum festatus sta=
tus, int ndx)
+ {
+        struct file_list *flist =3D flist_for_ndx(ndx, "got_flist_entry_st=
atus");
+
++      if (ndx < flist->ndx_start)
++              exit_cleanup(RERR_PROTOCOL);
++
+        if (remove_source_files) {
+                active_filecnt--;
+                active_bytecnt -=3D F_LENGTH(flist->files[ndx - flist->ndx=
_start]);
+diff --git a/receiver.c b/receiver.c
+index a487ad5a..3fa68d71 100644
+--- a/receiver.c
++++ b/receiver.c
+@@ -467,7 +467,10 @@ static void handle_delayed_updates(char *local_name)
+ static void no_batched_update(int ndx, BOOL is_redo)
+ {
+        struct file_list *flist =3D flist_for_ndx(ndx, "no_batched_update"=
);
+-      struct file_struct *file =3D flist->files[ndx - flist->ndx_start];
++      struct file_struct *file;
++      if (ndx < flist->ndx_start)
++              exit_cleanup(RERR_PROTOCOL);
++      file =3D flist->files[ndx - flist->ndx_start];
+
+        rprintf(FERROR_XFER, "(No batched update for%s \"%s\")\n",
+                is_redo ? " resend of" : "", f_name(file, NULL));
+@@ -604,6 +607,8 @@ int recv_files(int f_in, int f_out, char *local_name)
+
+                if (ndx - cur_flist->ndx_start >=3D 0)
+                        file =3D cur_flist->files[ndx - cur_flist->ndx_sta=
rt];
++              else if (cur_flist->parent_ndx < 0)
++                      exit_cleanup(RERR_PROTOCOL);
+                else
+                        file =3D dir_flist->files[cur_flist->parent_ndx];
+                fname =3D local_name ? local_name : f_name(file, fbuf);
+diff --git a/sender.c b/sender.c
+index 99f431fe..033f87e5 100644
+--- a/sender.c
++++ b/sender.c
+@@ -140,6 +140,8 @@ void successful_send(int ndx)
+                return;
+
+        flist =3D flist_for_ndx(ndx, "successful_send");
++      if (ndx < flist->ndx_start)
++              exit_cleanup(RERR_PROTOCOL);
+        file =3D flist->files[ndx - flist->ndx_start];
+        if (!change_pathname(file, NULL, 0))
+                return;
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devt=
ools/rsync/rsync_3.4.1.bb
index f84f269692..2145d4ce7e 100644
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb
@@ -27,6 +27,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/${=
BP}.tar.gz \
            file://CVE-2026-43619_p5.patch \
            file://CVE-2026-43619_p6.patch \
            file://CVE-2026-43618.patch \
+           file://CVE-2026-43620.patch \
            "
 SRC_URI[sha256sum] =3D "2924bcb3a1ed8b551fc101f740b9f0fe0a202b115027647cf6=
9850d65fd88c52"

--
2.35.6

--_000_PH0PR11MB5902C9F6C333AEBFCB6A673BCFC62PH0PR11MB5902namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Please ignore this patch series. I will send corrected patches again.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Ashish.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ashishkumar Parmar X =
(asparmar - E INFOCHIPS PRIVATE LIMITED at Cisco) &lt;asparmar@cisco.com&gt=
;<br>
<b>Sent:</b> 17 July 2026 10:50<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Ashishkumar Parmar -X (asparmar - E INFOCHIPS PRIVATE LIMITED at=
 Cisco) &lt;asparmar@cisco.com&gt;<br>
<b>Subject:</b> [wrynose][PATCH v2 4/6] rsync: Fix CVE-2026-43620</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Ashishkumar Parmar &lt;asparmar@cisco.com&gt=
;<br>
<br>
This patch applies the upstream v3.4.3 backport for<br>
CVE-2026-43620. The upstream fix commit is referenced in [1],<br>
and the public CVE advisory is referenced in [2].<br>
<br>
[1] <a href=3D"https://github.com/RsyncProject/rsync/commit/0cf200ecbb8baaf=
58070d825c4fbd892b4a63b69">
https://github.com/RsyncProject/rsync/commit/0cf200ecbb8baaf58070d825c4fbd8=
92b4a63b69</a><br>
[2] <a href=3D"https://github.com/RsyncProject/rsync/security/advisories/GH=
SA-28pw-r563-rxvm">
https://github.com/RsyncProject/rsync/security/advisories/GHSA-28pw-r563-rx=
vm</a><br>
<br>
Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
---<br>
&nbsp;.../rsync/files/CVE-2026-43620.patch&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; | 122 ++++++++++++++++++<br>
&nbsp;meta/recipes-devtools/rsync/rsync_3.4.1.bb&nbsp;&nbsp;&nbsp; |&nbsp;&=
nbsp; 1 +<br>
&nbsp;2 files changed, 123 insertions(+)<br>
&nbsp;create mode 100644 meta/recipes-devtools/rsync/files/CVE-2026-43620.p=
atch<br>
<br>
diff --git a/meta/recipes-devtools/rsync/files/CVE-2026-43620.patch b/meta/=
recipes-devtools/rsync/files/CVE-2026-43620.patch<br>
new file mode 100644<br>
index 0000000000..2852b74b8d<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/rsync/files/CVE-2026-43620.patch<br>
@@ -0,0 +1,122 @@<br>
+From 271771f089f5f7acff5cce1ca3242849b0f6a6a0 Mon Sep 17 00:00:00 2001<br>
+From: Andrew Tridgell &lt;andrew@tridgell.net&gt;<br>
+Date: Tue, 5 May 2026 16:48:16 +1000<br>
+Subject: [PATCH] receiver: add parent_ndx&lt;0 guard, mirroring 797e17f<br=
>
+<br>
+Commit 797e17f (&quot;fixed an invalid access to files array&quot;) added =
a<br>
+parent_ndx &lt; 0 guard to send_files() in sender.c, but the visually-<br>
+identical block in recv_files() in receiver.c was not updated. A<br>
+malicious rsync:// server can therefore drive any connecting client<br>
+into the same out-of-bounds dir_flist-&gt;files[-1] read followed by a<br>
+file_struct dereference in f_name() one line later.<br>
+<br>
+Reach: protocol-30+ default (inc_recurse) makes flist.c:2745 set<br>
+parent_ndx =3D -1 on the first received flist when the sender omits a<br>
+leading &quot;.&quot; entry; rsync.c flist_for_ndx() does not reject ndx =
=3D=3D 0<br>
+in that state because the range check evaluates 0 &lt; 0 =3D false; and<br=
>
+read_ndx_and_attrs() only validates ndx with the ITEM_TRANSFER bit<br>
+set, so iflags=3DITEM_IS_NEW (or any other non-transfer iflag word)<br>
+bypasses the check.<br>
+<br>
+Apply the same guard receiver-side. Confirmed: the same PoC (a<br>
+minimal Python rsyncd that handshakes with CF_INC_RECURSE, sends a<br>
+no-leading-&quot;.&quot; flist, and emits ndx=3D0 with ITEM_IS_NEW) crashe=
s<br>
+unpatched 3.4.2 with SEGV_MAPERR si_addr=3D0x4101a-class in the<br>
+receiver child; with this guard it exits cleanly with code 2<br>
+(RERR_PROTOCOL).<br>
+<br>
+The attack surface delta over the sender variant is large:<br>
+the original was malicious-client -&gt; daemon, this is<br>
+malicious-server -&gt; any rsync client doing a normal rsync://<br>
+or remote-shell pull.<br>
+<br>
+Reported by Pratham Gupta (alchemy1729).<br>
+<br>
+Co-Authored-By: Claude Opus 4.7 (1M context) &lt;noreply@anthropic.com&gt;=
<br>
+<br>
+CVE: CVE-2026-43620<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/RsyncProject/rsyn=
c/commit/0cf200ecbb8baaf58070d825c4fbd892b4a63b69">https://github.com/Rsync=
Project/rsync/commit/0cf200ecbb8baaf58070d825c4fbd892b4a63b69</a>]<br>
+<br>
+(cherry picked from commit 0cf200ecbb8baaf58070d825c4fbd892b4a63b69)<br>
+Signed-off-by: Ashishkumar Parmar &lt;asparmar@cisco.com&gt;<br>
+---<br>
+ generator.c | 4 ++++<br>
+ io.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 3 +++<br>
+ receiver.c&nbsp; | 7 ++++++-<br>
+ sender.c&nbsp;&nbsp;&nbsp; | 2 ++<br>
+ 4 files changed, 15 insertions(+), 1 deletion(-)<br>
+<br>
+diff --git a/generator.c b/generator.c<br>
+index 311e9b78..89f99db4 100644<br>
+--- a/generator.c<br>
++++ b/generator.c<br>
+@@ -2146,6 +2146,8 @@ void check_for_finished_files(int itemizing, enum lo=
gcode code, int check_redo)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (send_f=
ailed)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ndx =3D get_hlink_num();<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flist =3D =
flist_for_ndx(ndx, &quot;check_for_finished_files.1&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ndx &lt; flist-&g=
t;ndx_start)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; exit_cleanup(RERR_PROTOCOL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file =3D f=
list-&gt;files[ndx - flist-&gt;ndx_start];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; assert(fil=
e-&gt;flags &amp; FLAG_HLINKED);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (send_f=
ailed)<br>
+@@ -2174,6 +2176,8 @@ void check_for_finished_files(int itemizing, enum lo=
gcode code, int check_redo)<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flist =3D =
cur_flist;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cur_flist =
=3D flist_for_ndx(ndx, &quot;check_for_finished_files.2&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ndx &lt; cur_flis=
t-&gt;ndx_start)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; exit_cleanup(RERR_PROTOCOL);<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file =3D c=
ur_flist-&gt;files[ndx - cur_flist-&gt;ndx_start];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (solo_f=
ile)<br>
+diff --git a/io.c b/io.c<br>
+index bb60eeca..c654a7ba 100644<br>
+--- a/io.c<br>
++++ b/io.c<br>
+@@ -1090,6 +1090,9 @@ static void got_flist_entry_status(enum festatus sta=
tus, int ndx)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct file_list *flist =3D fli=
st_for_ndx(ndx, &quot;got_flist_entry_status&quot;);<br>
+ <br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ndx &lt; flist-&gt;ndx_start)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; exit_cleanup(RERR_PROTOCOL);<br>
++<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (remove_source_files) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; active_filecnt--;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; active_bytecnt -=3D F_LENGTH(flist-&gt;files[ndx - flist-&=
gt;ndx_start]);<br>
+diff --git a/receiver.c b/receiver.c<br>
+index a487ad5a..3fa68d71 100644<br>
+--- a/receiver.c<br>
++++ b/receiver.c<br>
+@@ -467,7 +467,10 @@ static void handle_delayed_updates(char *local_name)<=
br>
+ static void no_batched_update(int ndx, BOOL is_redo)<br>
+ {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct file_list *flist =3D fli=
st_for_ndx(ndx, &quot;no_batched_update&quot;);<br>
+-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct file_struct *file =3D flist-&gt;fil=
es[ndx - flist-&gt;ndx_start];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct file_struct *file;<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ndx &lt; flist-&gt;ndx_start)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; exit_cleanup(RERR_PROTOCOL);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file =3D flist-&gt;files[ndx - flist-&gt;n=
dx_start];<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rprintf(FERROR_XFER, &quot;(No =
batched update for%s \&quot;%s\&quot;)\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; is_redo ? &quot; resend of&quot; : &quot;&quot;, f_name(fi=
le, NULL));<br>
+@@ -604,6 +607,8 @@ int recv_files(int f_in, int f_out, char *local_name)<=
br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; if (ndx - cur_flist-&gt;ndx_start &gt;=3D 0)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file =3D c=
ur_flist-&gt;files[ndx - cur_flist-&gt;ndx_start];<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; else if (cur_flist-&gt;parent_ndx &lt; 0)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exit_cleanup(RERR_PRO=
TOCOL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; else<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file =3D d=
ir_flist-&gt;files[cur_flist-&gt;parent_ndx];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; fname =3D local_name ? local_name : f_name(file, fbuf);<br=
>
+diff --git a/sender.c b/sender.c<br>
+index 99f431fe..033f87e5 100644<br>
+--- a/sender.c<br>
++++ b/sender.c<br>
+@@ -140,6 +140,8 @@ void successful_send(int ndx)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return;<br>
+ <br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flist =3D flist_for_ndx(ndx, &q=
uot;successful_send&quot;);<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ndx &lt; flist-&gt;ndx_start)<br>
++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; exit_cleanup(RERR_PROTOCOL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file =3D flist-&gt;files[ndx - =
flist-&gt;ndx_start];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!change_pathname(file, NULL=
, 0))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; return;<br>
diff --git a/meta/recipes-devtools/rsync/rsync_3.4.1.bb b/meta/recipes-devt=
ools/rsync/rsync_3.4.1.bb<br>
index f84f269692..2145d4ce7e 100644<br>
--- a/meta/recipes-devtools/rsync/rsync_3.4.1.bb<br>
+++ b/meta/recipes-devtools/rsync/rsync_3.4.1.bb<br>
@@ -27,6 +27,7 @@ SRC_URI =3D &quot;<a href=3D""></a>https://download.samba=
.org/pub/${BPN}/src/${BP}.tar.gz \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-43619_p5.patch">file://CVE-2026-43619_p5.patch</a> \<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-43619_p6.patch">file://CVE-2026-43619_p6.patch</a> \<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2026-43618.patch">file://CVE-2026-43618.patch</a> \<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"fi=
le://CVE-2026-43620.patch">file://CVE-2026-43620.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
&nbsp;SRC_URI[sha256sum] =3D &quot;2924bcb3a1ed8b551fc101f740b9f0fe0a202b11=
5027647cf69850d65fd88c52&quot;<br>
&nbsp;<br>
-- <br>
2.35.6<br>
</div>
</span></font></div>
</body>
</html>

--_000_PH0PR11MB5902C9F6C333AEBFCB6A673BCFC62PH0PR11MB5902namp_--

