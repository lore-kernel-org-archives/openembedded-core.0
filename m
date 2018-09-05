Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id 758C774AFA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Sep 2018 14:14:01 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id k12-v6so13829639oiw.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 07:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JGPCGniBTX+kOdyOs8LVQ6BXuLgdSdeU0qgb9kqAZsI=;
	b=oDCt1LHoy5OQlOOaFBPJJlj70rWYLkplOhaqVK99wp1ZkvagcWmcIbuxdhLXEKX+Ja
	oKV5XkV3AK9xYCEL0jLM/7e22GMhTPHRgn5OtJWZW3cIA5t20qH+Pgb6oRwm7saqO3D4
	5cXZcXqgAUsC+anko0RU11N6TWY0i0ycqTXNhQWhr6oXROAIYSZHhgVf7lGbIdtykQna
	WOMCZQBWjNlJkUbF+gEr4ceRGy/3ORxOHFrHXOPMEe3GLaGVOq0EaTDDFEF4AHbGkGaA
	KU/iT0+mQiXpQkVQ+cVhAByDrBTZ9VxbGLwQMppxtyw1GJIA1btLBERdKoWJAC162D21
	+X5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JGPCGniBTX+kOdyOs8LVQ6BXuLgdSdeU0qgb9kqAZsI=;
	b=Wk/4yov28k69V93oa5Zu2lJmcz1JynXGi1prMEc9nZMmibwljm6QeNUkZzuVyHJaas
	Y9zbIEoSPGApkPd72Hps6UHIqATRlmvbm2ezTyg5j1tbppV+bz2R/vcvNklMs+bKQdjS
	UuI0q918G/iE1m6sB2kmMn4uPLsqYTVrqrd2g6GdrUdfAH5B2qVirAv/tixzxAGINgT5
	IYDhI4TqBNdZ1quTWfELDdgxNe4P0CiERyZz3JtxlfdZGIyIYJNUEMa35c78+ZuD2w2v
	2thM/Wu6A3sYqFwsTZDEIwOJDXktHpSqvVK+ynaUTYmAQoP3Fji8xVWolZbbJTW9EyoX
	vzwQ==
X-Gm-Message-State: APzg51C1oqocGID146FeygwAqKGZQ58hiMr39QCycwE+iOn1q5BHovya
	T+tdAL279ZHs0oXZSBekegr+qvl0WJYEav6dKLPqow==
X-Google-Smtp-Source: ANB0VdbGuV57pDupsAUNMANJ775p99AUzfeqb2ww+iCZytwIU8o77G2K73pGY2MqY1xQpKbepFbMXS7cLN0VCYjG9ic=
X-Received: by 2002:aca:d015:: with SMTP id
	h21-v6mr31703258oig.142.1536156842314; 
	Wed, 05 Sep 2018 07:14:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:5c9b:0:0:0:0:0 with HTTP;
	Wed, 5 Sep 2018 07:14:01 -0700 (PDT)
In-Reply-To: <CAMvyGd-9c41OHDgy1qaxhiNyQwH9Hf9Nzo3bqfw+fanGF-AdNg@mail.gmail.com>
References: <CAMvyGd-9c41OHDgy1qaxhiNyQwH9Hf9Nzo3bqfw+fanGF-AdNg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Sep 2018 16:14:01 +0200
Message-ID: <CANNYZj9_WHwO4iM1dkhQDKkBXfeNyNdA7cAioh7=D-5DEgLb2A@mail.gmail.com>
To: Tarun Tej K <tarun4690@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: bitbake gstreamer1.0 : "Nothing PROVIDES 'gobject-introspection'"
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
X-List-Received-Date: Wed, 05 Sep 2018 14:14:01 -0000
Content-Type: text/plain; charset="UTF-8"

What is the issue though? You need to be clear about it: paste the
exact, specific error message you are getting.

Generally, I would recommend that you update to the latest YP release
first. Backporting recipes in this fashion is a complicated task.



Alex

2018-09-05 15:36 GMT+02:00 Tarun Tej K <tarun4690@gmail.com>:
> Hi,
>
> I am trying to build the latest gstreamer version 1.14.2 using the yocto
> recipes from
> https://github.com/openembedded/openembedded-core/tree/master/meta/recipes-multimedia/gstreamer
>
> I have added new version recipes to my custom yocto layer; added the
> required .bbclass files to 'classes' directory inside my custom layer. There
> are older version (1.4.5, 1.6.0) recipes in other layers but my layer has
> higher priority so the 'bitbake -s' shows 1.14.2 as the version of gstreamer
> family, so that proves the recipes are successfully parsed.
>
> After that I am trying to build gstreamer1.0 using the command 'bitbake
> gstreamer1.0' but I get an error saying
> Nothing PROVIDES 'gobject-introspection' ..........
> Close matches:
> gobject-introspection-stub
> gobject-introspection-native
>
> I have verified that the gobject-introspection.bbclass file has been added
> to classed directory of my layer. I have removed gobject-introspection from
> the inherit list in the  gstreamer1.0_1.14.2.bb and it successfully
> continued to bitbake until some 'installed but not shipped' error occurred
> at do_package_qa task. Also another class 'upstream-version-is-even.bbclass'
> is also inherited by gstreamer1.0_1.14.2.bb and that is also present in same
> directory as gobject-introspection.bbclass but I don't get any error with
> that.
>
> I am using the yocto setup cloned from freescale's repository
> (http://git.freescale.com/git/cgit.cgi/imx/fsl-arm-yocto-bsp.git/tree/imx-4.1.15-1.1.2.xml?h=imx-4.1.15-1.0.0_ga),
> so this might contain older dependency libraries. Also the bitbake version
> is 1.28.0
>
> What could be the problem? Please let me know if I need to provide any
> additional information to understand issue better.
>
> Thanks
> Tarun
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

