Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CA8EB5953
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 02:43:33 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10081.1770777813076379190
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 18:43:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=oQeroSVY;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6502e09c5b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61B0URag3642576
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 18:43:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=6GhfTuCuolrqgPfiERgNdf3cC5CiH5tW/6dmQXUnl4A=; b=oQeroSVYeMGG
	WjqxfUSvv3ClZYZvap+webu7eMiRt1lh+XBq19C9Kf2QHF6vsiy1Fc2WgyI4pR+3
	99d4JLCaDoHtHY3FxwJjojZAz7Ier7IXaQ84qu97pnNXODo1ebEBqbeHBQ9B/juR
	eCpKiUwBtdC/FJUdPVh/tlFM02d/wXxnZCihZ5MGq6NzjpbQqpdIM+wlD7TTARat
	284DuhKhVN8gsmdfxIR9bPAr4cn3TJSEn3gODX/bHZY3cCI6h4eLisdcOsNr1fVW
	HQowwZN7Gb/5l0UmF4h2DTlecR5uxCF7HHkLYbXWM10Lu836Kx4VF6MMiSNe612P
	uSL9iF82DQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4c65sj3tgy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 18:43:32 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 10 Feb 2026 18:43:32 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 10 Feb 2026 18:43:31 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] gnupg: 2.5.14 -> 2.5.17
Date: Wed, 11 Feb 2026 10:43:30 +0800
Message-ID: <20260211024330.2705865-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <DGB7V2ANTTCH.34VU08DOUAPYS@smile.fr>
References: <DGB7V2ANTTCH.34VU08DOUAPYS@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UYcEHklIfqKzV-Xy-qGaRjHlGFFCtFI2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDAyMSBTYWx0ZWRfXyG2U4TUrvC7Q
 lFb0oq3akQWjGWotUwYnJ3FnMHWRJI2Ox1rayIOH1Xa2KSFs5lqxsl0pQE6sD5oGbzWMzFvSxKJ
 YrK/FFEBxCkXFFXPHWxeaOG9dg+AmlEwuK5d7RhAGY1KSRt8bv35HY6vrSqjkNA3UIzADBwxULs
 5LvbQA2M/ujJlrbTHCebDh2rc8nrXCdSgPNukWpOhGQ3BAsa2QUOMMa7nNrqDMkOwSERVB/hzwI
 ttx0u5CMpDPjw6hOmKtbOMAqdOA5Zg8FDzvIbBg0ReQVy2OmlkLXhpRQl9HXQxpN2NmW06Mdbl+
 oc6fp2so9gjhKjYVAdLqim2iEKQ5uskYqpKs8TsYqLfo0zttaqUDOAUyv4SvcelmZ+ZPSr7AF/y
 7AsS07Xk+cL5J6sqtmPQrl6Oxt4pcs4cWwlQhhOc/AkerSoyj/0gUP+EJH7+2d7cbEICkkCsJqR
 zBRPF1HQgCfGRZ9xo5A==
X-Proofpoint-GUID: UYcEHklIfqKzV-Xy-qGaRjHlGFFCtFI2
X-Authority-Analysis: v=2.4 cv=Cpyys34D c=1 sm=1 tr=0 ts=698becd4 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=GwUem0DFAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=UKYXxeKHHuMVuqezCc0A:9 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602110021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 02:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230948

Release-info: https://dev.gnupg.org/T7996

Compare commits updates:
$ git clone https://github.com/gpg/gnupg.git
$ git log --oneline gnupg-2.5.14..gnupg-2.5.17
17b514596 (tag: gnupg-2.5.17) Release 2.5.17
f2f89dc82 po: msgmerge
11b7e4139 gpg: Fix possible NULL-deref with overlong signature packets.
93fa34d9a tpm: Fix possible buffer overflow in PKDECRYPT
c3e387427 po: Update Swedish translation
eba28eeaa agent: Add accelerator keys for "Wrong" and "Correct".
2438271ab agent: Fix stack buffer overflow when using gpgsm and KEM
c7770b0a7 gpgsm: Make multiple search patterns work with keyboxd.
71570012e gpg: Remove a dead statement.
0bcd9be9a gpg: New export-option "keep-expired-subkeys"
0e37a6779 doc: Improve the "Programmatic use of GnuPG" section.
5f4ad39b1 doc: Rename an internal function to clarity the purpose.
8d4fc7667 dirmngr: Help detection of bad keyserver configurations.
d97e52cc7 scd:openpgp: register vendor 4d52
916982b8c Post release updates
7d38a23b8 (tag: gnupg-2.5.16) Release 2.5.16
a9da315fb Revert "misc: Validate the value on the use of strtol."
26c422e5b Post release updates
7ee523ac2 (tag: gnupg-2.5.15) Release 2.5.15
947ea3c41 gpg: Deprecate the option --not-dash-escaped.
abe9bddaa gpg: Fix for a recently claimed harmless keyboxd change.
4ec86dca3 po: msgmerge
691fa4ecb po: Update German translation
81bb94975 keyboxd: Fix database schema migration.
267f6db56 doc: Document default symmetric algo as AES-256
5d0ba97c8 Prepare NEWS
1b3bb7dde po: Enable Georgian translation.
6c1d13ac6 gpg: Implement skip function for keyboxd to fix a validation bug.
01eaa386e keybox: Fix the not yet used uid and pk keyblock index return values.
c7472b1b9 po: Update Georgian Translation.
4350fc192 Avoid the function name thread_init.
674aa5424 dirmngr: Add a compatibility flag for use with newer Libksba versions.
32a3e5f83 common:dotlock: Escalate a warning message up to INFO from DEBUG.
aab29b128 kbx:sqlite: Don't call dotlock_release.
d4e40e2a8 common:dotlock: Comment fixes.
68dcfec91 common:dotlock:w32: Minor fixes for Windows.
e4f20ba10 commond:dotlock: Remove support of use with glib.
493276a20 po: Update Portuguese translation
216a695ce agent: Use SHADOW_INFO to silence warnings.
57affc4e9 common,agent,dirmngr,kbx:w32: Synchronous spawning daemon process.
cad79e542 agent,common,dirmngr,tests: Silence warnings of a compiler.
bcd87ea2b misc: Validate the value on the use of strtol.
ce44fde23 Post release updates

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-support/gnupg/{gnupg_2.5.14.bb => gnupg_2.5.17.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/gnupg/{gnupg_2.5.14.bb => gnupg_2.5.17.bb} (97%)

diff --git a/meta/recipes-support/gnupg/gnupg_2.5.14.bb b/meta/recipes-support/gnupg/gnupg_2.5.17.bb
similarity index 97%
rename from meta/recipes-support/gnupg/gnupg_2.5.14.bb
rename to meta/recipes-support/gnupg/gnupg_2.5.17.bb
index e484b03424..fd6588769c 100644
--- a/meta/recipes-support/gnupg/gnupg_2.5.14.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.5.17.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-native = " file://0001-configure.ac-use-a-custom-value-for-
                                 file://relocate.patch"
 SRC_URI:append:class-nativesdk = " file://relocate.patch"
 
-SRC_URI[sha256sum] = "25a622e625a1cc9078b5e3f7adf2bd02b86759170e2fbb8542bca8e907214610"
+SRC_URI[sha256sum] = "2c1fbe20e2958fd8fb53cf37d7c38e84a900edc0d561a1c4af4bc3a10888685d"
 
 EXTRA_OECONF = "--disable-ldap \
 		--disable-ccid-driver \
-- 
2.34.1


