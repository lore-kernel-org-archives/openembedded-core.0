Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE36CFD313
	for <webhook@archiver.kernel.org>; Mon, 24 Nov 2025 13:55:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17160.1763992528443442785
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Nov 2025 05:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PVwoPLbm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3423f9c1af=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOCc0ki1167679;
	Mon, 24 Nov 2025 05:55:15 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=k2JBD/d6E
	JdOunRCDwbyY9Fwcez11o4OXKqbtrzc/Ak=; b=PVwoPLbmz5SYlTQ4E15FQbIY4
	pAW8ioHzFwpeJSO1+IpR7Gw7rzdUT2nYOiDn8/Qh2BnZxgEfr+rZsgTtIMUfpx/4
	pNZptlVN6oYR97dESIgogBE7j34sRzqNR+KEKVXujaQK3EXpTHUGjOeXzNqCzGYg
	O35GdpU5URXvtBv+G7sQdeb+NispiDj9tlXNgQ7wig1cMWaTjDOBMf2gDxpoxEbA
	dXBuF4hDsBwiPwE8GthOXGNDjrKvHT8ysaI0b/cXXMw/4LuhzcbuO7btYxd/Ykrs
	BBYIXwMcGTiYJ9zQVW+9INdMDPMhVwPi1MZnfQNBTMaEk5Rh4EftnxujG1kPg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4akdjj9kv2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 24 Nov 2025 05:55:15 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 24 Nov 2025 05:55:15 -0800
Received: from pek-lpg-core4.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 24 Nov 2025 05:55:14 -0800
From: <kai.kang@windriver.com>
To: <steve@sakoman.com>
CC: <kamel.bouhara@bootlin.com>, <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] Revert "spdx: Update for bitbake changes"
Date: Mon, 24 Nov 2025 21:55:06 +0800
Message-ID: <20251124135506.622336-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEyMSBTYWx0ZWRfXx4Bo3SfK4tfD
 FWq7EtI1mYV51BfyY1l8tJJil9VuQwdvXhgzramSPNZX1P85EvI7+nvzUjAmbUJMo3IvDVZ8sQm
 u5I9zD6Pw9aGa0f0Q7H0FIr2Itl0uv2yB8mPqKNsETxS7Mn6VkhRKuKGdM0Cg8vbAHSd9KHLtqr
 jhlKRpKhLVE2lqmPO2RET3oT6wox2xRbMZK/1u40TMVibxBIkq6TThqRceiN63PYsS2OM2EKhxt
 c5ob+KBirQBbxUz/Y15h5hZxFQFJpnUsMp3v4GsCpnJggwpi3xwz3dTPMm7Nqt4H9+c4J4MR7Hi
 iZDQkUP7JQlClRnf+oqWKBXbwk2//Bx4kH+gjdQD0QbNKnJS0RqpIeKknsJfCzBnujYZtew+fa1
 VFJz/+tYca+gBnKTi1ASmwMLOXBJMg==
X-Proofpoint-ORIG-GUID: hQgWi8EdM0Bd-s7DIq0iKZlDi2ize8F-
X-Authority-Analysis: v=2.4 cv=Wq8m8Nfv c=1 sm=1 tr=0 ts=692463c3 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=fCmAYc0T6vF_H5oM34gA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: hQgWi8EdM0Bd-s7DIq0iKZlDi2ize8F-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_05,2025-11-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1011 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511240121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Nov 2025 13:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226744

From: Kai Kang <kai.kang@windriver.com>

This reverts part of commit 4859cdf97fd9a260036e148e25f0b78eb393df1e.

Modification of meta/classes/create-spdx-2.2.bbclass is not backported,
so no need to consider it.

In the commit, it updates spdx according to bitbake change. But the
bitbake commit

* 2515fbd10 fetch: Drop multiple branch/revision support for single git urls

doesn't backport for scarthgap.

So revert the other parts of the commit 4859cdf97fd9a260036e148e25f0b.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
test with

$ bitbake world --runall=create_spdx

 meta/lib/oe/spdx30_tasks.py | 125 ++++++++++++++++++------------------
 meta/lib/oe/spdx_common.py  |   2 +-
 2 files changed, 64 insertions(+), 63 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 6b0aa137c4..9a1e5a0c73 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -356,77 +356,78 @@ def add_download_files(d, objset):
     for download_idx, src_uri in enumerate(urls):
         fd = fetch.ud[src_uri]
 
