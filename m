Return-Path: <will.newton@gmail.com>
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0C54E71A2D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:56:53 +0000 (UTC)
Received: by mail-lf0-f68.google.com with SMTP id h80so1153207lfe.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nssN50NtU4LOK1gMUM8I4LrsMerfFH/2Qc1WoeqlTo4=;
	b=oDM0tW+NvdMDIRe+wTA5YYpmjgXsMzvEUGzA3JzCn7C+jpv58s3yppDxP/Z49lDV/C
	AXu3mfEafmDgQ6tPIp8wNppAvBhA1i01ALsgc+Pr2BTcHxBqfci9+saevDjFxNcr+/Bs
	plkUdc8DSKdi4gjhqw1xt49bP3QfwajylxCXMjG8Sy0aP49/2Wi5pAPBN4czpe7xlmLs
	RFbzGrymJxtZ1wEfZpwg5nflVmkCXvW1T/udEhWCHofT96Np2uMeoyftvmYfeRYZ8Svp
	VcqVfp9n1Nx7delcfYemZTcyU6tZtH0kq27jShHtQGICp9Li+EUeA5x31qDMOmySmCyg
	BG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nssN50NtU4LOK1gMUM8I4LrsMerfFH/2Qc1WoeqlTo4=;
	b=SGw0oJDJ4h/XqlSHa4GanhVwsIT3yW7TbjrJ8uPBS/7S1TQtnb+NWb02nHyOIBCe6J
	9QqOwS5yWi4LHsfbSbRODFeZzlpFEMTxZH/luT6mktLLKGekuEn09nFrQcfiNWq/Vc99
	iBKyuj1trn4CsBLt1dWEjt5FRxayrqdc1a0BxWfPemTQ2PhtsDKc60lzx1Q8WuexFBGn
	7Kzxy3c2VYbQAaBLO7m0G5aD4ACJ9+5LOEKRRa5XNBD0qPUjy6X7sKT/PMZhrjepbpqC
	8LjKN/YDdqCMHKZzmCiEUCNWUpBKckuANCA9p4LOoNVC31up4y8WraRBMYC8NkAH0BjE
	hRUw==
X-Gm-Message-State: AHPjjUjpzFfL7jdAtro13xytfjCEJH96t6FZ79W3TEDZTUKScRciyIeg
	8bvilpTdOjaMcw1nvKLthoeGiN/qEg==
X-Google-Smtp-Source: AOwi7QDEmKKrddz4Ol0GgS/kVLVuYt/puzchtEe4GPZ5b9csse1INUacZLqqwFgsDWt7jCHgLFWiHiSlQ8oKbCuaT/Y=
X-Received: by 10.46.87.5 with SMTP id l5mr1007807ljb.128.1504879014366; Fri,
	08 Sep 2017 06:56:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.179.66.9 with HTTP; Fri, 8 Sep 2017 06:56:53 -0700 (PDT)
In-Reply-To: <20170908134758.7570-6-otavio@ossystems.com.br>
References: <20170908134758.7570-1-otavio@ossystems.com.br>
	<20170908134758.7570-6-otavio@ossystems.com.br>
From: Will Newton <will.newton@gmail.com>
Date: Fri, 8 Sep 2017 14:56:53 +0100
Message-ID: <CAFbHwiTq2j7x9x3MNh1Aj5BqzfedkUJSEOWNrn3JAet_SAEr3Q@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 05/11] goarch.bbclass: Add support for ARMv5
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
X-List-Received-Date: Fri, 08 Sep 2017 13:56:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 8, 2017 at 2:47 PM, Otavio Salvador <otavio@ossystems.com.br> wrote:
> This adds support to return the proper ARMv5 format.
>
> This change is based on the meta-golang[1] layer. Thanks to Matt
> Madison <matt@madison.systems> for his work on this.
>
> 1. https://github.com/madisongh/meta-golang
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
> Changes in v3: None
> Changes in v2: None
>
>  meta/classes/goarch.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 7960ac5f9e..dbec6ee2c8 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -47,6 +47,8 @@ def go_map_arm(a, f, d):
>      import re
>      if re.match('arm.*', a) and re.match('arm.*7.*', f):
>          return '7'
> +    if re.match('arm.*', a) and re.match('arm.*5.*', f):
> +        return '5'

I suspect this regular expression is overly general, see:

http://lists.openembedded.org/pipermail/openembedded-core/2017-September/141938.html

The Go toolchain default is for ARMv5 when cross-compiling so as far
as I know setting this explicitly should have no effect at the moment,
although it may be valuable to protect against changes to the default.

>      return ''
>
>  def go_map_os(o, d):
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

