Return-Path: <hannu.lounento@vaisala.com>
X-Greylist: delayed 12835 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 24 May 2018 15:53:00 UTC
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr50059.outbound.protection.outlook.com [40.107.5.59])
	by mail.openembedded.org (Postfix) with ESMTP id C025374A3A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 15:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lTOK3fJpFeHYSW7LHvP+kMeU7BTF5EtIvPoQpXu4Qb8=;
	b=EWe0zZvtnN5FeHvaU0o7QSA3EdA8ei7O+BNbcDQ6jl6XeRMypfDYDWPc/28I+ol0RKYXdlGsCKV3B3mS5oqNeRvbyjU/oqqDQSuLVMlrIDwSYqUKOOhYfTdVwJr28SeWYva/DPQqSEZ9UuXQmu7+do6rP44mQPHbqwqAf3WuLgc=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=hannu.lounento@vaisala.com; 
Received: from hel-eptripper.corp.vaisala.com (193.143.230.131) by
	AM6PR0602MB3496.eurprd06.prod.outlook.com (2603:10a6:209:d::29) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.797.11;
	Thu, 24 May 2018 12:19:04 +0000
From: Hannu Lounento <hannu.lounento@vaisala.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2018 12:18:37 +0000
Message-Id: <20180524121837.25573-1-hannu.lounento@vaisala.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [193.143.230.131]
X-ClientProxiedBy: AM5PR04CA0007.eurprd04.prod.outlook.com
	(2603:10a6:206:1::20) To AM6PR0602MB3496.eurprd06.prod.outlook.com
	(2603:10a6:209:d::29)
X-MS-PublicTrafficType: Email
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(4534165)(4627221)(201703031133081)(201702281549075)(2017052603328)(7153060)(7193020);
	SRVR:AM6PR0602MB3496; 
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0602MB3496;
	3:WboFhAjns9X1pZJH2xfW+iDPpNqw2bd+phVjW2pc8DZNG5yaGtSEULk6HQ5wO4F7F510QhFjoOh7HDYM55J7kNwPpLdq02Y2mztSeb9Xcqr0zOPf28rrAtbWICvnB4W6Y6dMYkxZEuHxTTfjEDcxuEAlXzjefhUw8L0uAchDZRRSZf0813Q4IwvQ3afV6C21VqLoqVY3hVv+cLQ1D8tSei9Gez9nyOclVUgbLMm3oHLJ9iukMLiiUkWLS0B0LY5l;
	25:PjqA4QXbnbZqfziBO23qWOdN7C0yQ6I8nL2x8f6o6haOM7tK6jHCCRobe2zOInVgWh/SLGgn22qmRIvnxq+4mnq1DykeTgImeQfkq9miX7YXxEOY2h/67f+pb1BdPby6TQyCqWTJodIU7zmhT5uxse/yxDF/5I4zs4c3914ebN5nf9qf+JwKKh5sXfpoVczmvTu8I5ZYPDfWrdAbg4f3WCL+Yux992yHDy0/wH3/57V8OO1Dfp42l7iL1qe9ZmVMzSm7P8c8kzcrS+lZEvP3rtx3D6kkbu/6geDzNAn2ypuEhsOQdxeIuygDX1cer7QL+edxScqtlGt1CqjR/9AFjg==;
	31:ZcJBrw/UQX+l9MNvGmS6Zg3YRPdJla6ul/4YpPF1DZkpJ0XQbXBxFp80sH+HRjrwMy04UrxYUIUsL9evClkwQk4wPPsOWTpuc4XyF6t2qBpWGNAcCRatgHNMvUPzLukIfHW5twwzaGLIBeZ4iylMeuSmDwIPyMytpYoUyDhXOMVcE5fGDccFbCnvDy6pwg6L7qOC8ws+wln/wrvOCdJfmb4U7UyftQfLXl3a4nFCm/Q=
