Return-Path: <mubin.usman.sayyed@xilinx.com>
X-Greylist: delayed 871 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 23 Aug 2016 10:02:15 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-dm3nam03on0069.outbound.protection.outlook.com [104.47.41.69])
	by mail.openembedded.org (Postfix) with ESMTP id D0C80731F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2016 10:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2OIYfCgI6qYsp+HUflkhaL53zXVUrjOSRO83QK3Frl4=;
	b=GyLL3HFRblNyj5og6sDQr1fXagaWH6NZYbFwu5i8PyBzZM20R+UMHIqOcFHsNEvqia29y0WqWqakh7OuXttw09Gz0cX5GJWTiN7YyO5Q0TZxbvKBFyJnG+9BS+TGDaGwCXz+vjMUpOwXp1AOXESrVwxqXn03olPyzVcYcCAzkXI=
Received: from BY1PR0201CA0001.namprd02.prod.outlook.com (10.160.191.139) by
	BN1PR02MB086.namprd02.prod.outlook.com (10.255.204.23) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id
	15.1.587.13; Tue, 23 Aug 2016 09:47:43 +0000
Received: from CY1NAM02FT059.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::204) by BY1PR0201CA0001.outlook.office365.com
	(2a01:111:e400:4814::11) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA_P384) id 15.1.587.13 via
	Frontend Transport; Tue, 23 Aug 2016 09:47:42 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none; lists.openembedded.org;
	dmarc=bestguesspass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT059.mail.protection.outlook.com (10.152.74.211) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.587.6
	via Frontend Transport; Tue, 23 Aug 2016 09:47:43 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:60424
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bc8J5-0001l8-Gp
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2016 02:47:43 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <mubin.usman.sayyed@xilinx.com>) id 1bc8J3-0000ov-Qn
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2016 02:47:41 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u7N9lYsF008049; Tue, 23 Aug 2016 02:47:34 -0700
Received: from [172.23.146.171] (helo=xhdl3763.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <mubinusm@xilinx.com>)
	id 1bc8Iw-0000nz-7w; Tue, 23 Aug 2016 02:47:34 -0700
Received: by xhdl3763.xilinx.com (Postfix, from userid 44329)
	id 3CE4A2CE116C; Tue, 23 Aug 2016 15:17:33 +0530 (IST)
