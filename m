Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id F10927965B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 13:08:13 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 13-v6so20413223ois.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2018 06:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mUTaDQ3hwxrJV58ccplKia4o/FSO5uRxEp7udOFydVA=;
	b=Zo2UX2EFuoM7haiJ+YJ8ggVolLYNo6Cwxzdb1AvTABuacRa20nPzKhv4SCW84PQZ0D
	cGV3w5SJNkX8xqiMoYs5P102HdpNC7N0TKYNl3JqNwI7nbLcJsT2OUNkOj8q3b4MjsgE
	6Xf420HrxbaMDOdh0SolNROImutmDoY3WJNJI2cgZJROk8BV7Wn89csRwUhuE4HS1SqE
	UD5e/dRGfUBMQvPJ5WyunbPQMq+qJmeijaFYWtf6hHMsH921Xrr90NtjFvOSFm2vQ34G
	azzpSyBRlxoIch9/uJiMPoZhMAFe/zTm93NiTB6RH1jfM7hmh7Y3xCL6YDkRVxgAhzBo
	CgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mUTaDQ3hwxrJV58ccplKia4o/FSO5uRxEp7udOFydVA=;
	b=EX/6hd9YABBZLHQ0jYUtOaIWJ0G2oXSQ5Az7NlHBLaxUmLsTuogyspb3DrVSVnGamG
	G6JeYvcdGXh7uIloGrM9zv+T+7c9bPIikEAkKxGZXQPofcyZ0nhDrcpbEQ9NI7p6VuVJ
	bFH9FhrXxwiYAyXgv5zxtup4DXX5F3JnlPcskdogfySTIVFsfJ3uL7LHvizeCipVTokR
	Cs8PS8roQ/w/Zg9j6X8azagLTCOvJ0l4xia6WdrjyGbzgCp/H4KcAZtn14Fr9RxpRoJV
	fT/+tOIO5GCiqsE4gm+O59vtgumWDoWZnlsqkBZdFgnOjQMQsTxRQftIwHFwZtMT3rME
	gadw==
X-Gm-Message-State: APzg51Bod2na7twc4IwutpFCzHpzmabIQaQFR4Kk1gBslH+2YduKfovB
	1o+50Ua4HEoFeSvy6D/GdT6XWGpEAIIyAnoLfEcpfw==
X-Google-Smtp-Source: ANB0VdaPfqNgRrT+wPIYr6JwF7nxJicTdKrAGF0uHVfTW5EmTX2PMCqtgwGJkrbPL1AM6w58+6HWc2ZBVdRHBTdQeXY=
X-Received: by 2002:aca:6a48:: with SMTP id
	f69-v6mr2645891oic.279.1536239294874; 
	Thu, 06 Sep 2018 06:08:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:385d:0:0:0:0:0 with HTTP;
	Thu, 6 Sep 2018 06:07:54 -0700 (PDT)
In-Reply-To: <3ad79c14cede673c5e42a24ee5d50866f3cee092.1536212473.git.raj.khem@gmail.com>
References: <cover.1536212473.git.raj.khem@gmail.com>
	<3ad79c14cede673c5e42a24ee5d50866f3cee092.1536212473.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Sep 2018 14:07:54 +0100
Message-ID: <CAJTo0LaQWkmo_X7L-BG36BukRC+mOk56dYdBk82Y69BBt_RU2w@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] gdb: Update to 8.2
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
X-List-Received-Date: Thu, 06 Sep 2018 13:08:14 -0000
Content-Type: text/plain; charset="UTF-8"

On 6 September 2018 at 06:42, Khem Raj <raj.khem@gmail.com> wrote:
> --- a/meta/recipes-devtools/gdb/gdb-8.1.1.inc
> +++ b/meta/recipes-devtools/gdb/gdb-8.2.inc
> @@ -15,9 +15,6 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
>             file://0008-Use-exorted-definitions-of-SIGRTMIN.patch \
>             file://0009-Change-order-of-CFLAGS.patch \
>             file://0010-resolve-restrict-keyword-conflict.patch \
> -           file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
> -           file://gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch \
> +           file://0011-Fix-invalid-sigprocmask-call.patch \
>  "
> -SRC_URI[md5sum] = "372fa63a53adeee1bfbfd581d8da9e34"
> -SRC_URI[sha256sum] = "97dcc3169bd430270fc29adb65145846a58c1b55cdbb73382a4a89307bdad03c"

The checksums disappeared.

Ross

