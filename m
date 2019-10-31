Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id ED0837F940
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 09:56:48 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id p8so4838836ilp.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 02:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Xf2q1zXwEEz9y3s4aH4zjm+f0buXcjKuO3gM4q8cAJM=;
	b=koDqI3M3b5++NhF0thPs8GhthFqkYPJC4YdlxMAoCnq9cVyyPjmpSGujFev5kOeBAz
	OqnLMNoO9+hMOPl2CVGL5Vlu2hQoBHYIz9ZnQ1oGMKbkU43qTxkLnRjIi6MrDqbKshNR
	Urcv5Hmb96ylzFjMPGXKNUCLtL3NLRz35GnHALgY4RiIt489ZlmRmkDg2EwhEO+5oPGK
	94FyIoyXsMPg/HLAUiOUeZs2vI6QXPlzeZc0fnevpzbyyq1L5HnA1oAoXALLo8bQRS+H
	d4V55+Z6xfrVlXRhmDXfu9+FOsJ2Xa07VF8LUBGRUjsvzIy2gslsYNe4ov9OlqWXD58f
	sGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Xf2q1zXwEEz9y3s4aH4zjm+f0buXcjKuO3gM4q8cAJM=;
	b=r2qFW2L3Rxig3kY0mFrTByoWxw+rIROZpgOTDpF7NwWiHh34RwqoVuiAcUzT25DmjS
	xxLYsOzQs6wPk3ICRBtkkhi+dO5k5rv3LZ7BWsWqvsg9F7Broq5qdxLqZL6eqtdpDubX
	l8pua6YnJB5ApRUnQ5V64MqFRx6ZxOADGwzhBisOG+M43FSUbLctNUADZTSK2VSIxBMx
	dxO+Pu7/aNhECJSzG6uz2ktkEJ7tTcy+KpLJnruUGO5DzHVnTrg7vo2TeqrT7a9szzAI
	DLi2x/S+tvofyvP3tQP5DNuXQ23caXHQdR0BPtpJOdUJco7fwGQuRnzvI+bB1jus2Gr7
	5qBw==
X-Gm-Message-State: APjAAAVoNo/4PvS59qYlM9Atwz8mRRptlpbbQlyr6GgqUqhF3Te8pnTJ
	fnJLQ3MQ5vXP3HhsxLj4JsnO2XiMs8iER6ak/lw=
X-Google-Smtp-Source: APXvYqwPGX1cW3vwf6dw0EhiXj1Kg4xlvDECZxsA4eSOAMFAaFD2IHSgyFSG6dUsDk/v6EV/Fe+bwvo+s3y+i78fXlk=
X-Received: by 2002:a92:1305:: with SMTP id 5mr5237243ilt.299.1572515810007;
	Thu, 31 Oct 2019 02:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
	<20191031093655.14852-4-alex.kanavin@gmail.com>
In-Reply-To: <20191031093655.14852-4-alex.kanavin@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 31 Oct 2019 10:56:38 +0100
Message-ID: <CALbNGRTuGXc+fsXezqxBttBcz1LomdLyuNMotzJGFMgO6gBgaA@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/6] gcr: update to 3.34.0
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
X-List-Received-Date: Thu, 31 Oct 2019 09:56:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 31, 2019 at 10:38 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> inherit gettext, as gcr is now gettextized.
>
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>  meta/recipes-gnome/gcr/{gcr_3.28.1.bb => gcr_3.34.0.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-gnome/gcr/{gcr_3.28.1.bb => gcr_3.34.0.bb} (83%)
>
> diff --git a/meta/recipes-gnome/gcr/gcr_3.28.1.bb b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
> similarity index 83%
> rename from meta/recipes-gnome/gcr/gcr_3.28.1.bb
> rename to meta/recipes-gnome/gcr/gcr_3.34.0.bb
> index 0a9867451ee..f13bfecbe19 100644
> --- a/meta/recipes-gnome/gcr/gcr_3.28.1.bb
> +++ b/meta/recipes-gnome/gcr/gcr_3.34.0.bb
> @@ -11,12 +11,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
>  DEPENDS = "intltool-native gtk+3 p11-kit glib-2.0 libgcrypt \
>             ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
Don't know if this is a complete V2. If so intltool-native dependency
can go (as Ross suggested).

Andreas

