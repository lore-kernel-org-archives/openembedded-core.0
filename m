Return-Path: <tom.hochstein@nxp.com>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0046.outbound.protection.outlook.com [104.47.2.46])
	by mail.openembedded.org (Postfix) with ESMTP id B69CF6FFCD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 16:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Ebww3sRaBDfUPbFSI0HTTRyi3GO+4oqof/5l+8aYTlw=;
	b=jqvIAXRPTYbU8KXUgZZLwr6RVCUENyJ3qYGkHTP7VZ7I+h3QiwDS+/ISPosyuiUcJi1WOsvSpgOzsTjKn7zeQZbVu7RxB5otKNGmW1f5HOQBABMN8adDqB9RHjw7ozKnCueDU3AQKiejYpeMMXWPDCIlqKqssawa32VEN82Y578=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=tom.hochstein@nxp.com; 
Received: from tx30imx-01.am.freescale.net (192.88.168.49) by
	AM3PR04MB305.eurprd04.prod.outlook.com (2a01:111:e400:8825::12) with
	Microsoft SMTP Server (TLS) id 15.1.539.14;
	Fri, 15 Jul 2016 16:37:35 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2016 11:33:23 -0500
Message-ID: <1468600403-29471-1-git-send-email-tom.hochstein@nxp.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.88.168.49]
X-ClientProxiedBy: SN1PR12CA0006.namprd12.prod.outlook.com
	(2a01:111:e400:5174::16) To AM3PR04MB305.eurprd04.prod.outlook.com
	(2a01:111:e400:8825::12)
X-MS-Office365-Filtering-Correlation-Id: c287fe3f-8e64-49b3-2a98-08d3acce540b
X-Microsoft-Exchange-Diagnostics: 1; AM3PR04MB305;
	2:HfncQlJmm6dkSaPlBbbi7K94FVQJgygVEp6j87MB/fsImWR5UiNHsEpCy0PFLvnhhFVhZg8/KPpPItydWhyg25jhW8S5oHQg9Wj6TxdzS1C+pD52QFpuYfGq1js985FZh5ZIdDzMwa2hf6V+pqYGDNBSRbFGooZuZu1Jw6NotnDX9AkC1mXHloByVOJ5wv1m;
	3:x1wQpN7nH+2TKgoLRZGYghNgm9Dkfr+nYK4ih6amxRUVB4AWYAI5JO2VAq6Mm7hnd2SDmmaRdDW2WCC2pu4I+y79vhPLsTJS+nUoRPZgQOd9s17WnNlZ7LowlnLXez/K
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM3PR04MB305;
X-Microsoft-Exchange-Diagnostics: 1; AM3PR04MB305;
	25:EWJkEjyEmCOA/NpsdzhsJGjxjxCS+jfP5tG/ll91a6yKxW9/N5Kco3x3QjOdNtaJVv0M55pVO36D4lYpI4G2QISU631a3DHtUqVKfu7XPH0H0WTh9lgtj47Wsz83teFq9YxOzmBKJ+Zm5plEYxCQfe6SzeHoPFNaCXHRkteKy3+WJWW1d0qy++bYTlXag27j2q3BVq7NPQEKUDpgRdmM6TwiHGG3YMnS4Lu5vd8/PFVcjdoe7yJPfl5smD4vfeE3+rNb93ZU6g+h3gYWrgON2zRok40f0XnbgSPCMRyBBbOHPUIKsywKsDU7y2P4b70vlVHVlDv5B8gA25pMb1MqNlLxVhw0ck9dMvggu+da9hdRREK5sG0lm4p7ZJmPYaq4jFrPehTj5Hr+Ac6tZfouLXg8neSA3UIDxNJ9jg/d7Dc/9US60cXlSCP9Qwe819tMkpaI4uxndu0tFfJRdpEZ1FflGTyYuFC3sxFKBVkLkmTvtoW+9+ExDQcOCcPhBWblOIIUFoWAE5CkpaPRMiZgHKkj7gZiaCt6fS+TLKlPRiTlEbKdByBBPIXDxKcAiPfRuNfCbMn8LHL5y9kaKVrWeckbuJ+5Tj0EXuw8JlIZjz1mGL4QDXKgDXpXXWkFKfUax2OHnvmLm3+XZ9D/RO6FxD/P4kyYVs+4TrbaGSuTx9arIMSDJ/aKU7dCCh38YWnXVviWeDGpwYgvjcQTAN3BZg==;
	31:Zw0KcU17TZM7sBtfQnWEW7r7WqZ/fFQAYw5WTbwGERuY2ORPf4FUphSmDja8A8XpzRmubCwndhl2t3/sPWfRjpUSppamp1bvagXpBFfpQ0MweXz2v3oO23uFDRn5GGPgRKIjWkq5AArtfUULzB81r5UDtBkg20BtiWOvIzLarl3yaO4+rDqjKJu2jwasOqBtiqKLHmUKpA7CLiQO96Kwcw==
