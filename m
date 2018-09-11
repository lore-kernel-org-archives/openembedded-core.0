Return-Path: <alejandr@xilinx.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0079.outbound.protection.outlook.com [104.47.38.79])
	by mail.openembedded.org (Postfix) with ESMTP id 35CE874E1A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Sep 2018 18:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=mJBGhEfZhZ2Ymdld83tQdrAuY11FSTa0rbRTSBH1Tag=;
	b=QeV30bHl/dIRzRyTpFviJJj9lZiYkwFWzl3OXmC484BvtoQ8rk1f3uKkn5qXT/jocqFqxuR6NAXi5aoVZhXNCqPJy2dcvjCKwp1e5/VsCXRdrbvOobQ4mTwlSKf9b9JTFq8VqhWWUsG72W9MDdBODM9/dyDXxKtFCYG3XRkcgbY=
Received: from CY4PR02CA0038.namprd02.prod.outlook.com (2603:10b6:903:117::24)
	by BYAPR02MB4757.namprd02.prod.outlook.com (2603:10b6:a03:4e::10)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1122.16;
	Tue, 11 Sep 2018 18:56:33 +0000
Received: from CY1NAM02FT059.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::206) by CY4PR02CA0038.outlook.office365.com
	(2603:10b6:903:117::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1122.16 via
	Frontend Transport; Tue, 11 Sep 2018 18:56:33 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; netbsd.org; dkim=none (message not signed)
	header.d=none;netbsd.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	CY1NAM02FT059.mail.protection.outlook.com (10.152.74.211) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.1122.15
	via Frontend Transport; Tue, 11 Sep 2018 18:56:33 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fznpw-0007uG-Jt; Tue, 11 Sep 2018 11:56:32 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fznpr-0003Dc-G3; Tue, 11 Sep 2018 11:56:27 -0700
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	w8BIuKoW004990; Tue, 11 Sep 2018 11:56:20 -0700
Received: from [172.19.2.8] by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fznpj-0003DE-VS; Tue, 11 Sep 2018 11:56:19 -0700
To: Jens Rehsack <sno@netbsd.org>, Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
References: <20180907145533.31088-1-sno@netbsd.org>
	<10772E09-62BB-4CFC-A99A-F4816FAE87C1@netbsd.org>
	<CANx9H-BfgTfmNs+oGxC-Cm=Tp464=fpZnMb17vbTWsRg2LTZdg@mail.gmail.com>
	<CANNYZj8dyfuOnHxqE7V5n3sz=3XjqPS98E2n=t2uJbPkvczKyw@mail.gmail.com>
	<6FC71ED0-1800-46FD-9A0D-1664CE908975@netbsd.org>
	<CAJTo0LYHhteuX2y0cvW9DWOw1ey31EpWDB1Q8mHHCN2qaxUung@mail.gmail.com>
	<27c3c64d-574e-e4b8-f1db-343e4a660724@xilinx.com>
	<F9FC0A02-BAE6-45CB-A38D-7AE4E39E5587@netbsd.org>
	<badf35f0-449f-d632-c016-509dfb3f0f01@xilinx.com>
	<0EC3E010-56C9-4EB4-90B4-FD9A68F99AAC@netbsd.org>
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
Message-ID: <17b3364c-32a6-91db-6583-6eb7e0131394@xilinx.com>
Date: Tue, 11 Sep 2018 11:56:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <0EC3E010-56C9-4EB4-90B4-FD9A68F99AAC@netbsd.org>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(396003)(136003)(376002)(346002)(39860400002)(2980300002)(438002)(189003)(199004)(31696002)(5660300001)(64126003)(606006)(478600001)(966005)(229853002)(2906002)(8676002)(316002)(9786002)(110136005)(58126008)(65806001)(37036004)(65956001)(16586007)(356003)(65826007)(236005)(76176011)(54896002)(6306002)(106002)(426003)(336012)(84326002)(63266004)(77096007)(53546011)(446003)(14444005)(5024004)(1720100001)(26005)(126002)(36386004)(186003)(476003)(11346002)(2616005)(486006)(270700001)(6246003)(81156014)(81166006)(8936002)(31686004)(4326008)(15650500001)(36756003)(93886005)(106466001)(2420400007)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4757; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; LANG:en; PTR:unknown-60-83.xilinx.com; MX:1; A:1;
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT059;
	1:fb4UNsuh2giIkRfPMWAP/TMOkAs30A1+U0Ww1lSCxIf27ZBB7w3CPPzU4JEeNSJmqmKz6Ycf1MGhA2GupLRjPsnQmEuWoo9dcswcgPuwDcMUbthnavbvGdSmlquMrKtW
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd219f50-95f0-4536-cb49-08d618184ad8
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989137)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4608076)(2017052603328)(7153060);
	SRVR:BYAPR02MB4757; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4757;
	3:cfsSbjIKdtmiiVQ4Txl6O9zJf1XzEGBIlvHRtgpgVCAj4hY8iQVFC1Ol15JsJ7YK/3IznPe43lbxJqjkACTiFp8uPJ1BQ18ozEfi8JrBZiIhKtSvzbiKR1rG0YM7B6UHjsYyugwwTtomEJWWkd8ZtCPocFUb1q2M0rr6GCR/GHbILsuxaoVHsbG14PjExz1tBHNif87ruOnnR/uwzxim53tyKQz7sy653ItOQxDscwwsqRuPfVNQsH7lVDXTI7dXTjWawtkw85QgRi3Cf65EgwvM4iQMLDxE70mbUqYeszVDV+Hh+u77S4qEaPipvWg++58rOkpHRjiKNPR9rKEk2/2H6vfx5qqAkhadTvXKh+A=;
	25:Lo6tMPZrd2W/oHCLjaO+6kr0/37XOEzwvvY02wAQROsAnsRE+Wj0tgHQsnsdw5TbZhMOA0M2uhdNrAcOBYJ1CjcDLJDJ76tg28Kqg227LUuGaWHV/PbBw68Ij2iUKri5GB8xNDDXhjr40sKVFkWmLgMmAKIIj82M2i35hg4T3wASJickBjli+BjBAb24W4nQSPUyOhCaziHFOMnmZ+Ui8ikluCXI9Fmtv5VAvgoUz98pVmdMC+Nfzdg7xW7B0Tv6e5znLPXKtB++lB4wJ6StaqdXQQrxW6/tVPh8iJFnqU3/x1TEOVtPJYbahGIZmDHIMVinP2u/fjvjJtNf3uPeKg==
