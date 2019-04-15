Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D4ACB7D8E4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 08:06:13 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id y197so7256147wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 01:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=hyJMfNl/xImgjfRJwJK/ZnbhRF9nvO10OxX18oih8Uw=;
	b=G3ONTr9JjhxgLfwYyOqBOz9KIujPW4o641UB4R+GZEmGkCpPM3dWK4uGi9PtglsEIk
	zN/YTYQtc+uXP2GnMx2w6SSSY6uiW3VEJJE8IEN7zd1yyHNUbyme7pqU/Mfou+zMcRUH
	raEhnrSB48xQJXy2p8U6B0ozKWjK0vUG7CidM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=hyJMfNl/xImgjfRJwJK/ZnbhRF9nvO10OxX18oih8Uw=;
	b=p8kj0i6+oj6F27Gi+qKnx7St9BGXiuNq47GSk1REvRPxGafVEmvtSSQL4HZP8KPe5Q
	cW+2AfNC/5DmwZuOqiCojgVuUTj04OezHeDewoHFhlddlUwfytt+6WVq+sDgbDRoTeqL
	e2xOuEddAji3eDj4m9YBkB7V+rH4xVAJxYo5b63vsxC0EOkvGRq5swdIjrUas7KEzNh5
	CiEOqkmaNr1XCLtvHiC6yPzj8+7pUqdB0u6kSN+vYTnbvrs/PlX86IExj4DLJSjgdzdI
	CvVaN96GJ5RZEyCZPbwZ844ru0WeWhhA0h9eNm4TFjx00WOXqEYr/AiYrSTsZHiTL62b
	NByQ==
X-Gm-Message-State: APjAAAVhVi4Rx1nlhW5AfwWDREsiQ6pk7lL1sgFhKcI0k4mcBvry4ADn
	NOoex8hH1+hpfSPBiShWjgJFNQ==
X-Google-Smtp-Source: APXvYqw4d1KwDMOW66N8GmkAUSe8mFRzghyAm+E3wB2EwnEDHBbh7jAnSB58jEb11MlxkpHl7kwk+Q==
X-Received: by 2002:a1c:1b10:: with SMTP id b16mr22134928wmb.90.1555315574633; 
	Mon, 15 Apr 2019 01:06:14 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o12sm49086182wrx.92.2019.04.15.01.06.13
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 15 Apr 2019 01:06:13 -0700 (PDT)
Message-ID: <21cc3e7248d8e702f49de8818f26e2e53a001ed1.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Yu, Mingli" <mingli.yu@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 09:06:12 +0100
In-Reply-To: <5CB43C2A.4050908@windriver.com>
References: <23562ca03db97ef41bbb2e6365ecde4bd715438d.camel@linuxfoundation.org>
	<1555314041-117426-1-git-send-email-mingli.yu@windriver.com>
	<8879daf5747ec05fa2430354dbd38cc3ae5e1cd5.camel@linuxfoundation.org>
	<5CB43C2A.4050908@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH v2] nettle: fix ptest failure
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
X-List-Received-Date: Mon, 15 Apr 2019 08:06:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2019-04-15 at 16:09 +0800, Yu, Mingli wrote:
> 
> On 2019年04月15日 15:59, richard.purdie@linuxfoundation.org wrote:
> > On Mon, 2019-04-15 at 15:40 +0800, mingli.yu@windriver.com wrote:
> > > ---- a/testsuite/dlopen-test.c	2016-10-01 00:28:38.000000000
> > > -0700
> > > -+++ b/testsuite/dlopen-test.c	2017-10-13 11:08:57.227572860
> > > -0700
> > > -@@ -9,7 +9,7 @@
> > > +diff --git a/testsuite/dlopen-test.c b/testsuite/dlopen-test.c
> > > +index 99d3535..92de9f8 100644
> > > +--- a/testsuite/dlopen-test.c
> > > ++++ b/testsuite/dlopen-test.c
> > > +@@ -9,7 +9,9 @@ int
> > >    main (int argc UNUSED, char **argv UNUSED)
> > >    {
> > >    #if HAVE_LIBDL
> > >   -  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
> > >   +  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
> > > ++  if (!handle)
> > > ++     handle = dlopen ("/usr/lib64/libnettle.so", RTLD_NOW);
> > >      int (*get_version)(void);
> > >      if (!handle)
> > >        {
> > 
> > What happens on a 32 bit system?
> > 
> > You can't hardcode a specific libdir like that!
> 
> I just rework the patch dlopen-test.patch which Juro Bystricky
> generated 
> before, the previous patch only check /usr/lib/libnettle.so and I 
> updated it also to check /usr/lib64/libnettle.so if no 
> /usr/lib/libnettle.so exist.
>   -  void *handle = dlopen ("../libnettle.so", RTLD_NOW);
>   +  void *handle = dlopen ("/usr/lib/libnettle.so", RTLD_NOW);
> ++  if (!handle)
> ++     handle = dlopen ("/usr/lib64/libnettle.so", RTLD_NOW);

What happens on x32? n32? or if I set libdir to lib32?

Cheers,

Richard




