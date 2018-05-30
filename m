Return-Path: <mkelly@xevo.com>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam03on0069.outbound.protection.outlook.com [104.47.42.69])
	by mail.openembedded.org (Postfix) with ESMTP id 07CF972EA1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2018 23:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=y7hghkY30nD5HbwR4WbGD0kwiwo9alRJeGccZ843gSw=;
	b=b1shpmX2jcQF7L2DYKKp5HpkKk8wCKnbkFkzRFtrcvOCEWhSwHS5BDyLy9hH/Pg4BPj10Q0HD8rfhyYrNLBo5imTPr/Q6Um5eC+XpeSJJ+ZPysV6LpyYDVUuS7Mscri2OMFQMNt8g88wUO+jylLBjZZjAwuJGjPRQaMjmpsGH1w=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	MW2PR0102MB3419.prod.exchangelabs.com (2603:10b6:302:3::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Wed, 30 May 2018 23:14:41 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2018 16:14:03 -0700
Message-Id: <20180530231407.19759-4-mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180530231407.19759-1-mkelly@xevo.com>
References: <20180530231407.19759-1-mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: MWHPR15CA0072.namprd15.prod.outlook.com
	(2603:10b6:301:4c::34) To MW2PR0102MB3419.prod.exchangelabs.com
	(2603:10b6:302:3::12)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:MW2PR0102MB3419; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	3:px7R3l4b7Kar7cann4DpckonTXTYlLA1XyyoKUuPdtQr0WPyqScV9f6GpTpLSCcJYmKG+M3PF8eYJHT3g0c8p2dsD4fB7jLcaf/JdMfq99qRGTUL8MXvxTJfMDI0YlWu5HD/Ik1XpM42PAdz2CL7zagCLLjB8Tt/JGoXQoPXBj0NkQaQmCRyFyyR+Ti5DbN0cO9NyGNJFE91/5Z5D449NScA5tRcum1NaoPlcWWGkauDrXHl8DOuyaj7WdlcXn+X;
	25:9S6LE4UDmIfw5ezB4JU3gcMCEbZfMkO2q6bqBBl8XCmjXnvs15QVtXSsECjuqxTdP3FBOZpa+RL4ELWNBeewhrdxGztvTAIbvnQHPVab1Rr2f6C9hn/eqeHojOXqlCmgeapSW7qqQkqCOiZysqUW7AHDXT1cGP1BBHOptxJJ1vNqj93auFy2CA5CFq3uGrED6Hp9ymtwMz1qd+KeLRoRxDEv53oPKPENWtqrTS6pP0s3e1b+9wMT1+dCE69b6mrQpBnkZQaLK/meJ3OdYoez/ZBuwAajqFq/PjLOg5W7aC7ONE/j6Z2BcNnFdqHMlBpTPPeQ/w2xtrRhSlFa8Fnf4Q==;
	31:7/19poCSdBqdH/UF1FzCrgcqr/yoIB024Pwt8pHwE52ctziGshwfCk4UTjvSCC/tzItJLILvPJe3gbKEMYnB/75TI2y5m+/DVQjDb+0BQghB/+MLeDh1lQ+l0Wcqdjq/BKF91wiLkuRATUMKu31FNsMlALAHLcAIHozu103T0uaW3GDTe3ehgualuItrVGgh5A6L5jqWa3pqTW6A+l6hH35p1oCHx9eFQKIjNtDogN0=
X-MS-TrafficTypeDiagnostic: MW2PR0102MB3419:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	20:LAFb5UsuHM7Qo8BT0adqCSFnDlhkgqPDnwhBsKWPZq4C3ymJsBZGMz8aplwno+plP8lUfSUM+1phcc8oW/hddTP4Ue/67JCYWzqZgyvePrtKs9x4OVet8frc5/YoAFvAm6PCUYUZbenHWw57QkaamYthjRX7IkcqfjB/CiVNiTvm6cY8cEJWu1r0rYMS2EsIoHn5PlCrqp9iJkICK0qufTplWh5bloFSkbgY55pqFByOlYxG1fBDTaVXcZgbx2VCopyenLu1sMGdorPiKqn55HvdsG0ryMUzN64J+mwkXxzYEm5ZkgQiIfvUMSr2Z4ACLKEhsLuYFeQ+QkxF4wtE9ZPRVMhO+Z/hSMaXR0A0S4LI/cpee0njiFRDPg83Qw10QsdxojgQVAR1Y6rZCZLcv/S3POLcKl8I83dz9nc7XLVAX/+sKVRGSohMgxtHnYuoVdkgJVq4v/pnb6JR7v+wu+hl2aWCLAlFFeqcW8lKMP4tr/7k6l9rwPtfD1D0ktdP;
	4:ryIRGojWJ0V7IopR5rT/II3oUr8SEmbbMooCJidD00csFkYODXIfB4LhcVlhoWi5QTZu1gon1szcHSdGM5RWsU/ZjrZoOZKbPIFH5n7wlkZNxcDaqfnAPMHe3sdar121sa4QgSa3Rddfj4OcvGjeFka+q0SO5ZVCL5IoXBHN2xA2ttNBjL/38+AMQpuOL9HPJlGNw2ebxpnbi/Mf/SBB1feqheYXgmhIgnyPd6NM8/cowa3J8sKXRQfGUjjwHQQ3MUXezK70E50H9QnW9potnA==
X-Microsoft-Antispam-PRVS: <MW2PR0102MB3419CE1791BAC547B6478ED1AB6C0@MW2PR0102MB3419.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3231254)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123564045)(20161123562045)(20161123560045)(6072148)(201708071742011)(7699016);
	SRVR:MW2PR0102MB3419; BCL:0; PCL:0; RULEID:;
	SRVR:MW2PR0102MB3419; 
