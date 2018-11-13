Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 878AA6C253
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 16:25:59 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id n10-v6so5910774pgv.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 08:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=IhOoAiuGE63Ui1auclny8ltFQxmjjbVRPlqWiS1P60g=;
	b=lNZplNOjPQwn3KV3YWJl5hXDkwDhof06c7yttpFLEpymm7JvAegQrfa8HDexyXPtrN
	qv4toCAxgjJwNpiu6dXtCi31BoGIcOoHr5nuAZMoV80/zAlIAybmU7gERi88jsL91rr1
	lbPie7G7ggb1FXw3cvRrDB2fCp2epkXVA+LGhHTRfQwEtylWh2aj+Lqgp+6saOh1UC/O
	V33zI9I3D8w+lYX0kKSpGV/PGIEvRmfdvdE6APajsCYvUQ8m6lIXGs4sZpwKTgEP89ep
	XqyAkFKQ2qBNwGttpU2pjRaMS/9H5ecILQtKiAbZIxGeZIe0BxOkAwAo+A7hGpPx74a6
	HY7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=IhOoAiuGE63Ui1auclny8ltFQxmjjbVRPlqWiS1P60g=;
	b=imzOwWyre/D9angn5eNd46nhoq/lsZpioww69Rp0lCtWJwCBySko3QL9rDeR4ABlup
	YTdhK05cuw0iQ19lHr8U+FCnVYqbHV1ZV4Gckbme3Uj6NIu+YaPT6NFK0jX2hnAJ0hBm
	4WWFeOg3bkAJTMzydr9bLxl0wu+jyK22WT+ph/6hyoFnd/Vk1hVNLqNmqos+XVMH/Vl9
	QjogWqNCoOiymCL5XkdrXNBqOoA1GL7PMZX5QrxzfOi8u9cPPr9aVzEK8DN1JXYxX5Hd
	Qk+rSVEaixlLLwwoXN4oWuupwqjQnEcewxRg1sFqLzAFKpwPpdby766yigYrQmQ23Y3F
	32+g==
X-Gm-Message-State: AGRZ1gIj9Mi4koWet1WkOyOo6ns6FTk01kSzvsKhJtdW8yUGTjAe5CwA
	M5/lJVQkUBmaIgoo14KhdUUjC/7y
X-Google-Smtp-Source: AJdET5ewof+ifNW5R5L7rmC1O3/g8gSAu9bwmXHD9x35S+lD0wxIa6z0ulRnplYsP5ChmkD9TOJ1vA==
X-Received: by 2002:a62:5e46:: with SMTP id
	s67-v6mr6003209pfb.122.1542126360124; 
	Tue, 13 Nov 2018 08:26:00 -0800 (PST)
Received: from ?IPv6:2601:202:4180:c33:75ee:9e74:d500:909d?
	([2601:202:4180:c33:75ee:9e74:d500:909d])
	by smtp.gmail.com with ESMTPSA id
	n23-v6sm34843167pfg.84.2018.11.13.08.25.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Nov 2018 08:25:59 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20181113103449.27055-1-richard.purdie@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <78404859-91fa-6cbe-6ef2-6f31f3bea81a@gmail.com>
Date: Tue, 13 Nov 2018 08:25:58 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181113103449.27055-1-richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH] [rocko] python-3.5: Fix manifest to handle reprlib correctly
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
X-List-Received-Date: Tue, 13 Nov 2018 16:25:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/13/18 2:34 AM, Richard Purdie wrote:
> The current line is looking for py files in __pycache__ which is incorrect.
> Fix it to correctly include the right files (modelled after ${PN}-signal).
>
> Patch isn't relavent to later releases since manifest generation changed
> significantly.
>
> [YOCTO #12831]
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

in rocko-nmut

thanks,

Armin

> ---
>  meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
>  scripts/contrib/python/generate-manifest-3.5.py      | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc b/meta/recipes-devtools/python/python-3.5-manifest.inc
> index 0260e87e75f..710b22eaa38 100644
> --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
> @@ -194,7 +194,7 @@ FILES_${PN}-readline="${libdir}/python3.5/lib-dynload/readline.*.so ${libdir}/py
>  
>  SUMMARY_${PN}-reprlib="Python alternate repr() implementation"
>  RDEPENDS_${PN}-reprlib="${PN}-core"
> -FILES_${PN}-reprlib="${libdir}/python3.5/reprlib.py ${libdir}/python3.5/__pycache__/reprlib.py "
> +FILES_${PN}-reprlib="${libdir}/python3.5/reprlib.* ${libdir}/python3.5/__pycache__/reprlib.* "
>  
>  SUMMARY_${PN}-resource="Python resource control interface"
>  RDEPENDS_${PN}-resource="${PN}-core"
> diff --git a/scripts/contrib/python/generate-manifest-3.5.py b/scripts/contrib/python/generate-manifest-3.5.py
> index 6352f8f1207..750d4fc7548 100755
> --- a/scripts/contrib/python/generate-manifest-3.5.py
> +++ b/scripts/contrib/python/generate-manifest-3.5.py
> @@ -371,7 +371,7 @@ if __name__ == "__main__":
>      "lib-dynload/readline.*.so rlcompleter.*" )
>  
>      m.addPackage( "${PN}-reprlib", "Python alternate repr() implementation", "${PN}-core",
> -    "reprlib.py" )
> +    "reprlib.*" )
>  
>      m.addPackage( "${PN}-resource", "Python resource control interface", "${PN}-core",
>      "lib-dynload/resource.*.so" )

