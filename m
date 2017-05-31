Return-Path: <chunrong.guo@nxp.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0104.outbound.protection.outlook.com [104.47.34.104])
	by mail.openembedded.org (Postfix) with ESMTP id A7D867807C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 05:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=freescale.onmicrosoft.com; s=selector1-freescale-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2cc+HGZIr6ummT2HgWtH6w4+DU8yddSDV68XF0D2p/0=;
	b=bajdElsZXQRvhUtObV4u1QEn+Vgp7Dx2fzmT+0BcVeo4Mbta4bg0wEJm/DyK/b27pWS27zgr+e7M6EwAbJ/n0j6bQ7bgRYkd6EZnRmDfg83xKySjoyny1v88Xq2HnKvxwwA07+zfcAHAvDiQeprkaMSJbVNsR07if5sgXQbWHkk=
Received: from BN6PR03CA0018.namprd03.prod.outlook.com (10.168.230.156) by
	MWHPR03MB2862.namprd03.prod.outlook.com (10.175.135.20) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1124.9; Wed, 31 May 2017 05:23:18 +0000
Received: from BN1AFFO11FD012.protection.gbl (2a01:111:f400:7c10::171) by
	BN6PR03CA0018.outlook.office365.com (2603:10b6:404:23::28) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1124.9 via
	Frontend Transport; Wed, 31 May 2017 05:23:17 +0000
Authentication-Results: spf=fail (sender IP is 192.88.168.50)
	smtp.mailfrom=freescale.com; nxp.com; dkim=none (message not signed)
	header.d=none; nxp.com; dmarc=none action=none header.from=freescale.com;