X-MS-TrafficTypeDiagnostic: BYAPR02MB4757:
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4757;
	31:z61q+v6Dq3PEDle/hPXwp54ZcPrTgZjxO3cZ/5YZP7CZw+0C3zw6ODiHe4oU/1uAoxdFvGx+pcf0gf1d9OWoJTMJ3qtw8YDha9tZoST9XODnaEleSn8VbC8i0im9yrSmlHV8sFJnA/d/8K9rV4OD154NenYqBeW+783zysYNexcjQHcwx81NUs/K5T8oyPnEepNc5zEIgUz3ZkDUSkQYGhBYz2L8Nmy8pb89KUV9ndI=;
	20:oM2/B3T1WcCJprUfV4VHcvTDI6sNrI6Hhs1zaLooFTru3k7+slGTHzlbttV+l5plBRoHWmsxDKAhnVjI/vLmNEe83K+l9+SkDD/iXBTJplGmwAFoWfUyImdloPDK7hz+ma42HHt7aqQuMmEY/z2jrPRheFrPvPVY5yWpiFm66aUH8N7Iaz0aMCzML+T3JpN2hN4p3k1pt2EW0hmQN/b6w3+ptlW5KrHRI8UAvWhYZmhyosgvRnF+EHzv7tjXGt+Q35H2sytRoW4VhGqCOWfRj8p85/2K8UFiJ9ovmsPX57k/hJGgJDR+4kWMljtST63qRcsX5fGgH6PfhJ+8wiJWaKdhKjXIUxQoztzKnbSHo/rlHAol6qUsliGxfvkTIW4GuY+2h81W7AOPFak0vNAATblGuLzP2uVYLAgg/EF36rgJnHloNB1LaBkLzAh9QV/ctVLEtE6ASKG7jawRgxM4nbM2YHfixpBUiqJc2p7aaclPxoQ29/nQGVmLhCRV7OEr
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BYAPR02MB4757F5E1963422735C429175AC040@BYAPR02MB4757.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(85827821059158)(264703809997249)(192813158149592)(17755550239193);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231311)(944501410)(52105095)(93006095)(93004095)(6055026)(149027)(150027)(6041310)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(201708071742011)(7699050);
	SRVR:BYAPR02MB4757; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4757; 
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4757;
	4:xH+/N5eCK8PmWXPyqQ5LUS8O35vzmgvU0iI2EFApUVpZXFRKkG4dOOEu4pMVRK4o2s9popz612Zht31NX2jflGK52hyCXCErUKW9t/1DrhbRrayHqFXrf74f4bJWU/CevfgrufIDafXM/iypL0mVEOi9pVHlvRjUNZZ5YzczmR1jdWP2I/7pfpu9nOd1TkFvQVlMFU3fISini7hGPwy14oYofp/BlMNz4SOAaapa9T2kV4X3z7aDe+7/z0ScB95BPYovzEAc/1JtIHKF57KKhzos9QKN/NQGXuNnGIKt83tUTuOZG5A34B6sLfRI2JV9bEWl9lSiHRc8xNIbEzR3Ra5t2OzftPpSzzyuZ5QVBf4cRd+VdBAhCMFzA7thQRm7hp8t+0iSS2BemXL9DLYwJTxs8CaY79hdKhLCfUg2FmE=