X-MS-TrafficTypeDiagnostic: AM6PR0602MB3496:
X-Tenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0602MB3496;
	20:qf+ypJyG7RgZkyYfczTHlO6aGPg9Dde8JzhB2GC/FWg+FKm7Jj1yqr/v+S/hdpkkbhQDJ3iDgWuPJiFTfwL/S2ebrrx1U1+q6o2CeTxb21LOTe090juJHy+Rv7tQWPPWbuRgyj7cM4LvZlqziO5LwWns6CFkct49UpkCP69N7J0=;
	4:wS/adnms5zoLVf5DKHXpf3Coe892zDvdC5CoPD69gWWqm3riA7gLXRByrLlyOWfTCHD6/AGn31DoEHzleNMIGMa+l0eGKDQRwhtSpd4+Yg1YDQ06f0RHLta5gq7W7/1WYcgLK6Gohf9lCx/0flNJCcme6CF1C7k6Nya2EUFbfOa3aiDi7fhyXX2QMC2/8zUOipNk4mn40N+fNzVte52F7HAWoWtAIIbg18OU4xQOn9Krz9F1Yh96V/KxXlVpbI1eJm+Rt28KAAThc/K62UkIDw==
X-Microsoft-Antispam-PRVS: <AM6PR0602MB34961D8CF8070993187997058E6A0@AM6PR0602MB3496.eurprd06.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-MS-Exchange-SenderADCheck: 1
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(3002001)(10201501046)(3231254)(944501410)(52105095)(93006095)(93001095)(149027)(150027)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:AM6PR0602MB3496; BCL:0; PCL:0; RULEID:;
	SRVR:AM6PR0602MB3496; 
