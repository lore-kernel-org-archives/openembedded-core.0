Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 7229 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 08 May 2017 10:07:12 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0109.outbound.protection.outlook.com
	[104.47.37.109])
	by mail.openembedded.org (Postfix) with ESMTP id 2418271A37
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 May 2017 10:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=auA0rLEhS1OXlaCFIouGfSZPqV+tRZL1zmGJHRzZCcU=;
	b=Q0Hf5DgDw45YU+AMavl1dGF1jiw8lOuhpsCf/4F8r5jJia2PJf4BOOittAoFcIQ0yrmuxLlcSot7vaOsyezsjkRD7+pmidtKj4fA/AmFWxI50D6dbh0rPBT5Cl5WY8Qmt7VgBIT0LP+xGFJHsvvJsemmssVZ+IJuXfqJF2IRo/w=
Received: from CY1PR03CA0018.namprd03.prod.outlook.com (10.174.128.28) by
	BY2PR03MB379.namprd03.prod.outlook.com (10.242.237.21) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1075.11; Mon, 8 May 2017 06:31:44 +0000
Received: from BN1BFFO11FD028.protection.gbl (2a01:111:f400:7c10::1:182) by
	CY1PR03CA0018.outlook.office365.com (2603:10b6:600::28) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1075.11 via Frontend Transport; Mon, 8 May 2017 06:31:44 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1BFFO11FD028.mail.protection.outlook.com (10.58.144.91) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1047.9
	via Frontend Transport; Mon, 8 May 2017 06:31:43 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v486VfcL016737; Sun, 7 May 2017 23:31:42 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 May 2017 14:31:35 +0800
