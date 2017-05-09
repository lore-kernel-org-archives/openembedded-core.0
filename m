Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 81129 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 09 May 2017 07:39:07 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0112.outbound.protection.outlook.com [104.47.34.112])
	by mail.openembedded.org (Postfix) with ESMTP id 6CEFB60069
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 07:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=auA0rLEhS1OXlaCFIouGfSZPqV+tRZL1zmGJHRzZCcU=;
	b=idLLXrWtyav8uHezcGSC04edygj+f6U5Y/bW+KJBILpfNYLpzDyqwcrSTesg+KA7ds3nmaKq/Fhv6GtV6/Nm/W+NGhUlZoNnsKwGG5TrOWGmP/9zm4dtkDkZB9b5hNHB0St3YbUitJvnuivrSWxyQUQ6DN3/wLOgGsSWzAzctFw=
Received: from CY1PR03CA0039.namprd03.prod.outlook.com (10.174.128.49) by
	SN1PR0301MB2048.namprd03.prod.outlook.com (10.163.226.157) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1075.11;
	Tue, 9 May 2017 07:39:07 +0000
Received: from BN1BFFO11FD048.protection.gbl (2a01:111:f400:7c10::1:109) by
	CY1PR03CA0039.outlook.office365.com (2603:10b6:600::49) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1075.11 via Frontend Transport; Tue, 9 May 2017 07:39:07 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD048.mail.protection.outlook.com (10.58.145.3) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1047.9
	via Frontend Transport; Tue, 9 May 2017 07:39:06 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v497d3gt002906; Tue, 9 May 2017 00:39:04 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 May 2017 15:38:59 +0800