X-Forefront-PRVS: 0682FC00E8
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(39380400002)(366004)(396003)(376002)(346002)(39850400004)(189003)(199004)(1857600001)(5660300001)(50466002)(86362001)(575784001)(16526019)(476003)(2906002)(6916009)(478600001)(15650500001)(97736004)(68736007)(3846002)(6116002)(52116002)(4326008)(66066001)(7696005)(36756003)(81166006)(48376002)(386003)(81156014)(59450400001)(47776003)(186003)(8936002)(8676002)(26005)(105586002)(6486002)(316002)(25786009)(1076002)(2361001)(107886003)(2616005)(16586007)(956004)(6666003)(305945005)(51416003)(2351001)(44832011)(53936002)(486006)(50226002)(7736002)(106356001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR0602MB3496;
	H:hel-eptripper.corp.vaisala.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
Received-SPF: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM6PR0602MB3496;
	23:CNoNxaPUZ4ErCT9WdilvNazO+dcIwnjo4xpapYe?=
	=?us-ascii?Q?77s+apJNBY1O1hNvkNXW9sLndyHa98o3SenoKM7Cp3rSY07slhgkMsEaz22M?=
	=?us-ascii?Q?+gnqjmsLmZRMhAsVGnAdHChr0aHaFRU3FomYpKXKS9k93JwDs3e1m8jVivWg?=
	=?us-ascii?Q?hEOnV7VlaMnqMFm9xEMoXAgzbU34vRsiqZHKI/Sh3Ze1aujCNAXJ6sgDHj+B?=
	=?us-ascii?Q?jjjWgstHfh7/TzlebweTMvTZ0aDDtLB8QSsoSaBomMm18wNOS0FKR4YhaNkJ?=
	=?us-ascii?Q?16YEb6FdMUbroWDe8FdoXbb09tcqPEWqNBB2cLYMpMEUD8MuQpmj3/5dyPHD?=
	=?us-ascii?Q?UTwmrvo3xY0dAYfkkIYWUTDHv2mc2wZCBl+t8CL9+OUlIYM8xkcWeRBXgt+A?=
	=?us-ascii?Q?MafBJOlNQlNyCFVD52KJN8m0aHOqQvpkXYzCINGXU56gwSyIrnKnnvPrhQAa?=
	=?us-ascii?Q?Z7/9cPysoJWxcKaYhCxD+dx3wCwKc8nMk2JNDIse9dxUNaQHbCbgsZnAZBH2?=
	=?us-ascii?Q?2kL3UPFwcNPFgCFiEnbaPww14avtvufDBcKU47X6kPow4jbpHQx9wbAN7jlE?=
	=?us-ascii?Q?393cSFXuyZ0/EcqY+WH3wIxSwJeHeiuhYrxG32lUMoQ/hSngXnjqdSjYXkqN?=
	=?us-ascii?Q?7xeCrvd6tSrNK3xt8kMtBUeMVmLjhLLgqwAdOiHD5vH5gTzE0yNfTN2Wjhim?=
	=?us-ascii?Q?mKd5Ph2dUj3dPDmsInDXqJ1wPVUHZXGRqhNaZJd6GEls1KHGUM3QxjQNBbIA?=
	=?us-ascii?Q?3zSjzO+usCd3vSRhozi4MMfU9tCuHUYr9+N2HSF3FwrJsBSZkT6/X+okaaNo?=
	=?us-ascii?Q?eqc4hujgXmvra2XRmmfHi7VwvlDjzdRSzkIxaT2erpCYRVI8u4YpNO5V1C+C?=
	=?us-ascii?Q?FnHbmb0e36SY4ArJE92w6efACs4csJxCZYrowWPClbh7crA48TO7qHDfxI9g?=
	=?us-ascii?Q?VDJYqIurVhN3UeljH5dCQBDYmt0uHg9HDGgdr34u5OCkGJElc0lHlpGQ6whl?=
	=?us-ascii?Q?Mhij361eab3IqbxRVy5ygKOE8wXzedL4M/1dSTYLsnZp+OL+bWSZqpaycxkE?=
	=?us-ascii?Q?h1bo2Om9vfcRwUp9BWXe688u1L7gfjP+o4XZisQUj0K3dlU1nwljPPj093qR?=
	=?us-ascii?Q?MO7mBdn9UVru2PtD3HF6i69/21qNm69CIm1dXm9M32yvHB2FVSqWfSj79y8k?=
	=?us-ascii?Q?IScdDYQsMeHFfaUFWrIRaRVFnvZ7dnnAnTIJsv03xG/KiVAjVHZlDZL9kDoy?=
	=?us-ascii?Q?dIxjHCDu52IwvLGJKJCyBV1xDAKStqvfVgOlJI0avpu6onlbtOc7vVetkPYF?=
	=?us-ascii?Q?BQ3WK3fG1m6/MXuPEdPKC1sM=3D?=
X-Microsoft-Antispam-Message-Info: Y4FiDjggXxou+gtmYxnEG3hSZCuAt5POnskiXXPBckNJcGiKXQxmz+Il4B8QBwKMlqivHjRg7jnSv1sLEQ32gIfsgLAQh4tKWd++K/CCXW2iuenQSjVYLu+PSHiT2hDIY4QHvMuNuU7yOP+4VP9uX63y0XDVWjoUMg4MjsT5mgc4hbHEn8g/FfABgl73pr44
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0602MB3496;
	6:FJK+jqPQl/BrJQGQT+WrAOSoxJeyUFLbMNPFPgyQeopTi63gDHemMWpBzrdPzWBRhbNkz3xeZv5VG/E9P1AAiJU3KwkLDv46T/zAevbw/+DCSsuaMTCRiznNItPAC1C5sgG55aV9CTG5h7xQH/d/43wJtA3AIppVXWWG1saUP0puSiRFxH9Qj89KpmZDzCWDuQE8JH8l87Tm8/cWpcyaijcqZSdHKD04ZeuCCOY1klW0mRBh1BDkNcf4XY6hCeW9mil3Wuv4TJsjPNCn9ELjj0z8MgWC07w/nY1sQ326Qu18k1IIUargWb7fc5KiJFG5Av/Cr0cMxK7bt5SO/okimHE4CzVOP2DXLQD+9I9aLkpPlDYWPrKlT4qOT5D7F5VNIleSN2vAceqr6IZE4Brr5bPsq4IXK6pCToGV/wT0jM3TIZGu4VvG/RS264RWgjD0QYNtHjLzzuLVgnZMlOKFwA==;
	5:LItVR79lgtzWVWwNCjCOh8HrCuJ8rLP0I26pfEgsqTy+TBd37xiZ9IhKNV7OxgvsQjiborf8vFQKLQLeppG4Xymg7pAXRmEbqd77b+uLGyVe/cWsoieTjSmVl22p58PaJqmSpN+p0+a0hpuDMGFGy6nOsSMW5Vl8pWROJBhM94I=;
	24:qb1sQRQ62Tzh2vENBMIEI5uxBq7E6HYxL37F8JS0pkiGvRoWh0hMy3Qs3ZmleYK5GSMuke8f1gH2MT2uW7V2O5111opKvmfbmob7N6Pn7vg=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; AM6PR0602MB3496;
	7:tUSUPq4JzLAbOCl29u04sm58j4U0bFOLF4fkyivVYDs/TM42lJ9Un576R82zemQWpD3VLkltWTR0T2vAeeTCVXmsrj0P9b4RhTGUBA7kcHsnY/Sauc+UseipH9foi8U5SAi1n0nOarmyRISMjW8cQGgEJBVbAB48NHTxXt1f6u+jbZZ/BJ2grbxuNpRUMW8OkAAgWq9zy0caqgHq2c+paQiLx5u2cPpt9paDtTAtpqnhbZZvB3o5Z0hq1zefq6cX
X-MS-Office365-Filtering-Correlation-Id: 9af190c0-cbd4-40b4-a478-08d5c1708a39
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2018 12:19:04.1074 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af190c0-cbd4-40b4-a478-08d5c1708a39
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0602MB3496
Subject: [PATCH] i2c-tools: use update-alternatives
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
X-List-Received-Date: Thu, 24 May 2018 15:53:01 -0000
Content-Type: text/plain

i2cget, i2cset, i2cdump and i2cdetect may also be provided by Busybox
when CONFIG_I2CGET, CONFIG_I2CSET, CONFIG_I2CDUMP and CONFIG_I2CDETECT
are enabled respectively.

Busybox has a priority of 50.

Prior to the patch building core-image-minimal with

    IMAGE_INSTALL_append = " busybox"
    IMAGE_INSTALL_append = " i2c-tools"

in local.conf produced the warnings

    WARNING: core-image-minimal-1.0-r0 do_rootfs: busybox.postinst returned 1, marking as unpacked only, configuration required on target.
    WARNING: core-image-minimal-1.0-r0 do_rootfs: Intentionally failing postinstall scriptlets of ['busybox'] to defer them to first boot is deprecated. Please place them into pkg_postinst_ontarget_${PN} ().
    If deferring to first boot wasn't the intent, then scriptlet failure may mean an issue in the recipe, or a regression elsewhere.
    Details of the failure are in /path/to/poky/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/temp/log.do_rootfs.
    WARNING: core-image-minimal-1.0-r0 do_rootfs: [log_check] core-image-minimal: found 1 warning message in the logfile:
    [log_check] WARNING: Intentionally failing postinstall scriptlets of ['busybox'] to defer them to first boot is deprecated. Please place them into pkg_postinst_ontarget_${PN} ().

where log.do_rootfs contained

    update-alternatives: Error: not linking /path/to/poky/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs/usr/sbin/i2cget to /bin/busybox.nosuid since /path/to/poky/build/tmp-glibc/work/qemux86-oe-linux/core-image-minimal/1.0-r0/rootfs/usr/sbin/i2cget exists and is not a link

and similarly for i2cset, i2cdump and i2cdetect when a workspace layer
created by devtool contained

    cat workspace/appends/busybox_%.bbappend
    FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

    SRC_URI_append = " file://i2c.cfg"

and

    cat workspace/appends/busybox/i2c.cfg
    CONFIG_I2CGET=y
    CONFIG_I2CSET=y
    CONFIG_I2CDETECT=y
    CONFIG_I2CDUMP=y

Signed-off-by: Hannu Lounento <hannu.lounento@vaisala.com>
---
 meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb b/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
index 01ac47f611..fe3247d82e 100644
--- a/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
+++ b/meta/recipes-devtools/i2c-tools/i2c-tools_4.0.bb
@@ -14,6 +14,8 @@ SRC_URI = "${KERNELORG_MIRROR}/software/utils/i2c-tools/${BP}.tar.gz \
 SRC_URI[md5sum] = "d92a288d70f306d3895e3a7e9c14c9aa"
 SRC_URI[sha256sum] = "5b60daf6f011de0acb61de57dba62f2054bb39f19961d67e0c91610f071ca403"
 
+inherit update-alternatives
+
 EXTRA_OEMAKE = "bindir=${bindir} sbindir=${sbindir} \
                 incdir=${includedir} libdir=${libdir} \
                 mandir=${mandir} \
@@ -34,3 +36,10 @@ RDEPENDS_${PN}-misc = "${PN} perl perl-module-posix \
                        perl-module-constant perl-module-file-basename \
                        perl-module-fcntl perl-module-strict perl-module-vars \
                       "
+
+ALTERNATIVE_PRIORITY = "100"
+ALTERNATIVE_${PN} = "i2cdetect i2cdump i2cget i2cset"
+ALTERNATIVE_LINK_NAME[i2cdetect] = "${sbindir}/i2cdetect"
+ALTERNATIVE_LINK_NAME[i2cdump] = "${sbindir}/i2cdump"
+ALTERNATIVE_LINK_NAME[i2cget] = "${sbindir}/i2cget"
+ALTERNATIVE_LINK_NAME[i2cset] = "${sbindir}/i2cset"
-- 
2.11.0