Received-SPF: Fail (protection.outlook.com: domain of freescale.com does not
	designate 192.88.168.50 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=192.88.168.50; helo=tx30smr01.am.freescale.net;
Received: from tx30smr01.am.freescale.net (192.88.168.50) by
	BN1AFFO11FD012.mail.protection.outlook.com (10.58.52.72) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1075.5
	via Frontend Transport; Wed, 31 May 2017 05:23:15 +0000
Received: from sun.ap.freescale.net (sun.ap.freescale.net [10.192.208.75])
	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with ESMTP id
	v4V5NAQr016055; Tue, 30 May 2017 22:23:13 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 31 May 2017 13:23:04 +0800
Message-ID: <1496208185-25064-2-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1496208185-25064-1-git-send-email-B40290@freescale.com>
References: <1496208185-25064-1-git-send-email-B40290@freescale.com>
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:192.88.168.50; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10019020)(6009001)(39450400003)(39400400002)(39410400002)(39840400002)(39850400002)(39860400002)(2980300002)(1109001)(1110001)(339900001)(189002)(199003)(9170700003)(2950100002)(54906002)(104016004)(2351001)(189998001)(38730400002)(42882006)(107886003)(6916009)(105606002)(47776003)(5660300001)(53936002)(508600001)(6666003)(110136004)(81166006)(106466001)(2906002)(5003940100001)(50226002)(36756003)(8676002)(8936002)(77096006)(50466002)(356003)(48376002)(4326008)(85426001)(305945005)(8656002)(76176999)(50986999);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR03MB2862;
	H:tx30smr01.am.freescale.net; FPR:; SPF:Fail; MLV:sfv; MX:1; A:1;
	LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BN1AFFO11FD012;
	1:zPDFriQwSHgkGqLIvRjM0K64r/DlLj97jUqQYBiUVHQWhQttny55HZWBE1LI4kYiGn/3yPPBf0Hz/4CHZDHznbYnY+zvtRqllRTSCnMEfI56aKQLgqX/qFSz3cULoE3ngPWCFfl3a3H24pQTD1266oglCHnmu21tThoco0Kla7NGvn1qS05L47+epJmTJYfVNZahSP/oss5moUw+3EwzhqcJ7lSg4Wn4uF1tWrsifNbUC4O3h/Xa7035HeUzzm1T1oRNgAAJvhE6wgtvj+Il6CbKSRCmdquCLHLF5D7tgBmldUSWrniBf3iD8YyiGhFOEo088EgCRIdGIsDNQT1DrwtLHqkORiAp/H50UTFOalJ+u9SfMIPeQDld/+Hcz3N5Egivio+lOU1s5QwOjvmsjF26eIvQvKkHeIkEatQYafck35zwAxyd/Lyga0yNoOYlPK95ZCz8I6H+avh9V0uCJtKc1D9S12NkdZNa9aVKC6vkjBo90q8zhNVxeHXX5DvfW9PYeGirJLZ+0Gv6rq7dVg==
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR03MB2862:
X-MS-Office365-Filtering-Correlation-Id: 4e5ab38f-76a8-418f-952b-08d4a7e52492
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(2017030254075)(201703131423075)(201703031133081)(201702281549075);
	SRVR:MWHPR03MB2862; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2862;
	3:4EjcWGsGV02DRnxBfldpd7WLcfH91mbcaaHPP+JgdlBMAgfzApHu7rlaho+l978TVVUIL7PRXht3/m375k70AuWEBEvlU+FJmH49op8CD356u+N8FWHMgKLpVGAty0DgPSliDLGDQsVl66gK++rs+jx8jRUsNsMruAmJTHT3pXQ8NYFmnDSKVxxTWdBQZq9SVs/ljpyXrfJ/Vu7Hyxy8IjbyIHyEoOdxw/CJtz1U3tQbDQ+0xoK3zG4KUYhhpX8DXKXbHbXqv8pxUinFj/VInvh0UX8uFHe0BuCT/RYDFucXFlNw+26I9tyiHEq+db9oTS226kzutXet/xf1RPswI98u/j+Bdc+l3J/4Nd/Wp7oHEAzIVYqQ2d+hOovPosBZHBcYQFh2DezfOggV50mGRGJCcpVzLTZRyzY1rv/oP8RqO1byh/7Xdu5nQ7KLSF3PbzFAoSBFss0aTykphcuODU2+dVm/B2dC2rifFwuifyzYUFwYkAlH1hft+VzK+Bbn
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2862;
	25:C1JVnCLN5F6BOsaSWw52gzDcq17SCxCyDB3Jw1zC0g3ZaAQhj1x5JubQ8DZxW1gVgfUZuGgY6om9jfYYcZU3wRxIfVOY9EKsSt4j+zsFDuMZ7tlSdsgXYhhdaD8H9Q9Rl7EdDA+ttm5NKmFkaqeSOxNxs9CU+ZqJQB8n2ReoXmmidHKLNEx2JuYqpOxIZMfooSOJ48Sd9LUyMp6NyYZwVHqNgkj9OhiO61SGaTqG/NTDUWVkSmjycWg1BLs9xSK4xuLbO8SDk/7p+oKBLvMOwUJ4UNInT+VrLU8xj4zsFkCUWJY6BDw+avh08MYUs8Dwq9tp/r2FLCITQIcnIKRjiZ6AVWRQJ0zpiVEXArTvR40i25A/gG29m3+ZWnxy6exXRl0jS21+DQg64/LUphGv8xODK52FTS2NO/81hH4PrNddqjZY8K3HyMfl06Pil0G8riIoHHVAKCIrNNv7/cvIAGFx7rU88ITpBVhPh1sG7WQ=;
	31:fNJ/XKL7t8mb7PNgLbR5q3DSUHoILc07nIIV+oSRx4uCsjOr1s6DoZ44PybYXMJ9gxjROjg+qIuKBop8jPTE7pkfpEMnY3sFIBVN0JFYDJUEfW6EqYOxRRCPsDM0PW/E7XgrKmBJ8mfL4bstkgIihc7QnZYFCvHf/mYgGiAu0awvsLhVoCl7w7q36CmT/AnJ8981sEtoLHS6H+Zt9FT5e5ZAFUhrsDVn1Htx/6U32IasFHOU9s2uOhXdD8lYxNiWV52Yhj8V3Mf8g2NMawSrlw==
X-LD-Processed: 710a03f5-10f6-4d38-9ff4-a80b81da590d,ExtAddr
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2862;
	20:gt2K7jv3J98m9w7+UPjEaIiY7aExGsgo3pwRuULC9bTscAwQb8D7PmE0fu0+59XBkNolNpkWIkzCXToQLTsUVglrEatJ0K9Da6b0JIWY98MhyVFOHz5eDn0ANXK452JGNYTAiHRpxuhUX/sRbqdSvON3Re5pEIrilhQmTXaOdO0UcDXe5bAok2YsKzEYoZxWXmLWu3bO7eYlPLjasItCusJivVJGJwfgu+9B85NeTJQlMHxqFVmrGzHVCpNHthSypA66x8tBFyxZJ0BhzKVvjK11Xp0SWXnfx5V1bbw0Bl1BGa2RP9AjF4QGZvGi3EEt3K+BVfyOO1IuhKHRcysLqK2KAZjSE9hrTlgk0nMC9jqwsted3iquEixGLyYP6IDICU853rpSOUEmmR6fyFzMkhHEjLChHLs+FqLNS0xPvdPaCjKXdDKAONw9KRq1RIVJ8WVRCNBC85KSQ5IKj37Qg+/Zq8WMsCQQarwPvdkSmmEAWQI2nXjXVJtMBk00DjwuF76hW/QbhszZhb4LdmcCgyuNgX5UCzFZjNoDZhfoEwiCuGAPcqcmoygNvnlBFZtHXwNoXXqfXkMBp+Y97EvFidhAtVjsO6MbInM7VrC19gU=
