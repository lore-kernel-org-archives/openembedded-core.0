Return-Path: <manojsingh.saun@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66BF2C43219
	for <webhook@archiver.kernel.org>; Mon, 21 Nov 2022 13:29:37 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.38242.1669037374934054982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 05:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ea9IjdSX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=832497de3b=manojsingh.saun@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ALDK3cg003594
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 13:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=gxQlZ+WLDHpFNwv6pZD8NxM9mgLR3uGohPkbhwoVT3s=;
 b=ea9IjdSX8R08y4eik1/MPjbN15EmSWD2bv9HAHAwU5X4QVJe0xCAsxqJrmJMp/FUaoq1
 fejRTovELZHZ27oJunKrd+Acs4RwnoSkal+GBNgnYEgj/82toIPA/vtG8XswPGXE9MGP
 RVHYCbyGSo0NqwlRAw7KNYFBHVMM12x7DAJ92lIF0dOGFheULDXEa6B7aoqFhsuLvWDE
 8y8WoelODGvLpWjK6bX858NWmwS+ZrENCJ2nY6sTLXLAmsKkVvj2URLavnYzp4/C62qB
 y/2i9LwPOZHrfYLcL7aEEgOPDsk1AnILCzaGRJKu4byzwwl6rVE2mrrnCD5L/W7T9kK8 9g== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3kxp48hkch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 13:29:33 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 21 Nov 2022 05:29:32 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2308.27 via Frontend Transport; Mon, 21 Nov 2022 05:29:31 -0800
From: Manoj Saun <manojsingh.saun@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <narpat.mali@windriver.com>, Manoj Saun <manojsingh.saun@windriver.com>
Subject: [meta-openembedded][PATCH 1/1] Signed-off-by: Manoj Saun <manojsingh.saun@windriver.com>
Date: Mon, 21 Nov 2022 13:29:26 +0000
Message-ID: <20221121132926.1961608-1-manojsingh.saun@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: KA3KRj_nrziteJouRvl8gZRzPDxpndYX
X-Proofpoint-ORIG-GUID: KA3KRj_nrziteJouRvl8gZRzPDxpndYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-21_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211210104
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Nov 2022 13:29:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173653

-> nginx: fix CVE-2022-41741

-> nginx: disabled duplicate atoms.

-> Reference:
-> https://nvd.nist.gov/vuln/detail/CVE-2022-41742

-> Upstream fixes:
-> https://github.com/nginx/nginx/commit/0d23105373e6d8a720b9826079c077b9b4be919d

-> (LOCAL REV: NOT UPSTREAM) -- Not applicable, upstream out of maintenance
---
 .../0001-Mp4-disabled-duplicate-atoms.patch   | 313 ++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
 2 files changed, 314 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/0001-Mp4-disabled-duplicate-atoms.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/0001-Mp4-disabled-duplicate-atoms.patch b/meta-webserver/recipes-httpd/nginx/files/0001-Mp4-disabled-duplicate-atoms.patch
