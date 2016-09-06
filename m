Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4AB774E2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 17:55:41 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l65so11942775wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Sep 2016 10:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=p7DtAokPZI7PA85hjtjIVUICEnvjeRvpDLE/WqelW8Q=;
	b=e872tSGRaJ1I21LgRYjRj4iAoKZMIWHKyCo/iVFRmHGmvTHmlRAW637sP8++9xdLJg
	AapHBa5MT8TkR1YrB7E1muEYgGeVyL1Nsxt82chXeAidW7h9Iugs+vkc6EAaAFtqr2ZC
	piwX3BGE3zuag0yDdIHq16DWoq1cml2gGHcjS4Rh+tVQMz6fWbZEXkm0RxAx+gNPc4Fq
	C+VKTXLGzcbQ9Ghj+FQUVbuDkNkIOlHnN1BxDnl9XJ5DTUgWYmd0VkMLOn/brjzh/SRL
	08wLpWdwaeldHotjz4H3GuaEu8Sxh9bLy4msDxbCtXCVMhJI+axnm8cJ/5biqE7okQKK
	YVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=p7DtAokPZI7PA85hjtjIVUICEnvjeRvpDLE/WqelW8Q=;
	b=Wpye22dpwSU/TxCj10xAXo2/3JyGmDKVjO7xWQQ9mz9Xhn+ZVKmMJg4ZuU9+YfoSvq
	WeXidhVlY/dVSqlqdbYEThtdsMflP4JhKeFS4m1dgqPCx86QhjNrB57GzOQIid0EkE7n
	46v2a7nhyhl6cG8iYIQvzRoF07+H6GNLKGOGZwObfjrKeVmdUwSeTK//aXWPC0caBOTb
	rJMGBubldrPoWBoKllHZysqsdieoNIQv2nbyJzmE46Zf5L9kTvYrvFPAMf+jFW4coG55
	1EiVZBXIjzeSs1QtbHD/5kUJnSFQwfV/2Gxm7x7Kp37ggZcfJ9AEE5YWrfcJFArAl5mn
	Lnsg==
X-Gm-Message-State: AE9vXwPMLh4ao0TOxEyh4POWF1edUng4aIfZLBALeDskL0ME7WVX8y/feDNd2L2vPko8CRF0rvmychryEWzr9A==
X-Received: by 10.28.161.133 with SMTP id k127mr20729267wme.103.1473184542000; 
	Tue, 06 Sep 2016 10:55:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.194.216.100 with HTTP; Tue, 6 Sep 2016 10:55:41 -0700 (PDT)
In-Reply-To: <1472832102-8067-5-git-send-email-Zubair.Kakakhel@imgtec.com>
References: <1472832102-8067-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<1472832102-8067-5-git-send-email-Zubair.Kakakhel@imgtec.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 6 Sep 2016 10:55:41 -0700
Message-ID: <CAJ86T=X_gGfPCSV7AMpk+NyipcNqD7hWgNczP0K2qWSy8VjeCA@mail.gmail.com>
To: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] valgrind: Disable for MIPS Soft Float
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
X-List-Received-Date: Tue, 06 Sep 2016 17:55:42 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 2, 2016 at 9:01 AM, Zubair Lutfullah Kakakhel
<Zubair.Kakakhel@imgtec.com> wrote:
> Valgrind doesn't build for MIPS soft float. Disable the build until
> the package has support for it.
>
> Signed-off-by: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> ---
>  meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> index 13354f4..3d49131 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
> @@ -38,6 +38,10 @@ COMPATIBLE_HOST_armv4 = 'null'
>  COMPATIBLE_HOST_armv5 = 'null'
>  COMPATIBLE_HOST_armv6 = 'null'
>
> +# valgrind doesn't like mips soft float
> +COMPATIBLE_HOST_mips = "${@bb.utils.contains("TARGET_FPU", "soft", "null", "mips-poky-linux", d)}"
> +COMPATIBLE_HOST_mipsel = "${@bb.utils.contains("TARGET_FPU", "soft", "null", "mipsel-poky-linux", d)}"

For the hardware float case, COMPATIBLE_HOST should be set to
".*-linux" since OE can support multiple distro layers, not just poky.

> +
>  inherit autotools ptest
>
>  EXTRA_OECONF = "--enable-tls --without-mpicc"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

