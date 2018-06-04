Return-Path: <mkelly@xevo.com>
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0087.outbound.protection.outlook.com [104.47.34.87])
	by mail.openembedded.org (Postfix) with ESMTP id 32E097546C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 23:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uW+p9MFdMHVex5GWQ6wDTSD9SDuM3DQf1SBzyrJQQzs=;
	b=AN7Fm5xOUwHtccPY521yBmozgd/1Us+Nqj0iKTzNTeMOY5SGvDTxRrpJr+FN4EEzNk/QRPq7Xf/59CCei74cbqP3Yvk1zk4DdjpqfDjyUmpacPfX5GMP8IhrdnoIPDVnM1LtaUU9PKc5vUPe1zr60vKPwwjE+7PD3D87ZD6cWwc=
Received: from columbia.corp.xevo.com (65.122.179.226) by
	DM5PR0102MB3416.prod.exchangelabs.com (2603:10b6:4:a0::17) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.13; Mon, 4 Jun 2018 23:06:33 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Jun 2018 16:05:58 -0700
Message-Id: <20180604230602.8461-3-mkelly@xevo.com>
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
	3:k3f7TODTQjGHTYng8KPSghYSws2hVGnR4oRxRbR+STasj7Cc7rE4BZcy0SCnwdQPJN70+Vyu+hHp009vm8l2P7pwcLz/O2RRgUdypAv3vfmKGWKToGWERzoYLIUHyGRxkw/ltLM+AeOYEzOt5N3Cu9fxMLbGnVDYHZnUlaE7RCweFdzoQ/F6I/21Eztk8/FfM/Iptsnv7z8Rtc35wLtntj7MliiuMcenYZ0FKoqRmibIdR6zoampWRl7GHq4VXPo;
	25:l4U5tKtk9DW8KkWyi0MdT9ecr0qWZn2FhnYigaOEujNSVZSaFEV18JBgR5xoNFeEHBiIj3dOZTnjbK4XfZh8EGkJW4sVQcn38Mx6Wtf2zII8RETIBvGH+h/BOsjMegqcW7hrEz0zmKJQh+WozA49YRhPFBINl84jQpJqOYnR3UF1yxM2vd1mxnJhXDrmnZUDjH4a7zzQjSe6ED15W/7B1VEZuiGN1QLgWBlNrJCPBpAp4O6lt/6tAFEO4Bmm0pLHGon0ZKpwYaZbRlFgv6TGDvap89EYNWxgm2eqlsZ/LSS47kYfihbJ500zfet3a2mwpqWfa5NYtq3EZ3w2Z2FtNg==;
	31:WCVcU7IWPs23M8ZmGRJQMXDp8QzCkBfc4OxMatHbo3FcwjZ/Ld4aLNjJPQ44azYfkrW15a3m6fUp19efVVc2l7z5FF1A4wp8DpU74xAhvd1tDqsV0izN2D3QplxM5so+ck0qJZmGOMEwIB68oims4dvj+8R5sVXNjRaXH789vKCt6Wj8lNj1Oq+PUvrez5/d6cjwHeJJ+lkBk+ZWSIYOSJCi2JUjNxYwCJEn19/1c1c=
X-MS-TrafficTypeDiagnostic: DM5PR0102MB3416:
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=mkelly@xevo.com; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	20:AwyajxjQnImkSK8vnJBKc253Mow2eGn+/4iPg+3gYmDRIubEYW0rZ2xxTIEg+X52261cpnnPlJZ4cxXBUsvs9u16cy85Cv9jyAidSnOCDzaBNeScseODTz+FbJYCwkfAkstIW+Nr2nFzdeIlThJLG3iHbKqtFF6JeWa4XpIPBHzFSf/vkDhMztwqX/0rRC9Nl8CGyVPMfjYea2KaSTeTxdT6a7K1mALjcsbcduj5p3gwIPFJdQfPQcLiXrxzexppcVaBucCVy8FO3ZoelKY3zi0qcTIhHInfCbY1FEJRwo9LpcQZKkPuY1VN/XXgB+8yO3rUsGfIvQtxSot697d4HFFRFbYLfZ6Ss4GG8cUyM1Uesf9crCSygSI14eiblRnT2S+KClov0RvjdqiH1fewkJSb/i98xkIEnnYVEWaL/YrmYPF+tT0bSUvOgMGV+zntlPQs4obs7YCo/zEwyJFV/gLnOjWv/yWfxtkvObX7BgBMkIm5jUQGowvrl9Mv68p0;
	4:UNw4WLodPeO801lQpEixbqsU28CGAPev++CRinxH1uJcP+2ywjuqzay3d0L2QtVMcStM/vkjnkBWwLoW8mYvXhLu0G/0IJAg8lGbVjMiTKlIzqIKJICQgEVMVnm6wjFjTm8RifhHMvD4BmgClRS8us3Ir8TH/7I2Hd9194in9pY/skD8jHBLHrO7BmtxdoMn0Z2a+5VrMZF/vP9pZDI5pPF65fB576Jc1z6vZ3uyjqgMpSxfFck3Q6yL6wJfngcM7nkVoclOskJGcw+r+kEj2w==