X-Forefront-PRVS: 0792DBEAD0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BYAPR02MB4757;
	23:BPg/XrFJ+1rfUEkYfWkm7nadzabtKJoKVmdHCoK2r?=
	=?us-ascii?Q?fT2qPOiF/7ZaKd9jjdiZV8upr/9X3Mw+9kYBIHnWkH90ACdnc2mIrLeZt72D?=
	=?us-ascii?Q?D3Tl10I7AjEFr+48yChDC9Lmq2CZNzmeo9YgB3LAL54lLCrErL058dnVHEzX?=
	=?us-ascii?Q?Es8DVdKj6BikCG4gEBpeXLeIPH/eYjCFKaSjUzGs8/AmyL4K5yPIX+RX8Mtz?=
	=?us-ascii?Q?70BMt2RiC+ug9uj1ug2iYp5mTRZ3X4yiVTQh9sZN4Sj/DECDXAUc8i9iwYYh?=
	=?us-ascii?Q?otAVWzxPL12hY4DSukhN+E1Na+eOfa66WM9gI4wgimBe/iCN2bsOAYRMQTC2?=
	=?us-ascii?Q?8BL40UOT/L/5tqk6haIgbYtRQdSoqXRmR2lpuDrPuXRy6mHkzpDLmIo2uxG4?=
	=?us-ascii?Q?UA+cYAm3nALlK0pd8zuz4KlY99AK/LlAE1GuNjXK89323cYEwSCimIOvkYNC?=
	=?us-ascii?Q?iTMWpiyO7J23yQKmQUSRg9uev7UE5hLQUiDvS6ICcF/zvpEFvx8A1VII4HaM?=
	=?us-ascii?Q?UjdHWtuoddHG8X4TH0SOS94H9LoAwOrD3csJigRQoCeNZc8k9HBtn/t6fyCJ?=
	=?us-ascii?Q?N1sVaz8Fk1EKIo0I0xvetKY6+Xnxs4Bk8eaXMKK53I1eDvs/fw1QtvrBJyNF?=
	=?us-ascii?Q?QXU/2bDjIe5MCrLoP7HmQPi0D2HzdJcq3fRJfUeCyQ3HTbA471oDwxdwmZcb?=
	=?us-ascii?Q?ASkF1/rtZ0qxa4Edddd/qZz5MCRym61ueS43WpQnp0hwj/uyDj+3ieeXf9Ic?=
	=?us-ascii?Q?bMpHbyKFwiA6muPcKSWQ+y+iZSBaX2IdkD66PuyZqgkYx/Oeg92961fcdWDU?=
	=?us-ascii?Q?M/Qv6GBBJ3ouLN40h5Hn/USw3uh+1V0MNXCpp957lmVTGiSETivReldc4XVF?=
	=?us-ascii?Q?E3UUnly4rkHu/W/QTKg33MqHZX7zwccMoOM4dAU8bguGwHCQsAL9drcKade4?=
	=?us-ascii?Q?DpKRE64rDXiH5SPmQCQAeu7uJz67iQXGHuMolF4ThJfzjFVfKs4WZI2U7CvC?=
	=?us-ascii?Q?fhivbsiLPVxniIk9BepdoQ5UsN+R7EIH08swOcKAaxR3dCaaeLPv4Dq8BEbj?=
	=?us-ascii?Q?Bzq0F3tBoEPycz4WYPvJ0NlFCXW6o+MuPfyd2mSkVUTgRoop+Flme3LfmOaD?=
	=?us-ascii?Q?rKvN2jXFrngu5cXUlH3vXehnWJzz/3Ve9QsXlQsxygwg/ct1EhZ3jW/uEbiF?=
	=?us-ascii?Q?uUkzydhLCmV+epP8gnSoIE+bF1I/3/Sd0RW90fK1Xksx7CKYK/Yx3P3QBeGh?=
	=?us-ascii?Q?6ix62MDk4uMRsBl9DTE9LSbuwupA9FybuPj/i78Yu5a8IPDc5PeZoZyuph/K?=
	=?us-ascii?Q?+ay3YW47ZzZPT+IDZECq7fQJY140WudZEC/mkL/5PzR3n2Xhjs4/D7JXNNhM?=
	=?us-ascii?Q?P/w7MCcn2//hs7nOmZMfummPvvacjaC3a9tFcWKidghpDdT?=
