Return-Path: <chunrong.guo@nxp.com>
X-Greylist: delayed 1921 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 05 May 2017 04:29:53 UTC
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-bl2nam02on0135.outbound.protection.outlook.com [104.47.38.135])
	by mail.openembedded.org (Postfix) with ESMTP id C679C6FFD3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 May 2017 04:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=auA0rLEhS1OXlaCFIouGfSZPqV+tRZL1zmGJHRzZCcU=;
	b=j2sftaHeLfoeqqXSw1pESqqIG7EKMICgAU3IgXeixKKHr1mxW2rfP+uJsUdjwoF87qQPGa3XU/d4LT/n62IJedwZzAI8IVIUdJ3XRIDA28voM7A0E603FulT+oq/0d/Lm2N4zJpgACB+YxPYclz0mof2H4EoNxaq+bryjAVhZhI=
Received: from BN6PR03CA0037.namprd03.prod.outlook.com (10.175.124.23) by
	CY1PR0301MB2041.namprd03.prod.outlook.com (10.164.2.23) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1061.12; Fri, 5 May 2017 03:57:52 +0000
Received: from BL2FFO11FD052.protection.gbl (2a01:111:f400:7c09::106) by
	BN6PR03CA0037.outlook.office365.com (2603:10b6:404:10c::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1075.11 via
	Frontend Transport; Fri, 5 May 2017 03:57:51 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BL2FFO11FD052.mail.protection.outlook.com (10.173.161.214) with
	Microsoft
	SMTP Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id
	15.1.1047.9 via Frontend Transport; Fri, 5 May 2017 03:57:51 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v453vnFg018354; Thu, 4 May 2017 20:57:49 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 May 2017 11:57:44 +0800
Message-ID: <1493956664-10565-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39850400002)(39400400002)(39410400002)(39450400003)(39860400002)(39840400002)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(9170700003)(110136004)(356003)(50466002)(38730400002)(305945005)(8676002)(36756003)(81166006)(47776003)(50986999)(77096006)(85426001)(53936002)(50226002)(508600001)(4326008)(106466001)(189998001)(105606002)(54906002)(5660300001)(104016004)(2906002)(2351001)(6666003)(8656002)(48376002)(42882006)(8936002)(5003940100001)(6916009);
	DIR:OUT; SFP:1102; SCL:1; SRVR:CY1PR0301MB2041;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2FFO11FD052;
	1:6ZG3CbNTVMQO9nG9z54u7S3PTzML6QRZyts2JhQmTVw2WK+RQ2BF2If6JAY4kmcy5169jrbs/DUUik9ZFa4kikamyHEb/dt7t6GbAtArFcmPpx1bYjsIOjBJzlvE1eUmaKh4La12JIGlZxpPLMecpdpTVpVy9UyX2x+HCC5rgU4FvfFX7iCVaNxH7n/ONJeF2ASn+iY42jq1T4DBpw8yfJPRPVH9264K8xdy5FP8Uw2LLLapY20xGeMyNZwB+ab/PmMqLGgwjaEUeMEw58LGMSFr8AJP5SKMOaqB3nPFOmviCRLsfqqb7eGlPjEu7ql8H9uuOHoCyBp21gSIi6xotDOSABwUZoMuW1jTJ9Id9xjkYN9wUtIIMULe1zij9okZHn0veMEmfQqCdBleZr7C0fwqQcfaiJz6ukclDxSxVByii9R2qZ7i77X0KY83ovn5L6mHZSjAD00r8dWJfsGoIb4/+Essl0DgQvJjQSShpNOvI/Rg5jx1Ry6I3/jA9O7tJ9AgvwpUgx8Vctdh7WHas9yrcIqtvypBda4qHoo4JeWGpmQ2kQ8cVWgC7I/iXv4yRnpawq1r9Rz3bT1NaJYwrg==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d368251d-8680-43af-de1a-08d4936ae717
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081);
	SRVR:CY1PR0301MB2041; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2041;
	3:5Io1sdWLH0FuAXnsnfMoj6476FZEJcsolntNsy/2QVo5Ow/MABnGOwdApnQ6BTKl33uBgbmjrrdpiWH8UIaYPHG8+vWwcK0vAAnCGi5koistBh8kiD+oC6m7xHue8rkQrpa8VCOcp3ZBg+SwSnDa86VcXdMMpWrKSwh7AgvJb/XvHHyTnDfJ2lo385SzKsXG7kDTV3oF3fVeRW/OZly8cXjQktJBnp2rkJfoaE67V8ZVyuDuqcQ+73PkEPd5ZRCMx+76RQxqQe4Rlz+FSQCef7oekVVUD9/Cj4266nsYG40FIqJvaUXUOplB0Q+6OQt3TEEcdmAWsodA3R9ZXmZRj0N6u88TpgxfNwHwJH+QFNkRoVethJAzpLZcmnJD9m4tOtqMsNipH1M9KKGGDITj44dWLHGVLvtTGqPyK/VAuuvCdXuNytOxrC2qEHgTanLP7D36Au20ztb+5ZkOY5rYqg==
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2041;
	25:BS8NArA5CFmklzO68EX+ENRCzxH7YvCnB5Wy80KcJmg5eStooLbwc9Tjbqp8U40cnHn42ug9MU3+OLpzrcK5ewwk02hE/uds/+wcmJ2MYanHgm91WB0Dv8PZUMevK25DgDzUO87gW8x/IdeZ8WKYHOKk2eyRCg6UnEptmmjXi/Bgw/fmD3oEdQCXxz7TEHburRhoVz5lUfnJoqCjIikky5t0PbhnvoNoE74i5DS62yVi+qUIyFqTj0giD7WM6ML6cSVTb/yoy0mKKrDwfVIX6KARNSz2hwOxW20IsKMCPXZb44jCH4oQ74PCHcH28EMskC/PYz1thbodCiWGF8Sn4+XfM9PHgMNSCASTu6w2E+ZOpnFoq9+kf9TUlMkQ6sn7E1w2Db6/ASxur95MoQg909INU8K5ZvkXFHK9PB4ey0y17TH/zavt2feqYODU/Wq4I+PtfASlbOxVkn6+72ec1Q==;
	31:mbXnzITzDia+tl/Zf1vLt2Sj2pEz9MJ4lJ1JJroBIRTVXq7Pev4p5QCyJTEGvbfnp4qQci+QkApQq1P7mwPJu/uK7nYtbXjBwWs8343I8t0Gj6WKKTG06PacYXl3jqA25YN7W8evYzjc/TI858rprAbV54Y0P0uXfcU+1Ng4tVSnmXp3RN1wG4uqPzgZjYgD39oeheIh/c7ll+ub2MzuddbQ1LIAuBAv+DZSrSmp+Ftg5KezyFRnNhYBcLS+ZFyh5uG5PsDSWfHVqagmYXZ74AzIO1mM+bZcsG3kBSVNCb8=
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2041;
	20:nHmDRXBjZsoiazdiha9/F/bUuc7WEjyJLK21a5DPFhR82qDO6Awit3AKcjz/ngxjppSL+r/KU8be0suxRcXY1hm6+zKg0WUTn7//uu4Z2O6OmxCLXVEZCd4hhx7+94SKDmMfQfW5+Zb1NGkwC9crhx4koOil5PjSvaF+MPRFVJsidXsOuRrUTfBaH4q3pDDPZijaCgN57wC+5yZYpM9DYzS+1VujeAK3RgdQCalb8vNODf/2L+Xi+nDYBu5zNRRE5+DfsqH30zlPki6EYSRyvVx8bisJUB0BfIxioorHR9VoENQt7T2oUt8OVnMKTMfDe3TdYJd8tBBQYtiblgTgNpNTBA4Pog2MKUSASMGpJlzsrTrFUFBGLyknMpU6eh0X7U1IIX9k4bfPbFum/lUtIYEFaD9DhdNGg6a7XF54Nr5l65arFf5yQAZBxGS0dQv6wXzzf4rrfUVtIASPat3KG5D3Kkqm5BdS8/PTQzcpTiFFELX2g83tWbN8TQPFISI+wiMMr/x8P2KEILNHFsJDVuLSnh+9bEDLHpqL/imQvd5RdvJImrsbqhH5fxU0QMHvOTGEC4Ed7PyiCV/2Ey/Bi/LSv3TRrDbxAVxQBuuUgL0=
