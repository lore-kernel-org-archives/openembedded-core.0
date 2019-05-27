Return-Path: <nick83ola@gmail.com>
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by mail.openembedded.org (Postfix) with ESMTP id C44977E05F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 15:57:39 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id 14so15116511ljj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 May 2019 08:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sr7dGnCbJOt/xTO3xOeVi7+33UEicn/ZXk+j9BzqEjU=;
	b=ktBg3hVSYL43LDzrFW+s8e6xz19gC6i6leYJBy+duTSSV9utGW29ZkE3pvYM5Vo2bX
	Bl6raa68PZmtK0G8PljJhcYafjmEqCgq/Z6/bUMYAGaryRJM66JeM8IxED8WFy04RioD
	6D2cQ0lNgd4uTpQGIa/z4JqTTpdbckq/KcvAGc4xNKYGyAesGusUXo8rVBROp+B4Xu/b
	VT5IvNEQcuZcWnMRDA6xiAhH2brO5M2SX0quxUzk5/79qSl/jE5j/lm7MMC5EqTO3toY
	lSVAvZpSmYN67YJOK5fbm90CgytZhyRjF3rEFcrSawiAWZW+DYaG5PKigD5zH1fpWeW6
	/KHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sr7dGnCbJOt/xTO3xOeVi7+33UEicn/ZXk+j9BzqEjU=;
	b=Bx0ZT0BHbpFadRmDw+2zH1mhqrO/uDSzCFaoWtKEsRnRUfuYC7ve5jC8Mum0Lu15ml
	E/3kxb0CPou+cimDUapLAVOgSc+vBcT3VryhLOS1sgy06QYo65O/OBT6ul/hBgjz/qhN
	BQ2XNJcrJFO1NHdvWWOv0MlhDDchsUuM+eQW6Naa96IZyIK47zfKBoxetHAa3jlCmffl
	9SjthfQ1VvIlY8DHdxNwjhdwY0B7RfnP4iu3dTVZRzlAqYj9yHZ9EeW7cdGFlVHuBkJN
	8RXUZV1Dz/BWLm1hNGBcAiDnHZ7QQbz5SFEEmRtTs61FTcBpJ+JN7bZWl9VHX7+rmjDG
	UflA==
X-Gm-Message-State: APjAAAUwaRsdVQdr0hm04BZUXxzxfNSadRRC1F5lthezsCPWILEoO9Us
	rjPBs2beKJB67dN5uwQGy5BOOkYxaxkfXYbjuZA=
X-Google-Smtp-Source: APXvYqykXDQa5th2FlWA39aj/S5XqFpFqFoAd7NXKs+VLdG1Sr3epPXNWI2V+BNx0Po3BqC4seLdcBzk6wpQ64TR0Aw=
X-Received: by 2002:a2e:249:: with SMTP id 70mr58752524ljc.178.1558972660445; 
	Mon, 27 May 2019 08:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190524143659.23751-1-nick83ola@gmail.com>
	<75b746c6-1545-0ae6-850b-6bc3685d5251@gmail.com>
In-Reply-To: <75b746c6-1545-0ae6-850b-6bc3685d5251@gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Mon, 27 May 2019 16:57:29 +0100
Message-ID: <CABPh3UN8yiEf8Wm1RFR5H_dwk_0MxTGGnqSTW4ZrQnW0jjjOLg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] nginx: fix kill path in nginx systemd unit file
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
X-List-Received-Date: Mon, 27 May 2019 15:57:40 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks (and sorry again)

On Fri, 24 May 2019 at 17:27, akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 5/24/19 7:36 AM, Nicola Lunghi wrote:
> > Signed-off-by: Nicola Lunghi <nick83ola@gmail.com>
> > ---
> >  meta-webserver/recipes-httpd/nginx/files/nginx.service | 2 +-
> >  meta-webserver/recipes-httpd/nginx/nginx.inc           | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
>
> Wrong mailing list.
>
> please send to openembedded-devel@lists.openembedded.org
>
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service b/meta-webserver/recipes-httpd/nginx/files/nginx.service
> > index c6fc0495f..9a6ca9651 100644
> > --- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
> > +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
> > @@ -8,7 +8,7 @@ PIDFile=/run/nginx/nginx.pid
> >  ExecStartPre=@SBINDIR@/nginx -t
> >  ExecStart=@SBINDIR@/nginx
> >  ExecReload=@SBINDIR@/nginx -s reload
> > -ExecStop=@BINDIR@/kill -s QUIT $MAINPID
> > +ExecStop=@BASE_BINDIR@/kill -s QUIT $MAINPID
> >  PrivateTmp=true
> >
> >  [Install]
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > index 29e7efc14..c4c776e37 100644
> > --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > @@ -134,7 +134,7 @@ do_install () {
> >          sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
> >              -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
> >              -e 's,@SBINDIR@,${sbindir},g' \
> > -            -e 's,@BINDIR@,${bindir},g' \
> > +            -e 's,@BASE_BINDIR@,${base_bindir},g' \
> >              ${D}${systemd_unitdir}/system/nginx.service
> >      fi
> >  }
>