X-Microsoft-Antispam-Message-Info: hP8chFNY2Q7IgRurWPnS4o/1+mWieuQ/jgBTclV4NcrN7jX9q7PcasrL+NREcYw86sYjrSq/ufzG76iSNUBxOxhutMFF6OEyogebUTjGyhoW9dZoQy3WkrjJrfFGcWB6UXTYuGHN9HgNg1mAopgg3cmdUNNFC3cLLekepr3xXq2Dw+q8yXqerQN0pHcyBbKcUwO6bMZ8bgP4gY51YfF/oBjDBQpvRjKF1sVqDU8DhWrrA9k/X9YY1v0uHT0SAMpzW2gboBmT9mk0RBnAWY6lFS7JOlvzkZ59lZfgl56EVyub0n/HrBRrsvtUTF8nbdCiwFqjc4+llOHbygbwOPA2yhGg5rwb9MYP/eAENY9HTvI=
X-Microsoft-Exchange-Diagnostics: 1; BYAPR02MB4757;
	6:9uBfDP8TeNJnpIxuSaXQHOxhUpw0aC0WtD5jUvlbaGcRchnhmI9IB8xZsBi1JivylZV99QoU0DF7STba6mJGXLlQ7yhXXI7nKc43SlMI/H0C8QEnTc1HjToYhEb0j7eZ9XR0LGSC222a8zaH4H/V42pfNUM7lnNRP1qI/g9jwesuAJ7Kkziypt1Z1y9GtObrN9sfHjlFFsRVO6CkaDUsCNpLqMf+DB/WoYjiVaowyBPg8upaUzyqsFQGKzYowLn1Hz/2M7I0372uDIArk+X4lI99Qb5vzC1YXcAxGcRlSiJKg5wAHP2ShXvS/M9faLLKcO//4PYrclix0/BxTlmnarPq/6oo/XYlPCec/obAVrPkL2Ahm4T86XxJ/ZX19X3pWspFWbFGmNDlmvHhYBgDA8HHjItL7s/nEJ4VRxc1o7yp0KwEU8yWMCB4krZUtkVTCYH0NEJCUe6+vp/+94/mMg==;
	5:FvSsymkk/9dRM0TJtLIkMyBiyYlSiuA7EsinVyWrGdk5vutyVFk/JNO/sDKVaMUwgS3b5zZaChP7JiuFWODVxDhtE0LJilsQiJn08Zr3IDZHGgW7ua/hd6E6BJumfuqjNvqMsdK1BIm0YnWjH1BJ6sNgCxc9uitp0zEnzLDjU7E=;
	7:yXf0ZUfp9FNOzXjK9NBclbpwBcJyH6HkYdUt6uDZGyKGxAcuWINaYB1DtsnA59338TdC96IXifsddC5koWlA2e6aVl5hbfux6kA9hWRICYoSk8b7b6hFPdT9rOTC7saY4zmgjt84ZuRntxDkG0jtqvKQ/bNORqE2TN6JJuU+LrKheWat1z1+bZcQcaeeRLIwWZwK80zpGNdgDzVcgMHH7wdPLpG3lfqTiNiu+0w9X/PlWY6JcNn+Nu7umUWYFjNA
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2018 18:56:33.0226 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd219f50-95f0-4536-cb49-08d618184ad8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4757
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] python3{,-native}: update to 3.7.0
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Sep 2018 18:56:36 -0000
Content-Type: multipart/alternative;
	boundary="------------E99CCE779E1EC431B9E483B9"
Content-Language: en-US

--------------E99CCE779E1EC431B9E483B9
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hey Jens,


On 09/10/2018 11:58 PM, Jens Rehsack wrote:
>
>
>> Am 10.09.2018 um 23:33 schrieb Alejandro Enedino Hernandez Samaniego 
>> <alejandro.enedino.hernandez-samaniego@xilinx.com 
>> <mailto:alejandro.enedino.hernandez-samaniego@xilinx.com>>:
>>
>> Hey Jens,
>>
>>
>> As I explained before, when you create a manifest for python 
>> (target), it uses the native build as base (it literally runs the 
>> native python that was just built), it is assumed its the same 
>> version as target and contains all the modules provided by upstream, 
>> otherwise the missing modules cannot be checked for dependencies, and 
>> the manifest becomes incoherent, so its not an option to have an 
>> incomplete python native build.
>>
> In that case, uuid for target never gets deployed, but it is. And I 
> didn't see any packaging issues for `python3` nor for `nativesdk-python3`


I don't see what that has to do with anything, fixing the native build 
should not affect what gets deployed on target, thats exactly why we 
have a manifest, so they user can decide what to install and what not to 
install.
I know you didn't see any packaging issues, but that doesn't mean they 
don't exist, just from the log I showed you, I can tell you that the 
python3-crypt package is not created correctly, for example, if you do:

IMAGE_INSTALL_append = " python3-crypt"

Boot the image, run python3 and you try to import sha3, it will fail, 
because the sha3*.so library won't be on the filesystem.


And thats because the sha3.*.so library was just introduced in this 
upgrade, and our manifest isn't aware it exists, hence it'll end up on 
python3-misc and you have just created an unnecessary dependency from 
python3-crypt to python3-misc (and worse, a dependency which were not 
even aware of, until we test it manually), which beats the whole purpose 
of the manifest.

The do_package function is not gonna fail just because, so you won't see 
errors, but the files will be packaged incorrectly, causing runtime 
errors as a consequence, the create_manifest task tries to solve these 
runtime issues before they happen.

Cheers,

Alejandro


>> Yes you probably need a patch to look at the correct directories for 
>> the h files, as well as a dependency to make the h files available on 
>> recipe-sysroot-native.
>>
> Please check the submission.

