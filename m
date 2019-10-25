Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id E42FD7FA34
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 15:02:29 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id n7so2496516wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Oct 2019 08:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=30wMtsfEuEV7BZ7K5DdWqrv4MU5HhJkyBc1/jgpkXhc=;
	b=jVtPsRQWQ062JKP/00ofq0NXOZZw1jmLB4ZdHNkyOKGSb3WRwOix56LOrvjRJt+Wa4
	wPQF7LakKrwhgpnmcFw/fIEmjOjEp7Q3iy8lj365ii0yCaN7II6juATrTEbPJ8aAkcq1
	Z3OiseQYwapCJEu73ipFaMu11amo+dvK4duxHsesmKtVXTCV5d/YlGD33pRSNXZiqHt+
	u7XBGdffG7e2QDTaeQxeENHXrUsEieOH1tTpCmTx0RCFfu2zJL2GzgDFfEnEXh5rw8xe
	4Bdz6AA1cDjJarjBYnbdR28T+PTn3mVX0DdR/2UJfpdaAbYfqdX1XxvB4ifLayY+8plr
	uL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=30wMtsfEuEV7BZ7K5DdWqrv4MU5HhJkyBc1/jgpkXhc=;
	b=VDN89ZxC5+HUQKZBHg6m56xSu4UixurUN7pfEgeQs76SIVpkT42WNhrr00EgED7t3g
	eN8p0PlD2WfwC5nnF0po9U4FldxACSWlKRxkvqWM+0pR9pDbcC+1v5Pq9Migerkzd1MN
	4mOi136GWxXBly6wqiw4IbshreO1hvuW8jBtNQEAQAjoxAaulEir3YgUYBUkxBopsz5P
	PISuTUwLavLiz8ZTnQMk4FPItLWxoGYJ7TmRCvfDl0BLhGmUTCaTDnKTMKFgYuWFIsPj
	I/M/KmwgDq49rgxCvR37+8MIcQEY8H+CpTFnZq6pmseAMzTw8KAuQXCpegAKj1ZD6gsS
	OrVA==
X-Gm-Message-State: APjAAAXJ8DNOwWzledCrxHwlWPgADA7omx/GqBtD5iPW4iMO4QNrozrS
	IB4nDebnjBP/4+5sHeecQwW9gudSwIo=
X-Google-Smtp-Source: APXvYqyCpaDZnhSViSjTOEr+sBbJ37wuCHTLL92LtuDsARXBBYax5D0vjhgKlJNcZ9e+hRBcDVPclQ==
X-Received: by 2002:a7b:cc01:: with SMTP id f1mr4201316wmh.113.1572015749854; 
	Fri, 25 Oct 2019 08:02:29 -0700 (PDT)
Received: from [172.16.50.42] ([82.3.55.76]) by smtp.gmail.com with ESMTPSA id
	w17sm2607968wra.34.2019.10.25.08.02.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 25 Oct 2019 08:02:29 -0700 (PDT)
To: Trevor Gamblin <trevor.gamblin@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20191025122212.25687-1-trevor.gamblin@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <cf553688-0f48-33ae-8c4c-18c7c34a5971@gmail.com>
Date: Fri, 25 Oct 2019 08:02:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191025122212.25687-1-trevor.gamblin@windriver.com>
Subject: Re: [zeus][PATCH v3] binutils: fix CVE-2019-17450
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
X-List-Received-Date: Fri, 25 Oct 2019 15:02:30 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 10/25/19 5:22 AM, Trevor Gamblin wrote:
> Backport upstream fix to zeus.
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Does this affect Master?

