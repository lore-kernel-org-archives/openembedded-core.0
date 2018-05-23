Return-Path: <alejandr@xilinx.com>
X-Greylist: delayed 1923 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 May 2018 23:41:44 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0077.outbound.protection.outlook.com [104.47.32.77])
	by mail.openembedded.org (Postfix) with ESMTP id 5F46A74769
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 23:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6F4CdWV4HG5vR8hejfO3I/df0SHAdBPbk+yoFXcuv3o=;
	b=nPKpR3/yxqFV97FFjULPSOk1y3O+Qx3i7Hi2c4b80FxmtdXgAZRzK7tcpEIWexE3tJr7QjOkkHsv8YaZlFlz0HvSqzGkWokicDxtMI3rxT5ucmSwuMAvG4UnPkOcBst1WEBIIdwgCiuUw8mzeafrUl4NEtxmtdb+qGGWRexw++k=
Received: from SN4PR0201CA0069.namprd02.prod.outlook.com
	(2603:10b6:803:20::31) by BL2PR02MB353.namprd02.prod.outlook.com
	(2a01:111:e400:c25::12) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.797.11;
	Wed, 23 May 2018 23:09:41 +0000
Received: from BL2NAM02FT039.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by SN4PR0201CA0069.outlook.office365.com
	(2603:10b6:803:20::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.776.11 via
	Frontend Transport; Wed, 23 May 2018 23:09:41 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT039.mail.protection.outlook.com (10.152.77.152) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.797.11
	via Frontend Transport; Wed, 23 May 2018 23:09:40 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:39492
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fLct2-000061-6I; Wed, 23 May 2018 16:09:40 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alejandro.enedino.hernandez-samaniego@xilinx.com>)
	id 1fLcsx-00050g-2x; Wed, 23 May 2018 16:09:35 -0700
Received: from [172.19.2.8] (helo=xsjalejandr50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alejandr@xilinx.com>)
	id 1fLcst-0004zo-V4; Wed, 23 May 2018 16:09:31 -0700
From: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 May 2018 16:09:26 -0700
Message-ID: <cover.1527114300.git.alejandr@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(376002)(346002)(39380400002)(39860400002)(396003)(2980300002)(438002)(199004)(377424004)(189003)(9786002)(47776003)(2616005)(476003)(50226002)(106002)(2351001)(106466001)(426003)(63266004)(8676002)(81156014)(81166006)(8746002)(8936002)(305945005)(356003)(107886003)(5890100001)(36386004)(316002)(54906003)(36756003)(77096007)(26005)(6916009)(50466002)(48376002)(126002)(4326008)(486006)(336012)(5660300001)(478600001)(59450400001)(7696005)(51416003)(2906002)(186003)(6666003)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR02MB353; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; LANG:en;
	PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com; A:1; MX:1; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT039;
	1:rP97TZp/Hg02JsuDhzDwKqvGo+awY2CNzLS2BXTRJ9uEeyLds3aXsyXiZgHk4YuU49G60R7XL9J+bJyFkYnf+cJXQ7Ss+dEaemGgmo4lhQj4gG8HDBGQcaTPQlws+qID
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4608076)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060);
	SRVR:BL2PR02MB353; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB353;
	3:+9zeomnhAZpz3YPnXeCFdPSqLeXGGGzk//zEepsF7wF7lQ4QiQxNHuRvCmw67ZsVC9iulHxWmNec0o3JgyovlYj6wxuNGWeSQ3jhzwZcAshFDfWpNsIEcJZSYPBMgtVipueVtbJMAoQ4kEhEDj6h4nI9WFdcWf2veiaur8BwXpBcjAGNdfik01UKk2S4qVd9Z+zVxoIXkWZFOyGcGzYWsZH0EY4X2SpBacktoHdIBRGPWFlsnqkitbr5hZXUj75QQBI3FTMTg8Ts3KyOaoXOMc8ucXrf/+uq+JVKfUhD/nFTPACZPdvcoZDMcc7t8xo30GPr2blqQiEYTZJiMKqF7AS1K3f4xqzvndQwb7dlZRM=;
	25:oSlrUenCOUyFMwcKtjvMlzuczxVWNNGMEEp24eJ5SQeGODCZRKCAgs/dIwycbfEX1BE8Rq/C0TnKsO7slumc7whlMWIW+PXaag68K1w9PwHJZwWz3y51gFeBTbRiGLr9DGajee2AeF5661iNCUFRy4tSrpdQogVJzk1RF6LcRBxntkPeuIu0pzGWiTqlR0PQ0Ym/al39gR4rv91kogGFClUK/YWO1Lm6Fg7Tymrn5/EU4YhKQ2WL/0Qf4e3dXyXEDz+YyunFBLc08m0rn8W8quAXvasAv+liTZDFuMeKLs0HpvQ+HKMWXFprxQzTzQFf9tJx3gLYuArEl1/EoN6pWm4WURkuoqbpwm1slka5dpE=