Message-ID: <1494225095-14165-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39410400002)(39840400002)(39850400002)(39860400002)(39400400002)(39450400003)(2980300002)(1110001)(1109001)(339900001)(199003)(189002)(9170700003)(77096006)(2906002)(2351001)(5003940100001)(104016004)(6916009)(50986999)(5660300001)(106466001)(498600001)(85426001)(50466002)(105606002)(36756003)(8936002)(81166006)(8676002)(305945005)(42882006)(356003)(110136004)(189998001)(4326008)(47776003)(8656002)(38730400002)(53936002)(6666003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY2PR03MB379;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; A:1; MX:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1BFFO11FD028;
	1:wa1gAeHODXQ63sgbv9A7NEh5F3QgcmuMBAjyBPW0e1JVA5XXQ7DPIjOEBgVixc+yerSISom3/JV/Xi7NCBEjItjpxl0Cf43WdR4TGhYw2FgFF4BTBUVHO5yRjqUQEujYrMp81N+Qqn81pHMVQiB7tu1F3L4F4GXT8kyGBjh9TWtU+BJ0ZnqnDBxheuGDg8sZmmHwqIAB2ObfIF0qFiCsAnjH0GuRIe3HHGDURIOVF34ZIddkgYO6QZVFfK5IFvBnFf85TQcrrwIIapBxuZ2eTgZI6jZbI4PdW5DG9bIIb39zyKxbx0fYMQxba5POkBff37bzjz56FqYA5Sf0MzOGQehri29kDHys9wJ9MfEHI182cw/OADvCbVYj6sbXgaIgfEdU8IDH43JY5otN3l8CrOA0Jy6qZoFL3F5XQKmv70x95+WBwWvPSepySiaqb3mUxmELryoG6zl0G4RlwT+khi+Y2dbOqNhyv5JzsJIk5mD2T2gSzVhv9kSU73drUFUnNAFK7cZq2T96An8d+wVMVCriKOTQHjdSN/nkIsK+kHuMR9VSb+rz2aIAjxh6Yn23RhW0a7HjtWRyv2g1Q6Xvug==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22fa1eb9-da62-4656-a22a-08d495dbe51a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081)(201702281549075);
	SRVR:BY2PR03MB379; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB379;
	3:OH+jVHqcR6Pue1NDBRSMctAvzcEM8huXefGmm1NkfGVzsuNwkRj3U6qEkzrRUNr5zbvzbs8uqxvCxdSvDCuAGJrtEjszRgSOsSCxdaDaufowwHQ+nvCBIPAGIyqfR9niMASIqO6q5O7QIprxxC5StfEPq50pjBQg4GqQg5WppgKIqY+noQXh+dMqXZt+QfRTY8cwEJ2IR3gh/61w2aNhU0wARSgGdDQ565b8dFmkM7oq3ojG2wKt2lMwGLfzuaA8SciCyiJAy3QsfAacOZWMBUrWiRykOJS0s2D9a/1pu01n3ouahzZK9pp2yNgFaM4jUwXWDdwQsAUPrXA2oD+uZVnVjYW/enyUAU/wPkbAYiZduViMWrsBOj9m4ABfVgu7XIdI9tA1BO56CXhJFiTKJFYo0phRXeVfdDjHRgU3NP+nCDgZ2ON6WK+YMoyx9PnRIoW5zF0A7PlsKjV8/xL8qDLpkOsHDdLmS0wuAUKFQ2CU48FQ1B7st+pwBbsQ3Jk4
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB379;
	25:Rzvu16SnxPByczy+UjBhKBzGRcWfS9gkgEGDXGNXCbDDAdz7hLemEQInCsUmLfPvpqxWvdAdiEd0ClQo/t5ultdZusPl5YbRHIMnY/71BYCmvt9vbeLYfU+GW4jDJt0hWw57pzdTH8H1pqRNcKWLWke7XGAw7SGLNYCfHGjO7lEnBk8FDRzDTnFiuktRl8nZGayEVjkbgbp6bneXRq0IAKyCoZ68s8Ug+0XAoesNQq8Nrgpo6yAnXmWGYjOScvp+0kCAJHNnOg83H8sKZ6yfsCRFAdHqdJe4vOfdE0kbVL65qOokujL7BOc/yKKQjgiQkuCyL0ur5qfbVrOpLAW2VkFmjvYH72jWspP/sAPWPe2l8uwG8vIed0jeCwQ2DbvIjyNtUktfTJZ4Hpucnjbeq+aoFfXGifiungOUZVCSlB44+RyLKb9CBMfWHaCViyPqQ7sPuJPzdLYGf6di5R7xMA==;
	31:m22uSEU66WBIbOSzSahe5KYjtcOtwo56oImdjdc+PsMgY08EMGROAWgeu4C6ngVSQhxA4kQMmzvYKnVFSSkPE/fH6M539qhhfTlby33kqoX7oxlt4P++0Oh5tZbjDNgzwcThixG60V6kHEgN/epVpWprmsJDeM0edVbkWfOlQf+3vq/mu68UmqeJ3y6AkYY40yLGfV2u4P8BfuRd1EAa04xPjckpT3WdGlUs7QXgBlojr8GTlqRqCA9wOqU8+lrfsHYDf6crCIu14ldKl4k056oV7PVK8XfsnS28iZi+v6k=
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB379;
	20:ge7uxLrfB1QG6GthopcH7bPm0X8th9qAW+iMU95pxjO0voT5OYAx0oonzOb1hb4c9/5rMGi9JG+2bKpgk1U+ozcQyhDz8SCr/obvfc4LecOpLkzy7mEEcvUgDtMgiwHwGAQWaSbs863vDNqUQ5K6DLv7gMD4ZNIiOlDb16sYq+t/T7GfKC3bsbcuRzJkDRc2QQ0ca2II1vzOkGq5hIsHniGFLBMn9qnK5ARq4Hw5C1I4M8iWEDXkqCrLqItUANbBt453PvRSGS6mhTpTm3AmGMVkKhepFX242d5DPpbA0tMZZ/oWK/FgrIMdSHd34I/tatoOFXIk7E5RKMxEyje8HsFPjjib5OOEKV0IvQU2lBJ1Pftcvh1uIg89f0cyAZlcdPqcSoEo1eFKx9KihqrQgsJctSgYE1A2S3lk4bg3YPSfEbHAIrEkML7yjW4xX983zDLeWpK03orYC5NYxBWXB0dGe2/obVxZtjvpNXFeH5O5QvoPfz5uemCj99QNlzPNrfAOI7jw3ZHpC1RX9kKvy1IE88dQQ5XgcOMfddfiXjUM+hWl3OPotJHHsv/B0ywKCYeYLekNbbMy2ZiFpciGnD0hpMdn1//qes4uqsRmwVk=
