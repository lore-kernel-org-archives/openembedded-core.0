Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0041.outbound.protection.outlook.com [104.47.40.41])
	by mail.openembedded.org (Postfix) with ESMTP id 8FB837870F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jan 2018 19:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=HcmqLHzL2+ZYJ3YOeP/UEHzpSEgrN7u/umWGD/UtsII=;
	b=aioQj0N290lFUm52dciozZtwFCsbhtI5q1qNSYHOIeo1fF3zUZyrzwFjtUqnsjDv2MiiRKdRhNYRmUBGlGNfrXd2Uc3tbhRKZCmN5jeuJt20rn9QB/yo7R1Kb/zVfYv3nzff8zBnRiOXkO6kwoAdDKJUwsfUrcnFNw+8vavdb6g=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MWHPR0101MB2941.prod.exchangelabs.com (10.174.168.141) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.407.7; Wed, 17 Jan 2018 19:23:43 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jan 2018 11:22:57 -0800
Message-Id: <20180117192257.12472-3-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180117192257.12472-1-mkelly@xevo.com>
References: <20180117192257.12472-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR19CA0005.namprd19.prod.outlook.com (10.173.246.143) To
	MWHPR0101MB2941.prod.exchangelabs.com (10.174.168.141)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfb9a8d5-e025-4929-0a9b-08d55ddfd2db
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4604075)(2017052603307)(7153060)(7193020);
	SRVR:MWHPR0101MB2941; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	3:Yw8OuBTdlhUcpDXxGQ4KZJ3pYCiJl6tErgoiBp04LnqyGsGUDfJjulJKLNPts+rWqMMC4XC8vWN2gxA+620HemmMjWFUJkVrS0JrSDseCw9NVLtrf+DfrJrTsvxXfI82KluxJyAZKZRr+0drOBMoCxF/VjfnMMTm/3jCJKj/yLlrx2WEiELUdxGQgWgn3o+NAxi+lQMhAsZ/Qe1VQb23rzk9A+CwqL2mCDrGAWCZjMfuHV3H/tHagXvd7JYQXkKy;
	25:Ysl/08U2RjaGx8PDMKM7pR4gBNhp6prXt93Y3OZVfhBxt94Kj6ePEFdpgHVAHmYQK9vmoI86d5amWc7ICaRbCmkf1/sXLVw+DElDSwt2X5QFbHO7j6509g//RsXX5a/AAR72bHWNyFnbyvj1UoCQDQ6uMjkDKBu75AiT1f+cnvqQNSA5ecWJUEjYp2iDlp6EFY7Kd5V+oCZCC4LpMw2YwiCUkTa5OCqbVWQbM4lJiDjdjxTkSuvGHWo3/T8E9TPmwswUH/75mpXtW76mWBevAJyi27N2Mkpuxg0vbAlGU12q1PhPBLlTaiKf/R5g6g7KomKwuc2U2s/iuD+2DdFJzA==;
	31:dlSf98IVv0eEkjepwEshYea8zyrmkpn9hxCdXI6fHoheWPEL8oeTvaQ29ncQfR8rpb3A9wCo00iIgW72O4gKBrTWWEDUUPUsnhly09ujcHUeUrgx5b0IhFhPbJAG0m4uPqAhs+7JFGIX5KkEcGv5dWaIdoUfdqygGx5fEQ1qXb+zA5dkrncxHh/EvzeWkI/zEutqA6RjBcB4w6K9UUpRCmi2BPFhu6swbXcOhgvk/7U=
X-MS-TrafficTypeDiagnostic: MWHPR0101MB2941:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	20:Mla/ubAXw0iPd7mGqbOL6w7NUE4GVezot1WU4p2XWit7HGiwYCfq7fy2R6e2/co78Hk3nPkrrvIPRTgWbfVXoerRqU677i4JaAFxbzyWKICZJbm6EMfKLCt9BrPF4a7e+E6qfTFy4eJgrv0v9nanuU64QOsHymNcoYEAzL5ylMvw0Rdvx36SqbjiV1HpzNSk+EkwcreEk0gDy/qGvB+f8DszC1tKeXnAXZGay7G8FdeYFyEFt39uHdR383/zUimWnJkO/LX63F4mB7sQmYr43/IlOhzzYVYV1bqxDvj7Zs+XorcywmeESnep8H4D8fnRK/0HTk/t8gEbbCH+AppVcfid2mLzY7RMEw9I81B7ujra2QQFa07HCPCvBlpPqeDIDbI8P5Gqu4757+CSm1WZxN7rNHDyaO8npkBp0U7vuQQ=;
	4:N+luI8WABQ/vEN3rxzly6CW7zSK2C5a4XBO5j9nXvMhO2vec+crHt3wGaDMgSjsmPw4/2kiqkuGdrYGsX9rLinc58OHMFLIGC5PwjZi+ga9vZKtbjSOrx9NtE9CR6zm6drEq/dGEjU59nQOPjbujoBTvDBzVklBYWyb1iRp60z54HvDfvPbf3Zb5iH/LVu9pKldzXXOshD0ue5tsZj557RyH+03uNbSEaOWnIvDYhjsKnrq+LnqEgaANgD/cyxIAJdQj/ymR6hHu7ds3h/xbaQ==