X-MS-TrafficTypeDiagnostic: BL2PR02MB353:
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB353;
	31:oPbTL7DoNzmD+eorEZchS1un8T/7LNxMcpFuNDaUH1/u/JK1NfNWMacFpferSjq+97sWj5APCcbbeyKJ5Qv9QyT3KRkgQgTG+1BhsCgWJBkNZvBWDVnWatmszaQWDgE5ylDmMtN+FZK6ob65RvV9VBQpICzgQxBdnVXSMZuOqLrKA1cSPTW+ddieRy1CESudBEyJOg9XemrrVQaZaWc9GTPVOEfcOGCjhrpNuvcjrIw=;
	20:MayXiyppLxnCw9dwBxZ7YIbXwxW1DTyoY1YBcjqHljq8LE279APgeIE8cA3V4oz6YiaOTxCGy+ckwnqXwoc6v8Hc4c7kSsZi8MLWCOLwFoS4Jv9kKQx9zzyca6HDpE/3g5nky8nmoKUphRMvYut9wci+4keWP52R6iBTLalhlnwz/UxhxO7OU7bbzBQY+P9zl2TtrjYgxL7Us4kKHPZ2lo3J/1slW3j/7WrLh2MhXC6TCG+lErgPoSo0QpHkvoFyDAv4ikfEdEEXc9WF+trdwz8SA9WNrL4/x9Varvh5RdryoHuX5uE8EsyWwC5nLHzVRnBfbVuRFf/mVyKDZlQe0GZry2tMWYKSDfMORPS8D7mArx+kdYZzV8pMyo5Boe6iXlHfhpI+Z3LqkjLYJXiq1pK9rNwr3/ne/WSyQA75HLEoylQgv3QA5U64MKEBHOtpNriKWBl4YLoUb1i4emQa2YLZpMyRicBlXXQvqRbJBeBs/jLqP+9/y4Kux7d8a6AA
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-Microsoft-Antispam-PRVS: <BL2PR02MB353DCD403C07A09931E2F36AC6B0@BL2PR02MB353.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(278428928389397);
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3002001)(10201501046)(93006095)(93004095)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123564045)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:BL2PR02MB353; BCL:0; PCL:0; RULEID:; SRVR:BL2PR02MB353; 
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB353;
	4:R68mDsNpEvytSEimBqBf3tC1BrVVsV0deAb/osN+V4WPWmVBRNTGNoN7PyunTyLuBy8FIN9J2Yi1FMmh2PMgbp3HRkw7Ro9DpSQLbr2Ulz9SmCvRVmM4asrm/NPE3Hce/LKrh/zpHmNbAp4fAhV61S6ITqMvcaEfHtsr1Yu8oVncNvOqITEvRd9uO/lAJ4io8q9Wta3r3tw08xugnZKiDoH2QsJAM8uJZz/6MDKoAWcYRU4Eoj/h4YVxqxqmgy6RwzK1JDGDvfVsRywkcsoJ3s2veQaDFxZQ3wgMSHTqUrE3Lx8woYcqXqcpRwB4cw7S
