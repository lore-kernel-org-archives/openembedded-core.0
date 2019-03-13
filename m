Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com
	[209.85.217.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7928F6BC88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 19:56:21 +0000 (UTC)
Received: by mail-vs1-f44.google.com with SMTP id w14so1794165vso.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2019 12:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MeAJqXfUT0NVBUy21E0yT17urpmzE8ldocgZAF9d1vs=;
	b=FeYqHhmeXp8mn+D6hFnwgGfbNKYlRW4H/lykTX6gw3oqHHx5A8T6jAssJT0/cD1Z0h
	Sd2RruZunnSjtglsKzOIUtf4hJRh9IXQtCRopPQ8omcHLeL+/VjNLrmyjYDnDsxor8xX
	igdQkgLJ1AnQaeAYGz5fRfSPqXAHFO8x5q/2ZnYGWvJKLRZCYlta6nwBHTp9A+/bklXe
	qmMhzF7WQtVGlh9KsL3DWz4ic+sDGTg/PuIyrqIinzCXwit+weAEKjAHlH9ykpQEsjQ1
	33EEVpv+rcNT9HqqglOgHE8e1DVuX5FvaH24vwF6/N0qS/8zDnsP36WdBMMXuS86817s
	Je0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MeAJqXfUT0NVBUy21E0yT17urpmzE8ldocgZAF9d1vs=;
	b=HLu9cNwxkYGtdBL5QFrj9bQCuRs7eTFzNtnEweUXqLmxECs9gWFfQZVRX+meRJtQMW
	AyIsE9afQiwhQu9cYBrO1fecrTieydBq2haTa3YvPjsn9XMU8FKAzTm0CHdhzMh7CFLB
	iRFgFzCQ4hK4ucLVqNAePjwEzLxgwsG/Xcg/jEXuZwKt6mvhQw/Hcod2MKfOU1gVkNjP
	Y9iUXmPP2LX8v4Pc7F2zbBH2DNewvScONGeVnzrWvt94XgqtlY8t37GU1VntnHA+u8dN
	m+3Hs5FxJePes5pqpVOgstJJ7aM+DRI8VIQHTVAcs4EgP80/0+DTL3/s/yUIDCBuAr9y
	lr6A==
X-Gm-Message-State: APjAAAVtg6ug9wwiBfCPTv95DNUlMC/9K1fx3dxOEBkXkvqS2JvubZPZ
	thQ5c7S55ce+oN28SQw6QYx6O+JCauXN1z/E3oQ=
X-Google-Smtp-Source: APXvYqy1WureQmkCAdiC1LoqQx3GqxCRmr8MlnQAIj3NgmrP6WM6gvAmC4L/0BA2eY6Ei05EkXaWluieR6BWiS5tuAs=
X-Received: by 2002:a67:c301:: with SMTP id r1mr23546292vsj.137.1552506982113; 
	Wed, 13 Mar 2019 12:56:22 -0700 (PDT)
MIME-Version: 1.0
References: <1552499826-26884-1-git-send-email-mark.asselstine@windriver.com>
	<1552499826-26884-2-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1552499826-26884-2-git-send-email-mark.asselstine@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 13 Mar 2019 12:56:10 -0700
Message-ID: <CAJ86T=U2oLy-10Y-OGVHC5r8bzEQBh_M1mAaZNK5SznQcLJqSQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] goarch.bbclass: set TARGET_GOARM as '7' for cortexa7
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
X-List-Received-Date: Wed, 13 Mar 2019 19:56:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 13, 2019 at 10:57 AM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> The cortexa7 tunings use 'cortexa7' in their tunings and do not
> include 'arm7' so we need to look for both when setting TARGET_GOARM.

Is cortexa7 a special case? Or will the same issue be there for
cortexa5, cortexa9, cortexa15, etc?

> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  meta/classes/goarch.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> index 39fea5e..077c967 100644
> --- a/meta/classes/goarch.bbclass
> +++ b/meta/classes/goarch.bbclass
> @@ -74,7 +74,7 @@ def go_map_arch(a, d):
>  def go_map_arm(a, f, d):
>      import re
>      if re.match('arm.*', a):
> -        if 'armv7' in f:
> +        if 'armv7' or 'cortexa7' in f:
>              return '7'
>          elif 'armv6' in f:
>              return '6'
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