From: Mubin Sayyed <mubin.usman.sayyed@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Aug 2016 15:17:28 +0530
Message-ID: <1471945649-3164-3-git-send-email-mubinusm@xilinx.com>
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1471945649-3164-1-git-send-email-mubinusm@xilinx.com>
References: <1471945649-3164-1-git-send-email-mubinusm@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.0.0.1202-22530.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(7916002)(2980300002)(438002)(199003)(189002)(50986999)(626004)(76176999)(450100001)(5660300001)(46386002)(45336002)(15395725005)(86362001)(11100500001)(92566002)(52956003)(90966002)(15975445007)(229853001)(2950100001)(19580395003)(87936001)(106466001)(2351001)(33646002)(48376002)(63266004)(50466002)(42186005)(47776003)(103686003)(36756003)(4001430100002)(36386004)(5003940100001)(356003)(305945005)(110136002)(107886002)(7846002)(19580405001)(189998001)(586003)(4326007)(81156014)(8936002)(2906002)(81166006)(50226002)(8676002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN1PR02MB086; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT059;
	1:aUFUymzrdXXv5FR/L01SB4f74tXUaBWJjEkGI2kPPU6sel2vGgZOGzyPTqA0gMMC7osF5bptHv40kYm+tK0A71OT9hHS56XHElC0zPb3TL4N85CdS+iLjW3WAtRkD/uZLVeCyFBULN4ykw4fYYqK790h044KEl6vLDy3kel/e+mVei+CYJ2JT/H3Xzv8r0AK01eCmRdoIPRjaOF/pJlSCVNafSzNC6SP8KX7CO3zpX2vh6bZCHW5dnrr0/Dv2+ftIqXJ9iZKmJ5eX7C4Hk8G3MeauNWI01IuGS/aZaTGaYBUq4b4QoLDAR5Mw6qIilY4eB3JboyStgBzBU1cGk3/7UUJSRFT5UtUJUuMOC3CSbt4jd7Gfxl/lneTveDVGLbX1RrrMTyY8Zs2y34P4ZEXssM9yeUAxPd7jH5SHt/An786080GYrTBWe9v3ygmVIfWVBobA9TWc1IQBRGSsFuGv8e5fAu08dE9YBMTdfobxUqkTRKiXfnPyBmXU+YQ1NTW/eN9xx5llDvgw1oRFDzgPwI3H8NhvukLJOrlkYr3UAflEh4JqauMoMto/ApVAZG/
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 3c1e8aee-3ea2-4a66-f3c7-08d3cb3a8798
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB086;
	2:tLZs8CUR3DCMv2AAeNKO1zeBbQALjBOQJ/Z3Un5kD5vjWei+ItSltuXtABOZ3oZyqeyHZkkQs3zEmr0VMXL3nSr+zizwtQfAO6Ktsgg5ynka2bTqcxfEVO9g9eGNyasNH2uiCNcWYrRJ+bMNC3pnYapcbAvNq+7V3rkSEJQudeb8WEp7MLGcSBP7atnB9tg0;
	3:y9jHkGeMC/YVqCVjI4AnUNJwg8UDB7Ng7mlYwD56BMnQ4oBS72QlK6HlnjhJZjrdJhc9o7i0qE3zh4FqUzzRVbmwESHiCKvcRkeK4yM5HhnxDWzjrBaasTT2FltXZZabfQMMSPEkXEMP8MZvTboLI6eqlfCLIfieYZEyN3vT3ehnLqvJLmjcSc469utYK+1Jo9LzPaFFohei3TwyUlpptPK5+J9AW6i/TQ1BWmVFyTTOnKj0cCXyG/L48fezZdgJeV/32oneRRNDONFA5ZifUw==;
	25:JweYrIwq8lJiyozl7hRSiqPOJd+ZujSciGPLYWKLJna+Ic7rlmmcfRSVKJSC+ytzPzVmAvzxsLgm2pBcqzd6pQm3yiFh+h5Mw8nUwNYNLdB1Url2Wk6O2nue9RYBTy5h7aialJG9UILIuv8qwmYX57iLPMx0/nkERPMOxDlf/sOqX+A9HuINueeiqJvEMFqvxbkqzxZPmhr5dlZdugbuQKMyo2tV29dzxe3WYiOj3Po0AIdh8+s61OM/rYx8detG8++OUvfqsJVtvn7xMCpcbJEo8dtzxf6BhyJtSzs8OXGL917/t4haMNVP85ZdkXbIHt/BPhSA+x0gKh4Tv5cJ8Cg27ttX9jC1DeJJNOYJEuh3TGPSzTD/X7eN241WwvzlgjbZBzWUTq01GV45+JnAMc0Q88gfxYqVnQ7TGEErfJc=
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(8251501002);
	SRVR:BN1PR02MB086; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB086;
	31:kSHW9cuyLcI7Ayy6pm5CDlgNrUHLLDHQj+uZHlxB/uuifRDFyJ/7CQU1+/6d/scRyITp5wcm2J9Qgvs411eKouuToxlEbwxJX7hsjjAKmPF6iAe9dtwrS0yjvktWlKOyNlk+OiscKxruVw1iq65XAPI8ttoo5zCcsYkf6L77UOdEHO9bGtPqgH2VKPmuguf832oIHYLOI3n0C6Up/O9EpNL46eTeyKShYkOP2fobBQQ=;
	20:skV+gFH+rgmZk5sL7Q9F5crHA5MXVTQbZ7r6dYmzReKKcsaRs7pAdobeRMM2/KoNPs2Jqi4IxGJAopuunIw1J4P2ZZqhd4383CDcrNpmNAHwnU8QGr7eU6jeuLRKjD9w/t8S0a/KMXhVqrYgm0vJS440tKAOBc3CrfBRE0ZxEL/Mb0m4hVd1+6/t+gboo/W6L36vFFY4zKtJEQ7mcNzT3IzkVrLfOHd0AYVUeq84bBLoa7FqqptIk3QjwjnfuP0TauZ8GRGDF9hwotlWTMjuEeNqKwupAcmc9IBwcNP/eQUkFAR0FedJewMMsmasRcvV+1L/aBlHFToGJxmErfMKJmMn8bN85MEcUNtHJdRVVypBqz+M8t0N5X4y6/IIurOzAX1ff6S+ZSP5t4Kg/J+beCQPjSfPUPcOKBloQnp7f83bWzoJPYyMsx82Y77PYVkvaUmWZElRZs/VVuTfs+H+2ZeLyJRDuQAmXF2ZpL+ER2dytwHH/N8LRADvAI0fgP1b
X-Microsoft-Antispam-PRVS: <BN1PR02MB0867FFAD5DC38D64DDF7C16BDEB0@BN1PR02MB086.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040176)(601004)(2401047)(13015025)(13017025)(13023025)(13024025)(13018025)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:BN1PR02MB086; BCL:0; PCL:0; RULEID:; SRVR:BN1PR02MB086; 
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB086;
	4:CwkicgiuHlRA1TiPVD6/zJitC85X/T9amOzrCmeQ1wBRKxzL6sQvF++4nQHLAnDSE1IoZAB6xZKp47xRS3mmP9hW8ctzQhR25QujIo1noUu6cHVXqwFLitcLKfiT8Q8N1HCSrDePBQ1QX7v8YV4RbV64MdpGNYTZazyZz9wfluGeXGk44Ngqlw2OjCXB50sX2qDNtXtS8OCF67nT8dMi/Gry7qPwSrlJko86dG1VahTnr64XT29noXSSl3vDYaNA8sCG+xgVyZYAp8dd2+5A8ZyXwoYDRSwtoavyZRLXIKcWO844crGpsxHbBK0KP0SvqMpBspBjNU6Quzgth6ny+8GFD9KOh2pHi+gWW9jqh/M9hUEMlzLpiyQMvj8dI+qA5dQGRZUWKWKLPSlmkXMnkHLPs/M2d74G7CkTbSi3bPKzO75kRWsXgPjrhj+qEp1gNlrCXLD+5S1ixrWR0xfFbZ7116ot76aYewV/JUPulYqE+Qb+2JSGSe2k0eYUhsndVE87haiXLEZsMAW+oDMc/SVDUEyaC6loQuYJc0UMriI=