X-Forefront-PRVS: 06818431B9
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BL2PR02MB353;
	23:ZRGb/gs3AK6p7KRq4NUleGT9x67oZPVjbmolQKJxny?=
	=?us-ascii?Q?AJ5Vo0CT+7Rsa+YydlEGmIKIGHePkEBXqJkwGj815crON9WirAef+OHvAC2+?=
	=?us-ascii?Q?rviqJ07EsJQJDq1zJY/DfqRxSHLHGT1IpkxqBGp9LQBkc6DWDsw/ym/6IPq2?=
	=?us-ascii?Q?fUP32ht73iy4QXLZACjACew2VG/gphkTP4y0NxNoG236VW0VOgA1ZrX6M6oj?=
	=?us-ascii?Q?Q34w5Rg5xkaIUHlWLrtTH3vTPFWiFBOnNiwrlVC/iACndDLle6JKjxiA2KEE?=
	=?us-ascii?Q?160RtsQG66hv2gVw/KfVvBR80WZ1hsJL/oQB3yg35c+QM5e4pqtr3rvhMJWO?=
	=?us-ascii?Q?FDivCz5VC/XexhCnPpgxFt5uoY/jRDyVhHyGvbfk01O4HBl9BdYuyjjeEPSJ?=
	=?us-ascii?Q?vSKhCcVPwytLdJaoddL8mfcp+/u5x903Nquc174G6A59GtLbyMdv7B+Fk9Qy?=
	=?us-ascii?Q?X2dqT4RdogjVU1ukoP0mZKxR/Bq0As+TtSFxCM2TyvssrXDxrtRlPOE3GuPP?=
	=?us-ascii?Q?D35vPR12HmateV/Uht10lEduf9vNcJulKu1Ea/ZdOGGiZuoLsoIigqmKkWTQ?=
	=?us-ascii?Q?beyFW7LPsdfn0qN/ZJbC2W9PfkCagGSN9XlI4iCHiF2V/Ea7CDWIrWe9gUfR?=
	=?us-ascii?Q?fKxR6G1mV/UBWequdPXvb2KLWrfu89vMV+MaKUXQ1/CYM7Uj7NxHhfOka8tV?=
	=?us-ascii?Q?24mP/p0Gb4PP2btEmSsbLv0kjrdS/XvF/cDPgE95pRFJJnwZovQSfFpJQaoS?=
	=?us-ascii?Q?OhcS8o28KueSlMgifFh9AcNlIcm5LFvmPIySlGM5LoPMwUksv7WeGXFtSvU+?=
	=?us-ascii?Q?QhU8cBEN3+61pKNH7hZV9RhTgP0pDaPxd3YWMS5DsCTPQfhLXLrD4mpsrQs2?=
	=?us-ascii?Q?q9yLKt9wcs5QRbeth9Wzo403iV1JQqFBSe/rMiHoB0JyTu+wrFzgeCu6qpnJ?=
	=?us-ascii?Q?8yppBXyc7Ot8R0KK7mWyqAarFgAkIJwNuC/m7hfhh8RXYtS46QD0us0CXEV0?=
	=?us-ascii?Q?KzG8D3ZKvar1I7AtfjwH747RSJyk0mc05jp62xRe8C0ymreQHD/sg/Aj0vwM?=
	=?us-ascii?Q?tIb7qCC+lq9vRSCGIUnXm5NEeyUaS7dTkzkKAZtfrs7RAE7RxVsKZduGq32q?=
	=?us-ascii?Q?+zrzEe6ENnbjfes63HduqOh7mNEtfFYeaAWrPFz50iXuV6stYwev9Wg4BSAV?=
	=?us-ascii?Q?QUqyDsyZyD0+k=3D?=
X-Microsoft-Antispam-Message-Info: eyp4XYKDSJ2T0xWkx9m7AP+tHI/6yWAvAfZdxWgwAc+TBBRbEWzdjdDygDfZM7h16d3n56RnUov6Hj4UiY3q2A/VLQgVzaSRJGD+njGYOadG/+zxa9fts2cyzYD1jIiTwHpsut3IH/q+0mCujveIQ5wiuD4WCXnTSOOCxJBIDSpI6jbQi336NFg31g4nz2Sf
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB353;
	6:qr/twX6iwnPZD8nTb+XIvTpBBsJ5EB5bVJIjd0bnjwX/mzD1YawsahY1NPGJmaz9O+kCZMF8xYuuN6K0f9ZpD94G5thXQ5ViB1VpmTTAQXJVLZf9zyqGYJmefogB2tzNYb/JBB/2xt0DIi/ru7uRSOTkA+MxKYFXdVCGtfZejgqMUhV/2cygL0rpUvHritwoZ9w0+gq8zdFhW21m91kJAIydwvtrmVLo40e0/NeW5eLAjpgG1a1Bm3ByrByiIzOvbZNqpmg6IuA69P3KeqFe2FTpNETkUzmzDNXiI86phRCPhKKJpdUObkY0j0bycfNQn0VAdR5AgnBU1YqrnQj3tAy34Ncxgkl65pCFXF25IPlzTvBM928FFnwgZF9A1RsKwditnEh3AYP+X0Jb4xGbKrYMAq10SPTG6y3d+6rmqVZOkAlPjxH7s0NU4QPRilVOQ1qF7C09mGNdxVC1ihABjQ==;
	5:0+JgS5pPo8WNfHXX5u8v6M47RC6NrMa4+yuCGKL+s/+W7qSfZMr/GIc1GBWaz/HfhRpHImpAi0TFV6yWrE7vWUN8ORfDPsLZ5TnoX0KoaJ2MkrOJ7RQ+FHNahlsraRhb8R2fYctI4BvT2+pWvVVtegzvEeIe13Ibk3HCXJXwg1E=;
	24:iakIzwkpLrOoTbQj6rm3Z9ifiV+X1eOZ6eRTHkxXWC6NVPv2pUSPjA7euNQ1lEsQUus3jlVB9NQSI5fSO1P99g2M3K2jepjm+EWYrTNnCCk=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB353;
	7:G8eR0ElqTptCZPXAUvdm3g3zAlZzE6FpIE3Fgetun6dDIThcS9RhsYhZTz9VDNNFAPMB3zcEB4YWI/KWKgjvJO+SbroXSRfjG4S9FVnVVS/JhPMjvN8eZpfpF6L/YkVTZnUuVs+go7HFABTOvziB2vCCawKwGGqJUMfcP2V2nYpGr/wOCZQuUJuiZI7uwgH8hzAjMlRNAWSXwjSkYPH4Pyoc+Ayj9rcNWHOUaYSC8FxaMMxHotLRF8lkOqVFURWX
