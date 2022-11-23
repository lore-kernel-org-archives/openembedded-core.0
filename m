Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D31C4332F
	for <webhook@archiver.kernel.org>; Wed, 23 Nov 2022 15:44:15 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.23638.1669218250345037494
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Nov 2022 07:44:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=nSvoiivx;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id ud5so43654298ejc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 07:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jQsFRounKGkEyRYqVB3zhZZI6NSuZdYQqI6XZ04/l+8=;
        b=nSvoiivxHZiwiBhIPnIadLiTZK3464QmgiiOiwyF+2NqS0nM7v4CnPHZK/Ks3ZmJ5k
         Fucwze5vyD2N0+nMNeJUEgWT7Ig196DGgws3/9llY2cSqBgygQoBG9WZaQcP5XJxSW6e
         ijomH8ZwGoe1u3H+BdHLf+k+EeLl3oVu3fmpWXNdRSgsovqL9tFFpV0Ng7NL3MHiD1CL
         1NTphU9wP0J4CRht7M62OWKHl17WHNDxsnh0clE4cI2bYERr0JvcVkx7S5fq2ZUmpJCr
         UMJjw4dT+dSKS6ukVyk7wFoqSCAYtfStp2n2dUQ1I76R1LKT0v1WTbcptWIIqqR0qKyp
         a8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQsFRounKGkEyRYqVB3zhZZI6NSuZdYQqI6XZ04/l+8=;
        b=kc6tcXAEHjS8EUnDeUFJe8iKoRpp7MQEJW0zx9UtcxuKIhTGCda01EtkA2R1zBNL1P
         OStRgxMa76eG6cBJ1wa6uA1O2nDkidwbpVr75HqBCcrYIV1u9PzQsaNBoTe5XJLisfU6
         mwkRNTOCunNx5d3Z1XyKl6e4teW2i//KU3gr9O1GfUyRxovRC7fbxOz4zukajE2POcp2
         VKjTRFyWn9m+gRP/DKjDnpFCvqnT0F5gPUjZFdKX3KbFfDD2xm2auRusVC+jcm22feb9
         yiSynhtzbPe1dWUjmFloInLwQgeDTKgeUNTyD/HwkuQKXIe5TxZ/y9DTDVS+icdwPPgu
         mw9w==
X-Gm-Message-State: ANoB5pnhlj8unawNRF5nEU3Uk4jrKGRTU13CalbYNmYt8NeHLI0PWLSa
	1ryP18XfBotXYDCvRB3J1pV3LgRG4VUQJOvANkHWfw==
X-Google-Smtp-Source: AA0mqf5ubbX9n7kl5AKIuEQhR86pvUXwQXJiWsEaOGL5K5NyHzP0rzahojz3ibFhR5PqoiGFbHbOxbHjeAkquiqA4eA=
X-Received: by 2002:a17:906:3604:b0:78d:99a0:7cf6 with SMTP id
 q4-20020a170906360400b0078d99a07cf6mr23733519ejb.56.1669218248423; Wed, 23
 Nov 2022 07:44:08 -0800 (PST)
MIME-Version: 1.0
References: <20221123152303.244018-1-manojsingh.saun@windriver.com>
In-Reply-To: <20221123152303.244018-1-manojsingh.saun@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 23 Nov 2022 05:43:57 -1000
Message-ID: <CAOSpxdYRTwRyRNrKYuAAbuexxZVCepFtNWOtW=vd2JvKzbSg1A@mail.gmail.com>
Subject: Re: [OE-core] [meta-secure-core][kirkstone][PATCH 1/1] Signed-off-by:
 Manoj Saun <manojsingh.saun@windriver.com>
To: Manoj Saun <manojsingh.saun@windriver.com>
Cc: openembedded-core@lists.openembedded.org, narpat.mali@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Nov 2022 15:44:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173721

This is the wrong mailing list for your patch since it is for
meta-openembedded, not oe-core.  You should send it to:
openembedded-devel@lists.openembedded.org

Steve