new file mode 100644
index 000000000..0b0753c4c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/0001-Mp4-disabled-duplicate-atoms.patch
@@ -0,0 +1,313 @@
+From 0d23105373e6d8a720b9826079c077b9b4be919d Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Wed, 19 Oct 2022 10:53:17 +0300
+Subject: [PATCH] Mp4: disabled duplicate atoms.
+
+Most atoms should not appear more than once in a container.  Previously,
+this was not enforced by the module, which could result in worker process
+crash, memory corruption and disclosure.
+---
+ src/http/modules/ngx_http_mp4_module.c | 147 +++++++++++++++++++++++++
+ 1 file changed, 147 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx_http_mp4_module.c
+index 5721efbe..75a7315f 100644
+--- a/src/http/modules/ngx_http_mp4_module.c
++++ b/src/http/modules/ngx_http_mp4_module.c
+@@ -1121,6 +1121,12 @@ ngx_http_mp4_read_ftyp_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+         return NGX_ERROR;
+     }
+ 
++    if (mp4->ftyp_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 ftyp atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
+ 
+     ftyp_atom = ngx_palloc(mp4->request->pool, atom_size);
+@@ -1179,6 +1185,12 @@ ngx_http_mp4_read_moov_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+         return NGX_DECLINED;
+     }
+ 
++    if (mp4->moov_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 moov atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     conf = ngx_http_get_module_loc_conf(mp4->request, ngx_http_mp4_module);
+ 
+     if (atom_data_size > mp4->buffer_size) {
+@@ -1246,6 +1258,12 @@ ngx_http_mp4_read_mdat_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mdat atom");
+ 
++    if (mp4->mdat_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mdat atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     data = &mp4->mdat_data_buf;
+     data->file = &mp4->file;
+     data->in_file = 1;
+@@ -1372,6 +1390,12 @@ ngx_http_mp4_read_mvhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mvhd atom");
+ 
++    if (mp4->mvhd_atom.buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mvhd atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom_header = ngx_mp4_atom_header(mp4);
+     mvhd_atom = (ngx_mp4_mvhd_atom_t *) atom_header;
+     mvhd64_atom = (ngx_mp4_mvhd64_atom_t *) atom_header;
+@@ -1637,6 +1661,13 @@ ngx_http_mp4_read_tkhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_TKHD_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 tkhd atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->tkhd_size = atom_size;
+     trak->movie_duration = duration;
+ 
+@@ -1676,6 +1707,12 @@ ngx_http_mp4_read_mdia_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_MDIA_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mdia atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->mdia_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1799,6 +1836,13 @@ ngx_http_mp4_read_mdhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_MDHD_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 mdhd atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->mdhd_size = atom_size;
+     trak->timescale = timescale;
+     trak->duration = duration;
+@@ -1862,6 +1906,12 @@ ngx_http_mp4_read_hdlr_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_HDLR_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 hdlr atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->hdlr_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1890,6 +1940,12 @@ ngx_http_mp4_read_minf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_MINF_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 minf atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->minf_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1933,6 +1989,15 @@ ngx_http_mp4_read_vmhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->vmhd_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1964,6 +2029,15 @@ ngx_http_mp4_read_smhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->smhd_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -1995,6 +2069,12 @@ ngx_http_mp4_read_dinf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_DINF_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 dinf atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->dinf_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -2023,6 +2103,12 @@ ngx_http_mp4_read_stbl_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_STBL_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stbl atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->stbl_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -2144,6 +2230,12 @@ ngx_http_mp4_read_stsd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+ 
+     trak = ngx_mp4_last_trak(mp4);
+ 
++    if (trak->out[NGX_HTTP_MP4_STSD_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stsd atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     atom = &trak->stsd_atom_buf;
+     atom->temporary = 1;
+     atom->pos = atom_header;
+@@ -2212,6 +2304,13 @@ ngx_http_mp4_read_stts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_end = atom_table + entries * sizeof(ngx_mp4_stts_entry_t);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STTS_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stts atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->time_to_sample_entries = entries;
+ 
+     atom = &trak->stts_atom_buf;
+@@ -2480,6 +2579,13 @@ ngx_http_mp4_read_stss_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+                    "sync sample entries:%uD", entries);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STSS_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stss atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->sync_samples_entries = entries;
+ 
+     atom_table = atom_header + sizeof(ngx_http_mp4_stss_atom_t);
+@@ -2678,6 +2784,13 @@ ngx_http_mp4_read_ctts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+                    "composition offset entries:%uD", entries);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_CTTS_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 ctts atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->composition_offset_entries = entries;
+ 
+     atom_table = atom_header + sizeof(ngx_mp4_ctts_atom_t);
+@@ -2881,6 +2994,13 @@ ngx_http_mp4_read_stsc_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_end = atom_table + entries * sizeof(ngx_mp4_stsc_entry_t);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STSC_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stsc atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->sample_to_chunk_entries = entries;
+ 
+     atom = &trak->stsc_atom_buf;
+@@ -3213,6 +3333,13 @@ ngx_http_mp4_read_stsz_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+                    "sample uniform size:%uD, entries:%uD", size, entries);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STSZ_ATOM].buf) {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stsz atom in \"%s\"", mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->sample_sizes_entries = entries;
+ 
+     atom_table = atom_header + sizeof(ngx_mp4_stsz_atom_t);
+@@ -3396,6 +3523,16 @@ ngx_http_mp4_read_stco_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_end = atom_table + entries * sizeof(uint32_t);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stco/co64 atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->chunks = entries;
+ 
+     atom = &trak->stco_atom_buf;
+@@ -3602,6 +3739,16 @@ ngx_http_mp4_read_co64_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
+     atom_end = atom_table + entries * sizeof(uint64_t);
+ 
+     trak = ngx_mp4_last_trak(mp4);
++
++    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
++        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
++    {
++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
++                      "duplicate mp4 stco/co64 atom in \"%s\"",
++                      mp4->file.name.data);
++        return NGX_ERROR;
++    }
++
+     trak->chunks = entries;
+ 
+     atom = &trak->co64_atom_buf;
+-- 
+2.34.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 260f5f320..c6116d0db 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://nginx-volatile.conf \
     file://nginx.service \
     file://nginx-fix-pidfile.patch \
+    file://0001-Mp4-disabled-duplicate-atoms.patch\
 "
 
 inherit siteinfo update-rc.d useradd systemd
-- 
2.34.1


