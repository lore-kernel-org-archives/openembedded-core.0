Return-Path: <scott.branden@broadcom.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8B160C3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 19:18:19 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id b17so8039460wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2020 11:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=BW5vxV3YqQeSn7GgIdYjcmEgWfIbxzUDfBq86tQNUpw=;
	b=LhttuEm2hqsc5vVD9h2anIS3SFvQe0s9c5yEhCV219Pu8H7M2HgN4Y+fvIL0VzPvh9
	INVXv+eiO4dURvTdU+PJh2J4dAXlSWWcHAw7Ljb/SoViqjXtFSa7UyAQM4578vAT80SD
	qwQb195ZqkdRh2kq/YbmrQiSChv0JK2ucxv1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=BW5vxV3YqQeSn7GgIdYjcmEgWfIbxzUDfBq86tQNUpw=;
	b=ML/ZItstXfMxxAg9Q1aGohryqCFJF0hbqZhV6FTiciCft+uyvV5A77SDXTF126jATZ
	zPKpoEk+vRhkZXoW/HygO6E8M5pgJVYcAQ7gcVtFygCWLSDgwMgvsLMPqSoSB2ZzEt/a
	Y52IyTyz8nGZVwC2K0lecqg+5e4Cjhdq9LFGHInBbt8KDSFnIbN0omy0k5VCPEWUbZgu
	uJEvh/YqjqWzF62A4GgoyCbQ2OgmwM1Nvp2XUsoxXf4mhY9makeRPTjBQK+ZJEVj84Ow
	2hdpaSg/Rg8YqLzO8T78BbT9qiLyWqBWmRHyiAkI0uPy2Z7ti+O5jyuIVLtfswDcAa4f
	PNVg==
X-Gm-Message-State: APjAAAWfPEk/OdlN+UANHiad+j6MsVyTZHgU1ODF+eYzvnygPjs+Hzb0
	HEcllSurcq1NB40rzfefyDtu0b/xk0lKdOs3trjtsJt861i+ndHkPqu/QCErxPqznXEuEybF1Ca
	lh4KHlPyNqVoiu5eH6tSYrH94a3/Q1cqj/Jh/Hx0BN1sK+3/csVRoEEMRrF2FSkX7byyrUKnJPo
	/pFLmONguvdcyONjTws9t3TA57tGU=
X-Google-Smtp-Source: APXvYqyXv8Ztlw0TQJTaPAIUzBUHsZ9kYEmEboUjiC/Rc+XG1WDapdg10qNiGPSCu+Umng/7A5OEeQ==
X-Received: by 2002:a1c:4857:: with SMTP id v84mr7240581wma.8.1581621499437;
	Thu, 13 Feb 2020 11:18:19 -0800 (PST)
Received: from [10.136.13.65] ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id h2sm4197402wrt.45.2020.02.13.11.18.17
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 13 Feb 2020 11:18:18 -0800 (PST)
To: zhe.he@windriver.com, openembedded-core@lists.openembedded.org
References: <1581619124-194740-1-git-send-email-zhe.he@windriver.com>
From: Scott Branden <scott.branden@broadcom.com>
Message-ID: <f25b2353-cd24-1aff-4028-967892e3d1e3@broadcom.com>
Date: Thu, 13 Feb 2020 11:18:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1581619124-194740-1-git-send-email-zhe.he@windriver.com>
Subject: Re: [PATCH] perf: Correct the substitution of python shebangs
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
X-List-Received-Date: Thu, 13 Feb 2020 19:18:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Thank you - works for me.  I've been waiting for a fix!

On 2020-02-13 10:38 a.m., zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> To make the native python3 are always used,
>
> - Move the substitution of /usr/bin/python3 to first, otherwise the
>    possible original /usr/bin/python3 would be changed to
>    /usr/bin/env python33.
> - Add substitution for ${S}/scripts/
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
Tested-by: Scott Branden <scott.branden@broadcom.com>
> ---
>   meta/recipes-kernel/perf/perf.bb | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index 6d1b066..14a9090 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -240,10 +240,17 @@ do_configure_prepend () {
>   
>       # use /usr/bin/env instead of version specific python
>       for s in `find ${S}/tools/perf/ -name '*.py'`; do
> +        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
>           sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
>           sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
>           sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
> +    done
> +
> +    for s in `find ${S}/scripts/ -name '*.py'`; do
>           sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
> +        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
> +        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
> +        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
>       done
>   
>       # unistd.h can be out of sync between libc-headers and the captured version in the perf source


