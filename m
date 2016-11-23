Return-Path: <samuli.piippo@qt.io>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0116.outbound.protection.outlook.com [104.47.2.116])
	by mail.openembedded.org (Postfix) with ESMTP id 5221171B47
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 15:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qtcompany.onmicrosoft.com; s=selector1-qt-io;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=QF9lQR8wuxijfYHbPIErb9yxxU+HFYwYApYYpgFWUjw=;
	b=a5HHZa4/a6tr3OMXyUnYgETfqrVXfO4AQqI9WuEpdwhZPzDYg+NZVO3ivH0qvXdqjaoKvGsrE5Jx8fQb71i9l4wWE/WUsLEaD3gGohcMfIntzxoD5UVN81D2m/2mtIKINYUICVeAiDhitqkG2QOHzm9HAPWLFR4fLn+YChuZ/oM=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=samuli.piippo@qt.io; 
Received: from piippo.intra.qt.io (192.89.120.53) by
	VI1PR0202MB2624.eurprd02.prod.outlook.com (10.173.80.16) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.734.8; Wed, 23 Nov 2016 14:36:31 +0000
From: Samuli Piippo <samuli.piippo@qt.io>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Nov 2016 16:36:37 +0200
Message-ID: <1479911797-29957-1-git-send-email-samuli.piippo@qt.io>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.89.120.53]
X-ClientProxiedBy: DB6PR0802CA0029.eurprd08.prod.outlook.com (10.172.252.143)
	To VI1PR0202MB2624.eurprd02.prod.outlook.com (10.173.80.16)
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2624;
	2:GdhYs1zXaKyMdDd1MoDOIPERkzPYvKWHWyMbFJFAjqRgqdeyJaZ0sQ31EWofMjWbiXj5g1tZmfsUUwv8JiXZVw7K/CcXOTDiIlr7a5oocvrNadUuxD66kOJ2+dfTqd29kQCCAwrW0eIzkoFxS1vFMvTCBmLAYR9Jym/K/XRbVlY=;
	3:InRMP/yhcK8vl+H0FKtv8z9TsWhAxd4ZzfFKp66uudG0XQGJCp8SQLJEeC1enDdA5MvyS3jJtlblzBmQvz9jiBKsuHTIG9+p1RGo0Dl5N8iLVmnQlJQfk+FTNj9gqfL7JjkS/TNfPVE+54VAGhbeMefg4vN0P3U5FxVLdy7OpSo=;
	25:aOFaepcAwHkfRXU9S5DdIVn1JryhlsRehpUxSWQfROTVMCfhWkKh3MCh9R7c4Ksd7hwT5TYJ0fq631MNzjAPAx0Fa+c+8nEqe0bFhlM8ehTB44q5u9xrS+jDWwOgtNwH5D9ef6rZ4B7bPy+fMJlTAhvMfxd5c8yZglWabv/nn4encSNH9mzX7wpQ/jUXxgwaH/OZFmDsodjmJb2JZaJRgJb3tDKt6QvM3IbwIo03MRdsaCYCssaAs2wd1VH5H0DlDnz3LUJTIZAu8D7OWLQOljE47rFJMJREeBt13ZEiAGMj+eeeZ/DbMGysP/bsoklPo1kr/hhwWobI6udTLyM8RKNO5aEZcpZTOthSAAlRZmd6PHCdlU75JvqvLXi75XH/oujfqgw9Sgt5lF9AmTcpWfKAqhCv2GWt4NjknFiZWaipbL/Skch/qSnDeqXk5+R+Br2mQWCpwHWv+MISggrTpA==
X-MS-Office365-Filtering-Correlation-Id: be94e7e6-6c7f-4d52-1ca5-08d413ae1e05
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0; RULEID:(22001);
	SRVR:VI1PR0202MB2624; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2624;
	31:cDPU6aK2InWtubdQtH0l861f94Vw7s+pMvDfqvFMgNxSDhYjZq94kQEQ/c3V8Ih9A5ynlMRoQyiHHukMfFfBHNRM4P2TWTN4uaqq4yCGxCya65ohnHChv7DsnO9PK3PTYW3BDaAMjAGk74K5JD4/n14VjIhvVBF/pJcL1025w9IQtD5+TiExGHj7+Pv05LuXgMzG16gYNwNqEHWd/U5bVUYY8uOB2BvDvgDlKq1LKtuCDzSF6zwh7oU1h1cg623RuHBi/Jz/spnvUPvoI7V+0g==;
	20:ORiiPeUS5zqISTIm3XeWFd04AA2yrWYpESpxFBoQCtMVvRFlJ/cdjBppyx2YepLKKRH5C0QilsZmP3d2wvtZH/GR6UvwX/LqHYc2rmHu0ZM6Gwd/Noeniqo8sGm9r1QO93owAOAI+Uz5twL5VOoGqwMezlgunanGFQDSuUYH/7MzlYX8RriTpglwGhMDlTiJ0E9XdkGMU7ec8qoYA3qb40ATxtQNLwOfkVi+NAJQkEOqzg+ea3IZohZTMFzuUCcL