X-Microsoft-Exchange-Diagnostics: 1; AM3PR04MB305;
	20:wsF6tnyOA3Nc5rnXtD0o5sy3wE9lmjX8WjcHGtNR+PHHoKbPD5tqF7gWokkxaZ6C2GcwmCXKGqWjYrNj2NvYEYl//Di6qQ6GPosJ42jcnHZhbvzAQ/D4LgKeA0ZqbTh6pOU1iOXz83pcp7VGBqieJRDfHxsfw71sjHp9WuACFOT5Glb5GPwBE1jzPj6793pijlEYYl5eGSqaIJJPdbUfkfCZuWC4snRjdk7KdhKO2r0VaiJorujwQMuQAH3Jtx3a/X9pAznDK8xg1m490R4PXVUeFig0XCI0EyLqpo6/gUsN/FjkfmXGaOENsSRfj5/Z0VU4BLB41UCHFXGMuufwxk1EioWwzShyp8F5T2jtr/stmfatXcdFIzsLn6YTCK7uthZSAf2hWRcWJkwGU+nykOmL2RGg5/GvqdHxh1XQWhox1hr6ObHXkhgfP8mMHWL55mBO+HusEwgoO0BZjbtdEpEG9II07WKb7yMlB97mvM2aN8bisO6gF1q3UIfXspts;
	4:IFti/yN66CqC9mtE4fGljpxhxQpLa5eCUWha1IdfX0/bm4kWwas2hvnPqvchKFYqm2Dlp+nwh96R5NbfJZ++p/azD2Jg5LijdkF1fVARlKPQ9f1RQGlFmEcbD0kI2LqxwtrUoGt9Rgon8owyG+x8bf8aoUMVqcXanWsKDnqbJ8INtWHiX3T9m2RKZAq7WUch7uw1kssgwSFfjWbemlQOK+dJrUuy3g581AHtCmIy5dXMm4GyvhC/HoZnVeHjgJOtoVrRJeVTI7J/7UE6ODnbXgCqRQI0DUfnjBWb2SzovyXaomGwfQADFe6sxxnp1emSFhKB53mieECNS3h/F3iV4s3ICpEIsD1aXxzVkHgRY8zMQPh/5TtdO0vR4jZGMJ8PL2bMNtZjLwCqx8KR4vhcL9KMnF2ok1djOQn76mh5PyGJL90AQHHScchkdbpqf7Wx
X-Microsoft-Antispam-PRVS: <AM3PR04MB305ED4B149989925E88E353E2330@AM3PR04MB305.eurprd04.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(185117386973197);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6055026);
	SRVR:AM3PR04MB305; BCL:0; PCL:0; RULEID:; SRVR:AM3PR04MB305; 
