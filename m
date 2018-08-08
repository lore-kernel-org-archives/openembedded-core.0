Return-Path: <akuster808@gmail.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id A9DF978D2D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 16:40:59 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id w126-v6so4827549oie.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 09:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=aEGxIejGgt9Zl80EJV5V2mtyVUNdjZD3IgQrThKs3Ws=;
	b=kQV1EirAmiqECDtv2gpwRWywi21UGKUKc/l9BxpuwSb6ZWqGXMS+je+EqdoHYiGLY7
	B/jVD4QrY/mng/9GMUaAWWKpS65hqwdboFobRVRuevLdiF9phz4mEG0lMMJK0kmABkmq
	uoEw1ksvn+TaIY58WX60qz0urPJsxtce+HUW8rqwDZhzK/XV7RY0n4chGvSGujPsC0/b
	TFgXA8fBi6MUN30dQD2QGKfF0q0v4GBFXaG+NI8XdaCKBqwf8ZFkEoJC9sjVwdmoIVT8
	p8Ewf+bCOUAoHgxkV5wYxC44Sdi3FOLE6md6J63O0rTa0VF9WsIjNXfBBQWf/AEUxGE8
	u4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=aEGxIejGgt9Zl80EJV5V2mtyVUNdjZD3IgQrThKs3Ws=;
	b=i06XjKssI0MWM4s2SnWDzRkQav77itWKhYHgVWhO7t5Q8qUv2h6Z6JgMxDoiHdfANP
	191OIIGNmLTnarclJ9HoBn9MGtpgt7E2MJGy3QdkF4qc5ChloB3m7vFUTHSXhXJwYUIo
	1QoAcuk7TBujJEtrMqZcK7Adz8HaIbSlHURUQmXp8T+WE571GjZFDVNEq7b5ormUG+RQ
	SlpYAyUgJzqHmxVqFst5OZUJEZX3Z5d/mqmVu15iPAzmkG0QfiVvSegfaZrGUE8hkQnJ
	x/j8bp4aVWfWrkrrsZViXNoMIV8qDEYx9XbBaTWP61QFoXooovHX+PmJUuv+6lnMqKBk
	hmQA==
X-Gm-Message-State: AOUpUlE4nwU/hegMiNl3lhg266k7tGYRkoGVTrgDkZT171TFnn/scfiP
	GI95fZggKxLar/ciDo8ZH8fuu0QA
X-Google-Smtp-Source: AA+uWPyc1C05/8B0btJlrZB0MPTmNrlgF2ln0mSw7F3X5ZRA5yU/5/Wf08BgQTEAZHjwDbf9KrTEyQ==
X-Received: by 2002:aca:ebd8:: with SMTP id
	j207-v6mr3810710oih.206.1533746460377; 
	Wed, 08 Aug 2018 09:41:00 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:7d5f:b84e:a37e:2b6c?
	([2601:202:4180:c33:7d5f:b84e:a37e:2b6c])
	by smtp.gmail.com with ESMTPSA id
	p132-v6sm3228041oia.31.2018.08.08.09.40.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 09:40:58 -0700 (PDT)
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <686caf58-2165-22ca-16cf-a0de761b4820@gmail.com>
Date: Wed, 8 Aug 2018 09:40:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1533742522-24357-1-git-send-email-akuster808@gmail.com>
Subject: Re: [ROCKO][PATCH 01/27] binutils: Security fix CVE-2017-12967
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
X-List-Received-Date: Wed, 08 Aug 2018 16:40:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 08/08/2018 08:34 AM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> affects: <= 2.29.1
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>

This one is really CVE-2017-17124 so it will be renamed in V2

CVE-2017-12967 is already in 2.29.1

> ---
>  meta/recipes-devtools/binutils/binutils-2.29.1.inc |  1 +
>  .../binutils/binutils/CVE-2017-12967.patch         | 47 ++++++++++++++++++++++
>  2 files changed, 48 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-12967.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.29.1.inc b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
> index b29b75a..12b579c 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.29.1.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.29.1.inc
> @@ -35,6 +35,7 @@ SRC_URI = "\
>       file://0013-fix-the-incorrect-assembling-for-ppc-wait-mnemonic.patch \
>       file://0014-Detect-64-bit-MIPS-targets.patch \
>       file://0015-sync-with-OE-libtool-changes.patch \
> +     file://CVE-2017-12967.patch \
>  "
>  S  = "${WORKDIR}/git"
>  
> diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-12967.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-12967.patch
> new file mode 100644
> index 0000000..ab19d21
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-12967.patch
> @@ -0,0 +1,47 @@
> +From b0029dce6867de1a2828293177b0e030d2f0f03c Mon Sep 17 00:00:00 2001
> +From: Nick Clifton <nickc@redhat.com>
> +Date: Tue, 28 Nov 2017 18:00:29 +0000
> +Subject: [PATCH] Prevent a memory exhaustion problem when trying to read in
> + strings from a COFF binary with a corrupt string table size.
> +
> +	PR 22507
> +	* coffgen.c (_bfd_coff_read_string_table): Check for an excessive
> +	size of the external string table.
> +
> +Upstream-Status: backport
> +Affects binutls <= 2.29.1
> +CVE:  CVE-2017-12967 
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
> +---
> + bfd/ChangeLog | 6 ++++++
> + bfd/coffgen.c | 4 ++--
> + 2 files changed, 8 insertions(+), 2 deletions(-)
> +
> +Index: git/bfd/coffgen.c
> +===================================================================
> +--- git.orig/bfd/coffgen.c
> ++++ git/bfd/coffgen.c
> +@@ -1709,7 +1709,7 @@ _bfd_coff_read_string_table (bfd *abfd)
> + #endif
> +     }
> + 
> +-  if (strsize < STRING_SIZE_SIZE)
> ++  if (strsize < STRING_SIZE_SIZE || strsize > bfd_get_file_size (abfd))
> +     {
> +       _bfd_error_handler
> + 	/* xgettext: c-format */
> +Index: git/bfd/ChangeLog
> +===================================================================
> +--- git.orig/bfd/ChangeLog
> ++++ git/bfd/ChangeLog
> +@@ -1,3 +1,9 @@
> ++2017-11-28  Nick Clifton  <nickc@redhat.com>
> ++
> ++       PR 22507
> ++       * coffgen.c (_bfd_coff_read_string_table): Check for an excessive
> ++       size of the external string table.
> ++
> + 2018-03-28  Eric Botcazou  <ebotcazou@adacore.com>
> + 
> + 	PR ld/22972