X-Microsoft-Antispam-PRVS: <VI1PR0202MB2624872C07227E2A0A1ED2FCE9B70@VI1PR0202MB2624.eurprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6045199)(6040307)(6060326)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041248)(6061324)(2016111802025)(6043046);
	SRVR:VI1PR0202MB2624; BCL:0; PCL:0; RULEID:;
	SRVR:VI1PR0202MB2624; 
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2624;
	4:/AymtkTd21ul7v2y/YMlq9lvlUd+1ehiJuaBhua9BO7EbVPAyyicJxAyo2vhAFzWAk/PshL1b6mXjZBcfbJlDvCtwQ4g5SiYDWzCAjNcYoAfROWqgWaKYRpidOMNIxcd5FQ3YQTGSTWLw0xeypk7/MWp48wFaVnYDaL1dCqmZxSMKyD0GyvpnIlogK0qqueyNIB9nXciM3ZKaynfxMEIBjP+2qDjaUtwxaxWyoVXNRbzA5Pm3N7W+1K4+yZ9ucFgBiHP0H7oBaQ6RccHsNs6YdLeB9ewtX9LJyPvVKeuKsihtjjU9jIFt8efIlemWz9yRo4n4fZMbMZdK7amCnU1wYpUCSlGa/WAJ9MAH0WNIy05sNOPla31C6XAMOcySA1BdiH8fygSipjs1/dWg2Rhu6SSE3ptZh0aqlGOwqDwvgMCUQwAzqh9fjIYX5eWQEulRtKWiN8OdnPB2F9zVuLTiilxRQbyxHaiZIzgdQmKjrGGWE+eY2/1Ze8MaxYuS3UoRSuRw7h/TmMC0jAsXWHW2g==