X-Microsoft-Antispam-PRVS: <CY1PR0301MB204119815AD65A147CCACCDD84EB0@CY1PR0301MB2041.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040450)(601004)(2401047)(13017025)(13015025)(8121501046)(5005006)(13024025)(13023025)(13018025)(10201501046)(3002001)(93006095)(6055026)(6041248)(20161123560025)(20161123555025)(20161123562025)(20161123564025)(201703131423075)(201703011903075)(201702281528075)(201703061421075)(20161123558100)(6072148);
	SRVR:CY1PR0301MB2041; BCL:0; PCL:0; RULEID:;
	SRVR:CY1PR0301MB2041; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2041;
	4:jA0arJq4hp/SNOFe7EPH2JyXSAE7RtPiMT0dJHMqdA15h8WeIDt4sN3gJOlo1Jtctfbeb5qeVFshkARbBKFkNyR/6I9KKdzcpDvdtz3NIhuPdqMUvExoMdVI1q4sfKOeSNguS9oiCDqt79E3rJvvLEZR96+cdT7Y/y3k5+dZMh0C7zb9rOsoeCRV0IoZBLPh4wS+zz3E007bu8Fq8fGWURz+nRlJvqKvjSVCd8xxNsz3IkX8g60UWxTk5RV28rEgKuRLo5x2xyEkq0328Zu8cOgpPF/tI+T4C/huj8n4F5UlGAnEVK2m7RoTC7jhes1r0hcEZkxvNrttisdRYjuyGlyhaCYclTFWSqImqaqOwRUGfWSpC8bh8n8n6HLAmrAhYsKDLOHf8WWnqNSMgYH6sDKlwZQIukOdxBKrIB/TSWcmxltWcu4Q0iAAn6cysQMhGxbSrrJVzF3QkxpVBuYBtzk5cs+u/XXwiWjGbFdwgyctwfKUgA3NkRoy0oyEiWunZiPovt9LHw6HmJULcYJXjwktqNFPLxkzVk8vsZBhOKEn9Bw0vbi5lGKiC0fol2ubkoH47GsiT95mzpEjSnSQCM0ncVbvFqKTAEMz3MFpv0wcHSmrFXsLsZzLTYdgZ84JhKFIuDUAw84uQr7YcZmbkq/0V5JRIuMYdiBse+GhSfXYrDmLpeJne9CTWQ1YLu4JM27k+5IHnPh5uGb0RLacBfOTUSQ5klBPbsc8tYmbyREnZVO9/EfoPnTc8uPBE8T8L1VxeS4lTT28AzPubiy/wRnY1QH6X282wntHh3NiE/eXoD+qccf7RBygHqrbRpQP+bD0P84LulyCceYX77X6zZMf3qZXCMLIKISL0Rka9Q+h6DRDYJB0k1fp5u8ExHHNw5SNwxxc/6w+mTpwB1OIrVQJ3ZL6T+JJznIzZnE7wno=