X-Microsoft-Antispam-PRVS: <BY2PR03MB37927F446F964417E16133F84EE0@BY2PR03MB379.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(13015025)(5005006)(8121501046)(13017025)(13018025)(13024025)(13023025)(10201501046)(3002001)(93006095)(6055026)(6041248)(201703131423075)(201702281528075)(201703061421075)(201703061750153)(20161123555025)(20161123562025)(20161123558100)(20161123564025)(20161123560025)(6072148);
	SRVR:BY2PR03MB379; BCL:0; PCL:0; RULEID:; SRVR:BY2PR03MB379; 
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB379;
	4:FMjlywzcQ+5XJamJ3Uw6OHUcA5blANcsKNBYgZGaRgzPC08rOS5mLt9EFOlcXax3uAEPtguIDUAGVpjgGwp2MlysMpkx93R1Hmli3KrRV98arpy0hvPamEwCEE4aCivj0oBxCvzdRX09LyHijgj03mFf9dlN9+ViPqaJEtuedgnNjhOv0sHllz4buUDmAdNbav1m7FOZG9fV/5TvGj5+ZYF/PzKIuD/6MxK0MnE9X1Ujqe+m1KyLPJsh/OvVrA8e+NO2XW6qO8Y6YbwGgaYcA12WGVvAw78po/D0esfgs0NSHrKIUAmb0Jwad0F2xmj5F4bq29bSO41jVKefok3VCsUqac+emVgVCyoTqQ3Hn7RflrIKzHmwIL3bBIVQ5i+JpJCT+0GM43YxviJ2S0Ay5xZbQ46fqPYT94CVh/GPv5ftlsrUmh5Wcji69KjjZfIUKU00CK+ayLiC6wReGzr77jm+r5mZbrgG0NDYHpj0Qom9R4Tj831NMYlxxldOmoAKCa8j3+WUO/i4e4SOnpCZExwI0aBiYIY5YLSNGSJAFWSwmr+5eDVLP3iPMLA6Ol3iw2ASf1vYRk1jxibdtGowJWEVFOxlWNw+uJZdImkBNemwzR6sQ3dyfEnFev+OHBSedbGx9n4q73dGvaPPGO9Qwz3ZWfIB1Q1AAYfi4NmlvYEIs0FxzERBw9l0qbxgFxlsAP0FPDqHFW8yZhIdunNsegD5UlKmvuoGnWB6clzhwl124jqw7Z6XyCuyptCsxRMdZt3G1rPmuYBTPsvcY1i+F8CQeP9skLylE2IQCoCSjItiIBTLWx0JpWIJBHhFrUdcumi9gxYCUVpkV9CwU1suyBlq9qcLlSFbO9rj8rRe5JKngmQGHTpkFUD+ORp4SeEw08j8X+ygx/Um4nwrigpUoV+JZYe00JAv0I4yAafxW4Y=
