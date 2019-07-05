Return-Path: <lemagoup@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9E4FE7E947
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 09:35:02 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id o9so2258706iom.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Jul 2019 02:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=guAhZ+3yywbslq/0e0hLXfjBW9Ub9pJC8xGCKd00skY=;
	b=TZDAP4iKGQPHMFe183cDWnPirTdkLHkk/1r4Qx9Wc3Pt3NcNN6PB0SBOb30463INd6
	cN0EnV0XtOV63JdN67HVEFxk5wgrggPz8upzOeYS+lYphRLRDqfstwFJjyccajMstKvw
	ilsCgKZ8Vq6TePbZILxhpzDjdzxREg4DzWFgZHKixlFpO0rYAiDOyWaD/Ln1jiuIgV5p
	L8N2RiCb5haLxdCpcITfUNzBqt2KLIixoq8cYUFrotljTklM6kkMbeek6lXDSMMlmLfJ
	Q668C9Bs6GvsU7IaWsrIAKDzrMCwLUwozQ8DiXT9RbxHR/Ml5NUZRxCGLg8hzGT3XAk1
	5AvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=guAhZ+3yywbslq/0e0hLXfjBW9Ub9pJC8xGCKd00skY=;
	b=b2NO2EFsirUgKg4y5TbiIzZ9SznsVUstHdjV+W8jye4efV26Bi0emFUvUD2+fRD9hL
	g6FPiaWhbzs4Y+wsydr3DviU1ljoXSqaZZGRTndUtMywneu+BIrvsZon+ZF3/je96KdN
	L9e7SKy0cg1uBL3Bmi8fxhRp63ll2sIzbiZE0YP5eZR99ZSEJKuxD7YQppXWVr1Ody8r
	tpk+Bo22SEaVigAYhJDzpp+9oNmss67Ychc7pia3/HyCmYUoXYFNcMjg+gGtJ+6Hb720
	XCn/P3JZDvH9ob/Ut5auO2pC9uTMcVkWbEWwrbsbYv7t4mO46qUb23XdUxtMzenGlSL8
	Z9zg==
X-Gm-Message-State: APjAAAX8IcUq6isjGOlD13C2y1sQt+aUVBuE+C2SUluGsK/AZIo2tsHl
	20U2i7VjDI8t1AwU8EUbwWkDbQ1Vfl7jmBq1pdo=
X-Google-Smtp-Source: APXvYqyQpDZWTS4s0oJY3b/a8vkX1okNpD4fSU/ek7ASck+aDyiwx6mNm2cYLx9HMxjHsZZ+NPyp63GnApQiOsF4Uak=
X-Received: by 2002:a5d:890d:: with SMTP id b13mr2951253ion.124.1562319303596; 
	Fri, 05 Jul 2019 02:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190704151908.5094-1-lemagoup@gmail.com>
	<32465019cfec55c922f3dc15ec563812ef22ffda.camel@linuxfoundation.org>
In-Reply-To: <32465019cfec55c922f3dc15ec563812ef22ffda.camel@linuxfoundation.org>
From: Pierre Le Magourou <lemagoup@gmail.com>
Date: Fri, 5 Jul 2019 11:34:52 +0200
Message-ID: <CAEz4NHrcBrVkca7rhipG_ybLKvAFOdnWPObuThBtO2taxeMEHg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] cve-check: Depends on cve-update-db-native
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
X-List-Received-Date: Fri, 05 Jul 2019 09:35:02 -0000
Content-Type: text/plain; charset="UTF-8"

Hello,

> > From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
> >
> > do_populate_cve_db is a native task.
> >
> > Signed-off-by: Pierre Le Magourou <
> > pierre.lemagourou@softbankrobotics.com>
> > ---
> >  meta/classes/cve-check.bbclass          | 2 +-
> >  meta/recipes-core/meta/cve-update-db.bb | 1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/1015
>
> :(

The autobuilder job launches cve-update-db and cve-update-db-native in
parallel, this cannot work because they both try to update the same
sqlite db.
As cve-update-db is only used for the build machine (native only), we
only need a cve-update-db-native.bb recipe. I'll send a v2 patch to
fix that.

ps: Sorry I just realized I was sending the patches to the wrong
destination (meta-oe instead of oe-core)

Pierre

