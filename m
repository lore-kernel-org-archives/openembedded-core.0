Return-Path: <mkelly@xevo.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0087.outbound.protection.outlook.com [104.47.32.87])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0D875053
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jun 2018 21:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y7hghkY30nD5HbwR4WbGD0kwiwo9alRJeGccZ843gSw=;
	b=QBcugqIsUR4DUjiZGSZHX9us0MB7xoDZk1bohu8Y0Sn64Txm6833opqZsyIkQCWvn6eNnI+yaiy+UZeXsJ7y3Mn3WLR6d4orzG0C9q7HAQZgPKsxgC9SLgrV1cAnrboXjvf/v4Cb3hLXh6543YT28EJKScS4sJAiWZ8+NJOQRL0=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3417.prod.exchangelabs.com (2603:10b6:302:3::10) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.11; Fri, 1 Jun 2018 21:03:14 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jun 2018 14:02:36 -0700
Message-Id: <20180601210240.14969-4-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180601210240.14969-1-mkelly@xevo.com>
References: <20180601210240.14969-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR1001CA0028.namprd10.prod.outlook.com
	(2603:10b6:301:2a::41) To MW2PR0102MB3417.prod.exchangelabs.com
	(2603:10b6:302:3::10)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3417; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	3:lyD+vRvDVJRyT18MrKrZKZGgRnH1epL/YNxCFzACZQ3HmejBq+mVKkkLa4nTfLXPlj6nafwxAedEXGUxob0ChjKtl7LwsFxzLbZOfedOGfpFx6AfklNT4SWkiJTZJJfkgtR46MYmZM7XEW+9O79Rz+RrCD8Jm5jcYrEN9zgadnzHQHlUfCPN7YFc7BSEetubdCVqMzJLeSYHtlsCHUEwvpJH6RKS/1mXGcTImRbyzJOQ8p9vNu0pW2/5hUPT9/1u;
	25:h7Bk3fp+18AE5GbDRd6tOVnPs2VIDX/zoeF0z0TteytQNp1HdmwjcNuqA2f6itNw+RTP6kwTQxPfTxjHfueleRwJx1WUtLtAZ9tRHZGjQaPzpNY9gJIOmJtSg3sZEHtawJjD3cAlomOoHByC7liOgfAYH+Fy1djF0Lth7Pp4bXniwhECHBgReBu3MsV7KuqmNtrbCjjmYvv5EhZgqkl1ekyIx2O8qcwIUNzZY80RhE5df5l4uFu1Y0gpnzPZQSUAeQ1tVAgcZVPjT3iKb2HXjc+QLeoC0gufxEC8zKjsqrsdTimKh1RiEVEh39LPYlifuztyN3akGA3CRSsPDIIuYQ==;
	31:gYUzwku4qB2lxhxOM7hwLGBICaoMo9bhCQ9mGt4tAErEiDpTP/q1jGvXbf7I0Oy7u4JzR1CA3jkLaZsSXe5AkpCwGcaXmDiGokT0dyO0LC/O4nbHlJd/sYscgXjn1yfJs4BzW6znpb8SEeBA9Kw4nqO3VLI1yp64IqMGg46erR7x4rB5uP3x6N4Y5BaUJRtfL9sUDkj7gYJxryEiekWxw7I3oOo7LspnDNXDNjsUprE=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3417:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	20:Z77WfMIYgSwNTvpOwnlLqRRJqyQ0h4z5cnwuEQMUeUQnZ9wttLzs6UArM6uTxMQbJe2thsjj8IUUSAmw4ZxgkCMeUuVLFxbYHeJTJ5eI2iEc7aG2JkLaIB2r5qWsoAOZ+/GIXyF+ZiZM0LKrEbYjYBWlk/BdcUvkvueebFMssU1xndzlvQ71Ti/yNC4HpmSkc+fK+b3xBuxHWnMmdr1aNBLN0nB9gje4bP6RxPV7+jAPcrQymNcGsQ2ibl/tAzQ8SAc90iP/lOS6RUqJudqAQiw0wVK2TLXQ8e06ttOQk9x+bQ41gWTHCCLG4paTjrJDlRDH4BoK5W+QUbalVP9cmoqrWjPrP+kcv/rbHcNLXZbvTSYEYd68yfPFuPVqVG6VAtHctBdtNB///Q0WGJM0sFw4ExTsi0XIF0rFxH+fFtORp9rYhPBaH9Sh96OkIdOe2FCtC7oumWM1e6U88+18HXF6SqU7Iv19LxauapHSD6d/qPqET/IcUOIYW2Xk+82D;
	4:Yoeb/dihcYpHp6KOs/7tkLr9cJDnV6iuWn7pRU5Pd6U99IDAq/y/JekU8X4hk5/vRtr14JIgN9NBSUOod0TQvsDfadhjC6OZhxPim54VNGyghQDiwwSre1NudqMLQ3qJ5DhblHDjdVFrl/vJ9t620h0EmTkbPkRltwFWFvFnAqss9DBfNyiL/YT5tum9Vpc/2KSWrw3ZUnkrnldLodWPLyBhdJLxNm3KpGDBYW9j07FwSO1k78GlEg7IZtJvgLvZ4ipEvXT06xJgxMNo43+v2A==
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3417E8704386011740A93126AB620@MW2PR0102MB3417.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3417; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3417; 
X-Forefront-PRVS: 0690E5FF22
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(346002)(39380400002)(376002)(396003)(39850400004)(366004)(199004)(189003)(186003)(68736007)(6486002)(86362001)(66066001)(106356001)(105586002)(47776003)(7696005)(51416003)(52116002)(26005)(81166006)(8676002)(16526019)(76176011)(7736002)(305945005)(50226002)(8936002)(486006)(2906002)(59450400001)(956004)(446003)(476003)(11346002)(2616005)(81156014)(386003)(25786009)(39060400002)(2351001)(48376002)(2361001)(4326008)(3846002)(6116002)(1076002)(53936002)(6916009)(6666003)(107886003)(5660300001)(478600001)(16586007)(316002)(54906003)(36756003)(97736004)(50466002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3417;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3417;
	23:7/rvCSpTbPpGnYGvy0sEyLk5zLSOkj/nBEQ7T2z?=
	=?us-ascii?Q?lDFI9Shm4e3YC8le7ieRt8cQDls6V8mth2tTF7+Wyj22GrMW0j8lnfoizaqe?=
	=?us-ascii?Q?b0pvIIsC40RwSJsj3IC7uWGrtkA161oxgCjVNxcStVkydXUF6aad1kVDonHA?=
	=?us-ascii?Q?019EsLzO9XPNVUMelGIUDYKHO0B3K6XQzuK0Qsdo4HYzLAqvsd5AivTksAYQ?=
	=?us-ascii?Q?HvsvUmG/kyoXDQe2HSLq9ZeTQxgdIg2gdijxv9I6OCoDjHlwo7zB6AGH0F34?=
	=?us-ascii?Q?jbMahTqb8IRTJZ3jDydR97LKh62gtrx8x2wGD8Kkyn2qN4vAv9lEBPIduQOS?=
	=?us-ascii?Q?GouWU7790FASzOVcbcB3rCVhqt5B43wOtdNRESp1xSXgNDLFy71rdnLGFbb8?=
	=?us-ascii?Q?fkEEcXm01VZl/tie+oX6YYlod7U1QGiLIRfFPs2Y0lXZJXiLBhRyAHbFOVds?=
	=?us-ascii?Q?DYRcS5Eq0J1+PRxrxkiv71Qztbf2gzhchEewoykISbtMvbeuSg5qLqSd7ruR?=
	=?us-ascii?Q?xRZbxxsBLSZjU1IYejFxyaRCm3UIsBiQ4zx9gD/+wYYqewtfpAZyvVxJVibM?=
	=?us-ascii?Q?V/UNolbnlz1Ntq7MMj6tFQGCXcw4qj31ktWVvaHcb//JM4J94VG+Lhv1rby7?=
	=?us-ascii?Q?0aXPEwR0rG0lZCE6IVq6QDw0PppfKuDDpwrN1v36mrB4BoUdk6HlR6XMXnWw?=
	=?us-ascii?Q?NfrHfKyoaCxev2U6Qp/xubFHQvx33lYgZa8ZQ8uyr7ke/Ffwt38IUswjrsPC?=
	=?us-ascii?Q?dFHsu/+ednhN8wksHIx/YWoiiNRfWy3wuoPq20hHfsLcd8ywVmAQJiAm7cph?=
	=?us-ascii?Q?EBOo3m8lN0Vp5jMW9Ju9HN5e+QGPE1EVJVFA2gdkL6qpWgvZCE4AsLsKZhV3?=
	=?us-ascii?Q?d31AnBPHdYkv9eBBjuFR4r0yoWqb742Yzso4B+AmnWlfTyZOvO4IyOkBSBIN?=
	=?us-ascii?Q?5Q+cU/bvP9WcG2Kb2M97AdDnkecJPTEE4u7AVMx2pEElD4h7F3W0hs1zBM60?=
	=?us-ascii?Q?NPhUx0xBV0Jm0vPTD/5tpX8LYlfcmT2NNTfwfVVmWsziG2loM4+Skz1Phna5?=
	=?us-ascii?Q?pWSjUsxGfElXLw5eUz2W8N/+topfcKqaU49XfngbnzKMVeYtVakXc4OUViUI?=
	=?us-ascii?Q?YYUBjDjrLEyx29FGjKCYRsyHGhhmcs2IEngTJNt6O8dvIgqAjzYczwoFjo+R?=
	=?us-ascii?Q?peBYKanlB2WfEs4OUMIA0CCmRqr1+E2UB+jvVSCUIaEoiOZH4AhiR9NEy4P8?=
	=?us-ascii?Q?5OX+Pwdv7CXd1antmwWThOOIXQcpEpxLzK0r7aFv7yb4QQARMLk73bpMXJTm?=
	=?us-ascii?Q?we+ohJnZ5fpz8BraSy3/BIpk=3D?=
X-Microsoft-Antispam-Message-Info: QfxDXN8SRmTfJbhvPg7k2g9JVGfY2wL7PayJi6rMh0ArhsnoXFomJD7LL6AAIN4vMt491DYtGyzKvmWoKVgur50Elz6LY9DcBY+MVXaisRKgWBLmSVxc7TqLEpfgRYU3Z2Llw2dH9RK1YkpXXsxCnTheUpBGfIKUppFEzlbRMg8/MBCQ8wNDFLgCAneH9oeY
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	6:quYsP7Xv96Ah/8mQtTY6sEDs/LDBVv/fBWx9ncYR5pHBo0rsLdNhzBdqdUMz1ixVm/hMXO7N7PdpoNZ3XI3C35She7N40h7dS/VDPYbUx62MBmB5tlacCUETWovyvHeIG0XBdig7zRpkoap/pbh/unFJIc7NjCzHAvCAkqq6CcAeP6o9GYj/UtNpGzGtycSxZ6dpT0s+qYVIgmdKIjogw8lJzRpMF3PGHMB7UhUYBw3PsKXaH8rRoQZFClLcpuw3NxHbpyJ3iPigHoEglNvtbjC/OWw6qzT/KcaICto71QdGIeu6Ngo8Pn9FVvPHp5ZyD4ZBhSqagR1VjIHQDMMcM3WwPc8zKAQOn2igIpyX3kUF5Ja5mHU9FVFQve426XCHwGVcbFPUxl3lgviSCKYMeBBfT72LCX+dY3DvVHHAIltXDKAzIGz+hxQ0TX4czrth13tHP/UowMcKNuocGonjMw==;
	5:ySopYbrmtGguSv3y/H7iZly8OB/BQZmvpwV9EWnAaWhPoPyYAc99l+OI3Vo7iTw5MxpdDyrKsVTZqIQyTHyA8aOvxpOkOoj9EbFEC7jRaO4uRJwcYfEHzAuPvBjOKWtGim7WtHSUckq2cHeFPdJRqc210PaEPjcqpS3xk+e5aUs=;
	24:NJ27MzjRDHCGmTUF1raOegAw4PH/6cvJu6+138w3uemSHKJPljCPFyRaXx2/RIeTBqf8GiEfrqUoHkdHR+p1kGIbCz55Tgmg93BSRWortCY=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3417;
	7:owOPdgESDnPNnh5DpZVhcRw6uGElHeLmwy3v9C4NctRsW57gTqVm7GEP1GT0FDNd2K2C8+E3Rp6P3S8zyn7NtT1d0gKNxqHrzePla3fqhGmomDUm2woIugOD7wRRquzP01kMoDrqQfVRs3WcXBkbTy4qnF67B00p6nMmXIaPDpO5e3zRfsceBOAKJujS8S4o1JRtnUrFfYOuyQR7oCzedynhTfaoieC8XW4jOpZ15e5feUmLi2UIWaEfWOcliudL
X-MS-Office365-Filtering-Correlation-Id: 77914835-59a8-4d2b-6864-08d5c803179e
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2018 21:03:14.9038 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77914835-59a8-4d2b-6864-08d5c803179e
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3417
Subject: [PATCH v2 3/7] toolchain-shar-extract: allow non-sh post-relocate
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
X-List-Received-Date: Fri, 01 Jun 2018 21:03:15 -0000
Content-Type: text/plain

Currently, we look only for scripts matching *.sh, which means we can't
write post-relocate scripts in other languages.

Expand this to allow any type of script.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 71da5e5409..cbba07838a 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -124,7 +124,7 @@ toolchain_create_post_relocate_script() {
 
     cat >> $script <<EOF
 if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
-    for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*.sh; do
+    for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*; do
         \$s "\$1"
     done
     rm -rf "${SDKPATHNATIVE}/post-relocate-setup.d"
-- 
2.11.0


