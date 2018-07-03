Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id C2C7F78A00
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 09:42:31 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id n84-v6so2494060oib.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 02:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2kHIV65GDMtWSn2gHV31iZtR7o4dBMR95FIFkoTM26Q=;
	b=iIfRvF5h6lze1HXON8+JknfD0QomIJlbuJeBZpyLHw8gpQYW1SLKpUgECYf4eL2NCb
	KQBVs36r/+9mjkQdYeVSLpN6tiFfYDakEBMadN/up60QhBjR+GEgU/UV62OrfgSnOCoo
	Zo0QUn2MnWWEuLbpDXndSDACTSIAp6GkwtRxznhtFvv7Wb8Er5UilWGAMQhuTMKRxWyc
	YBhxDVWAj4VtDHrmVG/jPpU4Z210JqoBt2cQ0Ggb4L1pYPVQb2gdbd1P6bOa1/DnbuQK
	NffolkVfL+dsAE0CtJmnpxkinBUEPc5ojMcU0HNIaElXySXGx850yJF+DjuBxodMDjcx
	o3HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2kHIV65GDMtWSn2gHV31iZtR7o4dBMR95FIFkoTM26Q=;
	b=gJv8x46Lq90U8cFJOfceDjTiTJsUlstGJi7fgjaPx7W6LIbu6GKpZ5bciUutKTWuvX
	Jm21InnaEzVYJglGPUNC/2FBsr5XOgZZWWIuXVE950BgB1KmHRmy2jNW/t5zf29HkVNG
	Vj7zTeg28ZdfiblUd96TxcZ48hFSEW1zazOwv/5Nuln33lQHF0CB33o3sQB1RQU68Zgj
	pf3joNGfAsTsh/YmppeZhPp8nXbhzC3W3z4jpg+OndC2mXoImF339Dinf6MUtP0yKExD
	bQCSA6mQiyGXs9TCoIAmJdrzoMGyQTIt2vdCjGvvX8zNrAuRlOzcvUa0Ph9ulzoVAV4h
	NhZQ==
X-Gm-Message-State: APt69E2ki+WITRUddnh1GgRhTZNnUs2p0dP9IHMtwJLfr2RvuAuv6dL9
	dc9zbpKpzDaMl7U4mIihmrO3jGG8c7mb9ahmZHkXFw==
X-Google-Smtp-Source: AAOMgpd8Ih/oOB1eUNyajniJtPJzDh0iIO50FBMBN2JkI2qhta2wxXfa5gWBBdbEoZtY4i1fjHfmP1GcPReTrF7iqj8=
X-Received: by 2002:aca:f409:: with SMTP id
	s9-v6mr21092119oih.102.1530610953048; 
	Tue, 03 Jul 2018 02:42:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:434d:0:0:0:0:0 with HTTP;
	Tue, 3 Jul 2018 02:42:12 -0700 (PDT)
In-Reply-To: <1530605412-17668-1-git-send-email-hongxu.jia@windriver.com>
References: <1530605412-17668-1-git-send-email-hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 3 Jul 2018 10:42:12 +0100
Message-ID: <CAJTo0LYmJBomuBJ0LGxYy-5UpArmnXbx1dOakozAQZi8H+jHDA@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libxml2: fix CVE-2017-8872
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
X-List-Received-Date: Tue, 03 Jul 2018 09:42:33 -0000
Content-Type: text/plain; charset="UTF-8"

This isn't a backport, it's just a patch that is in bugzilla so should
be marked as Submitted.

Ross



On 3 July 2018 at 09:10, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> The htmlParseTryOrFinish function in HTMLparser.c in libxml2 2.9.4
> allows attackers to cause a denial of service (buffer over-read) or
> information disclosure.
>
> https://bugzilla.gnome.org/show_bug.cgi?id=775200
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../libxml/libxml2/fix-CVE-2017-8872.patch         | 38 ++++++++++++++++++++++
>  meta/recipes-core/libxml/libxml2_2.9.8.bb          |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch
>
> diff --git a/meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch b/meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch
> new file mode 100644
> index 0000000..e34a48e
> --- /dev/null
> +++ b/meta/recipes-core/libxml/libxml2/fix-CVE-2017-8872.patch
> @@ -0,0 +1,38 @@
> +From b4bee17b158e289e5c4c9045e64e5374ccafe068 Mon Sep 17 00:00:00 2001
> +From: Salvatore Bonaccorso <carnil@debian.org>
> +Date: Tue, 3 Jul 2018 15:54:03 +0800
> +Subject: [PATCH] Out-of-bounds read in htmlParseTryOrFinish (CVE-2017-8872)
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=775200
> +Fixes bug 775200.
> +
> +Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
> +
> +Upstream-Status: Backport
> +https://bug775200.bugzilla-attachments.gnome.org/attachment.cgi?id=366193
> +CVE: CVE-2017-8872
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + parser.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/parser.c b/parser.c
> +index ca9fde2..fb4c889 100644
> +--- a/parser.c
> ++++ b/parser.c
> +@@ -12464,7 +12464,11 @@ xmlHaltParser(xmlParserCtxtPtr ctxt) {
> +       }
> +       ctxt->input->cur = BAD_CAST"";
> +       ctxt->input->base = ctxt->input->cur;
> +-        ctxt->input->end = ctxt->input->cur;
> ++      ctxt->input->end = ctxt->input->cur;
> ++      if (ctxt->input->buf)
> ++          xmlBufEmpty (ctxt->input->buf->buffer);
> ++      else
> ++          ctxt->input->length = 0;
> +     }
> + }
> +
> +--
> +2.7.4
> +
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.8.bb b/meta/recipes-core/libxml/libxml2_2.9.8.bb
> index d55e650..1f22bb0 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.8.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.8.bb
> @@ -20,6 +20,7 @@ SRC_URI = "http://www.xmlsoft.org/sources/libxml2-${PV}.tar.gz;name=libtar \
>             file://libxml-m4-use-pkgconfig.patch \
>             file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
>             file://fix-execution-of-ptests.patch \
> +           file://fix-CVE-2017-8872.patch \
>             "
>
>  SRC_URI[libtar.md5sum] = "b786e353e2aa1b872d70d5d1ca0c740d"
> --
> 2.7.4
>