X-Forefront-PRVS: 02981BE340
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR0301MB2041;
	23:iBofpQ/0W232zCJquDY+uku1o+YbaSvmikqZq9k?=
	=?us-ascii?Q?nF0tHAJMAk45iGTME1f6RvfBeBIIcMZxCwSm2kgbkOiVjcJPL27rXY9o5wBN?=
	=?us-ascii?Q?laDxOrE1lAVMKVh/c4eThxYXqlk2jVSSVFa0qnu7sdQDOJVeTaDBIeOxkpTZ?=
	=?us-ascii?Q?/pxQIIvZmpONR4Pb4oJ6z2gnqPYNzstZ6nI45ryQ8nJ23qVW8j3UcOzRXVhA?=
	=?us-ascii?Q?j4XUq5z7wW2uQnJthYdUaAa/sFRsNTAqwSDK3NKcEsRRnrNzzvzBbxsaNti8?=
	=?us-ascii?Q?RuqPYUUAm6iYEMwoOCm9xZGNjBqYfa0poxuLzLMZnALW0XnKawzzRnRer/60?=
	=?us-ascii?Q?3npJPEUKTi8QA7QnCFla27JONeSyI1qdaz7pPlhgcG42oSmBHSbbOptq6JJ0?=
	=?us-ascii?Q?TNgvrFPGMsuuUJtC/kD/UgNwkkE4ttA15gvt6KmDlVwqJy3FdnSOCs2yAOfI?=
	=?us-ascii?Q?4QLCAdjHK3PUVLDoVBGN7be5BOpGP4drD9oPS6eUNAQ4sifUOl4RkiNc0Q+f?=
	=?us-ascii?Q?v+f2FMzlza5G9DeZNn36ssV6W0JtL8EzS5vBXOuKjq7g+v0t1b2ZJ3kXVeDm?=
	=?us-ascii?Q?6nIRDfnVsjzTkyYJuXRT9zrt27/oIqYrFuzexOODI/p7LfNLxPSRVbWRKCcC?=
	=?us-ascii?Q?F44J+bi0GsaXdMpNeJQ4tfNhzEvrF/E+27swMgBc4UeGVWOTa3bGeA/giCMq?=
	=?us-ascii?Q?lm16F6LUOgOMAiix2B/ZulAic92qAgj6GFaZB2rPC8FMQ5NGVsxOc6HtzQY6?=
	=?us-ascii?Q?v2E9o3eXHmw7rmjI6CpPW0+vsZwNceDoDsDQpVvG4vkk8spivgHlbcEq54WK?=
	=?us-ascii?Q?eeVyG3ZpPJL6kHmg1DU5BaZuY0CtmC2/Yhvm/Deiz327xyE6fU5Ok7X7Q75Z?=
	=?us-ascii?Q?YrZLvlG6WcDzDx9jdnCBoNuy2GyPQcbck/CdvUrrFuf1u8/yLy1Y153NIL0D?=
	=?us-ascii?Q?xuwhpOpPGdZjh8IPlPdxJUURv1kczllnkxSn0l9ObPuvIe8/MGfq74TGxIyR?=
	=?us-ascii?Q?heH5N9efVM7mTDit3Xs6n1jz/HeMiMO1jfGOn7RoqoZld13lZ6ozvJOMo+ul?=
	=?us-ascii?Q?IjNOqBVnJJ/ykhswySXnMduLf6VQc6xkaZUEES8gRfPYNnsiJFRpRw+FVrEz?=
	=?us-ascii?Q?E1xt4vmBVq/o=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2041;
	6:45MSyE+GUf76eoXfM/Hu31AMvb8Lden4gFOZNYfeGErsrDhsupic0DUNGny/f6uAfAc5ObW7fy6eQPcfaqHVZyfPlmUPg8RJSgxDikeqTn4r5jD6NdzMJu8jAIWusKxILqgeOZC+IbdcvrI1rnO4H+Hwm2G5h/fwKMDPINJbYFQRWxo/Z7KN+oHyqjNrbnlH/Y6n7F8LaJVgONHwTv38nq92Yh0bxvH/IuTTa+88hjZGAdENWWQ2Pnjw0ypgSQMyRn8nPzblk8m55h/2A3kZ2/k369kiDHCRzhvZmTtSpJqJzPMGvHu82BHLqo82qhUy1bR+LlK9R6fbXLpz/g/IDHY2bSoKrCpfuBxEDgAPPUQ0/dyz15cwXOAMzkym8PBduHW6DUJ2tBovtmitbjisnDjDMJuRWeNVWWUJmEJ7r0CbFCCPiQfXH6vrXyr+ChfOBCcpqI//DQI6QkdIlDBVcl4HTo+e3eAnMTsaf6DQgmedHg+Y7aL85paLZJyTeMz0OgoLg6BF/btqGjXLHJHmR+BxnDw94hXsKEuIUY99gsE=;
	5:Bi92CfbugqiwMWuUlgwu1rcEgLrbD4ZO1azKqM3AKrwfIhetzPywoY/TsOptryqCG1TBtT4k3O8TwRinQqMtKFFTxp0gvSAURenkmtZKnPjPDUODDV3laPH16vM33xd+afQBdFuy+gVqrwCY89douA==;
	24:okS1KZ5FG7vqvmLsqLX21t/JDZOt4bYCglzf1P4ifxLYjQ1MYzV730llpNh39m29cw9PnDxnr2u6vnuHIvrzqs/s+kTIBa8zmLVUEuIqg10=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY1PR0301MB2041;
	7:bbrYPKdR0oWqa9rWihlxM1zXJuPs6WrSMMdGjY2bSjvpm22zCEtcIJeLZl06e0dP3vOZ0Ix9YH5nLR+d9ymqO9faZ5+Agm8hj3cWnVtpWzBDIhgvFAJCv8pR0hhTgC5O3B4JpNO1GV9uY3My7HuMaaWGH9wnWcN61v4ZGVdWAxAap8w+fOU8v3eMNnTwAZiPAyhyfHZky5/FNaMy2BjO5EgCAVj1Y6VEx8a6ZpDgcsBa/wz6f1Qr5BUmInUcHKZGUUV1c/O3jnb01JUV5pZ2sMiiHNsg+F+btJqhUDdgjLCCuO7revaQWvBX1EZq3Q9yon+LU8cCBlMqWslUULguoA==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2017 03:57:51.7440 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR0301MB2041
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
X-List-Received-Date: Fri, 05 May 2017 04:29:55 -0000
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


