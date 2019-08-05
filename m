Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id E3CA07E71A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2019 17:16:43 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id z4so81738442qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Aug 2019 10:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=W/pHTiNnZ4rmfuYotrbeaJ8zBMi9/0kECinMf85bS8M=;
	b=BeK/4uY09FHssBbJdJUl6bhfiV4FKxSZYsIN2cAifx7IFIDYU1S+AOJvZX6n2TNj5g
	B250riSBXlTWkeRnv8DGc6BFKRIs/hlAqHpZG5bMcO8+6pLZz6wGdo/Jp5kiCC6Rn/0x
	aHXCf3gDzS7U2yZ9eKQYfV+d+n+WYe7TtcTfHHxmNdUt0mdQM77EyeKZ0uQ+8EHU375L
	Qi7w7aoO2E/2iiLKDtw/83GWAzPBh/7I/w36RxEuD/MZVH59eschYNdTUIA3wTimjPJI
	tRIuWK+e/kIFKJOkA0LtJuRwtipLHXAXwi/rp3jwbOHDHIGFug/Wtz39rUlTbFqiiliY
	9WWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=W/pHTiNnZ4rmfuYotrbeaJ8zBMi9/0kECinMf85bS8M=;
	b=Kn4nY1CZ5Kaxn7AWogEaK0MoSFOMJXiOcHbczxTz0SQsUrogujCj1aSqLBXPoVbocw
	o5ZS9Vla67GKMMpfSMeQAdGWO3nI1UTAOteX0/fzSKza9HBsOceyKJfXjkjVDUEM4D4c
	Ybhs1nRZWuypH2aYABwBWDmk4qDUXZW0mJn6go7OrZXmr6S16oB1i0BHoa5NmXJpEJaD
	33ANChQdLuN+5spEziaC5w0TjrALDEOqh4llDn+Enq5LDh63cGrpyT9jRmTct/ORb+c4
	oqLOm3GHc+g6jXiy3OLw7qMzSEs6qfF4SrzR0rQDHYS2EuQjZcVnlpoeFbp/d8PZNC88
	IhwA==
X-Gm-Message-State: APjAAAUL7fNSpzFYWrbJmxfvt/t/S/R6sQdeME8w5BTgUM9g6fL2RjFX
	ks3bnMm3Ekjo68oLaXrx5uWK1mVAW8I0+Njq61U=
X-Google-Smtp-Source: APXvYqw+uN5g0tlqf/gdSZdHxBt224bI5cQHxor2VtRkObap8Dk8C8NabYflZWUZi8omYDvUrnzXUhh3Cy7RTsxx/WY=
X-Received: by 2002:ac8:764f:: with SMTP id
	i15mr105394755qtr.194.1565025404382; 
	Mon, 05 Aug 2019 10:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190805113522.31021-1-alex.kanavin@gmail.com>
In-Reply-To: <20190805113522.31021-1-alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Aug 2019 10:16:18 -0700
Message-ID: <CAMKF1srYmsS06QM3qaj1gwYhmmejraPBF-3GePjztTjk10h+Ew@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libedit: fix upstream verison check
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
X-List-Received-Date: Mon, 05 Aug 2019 17:16:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 5, 2019 at 4:35 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> The default works fine; not sure why the line was added.
>

LGTM. Thanks for fixiing it

> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-devtools/libedit/libedit_20190324-3.1.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb b/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
> index 01e7f360096..6a599ebca55 100644
> --- a/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
> +++ b/meta/recipes-devtools/libedit/libedit_20190324-3.1.bb
> @@ -18,6 +18,4 @@ SRC_URI = "http://www.thrysoee.dk/editline/${BP}.tar.gz \
>  SRC_URI[md5sum] = "bec755c8044ad84b752dfe49a0b371d8"
>  SRC_URI[sha256sum] = "ac8f0f51c1cf65492e4d1e3ed2be360bda41e54633444666422fbf393bba1bae"
>
> -UPSTREAM_CHECK_REGEX = "libedit-(?P<pver>\d+(\.\d+)+)\.tar.gz"
> -
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