Message-ID: <1494315539-29178-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39850400002)(39860400002)(39400400002)(39450400003)(39410400002)(39840400002)(2980300002)(1109001)(339900001)(199003)(189002)(9170700003)(53936002)(189998001)(110136004)(38730400002)(2906002)(105606002)(36756003)(5660300001)(8936002)(104016004)(106466001)(8676002)(50226002)(85426001)(356003)(42882006)(81166006)(2351001)(50466002)(305945005)(5003940100001)(50986999)(6666003)(8656002)(6916009)(47776003)(48376002)(498600001)(77096006)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN1PR0301MB2048;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD048;
	1:c2dsvT6VS7MdSA3IYwktXiwpHNnmDnAQbEhKQpg5IPyaqHy7DgEy/QIe0ZOr7jzz3nmRFtgQF6Lhie9wD7mwd/KrWLrbnP3wMeFL41yI31unM3uJpwPd4noz3Ay3LkAOcc4LlqMQfbQk7uP+v+MWSyR1DXbV/1+5o6KvLsTT2uwbYBJqzZEm9IUYAxegK7whdNYBOrBWu2D8fBpg1AT7nXCBZAANcPx+HusZkKI/h7rFv0ojkk69swdQ8Ha7IB7ZRw+7C3SY9ChS7dF3wZy1pLx/2qrEvaZgo7n5mKNfYFzelh6EesZIwvYNDFtG56rFpIxKvUQtTvjCE0h3+AuYSTfHiO6+2uyg2UPPyqMVpW8yp1oSIx5IGD9/bcOdumtLImr2fLp0R/6PfqmDVxqCal62X8Htrw96A1mD9MzklyMWhrBqNu/lUUmPMUDz+8zlRgd2iTMkYGb7k4G3Bdymt4R4b6KgShPKjKY0KBTiWW+XiR8s7Wzj7IwKyfoZdoqs1AlfCjIrdefWUSzqXq/ABwEFauzYbi7e2Y4CEF/F10josMmLsyXcCzrfxJRI/YJ5jyMavNU8lEeQSGsBQPQIZQ==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e360ec9-0df8-4540-a1b9-08d496ae794b
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:SN1PR0301MB2048; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2048;
	3:CtLs0PmFu9HYh6NDGuKhQ/0XfBITLW9OeR3FXHsWZNLoLeMD8LueN5N9TUC6v5mdX1TjaLNsaCGonf/XUYr70c9a7urIUncRrWPyoIr5wzwwerZC2nxv7u4EQgJzezsm4IvVV9c4w5K/dE8SWgqdGF9FWbGZ1tvgma77iI2jbPat8gLHvzq4/DcsIQvVFCNS29hYHcNYYcmIApgiSuJMHdu3lA31mcfrvgwJyF1UEDr+2198jMbVxZr4AyUiF3Us2Eam6+360DFkOzDgpOJDUbCiPwSigl/c5dwCbt/R3bAfPdLO3NfJdAR9ieAckcSwwFcforlebBWA7nN+tLs7PDxYXT6i5VSCz9MbdNmnGFlVHsezwhjubg7NoYj12BCHqmPiwelcNJ2ALYldju2VIHfIauba8YI+PouoDXOmNVwu9rjkAXamSKg8GPMgBV4QMs0SPPI+E/g/O7Qazdps9g==
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2048;
	25:44dIJi7FqpFwu5kDPrBGN+95brSoKdGqDHlhy/uDVKtMEjPXPYLVmF2AKoCmsSrHJvT5Qj20MUl+zB/ifyvTfXuksfaPHqjeijT9+ld7OeLYrSMV7cg8FOJBKjvVFMdyeeK403WtVJzet15lK05qrDUj19+4FgtJJNTQKJ7I1Ba4XeNasojyVTugcDBHlI0JIJ1xfwyqs7co5laLs+ngrNHqTH/BBMWkYr4P+uWdTHUL0mjg59h//ew/QCbXprb3V5FTSEpKncqAn1C+p+wy+f1Ajn/ZM00kPgmzlb95TrjCxwUS4pEdhiSgFVnv4zf0hmP6juwfAQboBoTEcrLMhjja3iGKVIAOdT/QeM06+8FilAxAUqX5qhbA4WrHUx52CrykhLrTnp4ZFBCOoj9vrPBns8DgXV1+64z/3mofRQoM8tgRJJkj0ZWkpJgiCgaC5NQbZYOo1zY+H5nfueePww==;
	31:+6QgrTzVtX9uhFqK6Fe0trV9WuhgCMPnGuFeVEpHSxtrJNATONZdj+PNVsnAC0KBNDvFLWKfLdMLtgsZk8aHDn1yxEGJYAZ2vLYgiuL3U2v+xfN7qhAjL8NBT+Zo6HhVg7DcR97Siar3cUi51N3i/CEJipOfQtwY30VQUUYV5ratchvJGBBWbo8x7FlCYc5i4YUK0xUmziUyhLit56fu23XzrmhhtTt4kZ2BeBF38CHp0tgQws/rYlsASRkoUfeqUCp6PNcztgT5ePXk60b9HBQn99loS95EuLkR+RtItrc=
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2048;
	20:GdBqy997VIzQ68P6xISOKgQH6ptSQoB4Z3vpWsmFdQEDd14j6XoZGUyuqeU1sX26RtSkA073rJRZN68tJ94ilSXuduVDPggey6x/2Ms4+WxtHJi0d4s7mmK/njTuE+Fl3ekduiSAtcGzlK7MA/CSmupGZ0x4TgliKm1LBvmC4JF0n7aVZqI0pYBJkkKQCaXBAhTHSahJrXjSaOpKyRjA2LE5VPg3U4stwsaWDQiokk4vyU0pMh+GDDvECORaG6MiK0S7dbdY/o2ESZYpUbL7ZN5qQT90Ot3ldCQFywzJlPpDT2OS+/c3VbjV5+bBWlFGCE1YXBhERVvHhr99Q9ZciyZ9C7jIfpa4k/SzKR702DNp1MydqWrJm0aWRBZaDww/lqOiGD+zHk/Ayj3n/K/+Ex2RkctTCWHAIfmgn3oLL73LLsD/yUae2UX/Fhynp6Ev2cg7IOOX31BdJki+IPx0y53f+LS3nkuJF2PrbHubX1mAC61d+Pp6AvGnWpHGtJ2V2tot0192eg/Uo7HD2Od6IcZsVjphIHBV8sx/nb0a5YbesBVCcH/YX3Sj3M3Vhb2ysYjqLQeYXxnxU3Y+WVfoPbqvJgl4jzO7ZQ9uZoSGzuw=