X-Forefront-PRVS: 004395A01C
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN1PR02MB086;
	23:x7vHZgfoRc0mm0E4aMHxJKkbu1dIAmlMpqjQtVjBW1?=
	=?us-ascii?Q?PYMt/dEDa6rK4RxD5XzS7dHIj5MybTATeyEpAmCfWrx/rpcKQDe6lNdDTqkG?=
	=?us-ascii?Q?aSRct8bYWMMOSoCP9j6jCoyb/qN7YIwa6OBLv3OV1DN+nlaeGiknojmK+D2K?=
	=?us-ascii?Q?YrzTyAMYbLFuuYEXBmd8ZD1+bgkPCpFMB4sVpif7qK9TGlS7KuokwwEZVS9z?=
	=?us-ascii?Q?goX/rPEf96/oePYNBpwH34Noq+dGVcann6ZSYesVYtWl2Ng7XBxoWP7xzokH?=
	=?us-ascii?Q?IEamYIglMwwGSa4tESmNuOuplvOOruvQTfpHn/3zp7XL6xI3ZTzHQHkZmqh0?=
	=?us-ascii?Q?/DRPybGGFmKgxina3nCxwDAO8uhLwR6iwFVkV/FXP5TuwB2eHiuAdzeLaBZz?=
	=?us-ascii?Q?P6ey1m44J6uuDwnpv1PNdvOBhbupgVt0YQtLTJKTJoH6T6gQnFHWEujMx+LC?=
	=?us-ascii?Q?obp/OYeA5FlQ9SZHenJ2nOFOcKzsqWzPQitaFVAMj+YWWHyzFevtTa27C68F?=
	=?us-ascii?Q?oaiePA3P1OxVmkwfBNIa8wUQm3v1GJtL92pKtUdZtRQ8JOsMy1Ya/dEBPUSh?=
	=?us-ascii?Q?k1o1IkoPTaJ57gvszmCcQVKKdPHLNQ+3o1f6HJK8UNCkHqpL6OCFEv+MpoJ0?=
	=?us-ascii?Q?ySOr9BdiBiwSQ7efcqz9SSGa2yNE2hj/y3VzJoSc2/1Un44Z4izRN4PEsC4q?=
	=?us-ascii?Q?wJPni87HPKFHI4nxtUYzgScT44RGBsBEBH+dP2nmcE9G28TE5de/h5X5b78n?=
	=?us-ascii?Q?uCcJZR6s6p6bHa9KGrZcgjGZbmnge3jslORTE2HIrWfPwnwHq1KrdBpgBRGS?=
	=?us-ascii?Q?h6XYbbx//wrOL72tXBzeY7IWxPEr2MPItXSR/Alpr9Gz4vYBqwpL/0Q26Zbc?=
	=?us-ascii?Q?dVfa4DRmSuv11z/N/lk32NFVUA3bG/Wf81zcLxLoACFOrcl4vZXUUmZ99vxz?=
	=?us-ascii?Q?W6Dc9vV5EsXBhHucxYPKSUdWjvHOzG4DsR1gGoTC/0hEO5eU2V/9RNngcNBF?=
	=?us-ascii?Q?0OWtjC7XTnlS4z4+pvaGm3ufEIAPNH0WqiNmr/7vUkMviFLtaxPY1P+uNppm?=
	=?us-ascii?Q?34WFyK98yOvnIcMP8LIdoofdG7wsp8KSjwvhL6YiOx7yVJNCBk+ID0Vn8J7b?=
	=?us-ascii?Q?YJXMBErgQ3iKdVdF5rln4j4ThUB9jMzL9MO2QTuvJgLxd+VjZZfCh609gmtU?=
	=?us-ascii?Q?gehRR3oiT4HnLCNH6HYnxv2m/oxP0g8QrAHanrDPc22YQCiQg9HjbMD7i+dV?=
	=?us-ascii?Q?kP0luXT23Tn79F4ab/psv7NMGt9/sMfy3q3Mq1/avK9L4YzrBfaKewfCVpv+?=
	=?us-ascii?Q?SicJhgq3gP1jJb/X85CaY=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN1PR02MB086;
	6:rmNDgwL0ysD91j0Wc2h/tAjCnh04GzYelpjGog4B5cmD3YnG3BiPACs4A46uSLs7A7U4oH87phy9oA0hS1fkwWy8ZyKnd6hks06Aw6rRu1ckcRbNkUX/yjl3H2SPE/VQs6yPRBJxe97iTjNtOzU+bu2mTBIbVYKA+EViITcYv//58L/yvVVvYSRmOWCpeBNsdLP3pzzvdtdnYc0mPysV226xiz+ccd8BlocB0JNO/9GCe1iF+5Bx6SMNf7mvhcrx521C+nTt643FeKPRS2gedHbnR/D+TOmch08R45lG+Frq0WmiMi1uAXyOUddGNYBRHj9hWM22dhlvMgXWd+pYuA==;
	5:NgyxNmsua9C+DJrEOWr2uOeJlTqdj+ID8MPGyeCX/ETXYJIneToK2jfhgPX0m5rWft11/oz0VR4zYBKCp1fJPpHHhQMxCwWQaEoAYLwQMglRDf5IDDzBtNWO8TFsgovd0zwoBCLNMdp4oYAYOMveig==;
	24:wkcODpGX+Yuc0eFseDP0EJ8JxvTYbmRZz8VnZdNsx35yh4o8LiV0/Km8W+YlEnpBmjQDaFnfnbuwkn/M9M83ZrXUCDiThikUpijvWhLD8Tc=;
	7:+2/q5xGKDoZgVOmsUnYeyhOwhn8wchTO0yFWVl80zJs0momUPYXmxNkk5qfYjuSDzL3USLwoVC0Uv3J0XNl6brO/i0t9NNHL3CJDi64oCfl7m6QD2jboUhC9NU3By+yJRG9fvji44T6wf+WV2eSJSihiZLQtSJADViMqqypE0u8/LbN/LIucHERidOpPKlWaGkpo+QP5O8m17JGnK1sdrHpYAt3/BFIassG0aphtPIEZIF3r7AgGE2+qVf5zs0JU
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2016 09:47:43.1455 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN1PR02MB086
Cc: Mubin Sayyed <mubinusm@xilinx.com>
Subject: [meta-oe] [master] [PATCH 2/3] benchmarks:Added recipe for dhrystone
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
X-List-Received-Date: Tue, 23 Aug 2016 10:02:16 -0000
Content-Type: text/plain