X-MS-Office365-Filtering-Correlation-Id: 7de25d2b-72d1-48dc-0329-08d5c102438f
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2018 23:09:40.7678 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7de25d2b-72d1-48dc-0329-08d5c102438f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR02MB353
Subject: [PATCH 0/3] Add Newlib as a C library for baremetal
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
X-List-Received-Date: Wed, 23 May 2018 23:41:45 -0000
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Newlib is a widely used C library for embedded systems, its mainly used
for resource constrained devices which run baremetal applications.

It provides basic C library functionality, and it is meant to be extended
by design, it contains several stubs for core functions that can be later
overriden with the symbols provided from another library at linking time.

Libgloss is the BSP part of the library which follows the same principle,
where a BSP layer can override functionality or even application runtime
depending on the processor architecture.

These patches add both the libgloss and newlib recipes, provide functionali=
ty
to make them extendable by other libraries if required, and also create a
new TCLIBC variant, which can now be set to newlib to build the toolchain f=
or
applications where its suitable.

Newlib is also usually used by vendors to provide embedded toolchains, whic=
h is
interesting since, this enables OE to build such toolchains in a somewhat
automated way.

These patches have been tested on my end in the following ways:

- meta-toolchain builds successfully on qemux86, qemux86-64, qemuarm, qemua=
rm64,
  qemuppc, qemumips.
- A helloworld application that lays in another layer was built for qemux86=
, qemux86-64
  qemuarm, qemuarm64, qemuppc, qemumips, and it seems to have been built co=
rrectly.
- The hardware that I have available is from Xilinx, where Xilinx already h=
ad a
  baremetal application they ran on it, I was able to build the same applic=
ation
  with a recipe, that used the toolchain coming from these patches (TCLIBC=
=3Dnewlib).
  I ran the application on hardware and confirmed that it was built and wor=
king correctly.
- meta-toolchain builds successfully for the previously mentioned HW MACHIN=
E as well.
- I also have a meta-freertos (its a possibility) layer that builds a FreeR=
TOS application
  that runs on qemuarm, and instead of using the provided ARM Embedded Tool=
chain, I used
  the one coming from these patches and was able to obtain the same result.
- I built world for all the previously mentioned MACHINES (qemus and HW) ju=
st to make sure
  that this did not affect other OE components, and it did not seem to be t=
he case.

The following changes since commit 7897fb35a3420c2555ab59dfa438217ada4a9784=
:

  libnss-mdns: fix postinst and postrm (2018-05-22 13:13:33 +0100)

are available in the git repository at:

  git://push.yoctoproject.org/poky-contrib aehs29/newlib

Alejandro Enedino Hernandez Samaniego (3):
  newlib: Adds newlib and libgloss recipes
  insane.bbclass: Adds powerpc to elf headers machine dictionary
  tclibc-newlib: Adds a new TCLIBC variant to build with newlib as C
    library

 meta/classes/cross-canadian.bbclass                |  2 +-
 meta/classes/insane.bbclass                        |  1 +
 meta/conf/distro/include/tclibc-newlib.inc         | 47 ++++++++++++++++++
 .../newlib/libgloss/fix-rs6000-crt0.patch          | 41 +++++++++++++++
 .../libgloss/fix_makefile_include_arm_h.patch      | 30 +++++++++++
 meta/recipes-core/newlib/libgloss_3.0.0.bb         | 32 ++++++++++++
 meta/recipes-core/newlib/newlib.inc                | 58 ++++++++++++++++++=
++++
 meta/recipes-core/newlib/newlib_3.0.0.bb           | 19 +++++++
 meta/recipes-devtools/gcc/gcc-cross.inc            |  1 +
 meta/recipes-devtools/gcc/libgcc-common.inc        |  5 ++
 10 files changed, 235 insertions(+), 1 deletion(-)
 create mode 100644 meta/conf/distro/include/tclibc-newlib.inc
 create mode 100644 meta/recipes-core/newlib/libgloss/fix-rs6000-crt0.patch
 create mode 100644 meta/recipes-core/newlib/libgloss/fix_makefile_include_=
arm_h.patch
 create mode 100644 meta/recipes-core/newlib/libgloss_3.0.0.bb
 create mode 100644 meta/recipes-core/newlib/newlib.inc
 create mode 100644 meta/recipes-core/newlib/newlib_3.0.0.bb

--
2.7.4

This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.

