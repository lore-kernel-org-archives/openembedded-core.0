Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 23B297F32F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 15:54:45 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id f16so2340679qkl.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=e2TRNZpNTELXoOaTK2XV1MGvDfRUnH1z7Y6b6Mi+gU8=;
	b=Rtp/ycJMJh3/sMAZG9rpf67lZwwYWIbyT5D3+yt5C19yezCf1F8CQTRJvaOFCs/E/Q
	mUNhjbCFpbJEnrUqeUvVa86XN3genwadSoS4E5nJAlFmemsHvmvOUD1sfFEYrGBUQxKe
	a5ZuXKqBl9yS4aRdxknseI0kLIBVE6d1NYfudJJv0/8cvhWO2mZwG48n0y36b45nlite
	qcCSWmdTylJCwtjJhbAn0Kbg4aD5YAy9kTPaWYt/cEvfTRO0EMgDnL+/d13wc6aASOC+
	f6fPS70XraJRo/kicV6f9gBIWDm/dP+95rfQTgiLorTtzz3XvyWFAtZR8kFrSD1Z/C9f
	YARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=e2TRNZpNTELXoOaTK2XV1MGvDfRUnH1z7Y6b6Mi+gU8=;
	b=uiprI6j71n/DpyirwN/mzFUQjkS+EIHtoDBy+OUZbQuomLQgRzQleRBZkmp4IYrIj6
	BH/5OHP7BlzyC0r1ar7+lFF2J8daH9SEA/ltLloITm71i9WfJ3ayAFRZ46rN7Uf8zGRH
	/pHhIdXk2VEoz6gKR0hI+uceMIt2BBDSQxUy2cPPSeAp6dQXVDrGYVKz9VT6fPZYT3LD
	oMYNhtwUWjCC3cPNYWLPKntfLcKWghi2+xWZXpgE3W01n/DnwURy+7Y0NtmwQeh52aX5
	2BvE31a7Owk/0H5yN1Zy0vlQ1nug2BYhLI+MGrY3fDbkMPJpl2rdT4PeeOqPPdxQwOzj
	jzKg==
X-Gm-Message-State: APjAAAWLgp/ImwI8OVGDYp/k+j6PA/5tkXuY873Xhcsn4U9CGLzr3P2L
	0jh8QHZQ/s+/yYWuzpTzN2Xu2r+6azAMFvUr6ygeC4/x
X-Google-Smtp-Source: APXvYqxuQiVdF72zNdSC8zsYm4J/Gbo2VHIZ5mSjKq9aFjJ94yToXBvArmvM7uUsPvNG1cDYeIjyiT02Z1KUSqyylrM=
X-Received: by 2002:a05:620a:653:: with SMTP id
	a19mr5228622qka.337.1569599685600; 
	Fri, 27 Sep 2019 08:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190927135443.15407-1-git@andred.net>
In-Reply-To: <20190927135443.15407-1-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 27 Sep 2019 08:54:17 -0700
Message-ID: <CAMKF1som6J7urVf+dxzWEtUnfWNOp0K9RdFpF4MQ+2sgH_5vNA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ruby: configure mis-detects isnan/isinf on musl
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
X-List-Received-Date: Fri, 27 Sep 2019 15:54:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2019 at 6:55 AM Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> The configure script does not detect isnan/isinf as macros
> as is the case in musl.
>
> Help it by providing the correct result via
> CACHED_CONFIGUREVARS.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> ---
>  meta/recipes-devtools/ruby/ruby_2.5.5.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-devtools/ruby/ruby_2.5.5.bb b/meta/recipes-devt=
ools/ruby/ruby_2.5.5.bb
> index 8ad59a7657..fdd3852a78 100644
> --- a/meta/recipes-devtools/ruby/ruby_2.5.5.bb
> +++ b/meta/recipes-devtools/ruby/ruby_2.5.5.bb
> @@ -32,6 +32,9 @@ EXTRA_OECONF =3D "\
>      --with-pkg-config=3Dpkg-config \
>  "
>
> +# the configure script does not detect isnan/isinf as macros
> +CACHED_CONFIGUREVARS_libc-musl +=3D "ac_cv_func_isnan=3Dyes ac_cv_func_i=
sinf=3Dyes"
> +

Please use _append_libc-musl and drop +=3D

>  do_install() {
>      oe_runmake 'DESTDIR=3D${D}' install
>  }
> --
> 2.23.0.rc1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

