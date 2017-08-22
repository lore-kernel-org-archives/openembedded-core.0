Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id 4E2B6782FE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 19:09:15 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id a47so3004035wra.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Aug 2017 12:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0JKIAfks71kCebfe+u1brGNpCnMULQyajEde0zgSD4U=;
	b=dLADoBlVUPuWfrnWL623Q83+cDIeOyPeLextv6QhUm8Fbwj/NPKsLHxG4sznd5wAhh
	hXg5TtOW70AFOP6xqzXo8fiYduYTgQGdhaNXic3TedrxI60MgBMA3+8i26uT0Ddcsr9n
	cAYwcULsIZ67QT4sEflifHJu4u+l62lBpEVjWiY5ht/XcT1d7OBgWpGwhHMBfcZd1oZa
	PkWBTZEowedZ3pZUrhR0gd6+rPmkpe73cStnsbkWZ36S0etrLUp8nkA0RvvZdhOEQMC2
	VTPJgvmw5/gzO3Llofzx/LF/kcYf6La5B7qr9pFmSRjGnsQM4Y/eMx91iT3ZPdFx9rmX
	AE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0JKIAfks71kCebfe+u1brGNpCnMULQyajEde0zgSD4U=;
	b=L3sCnI0xngTos0mfZFkQO5tIGnyvHfxQzneHAevqL/Q6XOHiY2inSM9r75wnXotro2
	nmIQVnkReK5KRfYCHxRAf3BvaPqgo7/6UgjRv+pFilxEdyG1SCm/HF6cUZtSj0BEpBal
	kgq8Dlh0B8BORIiuuL9AZgpzy8JBfAysyAsb9K+WbN02033MaeKMCIDj12n61aREOfrt
	P7a6JwZOj4vkPEkd9kh4JDTCDl4bSwrvg5MsTCxCsjcABC7z9e0paF8zXFh5A2LvdsIt
	8vw5ysx1nszRPunDu5nsy0CGLIDw65vKRtD8eG0slYojwqSq12WSxu9+stw7ug7ZqiEL
	otQQ==
X-Gm-Message-State: AHYfb5hRW+BqMtRNddxV94CUn27sKADFbHmxCXrMhwTFhNa479GtLKZm
	qKYgEu/YTQ5j9/b/YmFScS4/epwbkQ==
X-Received: by 10.223.184.116 with SMTP id u49mr77853wrf.182.1503428956130;
	Tue, 22 Aug 2017 12:09:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.169.70 with HTTP; Tue, 22 Aug 2017 12:09:15 -0700 (PDT)
In-Reply-To: <20170822073650.8413-1-jackie.huang@windriver.com>
References: <20170822073650.8413-1-jackie.huang@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 22 Aug 2017 12:09:15 -0700
Message-ID: <CAJ86T=W0+y7AS9mSsPDvnNsvao8Uszv0FpbJ+NVKz+jaFyrE0w@mail.gmail.com>
To: "Huang, Jie (Jackie)" <jackie.huang@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] webkitgtk: disable gobject-introspection on armv7a
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
X-List-Received-Date: Tue, 22 Aug 2017 19:09:15 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2017 at 12:36 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> Disable gobject-introspection on armv7a to avoid
> do_compile failure:
>
> | qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> | Segmentation fault
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta/recipes-sato/webkit/webkitgtk_2.16.6.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
> index df355d2..a53c42d 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.16.6.bb
> @@ -112,3 +112,7 @@ ARM_INSTRUCTION_SET_armv6 = "arm"
>  ARM_INSTRUCTION_SET_armv7a = "thumb"
>  ARM_INSTRUCTION_SET_armv7r = "thumb"
>  ARM_INSTRUCTION_SET_armv7ve = "thumb"
> +
> +# qemu: uncaught target signal 11 (Segmentation fault) - core dumped
> +# Segmentation fault
> +EXTRA_OECMAKE_append_armv7a = " -DENABLE_INTROSPECTION=OFF "

Using:

  GI_DATA_ENABLED_armv7a = "False"

might be a better approach. Since such over-rides for _armv7a should
also be duplicated for _armv7ve, this:

  GI_DATA_ENABLED_armv7a = "False"
  GI_DATA_ENABLED_armv7ve = "False"

would be even better.

> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