X-Microsoft-Antispam-PRVS: <MWHPR03MB28621A52054E4E1278DE2F9484F10@MWHPR03MB2862.namprd03.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197)(101931422205132);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700073)(100105000095)(100000701073)(100105300095)(100000702073)(100105100095)(6040450)(601004)(2401047)(8121501046)(13016025)(5005006)(13018025)(93006095)(3002001)(10201501046)(100000703073)(100105400095)(6055026)(6041248)(20161123560025)(20161123564025)(20161123562025)(201703131423075)(201703011903075)(201702281528075)(201703061421075)(20161123558100)(20161123555025)(6072148)(100000704073)(100105200095)(100000705073)(100105500095);
	SRVR:MWHPR03MB2862; BCL:0; PCL:0;
	RULEID:(100000800073)(100110000095)(100000801073)(100110300095)(100000802073)(100110100095)(100000803073)(100110400095)(100000804073)(100110200095)(100000805073)(100110500095);
	SRVR:MWHPR03MB2862; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR03MB2862;
	4:jOdB37IAyFqXATwz+YdH1S+h5xiOgPv5BkRqFZa2V+?=
	=?us-ascii?Q?cVZq3cocUlt3KB9Lnwr6PCo42/C6u0Ml55UfdNK2m0GN3XeWPTs6XoBi93bP?=
	=?us-ascii?Q?Yu3pRLMUFWsBBEOD5LYgvObdEWULjFfQnRbEHaVKZh8mrgBqlkfuhiDsjMVQ?=
	=?us-ascii?Q?fDBJZ7qNgXZjg2yh/87+dA/Q1/GbIES3BoGQbZ9zQbFyW8xWdn1utpmvJvmk?=
	=?us-ascii?Q?+cPb4dYZL+UERyg8JbifihFY1ja8fFpyvo6Uxyqiak2hRmWS3J9yempbK/wW?=
	=?us-ascii?Q?j91Qw98e9Y9kuMCUXtg1BJMkR/7tuH0lBPRBt43nbML+x5qnx146c1yqT31C?=
	=?us-ascii?Q?LalB3EkmrtJ5KsDGVjsNtRrKK1EH+Ytcq5W4Do51GkXSjxCPXsMePhDiOPwT?=
	=?us-ascii?Q?kVWUIXP3xbx4fZ9JAh/c7ERcf3PB8wvYIY33KzdRvsLPfEqQxYfdJFt2WmZC?=
	=?us-ascii?Q?9LGphS8MigIr8vCA7dw7+xvgnNTWG1+JKS9Xpm2e0HvFZOFbWo5//pDJx/aG?=
	=?us-ascii?Q?gWtJ0cydEC2G3636l07EdA1Yuy03CPxT2QtbQUNqMzljDwsjYZzhHCUJfWn7?=
	=?us-ascii?Q?BT/UffbuRxW4WkGoaFNd5uLIWPPTeCNGWxqIlmadyrxNCDdkDeLB4254790W?=
	=?us-ascii?Q?dxOzN0if5FLGVbeOgpRxU7Fjl+hyN+8oPQG/AulTE1VE/nl8OdS1JzHr94L+?=
	=?us-ascii?Q?rT5qKv0vwrVFPq8+VEOjc/aSi7owyzHBBzghQjw9qtnXG/zuugFNWrzTil9s?=
	=?us-ascii?Q?0LIuXAhSj0GsBoB+rDBpoxKBvKBIpRB1JcVK/cyxqewGRxvgICHh47FRxRKI?=
	=?us-ascii?Q?L/D74EyCoDtpXSvFc6/EVRrXnJI4b5vTJ2wnIzthIq0/Qz1HtaEP4ZMa++P2?=
	=?us-ascii?Q?c+yl8nbb6/qfVrITZDH/ooNfJoiejVV6Tx2hjVHPolNpuv9/0gjiccF+qM9z?=
	=?us-ascii?Q?AmHMrUCkLIagbBH6ptO4EcaI7ORiWhyjZ2vS179U2qVNxrUiIpX12/EBEa0N?=
	=?us-ascii?Q?tqoTcdAgCcXlfcNz6J3jtTY1kFv7apKHcTI56eQkYjgnGLLF0DCYX20Dl2+G?=
	=?us-ascii?Q?hl1I8WcQiTHQk/PG7jikEiE63PDSeIpzacIqfYX/53nZ1OkkHt91uFMpca9n?=
	=?us-ascii?Q?2e0h07ItfQPfH9izJR8JtakSqMd8rJ+BuHbfls4n9PKu94cnlhIqpKVrI83m?=
	=?us-ascii?Q?USG417EPG6aicLcHusu5eGUwV5fIuR4ASD7c8IVC7N0mtgduFSesdfTnEbjd?=
	=?us-ascii?Q?hGvo5yHZP+t3hAy8F1Y/yjnRtAYfXiprFlriil?=
