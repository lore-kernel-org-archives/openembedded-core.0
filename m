Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3F5946C1B4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2018 04:27:37 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id z16so24976304qtq.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Dec 2018 20:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=FhO1jTLG6ARRd+PEvlu+uloRUpQyWw4ZQSE0JRJMY4k=;
	b=ifh/zelx1byb8aqCxsmEE2mWRBI+Rl3sPjTwhpfERFvYtgwHW3055jexMFd82kn++t
	KcE4UFMp4g7kwOa623m/jBg6mf/OYWbOaC7v8lSjfwmMnWqJ7nzvqHsUczKQ0B9IdshX
	6N371RETUvrcsYbksDsrajNDqH2iBH1TooI4BOUYR0sy+xNYSXKXbEXmtGjeLqeDEv+O
	DEW5uUz2B3o1YRzDM/oRG4UTC9ySkcGf+0XPoy6MZrfMhjjqgUgREnbT+BAg5KrhAKf/
	xs+9jbu4V3lRm2j2PBqD2IeHewkNRicbQg4PlSinAWek2qywbWgZYR3gIaKBjy/hlm/e
	2l3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=FhO1jTLG6ARRd+PEvlu+uloRUpQyWw4ZQSE0JRJMY4k=;
	b=tkocW9LSzDhu86RPTIRi0KsofN7iQOZBIczqvy9LP0YX9jcPYDgg1h+qMi7gN33CfR
	THu6GZCb9ErWFF1mASNTKHsy156qRV70RHcr105a6uoQkC+/Z2Giw8ahoyFaQqzsPrOR
	Ql+fdxQQ6TFIJxiIWVMxnNQfanPeMZO0cqXaZSY1qvncmWyUcMsJXnBygorollO0YHMG
	M1+F78sotOMOk+j11IFP1YmIUieotkt8yXV8UG3j70hKjVMv5QWpeAflvojDKeNSIHS7
	iwyBZ3mAbw46TBovZzZveYKQoLqCuCPRjeZlkAOXx+doW/0Tj/QcyDNsbKI3uz0G4aSb
	/pmg==
X-Gm-Message-State: AA+aEWZXj9/wZjLblCxkpTqWETqaT6IIKkpbJN5n+98yAdItU5eGM/m7
	CI3rP7itrk6rujOKd8BDJA1YXUBShdxkGUQWuPw=
X-Google-Smtp-Source: AFSGD/X7ui3Rnz8bx9O/Pkj9J4LL13ta/44Y6y7su13pwxI+g801Pgt1kwICglY8dFvzJQyQ2f6RriNv4Bmbz8Zs51E=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr25264724qtn.254.1544070457925;
	Wed, 05 Dec 2018 20:27:37 -0800 (PST)
MIME-Version: 1.0
References: <20181205012132.27831-1-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20181205012132.27831-1-hongl.fnst@cn.fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Dec 2018 20:27:11 -0800
Message-ID: <CAMKF1spTvOq8zzVYSnFuXdc0ZE3KoeB+S+zC0uSvsgMst_oqTA@mail.gmail.com>
To: hongl.fnst@cn.fujitsu.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] [PATCH] tcl:upgrade to 8.6.9
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
X-List-Received-Date: Thu, 06 Dec 2018 04:27:37 -0000
Content-Type: text/plain; charset="UTF-8"

I think this is causing tk to fail  with missing fixstrtod

see http://errors.yoctoproject.org/Errors/Details/203567/

Richard, please hold off to this patch until we have equivalent tk upgrade
patch as well.
On Tue, Dec 4, 2018 at 5:19 PM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> 1.Upgrade tcl from 8.6.8 to 8.6.9.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta/recipes-devtools/tcltk/{tcl_8.6.8.bb => tcl_8.6.9.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-devtools/tcltk/{tcl_8.6.8.bb => tcl_8.6.9.bb} (95%)
>
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.8.bb b/meta/recipes-devtools/tcltk/tcl_8.6.9.bb
> similarity index 95%
> rename from meta/recipes-devtools/tcltk/tcl_8.6.8.bb
> rename to meta/recipes-devtools/tcltk/tcl_8.6.9.bb
> index 4be2e89..7f37781 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.6.8.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.6.9.bb
> @@ -24,8 +24,8 @@ SRC_URI = "${BASE_SRC_URI} \
>             file://alter-includedir.patch \
>             file://run-ptest \
>  "
> -SRC_URI[md5sum] = "81656d3367af032e0ae6157eff134f89"
> -SRC_URI[sha256sum] = "c43cb0c1518ce42b00e7c8f6eaddd5195c53a98f94adc717234a65cbcfd3f96a"
> +SRC_URI[md5sum] = "aa0a121d95a0e7b73a036f26028538d4"
> +SRC_URI[sha256sum] = "ad0cd2de2c87b9ba8086b43957a0de3eb2eb565c7159d5f53ccbba3feb915f4e"
>
>  SRC_URI_class-native = "${BASE_SRC_URI}"
>
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