-        file_name = os.path.basename(fetch.localpath(src_uri))
-        if oe.patch.patch_path(src_uri, fetch, "", expand=False):
-            primary_purpose = oe.spdx30.software_SoftwarePurpose.patch
-        else:
-            primary_purpose = oe.spdx30.software_SoftwarePurpose.source
-
-        if fd.type == "file":
-            if os.path.isdir(fd.localpath):
-                walk_idx = 1
-                for root, dirs, files in os.walk(fd.localpath, onerror=walk_error):
-                    dirs.sort()
-                    files.sort()
-                    for f in files:
-                        f_path = os.path.join(root, f)
-                        if os.path.islink(f_path):
-                            # TODO: SPDX doesn't support symlinks yet
-                            continue
+        for name in fd.names:
+            file_name = os.path.basename(fetch.localpath(src_uri))
+            if oe.patch.patch_path(src_uri, fetch, "", expand=False):
+                primary_purpose = oe.spdx30.software_SoftwarePurpose.patch
+            else:
+                primary_purpose = oe.spdx30.software_SoftwarePurpose.source
+
+            if fd.type == "file":
+                if os.path.isdir(fd.localpath):
+                    walk_idx = 1
+                    for root, dirs, files in os.walk(fd.localpath, onerror=walk_error):
+                        dirs.sort()
+                        files.sort()
+                        for f in files:
+                            f_path = os.path.join(root, f)
+                            if os.path.islink(f_path):
+                                # TODO: SPDX doesn't support symlinks yet
+                                continue
+
+                            file = objset.new_file(
+                                objset.new_spdxid(
+                                    "source", str(download_idx + 1), str(walk_idx)
+                                ),
+                                os.path.join(
+                                    file_name, os.path.relpath(f_path, fd.localpath)
+                                ),
+                                f_path,
+                                purposes=[primary_purpose],
+                            )
 
-                        file = objset.new_file(
-                            objset.new_spdxid(
-                                "source", str(download_idx + 1), str(walk_idx)
-                            ),
-                            os.path.join(
-                                file_name, os.path.relpath(f_path, fd.localpath)
-                            ),
-                            f_path,
-                            purposes=[primary_purpose],
-                        )
+                            inputs.add(file)
+                            walk_idx += 1
 
-                        inputs.add(file)
-                        walk_idx += 1
+                else:
+                    file = objset.new_file(
+                        objset.new_spdxid("source", str(download_idx + 1)),
+                        file_name,
+                        fd.localpath,
+                        purposes=[primary_purpose],
+                    )
+                    inputs.add(file)
 
             else:
-                file = objset.new_file(
-                    objset.new_spdxid("source", str(download_idx + 1)),
-                    file_name,
-                    fd.localpath,
-                    purposes=[primary_purpose],
-                )
-                inputs.add(file)
-
-        else:
-            dl = objset.add(
-                oe.spdx30.software_Package(
-                    _id=objset.new_spdxid("source", str(download_idx + 1)),
-                    creationInfo=objset.doc.creationInfo,
-                    name=file_name,
-                    software_primaryPurpose=primary_purpose,
-                    software_downloadLocation=oe.spdx_common.fetch_data_to_uri(
-                        fd, fd.names[0]
-                    ),
+                dl = objset.add(
+                    oe.spdx30.software_Package(
+                        _id=objset.new_spdxid("source", str(download_idx + 1)),
+                        creationInfo=objset.doc.creationInfo,
+                        name=file_name,
+                        software_primaryPurpose=primary_purpose,
+                        software_downloadLocation=oe.spdx_common.fetch_data_to_uri(
+                            fd, name
+                        ),
+                    )
                 )
-            )
 
-            if fd.method.supports_checksum(fd):
-                # TODO Need something better than hard coding this
-                for checksum_id in ["sha256", "sha1"]:
-                    expected_checksum = getattr(
-                        fd, "%s_expected" % checksum_id, None
-                    )
-                    if expected_checksum is None:
-                        continue
+                if fd.method.supports_checksum(fd):
+                    # TODO Need something better than hard coding this
+                    for checksum_id in ["sha256", "sha1"]:
+                        expected_checksum = getattr(
+                            fd, "%s_expected" % checksum_id, None
+                        )
+                        if expected_checksum is None:
+                            continue
 
-                    dl.verifiedUsing.append(
-                        oe.spdx30.Hash(
-                            algorithm=getattr(oe.spdx30.HashAlgorithm, checksum_id),
-                            hashValue=expected_checksum,
+                        dl.verifiedUsing.append(
+                            oe.spdx30.Hash(
+                                algorithm=getattr(oe.spdx30.HashAlgorithm, checksum_id),
+                                hashValue=expected_checksum,
+                            )
                         )
-                    )
 
-            inputs.add(dl)
+                inputs.add(dl)
 
     return inputs
 
diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 4caefc7673..e1b26edaaf 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -239,6 +239,6 @@ def fetch_data_to_uri(fd, name):
     uri = uri + "://" + fd.host + fd.path
 
     if fd.method.supports_srcrev():
-        uri = uri + "@" + fd.revision
+        uri = uri + "@" + fd.revisions[name]
 
     return uri
-- 
2.34.1


