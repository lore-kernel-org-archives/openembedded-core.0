Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5CDAF7FC80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 00:27:45 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id w47so1755570qtk.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2019 16:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hvUXYWXWVIeA+IKtl/BWoWKY4f700hu/Y2uxuomS5qg=;
	b=se763F0Jdnj+z38LVZt8Hq0mquVDmm0bk7WgWuaREsEgJWDJFX4MpfACjYHuok+iSZ
	/2gsGCmEZX0O7tKIillcpb4qtZkJ25aRTI/eg4wtC8l7RoyuTjM+SmyVK7UrTKUhTyPo
	6+yaCtSH0+GVDn152jNB7/IFPsqdwvkYk6ozGC/pV7h3vfZ7aoex1gR5FgCCn6hAZDQk
	lKOzjKMdj457ar5QtSZcd5nYhFJfUJEpQqg5mWjeBBCg3+4z8p+pFs6ji84qN/gBpHB5
	pKpIfun03/eZilFQJc3uX2NI7lvaCAjrs/siZaEIUpudbZCpOTOibbi8os9giUKC/mcd
	jxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hvUXYWXWVIeA+IKtl/BWoWKY4f700hu/Y2uxuomS5qg=;
	b=DVYlWsg1+n+jL/prvFfk7WmxK+RcxB/V+lKytRqb0QY5W0dq/s9PNb8i8yvG7Y1tIO
	NvjJrYf+YSBMQ2kP+WiBBOAZvtCNhqwHog7wQVieu27HqLn1D9BqKCesEytimhVkGmHH
	+UeTAfd+9AaoSNf3Kp4IrFmpB38CQsw3K4ahCXF9OTEqatWcKBzAHQxqxm8Ioc4L1W42
	q6brBAJrUQbh7ANSzZ7wRQ4uQFxD/VvlJAQbs1wTJVt7nBtOMiI8i0hu2BDVhDR0oyJ2
	d68WXBsBtjjjtxx13y0zeunG2/6HonIku6Jm1PgqAdgRIgRlAe8vw0WHSTUxLpZf+MEp
	A3HA==
X-Gm-Message-State: APjAAAX9pd2kRVqhJprh7uK1taE9V45xqx9/S2nRe2Ih4tOsVTpQFVT5
	6qRdYaU98KgAtS7SpOmYzVe58yIV4pf/sCTdkX8=
X-Google-Smtp-Source: APXvYqzkq79OijUVOqwKpY5RSOA7nkoeBU2eVjaazhQ92J1+6IY1oYJldMgv14EPhyxjWxJXNdZxhrb21PB7vHm03zM=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr1600891qtj.80.1574382465772; 
	Thu, 21 Nov 2019 16:27:45 -0800 (PST)
MIME-Version: 1.0
References: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20191121150207.3657-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Nov 2019 16:27:34 -0800
Message-ID: <CAMKF1soT1CqsRqkVOfpGjuCjvvHOExnwjZguXEog9Sa6dc_uFw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] opkg: Add upstream fixes
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
X-List-Received-Date: Fri, 22 Nov 2019 00:27:45 -0000
Content-Type: multipart/alternative; boundary="0000000000009cf1150597e47b99"

--0000000000009cf1150597e47b99
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 21, 2019 at 7:02 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../opkg/opkg/open_inner.patch                | 150 ++++++++++++++++
>  .../opkg/opkg/opkg_archive.patch              | 160 ++++++++++++++++++
>  meta/recipes-devtools/opkg/opkg_0.4.1.bb      |   2 +
>  3 files changed, 312 insertions(+)
>  create mode 100644 meta/recipes-devtools/opkg/opkg/open_inner.patch
>  create mode 100644 meta/recipes-devtools/opkg/opkg/opkg_archive.patch
>
> diff --git a/meta/recipes-devtools/opkg/opkg/open_inner.patch
> b/meta/recipes-devtools/opkg/opkg/open_inner.patch
> new file mode 100644
> index 00000000000..9edccda33ea
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/open_inner.patch
> @@ -0,0 +1,150 @@
> +From alejandro.delcastillo@ni.com Wed Nov 20 22:35:02 2019
> +Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
> +X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on dan.rpsys.net
> +X-Spam-Level:
> +X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
> +       HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
> +       SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
> version=3.4.2
> +Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com
> + [209.85.217.54]) by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPS
> id
> + xAKMZ0Lh008396 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128
> + verify=NOT) for <rpurdie@rpsys.net>; Wed, 20 Nov 2019 22:35:02 GMT
> +Received: by mail-vs1-f54.google.com with SMTP id a143so842733vsd.9
> +        for <rpurdie@rpsys.net>; Wed, 20 Nov 2019 14:35:02 -0800 (PST)
> +X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
> 1e100.net;
> + s=20161025;
> + h=x-original-authentication-results:x-gm-message-state:delivered-to
> + :from:to:cc:subject:date:message-id:in-reply-to:references
> + :mime-version:content-transfer-encoding;
> + bh=KhZ2BZSLg854tEjeyRybBtwjcbtPiM0dOPJA6ODniyc=;
> + b=gWeCNByEKyLw0dgzMAzHowAbjPywF8aHCjjjDOeFB/48Lr/e3A42S47HsxON9j+BoP
> + Ai2HT0MOqAIRWqz3tQM/1Q9mXOy0PNU2Dqpzu5u7QCZeoFX1XpXH0hbVn+JOdg3bcPwn
> + Nm+A/vS1By4S8c0EGQ+JQ6EBMc4xtpG8rOKiPuAtj5FlRVIQ1/AM8fEMrtQfFemBbIoO
> + KhGQVSmXg9CQKzPBoFR+IgiiKuUJjKBAcz7gzvQjJ6y/sCKUtk3FE8QUNeGqMGQXkD1/
> + XEWZq2qLjkEezUbqW+ixeaWUlN7EqTn0YT+g5sO9tEL4xoUR3w9KwCkdwOvUlgEftbUB
> aPCA==
> +X-Original-Authentication-Results: mx.google.com;       spf=pass
> + (google.com: domain of prvs=222760f524=alejandro.delcastillo@ni.com
> + designates 148.163.156.75 as permitted sender)
> + smtp.mailfrom="prvs=222760f524=alejandro.delcastillo@ni.com";
> + dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ni.com
> +X-Gm-Message-State:
> + APjAAAWPWaQQBF8I9vWh3dmrrR3q+FLW/OiQFoIv220MYnIHfdNqqufD
> + I54SM2ZkAI8VGILL5cnno25yyFO4MmqyzLBlkBkUHPoMGpk1l8U6Gg==
> +X-Received: by 2002:a67:f649:: with SMTP id
> + u9mr3437665vso.20.1574289295541; Wed, 20 Nov 2019 14:34:55 -0800 (PST)
> +X-Forwarded-To: rpurdie@rpsys.net
> +X-Forwarded-For: richard.purdie@linuxfoundation.org rpurdie@rpsys.net
> +Delivered-To: richard.purdie@linuxfoundation.org
> +Received: by 2002:a67:ca9b:0:0:0:0:0 with SMTP id a27csp2232978vsl;
> +        Wed, 20 Nov 2019 14:34:53 -0800 (PST)
> +X-Google-Smtp-Source:
> +
> APXvYqzu0124T/A2v8nyGwvi00K3wFZx5WfkgZyaqKf27zfmydLbudST3y3wGviqkEtUN4fkFdsl
> +X-Received: by 2002:a17:902:d901:: with SMTP id
> + c1mr5251580plz.93.1574289293448; Wed, 20 Nov 2019 14:34:53 -0800 (PST)
> +ARC-Seal: i=1; a=rsa-sha256; t=1574289293; cv=none; d=google.com;
> + s=arc-20160816;
> + b=wICD7meblSbVcD2gv1eC5y6GdeaaEHOHrP5D7it3PNtBwqNTqRmU1F8UJWdOdmsbKu
> + JSKc9assSlXVI9F7Bu+ZsczsEbA9MqWxKmgPLS5YHVTCMU3QRwTX1uLMtdeEUmCDo2+N
> + edCAO1bdrNbsM1Yhu/7nur8mBRrmcP/2uq4cgvfV03/1i1x3YiRiLmEj/WaU1V2oGzjL
> + F8lQpfIQIcIbX0dlq28GnJKntNSDe++OMLBwlhxY5FR+lCaXhf91kw/WndILbB99U0yf
> + 6FkzOxwcTbLLahDdHDgVmtk+grUVcz0N7HnRM5Wj8FqAmbtetw/NnWovsUMUlbQRvQm5
> /xKA==
> +ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com
> ;
> + s=arc-20160816;
> + h=content-transfer-encoding:mime-version:references:in-reply-to
> + :message-id:date:subject:cc:to:from;
> + bh=KhZ2BZSLg854tEjeyRybBtwjcbtPiM0dOPJA6ODniyc=;
> + b=MIgWm3wUiLmTZuhjNXKsih84SdE0NfFoXpMJqshToFqGG8ElxCzyorlvK+0PGjN428
> + O/vMXpqOqd1iR6IZ9/wEb3JsHOrOxNWFwA1MVp/QkSKQwhjvRNl62i5C7fl7idVwuUl/
> + 7EZJZ4ZYTXEGUv+wIUuij+MAffGrqQDg0Ubd9ccVymjPA6nDLryHEbWrUepJVnKPd3nQ
> + iJxxkYgBP8QP3Aq/a3QNxqxXdMilrGeMljx0wpWwKqkBEvC913vISPJZ0nLbxglYzebM
> + K3B2Ksf4Ct7C/dXPAUjkt5mtLDYT6mZ7v8oFesgsbxvIHlKe6CCry0a5wYUqaSvfElfY
> V6kA==
> +ARC-Authentication-Results: i=1; mx.google.com; spf=pass (google.com:
> + domain of prvs=222760f524=alejandro.delcastillo@ni.com designates
> + 148.163.156.75 as permitted sender)
> + smtp.mailfrom="prvs=222760f524=alejandro.delcastillo@ni.com"; dmarc=pass
> + (p=NONE sp=NONE dis=NONE) header.from=ni.com
> +Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com.
> + [148.163.156.75]) by mx.google.com with ESMTPS id
> + 4si680517plb.245.2019.11.20.14.34.53 for
> + <richard.purdie@linuxfoundation.org> (version=TLS1_2
> + cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Wed, 20 Nov 2019
> 14:34:53
> + -0800 (PST)
> +Received-SPF: pass (google.com: domain of
> + prvs=222760f524=alejandro.delcastillo@ni.com designates 148.163.156.75
> as
> + permitted sender) client-ip=148.163.156.75;
> +Authentication-Results: mx.google.com; spf=pass (google.com: domain of
> + prvs=222760f524=alejandro.delcastillo@ni.com designates 148.163.156.75
> as
> + permitted sender)
> + smtp.mailfrom="prvs=222760f524=alejandro.delcastillo@ni.com"; dmarc=pass
> + (p=NONE sp=NONE dis=NONE) header.from=ni.com
> +Received: from pps.filterd (m0098781.ppops.net [127.0.0.1]) by
> + mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
> + xAKMRxBj018942; Wed, 20 Nov 2019 16:34:52 -0600
> +Received: from ni.com (skprod3.natinst.com [130.164.80.24])
> +       by mx0a-00010702.pphosted.com with ESMTP id 2wae13ps20-1
> +       (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
> verify=NOT);
> +       Wed, 20 Nov 2019 16:34:52 -0600
> +Received: from us-aus-exch2.ni.corp.natinst.com
> + (us-aus-exch2.ni.corp.natinst.com [130.164.68.12]) by
> + us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
> + xAKMYpHv003993 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256
> + verify=NOT); Wed, 20 Nov 2019 16:34:51 -0600
> +Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
> + us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
> Server
> + (TLS) id 15.0.1395.4; Wed, 20 Nov 2019 16:34:51 -0600
> +Received: from delcastillo3.natinst.com (172.18.68.32) by
> + us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
> + Server id 15.0.1395.4 via Frontend Transport; Wed, 20 Nov 2019 16:34:51
> + -0600
> +From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +To: <opkg-devel@googlegroups.com>, <richard.purdie@linuxfoundation.org>
> +CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +Subject: [opkg][PATCH 2/2] open_inner: add support for empty payloads
> +Date: Wed, 20 Nov 2019 16:34:48 -0600
> +Message-ID: <20191120223448.26522-3-alejandro.delcastillo@ni.com>
> +X-Mailer: git-send-email 2.22.0
> +In-Reply-To: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
> +References: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
> +MIME-Version: 1.0
> +Content-Type: text/plain
> +X-Proofpoint-Virus-Version: vendor=fsecure
> + engine=2.50.10434:6.0.95,18.0.572
> + definitions=2019-11-20_07:2019-11-20,2019-11-20 signatures=0
> +X-Proofpoint-Spam-Reason: safe
> +X-Virus-Scanned: clamav-milter 0.101.4 at dan
> +X-Virus-Status: Clean
> +X-Evolution-Source: 1525863794.3857.16@hex
> +Content-Transfer-Encoding: 8bit


