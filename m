Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 886207840E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 07:46:34 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id o42so18746924wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 00:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=gRajvPb4V12D82sTax2Y9gx4cQjP1pqm2k7OBVtKC78=;
	b=snk58YBgN8WVRswnuG5c+eDlbFJtjyHCTlFhDFpFmWLi7AdHrP06YhuStNIAj1wV/6
	ShtzfrQD+OD8b0gY70dtRKXaOl8droaGfi0RtI0QcTimmywsngdTqlWOzOemYrHXQ3K2
	aOhfysvSwXM0251u3wMDzsDJOWK8+wLZWbqlMNOUGF+H1ygzCaKuIzuLsBJJFCgbHkeJ
	9BI6gGCaaLR1k4M8Xi1+TiZ2um5mLVQhzruCHVariks1drgY59/cGLtUaJd3UZDDMemX
	qO2XoXWlOF3WlMljRoKVbKtBvNianK9GEPGXgfr+UqQyq73OAbNb5RgpZDlRZUPpZ3M8
	5JcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=gRajvPb4V12D82sTax2Y9gx4cQjP1pqm2k7OBVtKC78=;
	b=U7s3UOUsXwX6lg7nuzNvKSdu9V1ls0QN09A1cZeGJbenHC6vJ+D+CVm/ggBOJDUJ+U
	QRs9A/FsWVnNWKNPB0hNlgMe0z7pHaeIjJJjm40Vry2tR2nfzZqAIbAWAkyb929fZsLd
	acPsYIiQKzqMx2t5MEZydEedMclCcz+8moAb2TNJ3kw9Q713CVhDYo5+IOpNi8cQFC9E
	HuydQ3hCpEoVBd9kitKhLq0RD0OvLjYzuq5WwqJwdSBmNdCTyy4zmWvrbfFNlmj6A4s/
	0+1VRWN4xaKbDyzZimJsc4wxjjsNAyRyXlV747hWmuR1rj7dVI0Lo1AHPN0JNOP0A15k
	maLA==
X-Gm-Message-State: AHPjjUh9H6uuWdAJjcAojcmpBCPjmrzxR2ytPQfBv9lYnJ70b7E1eHfo
	UejjupTsHDYm8Jfy
X-Google-Smtp-Source: ADKCNb4SeXbnbq9wWZ7I6XEkfuR25+wRNkoWN98pkt2CWwHBva/0zERTFLi9/7xwajjoz+ahtVrd2Q==
X-Received: by 10.223.130.166 with SMTP id 35mr11248919wrc.249.1505202395325; 
	Tue, 12 Sep 2017 00:46:35 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8CEC1.dip0.t-ipconnect.de. [93.232.206.193])
	by smtp.gmail.com with ESMTPSA id
	e186sm10991736wma.3.2017.09.12.00.46.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 00:46:34 -0700 (PDT)
Message-ID: <1505202393.9633.44.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Dengke Du <dengke.du@windriver.com>, ross.burton@intel.com
Date: Tue, 12 Sep 2017 09:46:33 +0200
In-Reply-To: <c82454e88d60d4fdcea4fb4eddd8622df7a40caa.1505178922.git.dengke.du@windriver.com>
References: <cover.1505178922.git.dengke.du@windriver.com>
	<c82454e88d60d4fdcea4fb4eddd8622df7a40caa.1505178922.git.dengke.du@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] ovmf: fix do_compile error when len(tmp)=410
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
X-List-Received-Date: Tue, 12 Sep 2017 07:46:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-09-11 at 21:20 -0400, Dengke Du wrote:
> diff --git a/meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-
> file.patch b/meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-
> file.patch
> new file mode 100644
> index 0000000..9cc85ad
> --- /dev/null
> +++ b/meta/recipes-core/ovmf/ovmf/0004-ovmf-enable-long-path-
> file.patch
> @@ -0,0 +1,28 @@
> +From 032fc6b1f7691bd537fd2a6bd13821fcf3c45e64 Mon Sep 17 00:00:00
> 2001
> +From: Dengke Du <dengke.du@windriver.com>
> +Date: Mon, 11 Sep 2017 02:21:55 -0400
> +Subject: [PATCH] ovmf: enable long path file
> +
> +Upstream-Status: Pending

Pending which action? I.e. what's the next step?

To me this patch looks more like local customization to fit into path
lengths used by the OE build system, so "Inappropriate" might be more
reasonable.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



