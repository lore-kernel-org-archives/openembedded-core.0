Return-Path: <iwamatsu@nigauri.org>
Received: from mail-qc0-f177.google.com (mail-qc0-f177.google.com
	[209.85.216.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5A2DC6CE69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 05:38:23 +0000 (UTC)
Received: by mail-qc0-f177.google.com with SMTP id x12so2637477qcv.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 22:38:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=77iyNF5XN1mATtA9WdnZ4rrJaIKhpcyf9KZWZfuaoSw=;
	b=YQvkcfMjPei6CCtEO1aFxiqyZZs/dSOFnArlgy3HzmTELimlfRbj8uBRE67qbcsb3S
	N3h4lSJILeObJDbDbKwZpXlLODAEl3Jlj/zvSPJsvp3quSDB+5QBZ2yZIqw6n7W+HTVP
	Hx75AXgTN3oXz4BvudCnqL4RmYhKTia5TcV1sXqyI9vWCkcTsIr8RtNhPH4LLynHtRHQ
	MgO19zOV7htesGU/pl8jFpcn5n8flKjwr3LH+ErbBY5crJcJs55+1VqhjguIRUgnT6YO
	Q0Ku/Y8SBL36uf6BA6CUv+wDnF6NoEx9ozGP/+9zYb+NVGYc+eTXDSkKnoi9LxxuB2ij
	WOKg==
X-Gm-Message-State: ALoCoQmxCPuqjhE8OCu2EdulOK7/l/I1i+799mGFNkD8zxZb+u0s+yZqGDY9GWRTUnXr+kv+ulgj
X-Received: by 10.49.94.172 with SMTP id dd12mr17215896qeb.4.1381469904648;
	Thu, 10 Oct 2013 22:38:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.224.178.10 with HTTP; Thu, 10 Oct 2013 22:37:54 -0700 (PDT)
In-Reply-To: <1381400211-28604-1-git-send-email-koen.kooi@linaro.org>
References: <1381400211-28604-1-git-send-email-koen.kooi@linaro.org>
From: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Date: Fri, 11 Oct 2013 14:37:54 +0900
Message-ID: <CABMQnVJZCxvFgJNgtMZ=gp2BiWLofpFyXCZ9H1-xQhLM=hsd6g@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: add aarch64_be target
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
X-List-Received-Date: Fri, 11 Oct 2013 05:38:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have a question.
Why don't you unite  name rules of  other architecture?
Forexample, armeb is endian-big of arm.  mipsel is endian-little of mips.
If you can unified name, arm64eb is better, I think.

Best regards,
  Nobuhiro

2013/10/10 Koen Kooi <koen@dominion.thruhere.net>:
> From: Victor Kamensky <victor.kamensky@linaro.org>
>
> Add big endian ARMv8 target to OE infrastructure
>
> Signed-off-by: Victor Kamensky <victor.kamensky@linaro.org>
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
>  meta/classes/insane.bbclass       | 1 +
>  meta/classes/kernel-arch.bbclass  | 1 +
>  meta/classes/libc-package.bbclass | 1 +
>  meta/classes/siteinfo.bbclass     | 2 ++
>  4 files changed, 5 insertions(+)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index a784aff..f1c6d22 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -55,6 +55,7 @@ def package_qa_get_machine_dict():
>                        },
>              "linux" : {
>                          "aarch64" :   (183,    0,    0,          True,          64),
> +                        "aarch64_be" :(183,    0,    0,          False,         64),
>                          "arm" :       (40,    97,    0,          True,          32),
>                          "armeb":      (40,    97,    0,          False,         32),
>                          "powerpc":    (20,     0,    0,          False,         32),
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> index 4a140eb..6a6ad91 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -23,6 +23,7 @@ def map_kernel_arch(a, d):
>      if   re.match('(i.86|athlon|x86.64)$', a):  return 'x86'
>      elif re.match('armeb$', a):                 return 'arm'
>      elif re.match('aarch64$', a):               return 'arm64'
> +    elif re.match('aarch64_be$', a):            return 'arm64'
>      elif re.match('mips(el|64|64el)$', a):      return 'mips'
>      elif re.match('p(pc|owerpc)(|64)', a):      return 'powerpc'
>      elif re.match('sh(3|4)$', a):               return 'sh'
> diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
> index fd06c4a..de3ffe6 100644
> --- a/meta/classes/libc-package.bbclass
> +++ b/meta/classes/libc-package.bbclass
> @@ -268,6 +268,7 @@ python package_do_split_gconvs () {
>              locale_arch_options = { \
>                  "arm":     " --uint32-align=4 --little-endian ", \
>                  "armeb":   " --uint32-align=4 --big-endian ",    \
> +                "aarch64_be": " --uint32-align=4 --big-endian ",    \
>                  "sh4":     " --uint32-align=4 --big-endian ",    \
>                  "powerpc": " --uint32-align=4 --big-endian ",    \
>                  "powerpc64": " --uint32-align=4 --big-endian ",  \
> diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
> index 8705eaa..9ae2561 100644
> --- a/meta/classes/siteinfo.bbclass
> +++ b/meta/classes/siteinfo.bbclass
> @@ -19,6 +19,7 @@ def siteinfo_data(d):
>      archinfo = {
>          "allarch": "endian-little bit-32", # bogus, but better than special-casing the checks below for allarch
>          "aarch64": "endian-little bit-64 arm-common",
> +        "aarch64_be": "endian-big bit-64 arm-common",
>          "arm": "endian-little bit-32 arm-common",
>          "armeb": "endian-big bit-32 arm-common",
>          "avr32": "endian-big bit-32 avr32-common",
> @@ -63,6 +64,7 @@ def siteinfo_data(d):
>      }
>      targetinfo = {
>          "aarch64-linux-gnu": "aarch64-linux",
> +        "aarch64_be-linux-gnu": "aarch64_be-linux",
>          "arm-linux-gnueabi": "arm-linux",
>          "arm-linux-uclibceabi": "arm-linux-uclibc",
>          "armeb-linux-gnueabi": "armeb-linux",
> --
> 1.8.3.1
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
Nobuhiro Iwamatsu
   iwamatsu at {nigauri.org / debian.org}
   GPG ID: 40AD1FA6