X-Forefront-PRVS: 013568035E
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10019020)(4630300001)(6009001)(7916002)(199003)(189002)(107886002)(106356001)(105586002)(47776003)(2906002)(2351001)(450100001)(7736002)(7846002)(305945005)(5003940100001)(33646002)(50986999)(92566002)(189998001)(101416001)(74482002)(53416004)(69596002)(48376002)(77096005)(97736004)(6116002)(3846002)(50466002)(36756003)(86362001)(66066001)(81156014)(50226002)(6916009)(8676002)(5660300001)(81166006)(38730400001)(110136003)(68736007)(42186005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB2624;
	H:piippo.intra.qt.io; FPR:; SPF:None; PTR:InfoNoRecords; A:1;
	MX:1; LANG:en; 
Received-SPF: None (protection.outlook.com: qt.io does not designate permitted
	sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; VI1PR0202MB2624;
	23:vHXIAJWYlKJUX9Un/3n3CjY13SQSQ9okekNbOXs?=
	=?us-ascii?Q?cUt74cFOmgW1D56wSodFGFTBRQTm8u+oEI5Aw+rKssiC5LeYZxHuM8V69MWd?=
	=?us-ascii?Q?3CvGEz95/8Gme2kisqQMY5VMUSTRjRTEVnk6q5q0PMHyOK2r8lLwK/aaDvLL?=
	=?us-ascii?Q?aPnpoggccPTzb0otAzsi7wq0cr2urKuA6vKiiIxVdVPpaJhXFtwEJOpI48Q6?=
	=?us-ascii?Q?hbz+ouLzmV+WpTD0FIGH9+tZJNBfwLhKbFbrkhUIrUeTFvNEGAq5qqhxlrxH?=
	=?us-ascii?Q?5/MlDOMaJ0dUdOPi896d/3GnVzKXy+q33zvnMODzoDLaYo8an7WVoBss8fuL?=
	=?us-ascii?Q?/DXxMwhSjoJorqvk9eAgoVrswBLHXJlKl1x/ObIbM3fETgFFnUswjAgQstvu?=
	=?us-ascii?Q?AnW8IuVPdljarENfF8vYDcRZ3wcBFdDCLqD7yeehZYHPDWdkEpMkV0AKQFGD?=
	=?us-ascii?Q?rO9WSp+2xaJjiwgu0kNcJ9ss4GZNYXdHQOifzxtbfyHkzQ+aZDXw88NFNx/3?=
	=?us-ascii?Q?Fn3z68PQTDH3hFenbXVT+9YMOHP7mO2aebztdY01/wBLDon58ogkNFLtNWGD?=
	=?us-ascii?Q?4la67OMrdx+fqzkCj/1RkAIvqBmEQ1Zku6d6rApWOJD7IcZDFnyBk0sVlQO1?=
	=?us-ascii?Q?8l1DTg88ay01zRKAcGGVhKVSxNbeusNZPcXZD1w9EqWNRq2ltqfas4aqJ4xI?=
	=?us-ascii?Q?eiiK9CtT20WxYnXrxaHLXSYU/+EwUjFgHleaiTtvK0Ddi5fSAS/9j5/jhRyM?=
	=?us-ascii?Q?BzA6eKQvYfLOhPfrmDmz90qp3FFdg8NE+rT3Q6ZolhtVbJ+a9LDvNWos9Bjx?=
	=?us-ascii?Q?44EKgjzBkBmBw2zvA65PmRtpgE93IUBMlv1N5IvSEFHQE9ZTDOpqAjRsdN3N?=
	=?us-ascii?Q?zIjRLeN58+nT2pzSH7A90QPgsBJSpBiPL34ZDQvP3iVAHjMpbjE6cYq5bRIR?=
	=?us-ascii?Q?k0x6nq4eVjQdyMWmZFsFGoWH77ZqIuqSv3sYyUOxzcJFVyal3kLsT5BCitiW?=
	=?us-ascii?Q?kvDr9Q5djGUiHHmxvCVFdxJDUli4EZFg79J+bCcIGX3UH9uKODuGF6vW5jMU?=
	=?us-ascii?Q?/AIY5W/8=3D?=
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2624;
	6:J2qp28b5uLo1EqODd0JsIhKNMXxVFvb5aWUhaaGstkNuAbMFf6SHbDT3XqYB3wSAsCNVVw3X+gvJ4yiuoHlkOuCILxmcpxFbiexDIdptzQOAu6wGf71ySJlY7gwo9+1dal2/s1aAnbtr4onINQJBfIBfklQcvkUIcc4/PMjaW9lLT6NncgF+XMT1RIldqTb6v5PZIa6anuBXfH2+cjl58ZZ2xtbfiy6Tum7RuD860Msg3jlpf4diHoIYxA+zvbxXuCe/5TtFFI00j3kdMfDt7PPEwPRu5FaA8/hKz0vzc7ip8PuHfOfjV0rzXBa1wgJRllI8+C3gykfUr7YcNREVi7nFq6uPRDezdRTfVxJMi89ksCVEVIIbb1+wiMgNSGgR;
	5:TIKF5rPxEqqhU+xBjs2WEveezByi1IMLX1I5ZND8UNraPg91aEiRBqU+IHL6GnsjtIORxCna7B3aabD66oUBjrXD7OG6fcZwOX6mXU5WkybiWzqvrTFd1reyPTxHsm3RjMgnzG/v65hq0nWveNkTZA==;
	24:nGTQGFrpJKjSMisbBDH5LKGOof8c+QM+/VYYKcrYMzeeu9jRoLZ5Dy91Nzn1ShDbJ+4apvsKfu8b1te9/sZJgXCI9vH8o7G6ah5DqIB+kHw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; VI1PR0202MB2624;
	7:YtAy0nstYcrnQQT2/LB4/03f5iMai5pYzol/39PfDe6uYSmXrWW1NC6OxG23BRRzToKDb4xEA54VKjrKpMJAKs1Hl2kOIbGuSWZiA8KLL7TI+40EP3lX22vBqbv2f43smrtr5Dfy1WAMox+2LWXGJvoEFYVtvUoAa98O8dr7rAo2eO23IT50IKvvZXcXuZ4xJTiela+v8Gm/nJ+dJTIp96X4N82YdahJeIWyl+Olatvt0F1cwpp200szUK8dTMvLUFogUeHX66GhMGCB2YxyhAMXP/1Nh0qdoOY0BUSj/vuS6zShsL0YC3l6i9TZjjFYXvPmETsnVwgNwjrRexN/xX0sAuiomnZBiVlBZ9JlWoI=
X-OriginatorOrg: qt.io
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2016 14:36:31.2078 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB2624
Subject: [PATCH] mesa: make sure GLES3 headers are installed
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
X-List-Received-Date: Wed, 23 Nov 2016 15:09:51 -0000
Content-Type: text/plain

Since there is no libgles3-mesa package that would pull in the headers,
add dependency to libgles2-mesa-dev. Now there no need to manually add
GLES3 headers to image or toolchain.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-graphics/mesa/mesa.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e4880ff..525a2d5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -79,6 +79,9 @@ EXCLUDE_FROM_WORLD = "1"
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 RDEPENDS_${PN}-dev = ""
 
+# Add dependency so that GLES3 header don't need to be added manually
+RDEPENDS_libgles2-mesa-dev += "libgles3-mesa-dev"
+
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
-- 
1.9.1