X-Forefront-PRVS: 0324C2C0E2
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR03MB2862;
	23:Zu+FJ76Wjiz7z1upBGOe+NJyWQ+tku1YpuHveT0Sx?=
	=?us-ascii?Q?k53enGfIneNnmgDK4N1Ody1tdbAYhdW4G0z7YwXG//wtMnr2+1DhVtyExkwo?=
	=?us-ascii?Q?cgT1t+f1Ni2XVOGa4inwFBYEWuYNA9LBzDm8aPBB7xqt2Ak2pXpVhH0uDQXg?=
	=?us-ascii?Q?+RKK6jcaW/R8XIAy+SEAUDPxyVRc1AvbhuLIg6jFo/ykW/fR7gEX6r3Tz5vB?=
	=?us-ascii?Q?nyRbT6yaDIl88Mt1vIFwNmx3m2FN1c2G//IVJgfrtK6ekNwMOSERNDpVNVX3?=
	=?us-ascii?Q?O/bPJe3TmTVzep6JV7ULqvAu3Q09urPyD5xWFn4Y6C2vXv0pjthezZgkrRDc?=
	=?us-ascii?Q?j0GhxHtlNxf3RpLY81Fg06JhvBRXv8NAOSrZgp8J07xc+Nwbqt/58uiQZocE?=
	=?us-ascii?Q?Q99j2X0uCTEqKoxBsR/fV+nxrYKAo9HAoGkVeqIS2j34p0PfulhDXHP1YzAq?=
	=?us-ascii?Q?CCJHGwNI5UcOpISweQf4uXAO0kHZDHer69oaLIARusfQ346UUFaKRoyNkePZ?=
	=?us-ascii?Q?Bh6k/u0sfDwRrn0w0G7iL+Zi+kv0yCYkpGxDdhzGup4ove+6ckn2t8muI5iG?=
	=?us-ascii?Q?mYn2wJyp0ziZxGqwD6Mpg+3IEue2zW+nMGEKzVHD4IGywdyJ4Ox/skg9owBW?=
	=?us-ascii?Q?dtc1mcbWoPpz+JQAziZM6Jo7Jei1uGhjFS4H6UktW5lcN8ijlAec0YrR5MlH?=
	=?us-ascii?Q?AFMgireHUwTaIp19ibtiZKvaAkoYX113+YmRzYV2jXMTeVopgLqVBFdjcR1i?=
	=?us-ascii?Q?b2kgktEQKtH2JYmuv5gpzho2iKj40sDwfAaeZnNjjOUsIKqYm+4nMHh1yjOi?=
	=?us-ascii?Q?3389yO0j2sSLHWslJezUkh052deBErqc6FNGk6Qk+F/Y09YFV9MRSslpyZtZ?=
	=?us-ascii?Q?/RfJvHVTlBkfp7fyxaTdeqWjGAhWpRV/C8xxdja8mO0amy6wE23JGxxFNl/L?=
	=?us-ascii?Q?TUVpAk9mP+pHbAUrWgdYbz9Ubkx6lmBZ+UXOYUF7wTWet0w1zmHK7YX+ChY+?=
	=?us-ascii?Q?zrttUd2dbgSt8JAKbO3qtZ4dURIjXd7mm3yFh9M/koHAjuKrGr01PVcjKnOu?=
	=?us-ascii?Q?nqn8LtXY00JtZVaN1vkWtN2phwLAGxEzRk1Fk8O11QXHCC3lkcbFoEiL4ASP?=
	=?us-ascii?Q?b2v5lKXzYrTK9bgeyf35saHHUsyckB/4TCoaKczpFXimyeS+elX1PZfzmGJc?=
	=?us-ascii?Q?HTBvct0T85u0tbFvH4L5GluZBeYgvaemLqx?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2862;
	6:LLytb4zhNkx+rqjUWdOnpAuAUyLV+Yi1wL5Xz0nhjTSzmNQK7nB66UisX3VfOG9L/agIqfyliJwGz/wgPqoL6klgnaL/YSyT25PM+m0sO3SIjq1y3Ydbmmnl4Yo+/eoDSni7T7lTuBQmGpn4Uo+mh/UraspTeqWpFBEl/emgxeYkEjLX0UUjgEdJl8F765Opcn/dhp5momL2P/Rk+Q5iWBpYhXS2NMK4mqHQkbCZ2h/joBj7aw9hEASUr/FR7KZgx6fj+IhKjNK0f3mQ/ZUItuH6PmaZhj6XvDwuUeu2klPLGruqi8b5utoWyhRQHnH73WPjkMwpTCJecU9TrSmCatDSHQ7JD6/F+A26EoKr3nUDfEnAlY7wsp/MQ0xzsbp9kunqPXWhTo28IbZfnfj6ImnULUIdL5rhZFZkmU17IiDyDUr2tyJXS8PKG5XqWodglT6Qfgeykr/Dqkns4URIByaTebSCWSJPPe+9XvZ6wVSia7F/CSM0W3j0nzO6XRM2UpPJl8EhvwIh2tXrFZNoS3q/eJWXkA+8AZ4jZLAB298=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2862;
	5:c/vLnkYWRdfjkfyXJ8TDTvF+H9FzA2a2/lFSiNc7UV7LH3F23BtxhbCb2NisuuRKVYmo0IF/hOe8KXdULT+j/QaPpEzzK4KvNVqkPFlkaBr4TIC3ujhJJsmhUW5M8TFrKMnVBZiYsxuhcYG3vlpNHCWEAKKbVj2r12vT65UzQ2tao5+gyKQYyB2+0LbP0+yuOyI/Iksgbhl9E7NTW94xlGwshKYHmvmYSxu7RkfjRLiPLLENFK8HZ+v0vRS3Ced0RHv7pEjGsI/WpSJCh7Q6giMYhhTBjbJodaB+bpsGD5DMipXFDoHqMcQ3nb4ntmX8KRZgBllDEazlnpTLrwcelYcRxwKRAo72zYozeSvKF/rRqKoDUs4Iikq+nnF7k0B1UgWt+E9aXW4LmIzh7pjt3ecDfehlM7C8qOSN+/poB7HAMki9rnXCYBNjFCLvXisUBMdLaL01CLoAVWT1cDd5lTwp0j5BfPI6T1N4rxfADknKmJzzxSLZThbkRw/A560R;
	24:ZeolfLivlmKrm1/Gu8T3hBD9nSRbmSxmEBgEY0kl0ptDoro4gpk4twW/OPXinWKb+074qv7HOCX+N11rUwEEPi8S+c9zgB/BRc/MeE69WjQ=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MWHPR03MB2862;
	7:FOLjfN+W0hNnt1ngswZCIfH2vPBer52FGeGVms31Yo/hImExMZ5B/HMRrttcRNwPFmHY/3UyuPkPGUGdP5EVQSRAcAMJ37aY57bg890mZm9+5buE9GViVKJ8LXVj3zyQI147UedNSkTIBrZUos5h3ypNcQpJmI6I3EUvtIvCaFrlF50EIrj6ZaJZ/5RSEgK624QlV3qQSp4v/1An7Fgavi9lEj/sSSuiVSQ8tNC/sz4BZ8WJEdlpi4cOckHU4/fXHRfKF6tDMlgR9O1BI60fvpGXioqmyPNPkXKq492GETE51iDWTCM/unRr/wFcCuSeNIJ8nm5Fk1DZ1FGaioUwQg==
X-OriginatorOrg: freescale.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2017 05:23:15.7006 (UTC)
X-MS-Exchange-CrossTenant-Id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=710a03f5-10f6-4d38-9ff4-a80b81da590d;
	Ip=[192.88.168.50]; Helo=[tx30smr01.am.freescale.net]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR03MB2862
Cc: chunrong.guo@nxp.com
Subject: [PATCH V2 2/3] kernel-fitimage: set replacementtype to vmlinux
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
X-List-Received-Date: Wed, 31 May 2017 05:38:00 -0000
Content-Type: text/plain

From: Chunrong Guo <chunrong.guo@nxp.com>

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/classes/kernel-fitimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index f40fbf3..9fa836f 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -10,7 +10,7 @@ python __anonymous () {
         if d.getVar("UBOOT_ARCH") == "x86":
             replacementtype = "bzImage"
         else:
-            replacementtype = "zImage"
+            replacementtype = "vmlinux"
 
 	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
 	# to kernel.bbclass . We have to override it, since we pack zImage
-- 
1.9.0


