Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 135B3748A9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 May 2018 02:17:01 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id p14-v6so7972450pfh.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 19:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GuQW+jkqGQ9eZ1kku8/AXu0H+EbvU0BA4z9V/GAJSe8=;
	b=sGIjupcH9fqLMFtukQpkTtuK9YcL8tOhz8Dy6WbadOZAB43KY0VUqArzLAjSo+8TW0
	OZWojazczrPI0KBrwPIeniPbpdU1nNgADFmQ+mcQvXH8Gji6os529hMp/yNEURJjCZg6
	uU2yWcHQfkRSrfqf3MQVTguh/fENrKvepIFtGsFCVtHS8xAIuxlAj9UiZuHSesoyDJoQ
	bj4nHhnk2id1T+XAJ8hRXL4i2+aDMg26pmstWZLI9YlMeJmGUdcR+fhK6NJXVu/ZrXMS
	4rLNuESw49AttE8lAwVdJRmoZpAtPoAtKIaUfiDzeqzW69u0QOKYrCu9ji3ny3U0eAnA
	Py8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GuQW+jkqGQ9eZ1kku8/AXu0H+EbvU0BA4z9V/GAJSe8=;
	b=DgaD27vIEJJI3NIrFoDwc+CxLi/juXqjhNaDRI8l7pRHqtXq/ndrS/LV3/wGS4SuDW
	r3xFtuncwZm035vfKA2oywMLs6BZbQlI4h9YXkzkKjiBSmNqTPHMH0HIbUbm9xl9+rRC
	IGjosg5gfclZDxMhis88HjtZ3AW21XSXxpsnYqNRw/YMU92z7N4uZORd65RcdFIE8ffx
	F7wKF8VKs3G3KHUjctLSaLHki4KOn59UlQqcCjiAWTNPpQjx5rtamRObIzU4EJqVggkr
	2v1llsdwRxEJDqDakPnhsx0L+zKCbNFnsVdWMs1OT4vaHSml9ZuS6cGLrYFCgFd85FfO
	Awkw==
X-Gm-Message-State: ALKqPwfq2QVrczSAyYL2fkzfv8M5OYv/yZ0DD0Bm8QA5NebwOobsjPAz
	9OElSOhVt248qII4DnkHBzAzlxOKAFa2pNzn8LM=
X-Google-Smtp-Source: AB8JxZooLN2f35rxm/pNEzycZhVtakzqvWy2ld9v5iqEAWjSFqeojuwJq4BTu10URNojL797qUweBBGvBe76x74b2Fo=
X-Received: by 2002:a62:3c10:: with SMTP id
	j16-v6mr22272315pfa.7.1526955422817; 
	Mon, 21 May 2018 19:17:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:90a:8b91:0:0:0:0 with HTTP; Mon, 21 May 2018 19:16:32
	-0700 (PDT)
In-Reply-To: <F01F1AFA-0DE4-4153-A28B-04C5756825E8@gmail.com>
References: <F01F1AFA-0DE4-4153-A28B-04C5756825E8@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 May 2018 22:16:32 -0400
Message-ID: <CAMKF1srTZKdZkW7mcsw5sEz5TDQpMegFFsd4D+QtXxcFJtT6aw@mail.gmail.com>
To: Jens Rehsack <rehsack@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] cpan_build.bbclass: tell Module::Build the replacement
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
X-List-Received-Date: Tue, 22 May 2018 02:17:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 21, 2018 at 11:49 AM, Jens Rehsack <rehsack@gmail.com> wrote:
> Instead of patching Module::Build, maybe Module::Build::Tiny and all other
> similar tools, use the official way to tell them which is the target perl
> on target.
>
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/classes/cpan_build.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/classes/cpan_build.bbclass b/meta/classes/cpan_build.bbclass
> index fac074d610..c2491061fa 100644
> --- a/meta/classes/cpan_build.bbclass
> +++ b/meta/classes/cpan_build.bbclass
> @@ -30,7 +30,7 @@ cpan_build_do_configure () {
>  }
>
>  cpan_build_do_compile () {
> -        perl Build verbose=1
> +        perl Build --perl "/usr/bin/perl" verbose=1

perhaps using $[bindir} instead of hardcoding /usr/bin would be better here

>  }
>
>  cpan_build_do_install () {
> --
> Jens Rehsack - rehsack@gmail.com
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