X-Microsoft-Antispam-PRVS: <MWHPR0101MB29410A9AE3C68F95EEE95BDEABE90@MWHPR0101MB2941.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231023)(944501161)(3002001)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123564045)(20161123560045)(20161123558120)(6072148)(201708071742011);
	SRVR:MWHPR0101MB2941; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR0101MB2941; 
X-Forefront-PRVS: 0555EC8317
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(39380400002)(366004)(396003)(376002)(346002)(199004)(189003)(16586007)(305945005)(25786009)(81166006)(16526018)(86362001)(8936002)(53936002)(107886003)(4326008)(316002)(2361001)(68736007)(97736004)(386003)(2351001)(7736002)(81156014)(6916009)(2950100002)(6116002)(3846002)(76176011)(5660300001)(478600001)(36756003)(26005)(6666003)(2906002)(6486002)(1076002)(48376002)(106356001)(54906003)(8676002)(59450400001)(50226002)(7696005)(52116002)(66066001)(47776003)(105586002)(50466002)(51416003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR0101MB2941;
	H:columbia.corp.xevo.com; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR0101MB2941;
	23:94jqc0GacFhdxgxxVgO6e6rQMpCSC9lgcAaN2hZ?=
	=?us-ascii?Q?/0vciSxYqM6WtSTpXy0eXJQbBkvUiYoBqlORVO+hCRX/FbXpkXUGt9m/X8Jf?=
	=?us-ascii?Q?qHAuqBoBC8m0M0zm6+joDMxngxvj+lUbu40VroYcM5GUZmtfOz/LLn2zxCxX?=
	=?us-ascii?Q?4KNoI7FWivT59xQKIFKhk98CF7+NSyhP99x9m4UCYmC91lFeWN4bj9hhSjfC?=
	=?us-ascii?Q?rAMkSdkxdbnrkzEZyac21iHOhYl7mHH6GZ8fmCvFE2a/VqJkonc6ORZVUH1q?=
	=?us-ascii?Q?SPPxKYH2hOR11Nbgd41Gwx0/B+oonGFe+bmwRKKauAQyWeut+uL5Is00OhV2?=
	=?us-ascii?Q?FKLN4Ys6uKqi5rXNO0L+Km5GYoQ0aah72elcGJvWisAZ/pnbOQMgA3Wds4z6?=
	=?us-ascii?Q?UREJ9cOqpynjgAKQgD6UZItKh7rQ44TkTXjMKI6zsVJE/nof/N810TO4oh7l?=
	=?us-ascii?Q?FXiEfv/IBpoA/7w8qwXMRA19BppfHGfSBdtpoEHMIOXy3kmFNAgbF/02wqwg?=
	=?us-ascii?Q?HFrEanvhn3LlvNld/nlgQn+IjoHI5am0ExB50j6THNPgFEQ1w+R/X0j1eLCO?=
	=?us-ascii?Q?6SArxENqMx/OQKPteGacNhH7KojgUvG3ho7SL8l0RuuVXO7xLwSSYGL/xI7j?=
	=?us-ascii?Q?gsQN3tVgMGqdWItjzYR9lyW0/ZnpwwAlOU/mvQ4NCe8wwK3Cx4P6N8KyWOzK?=
	=?us-ascii?Q?aFqEzA05TagSaxLVvXKeoc50GkAciqmBYKWN580GdSdFc1xUvneDB7BG81Kl?=
	=?us-ascii?Q?lovfcoUkcCCHJhIRGJt+s4C9YFQsrmyA3mbvVfYB8ELzePyGvua84aGJpQs9?=
	=?us-ascii?Q?6bSn0IY3MgsnJxmRECBQq8RDnipduoJFPTDJUt8r7/1Fj7BooWS2oIErJTyn?=
	=?us-ascii?Q?UpzQgXlvB17qRQebaa+hzizppDmEJjMhUJM0WdanMzDF9fqkkgTEIqAGrHic?=
	=?us-ascii?Q?HUnIsIfCt5sOuDgCsjB0QN6JxQhBDxGwh5B8PaxW0zVDfdufQ33gEPd6tEBJ?=
	=?us-ascii?Q?Pbp31MXSth2qRTjpzR+eII/qVvZkdEn/9xMidsJ6WVInh0ZMb36BqkIhg5Tx?=
	=?us-ascii?Q?aKekO2hgO9bXhpnZ8dCdRosFZVjZ04RPJgaZbja+SccWwGQ7DNED67TdqjGp?=
	=?us-ascii?Q?p83mxQ7M4iwLw+phv7nu0FfKZYleOBw6iHiU7RTDNUI3iFiRO4vH6jEmrI7x?=
	=?us-ascii?Q?vreMZ3ggQwSmJvkE=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR0101MB2941;
	6:ysVAG7zJCz1DCORUwvH5Q1ptClbbXgT5Zm2EXTRD0qXTKlOQW9eoDqNpOR7ihe0Cabi9JrUJoLXstexFkJ3XAU06DVPV+wAKRmOxT8RnbMpHDL0aiVybdW9UI6+VaoxA+ku7dvrXYcel6SP8rloAArR7f0Rw8aenmtfdavStNyXV8/xkwLyqLvEBFRvA4WtgD5ueJAU0ThSauLKriGUrOu1QZGU9hCjA8FIn82jB9658H6Ef1HbzkFNuG5tm08Fuqm92al7aVUZbqsVBgmELZ3Pdk7BckczYpdPbHdB7XSgYHhzDt5ROODpS3mD9qCK4/iwWS1rjvomD2E08GnC7C1ml0DctJCMOlZV0hubS2vc=;
	5:OE3sOqKt7QIZ3jrbwOVR7EIgJYkC4C5wWuKr08RmF1+8WdU2+dcAIP+Q9EzAZ2AlOLCIJ1JKyYXoOFByz1utW6RaVICKTdLmFDj2h3UbypRLhZty4igW4hQaQ3vVIMx+CmpNe3L3Bx2RZJN8xycW/xBGCvQ2W/nJ99mFcectjOc=;
	24:v7xeWlzFu7kRSOarXbp+Mp5V++Nr57Bm1darE8jy69HYQgFdoqKQK/R0vPM3PIUJEeRlpsvtU6dnbP4kKkTkOcAMflblndxWxxH2LC+9QZI=;
	7:miwf2unKp4Gal00Ekv8vPpueIrMyBiwUzeZ0fJo0mrU/Ms197wG+Qrbiy/oqcZIKtBdWZx7W5RgYVHpewvE9VVmzcrUiwqqUSYDh5/Pp0NLasFCV0B7h8mepOrUWIfMcAyhqwcN4GpFwASdCbgOQekCLKwr2+nTk2+eJsSrmmST8T8Yhenc0Pw0F4f7E6wTNhOWoiQ8UfpbhSN91abc+SNJysNM9X8ah1Ptjq5lsvyGb+ptlq6zyo58GHbxGD+FW
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2018 19:23:43.9141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb9a8d5-e025-4929-0a9b-08d55ddfd2db
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR0101MB2941
Subject: [PATCH 3/3] meson.bbclass: add MESON_LINK_ARGS to vardeps
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
X-List-Received-Date: Wed, 17 Jan 2018 19:23:43 -0000
Content-Type: text/plain

Currently, we include MESON_C_ARGS in write_config[vardeps], but we
don't include MESON_LINK_ARGS, which also affects meson.cross. In
addition, we include TOOLCHAIN_OPTIONS, from which both are derived.

Add MESON_LINK_ARGS, and remove TOOLCHAIN_OPTIONS, which does not
directly appear in meson.cross and should be pulled in indirectly by
MESON_C_ARGS and MESON_LINK_ARGS.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/meson.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 4ab242dcfd..91ac652651 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -44,7 +44,7 @@ def meson_array(var, d):
     return "', '".join(d.getVar(var).split()).join(("'", "'"))
 
 addtask write_config before do_configure
-do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS TOOLCHAIN_OPTIONS"
+do_write_config[vardeps] += "MESON_C_ARGS MESON_CPP_ARGS MESON_LINK_ARGS"
 do_write_config() {
     # This needs to be Py to split the args into single-element lists
     cat >${WORKDIR}/meson.cross <<EOF
-- 
2.11.0


