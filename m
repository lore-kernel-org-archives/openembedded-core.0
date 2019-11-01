Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0549B7FCA2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2019 17:33:41 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id t26so5650060wmi.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Nov 2019 10:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=len0OiCm/WZ/vt9VUgQrAOrJEXEQByAwciAXjynAKKc=;
	b=eyQCujhhTZOvjuAej+XDxPy7RYmN/acPJ4RP1Km6oqFsZ3jw7bpIwGMTbxc7l09L78
	hYO5pdGFR/Rp1gr7wvqCKVtKQBn1Yn1TBF1WdaEJWdfhb4Qrxtavh3G6T1F2OWTaghy2
	v1MtUiu9LkgFzcS1j8RiIpzmYBQDfHUR+U7Zpr1XwjFZakbyTgHm1Y1uh+aGNhdU74SZ
	1NadkWkJiMAfM6+tdgtqThtwmghuuaaXKsslLhWssNAXJS7i0k8rZB9mhUEblCVfBFjk
	QuA6u5XQMW5BEW0BGm70KZHVEis3XNJjZyf7bGzMof+XjDD7+JxViFzTSmskhcB26ZDX
	9awQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=len0OiCm/WZ/vt9VUgQrAOrJEXEQByAwciAXjynAKKc=;
	b=Bcqg7qWkAqR/tts/dOGWHPELdtopbUaHGrBgu4OFl/3fKr4zFjblhDgpEmMxr0E+3t
	pr1LJw3G/V4Pb4uwvZi/iGWJf3yjBgAmOBvAWXRf4E+2o6g+3SjFPSDf48vqJepuwL/E
	pmQc7SMmptFXXn8QC/7hu+/0I25M1KIJFuO55CIIC2vYfNW6pmQX+DYc06qzq2JRCb4A
	OUJqOUx/x79nWOx6/3MLtsGSo+ooh2rKh5bhcyygkSvJb5+G0hXs4FSgY5G21YKun3SG
	Ltinx0PPqoJt32JS1SD7ae16EprC4saFWsexxPFNo9/jtrNYTabQ1BBhJc56P+U+tZ3+
	LhAQ==
X-Gm-Message-State: APjAAAVxsnFjsbK0NjS1manpHT2zBEDViSuf1zIpGVOyOymSQ4kkiXSA
	/sHeXxW0nc4Vk6JwKOYDo9nQhy2S7KS49DWTmEE=
X-Google-Smtp-Source: APXvYqyDxwXkbH/UDr5M+OxhY5evIZm2uOv/4vZbBFrhGBDP3sUIbgA1atf9nZau/wfEJCe6EgLrRay6lD+w0Hrrmlw=
X-Received: by 2002:a1c:b4c1:: with SMTP id d184mr10464915wmf.37.1572629622726;
	Fri, 01 Nov 2019 10:33:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1572341125.git.akuster808@gmail.com>
	<ba94d467df1cb0b67842408de3db193612aebdcd.1572341125.git.akuster808@gmail.com>
In-Reply-To: <ba94d467df1cb0b67842408de3db193612aebdcd.1572341125.git.akuster808@gmail.com>
From: Andrey Zhizhikin <andrey.z@gmail.com>
Date: Fri, 1 Nov 2019 18:33:30 +0100
Message-ID: <CAHtQpK501hXXF_iwe=SHVQkUvpvj4iPoym45CxD_piWfygEHEg@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [warrior 18/19] go: fix CVE-2019-16276
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
X-List-Received-Date: Fri, 01 Nov 2019 17:33:42 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Armin,

On Tue, Oct 29, 2019 at 10:50 AM Armin Kuster <akuster808@gmail.com> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit e31f87e289dfd3bbca961e927447a9c7ba816d3f)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> (cherry picked from commit e02e8fa2e82cceaaa6a433466f52f97b0984762a)
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---

This  patch didn't apply clean on warrior, but same patch on master
seems to be OK. I got a hunk in transport_test.go which has been
resolved by build, but since this is security-related patch I wanted
to bring some attention here.

>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--
Regards,
Andrey.