- armin
> ---
>  .../binutils/binutils-2.32.inc                |  1 +
>  .../binutils/binutils/CVE-2019-17450.patch    | 99 +++++++++++++++++++
>  2 files changed, 100 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
> index 19baf8a883..1e96cf494d 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.32.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
> @@ -49,6 +49,7 @@ SRC_URI = "\
>       file://CVE-2019-12972.patch \
>       file://CVE-2019-14250.patch \
>       file://CVE-2019-14444.patch \
> +     file://CVE-2019-17450.patch \
>  "
>  S  = "${WORKDIR}/git"
>  
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
> new file mode 100644
> index 0000000000..a6ce0b9a8a
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
> @@ -0,0 +1,99 @@
> +From 09dd135df9ebc7a4b640537e23e26a03a288a789 Mon Sep 17 00:00:00 2001
> +From: Alan Modra <amodra@gmail.com>
> +Date: Wed, 9 Oct 2019 00:07:29 +1030
> +Subject: [PATCH] PR25078, stack overflow in function find_abstract_instance
> +
> +Selectively backporting fix for bfd/dwarf2.c, but not the ChangeLog
> +file. There are newer versions of binutils, but none of them contain the
> +commit fixing CVE-2019-17450, so backport it to master and zeus.
> +
> +Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=063c511bd79]
> +CVE: CVE-2019-17450
> +Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> +
> +	PR 25078
> +	* dwarf2.c (find_abstract_instance): Delete orig_info_ptr, add
> +	recur_count.  Error on recur_count reaching 100 rather than
> +	info_ptr matching orig_info_ptr.  Adjust calls.
> +
> +---
> + bfd/dwarf2.c | 35 +++++++++++++++++------------------
> + 1 file changed, 17 insertions(+), 18 deletions(-)
> +
> +diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
> +index 0b4e485582..20ec9e2e56 100644
> +--- a/bfd/dwarf2.c
> ++++ b/bfd/dwarf2.c
> +@@ -2803,13 +2803,13 @@ lookup_symbol_in_variable_table (struct comp_unit *unit,
> + }
> + 
> + static bfd_boolean
> +-find_abstract_instance (struct comp_unit *   unit,
> +-			bfd_byte *           orig_info_ptr,
> +-			struct attribute *   attr_ptr,
> +-			const char **        pname,
> +-			bfd_boolean *        is_linkage,
> +-			char **              filename_ptr,
> +-			int *                linenumber_ptr)
> ++find_abstract_instance (struct comp_unit *unit,
> ++			struct attribute *attr_ptr,
> ++			unsigned int recur_count,
> ++			const char **pname,
> ++			bfd_boolean *is_linkage,
> ++			char **filename_ptr,
> ++			int *linenumber_ptr)
> + {
> +   bfd *abfd = unit->abfd;
> +   bfd_byte *info_ptr;
> +@@ -2820,6 +2820,14 @@ find_abstract_instance (struct comp_unit *   unit,
> +   struct attribute attr;
> +   const char *name = NULL;
> + 
> ++  if (recur_count == 100)
> ++    {
> ++      _bfd_error_handler
> ++	(_("DWARF error: abstract instance recursion detected"));
> ++      bfd_set_error (bfd_error_bad_value);
> ++      return FALSE;
> ++    }
> ++
> +   /* DW_FORM_ref_addr can reference an entry in a different CU. It
> +      is an offset from the .debug_info section, not the current CU.  */
> +   if (attr_ptr->form == DW_FORM_ref_addr)
> +@@ -2939,15 +2947,6 @@ find_abstract_instance (struct comp_unit *   unit,
> + 					 info_ptr, info_ptr_end);
> + 	      if (info_ptr == NULL)
> + 		break;
> +-	      /* It doesn't ever make sense for DW_AT_specification to
> +-		 refer to the same DIE.  Stop simple recursion.  */
> +-	      if (info_ptr == orig_info_ptr)
> +-		{
> +-		  _bfd_error_handler
> +-		    (_("DWARF error: abstract instance recursion detected"));
> +-		  bfd_set_error (bfd_error_bad_value);
> +-		  return FALSE;
> +-		}
> + 	      switch (attr.name)
> + 		{
> + 		case DW_AT_name:
> +@@ -2961,7 +2960,7 @@ find_abstract_instance (struct comp_unit *   unit,
> + 		    }
> + 		  break;
> + 		case DW_AT_specification:
> +-		  if (!find_abstract_instance (unit, info_ptr, &attr,
> ++		  if (!find_abstract_instance (unit, &attr, recur_count + 1,
> + 					       &name, is_linkage,
> + 					       filename_ptr, linenumber_ptr))
> + 		    return FALSE;
> +@@ -3175,7 +3174,7 @@ scan_unit_for_symbols (struct comp_unit *unit)
> + 
> + 		case DW_AT_abstract_origin:
> + 		case DW_AT_specification:
> +-		  if (!find_abstract_instance (unit, info_ptr, &attr,
> ++		  if (!find_abstract_instance (unit, &attr, 0,
> + 					       &func->name,
> + 					       &func->is_linkage,
> + 					       &func->file,
> +-- 
> +2.23.0
> +


