Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id BCD047CDF6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 17:37:48 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id z18so12222551vso.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 10:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UYa9PylPxHjLofzuCSKAspoU0jS6eK8mwk4wn5isqVo=;
	b=rRaMtn+LBjRNo2MT4kkQBh/gRxTrXp3ESZUUTLrtgwxaeLvC6HdkE/YreVpt78cWtS
	HeKbwUAef+8h+SvIhCEZesRPOtZ+hvBeB5cUIN1FBqR5U8I3075gjh8G12fUqqmaHTSH
	gIAKtnuthffbtaIzIAWNOwxVh9KhR/owLO8b+AGZhX3KqCdsvE+t2V/Gjav2fCV+hNzZ
	Qh9ODMdQoBcOAUJrrq8tmIHXFVSylWABa4DvsfZCbVQqk9BotX4tEcfURRzw1rcohDfU
	X4+kCqLzWTVd1zwgWuGIYtoLiSjWuENU7m8Ja9Kz+7K2SbE+OxuOgacYmoToDu94AyTD
	XK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UYa9PylPxHjLofzuCSKAspoU0jS6eK8mwk4wn5isqVo=;
	b=Zo/AoNHlj9wvso17aw5D6M0Moq2qVFM813J72WQW6UuXwKrNIKCJ78rFjbjuiVy0k3
	OgRCyYtNc1mSeTqxYEwLWZ75HIAA4SqdGj3g8LH4dqG0fZSddhpEGMI73QtQaNg/HCbs
	gIohW2G2IeJl+od4tL/f87hwaRBzc828SqYrxtDbXqYRY770lAsxDw2yxQiRh0rFSGOm
	9bBRsOWk7YQ+FZy7ZxJM+Gn8rlP3ZKdeqpetRNrlSQlTHd3NsAYroB+mkH54Bh7nT1Kg
	v3x30SagugDCPBaZR0FIDoqZ+rb7c/opOJNBdabYWTuqmLVq5+fz+IVLP96XY8wMcz/9
	9Oug==
X-Gm-Message-State: APjAAAUSGG6Uic/V32akXkT/U/5oBd5sKKpLQfQEowhmfZVymi+WwNbR
	kMrsdB5jTGwj6t0xLX1omTJ8UBdoexvgQgu0TsSMhPpi
X-Google-Smtp-Source: APXvYqxVFUlSZd4lVtjiDMYsbI2/P18voN9kwqbAihtYZQdXYkBCRBn67yu1kwYtfFAji5oOY1QZs6SLaRvAK5raViI=
X-Received: by 2002:a67:8588:: with SMTP id h130mr2203015vsd.11.1553017069465; 
	Tue, 19 Mar 2019 10:37:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190319135727.31246-1-otavio@ossystems.com.br>
In-Reply-To: <20190319135727.31246-1-otavio@ossystems.com.br>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 19 Mar 2019 10:37:37 -0700
Message-ID: <CAJ86T=XEpJ2AB_3azYJi9+Lm=RnVxQMHTrOg4NL941850zcH3w@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/2] openssl: Remove the c_rehash shell re-implementation
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
X-List-Received-Date: Tue, 19 Mar 2019 17:37:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 19, 2019 at 6:57 AM Otavio Salvador <otavio@ossystems.com.br> wrote:
>
> We had a c_rehash shell re-implementation being used for the native
> package however the ca-certificates now uses the openssl rehash
> internal application so there is no use for the c_rehash anymore.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>
> Changes in v4:
> - remove perlnative requirement

You actually removed hostperl-runtime-native, not perl-native. It's
not really correct though - the hostperl-runtime-native dependency is
there to ensure we can run the openssl Configure script, not because
of c_rehash.

In practice it makes no difference as hostperl-runtime-native is
mentioned in ASSUME_PROVIDED, but for correctness it shouldn't be
removed.

> Changes in v3:
> - remove c_rehash completely
> - fix ca-certificates recipe comment
>
> Changes in v2:
> - updated commit log
>

