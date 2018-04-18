Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2DD671D79
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 21:52:07 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id p15so1556651pff.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Apr 2018 14:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=PFbtbPT/FkP46MW1HwbL5VyOyZCqPLEERteN9OwnkpU=;
	b=aSDN2R6pD1A4BT8V8QuYh7HXcLc6id8O5SJNIDejzjrTJ4x6X7V6+/5Rt1QpLCcg/9
	MLx4/VihYGGvNRRLMbMEbaPxxciiZbA2J4ZqZB/laa2KxCszQzghP/n5FQcDRvug4voj
	+qipvCttAuSZLrbmDbzFVb/dY3w0DLNIN/2L7CakM20zTB9rQ1WoQRjSQuAo3ngH+HOq
	ffcy4ICDXvwPmgS4GtS18FxOj/GMQdFOPmKrTixZYs8GtEz8/l5Yv5ZZ5in7v1EKcDsP
	D8WOPFwaor05G6AWq+mPUIZ2mPKkiDcDa1KpmKXVAN6XomGGtCKkkGZEA0KAOt2otpYz
	PaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=PFbtbPT/FkP46MW1HwbL5VyOyZCqPLEERteN9OwnkpU=;
	b=VRiEzPmzix5r0cCMUQSaExNEsjZMrcK43c0GfDKD2ZyjOmDBkqrE3taJB08jAddi23
	OqSsFiIZyoSOpz5tY2X4AP9hn3OMpAkeiZIaB7XOlqyaN9PSJv4Zr49T6T8aLtu27cpd
	WZAVGvaXYi+gkW2iTuytOsDmJCgLdF6HQAAwgtTGzIIW/Nw8I+ECvoDWjH1/Ye5La2Bc
	Xue21H81nrvz3OCebfbGpc+0yXSLuLzxKBzxzhbFWBn0RdQYX24ks5yr0g6qTc+WLQ3G
	DTjxPRuktYcp+dXyBjcXXwwLR4vAYMBNp76eboSgg/wLRaz0UcRYu/OUrdnYCqMG1FIg
	XeGQ==
X-Gm-Message-State: ALQs6tCDqbJmzOHgdlPbHd/G0/0KzAI8FTqxjQhoEHtGQKOkqV//HL6G
	LjvKLz9dG8KTBQzzKozan7Xsyw==
X-Google-Smtp-Source: AIpwx4/nqWH586dgurlj08Uz2NrB+hSxd3PEdP6vmYkRzsakpOOHmzn9bfTEnZkM4YyBTj3uKq7beg==
X-Received: by 10.101.91.204 with SMTP id o12mr1297309pgr.81.1524088328527;
	Wed, 18 Apr 2018 14:52:08 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:94ac:f6b8:efca:146f?
	([2601:202:4000:1184:94ac:f6b8:efca:146f])
	by smtp.gmail.com with ESMTPSA id
	t18sm5161233pfg.103.2018.04.18.14.52.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Apr 2018 14:52:07 -0700 (PDT)
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20180416193251.17223-1-mark.hatle@windriver.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <35fd35d4-5002-3e19-9483-ed839310602c@gmail.com>
Date: Wed, 18 Apr 2018 14:52:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180416193251.17223-1-mark.hatle@windriver.com>
Subject: Re: [pyro][PATCH] package.bbclass: Add '-b' option to file call in isELF
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
X-List-Received-Date: Wed, 18 Apr 2018 21:52:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 04/16/2018 12:32 PM, Mark Hatle wrote:
> The isELF function works by running:
>
>    result = file <pathname>
>    if 'ELF' in result
>
> By default 'file' will prepend the result with the path name of the file
> that is being checked.  This usually works fine, such as:
>
> $ file /home/foo/openembedded-core/meta/classes/package.bbclass
> /home/foo/openembedded-core/meta/classes/package.bbclass: Python script, ASCII text executable, with very long lines
>
> However, if the path includes 'ELF', ELF will end up in the result, and then
> the check will return positive.
>
> $ file /home/ELF/openembedded-core/meta/classes/package.bbclass
> /home/ELF/openembedded-core/meta/classes/package.bbclass: Python script, ASCII text executable, with very long lines
>
> This will then result in the isELF coming back true, and possibly causing the
> checks that use isELF, such as the 'is it already stripped' check, to do the
> incorrect thing.
>
> Adding the '-b' option to file will result in the path being omitted in the
> result:
>
> $ file /home/ELF/openembedded-core/meta/classes/package.bbclass
> Python script, ASCII text executable, with very long lines
>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
In stable/pyro-next


> ---
>  meta/classes/package.bbclass | 2 +-
>  meta/classes/staging.bbclass | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index a03c05b9f7..0844fd5065 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -898,7 +898,7 @@ python split_and_strip_files () {
>      # 16 - kernel module
>      def isELF(path):
>          type = 0
> -        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
> +        ret, result = oe.utils.getstatusoutput("file -b '%s'" % path.replace("\"", "\\\""))
>  
>          if ret:
>              msg = "split_and_strip_files: 'file %s' failed" % path
> diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
> index 984051d6aa..bff04373dc 100644
> --- a/meta/classes/staging.bbclass
> +++ b/meta/classes/staging.bbclass
> @@ -84,7 +84,7 @@ python sysroot_strip () {
>      # 16 - kernel module
>      def isELF(path):
>          type = 0
> -        ret, result = oe.utils.getstatusoutput("file \"%s\"" % path.replace("\"", "\\\""))
> +        ret, result = oe.utils.getstatusoutput("file -b \"%s\"" % path.replace("\"", "\\\""))
>  
>          if ret:
>              bb.error("split_and_strip_files: 'file %s' failed" % path)


