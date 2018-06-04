Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0087.outbound.protection.outlook.com [104.47.34.87])
	by mail.openembedded.org (Postfix) with ESMTP id 6F0F675438
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 23:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=FniRvmOfhTN12Zn5oSZtyUE73zA+jTL18DbTx0I7C24=;
	b=fv0EqndUnXe9PSvJsFkqxC6F22aMiGkK31HEHHjtigNgmJ1fsblHvsEfr+Z1jF+Tmns0Turs0eJE5qzJ9ya4WsqPR3wUl3vOeXhgvZiXHOlMF2oT3IlfP012IJC1J84k+dLf4GWYRr6iIJuwV/KDi1Ln4DLEYWNxNpF/NulglFo=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	DM5PR0102MB3416.prod.exchangelabs.com (2603:10b6:4:a0::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.13; Mon, 4 Jun 2018 23:06:33 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 16:05:59 -0700
Message-Id: <20180604230602.8461-4-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180604230602.8461-1-mkelly@xevo.com>
References: <20180604230602.8461-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR0201CA0027.namprd02.prod.outlook.com
	(2603:10b6:301:74::40) To DM5PR0102MB3416.prod.exchangelabs.com
	(2603:10b6:4:a0::17)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR0102MB3416; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	3:dvrDqbSYha0LUVHRDiuPudyBRHWibT2nZwRgNOYPJZ/E6fdOGh+b+ilszoVgpdknHJDwPlAJcesYLQbTzAo0xB9W5spFnHmwVa8QeBQLZa58XfHaHWeaXTVYWo6brnwGxXz7l2NyorseojTS/L23kUyW2ABRnqwoTLrpvOBycGWqbAjTUKqL3nflwHL22UtAxS06Q09jqHEaCIb25iYocjYvv6Oix+Xd6KEoqccMZWJ8+4nPGXNJZjD4HNteGE5b;
	25:bADr2Qie9Duu0K0l7ROOtfDt1Hg5fnl0cx5k2ubnw3+egklw+7LgydkhAvoIQ/vqs1oETvrKQsgVyS8ErYMS3TXuosYNojvtSWXr24VeuW+dPm+BfWRAB0kh10v9xeal0JFOnD7w8IzDNVI0V7aOGHa4HlYpxKtVbOX91R2rRcKB8qBocfATYxOSDGhVocZ0xzJsgdw2PBOp/MFfZ9FyikriChoQyywBAk9pUEbvr8LJBt5vLGIOWMpUsxnTx4zbove3qbaugwYlHWKY4TiVshlTwDHxfnHAFA9aYh82+QGf6OukTa6HgsoHnD4Y2WMafHOdB+7uWvPfGu7dEsdoxw==;
	31:XaMj8H7ucpBx07YC5TNrU+vpsxR+V3RkDCK9j5wQgOVP68nHhgbKde30sSAQmN5CpS9BSnT5hGFfbl7U08DjRGhJwqTFuIWxvZoyZR8l5NHQ9y4TElL1k826w3bNzlJKHcxptPRVTX9a1IQ7kbObH3YGRijtcP+q1pXHXO37G0AOz1aLkDR03tgIqCxZW55kGY5W9oQUtXwz7yvs6p9Dfm2rXt+xMnCeygCLqXVn4AI=
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3416:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	20:/OkYu3ZJudU52yEOmN4AA4i2y7OCdvXXGO1n6BBfrpVZyulhkaSsZEBsMX9+NvBdL7oPb4fbxCvv6o3DayTZTeMNleK1r1Q7yMCos+hnlFrn8VpjB8Akn4rjaxKUUk/a12uwxLbz8lOlPvW8Mn95Yq892F0P0Dt0d3nRpMWSeaZFhXn5Mak2iF37ffHMetfv/Y3uLmaYmq2/U60QeY6qBFnULyGuW0fF40I0DrcrzvgPybuD+vWw7sdeHQpyH1FrtQQ57Z5cH5HnkktXYSvcRl8K1lyamXrT0nIP0MHbhzKZdiesd+LrpTTcm1NYcXY07oUmo3nuqiE422f/9N8d2C3yINxl54CtIWGDce9RUxBxw/amN6qXt10pue9T3fVBhGVzvTBdsUJVwJEnMUHroQhXZ1bpEwHRVM5RJaC7a0IxkhA6qezD0vvqvVK9obLGrcrWkkvAv+okEA50cdHRqgENssQrvMHULSsStMLBGn/dSxq945yLuLta2F+FlRMe;
	4:yq5TZt2csld/uwJYwBADUzh1p6SsLOB3clXqz4yYg4ey9JDyJSg7S4d66E5hlV4P95TOVULknRI0WIMPbU1j/irHaPe8EnXM28uu7w3U9mP5wVsMdd+pO+15JpSpSzOZQsY5OXIe0wOwfmzy4eO/aCsczEMen7Fu8tqYMK5Ptfnof01SIc4fqrI0oStKmLoonU7ZQQwHLmiSyJNgWWiA3EQlxYwmsZ0/fow7HfSYXp7nEN9tre65UHtypJb+rAXtkubUl//oudIZcwPlpPmEBg==
X-Microsoft-Antispam-PRVS: <DM5PR0102MB341661B625A7BB836C2F9512AB670@DM5PR0102MB3416.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR0102MB3416; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0102MB3416; 
X-Forefront-PRVS: 069373DFB6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(39380400002)(376002)(39850400004)(346002)(396003)(189003)(199004)(39060400002)(81166006)(81156014)(4326008)(54906003)(97736004)(446003)(8936002)(5660300001)(2361001)(11346002)(53936002)(50226002)(2616005)(50466002)(16586007)(6486002)(2351001)(48376002)(476003)(186003)(956004)(486006)(47776003)(316002)(26005)(51416003)(76176011)(386003)(3846002)(6666003)(7736002)(2906002)(16526019)(36756003)(6916009)(305945005)(68736007)(1076002)(66066001)(106356001)(107886003)(86362001)(8676002)(7696005)(25786009)(52116002)(105586002)(6116002)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0102MB3416;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0102MB3416;
	23:3nB9RnSSUakizTkLpAuAWUBC32Iy/5r0+gpKYm5?=
	=?us-ascii?Q?J1eZJWWx/dCsBZaxfuwL/+hwMRRl/JSr2e1i9jiizJP1yvSmhvzsGK748MzL?=
	=?us-ascii?Q?swOQNxzUtejEtJQdDd/XZ7gZUa7KbxlT7tnEp6P636GJ+0vQkhgWlrwLUL1P?=
	=?us-ascii?Q?wBwnoe6qS8yomKz1zj14fmEYHWKelms0rIno0oYCPbkATaO94gvOmX4PcwZm?=
	=?us-ascii?Q?xSdu4auRpsqEbkz+hRZTlKafHv94Y9kl+66Gj1TUuj7PLqR5jdMkQ92vnRQy?=
	=?us-ascii?Q?G5n40889GMneQccUThGNa/YEDvul4PDTNu8C201vigFWhLR1iU9NI4ruQHka?=
	=?us-ascii?Q?fQ7Q4aF6fzMcVVQGbcZUNOoG2yKb1Pnl1P99GPabLzUfyHuSFHKVyhQsspPJ?=
	=?us-ascii?Q?P+hkBgfVgFqU8oLRMwbuIK+YybNalbWk2ZGImhBjbbw/aWJQCN3B1GHIyLNI?=
	=?us-ascii?Q?Q7mbj0pMqGW484GSsHlNBwtxv1Tkj2/JfHRwL1rNmT7Oo0DdQbLXW/9Y8EWR?=
	=?us-ascii?Q?pblRTJEYVUPcR3w8k/0RhiH6MaykglII07wWMGF4pNYeA0rrC0OUBQoLPzWA?=
	=?us-ascii?Q?HGLtupDQzppyf02SzrexS8oJZUkMI0+fP7PonOITujoqyAiaMr3pauYPOW0Q?=
	=?us-ascii?Q?tE/2kwyvbRF1ze29D9VxjOC+jGYla71XxfNWOpaYb/7YRkcPwmQdOZ0qhDB/?=
	=?us-ascii?Q?lwLXZtvM1xvZp63FNxF1RzNBkwY9btQSyrDELWIvKHC4Q9is++PreEwwlWz3?=
	=?us-ascii?Q?2l5jOQ6du1dAJffDciFDD+S93KyqkzBRWkHOFaTRlXy+uFg7mDStO6V0wfCn?=
	=?us-ascii?Q?HOGAjUfcbQM4GhOy4CNthLXwSH5ynnruA8My3hAu5exvOdHdo7Vv04GyAwU+?=
	=?us-ascii?Q?Pm2Vw/8IocM0gt4MHgWQ5ltoVFh9glA02b9YInYADywPsKth435iCCrZwSq7?=
	=?us-ascii?Q?sml2sPABOzh/WxL7gm26GkEd0+kNDnaRiOnBtIeZ7uVNiKmS0L+n39j+2XHC?=
	=?us-ascii?Q?fXTyQN9MZTfSFXiTdRwyXpsf2ZlfePh7I9pE+FefiByrBLxCWrFAUKdSS43q?=
	=?us-ascii?Q?k3JgZ6ynWft0M/h0ivicM2P7CZDm8plUJObqM9dVYkBkoN71UTeqfIkRArAg?=
	=?us-ascii?Q?59IdteGhDfN/apZNOer3QtNRqoN9oYYrmHtzbduTN/DVaJzt1uolhC2wrhPw?=
	=?us-ascii?Q?g7gym2f+EuPJJbHl5+I4OJLQqL4aOHeNAlF4geRi7eVbq3FJpL7NA7gPU0h1?=
	=?us-ascii?Q?Jw0p3dcOUl91vqsWjywbDKufvA3MR8IM8+LOpuAXchfGxvDngIK0HXDG2cLc?=
	=?us-ascii?Q?IBw=3D=3D?=
X-Microsoft-Antispam-Message-Info: +kRWk9zknHf0IVkpqa0xvGvzG70stzrL9jhskAFKG0Lu0mdFglVZUs0xPgj4bS67DSKwfld++s+qsScl3Ij6z0I8U3SN+Y5Jdo7JMUprYzYexRlXjZt102Aw0BI42DEiXKNmE/9XKl7bTCbYvVzSSaIdXC3INl6zRmHHkzuZHmbBOg61dSYTmpnihRu13PXp
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	6:iuVLEH89LWt+9PRVguyE/slZN0C0AyqLDvQYx3pE/sHdGPCWjYGxE/LZSCE/HD4BzG+YRM5yQ9XUwKT+JkPMzWyJAkZejkRYtQtCLqKVu083+dmZKSieo7X7iwwG8EoA90Aj0aq2Fo5B0PUnnYWHC7iaLAS/t2VUBySOwvnQr1tMrTSQgT/xxdCLEX7QmZf845/Zeg5ufyGSpUApUXErqZdMODdrws0PG/H/X94AaXlECYMn3vYq1JAja7A+FZzPWW2lrAw81KSbxFGouI+d0k8x8lB9gfgggaLyO1pugpgU9R5hKTWbOcUmqL+LJmqx/h9sqfsrqpTyDvAQrWgSc4fIYXlMaku5fCtoFvHN/q0tr3JX9a3pZUdVxcYHQV4mcRYvwHuRexOwSw3R3VfAF6l6+fk5qSfkKqeTrR7uYXzCYxjEhMZ7dFY3X/+uvwewp4yeaPu7dodWoqIRSVyk7w==;
	5:lZ9bofV4LiArnlx+HI511k4M12cCXw4SdRqSAbdoApv7AxjqXKz/7ZhTdmtENUKrSkrw/cPY2aciHbJoUXkgSVGZPuY2wqU6F9i463caO/q3c/kpG41dy9dI7Pip+/agH0/K3Eze6e+RG3a+P10nQTqoKWpfJsEvbfGk5D6LMy4=;
	24:6sPTk/2WUcfwNtlDK+q4WpFpZg6lkfkrgQG88P1x0APamzxbqTn8sI4gYCW/OaMo7Xg94UX7v7BWUu8jrBBW1CEzB2bmVTBJ/jtGALAckTo=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	7:SVaWIuXGw3/8K8MJE0nE68GBclPdDu1KVCEQy2qxI3kzW9AK8Rsr/9BaIcT2B8jGEVzKKwEAkgd7K/t5Zq1C61JB7nziI+RU2zU/zw7vWN1tsO0n13bWWEWWIfAHDjxbDdmFsnl7FN0s3nPRN1c9K5bXnsWE2xOG4Lq4RvMwdSAiL12cD3gX2FnyEP73OVH29k1MpAWozo56u+NFOdDVzAXDyOldBoCdjQnj5m5rUhYZobpWZFmmgCt6X4ESqT/w
X-MS-Office365-Filtering-Correlation-Id: ad9c40e7-2417-44a8-a100-08d5ca6fd11d
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2018 23:06:33.8801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad9c40e7-2417-44a8-a100-08d5ca6fd11d
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3416
Subject: [PATCH v3 3/6] toolchain-scripts: print post-relocate error
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
X-List-Received-Date: Mon, 04 Jun 2018 23:06:33 -0000
Content-Type: text/plain

Currently, if a post-relocate script fails, it fails silently. We should
be louder about this, as it likely indicates a broken SDK.

Print a message if a post-relocate script fails.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta/classes/toolchain-scripts.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index da8a57f24b..ef190a69ec 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -129,6 +129,11 @@ if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
             continue
         fi
         \$s "\$1"
+        status=\$?
+        if [ \$status != 0 ]; then
+            echo "post-relocate command \"\$s \$1\" failed with status \$status" >&2
+            exit \$status
+        fi
     done
     rm -rf "${SDKPATHNATIVE}/post-relocate-setup.d"
 fi
-- 
2.11.0