Perhaps this raw mail header can be removed it seems to add no value
moreover is distracting


> +
> +Support for empty compressed payloads need to be explicitly enabled on
> +libarchive.
> +
> +Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +
> +Upstream-Status: Backport
> +---
> + libopkg/opkg_archive.c | 7 +++++++
> + 1 file changed, 7 insertions(+)
> +
> +diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
> +index 0e9ccea..f19cece 100644
> +--- a/libopkg/opkg_archive.c
> ++++ b/libopkg/opkg_archive.c
> +@@ -618,6 +618,13 @@ static struct archive *open_inner(struct archive
> *outer)
> +         goto err_cleanup;
> +     }
> +
> ++    r = archive_read_support_format_empty(inner);
> ++    if (r != ARCHIVE_OK) {
> ++        opkg_msg(ERROR, "Empty format not supported: %s\n",
> ++                 archive_error_string(inner));
> ++        goto err_cleanup;
> ++    }
> ++
> +     r = archive_read_open(inner, data, NULL, inner_read, inner_close);
> +     if (r != ARCHIVE_OK) {
> +         opkg_msg(ERROR, "Failed to open inner archive: %s\n",
> +--
> +2.22.0
> +
> +
> diff --git a/meta/recipes-devtools/opkg/opkg/opkg_archive.patch
> b/meta/recipes-devtools/opkg/opkg/opkg_archive.patch
> new file mode 100644
> index 00000000000..56a275a2342
> --- /dev/null
> +++ b/meta/recipes-devtools/opkg/opkg/opkg_archive.patch
> @@ -0,0 +1,160 @@
> +From alejandro.delcastillo@ni.com Wed Nov 20 22:35:01 2019
> +Return-Path: <richard.purdie+caf_=rpurdie=rpsys.net@linuxfoundation.org>
> +X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on dan.rpsys.net
> +X-Spam-Level:
> +X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
> +       HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
> +       SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
> version=3.4.2
> +Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
> + [209.85.222.41]) by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPS
> id
> + xAKMZ0gk008395 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128
> + verify=NOT) for <rpurdie@rpsys.net>; Wed, 20 Nov 2019 22:35:01 GMT
> +Received: by mail-ua1-f41.google.com with SMTP id p18so339793uar.7
> +        for <rpurdie@rpsys.net>; Wed, 20 Nov 2019 14:35:01 -0800 (PST)
> +X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
> 1e100.net;
> + s=20161025;
> + h=x-original-authentication-results:x-gm-message-state:delivered-to
> + :from:to:cc:subject:date:message-id:in-reply-to:references
> + :mime-version:content-transfer-encoding;
> + bh=Y9OOjY7NCD3Wm+XzvK+9TzmDhgbtPVQl7aMAusdzDho=;
> + b=XjoAkiz0bsIvromNySMA4g4jfIJopfXAr8WYyCO5/I74DxBvUelc2e/2DyZYt5VYuW
> + NaMD9rSCOk9gn+ld+INdJmH3ceuPGZm1Y4kgLVCTL7IknlPWjuJtWL599/8lrn4uhVWD
> + cOwFsyu09EPjYvGzwjqxqf8Wca+HgymmDV/vor92kqu2trl8CsWC835pFG0a8/B4rAYH
> + hOMhvqeU+UrkMe5iyIzB4L6nBX3Gwwgt8EI+W2mgWh6W8HwLfdrv9IOKWj00V98xU9Nn
> + gUEGsCeQa1/bo5qYY1Z/w/lotR0vVJu6B+w/V/d/cniuciVnsEyfEQmBjebT8746mzz+
> dTnw==
> +X-Original-Authentication-Results: mx.google.com;       spf=pass
> + (google.com: domain of prvs=222760f524=alejandro.delcastillo@ni.com
> + designates 148.163.156.75 as permitted sender)
> + smtp.mailfrom="prvs=222760f524=alejandro.delcastillo@ni.com";
> + dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ni.com
> +X-Gm-Message-State:
> + APjAAAX1zcx9B1j4E7KLRgNh2OtNUmWztKYgWCXumfNL62Clsc75k1g+
> + 8eUvzPiRBh6riiNx3HKjZJOp30ExyEMZgztnyB9JpBxhwfzt2ttNog==
> +X-Received: by 2002:ab0:2618:: with SMTP id
> + c24mr3345925uao.75.1574289294734; Wed, 20 Nov 2019 14:34:54 -0800 (PST)
> +X-Forwarded-To: rpurdie@rpsys.net
> +X-Forwarded-For: richard.purdie@linuxfoundation.org rpurdie@rpsys.net
> +Delivered-To: richard.purdie@linuxfoundation.org
> +Received: by 2002:a67:ca9b:0:0:0:0:0 with SMTP id a27csp2232973vsl;
> +        Wed, 20 Nov 2019 14:34:53 -0800 (PST)
> +X-Google-Smtp-Source:
> +
> APXvYqyxMeKT9TRfjbvSZeBERtCkHKj+Y0dywybZSRWjh2KpKGAS3ujTon8MetFDJPz/XaV9C4CN
> +X-Received: by 2002:a17:902:8bc9:: with SMTP id
> + r9mr4994639plo.319.1574289293016; Wed, 20 Nov 2019 14:34:53 -0800 (PST)
> +ARC-Seal: i=1; a=rsa-sha256; t=1574289293; cv=none; d=google.com;
> + s=arc-20160816;
> + b=04u3YSzfPN0+WkK0LLFKW07PbOQyk5T2b4rCKit5CG/Ec1pY+E6UTqRdu/fbhIJ2Xo
> + qmpdqhcieKhtvY5kx+S28NLXszEPZcAIjNnXepU1qvTZXnCkNfXyJFSPGLDmLTGLEdUB
> + TktdoM4IjNjOx4qwRnqdTdLV66cWGB7ojNTAih6qYb0t+2fgv70uiElgjxiTfhNTke22
> + GaSyUo4vnzAekGOVPJwLqqS7gkElQro7NM2rlW2J3UEWyrMy0Gj4BuVFszxzAu8mazqT
> + XtrsWLuzSGRjYA2EtNj8+62lABsaWuxPy5x/9VX8bblNZIu2GqaHC/AO0nQkDqf8cX9q
> TmiA==
> +ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com
> ;
> + s=arc-20160816;
> + h=content-transfer-encoding:mime-version:references:in-reply-to
> + :message-id:date:subject:cc:to:from;
> + bh=Y9OOjY7NCD3Wm+XzvK+9TzmDhgbtPVQl7aMAusdzDho=;
> + b=mRussZx0Qx8Lxch1ZO1ZDWs4BKZNLsgzwIdr1z6rVp7/cI+CPBebzvrEPoqBji+ta6
> + m1gpgsPum3Vg3JHHvFCNz/Pon4ygv4KIVSphBcgjti+2qnoRn48H4YvCirHZ4mDR6h3u
> + rhl6Ojls0KI0YIiidpTRphIbS0vpBbkI/PUGkfVJzxQaEYuJa4TIQq2bmsrCImVwuBZs
> + t2ktebY1vt+ZBKPVq43CsAiMl1Srr/50sBhOk5NFkiaBVDJQzIj1kI7bnU3zktBaGdOK
> + 1jDpOoOnBV3SVe2M8eb38+Ge8AdL4jdMVGbdXfzXUWvF1eNgZRmkQVe1mRw4SwBnPsgs
> f64g==
> +ARC-Authentication-Results: i=1; mx.google.com; spf=pass (google.com:
> + domain of prvs=222760f524=alejandro.delcastillo@ni.com designates
> + 148.163.156.75 as permitted sender)
> + smtp.mailfrom="prvs=222760f524=alejandro.delcastillo@ni.com"; dmarc=pass
> + (p=NONE sp=NONE dis=NONE) header.from=ni.com
> +Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com.
> + [148.163.156.75]) by mx.google.com with ESMTPS id
> + 21si715567pgq.469.2019.11.20.14.34.52 for
> + <richard.purdie@linuxfoundation.org> (version=TLS1_2
> + cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128); Wed, 20 Nov 2019
> 14:34:53
> + -0800 (PST)
> +Received-SPF: pass (google.com: domain of
> + prvs=222760f524=alejandro.delcastillo@ni.com designates 148.163.156.75
> as
> + permitted sender) client-ip=148.163.156.75;
> +Authentication-Results: mx.google.com; spf=pass (google.com: domain of
> + prvs=222760f524=alejandro.delcastillo@ni.com designates 148.163.156.75
> as
> + permitted sender)
> + smtp.mailfrom="prvs=222760f524=alejandro.delcastillo@ni.com"; dmarc=pass
> + (p=NONE sp=NONE dis=NONE) header.from=ni.com
> +Received: from pps.filterd (m0098780.ppops.net [127.0.0.1]) by
> + mx0a-00010702.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
> + xAKMSIJ5016740; Wed, 20 Nov 2019 16:34:52 -0600
> +Received: from ni.com (skprod3.natinst.com [130.164.80.24])
> +       by mx0a-00010702.pphosted.com with ESMTP id 2wafh16muy-1
> +       (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
> verify=NOT);
> +       Wed, 20 Nov 2019 16:34:52 -0600
> +Received: from us-aus-exch2.ni.corp.natinst.com
> + (us-aus-exch2.ni.corp.natinst.com [130.164.68.12]) by
> + us-aus-skprod3.natinst.com (8.16.0.27/8.16.0.27) with ESMTPS id
> + xAKMYpHw003993 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256
> + verify=NOT); Wed, 20 Nov 2019 16:34:51 -0600
> +Received: from us-aus-exch5.ni.corp.natinst.com (130.164.68.15) by
> + us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
> Server
> + (TLS) id 15.0.1395.4; Wed, 20 Nov 2019 16:34:51 -0600
> +Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
> + us-aus-exch5.ni.corp.natinst.com (130.164.68.15) with Microsoft SMTP
> Server
> + (TLS) id 15.0.1395.4; Wed, 20 Nov 2019 16:34:50 -0600
> +Received: from delcastillo3.natinst.com (172.18.68.32) by
> + us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
> + Server id 15.0.1395.4 via Frontend Transport; Wed, 20 Nov 2019 16:34:50
> + -0600
> +From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +To: <opkg-devel@googlegroups.com>, <richard.purdie@linuxfoundation.org>
> +CC: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +Subject: [opkg][PATCH 1/2] opkg_archive.c: avoid double free on uncompress
> + error
> +Date: Wed, 20 Nov 2019 16:34:47 -0600
> +Message-ID: <20191120223448.26522-2-alejandro.delcastillo@ni.com>
> +X-Mailer: git-send-email 2.22.0
> +In-Reply-To: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
> +References: <20191120223448.26522-1-alejandro.delcastillo@ni.com>
> +MIME-Version: 1.0
> +Content-Type: text/plain
> +X-Proofpoint-Virus-Version: vendor=fsecure
> + engine=2.50.10434:6.0.95,18.0.572
> + definitions=2019-11-20_07:2019-11-20,2019-11-20 signatures=0
> +X-Proofpoint-Spam-Reason: safe
> +X-Virus-Scanned: clamav-milter 0.101.4 at dan
> +X-Virus-Status: Clean
> +X-Evolution-Source: 1525863794.3857.16@hex
> +Content-Transfer-Encoding: 8bit
> +
> +The open-inner function calls archive_read_open. On error,
> +archive_read_open calls inner_close, which also closes the outter
> +archive. On error, return NULL directly to avoid double free.
> +
> +
> +Upstream-Status: Backport
> +
> +Signed-off-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
> +---
> + libopkg/opkg_archive.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
> +index 3d87db1..0e9ccea 100644
> +--- a/libopkg/opkg_archive.c
> ++++ b/libopkg/opkg_archive.c
> +@@ -622,7 +622,7 @@ static struct archive *open_inner(struct archive
> *outer)
> +     if (r != ARCHIVE_OK) {
> +         opkg_msg(ERROR, "Failed to open inner archive: %s\n",
> +                  archive_error_string(inner));
> +-        goto err_cleanup;
> ++        return NULL;
> +     }
> +
> +     return inner;
> +@@ -683,7 +683,7 @@ static struct archive *extract_outer(const char
> *filename, const char *arname)
> +
> +     inner = open_inner(outer);
> +     if (!inner)
> +-        goto err_cleanup;
> ++        return NULL;
> +
> +     return inner;
> +
> +--
> +2.22.0
> +
> +
> diff --git a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> index 149ee3ca190..f0ae8b36bd1 100644
> --- a/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> +++ b/meta/recipes-devtools/opkg/opkg_0.4.1.bb
> @@ -14,6 +14,8 @@ PE = "1"
>  SRC_URI = "
> http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz \
>             file://opkg.conf \
>
> file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-run.patch \
> +           file://opkg_archive.patch \
> +           file://open_inner.patch \
>             file://run-ptest \
>  "
>
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--0000000000009cf1150597e47b99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Nov 21, 2019 at 7:02 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Signed-off-by=
: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" =
target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;<br>
---<br>
=C2=A0.../opkg/opkg/open_inner.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 150 ++++++++++++++++<br>
=C2=A0.../opkg/opkg/opkg_archive.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 160 ++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.1.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.4.1.bb</a>=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A02 +<br>
=C2=A03 files changed, 312 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/opkg/opkg/open_inner.patch<b=
r>
=C2=A0create mode 100644 meta/recipes-devtools/opkg/opkg/opkg_archive.patch=
<br>
<br>
diff --git a/meta/recipes-devtools/opkg/opkg/open_inner.patch b/meta/recipe=
s-devtools/opkg/opkg/open_inner.patch<br>
new file mode 100644<br>
index 00000000000..9edccda33ea<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/opkg/opkg/open_inner.patch<br>
@@ -0,0 +1,150 @@<br>
+From <a href=3D"mailto:alejandro.delcastillo@ni.com" target=3D"_blank">ale=
jandro.delcastillo@ni.com</a> Wed Nov 20 22:35:02 2019<br>
+Return-Path: &lt;richard.purdie+caf_=3Drpurdie=3D<a href=3D"mailto:rpsys.n=
et@linuxfoundation.org" target=3D"_blank">rpsys.net@linuxfoundation.org</a>=
&gt;<br>
+X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on <a href=3D"http=
://dan.rpsys.net" rel=3D"noreferrer" target=3D"_blank">dan.rpsys.net</a><br=
>
+X-Spam-Level: <br>
+X-Spam-Status: No, score=3D-1.7 required=3D5.0 tests=3DBAYES_00,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NON=
E,RCVD_IN_MSPIKE_H2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SPF_HELO_NONE,SPF_PASS autolearn=3Dno autolearn=
_force=3Dno version=3D3.4.2<br>
+Received: from <a href=3D"http://mail-vs1-f54.google.com" rel=3D"noreferre=
r" target=3D"_blank">mail-vs1-f54.google.com</a> (<a href=3D"http://mail-vs=
1-f54.google.com" rel=3D"noreferrer" target=3D"_blank">mail-vs1-f54.google.=
com</a><br>
+ [209.85.217.54]) by <a href=3D"http://dan.rpsys.net" rel=3D"noreferrer" t=
arget=3D"_blank">dan.rpsys.net</a> (8.15.2/8.15.2/Debian-10) with ESMTPS id=
<br>
+ xAKMZ0Lh008396 (version=3DTLSv1.3 cipher=3DTLS_AES_128_GCM_SHA256 bits=3D=
128<br>
+ verify=3DNOT) for &lt;<a href=3D"mailto:rpurdie@rpsys.net" target=3D"_bla=
nk">rpurdie@rpsys.net</a>&gt;; Wed, 20 Nov 2019 22:35:02 GMT<br>
+Received: by <a href=3D"http://mail-vs1-f54.google.com" rel=3D"noreferrer"=
 target=3D"_blank">mail-vs1-f54.google.com</a> with SMTP id a143so842733vsd=