X-Forefront-PRVS: 00046D390F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(189002)(199003)(2906002)(305945005)(229853001)(2351001)(8676002)(450100001)(42186005)(4326007)(19580395003)(50226002)(86362001)(110136002)(50986999)(19580405001)(36756003)(101416001)(66066001)(48376002)(47776003)(105586002)(97736004)(189998001)(6116002)(81166006)(50466002)(3846002)(92566002)(33646002)(7736002)(68736007)(5003940100001)(7846002)(106356001)(81156014)(586003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM3PR04MB305;
	H:tx30imx-01.am.freescale.net; FPR:; SPF:None; PTR:InfoNoRecords;
	MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM3PR04MB305;
	23:lKrnZ6WsqE3iTBAqbp63gKRQGUG+Vq5HvvsluKKnJI?=
	=?us-ascii?Q?4mcKMRmOP4oE5mojsK6KrkXKCl00Z21U6rMH3Yh3+yXVFwPXC/9WQrW3YXRi?=
	=?us-ascii?Q?FxhlLeb1XrXnD8zb73z4000hoQ/pn6w3245R5PqjHRrGq2vWmytD9Mg8e4bI?=
	=?us-ascii?Q?ru2nC0QuRAgNkyRPM0EJvD8u89u8whIeJ094dT5RRFUh4JP/iKNOhQYokJzF?=
	=?us-ascii?Q?b6I3rw1JU2WuNtbB9zs7qVG6GgIr/Uc2aRmm+AuCxSG1JE3V+XKWx3zGBvHu?=
	=?us-ascii?Q?4kh6FdPaxC+Ba+KvUnauZbJ8pQDzZpFrlvX2hlloQ3CokHu4/lM2v9XsfMXi?=
	=?us-ascii?Q?6IU+JU9wruLr45N9m1YmVKykFwoa+af6bW9t4DbQRpJMHXln0hef64uMbLyi?=
	=?us-ascii?Q?AC6Q6nqL6dt7OB1PmRd9QiRC3lwUi6aW94FZEELdpY7G7aIJ4lmjtvq5ZOqg?=
	=?us-ascii?Q?w+xIXKcqBSUR8yYm+EIdXo5QvRrzONcfIx7Bec8fDH4JLBbLrGdEaB6CVEbj?=
	=?us-ascii?Q?6NzmNzgUpTeeQqNcOrhgEythVGimLTnbtO7JwAKQGU0AC1n5NTa2Uzat6Rx6?=
	=?us-ascii?Q?3fhZ4UM3r6iK9Mj3iTqhkE+mgaDsFbETM8oFKvU7DEbSSew0Hr4I+FlpL1s2?=
	=?us-ascii?Q?cGgyfAIVDYQpOqZNSfnog8OoTRAHY77Gb8d1TIIAt2CZCpnKhiWfYNZ0O1xs?=
	=?us-ascii?Q?ajYzo6fU4aumzLEBtLLrpszZbJYogBnJqMJZg6j20JaewBFTbE0Hiq/NNtQU?=
	=?us-ascii?Q?AQf41HAtiQoJazKNTUKAvaT3TzaNirYGVDhv4fcdBxZie8c8NDA+TUQ7gFRA?=
	=?us-ascii?Q?jnCvUZWMPtI/AuViUvx6T7tC1+i/czsAwRlzaUgV4xHFdHV9tF/1cqFDfBJT?=
	=?us-ascii?Q?A++bwHtsVqNCiVbLqbzPpI8Oo/Hpoo6NYRlXwv5TQln/vW8SmXtWKuNlWZSl?=
	=?us-ascii?Q?XF+lXwzF8mOtB7+nTGo+KDW0nLKehp4LtFu0sE7GDEwGVdNjEauMe8f6LQbr?=
	=?us-ascii?Q?0f6Qepl0yhU0qaka+Yx5+Le566QIZjfv6pUtlmcFf5Fg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; AM3PR04MB305;
	6:gkhLD3MkTL99Gab7O0aOeCWAHVG7B8ljGG2+52a4MTc59hcS2sJXZGkFvSOMlQORTN5mxg8QsSMX0XSi7unknJRMPuEGPwjM3BQ57lAZslBdswi2Fnavatx2Rcjx3I8J0Sh5xmEqDF5EwwP5gH0zJqqiLJTSa5869dTPP3drWuNrVI+9rNrH1qZODyo5/DHyl2fwnWpHb489NCHRxkqcWKwoQ7xS7cj+UY/k4lmUlrBrHSuQQ7RmPlH7nI4+JvDtVflYrc7Z59XQlKqLqKILAaMfM0mcreyPGo2GueJx/lXYZNJlcNrLpHKf9X2Rmr09n9XniNZSaJeq3ivUh3mxuA==;
	5:WdvpNCRWG2jyCPNWtMGmYwXsrL7BBjen9G2NkdqILfQMho+lpzueXzjKJvItwfSyGfCaTNQI/nnh5J1ShlHpUitQgJl/YixF7bsWrv3xXlWSmR8ias1Cj9Jphu2KQM5kQngiKiR5mzW1Z9j6u0d4uA==;
	24:unKqqXLirh1v6wm2PmMkLQGsiUYeT+KA2FxVXyQQ8b8oELaGwIHYQn4WUGYR/G+7/QM2BxWaArDvSCGXDbFv5qcJZhVbwDiR2nVPTdoYrFw=;
	7:+l7f58fiYtj8diJgDaBVUJ+XpMNXQF96cXQb9rcI1CiXSHgOgV3qEWSKqTvmoddpRjUV4dy/KZpuz7ypzOoJ/T8h0xn+H4twJdiULDZf6rGBy7e4Cj0kMGIJW035xNcqS/pq92ouZBz3iKa9kjbng1jS1u7x+RrnwHBG1hKL2oD46qDz7bEXml13nSu2tcNpbjNu5kgxCwhmK1W4SVEbliGXUblWFZ83ABcya0pMLG1b4O3iSDj5YuinUb0g2Qo+
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2016 16:37:35.7286 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM3PR04MB305
Subject: [PATCH v2] weston-init: De-couple framebuffer console from Weston for systemd startup
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
X-List-Received-Date: Fri, 15 Jul 2016 16:37:38 -0000
Content-Type: text/plain

The framebuffer console was using the same I/O as Weston. We fix this
by having openvt switch to the new VT when starting weston-launch, same
as is already done for the sysvinit case.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
---
 meta/recipes-graphics/wayland/weston-init/init         | 2 +-
 meta/recipes-graphics/wayland/weston-init/weston-start | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston-init/init b/meta/recipes-graphics/wayland/weston-init/init
index 5c925f4..d3e87c6 100644
--- a/meta/recipes-graphics/wayland/weston-init/init
+++ b/meta/recipes-graphics/wayland/weston-init/init
@@ -31,7 +31,7 @@ case "$1" in
   start)
         . /etc/profile
 
-        weston-start -s -- $OPTARGS
+        weston-start -- $OPTARGS
   ;;
 
   stop)
diff --git a/meta/recipes-graphics/wayland/weston-init/weston-start b/meta/recipes-graphics/wayland/weston-init/weston-start
index 5b7604f..1ede12e 100755
--- a/meta/recipes-graphics/wayland/weston-init/weston-start
+++ b/meta/recipes-graphics/wayland/weston-init/weston-start
@@ -37,7 +37,7 @@ else
 	launcher="weston-launch --"
 fi
 
-openvt_args=""
+openvt_args="-s"
 while [ -n "$1" ]; do
 	openvt_args="$openvt_args $1"
 	shift
-- 
1.9.1