I did, its not checking inside recipe-sysroot-native.


>
> Jens
>>
>> Alejandro
>>
>>
>> On 09/10/2018 02:05 PM, Jens Rehsack wrote:
>>> Hey Alejandro,
>>>
>>> I fixed that for cross-compile only, since I would need add a patch 
>>> and a dependency python3-native for one thing: calculate uuids.
>>> When you can explain to me why the python-native needs that, I'll 
>>> change that from -target & nativesdk to all.
>>>
>>> From my point of view it's not a question of having every (unneeded) 
>>> python module being built for the native python, which is used for 
>>> cross-compiling python and some modules only.
>>>
>>> Cheers,
>>> Jens
>>>
>>>> Am 10.09.2018 um 22:17 schrieb Alejandro Enedino Hernandez 
>>>> Samaniego <alejandro.enedino.hernandez-samaniego@xilinx.com 
>>>> <mailto:alejandro.enedino.hernandez-samaniego@xilinx.com>>:
>>>>
>>>> Hey Jens,
>>>>
>>>> The compilation log for python3-native still shows that it didn't 
>>>> build the uuid module
>>>>
>>>>
>>>> Python build finished successfully!
>>>> The necessary bits to build these optional modules were not found:
>>>> _uuid
>>>>
>>>> Please look at my previous reply to find how this can be solved 
>>>> (its likely a missing DEPENDS).
>>>>
>>>>
>>>> Also, this patch is missing the new python3 manifest for this 
>>>> release, there appears to be a few new modules that we need to 
>>>> decide which package they belong to, this is the output of bitbake 
>>>> python3 -c create_manifest:
>>>>
>>>>
>>>> | ERROR:
>>>> | The following files are repeated (contained in more than one 
>>>> package),
>>>> | this is likely to happen when new files are introduced after an 
>>>> upgrade,
>>>> | please check which package should get it,
>>>> |  modify the manifest accordingly and re-run the create_manifest task:
>>>> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so
>>>> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so
>>>> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so
>>>> | ${libdir}/python${PYTHON_MAJMIN}/contextvars.py
>>>> | ${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc
>>>> | ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so
>>>>
>>>>
>>>> Cheers,
>>>>
>>>>
>>>> Alejandro
>>>>
>>>>
>>>> On 09/10/2018 09:38 AM, Burton, Ross wrote:
>>>>> One thing to be aware of is that I've been fixing up Python's PGO
>>>>> support and there's a slew of patches in master-next and more just
>>>>> posted that this needs to be rebased on top of.  Good news is that my
>>>>> patches remove two of the patches we've been carrying!
>>>>>
>>>>> Ross
>>>>>
>>>>> On 10 September 2018 at 17:36, Jens Rehsack <sno@netbsd.org 
>>>>> <mailto:sno@netbsd.org>> wrote:
>>>>>>
>>>>>> Am 10.09.2018 um 11:35 schrieb Alexander Kanavin 
>>>>>> <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>:
>>>>>>
>>>>>> Large parts of dnf and friends have been rewritten in c++. I have not
>>>>>> yet updated and reviewed that, that will happen in the next cycle.
>>>>>>
>>>>>>
>>>>>> If I can prepare something for you - drop me a note.
>>>>>> Otherwise - the perl-5.28 update ("." in @INC, regex buffer 
>>>>>> overflow, ...)
>>>>>> is also
>>>>>> awaiting some progress (I can keep "myself" busy).
>>>>>>
>>>>>> There's already enough disruption to deal with (postinsts errors,
>>>>>> openssl 1.1, both caused by me :)
>>>>>>
>>>>>>
>>>>>> You know, corner, ash, ... things happen. But there is progress! 
>>>>>> Great!
>>>>>>
>>>>>> Good that we got all the way to do_rootfs though with 3.7.
>>>>>>
>>>>>>
>>>>>> Yeah, but than came postinst (coreutils :P) :D
>>>>>>
>>>>>> Cheers
>>>>>>
>>>>>> Alex
>>>>>>
>>>>>> 2018-09-10 0:38 GMT+02:00 Tim Orling <ticotimo@gmail.com 
>>>>>> <mailto:ticotimo@gmail.com>>:
>>>>>>
>>>>>> I did not review the patches closely, but I did try to build
>>>>>> core-image-full-cmdline with the tip of poky and these patches 
>>>>>> applied.
>>>>>> Everything was fine until do_rootfs... I've attached the log.
>>>>>>
>>>>>> Essentially, there are some bits of dnf and so on which are not 
>>>>>> ready for
>>>>>> Python 3.7. We have dnf version 2.7.5, but the latest upstream 
>>>>>> release is
>>>>>> 3.4.0 (with a 3.5.0 just 3 days ago). Not sure yet if that would have
>>>>>> helped.
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org 
>>>>>> <mailto:Openembedded-core@lists.openembedded.org>
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>
>>>>>>
>>>>>> --
>>>>>> Jens Rehsack - rehsack@gmail.com
>>>>>>
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> Openembedded-core mailing list
>>>>>> Openembedded-core@lists.openembedded.org
>>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>>>
>>>>
>>>> -- 
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org 
>>>> <mailto:Openembedded-core@lists.openembedded.org>
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>>> -- 
>>> Jens Rehsack - rehsack@gmail.com <mailto:rehsack@gmail.com>
>>>
>>
>> -- 
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org 
>> <mailto:Openembedded-core@lists.openembedded.org>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> -- 
> Jens Rehsack - rehsack@gmail.com <mailto:rehsack@gmail.com>
>