On Wed, Nov 23, 2022 at 5:23 AM Manoj Saun
<manojsingh.saun@windriver.com> wrote:
>
> -> nginx: fix CVE-2022-41741
>
> -> nginx: disabled duplicate atoms.
>
> -> Reference:
> -> https://nvd.nist.gov/vuln/detail/CVE-2022-41742
>
> -> Upstream fixes:
> -> https://github.com/nginx/nginx/commit/0d23105373e6d8a720b9826079c077b9b4be919d
>
> -> (LOCAL REV: NOT UPSTREAM) -- Not applicable, upstream out of maintenance
> ---
>  .../0001-Mp4-disabled-duplicate-atoms.patch   | 313 ++++++++++++++++++
>  meta-webserver/recipes-httpd/nginx/nginx.inc  |   1 +
>  2 files changed, 314 insertions(+)
>  create mode 100644 meta-webserver/recipes-httpd/nginx/files/0001-Mp4-disabled-duplicate-atoms.patch
>
> diff --git a/meta-webserver/recipes-httpd/nginx/files/0001-Mp4-disabled-duplicate-atoms.patch b/meta-webserver/recipes-httpd/nginx/files/0001-Mp4-disabled-duplicate-atoms.patch
> new file mode 100644
> index 000000000..0b0753c4c
> --- /dev/null
> +++ b/meta-webserver/recipes-httpd/nginx/files/0001-Mp4-disabled-duplicate-atoms.patch
> @@ -0,0 +1,313 @@
> +From 0d23105373e6d8a720b9826079c077b9b4be919d Mon Sep 17 00:00:00 2001
> +From: Roman Arutyunyan <arut@nginx.com>
> +Date: Wed, 19 Oct 2022 10:53:17 +0300
> +Subject: [PATCH] Mp4: disabled duplicate atoms.
> +
> +Most atoms should not appear more than once in a container.  Previously,
> +this was not enforced by the module, which could result in worker process
> +crash, memory corruption and disclosure.
> +---
> + src/http/modules/ngx_http_mp4_module.c | 147 +++++++++++++++++++++++++
> + 1 file changed, 147 insertions(+)
> +
> +diff --git a/src/http/modules/ngx_http_mp4_module.c b/src/http/modules/ngx_http_mp4_module.c
> +index 5721efbe..75a7315f 100644
> +--- a/src/http/modules/ngx_http_mp4_module.c
> ++++ b/src/http/modules/ngx_http_mp4_module.c
> +@@ -1121,6 +1121,12 @@ ngx_http_mp4_read_ftyp_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +         return NGX_ERROR;
> +     }
> +
> ++    if (mp4->ftyp_atom.buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 ftyp atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
> +
> +     ftyp_atom = ngx_palloc(mp4->request->pool, atom_size);
> +@@ -1179,6 +1185,12 @@ ngx_http_mp4_read_moov_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +         return NGX_DECLINED;
> +     }
> +
> ++    if (mp4->moov_atom.buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 moov atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     conf = ngx_http_get_module_loc_conf(mp4->request, ngx_http_mp4_module);
> +
> +     if (atom_data_size > mp4->buffer_size) {
> +@@ -1246,6 +1258,12 @@ ngx_http_mp4_read_mdat_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +
> +     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mdat atom");
> +
> ++    if (mp4->mdat_atom.buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 mdat atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     data = &mp4->mdat_data_buf;
> +     data->file = &mp4->file;
> +     data->in_file = 1;
> +@@ -1372,6 +1390,12 @@ ngx_http_mp4_read_mvhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +
> +     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, mp4->file.log, 0, "mp4 mvhd atom");
> +
> ++    if (mp4->mvhd_atom.buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 mvhd atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     atom_header = ngx_mp4_atom_header(mp4);
> +     mvhd_atom = (ngx_mp4_mvhd_atom_t *) atom_header;
> +     mvhd64_atom = (ngx_mp4_mvhd64_atom_t *) atom_header;
> +@@ -1637,6 +1661,13 @@ ngx_http_mp4_read_tkhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
> +
> +     trak = ngx_mp4_last_trak(mp4);
> ++
> ++    if (trak->out[NGX_HTTP_MP4_TKHD_ATOM].buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 tkhd atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     trak->tkhd_size = atom_size;
> +     trak->movie_duration = duration;
> +
> +@@ -1676,6 +1707,12 @@ ngx_http_mp4_read_mdia_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +
> +     trak = ngx_mp4_last_trak(mp4);
> +
> ++    if (trak->out[NGX_HTTP_MP4_MDIA_ATOM].buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 mdia atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     atom = &trak->mdia_atom_buf;
> +     atom->temporary = 1;
> +     atom->pos = atom_header;
> +@@ -1799,6 +1836,13 @@ ngx_http_mp4_read_mdhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +     atom_size = sizeof(ngx_mp4_atom_header_t) + (size_t) atom_data_size;
> +
> +     trak = ngx_mp4_last_trak(mp4);
> ++
> ++    if (trak->out[NGX_HTTP_MP4_MDHD_ATOM].buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 mdhd atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     trak->mdhd_size = atom_size;
> +     trak->timescale = timescale;
> +     trak->duration = duration;
> +@@ -1862,6 +1906,12 @@ ngx_http_mp4_read_hdlr_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +
> +     trak = ngx_mp4_last_trak(mp4);
> +
> ++    if (trak->out[NGX_HTTP_MP4_HDLR_ATOM].buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 hdlr atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     atom = &trak->hdlr_atom_buf;
> +     atom->temporary = 1;
> +     atom->pos = atom_header;
> +@@ -1890,6 +1940,12 @@ ngx_http_mp4_read_minf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +
> +     trak = ngx_mp4_last_trak(mp4);
> +
> ++    if (trak->out[NGX_HTTP_MP4_MINF_ATOM].buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 minf atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     atom = &trak->minf_atom_buf;
> +     atom->temporary = 1;
> +     atom->pos = atom_header;
> +@@ -1933,6 +1989,15 @@ ngx_http_mp4_read_vmhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +
> +     trak = ngx_mp4_last_trak(mp4);
> +
> ++    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
> ++        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
> ++    {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
> ++                      mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     atom = &trak->vmhd_atom_buf;
> +     atom->temporary = 1;
> +     atom->pos = atom_header;
> +@@ -1964,6 +2029,15 @@ ngx_http_mp4_read_smhd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +
> +     trak = ngx_mp4_last_trak(mp4);
> +
> ++    if (trak->out[NGX_HTTP_MP4_VMHD_ATOM].buf
> ++        || trak->out[NGX_HTTP_MP4_SMHD_ATOM].buf)
> ++    {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 vmhd/smhd atom in \"%s\"",
> ++                      mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     atom = &trak->smhd_atom_buf;
> +     atom->temporary = 1;
> +     atom->pos = atom_header;
> +@@ -1995,6 +2069,12 @@ ngx_http_mp4_read_dinf_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +
> +     trak = ngx_mp4_last_trak(mp4);
> +
> ++    if (trak->out[NGX_HTTP_MP4_DINF_ATOM].buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 dinf atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     atom = &trak->dinf_atom_buf;
> +     atom->temporary = 1;
> +     atom->pos = atom_header;
> +@@ -2023,6 +2103,12 @@ ngx_http_mp4_read_stbl_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +
> +     trak = ngx_mp4_last_trak(mp4);
> +
> ++    if (trak->out[NGX_HTTP_MP4_STBL_ATOM].buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 stbl atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     atom = &trak->stbl_atom_buf;
> +     atom->temporary = 1;
> +     atom->pos = atom_header;
> +@@ -2144,6 +2230,12 @@ ngx_http_mp4_read_stsd_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +
> +     trak = ngx_mp4_last_trak(mp4);
> +
> ++    if (trak->out[NGX_HTTP_MP4_STSD_ATOM].buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 stsd atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     atom = &trak->stsd_atom_buf;
> +     atom->temporary = 1;
> +     atom->pos = atom_header;
> +@@ -2212,6 +2304,13 @@ ngx_http_mp4_read_stts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +     atom_end = atom_table + entries * sizeof(ngx_mp4_stts_entry_t);
> +
> +     trak = ngx_mp4_last_trak(mp4);
> ++
> ++    if (trak->out[NGX_HTTP_MP4_STTS_ATOM].buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 stts atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     trak->time_to_sample_entries = entries;
> +
> +     atom = &trak->stts_atom_buf;
> +@@ -2480,6 +2579,13 @@ ngx_http_mp4_read_stss_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +                    "sync sample entries:%uD", entries);
> +
> +     trak = ngx_mp4_last_trak(mp4);
> ++
> ++    if (trak->out[NGX_HTTP_MP4_STSS_ATOM].buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 stss atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     trak->sync_samples_entries = entries;
> +
> +     atom_table = atom_header + sizeof(ngx_http_mp4_stss_atom_t);
> +@@ -2678,6 +2784,13 @@ ngx_http_mp4_read_ctts_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +                    "composition offset entries:%uD", entries);
> +
> +     trak = ngx_mp4_last_trak(mp4);
> ++
> ++    if (trak->out[NGX_HTTP_MP4_CTTS_ATOM].buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 ctts atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     trak->composition_offset_entries = entries;
> +
> +     atom_table = atom_header + sizeof(ngx_mp4_ctts_atom_t);
> +@@ -2881,6 +2994,13 @@ ngx_http_mp4_read_stsc_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +     atom_end = atom_table + entries * sizeof(ngx_mp4_stsc_entry_t);
> +
> +     trak = ngx_mp4_last_trak(mp4);
> ++
> ++    if (trak->out[NGX_HTTP_MP4_STSC_ATOM].buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 stsc atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     trak->sample_to_chunk_entries = entries;
> +
> +     atom = &trak->stsc_atom_buf;
> +@@ -3213,6 +3333,13 @@ ngx_http_mp4_read_stsz_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +                    "sample uniform size:%uD, entries:%uD", size, entries);
> +
> +     trak = ngx_mp4_last_trak(mp4);
> ++
> ++    if (trak->out[NGX_HTTP_MP4_STSZ_ATOM].buf) {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 stsz atom in \"%s\"", mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     trak->sample_sizes_entries = entries;
> +
> +     atom_table = atom_header + sizeof(ngx_mp4_stsz_atom_t);
> +@@ -3396,6 +3523,16 @@ ngx_http_mp4_read_stco_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +     atom_end = atom_table + entries * sizeof(uint32_t);
> +
> +     trak = ngx_mp4_last_trak(mp4);
> ++
> ++    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
> ++        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
> ++    {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 stco/co64 atom in \"%s\"",
> ++                      mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     trak->chunks = entries;
> +
> +     atom = &trak->stco_atom_buf;
> +@@ -3602,6 +3739,16 @@ ngx_http_mp4_read_co64_atom(ngx_http_mp4_file_t *mp4, uint64_t atom_data_size)
> +     atom_end = atom_table + entries * sizeof(uint64_t);
> +
> +     trak = ngx_mp4_last_trak(mp4);
> ++
> ++    if (trak->out[NGX_HTTP_MP4_STCO_ATOM].buf
> ++        || trak->out[NGX_HTTP_MP4_CO64_ATOM].buf)
> ++    {
> ++        ngx_log_error(NGX_LOG_ERR, mp4->file.log, 0,
> ++                      "duplicate mp4 stco/co64 atom in \"%s\"",
> ++                      mp4->file.name.data);
> ++        return NGX_ERROR;
> ++    }
> ++
> +     trak->chunks = entries;
> +
> +     atom = &trak->co64_atom_buf;
> +--
> +2.34.1
> +
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
> index dfced3330..754290d3a 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> @@ -22,6 +22,7 @@ SRC_URI = " \
>      file://nginx-volatile.conf \
>      file://nginx.service \
>      file://nginx-fix-pidfile.patch \
> +    file://0001-Mp4-disabled-duplicate-atoms.patch \
>  "
>
>  inherit siteinfo update-rc.d useradd systemd
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173720): https://lists.openembedded.org/g/openembedded-core/message/173720
> Mute This Topic: https://lists.openembedded.org/mt/95219628/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