X-Forefront-PRVS: 0688BF9B46
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39850400004)(396003)(39380400002)(366004)(376002)(346002)(199004)(189003)(59450400001)(11346002)(1076002)(486006)(36756003)(16526019)(6916009)(186003)(47776003)(2616005)(956004)(50226002)(3846002)(476003)(6116002)(7696005)(305945005)(86362001)(4326008)(39060400002)(386003)(53936002)(52116002)(51416003)(478600001)(7736002)(26005)(6666003)(107886003)(76176011)(6486002)(48376002)(68736007)(81166006)(54906003)(81156014)(50466002)(8936002)(25786009)(16586007)(8676002)(66066001)(316002)(5660300001)(2906002)(446003)(106356001)(105586002)(97736004)(2351001)(2361001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MW2PR0102MB3419;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MW2PR0102MB3419;
	23:mGQe41OGVVQE9pniNUKUJxNOBJQFhJhP6ZZtGcX?=
	=?us-ascii?Q?F5ZO7lY4exG7Kchu1EYO8mayIGkfAAhGN1Zp68Ji41kUzEtwpkaG9lPYY947?=
	=?us-ascii?Q?aQMwEHEvmTTcxpcGfqydmzByNvMo0Yg0GLCWLTHmmr5A3GQ1KyppuU/mPAq2?=
	=?us-ascii?Q?gLuGGqTt6farett132n9eQZqKcyyCwn3AkFYj/m306pxxdLBA4Xv75osrtaj?=
	=?us-ascii?Q?Eb7G8ikZNZ54iPCEmx0wwwN7NuWX+A1d7Zd8cOf8hRYuFerAZ/jqezCtLQ4j?=
	=?us-ascii?Q?NLKM4yTSsKoC/xUdoBuAKlPFrifQgkDyuumoS31/ujTY2OKwDkVK2+jyXPDn?=
	=?us-ascii?Q?51Vlc8EqxSEyEXTbHKc9uzUqEjvk8yC7x19DDK5RAUKwjXJjxifzmY0msM/B?=
	=?us-ascii?Q?uxL1pfesTscjR7WbEzt3yI9e6wOanINAEUdh7gFDHkI1LuTsL6GhYwQRfVDx?=
	=?us-ascii?Q?q6KedU+PTsVT5oYd7VZ3Qx6mwWFmo9lpOMk7k7wgiIH1cvuxkwUoDa/3IFz8?=
	=?us-ascii?Q?Bz5Wgy6Gq9/xCt0cERwKEGBrueWEMts/pMBcJbDK27TOderCCq27UCHrbRG8?=
	=?us-ascii?Q?OkCE7sNPjSDZuCVOnRN/o53Dn6s9Hm/AkTsfV+pGE5DtC3Qt74sLTTiLeHwc?=
	=?us-ascii?Q?4rNfTFhz5Hz4CP7hyclRkyMHzhS/4G1EdNO95ODoBZVbaGOVDlUIDcZENQEc?=
	=?us-ascii?Q?38T6DevWihFSJ1Qwwt43d4OIOyEMn2nYr0J2Wlujz36vpYSP5SvnKBHj8IXs?=
	=?us-ascii?Q?9FSi4WsC4RLNiS6iudZmE0xBv41qObK9LLQ3qDbm8O/jd+9gOnyTa8SP0s2Q?=
	=?us-ascii?Q?nkWTyf09Jz2PRzioZdjFUXJMKqJpf4KJ+qR+6nUXWbYtWIkxGEtqqIhU0QQz?=
	=?us-ascii?Q?aq2ELa+nv5ZGYDv1teojG84UCW0d6cYkfkUQW4Fcn9m5xDXhMKz0uHhu64BK?=
	=?us-ascii?Q?QT4nJPgzIgKCsQWqi6DI7leDwsUJHc4f0lzAwWcYWhSujHv8vy+P9TfjCspw?=
	=?us-ascii?Q?Z/+ALphYVHCcJgfeJgIbi32OmNn4m/lMynFHuBN4r146Jh+bEk38htwen85z?=
	=?us-ascii?Q?OVUnJ2blqUghVjuHr8edUF6X59Z2ct469XJCSYmomQI+c+K9oqZbmMFFBtjQ?=
	=?us-ascii?Q?YzQ57XSNIluCIaMA4zKxAplQBMktYOI1e6r8m4HSYiIohkK9hzKPD6qA7yJ4?=
	=?us-ascii?Q?ovYb3OCQggHQY1vGb+9yehTwo52jJmN0mdTjW1IpZfQV/UnGXDJlcxPWz0tX?=
	=?us-ascii?Q?8H6DoUgzodw4kqb++0VSdKlOisbEqWEL/1pczXO9kGivbDQP67kt2RTwWgeN?=
	=?us-ascii?Q?/R76FZXlx//uGBCHCwANiZIs=3D?=
X-Microsoft-Antispam-Message-Info: 0QbumFgjVcDXhTn07gtwFps3Qw8OBW3GYsksJj6xx2ZtJnkTlogPsEQhr9aUblYpNLiFraxLyfvJ+lUS1pC7bLiyt9qL26mZmdF2lbQ+/W8iHGqPY6zPAPHljeVedA937B67WRW9u/3S3UjRH6syRW72wTyWAuyGpRBPCyCwKuM9UJrCY1P2yOoe/jqXlY4T
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	6:ZVT8lWp7OVPxBPr+65MLEjAw7G0bvMLXbnDogEQcMClyKBv4xxqhIEpUctjng74vHoxwrwYxJxjt4/sxk8j7s/SuyokLlfXT2s8d+cR93z410vV/2yLd7UjDMXXW/QSXTaB1EHTLz/SOMSv+EZkgS//uD70FsQYWeE6o0PKCWFFU086b8zGvV2g5f67ee7QELq2iqJV8YT6K9JjEgwCL8XNi5u+bcqQLuQMv17C0Dq+yxZEarQ9ygtHcLlaM18iF2XdQ5TdjLZ7H85SWqL9jbvP2R/XxLs4tZQoLvBUBLOd/7+65609N/+XKnmlnS105+SXOOlZ+nn2VOyuA0gfCkDoU0mzPNx4JV0S4D7yY0VdFvSTDqYCr5A3q1cMjUUH5OjLMAVFJgQCg/gvKdBm+rDNJ7iJSa7gUmVf11I4J5URFYCC4/OkzTx4vmnYS3dEGEpp7kv4fftKm4n265ZhFVQ==;
	5:XDNEMg2cKUT5yvs+pStoXU3rpgezGYaVXEXAf4JAC7gOXifc2xYI2/RafpxUQxO4lSlzs/PCHVY+ZSpAhtwINNyakgAEqAGIjWyv8QngM4aThhnTwFsm9UhedP04gsFci+cMNTguCY3R8GSEXWvXb4Vg5tsp93L+EXl0ODVfa4k=;
	24:HrZ6YqB9zIredS0XZBo9t/FT2OaskJriAIGZFXYfGKSDRV2AjqBlt3y/DaZgCLzDpzpBRy+14B4mZLFam9eMJW0pPaaeHCm7qzouZ3Cnorw=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; MW2PR0102MB3419;
	7:/RboRU76mKNJX4esWQ5Nv76e2LsDBstY98ZlEL7md+6toIhpx9KFC30x5YHHY1mw2vlUfut7GkxI+OkSQAkNXluOdgKsD32YF5oOnziwUeCK25+LoIi5sB+1Wz4I38B8QBkYhENSzsyBwUD/sUBDyuxLPSOW8FNkTXFJukHkwI+R7cFA1byUrD6oBQu4MG2kFwXBMpOGj50dfUzne33nrLpvT9sxSK6sne1IxpU7iKdBQT+lZozQBXR76WGM4/cJ
X-MS-Office365-Filtering-Correlation-Id: 7e5766af-6102-402d-0871-08d5c6831f9e
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2018 23:14:41.5790 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5766af-6102-402d-0871-08d5c6831f9e
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR0102MB3419
Subject: [PATCH 3/7] toolchain-shar-extract: allow non-sh post-relocate
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
X-List-Received-Date: Wed, 30 May 2018 23:29:07 -0000
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