X-Microsoft-Antispam-PRVS: <SN1PR0301MB204897A1C2EE0DFB706CB1FB84EF0@SN1PR0301MB2048.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(13024025)(13023025)(13015025)(13017025)(8121501046)(5005006)(13018025)(3002001)(93006095)(10201501046)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061750153)(20161123562025)(20161123558100)(20161123555025)(20161123564025)(20161123560025)(6072148);
	SRVR:SN1PR0301MB2048; BCL:0; PCL:0; RULEID:;
	SRVR:SN1PR0301MB2048; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2048;
	4:gIQvvlPMbHTo0p9VjbsqPq/qmD9Ue2r2F6jkrwFJj+GTy4z0LQNBX0lq3YkQXKxww8ZDsZR01v9AuOKUCvovNI+eRSoWZYbAVdnnJm+COplqyBdd53St34/BkCmt/lWYpUZWrvXuynb5zplYK/XNKJfix+Hr+0QHlFp4amX0exO8p/uLQzwyGbOClC7kQe7Lg8iBU2O1gwtwxfmYNccekxCM4v7Quw2fE0EbM9wVMdn5C5YOHuZyfPWhE4cHoLkp4oKYmUvPROPmuOZOnNIPSEZdxkcqluFhB/TpbIsHbOjCaJzYUc7yW/K6KBDala8g8sZhqmiyzGUtl0snM5bBBT556kMUQALpu1deB2gN5WSGQuHJJLTPKCTjjLxHpglC31npqQoIDCRys140KygZi6bcSjKz6Ob4vre/hwEEjKFTxP8PUh1zygIVLiJqb7wo/G+CbQNyVwqxcnzzJ+/sPardchZS3wCK1hJ2O/86FLulze0ExA46aOTM2ZWEcx+GBDY8NWW3oV/zAuRlFTR1MBAQdx8VXHhN3/oOk4e5OF/QxytKJyAUF6ChgKKNGo+rA/LNWUraf3KvuKWYYqIUsiGRSc+xkYX9UBHfkqKt68mzEznu+UIgYqQX5Wd83G+/UVXubAmd2T8rMDHXNvf/My27c+9JDTtQ+8lSiZDIXoh5cp8j/NutDrHbUm3y0RlEkPffVG9craI0c567yWXWLZKFRNn9vSn32CZAC4CqDLQZVUTFlI4PiOa+TVmaw6nrvLdi4bM2xF+SKTPYCZSAX2zLu5pP5vm2SjRZPzXgY7JCY+nEL2g+OTjpdgbc1dE3Jpo+mgdVS9SQ/AoFioVVMJ+AuRjv9MiWKcuuIkxL9hghex3WmuhQCGpeMqZBT8yjCByBOPOdlD0fEFH+kUGu9FGUgAqyBidqW93tl/NRRqc=