X-Microsoft-Antispam-PRVS: <DM5PR0102MB3416F6E1FA2DF89722EAF054AB670@DM5PR0102MB3416.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(3002001)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(20161123558120)(20161123560045)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR0102MB3416; BCL:0; PCL:0; RULEID:;
	SRVR:DM5PR0102MB3416; 
X-Forefront-PRVS: 069373DFB6
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(366004)(39380400002)(376002)(39850400004)(346002)(396003)(189003)(199004)(39060400002)(81166006)(81156014)(4326008)(54906003)(97736004)(446003)(8936002)(5660300001)(2361001)(11346002)(53936002)(50226002)(2616005)(50466002)(16586007)(6486002)(2351001)(48376002)(476003)(186003)(956004)(486006)(47776003)(316002)(26005)(51416003)(76176011)(386003)(59450400001)(3846002)(6666003)(7736002)(2906002)(16526019)(36756003)(6916009)(305945005)(68736007)(1076002)(66066001)(106356001)(107886003)(86362001)(8676002)(7696005)(25786009)(52116002)(105586002)(6116002)(478600001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0102MB3416;
	H:columbia.corp.xevo.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: xevo.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM5PR0102MB3416;
	23:5GAWoC4k0F/SlnGi6DKKXuN35R/s1z1yhX4MOdB?=
	=?us-ascii?Q?Zlc6nfXlwNAQI4Xm0+Ww6YHXdGoL6iEX7QkA7e4YO8tDAfwwXEOY+NwbCaGD?=
	=?us-ascii?Q?ASo1s5em61buSNDCpPtLGPmkew8vAVWuLMgypHKisFQtFL5+YFG6dd/M5DBm?=
	=?us-ascii?Q?c4xb1GAGWxPOSlRX8ghRZAI2Wd5n2s7vaxH7hP5aiO0r5h8rwplLcsPenrdj?=
	=?us-ascii?Q?c5RKMHXEJy4JzdSngJCUcpln4S9o3h3SFVmJJi6Im11zQETF17kQA6DmPfLr?=
	=?us-ascii?Q?K14I3gXBKXzThZOtK4X1d8NwaS1PXnkHbHI3yRG9TuLdeIGzbsOGVahmk6oL?=
	=?us-ascii?Q?dST8RxNudJ0fM6PqDsQo80SH2ZtxCnMrcBQ1owQkhItrZlSt4dedgwG1sh/z?=
	=?us-ascii?Q?EntiQrBJaUKDaeLd6X++j6dIF7hrlA+PlKxQxjYVkVdyLRNpEA5gTAO/LtZE?=
	=?us-ascii?Q?T7hH2RMiZQGG9UQSH7bXMxjxHSjl72MURsO14KFEDbcg27rRftneQfc9CSEU?=
	=?us-ascii?Q?q0dWXysCs0p4frHzufoVXnxLZhj/rYIboCgCb+Hy3IWynNlGt3WPoytjiXhV?=
	=?us-ascii?Q?xqLC7j4Vs5UTiUTeyfruBMXETcMNudJzxxlsxZSq6waw5ifashG6Iur0cgWo?=
	=?us-ascii?Q?MunAfvNHkm6VZrTOaNP0lfi00yEe8H8kuhsaTLi4cFBsKYpLj19rV0qSpxyZ?=
	=?us-ascii?Q?cI1xi4D2mTXqB5i0KG5C6C9Edohlai+ifZHrN/+bY2GygzPLR/psx4D8+w/h?=
	=?us-ascii?Q?sFeulXhI55MqYKRO/2t2N6RHMSnMOSoCb6zXq/Ekpaz5VLMbQaJLkB/GPdJ0?=
	=?us-ascii?Q?ocGik2pRIDXGaubdfLvDsw/+Vf6q1OfoJi990E8yjF5Wtkq2x0828Fep9EZ8?=
	=?us-ascii?Q?JWitzcBtuQw43KTpLVBDxVpmLbAzixkkzsJbr9O5GOA00RXh6LZki7PNvl+Q?=
	=?us-ascii?Q?xyzH2D7wuiMBAp6BSRSou+4bejbILSNcP7MjLXaMVxL/F+UeNs9j2ChtsQcv?=
	=?us-ascii?Q?WZJMa5NfPBNzEa3r2ZsKNkFG3dlUjCADMFqvla9vxO+L0/SfIfaNWnji5sVG?=
	=?us-ascii?Q?fpBHrwpyOPc5l8i55rOL5Zn2gU2v3HtCYrqJnonKhVu272LC7ahUuna8i1+O?=
	=?us-ascii?Q?Pz3UZ6E5ruTS6MoNM+X2AopFJ9046AgXLMCTRTBveuFQYXOXjCtVaiW30BDn?=
	=?us-ascii?Q?G/TE8RMH2xC15bUX6B5p1jWQ74uC3HhWEYjydpWsMrFcf9Lmpxjf97e2rAkC?=
	=?us-ascii?Q?jbvPHe4iJURNtShsjxMj17S4AotMQpnkBnoPKbyBNaeo+pdybelEZ8rPKzG/?=
	=?us-ascii?Q?D2lwovf1l5LplIC65ZwWPa70=3D?=
X-Microsoft-Antispam-Message-Info: lj6bJHrCJBc4LhyCgyHSxvegqC170E4Xn27bK33i5xitgHRCinCQmwNK/ywsmth2jjgKQAQusM6XRkKDaqcLbg2wtNC+zmStiU5HfxjOS3+hhWr7oQrvJmSjYMB53Vf8BQjjOdthhIdFHv7o0OLDYmgr9wL7KpszeTPE+MrAvKW6Qks7m1p+IqUw42ocA09G
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	6:Acg/bSQGbKUgdI3bL5E/sp/WNkQiDvnCFCFj5Lfy8pdbJnjD0JjVSiiwWBzq1hCgvoLWtrwzepeeR4kbX5Ds7amzyvHo2FLeMphCILidTK4aIe56ENmrPibt+YtM0smjQ+SXkqZKLeSki0+cBoPaOV6MTZ4hnRCIC+0eKMQTi7iFlPnoF31KNViPOstzBmZJh2qJkV4s6z7SdJFD/n3E5V0WLyCW+uMGdeVu0zFtu29SKRnnW4XXgODVvJWkncqXh9MqqwWjvh9X3AKuyOfYcxyei+iqhMCw+SVYszLPA0jpC/f3D4rKN3V/KnmSW2H0yVXDE+qydcwqa5DmfKfBRVg7euGit1482qc1xqPzwFgxyCrNvjVyldwSBrrj0OKKSOXfAaTUU/5/IHvaRZoguDH7TCzumitXtiGQcOg7GBxTSdieAiyx9ddNarVND0QN8aqLRtK5B/yGg/OTwAyLpA==;
	5:b5PLAdv4OBDZdLmKDn8HHa3sCHvOpoG7cLEP+8U1jsmOiEpUPEN4pp8v0rNQk3qoDCeIb3ym5LdqwfDWKxlcBIOqwq6qTABWkE/f7RYs/ub43NJ19vicXbZL2+oKwOflktI7c+C9iG8tNBTV8VtlPtR2u7MoeY/ycCY5+mK3u2c=;
	24:C9wzYWFLh+1YUIsuicg4tlD92w2I9TGRND0HLEtdBL6129sbiWncCmfo4xK0A59orzD323zuToe41Ja4WyEG4YW9wVy3wznvue6PdpkpGXs=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0102MB3416;
	7:sAslaLw9bEZ1r6/kpNMWUL8HE8oLn+FMKpFGMGS3rRW4AIGI7YxTcqNvpIdzYqbXnKk+dYyngB9mLc0p3kv5A7HavptrAzpnxhgV4dyfKvzeJWSLCAxc/4uGxCybSfrP5jh44LAlHGlSdmDnx3dcOrpOM37WvoOWztYpmJ0c3bFS7/WUKJbEEQRMkFuCtOuPT7Ev07hc9Yle/xoLXp4qXgTPGnSXdWNvYrz/dfFzMlA0a3wgsW6jm+fqqGXeqG0Q
X-MS-Office365-Filtering-Correlation-Id: 95029a9a-928a-489f-28cb-08d5ca6fd0ae
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2018 23:06:33.1486 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95029a9a-928a-489f-28cb-08d5ca6fd0ae
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e0a7ca1f-2458-4cd6-a7c7-d733c07495ab
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0102MB3416
Subject: [PATCH v3 2/6] toolchain-scripts: allow non-sh post-relocate
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

Currently, we look only for scripts matching *.sh, which means we can't
write post-relocate scripts in other languages.

Expand this to allow any type of script.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
v3:
- Test for executability prior to running each script.

 meta/classes/toolchain-scripts.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index a72436167c..da8a57f24b 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -124,7 +124,10 @@ toolchain_create_post_relocate_script() {
 
 	cat >> $script <<EOF
 if [ -d "${SDKPATHNATIVE}/post-relocate-setup.d/" ]; then
-    for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*.sh; do
+    for s in ${SDKPATHNATIVE}/post-relocate-setup.d/*; do
+        if [ ! -x \$s ]; then
+            continue
+        fi
         \$s "\$1"
     done
     rm -rf "${SDKPATHNATIVE}/post-relocate-setup.d"
-- 
2.11.0