.9<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for &lt;<a href=3D"mailto:rpurdie@rpsys.net" t=
arget=3D"_blank">rpurdie@rpsys.net</a>&gt;; Wed, 20 Nov 2019 14:35:02 -0800=
 (PST)<br>
+X-Google-DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3D<=
a href=3D"http://1e100.net" rel=3D"noreferrer" target=3D"_blank">1e100.net<=
/a>;<br>
+ s=3D20161025;<br>
+ h=3Dx-original-authentication-results:x-gm-message-state:delivered-to<br>
+ :from:to:cc:subject:date:message-id:in-reply-to:references<br>
+ :mime-version:content-transfer-encoding;<br>
+ bh=3DKhZ2BZSLg854tEjeyRybBtwjcbtPiM0dOPJA6ODniyc=3D;<br>
+ b=3DgWeCNByEKyLw0dgzMAzHowAbjPywF8aHCjjjDOeFB/48Lr/e3A42S47HsxON9j+BoP<br=
>
+ Ai2HT0MOqAIRWqz3tQM/1Q9mXOy0PNU2Dqpzu5u7QCZeoFX1XpXH0hbVn+JOdg3bcPwn<br>
+ Nm+A/vS1By4S8c0EGQ+JQ6EBMc4xtpG8rOKiPuAtj5FlRVIQ1/AM8fEMrtQfFemBbIoO<br>
+ KhGQVSmXg9CQKzPBoFR+IgiiKuUJjKBAcz7gzvQjJ6y/sCKUtk3FE8QUNeGqMGQXkD1/<br>
+ XEWZq2qLjkEezUbqW+ixeaWUlN7EqTn0YT+g5sO9tEL4xoUR3w9KwCkdwOvUlgEftbUB aPCA=
=3D=3D<br>
+X-Original-Authentication-Results: <a href=3D"http://mx.google.com" rel=3D=
"noreferrer" target=3D"_blank">mx.google.com</a>;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0spf=3Dpass<br>
+ (<a href=3D"http://google.com" rel=3D"noreferrer" target=3D"_blank">googl=
e.com</a>: domain of prvs=3D222760f524=3D<a href=3D"mailto:alejandro.delcas=
tillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a><br>
+ designates 148.163.156.75 as permitted sender)<br>
+ smtp.mailfrom=3D&quot;prvs=3D222760f524=3D<a href=3D"mailto:alejandro.del=
castillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&quot;;=
=C2=A0 =C2=A0 =C2=A0 <br>
+ dmarc=3Dpass (p=3DNONE sp=3DNONE dis=3DNONE) header.from=3D<a href=3D"htt=
p://ni.com" rel=3D"noreferrer" target=3D"_blank">ni.com</a><br>
+X-Gm-Message-State:<br>
+ APjAAAWPWaQQBF8I9vWh3dmrrR3q+FLW/OiQFoIv220MYnIHfdNqqufD<br>
+ I54SM2ZkAI8VGILL5cnno25yyFO4MmqyzLBlkBkUHPoMGpk1l8U6Gg=3D=3D<br>
+X-Received: by 2002:a67:f649:: with SMTP id<br>
+ u9mr3437665vso.20.1574289295541; Wed, 20 Nov 2019 14:34:55 -0800 (PST)<br=
>
+X-Forwarded-To: <a href=3D"mailto:rpurdie@rpsys.net" target=3D"_blank">rpu=
rdie@rpsys.net</a><br>
+X-Forwarded-For: <a href=3D"mailto:richard.purdie@linuxfoundation.org" tar=
get=3D"_blank">richard.purdie@linuxfoundation.org</a> <a href=3D"mailto:rpu=
rdie@rpsys.net" target=3D"_blank">rpurdie@rpsys.net</a><br>
+Delivered-To: <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
+Received: by 2002:a67:ca9b:0:0:0:0:0 with SMTP id a27csp2232978vsl;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Wed, 20 Nov 2019 14:34:53 -0800 (PST)<br>
+X-Google-Smtp-Source:<br>
+ APXvYqzu0124T/A2v8nyGwvi00K3wFZx5WfkgZyaqKf27zfmydLbudST3y3wGviqkEtUN4fkF=
dsl<br>
+X-Received: by 2002:a17:902:d901:: with SMTP id<br>
+ c1mr5251580plz.93.1574289293448; Wed, 20 Nov 2019 14:34:53 -0800 (PST)<br=
>
+ARC-Seal: i=3D1; a=3Drsa-sha256; t=3D1574289293; cv=3Dnone; d=3D<a href=3D=
"http://google.com" rel=3D"noreferrer" target=3D"_blank">google.com</a>;<br=
>
+ s=3Darc-20160816;<br>
+ b=3DwICD7meblSbVcD2gv1eC5y6GdeaaEHOHrP5D7it3PNtBwqNTqRmU1F8UJWdOdmsbKu<br=
>
+ JSKc9assSlXVI9F7Bu+ZsczsEbA9MqWxKmgPLS5YHVTCMU3QRwTX1uLMtdeEUmCDo2+N<br>
+ edCAO1bdrNbsM1Yhu/7nur8mBRrmcP/2uq4cgvfV03/1i1x3YiRiLmEj/WaU1V2oGzjL<br>
+ F8lQpfIQIcIbX0dlq28GnJKntNSDe++OMLBwlhxY5FR+lCaXhf91kw/WndILbB99U0yf<br>
+ 6FkzOxwcTbLLahDdHDgVmtk+grUVcz0N7HnRM5Wj8FqAmbtetw/NnWovsUMUlbQRvQm5 /xKA=
=3D=3D<br>
+ARC-Message-Signature: i=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3D<a =
href=3D"http://google.com" rel=3D"noreferrer" target=3D"_blank">google.com<=
/a>;<br>
+ s=3Darc-20160816;<br>
+ h=3Dcontent-transfer-encoding:mime-version:references:in-reply-to<br>
+ :message-id:date:subject:cc:to:from;<br>
+ bh=3DKhZ2BZSLg854tEjeyRybBtwjcbtPiM0dOPJA6ODniyc=3D;<br>
+ b=3DMIgWm3wUiLmTZuhjNXKsih84SdE0NfFoXpMJqshToFqGG8ElxCzyorlvK+0PGjN428<br=
>
+ O/vMXpqOqd1iR6IZ9/wEb3JsHOrOxNWFwA1MVp/QkSKQwhjvRNl62i5C7fl7idVwuUl/<br>
+ 7EZJZ4ZYTXEGUv+wIUuij+MAffGrqQDg0Ubd9ccVymjPA6nDLryHEbWrUepJVnKPd3nQ<br>
+ iJxxkYgBP8QP3Aq/a3QNxqxXdMilrGeMljx0wpWwKqkBEvC913vISPJZ0nLbxglYzebM<br>
+ K3B2Ksf4Ct7C/dXPAUjkt5mtLDYT6mZ7v8oFesgsbxvIHlKe6CCry0a5wYUqaSvfElfY V6kA=
=3D=3D<br>
+ARC-Authentication-Results: i=3D1; <a href=3D"http://mx.google.com" rel=3D=
"noreferrer" target=3D"_blank">mx.google.com</a>; spf=3Dpass (<a href=3D"ht=
tp://google.com" rel=3D"noreferrer" target=3D"_blank">google.com</a>:<br>
+ domain of prvs=3D222760f524=3D<a href=3D"mailto:alejandro.delcastillo@ni.=
com" target=3D"_blank">alejandro.delcastillo@ni.com</a> designates<br>
+ 148.163.156.75 as permitted sender)<br>
+ smtp.mailfrom=3D&quot;prvs=3D222760f524=3D<a href=3D"mailto:alejandro.del=
castillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&quot;; =
dmarc=3Dpass<br>
+ (p=3DNONE sp=3DNONE dis=3DNONE) header.from=3D<a href=3D"http://ni.com" r=
el=3D"noreferrer" target=3D"_blank">ni.com</a><br>
+Received: from <a href=3D"http://mx0b-00010702.pphosted.com" rel=3D"norefe=
rrer" target=3D"_blank">mx0b-00010702.pphosted.com</a> (<a href=3D"http://m=
x0a-00010702.pphosted.com" rel=3D"noreferrer" target=3D"_blank">mx0a-000107=
02.pphosted.com</a>.<br>
+ [148.163.156.75]) by <a href=3D"http://mx.google.com" rel=3D"noreferrer" =
target=3D"_blank">mx.google.com</a> with ESMTPS id<br>
+ 4si680517plb.245.2019.11.20.14.34.53 for<br>
+ &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blan=
k">richard.purdie@linuxfoundation.org</a>&gt; (version=3DTLS1_2<br>
+ cipher=3DECDHE-RSA-AES128-GCM-SHA256 bits=3D128/128); Wed, 20 Nov 2019 14=
:34:53<br>
+ -0800 (PST)<br>
+Received-SPF: pass (<a href=3D"http://google.com" rel=3D"noreferrer" targe=
t=3D"_blank">google.com</a>: domain of<br>
+ prvs=3D222760f524=3D<a href=3D"mailto:alejandro.delcastillo@ni.com" targe=
t=3D"_blank">alejandro.delcastillo@ni.com</a> designates 148.163.156.75 as<=
br>
+ permitted sender) client-ip=3D148.163.156.75;<br>
+Authentication-Results: <a href=3D"http://mx.google.com" rel=3D"noreferrer=
" target=3D"_blank">mx.google.com</a>; spf=3Dpass (<a href=3D"http://google=
.com" rel=3D"noreferrer" target=3D"_blank">google.com</a>: domain of<br>
+ prvs=3D222760f524=3D<a href=3D"mailto:alejandro.delcastillo@ni.com" targe=
t=3D"_blank">alejandro.delcastillo@ni.com</a> designates 148.163.156.75 as<=
br>
+ permitted sender)<br>
+ smtp.mailfrom=3D&quot;prvs=3D222760f524=3D<a href=3D"mailto:alejandro.del=
castillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&quot;; =
dmarc=3Dpass<br>
+ (p=3DNONE sp=3DNONE dis=3DNONE) header.from=3D<a href=3D"http://ni.com" r=
el=3D"noreferrer" target=3D"_blank">ni.com</a><br>
+Received: from pps.filterd (<a href=3D"http://m0098781.ppops.net" rel=3D"n=
oreferrer" target=3D"_blank">m0098781.ppops.net</a> [127.0.0.1]) by<br>
+ <a href=3D"http://mx0a-00010702.pphosted.com" rel=3D"noreferrer" target=
=3D"_blank">mx0a-00010702.pphosted.com</a> (<a href=3D"http://8.16.0.42/8.1=
6.0.42" rel=3D"noreferrer" target=3D"_blank">8.16.0.42/8.16.0.42</a>) with =
SMTP id<br>
+ xAKMRxBj018942; Wed, 20 Nov 2019 16:34:52 -0600<br>
+Received: from <a href=3D"http://ni.com" rel=3D"noreferrer" target=3D"_bla=
nk">ni.com</a> (<a href=3D"http://skprod3.natinst.com" rel=3D"noreferrer" t=
arget=3D"_blank">skprod3.natinst.com</a> [130.164.80.24])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0by <a href=3D"http://mx0a-00010702.pphosted.com=
" rel=3D"noreferrer" target=3D"_blank">mx0a-00010702.pphosted.com</a> with =
ESMTP id 2wae13ps20-1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(version=3DTLSv1.2 cipher=3DECDHE-RSA-AES256-GC=
M-SHA384 bits=3D256 verify=3DNOT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Wed, 20 Nov 2019 16:34:52 -0600<br>
+Received: from <a href=3D"http://us-aus-exch2.ni.corp.natinst.com" rel=3D"=
noreferrer" target=3D"_blank">us-aus-exch2.ni.corp.natinst.com</a><br>
+ (<a href=3D"http://us-aus-exch2.ni.corp.natinst.com" rel=3D"noreferrer" t=
arget=3D"_blank">us-aus-exch2.ni.corp.natinst.com</a> [130.164.68.12]) by<b=
r>
+ <a href=3D"http://us-aus-skprod3.natinst.com" rel=3D"noreferrer" target=
=3D"_blank">us-aus-skprod3.natinst.com</a> (<a href=3D"http://8.16.0.27/8.1=
6.0.27" rel=3D"noreferrer" target=3D"_blank">8.16.0.27/8.16.0.27</a>) with =
ESMTPS id<br>
+ xAKMYpHv003993 (version=3DTLSv1.2 cipher=3DECDHE-RSA-AES256-SHA384 bits=
=3D256<br>
+ verify=3DNOT); Wed, 20 Nov 2019 16:34:51 -0600<br>
+Received: from <a href=3D"http://us-aus-exhub1.ni.corp.natinst.com" rel=3D=
"noreferrer" target=3D"_blank">us-aus-exhub1.ni.corp.natinst.com</a> (130.1=
64.68.41) by<br>
+ <a href=3D"http://us-aus-exch2.ni.corp.natinst.com" rel=3D"noreferrer" ta=
rget=3D"_blank">us-aus-exch2.ni.corp.natinst.com</a> (130.164.68.12) with M=
icrosoft SMTP Server<br>
+ (TLS) id 15.0.1395.4; Wed, 20 Nov 2019 16:34:51 -0600<br>
+Received: from <a href=3D"http://delcastillo3.natinst.com" rel=3D"noreferr=
er" target=3D"_blank">delcastillo3.natinst.com</a> (172.18.68.32) by<br>
+ <a href=3D"http://us-aus-exhub1.ni.corp.natinst.com" rel=3D"noreferrer" t=
arget=3D"_blank">us-aus-exhub1.ni.corp.natinst.com</a> (130.164.68.41) with=
 Microsoft SMTP<br>
+ Server id 15.0.1395.4 via Frontend Transport; Wed, 20 Nov 2019 16:34:51<b=
r>
+ -0600<br>
+From: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delcastillo@n=
i.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
+To: &lt;<a href=3D"mailto:opkg-devel@googlegroups.com" target=3D"_blank">o=
pkg-devel@googlegroups.com</a>&gt;, &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
+CC: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delcastillo@ni.=
com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
+Subject: [opkg][PATCH 2/2] open_inner: add support for empty payloads<br>
+Date: Wed, 20 Nov 2019 16:34:48 -0600<br>
+Message-ID: &lt;<a href=3D"mailto:20191120223448.26522-3-alejandro.delcast=
illo@ni.com" target=3D"_blank">20191120223448.26522-3-alejandro.delcastillo=
@ni.com</a>&gt;<br>
+X-Mailer: git-send-email 2.22.0<br>
+In-Reply-To: &lt;<a href=3D"mailto:20191120223448.26522-1-alejandro.delcas=
tillo@ni.com" target=3D"_blank">20191120223448.26522-1-alejandro.delcastill=
o@ni.com</a>&gt;<br>
+References: &lt;<a href=3D"mailto:20191120223448.26522-1-alejandro.delcast=
illo@ni.com" target=3D"_blank">20191120223448.26522-1-alejandro.delcastillo=
@ni.com</a>&gt;<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain<br>
+X-Proofpoint-Virus-Version: vendor=3Dfsecure<br>
+ engine=3D2.50.10434:6.0.95,18.0.572<br>
+ definitions=3D2019-11-20_07:2019-11-20,2019-11-20 signatures=3D0<br>
+X-Proofpoint-Spam-Reason: safe<br>
+X-Virus-Scanned: clamav-milter 0.101.4 at dan<br>
+X-Virus-Status: Clean<br>
+X-Evolution-Source: 1525863794.3857.16@hex<br>
+Content-Transfer-Encoding: 8bit</blockquote><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">Perhaps this raw mail header can be removed it seems to add=
 no value moreover is distracting=C2=A0</div><div dir=3D"auto"><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex"><br>
+<br>
+Support for empty compressed payloads need to be explicitly enabled on<br>
+libarchive.<br>
+<br>
+Signed-off-by: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delc=
astillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
+<br>
+Upstream-Status: Backport<br>
+---<br>
+ libopkg/opkg_archive.c | 7 +++++++<br>
+ 1 file changed, 7 insertions(+)<br>
+<br>
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c<br>
+index 0e9ccea..f19cece 100644<br>
+--- a/libopkg/opkg_archive.c<br>
++++ b/libopkg/opkg_archive.c<br>
+@@ -618,6 +618,13 @@ static struct archive *open_inner(struct archive *out=
er)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_cleanup;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
++=C2=A0 =C2=A0 r =3D archive_read_support_format_empty(inner);<br>
++=C2=A0 =C2=A0 if (r !=3D ARCHIVE_OK) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 opkg_msg(ERROR, &quot;Empty format not suppor=
ted: %s\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0archive_err=
or_string(inner));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_cleanup;<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0 =C2=A0r =3D archive_read_open(inner, data, NULL, inner_read,=
 inner_close);<br>
+=C2=A0 =C2=A0 =C2=A0if (r !=3D ARCHIVE_OK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opkg_msg(ERROR, &quot;Failed to open inn=
er archive: %s\n&quot;,<br>
+-- <br>
+2.22.0<br>
+<br>
+<br>
diff --git a/meta/recipes-devtools/opkg/opkg/opkg_archive.patch b/meta/reci=
pes-devtools/opkg/opkg/opkg_archive.patch<br>
new file mode 100644<br>
index 00000000000..56a275a2342<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/opkg/opkg/opkg_archive.patch<br>
@@ -0,0 +1,160 @@<br>
+From <a href=3D"mailto:alejandro.delcastillo@ni.com" target=3D"_blank">ale=
jandro.delcastillo@ni.com</a> Wed Nov 20 22:35:01 2019<br>
+Return-Path: &lt;richard.purdie+caf_=3Drpurdie=3D<a href=3D"mailto:rpsys.n=
et@linuxfoundation.org" target=3D"_blank">rpsys.net@linuxfoundation.org</a>=
&gt;<br>
+X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on <a href=3D"http=
://dan.rpsys.net" rel=3D"noreferrer" target=3D"_blank">dan.rpsys.net</a><br=
>
+X-Spam-Level: <br>
+X-Spam-Status: No, score=3D-1.7 required=3D5.0 tests=3DBAYES_00,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NON=
E,RCVD_IN_MSPIKE_H2,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SPF_HELO_NONE,SPF_PASS autolearn=3Dno autolearn=
_force=3Dno version=3D3.4.2<br>
+Received: from <a href=3D"http://mail-ua1-f41.google.com" rel=3D"noreferre=
r" target=3D"_blank">mail-ua1-f41.google.com</a> (<a href=3D"http://mail-ua=
1-f41.google.com" rel=3D"noreferrer" target=3D"_blank">mail-ua1-f41.google.=
com</a><br>
+ [209.85.222.41]) by <a href=3D"http://dan.rpsys.net" rel=3D"noreferrer" t=
arget=3D"_blank">dan.rpsys.net</a> (8.15.2/8.15.2/Debian-10) with ESMTPS id=
<br>
+ xAKMZ0gk008395 (version=3DTLSv1.3 cipher=3DTLS_AES_128_GCM_SHA256 bits=3D=
128<br>
+ verify=3DNOT) for &lt;<a href=3D"mailto:rpurdie@rpsys.net" target=3D"_bla=
nk">rpurdie@rpsys.net</a>&gt;; Wed, 20 Nov 2019 22:35:01 GMT<br>
+Received: by <a href=3D"http://mail-ua1-f41.google.com" rel=3D"noreferrer"=
 target=3D"_blank">mail-ua1-f41.google.com</a> with SMTP id p18so339793uar.=
7<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for &lt;<a href=3D"mailto:rpurdie@rpsys.net" t=
arget=3D"_blank">rpurdie@rpsys.net</a>&gt;; Wed, 20 Nov 2019 14:35:01 -0800=
 (PST)<br>
+X-Google-DKIM-Signature: v=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3D<=
a href=3D"http://1e100.net" rel=3D"noreferrer" target=3D"_blank">1e100.net<=
/a>;<br>
+ s=3D20161025;<br>
+ h=3Dx-original-authentication-results:x-gm-message-state:delivered-to<br>
+ :from:to:cc:subject:date:message-id:in-reply-to:references<br>
+ :mime-version:content-transfer-encoding;<br>
+ bh=3DY9OOjY7NCD3Wm+XzvK+9TzmDhgbtPVQl7aMAusdzDho=3D;<br>
+ b=3DXjoAkiz0bsIvromNySMA4g4jfIJopfXAr8WYyCO5/I74DxBvUelc2e/2DyZYt5VYuW<br=
>
+ NaMD9rSCOk9gn+ld+INdJmH3ceuPGZm1Y4kgLVCTL7IknlPWjuJtWL599/8lrn4uhVWD<br>
+ cOwFsyu09EPjYvGzwjqxqf8Wca+HgymmDV/vor92kqu2trl8CsWC835pFG0a8/B4rAYH<br>
+ hOMhvqeU+UrkMe5iyIzB4L6nBX3Gwwgt8EI+W2mgWh6W8HwLfdrv9IOKWj00V98xU9Nn<br>
+ gUEGsCeQa1/bo5qYY1Z/w/lotR0vVJu6B+w/V/d/cniuciVnsEyfEQmBjebT8746mzz+ dTnw=
=3D=3D<br>
+X-Original-Authentication-Results: <a href=3D"http://mx.google.com" rel=3D=
"noreferrer" target=3D"_blank">mx.google.com</a>;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0spf=3Dpass<br>
+ (<a href=3D"http://google.com" rel=3D"noreferrer" target=3D"_blank">googl=
e.com</a>: domain of prvs=3D222760f524=3D<a href=3D"mailto:alejandro.delcas=
tillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a><br>
+ designates 148.163.156.75 as permitted sender)<br>
+ smtp.mailfrom=3D&quot;prvs=3D222760f524=3D<a href=3D"mailto:alejandro.del=
castillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&quot;;=
=C2=A0 =C2=A0 =C2=A0 <br>
+ dmarc=3Dpass (p=3DNONE sp=3DNONE dis=3DNONE) header.from=3D<a href=3D"htt=
p://ni.com" rel=3D"noreferrer" target=3D"_blank">ni.com</a><br>
+X-Gm-Message-State:<br>
+ APjAAAX1zcx9B1j4E7KLRgNh2OtNUmWztKYgWCXumfNL62Clsc75k1g+<br>
+ 8eUvzPiRBh6riiNx3HKjZJOp30ExyEMZgztnyB9JpBxhwfzt2ttNog=3D=3D<br>
+X-Received: by 2002:ab0:2618:: with SMTP id<br>
+ c24mr3345925uao.75.1574289294734; Wed, 20 Nov 2019 14:34:54 -0800 (PST)<b=
r>
+X-Forwarded-To: <a href=3D"mailto:rpurdie@rpsys.net" target=3D"_blank">rpu=
rdie@rpsys.net</a><br>
+X-Forwarded-For: <a href=3D"mailto:richard.purdie@linuxfoundation.org" tar=
get=3D"_blank">richard.purdie@linuxfoundation.org</a> <a href=3D"mailto:rpu=
rdie@rpsys.net" target=3D"_blank">rpurdie@rpsys.net</a><br>
+Delivered-To: <a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a><br>
+Received: by 2002:a67:ca9b:0:0:0:0:0 with SMTP id a27csp2232973vsl;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Wed, 20 Nov 2019 14:34:53 -0800 (PST)<br>
+X-Google-Smtp-Source:<br>
+ APXvYqyxMeKT9TRfjbvSZeBERtCkHKj+Y0dywybZSRWjh2KpKGAS3ujTon8MetFDJPz/XaV9C=
4CN<br>
+X-Received: by 2002:a17:902:8bc9:: with SMTP id<br>
+ r9mr4994639plo.319.1574289293016; Wed, 20 Nov 2019 14:34:53 -0800 (PST)<b=
r>
+ARC-Seal: i=3D1; a=3Drsa-sha256; t=3D1574289293; cv=3Dnone; d=3D<a href=3D=
"http://google.com" rel=3D"noreferrer" target=3D"_blank">google.com</a>;<br=
>
+ s=3Darc-20160816;<br>
+ b=3D04u3YSzfPN0+WkK0LLFKW07PbOQyk5T2b4rCKit5CG/Ec1pY+E6UTqRdu/fbhIJ2Xo<br=
>
+ qmpdqhcieKhtvY5kx+S28NLXszEPZcAIjNnXepU1qvTZXnCkNfXyJFSPGLDmLTGLEdUB<br>
+ TktdoM4IjNjOx4qwRnqdTdLV66cWGB7ojNTAih6qYb0t+2fgv70uiElgjxiTfhNTke22<br>
+ GaSyUo4vnzAekGOVPJwLqqS7gkElQro7NM2rlW2J3UEWyrMy0Gj4BuVFszxzAu8mazqT<br>
+ XtrsWLuzSGRjYA2EtNj8+62lABsaWuxPy5x/9VX8bblNZIu2GqaHC/AO0nQkDqf8cX9q TmiA=
=3D=3D<br>
+ARC-Message-Signature: i=3D1; a=3Drsa-sha256; c=3Drelaxed/relaxed; d=3D<a =
href=3D"http://google.com" rel=3D"noreferrer" target=3D"_blank">google.com<=
/a>;<br>
+ s=3Darc-20160816;<br>
+ h=3Dcontent-transfer-encoding:mime-version:references:in-reply-to<br>
+ :message-id:date:subject:cc:to:from;<br>
+ bh=3DY9OOjY7NCD3Wm+XzvK+9TzmDhgbtPVQl7aMAusdzDho=3D;<br>
+ b=3DmRussZx0Qx8Lxch1ZO1ZDWs4BKZNLsgzwIdr1z6rVp7/cI+CPBebzvrEPoqBji+ta6<br=
>
+ m1gpgsPum3Vg3JHHvFCNz/Pon4ygv4KIVSphBcgjti+2qnoRn48H4YvCirHZ4mDR6h3u<br>
+ rhl6Ojls0KI0YIiidpTRphIbS0vpBbkI/PUGkfVJzxQaEYuJa4TIQq2bmsrCImVwuBZs<br>
+ t2ktebY1vt+ZBKPVq43CsAiMl1Srr/50sBhOk5NFkiaBVDJQzIj1kI7bnU3zktBaGdOK<br>
+ 1jDpOoOnBV3SVe2M8eb38+Ge8AdL4jdMVGbdXfzXUWvF1eNgZRmkQVe1mRw4SwBnPsgs f64g=
=3D=3D<br>
+ARC-Authentication-Results: i=3D1; <a href=3D"http://mx.google.com" rel=3D=
"noreferrer" target=3D"_blank">mx.google.com</a>; spf=3Dpass (<a href=3D"ht=
tp://google.com" rel=3D"noreferrer" target=3D"_blank">google.com</a>:<br>
+ domain of prvs=3D222760f524=3D<a href=3D"mailto:alejandro.delcastillo@ni.=
com" target=3D"_blank">alejandro.delcastillo@ni.com</a> designates<br>
+ 148.163.156.75 as permitted sender)<br>
+ smtp.mailfrom=3D&quot;prvs=3D222760f524=3D<a href=3D"mailto:alejandro.del=
castillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&quot;; =
dmarc=3Dpass<br>
+ (p=3DNONE sp=3DNONE dis=3DNONE) header.from=3D<a href=3D"http://ni.com" r=
el=3D"noreferrer" target=3D"_blank">ni.com</a><br>
+Received: from <a href=3D"http://mx0b-00010702.pphosted.com" rel=3D"norefe=
rrer" target=3D"_blank">mx0b-00010702.pphosted.com</a> (<a href=3D"http://m=
x0a-00010702.pphosted.com" rel=3D"noreferrer" target=3D"_blank">mx0a-000107=
02.pphosted.com</a>.<br>
+ [148.163.156.75]) by <a href=3D"http://mx.google.com" rel=3D"noreferrer" =
target=3D"_blank">mx.google.com</a> with ESMTPS id<br>
+ 21si715567pgq.469.2019.11.20.14.34.52 for<br>
+ &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blan=
k">richard.purdie@linuxfoundation.org</a>&gt; (version=3DTLS1_2<br>
+ cipher=3DECDHE-RSA-AES128-GCM-SHA256 bits=3D128/128); Wed, 20 Nov 2019 14=
:34:53<br>
+ -0800 (PST)<br>
+Received-SPF: pass (<a href=3D"http://google.com" rel=3D"noreferrer" targe=
t=3D"_blank">google.com</a>: domain of<br>
+ prvs=3D222760f524=3D<a href=3D"mailto:alejandro.delcastillo@ni.com" targe=
t=3D"_blank">alejandro.delcastillo@ni.com</a> designates 148.163.156.75 as<=
br>
+ permitted sender) client-ip=3D148.163.156.75;<br>
+Authentication-Results: <a href=3D"http://mx.google.com" rel=3D"noreferrer=
" target=3D"_blank">mx.google.com</a>; spf=3Dpass (<a href=3D"http://google=
.com" rel=3D"noreferrer" target=3D"_blank">google.com</a>: domain of<br>
+ prvs=3D222760f524=3D<a href=3D"mailto:alejandro.delcastillo@ni.com" targe=
t=3D"_blank">alejandro.delcastillo@ni.com</a> designates 148.163.156.75 as<=
br>
+ permitted sender)<br>
+ smtp.mailfrom=3D&quot;prvs=3D222760f524=3D<a href=3D"mailto:alejandro.del=
castillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&quot;; =
dmarc=3Dpass<br>
+ (p=3DNONE sp=3DNONE dis=3DNONE) header.from=3D<a href=3D"http://ni.com" r=
el=3D"noreferrer" target=3D"_blank">ni.com</a><br>
+Received: from pps.filterd (<a href=3D"http://m0098780.ppops.net" rel=3D"n=
oreferrer" target=3D"_blank">m0098780.ppops.net</a> [127.0.0.1]) by<br>
+ <a href=3D"http://mx0a-00010702.pphosted.com" rel=3D"noreferrer" target=
=3D"_blank">mx0a-00010702.pphosted.com</a> (<a href=3D"http://8.16.0.42/8.1=
6.0.42" rel=3D"noreferrer" target=3D"_blank">8.16.0.42/8.16.0.42</a>) with =
SMTP id<br>
+ xAKMSIJ5016740; Wed, 20 Nov 2019 16:34:52 -0600<br>
+Received: from <a href=3D"http://ni.com" rel=3D"noreferrer" target=3D"_bla=
nk">ni.com</a> (<a href=3D"http://skprod3.natinst.com" rel=3D"noreferrer" t=
arget=3D"_blank">skprod3.natinst.com</a> [130.164.80.24])<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0by <a href=3D"http://mx0a-00010702.pphosted.com=
" rel=3D"noreferrer" target=3D"_blank">mx0a-00010702.pphosted.com</a> with =
ESMTP id 2wafh16muy-1<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0(version=3DTLSv1.2 cipher=3DECDHE-RSA-AES256-GC=
M-SHA384 bits=3D256 verify=3DNOT);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0Wed, 20 Nov 2019 16:34:52 -0600<br>
+Received: from <a href=3D"http://us-aus-exch2.ni.corp.natinst.com" rel=3D"=
noreferrer" target=3D"_blank">us-aus-exch2.ni.corp.natinst.com</a><br>
+ (<a href=3D"http://us-aus-exch2.ni.corp.natinst.com" rel=3D"noreferrer" t=
arget=3D"_blank">us-aus-exch2.ni.corp.natinst.com</a> [130.164.68.12]) by<b=
r>
+ <a href=3D"http://us-aus-skprod3.natinst.com" rel=3D"noreferrer" target=
=3D"_blank">us-aus-skprod3.natinst.com</a> (<a href=3D"http://8.16.0.27/8.1=
6.0.27" rel=3D"noreferrer" target=3D"_blank">8.16.0.27/8.16.0.27</a>) with =
ESMTPS id<br>
+ xAKMYpHw003993 (version=3DTLSv1.2 cipher=3DECDHE-RSA-AES256-SHA384 bits=
=3D256<br>
+ verify=3DNOT); Wed, 20 Nov 2019 16:34:51 -0600<br>
+Received: from <a href=3D"http://us-aus-exch5.ni.corp.natinst.com" rel=3D"=
noreferrer" target=3D"_blank">us-aus-exch5.ni.corp.natinst.com</a> (130.164=
.68.15) by<br>
+ <a href=3D"http://us-aus-exch2.ni.corp.natinst.com" rel=3D"noreferrer" ta=
rget=3D"_blank">us-aus-exch2.ni.corp.natinst.com</a> (130.164.68.12) with M=
icrosoft SMTP Server<br>
+ (TLS) id 15.0.1395.4; Wed, 20 Nov 2019 16:34:51 -0600<br>
+Received: from <a href=3D"http://us-aus-exhub1.ni.corp.natinst.com" rel=3D=
"noreferrer" target=3D"_blank">us-aus-exhub1.ni.corp.natinst.com</a> (130.1=
64.68.41) by<br>
+ <a href=3D"http://us-aus-exch5.ni.corp.natinst.com" rel=3D"noreferrer" ta=
rget=3D"_blank">us-aus-exch5.ni.corp.natinst.com</a> (130.164.68.15) with M=
icrosoft SMTP Server<br>
+ (TLS) id 15.0.1395.4; Wed, 20 Nov 2019 16:34:50 -0600<br>
+Received: from <a href=3D"http://delcastillo3.natinst.com" rel=3D"noreferr=
er" target=3D"_blank">delcastillo3.natinst.com</a> (172.18.68.32) by<br>
+ <a href=3D"http://us-aus-exhub1.ni.corp.natinst.com" rel=3D"noreferrer" t=
arget=3D"_blank">us-aus-exhub1.ni.corp.natinst.com</a> (130.164.68.41) with=
 Microsoft SMTP<br>
+ Server id 15.0.1395.4 via Frontend Transport; Wed, 20 Nov 2019 16:34:50<b=
r>
+ -0600<br>
+From: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delcastillo@n=
i.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
+To: &lt;<a href=3D"mailto:opkg-devel@googlegroups.com" target=3D"_blank">o=
pkg-devel@googlegroups.com</a>&gt;, &lt;<a href=3D"mailto:richard.purdie@li=
nuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>=
&gt;<br>
+CC: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delcastillo@ni.=
com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
+Subject: [opkg][PATCH 1/2] opkg_archive.c: avoid double free on uncompress=
<br>
+ error<br>
+Date: Wed, 20 Nov 2019 16:34:47 -0600<br>
+Message-ID: &lt;<a href=3D"mailto:20191120223448.26522-2-alejandro.delcast=
illo@ni.com" target=3D"_blank">20191120223448.26522-2-alejandro.delcastillo=
@ni.com</a>&gt;<br>
+X-Mailer: git-send-email 2.22.0<br>
+In-Reply-To: &lt;<a href=3D"mailto:20191120223448.26522-1-alejandro.delcas=
tillo@ni.com" target=3D"_blank">20191120223448.26522-1-alejandro.delcastill=
o@ni.com</a>&gt;<br>
+References: &lt;<a href=3D"mailto:20191120223448.26522-1-alejandro.delcast=
illo@ni.com" target=3D"_blank">20191120223448.26522-1-alejandro.delcastillo=
@ni.com</a>&gt;<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain<br>
+X-Proofpoint-Virus-Version: vendor=3Dfsecure<br>
+ engine=3D2.50.10434:6.0.95,18.0.572<br>
+ definitions=3D2019-11-20_07:2019-11-20,2019-11-20 signatures=3D0<br>
+X-Proofpoint-Spam-Reason: safe<br>
+X-Virus-Scanned: clamav-milter 0.101.4 at dan<br>
+X-Virus-Status: Clean<br>
+X-Evolution-Source: 1525863794.3857.16@hex<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+The open-inner function calls archive_read_open. On error,<br>
+archive_read_open calls inner_close, which also closes the outter<br>
+archive. On error, return NULL directly to avoid double free.<br>
+<br>
+<br>
+Upstream-Status: Backport<br>
+<br>
+Signed-off-by: Alejandro del Castillo &lt;<a href=3D"mailto:alejandro.delc=
astillo@ni.com" target=3D"_blank">alejandro.delcastillo@ni.com</a>&gt;<br>
+---<br>
+ libopkg/opkg_archive.c | 4 ++--<br>
+ 1 file changed, 2 insertions(+), 2 deletions(-)<br>
+<br>
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c<br>
+index 3d87db1..0e9ccea 100644<br>
+--- a/libopkg/opkg_archive.c<br>
++++ b/libopkg/opkg_archive.c<br>
+@@ -622,7 +622,7 @@ static struct archive *open_inner(struct archive *oute=
r)<br>
+=C2=A0 =C2=A0 =C2=A0if (r !=3D ARCHIVE_OK) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opkg_msg(ERROR, &quot;Failed to open inn=
er archive: %s\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 archive_err=
or_string(inner));<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_cleanup;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0return inner;<br>
+@@ -683,7 +683,7 @@ static struct archive *extract_outer(const char *filen=
ame, const char *arname)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0inner =3D open_inner(outer);<br>
+=C2=A0 =C2=A0 =C2=A0if (!inner)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_cleanup;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0return inner;<br>
+ <br>
+-- <br>
+2.22.0<br>
+<br>
+<br>
diff --git a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.1.bb" re=
l=3D"noreferrer" target=3D"_blank">opkg_0.4.1.bb</a> b/meta/recipes-devtool=
s/opkg/<a href=3D"http://opkg_0.4.1.bb" rel=3D"noreferrer" target=3D"_blank=
">opkg_0.4.1.bb</a><br>
index 149ee3ca190..f0ae8b36bd1 100644<br>
--- a/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.1.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.4.1.bb</a><br>
+++ b/meta/recipes-devtools/opkg/<a href=3D"http://opkg_0.4.1.bb" rel=3D"no=
referrer" target=3D"_blank">opkg_0.4.1.bb</a><br>
@@ -14,6 +14,8 @@ PE =3D &quot;1&quot;<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://downloads.yoctoproject.org/releas=
es/$%7BBPN%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_bl=
ank">http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV}.tar.gz<=
/a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://opkg.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-opkg_conf-create-opkg=
.lock-in-run-instead-of-var-run.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://opkg_archive.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://open_inner.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--0000000000009cf1150597e47b99--