X-Forefront-PRVS: 0301360BF5
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY2PR03MB379;
	23:e73yKj/oEm6IhcagN5fCMVRHs+HZlrC+M71k70URQD?=
	=?us-ascii?Q?MJKTM1ibAASSZh/PwXu6qEBazTeIn0V/Rl2DAD4FeJ05hV1a5SodyvXECYtk?=
	=?us-ascii?Q?t+DyiRPwrr6XZvZ/PlHljglXm6iOtmsEkcFX7rloTC624jK6rCyvYVUmPdCT?=
	=?us-ascii?Q?cV+6WPCfMap7GlUu66vJXBskQ755CCD2VWeVrhwM2ifa07PNe8J9bKABLINw?=
	=?us-ascii?Q?7hSRq7vsri9Jmw/0JY28HoNf8ygHeIuhXH71UKjHj3VwdDV4Kf5dYU3jlrX7?=
	=?us-ascii?Q?9DQLAyL9co/uyq8g2hofHM+27Svkd/2d2EH0gE6l7Y/qf2iYYbPO9QdM0QFK?=
	=?us-ascii?Q?rvkjqdbcyLgcVSHAO/f2GITQC6pdG0qZlfP+k4HIteCGk5flZh1qAQKuZ3/H?=
	=?us-ascii?Q?isyKtjwUICXrsSYbLBuxKRxbValJ3+9+vltA9BddcMXVt/gCH7xFWijnC6LM?=
	=?us-ascii?Q?9VaLgnJ5uNpowiu5xk8isplsKH2znc7gWT7kG7P66KCBj8j486bf4tnfgTWZ?=
	=?us-ascii?Q?RsTaNNRrWyHIrpjLJQoFLcBZP78P9A8rjB7B6AV78y17nL9ySPFaJk3QPSrz?=
	=?us-ascii?Q?t44I1zaO6qKuj5jdUK5+EjstzX35H0SZ64lfAcQB5/t9jxpXhtxVfpN1C/8n?=
	=?us-ascii?Q?pPePtcVn8tsApKnrLABNjEVr0ZttXrZiN5vFDfmx6KihvH/bcz+M+rvz9xa2?=
	=?us-ascii?Q?/qEzalgwEYbEw+ypqL4fMpGxNGtIH4p07R81oJrmUtskaFYiOihfAfF+zgTN?=
	=?us-ascii?Q?vJySzQbXjM/WAaKwFd7cCSLrsu+PTwy1hZpeZq/eikeIR2TKCuL9TBf5hFUP?=
	=?us-ascii?Q?4/QEbd4rKQh6OldVnjhA986SHZKICYcYp9lBTLUqWqviarD3+wgQK4snN53A?=
	=?us-ascii?Q?Mw95xryRzKDVHW6UqgtGPL8SYMeXaMM5x229cghYVtaP7SFULmRYSCBg6CqF?=
	=?us-ascii?Q?ecjsJFXR7/M+UVK/WEfHTv8rBgNIbNMawV1gt/eIiQXATIWu472SRFyAvH+2?=
	=?us-ascii?Q?0TYPhNAZXPHhYjk8pSIR7kkCZ5lyEA5yVbGjao9PEXVkoO4BKS8pHzES7xJz?=
	=?us-ascii?Q?XRIIw=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB379;
	6:jvwHIBrLhH9z6OvOBXJsQZggX5O4ilVOrEvq0a95EjfqFIpdHCV01dBSOP5SsEMnjATJ7tYY94H54SJYT6FzF8+TCa9Le7V5Wdb9yN5cUeC3Zrd5Nb10QItW70oPCDtlvfg05Hc4S48S826MOwEBKIX8Cmz9WehgMdwhFHyHgmiI33eKKx4TezypQAo6W9Tj2VK1tNCyBJkbUIKC3gqZEEBQSeBN74eAldpxcF/uGt2uZ82aTmrEqQ7jAKm1Cr2j93O5Er9lwr0+R68oIZLKH9kKE/ZaoMCqpfBJozCzDuOmB6iWggaLpDpgL3cctwB8Y8zEJcrchntsW0Zqh2L8MOH0f4G0IdXeduqHQyQFVCHGvh/bukr/rE3rRDDJz2xFw092MfOkPDCbIeThi4tjSL65rqYQBH6OKwruUkTvWTA1wg9gBUPKyidJQ8VzsJLdeOZfJNuXsTVoJiCuq7i6LiN2/4r/BJV4jKBCVpNkgnaihx4HLjYjsm5kXVytuylrHFPIiHJi9oev+1D9Dv0NnuDtSnFhInlizRX9KKOyOLU=;
	5:rljIyjbq+IEiOjOV/wzx9IwcmLrsnqer9fzsjVkgsDy2YGSLxzOp3ubccoLDg7LWf4vihUnlhWp8YTiBC+mmByo6hBL+JV9GAGkX7vJDdJyg/lDhqjl1tD77nPd36m0X3KCQvB81hycjH2RxEZNc6g==;
	24:mJx5kvcUUBsppEKBV+59etkpgs7eamqObq+U7c7x1lFBHD6DPWDFj0NMFaQoCl1uc1Cbhk74mfisQUgKXW5PediAy4aOLL37kNKeB4tcjQA=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BY2PR03MB379;
	7:BwIaWuA3ecU37ylFFw4+ocDLNh7K1HnccrbSFGS2b7eztHWAcz60mCLakuqqRG0S6C7WhPI4H7UHV+nHO1wAyXLEwXvYTNj6stj7fWnvV6KNUlTb895K9byIO36CZiciyi8QxonxbXYWnDNshhzTO90yrYOlEC6Qr8HJid06gDejfD3GsterQHGkaRqWcfCe8olgTjrJ238GZ2r+fBjGsgrtINl/mGUKBwW1++jYYtF7UgacIyyYuDo60hacFW0EC90Tbm//Dg40UMHa4SK03G3VRwlzKUiNyqur77PAlquBMBxzc3OOOnw4CbaClIdW7jIJMJ6PZiC7VdRW/ZLWIQ==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2017 06:31:43.8470 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR03MB379
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
X-List-Received-Date: Mon, 08 May 2017 10:07:13 -0000
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