--------------E99CCE779E1EC431B9E483B9
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hey Jens,<br>
    </p>
    <br>
    <div class="moz-cite-prefix">On 09/10/2018 11:58 PM, Jens Rehsack
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:0EC3E010-56C9-4EB4-90B4-FD9A68F99AAC@netbsd.org">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <br class="">
      <div><br class="">
        <blockquote type="cite" class="">
          <div class="">Am 10.09.2018 um 23:33 schrieb Alejandro Enedino
            Hernandez Samaniego &lt;<a
              href="mailto:alejandro.enedino.hernandez-samaniego@xilinx.com"
              class="" moz-do-not-send="true">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt;:</div>
          <br class="Apple-interchange-newline">
          <div class="">
            <meta http-equiv="Content-Type" content="text/html;
              charset=windows-1252" class="">
            <div text="#000000" bgcolor="#FFFFFF" class="">
              <p class="">Hey Jens,</p>
              <p class=""><br class="">
              </p>
              <p class="">As I explained before, when you create a
                manifest for python (target), it uses the native build
                as base (it literally runs the native python that was
                just built), it is assumed its the same version as
                target and contains all the modules provided by
                upstream, otherwise the missing modules cannot be
                checked for dependencies, and the manifest becomes
                incoherent, so its not an option to have an incomplete
                python native build.</p>
            </div>
          </div>
        </blockquote>
        <div>In that case, uuid for target never gets deployed, but it
          is. And I didn't see any packaging issues for `python3` nor
          for `nativesdk-python3`</div>
      </div>
    </blockquote>
    <br>
    <br>
    I don't see what that has to do with anything, fixing the native
    build should not affect what gets deployed on target, thats exactly
    why we have a manifest, so they user can decide what to install and
    what not to install.<br>
    I know you didn't see any packaging issues, but that doesn't mean
    they don't exist, just from the log I showed you, I can tell you
    that the python3-crypt package is not created correctly, for
    example, if you do:<br>
    <br>
    IMAGE_INSTALL_append = " python3-crypt"<br>
    <br>
    Boot the image, run python3 and you try to import sha3, it will
    fail, because the sha3*.so library won't be on the filesystem.<br>
    <br>
    <br>
    And thats because the sha3.*.so library was just introduced in this
    upgrade, and our manifest isn't aware it exists, hence it'll end up
    on python3-misc and you have just created an unnecessary dependency
    from python3-crypt to python3-misc (and worse, a dependency which
    were not even aware of, until we test it manually), which beats the
    whole purpose of the manifest.<br>
    <br>
    The do_package function is not gonna fail just because, so you won't
    see errors, but the files will be packaged incorrectly, causing
    runtime errors as a consequence, the create_manifest task tries to
    solve these runtime issues before they happen.<br>
    <br>
    Cheers,<br>
    <br>
    Alejandro<br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:0EC3E010-56C9-4EB4-90B4-FD9A68F99AAC@netbsd.org">
      <div>
        <blockquote type="cite" class="">
          <div class="">
            <div text="#000000" bgcolor="#FFFFFF" class="">
              <p class="">Yes you probably need a patch to look at the
                correct directories for the h files, as well as a
                dependency to make the h files available on
                recipe-sysroot-native.</p>
            </div>
          </div>
        </blockquote>
        Please check the submission.</div>
    </blockquote>
    <br>
    I did, its not checking inside recipe-sysroot-native.<br>
    <br>
    <br>
    <blockquote type="cite"
      cite="mid:0EC3E010-56C9-4EB4-90B4-FD9A68F99AAC@netbsd.org">
      <div><br class="">
      </div>
      <div>Jens<br class="">
        <blockquote type="cite" class="">
          <div class="">
            <div text="#000000" bgcolor="#FFFFFF" class="">
              <p class="">Alejandro<br class="">
              </p>
              <br class="">
              <div class="moz-cite-prefix">On 09/10/2018 02:05 PM, Jens
                Rehsack wrote:<br class="">
              </div>
              <blockquote type="cite"
                cite="mid:F9FC0A02-BAE6-45CB-A38D-7AE4E39E5587@netbsd.org"
                class="">
                <meta http-equiv="Content-Type" content="text/html;
                  charset=windows-1252" class="">
                Hey Alejandro,
                <div class=""><br class="">
                </div>
                <div class="">I fixed that for cross-compile only, since
                  I would need add a patch and a dependency
                  python3-native for one thing: calculate uuids.</div>
                <div class="">When you can explain to me why the
                  python-native needs that, I'll change that from
                  -target &amp; nativesdk to all.</div>
                <div class=""><br class="">
                </div>
                <div class="">From my point of view it's not a question
                  of having every (unneeded) python module being built
                  for the native python, which is used for
                  cross-compiling python and some modules only.</div>
                <div class=""><br class="">
                </div>
                <div class="">Cheers,</div>
                <div class="">Jens<br class="">
                  <div class=""><br class="">
                    <blockquote type="cite" class="">
                      <div class="">Am 10.09.2018 um 22:17 schrieb
                        Alejandro Enedino Hernandez Samaniego &lt;<a
                          href="mailto:alejandro.enedino.hernandez-samaniego@xilinx.com"
                          class="" moz-do-not-send="true">alejandro.enedino.hernandez-samaniego@xilinx.com</a>&gt;:</div>
                      <br class="Apple-interchange-newline">
                      <div class="">
                        <div class="">Hey Jens,<br class="">
                          <br class="">
                          The compilation log for python3-native still
                          shows that it didn't build the uuid module<br
                            class="">
                          <br class="">
                          <br class="">
                          Python build finished successfully!<br
                            class="">
                          The necessary bits to build these optional
                          modules were not found:<br class="">
                          _uuid<br class="">
                          <br class="">
                          Please look at my previous reply to find how
                          this can be solved (its likely a missing
                          DEPENDS).<br class="">
                          <br class="">
                          <br class="">
                          Also, this patch is missing the new python3
                          manifest for this release, there appears to be
                          a few new modules that we need to decide which
                          package they belong to, this is the output of
                          bitbake python3 -c create_manifest:<br
                            class="">
                          <br class="">
                          <br class="">
                          | ERROR:<br class="">
                          | The following files are repeated (contained
                          in more than one package),<br class="">
                          | this is likely to happen when new files are
                          introduced after an upgrade,<br class="">
                          | please check which package should get it,<br
                            class="">
                          |  modify the manifest accordingly and re-run
                          the create_manifest task:<br class="">
                          |
                          ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_blake2.*.so<br
                            class="">
                          |
                          ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_sha3.*.so<br
                            class="">
                          |
                          ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_contextvars.*.so<br
                            class="">
                          |
                          ${libdir}/python${PYTHON_MAJMIN}/contextvars.py<br
                            class="">
                          |
                          ${libdir}/python${PYTHON_MAJMIN}/__pycache__/contextvars.*.pyc<br
                            class="">
                          |
                          ${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so<br
                            class="">
                          <br class="">
                          <br class="">
                          Cheers,<br class="">
                          <br class="">
                          <br class="">
                          Alejandro<br class="">
                          <br class="">
                          <br class="">
                          On 09/10/2018 09:38 AM, Burton, Ross wrote:<br
                            class="">
                          <blockquote type="cite" class="">One thing to
                            be aware of is that I've been fixing up
                            Python's PGO<br class="">
                            support and there's a slew of patches in
                            master-next and more just<br class="">
                            posted that this needs to be rebased on top
                            of.  Good news is that my<br class="">
                            patches remove two of the patches we've been
                            carrying!<br class="">
                            <br class="">
                            Ross<br class="">
                            <br class="">
                            On 10 September 2018 at 17:36, Jens Rehsack
                            &lt;<a href="mailto:sno@netbsd.org" class=""
                              moz-do-not-send="true">sno@netbsd.org</a>&gt;
                            wrote:<br class="">
                            <blockquote type="cite" class=""><br
                                class="">
                              Am 10.09.2018 um 11:35 schrieb Alexander
                              Kanavin &lt;<a
                                href="mailto:alex.kanavin@gmail.com"
                                class="" moz-do-not-send="true">alex.kanavin@gmail.com</a>&gt;:<br
                                class="">
                              <br class="">
                              Large parts of dnf and friends have been
                              rewritten in c++. I have not<br class="">
                              yet updated and reviewed that, that will
                              happen in the next cycle.<br class="">
                              <br class="">
                              <br class="">
                              If I can prepare something for you - drop
                              me a note.<br class="">
                              Otherwise - the perl-5.28 update ("." in
                              @INC, regex buffer overflow, ...)<br
                                class="">
                              is also<br class="">
                              awaiting some progress (I can keep
                              "myself" busy).<br class="">
                              <br class="">
                              There's already enough disruption to deal
                              with (postinsts errors,<br class="">
                              openssl 1.1, both caused by me :)<br
                                class="">
                              <br class="">
                              <br class="">
                              You know, corner, ash, ... things happen.
                              But there is progress! Great!<br class="">
                              <br class="">
                              Good that we got all the way to do_rootfs
                              though with 3.7.<br class="">
                              <br class="">
                              <br class="">
                              Yeah, but than came postinst (coreutils
                              :P) :D<br class="">
                              <br class="">
                              Cheers<br class="">
                              <br class="">
                              Alex<br class="">
                              <br class="">
                              2018-09-10 0:38 GMT+02:00 Tim Orling &lt;<a
                                href="mailto:ticotimo@gmail.com"
                                class="" moz-do-not-send="true">ticotimo@gmail.com</a>&gt;:<br
                                class="">
                              <br class="">
                              I did not review the patches closely, but
                              I did try to build<br class="">
                              core-image-full-cmdline with the tip of
                              poky and these patches applied.<br
                                class="">
                              Everything was fine until do_rootfs...
                              I've attached the log.<br class="">
                              <br class="">
                              Essentially, there are some bits of dnf
                              and so on which are not ready for<br
                                class="">
                              Python 3.7. We have dnf version 2.7.5, but
                              the latest upstream release is<br class="">
                              3.4.0 (with a 3.5.0 just 3 days ago). Not
                              sure yet if that would have<br class="">
                              helped.<br class="">
                              <br class="">
                              --<br class="">
_______________________________________________<br class="">
                              Openembedded-core mailing list<br class="">
                              <a
                                href="mailto:Openembedded-core@lists.openembedded.org"
                                class="" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br
                                class="">
                              <a class="moz-txt-link-freetext"
                                href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                                moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br
                                class="">
                              <br class="">
                              <br class="">
                              --<br class="">
                              Jens Rehsack - <a
                                class="moz-txt-link-abbreviated"
                                href="mailto:rehsack@gmail.com"
                                moz-do-not-send="true">rehsack@gmail.com</a><br
                                class="">
                              <br class="">
                              <br class="">
                              --<br class="">
_______________________________________________<br class="">
                              Openembedded-core mailing list<br class="">
                              <a class="moz-txt-link-abbreviated"
                                href="mailto:Openembedded-core@lists.openembedded.org"
                                moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br
                                class="">
                              <a class="moz-txt-link-freetext"
                                href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                                moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br
                                class="">
                              <br class="">
                            </blockquote>
                          </blockquote>
                          <br class="">
                          -- <br class="">
_______________________________________________<br class="">
                          Openembedded-core mailing list<br class="">
                          <a
                            href="mailto:Openembedded-core@lists.openembedded.org"
                            class="" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br
                            class="">
                          <a class="moz-txt-link-freetext"
                            href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                            moz-do-not-send="true">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br
                            class="">
                        </div>
                      </div>
                    </blockquote>
                  </div>
                  <br class="">
                  <div class="">
                    <div style="letter-spacing: normal; text-align:
                      start; text-indent: 0px; text-transform: none;
                      white-space: normal; word-spacing: 0px;
                      -webkit-text-stroke-width: 0px; word-wrap:
                      break-word; -webkit-nbsp-mode: space; line-break:
                      after-white-space;" class="">
                      <div style="letter-spacing: normal; text-align:
                        start; text-indent: 0px; text-transform: none;
                        white-space: normal; word-spacing: 0px;
                        -webkit-text-stroke-width: 0px; word-wrap:
                        break-word; -webkit-nbsp-mode: space;
                        line-break: after-white-space;" class="">
                        <div class="">-- </div>
                        <div class="">Jens Rehsack - <a
                            href="mailto:rehsack@gmail.com" class=""
                            moz-do-not-send="true">rehsack@gmail.com</a></div>
                      </div>
                    </div>
                  </div>
                  <br class="">
                </div>
              </blockquote>
              <br class="">
            </div>
            -- <br class="">
            _______________________________________________<br class="">
            Openembedded-core mailing list<br class="">
            <a href="mailto:Openembedded-core@lists.openembedded.org"
              class="" moz-do-not-send="true">Openembedded-core@lists.openembedded.org</a><br
              class="">
<a class="moz-txt-link-freetext" href="http://lists.openembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br
              class="">
          </div>
        </blockquote>
      </div>
      <br class="">
      <div class="">
        <div style="color: rgb(0, 0, 0); letter-spacing: normal;
          orphans: auto; text-align: start; text-indent: 0px;
          text-transform: none; white-space: normal; widows: auto;
          word-spacing: 0px; -webkit-text-stroke-width: 0px; word-wrap:
          break-word; -webkit-nbsp-mode: space; -webkit-line-break:
          after-white-space;" class="">
          <div style="color: rgb(0, 0, 0); letter-spacing: normal;
            orphans: auto; text-align: start; text-indent: 0px;
            text-transform: none; white-space: normal; widows: auto;
            word-spacing: 0px; -webkit-text-stroke-width: 0px;
            word-wrap: break-word; -webkit-nbsp-mode: space;
            -webkit-line-break: after-white-space;" class="">
            <div class="">-- </div>
            <div class="">Jens Rehsack - <a
                href="mailto:rehsack@gmail.com" class=""
                moz-do-not-send="true">rehsack@gmail.com</a></div>
          </div>
        </div>
      </div>
      <br class="">
    </blockquote>
    <br>
  </body>
</html>

--------------E99CCE779E1EC431B9E483B9--