X-Forefront-PRVS: 0302D4F392
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR0301MB2048;
	23:H7sT4fDv96wtIX/wS7/8Fu39V0u/JLbEpGToN2D?=
	=?us-ascii?Q?Y1ZAUrMcwbeP26D/RTHvRYlEENocezgy0pPs0uAod01Upl65qAnzY5fj2AOr?=
	=?us-ascii?Q?1iRxgyQOlOJccw4Imgr6OqwJzOOzs5OZx0wxszERFG0kKx2mHqVF6LdtCrjU?=
	=?us-ascii?Q?OigPl+3i9nvfZgGjeZg7nt/O2IUyxDArCg47zLK8xKLOt2s1kbPh+Otyo/Qe?=
	=?us-ascii?Q?CyCXGPjVfq8TtkK+DZhuKwEJ28AuKBZse4dU7QU+2Dtigp6bQkZv67Xl+Ihu?=
	=?us-ascii?Q?kRd3ZobF99xcrf+Xpo2c5KNOUW3hA7wOEBLgJ+50gocuvorgvrIU0vaGs/by?=
	=?us-ascii?Q?p6bGZU1FabNVxcrNEIxIlsRk4I6Ks1m3JXMGRO0VbycPqCzR1KmyDV0TdnSs?=
	=?us-ascii?Q?8nk+3fePUXSYynbYjewtxpphZN9b39FS94G/7IHafVwEFX0QtB5KH52ELYzO?=
	=?us-ascii?Q?Tz3n2EZ8dR+XasO0TeAqQUtXjiY8wafUz1bvl7fUr80Km9jyNvB+xB3qnKgq?=
	=?us-ascii?Q?A1ExGtqorMP+KewrXoQVgDn8dwgdTAYQ3KnpcPy3Z3jGgvEKGsjsDkh+LUgW?=
	=?us-ascii?Q?3KoCbUEDA8B7DuCpaw2I3bSL8Q3x8owqLDceaxf9PFDbX11AX0A0JLCsF1eU?=
	=?us-ascii?Q?t4Xqr5jaJlUZWcKnKHCEm8EX/8YySa32BuJRJGhBzR39iERAwuZzo1PWy0Mw?=
	=?us-ascii?Q?X5thROswJbGI+vhYQhclHdDJmSglMr9W9bvy0uX1qe6M6UqbvfgnoyeYBRZf?=
	=?us-ascii?Q?wqNHN4zvD4eZR4po1M5PuEKPAOHj6QX0uDH3DTzhxRLmgykNPd+/jw1Nm5tq?=
	=?us-ascii?Q?+/x13lGnL/iGpQREE39zoyxltydWyR1oszYm71/A1F5DQKeyxkGQL/twR+aB?=
	=?us-ascii?Q?mRSP65N/1GFDQcmutZyMCRxCSXs8WG3dWcUArIeRzr3Mc1T/7Izaa+M2pDlT?=
	=?us-ascii?Q?/8ndTZ01zwu1clwTeA8SVYO1hUffQdWPmqUOtm98cT6d/lIC23Zi5+c9GOP1?=
	=?us-ascii?Q?IQINjvsH03SD3XHOxjbbZsK4ucbmbydYFzfMNQnmO8Bnajm8aM+pUbmNpHBx?=
	=?us-ascii?Q?iICGU0OzaRgyv7sQomCk7kbI2Z+wEM/RYBm9fygTgyfGeM8qiig=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2048;
	6:FZNFX9vb6qBoNl8aWzpfrEg1crmpDVWabq4J0fvoLau81KWIoZEx4zw3hUCje/vPk/l9kz+afbz9qhH1COC0JpMRpnMI+lU9q5hjgZqBneOAhUoL5Mscf0xDn9QVH0saKdSL3XBfN8JtaWTW3VO9MsDbHPFdqFcyUhVuCU4rCJpKwXZlK2WcA37Q1RatRnbt6okdfY4TtVIqabttZh5dTEDh2hYEo55rnY3BlkhCoNj/oG9JM3zrVigKfeUtCjPeGH/E2Xvq1lSFa+UMl+m6fr0Iplr4uFaDElywZPDEnL1LJZ/YyPbccSm0m904QKYcNwqqHHSo6Ddv8U7X48jw/K3Cw8qkYzSMmnBPJocE4I6/vXDh0XnaCj+Iu9fks+3asIOyXRUg8Z6dTPxQOr/bOaTwFqtI3R8TK7cjh0uZujHOJbMJofx5h6558hA7h0KWpgRsrNdU4hLmxuCyDjo2VTPu5e527kTWakqQuOtMBfT+u7wXVe+4rXaO7HivBtQucdj171CEOttBGB13A3dCeqZ/Kt7KN4JHSiRXD+DtWFS02ix9lHCvNxde9NExBpNMTN0JZJulkxVktwfw/N4wFg==;
	5:9HKeL6vRlRUujXhnQzyO4Tfi+05XABGDknOZruXKrz0zrMCSqug/FWYSRGrJQlyDv9uTWPtFnYA57zEOPrzM7nbD8RHxAeLkac06iAGQd2LAkBcvHO0Kt70ujmlQQtR7jQSZ0je4/jhC8u5FNqbwEA==;
	24:0C2gbBEfr7AOLyEZKz4lhCtWeGuEtPtb0Rp5hNBhzH+cq8c63Y2S8ZyM2k1qQIuUZNLeq9ol1bttqfXg3r9LfKdNb+dGTOwM+eaaZ9/tqOE=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; SN1PR0301MB2048;
	7:pzG1KwLFTCx0y7kh3+yVnxvF/slRrVRLIjQHydlQauzJNQ6W0f/R4EJId/coXzEd2invUL9XXuf2YpDEyWY/g9vAUm0g3A4I/SE937wsWyJvMvyE9jAT7Z4na6VSDQFBSm74KD4BT7P43m7SrwNCJFyRK/LPHcwDx5F4xvkZswEbQImpq06sXhyDaOJAY7RXjRLV2lmBnf5AwML9Eg8noV5kYg2Td09QyZ/fQ9Yu4AkZLo22ekG6TNE1SMnUfN/urxdidQQ3y1+Ujsm0eA53M25iz3ud/xX/DY/PpAcU68jL/hoWaEsi5T0a90MKC+Rde+5D/GCwolbL/TUYUIn3fw==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2017 07:39:06.7686 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR0301MB2048