This patch adds recipe for dhrystone benchmarks.
Dhrystone benchmarks measure CPU performance.

Signed-off-by: Mubin Sayyed <mubinusm@xilinx.com>
---
 .../recipes-benchmark/dhrystone/dhrystone_2.1.bb   | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb

diff --git a/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
new file mode 100644
index 0000000..d0026d5
--- /dev/null
+++ b/meta-oe/recipes-benchmark/dhrystone/dhrystone_2.1.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "CPU Benchmark to measure integer performance"
+SECTION = "benchmark/tests"
+HOMEPAGE = "http://en.wikipedia.org/wiki/Dhrystone"
+
+LICENSE = "NCSA"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/NCSA;md5=1b5fdec70ee13ad8a91667f16c1959d7"
+
+SRC_URI = "http://fossies.org/linux/privat/old/dhrystone-${PV}.tar.gz"
+	 
+SRC_URI[md5sum] = "15e13d1d2329571a60c04b2f05920d24"
+SRC_URI[sha256sum] = "8c8da46c34fde271b8f60a96a432164d2918706911199f43514861f07ef6b2f1"
+
+EXTRA_OEMAKE = "-e MAKEFLAGS='GCC=${CC}' 'PROGS=unix' 'TIME_FUNC= -DTIME' \
+                'HZ=60' 'OPTIMIZE= -O4' 'GCCOPTIM=-O'"
+S = "${WORKDIR}"
+
+do_install () {
+
+	install -d ${D}${bindir}
+	install -m 0755 gcc_dry2  ${D}${bindir}
+	install -m 0755 gcc_dry2reg  ${D}${bindir}
+}
-- 
1.9.1