Cc: chunrong.guo@nxp.com
Subject: [[PATCH v2] kernel-fitimage: fix ${KERNEL_DEVICETREE} includes subdirectory issue.
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
X-List-Received-Date: Tue, 09 May 2017 07:39:08 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

    * For example:
      KERNEL_DEVICETREE ?= "freescale/fsl-ls1046a-rdb.dtb"

      ${DTB}= "freescale/fsl-ls1046a-rdb.dtb"

      but only the dtb name should be used.

    * Support "ext2.gz " filesystems

    * Support mutiple KERNEL_IMAGETYPE
      For example:
       KERNEL_IMAGETYPE = "Image"  or  KERNEL_IMAGETYPE = "zImage"

Signed-off-by: Chunrong Guo <chunrong.guo@nxp.com>
---
 meta/classes/kernel-fitimage.bbclass | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 2630b47..63f03a5 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -10,7 +10,7 @@ python __anonymous () {
         if d.getVar("UBOOT_ARCH") == "x86":
             replacementtype = "bzImage"
         else:
-            replacementtype = "zImage"
+            replacementtype = d.getVar("KERNEL_IMAGETYPE")
 
 	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
 	# to kernel.bbclass . We have to override it, since we pack zImage
@@ -342,15 +342,8 @@ fitimage_assemble() {
 	if [ -n "${KERNEL_DEVICETREE}" ]; then
 		dtbcount=1
 		for DTB in ${KERNEL_DEVICETREE}; do
-			if echo ${DTB} | grep -q '/dts/'; then
-				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
-				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
-			fi
-			DTB_PATH="arch/${ARCH}/boot/dts/${DTB}"
-			if [ ! -e "${DTB_PATH}" ]; then
-				DTB_PATH="arch/${ARCH}/boot/${DTB}"
-			fi
-
+                        DTB=`basename ${DTB}`
+			DTB_PATH=`find arch/${ARCH}/boot -name "${DTB}"` 
 			DTBS="${DTBS} ${DTB}"
 			fitimage_emit_section_dtb ${1} ${DTB} ${DTB_PATH}
 		done
@@ -369,7 +362,7 @@ fitimage_assemble() {
 	#
 	if [ "x${ramdiskcount}" = "x1" ] ; then
 		# Find and use the first initramfs image archive type we find
-		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
+		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio ext2.gz; do
 			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${img}"
 			echo "Using $initramfs_path"
 			if [ -e "${initramfs_path}" ]; then
-- 
1.9.0


