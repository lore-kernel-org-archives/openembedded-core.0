Return-Path: <claus.stovgaard@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id 690547F9B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 21:11:27 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id t14so8592756wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 13:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=UlZtOoefOSf6Ozo95IJf43TqyZEk6DYOa/u1ZGDfPf8=;
	b=f+FoG+wOnW8mKk71CwT6Q+Y492iTKDlgh7316TcIfAIpBcyR3Kq/qF5oJh5xqhOlh+
	rzn3LqkVGtr1oX2LIr9W9afqj0Id06TVzBbZ8Y64yvRkUlBQK9oWhSdBddhUi2gaQG+I
	DhP1raeOAxeSEQKLSyAfq//J7CznMymotu+yyWe5mp8ZV1h42jwrVxD63gCeLou+m5gu
	tKvLmWtWOy+5nERThu3fNw4a36pgJyfiNbRe5zZlgcdCVurb8LoLSUE/2dqEppG2cGBG
	25Tj4DZ0SPnV58D5hO1udyhVjTgQcDrp7vtPCXWFz+nBJJiBXdpmc/zkCWGlts6n0egU
	x7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=UlZtOoefOSf6Ozo95IJf43TqyZEk6DYOa/u1ZGDfPf8=;
	b=lmo19zU9hC+SvzEeP0CCph4W7uSs852VAHCeq44Gu3IHS+O5w0F8oTw1B90WOUCPqA
	In/PbhmCZzFcWfOMW8ILaam3TsS/Ol3v+xEaZWxkixEKLQSJG5Pd4ZPZ7vKsuceQywE5
	sBBxNRd/i7athQfoqBEbCig5SB1nXL2NcFNfkaRyXkVqRaBKupQkLgMhNNkQ+Nmh3w5/
	Q0nHOAUbEAXQkij2GE5wH4wj60QJPvwZkNuHPigS2NBW7oa1CdhHv7UW5l9jfG9RHnfX
	Vg1xVOwc0ehHJynUM1SJ8cvOj/MdZc+6KvJp9KGXGUwBd/tmY03RIUqsxJCRH4q5hz2Y
	Faxw==
X-Gm-Message-State: APjAAAWr8dOGefepX8ViUUfA5CrCcZrlcw0HSbDL0USjRLyMhgwc9IcQ
	dDiF7LZAEnaIDH5R8uSYGxc=
X-Google-Smtp-Source: APXvYqz6la2v/ilSk//F+eiyYlZS7qhJIK0hJLCPnXLszWW7+67SCWaV358rBYROy7tgMw+Ckr4arA==
X-Received: by 2002:a1c:4c10:: with SMTP id z16mr2185583wmf.136.1576098687740; 
	Wed, 11 Dec 2019 13:11:27 -0800 (PST)
Received: from [192.168.1.60] (0126800801.0.fullrate.ninja. [2.110.44.75])
	by smtp.gmail.com with ESMTPSA id x1sm3553958wru.50.2019.12.11.13.11.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Dec 2019 13:11:26 -0800 (PST)
Message-ID: <3f2cf400275f8439e1ced2dbb8aaf612ad43229b.camel@gmail.com>
From: claus.stovgaard@gmail.com
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, oe-core
	<openembedded-core@lists.openembedded.org>
Date: Wed, 11 Dec 2019 22:11:25 +0100
In-Reply-To: <89df20728e824340bd9f7193b01cf978@XBOX03.axis.com>
References: <8746d8e88a538d8abede3a76718fd594ca895af0.camel@gmail.com>
	<89df20728e824340bd9f7193b01cf978@XBOX03.axis.com>
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: connman dependency of readline
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
X-List-Received-Date: Wed, 11 Dec 2019 21:11:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


> > it is set to always depend on readline in the DEPENDS variable,
> > even
> > though as far as I know it is only the connmanctl which depend on
> > readline.
> > In EXTRA_OECONF the --enable-client is hardcoded.
> > 
> > The client is though not included in the image unless you also add
> > connman-client.
> > 
> > So I am thinking on creating a patch where I create a
> > PACKAGECONFIG[readline] like bluez5, as I would not need the client
> > and
> > will need not to include readline because of GPLv3.
> 
> If readline is only needed to build the connman client and it is 
> packaged in a separate package, then you are only affected by 
> readline's GPL-3.0 license if you install that package. If you do 
> not install it you are ok even if readline is needed during the 
> build. So there should not be any real need to disable the building 
> of the client.

Thanks for your reply. Was also mixing DEPENDS up with RDEPENDS inside
my head.

Before your mail I had created a small patch and sent. I was
considering just to request it beeing dropped, but on the otherhand it
make it possible to use 

INCOMPATIBLE_LICENSE = "GPL-3.0"

without getting below error. 

ERROR: Nothing PROVIDES 'readline' (but /openembedded/oe-
core/meta/recipes-connectivity/connman/connman_1.37.bb DEPENDS on or
otherwise requires it)
readline was skipped: it has an incompatible license: GPLv3+

Though fine with me if the patch is dropped.

As a side note, is there a way for specifing INCOMPATIBLE_LICENSE on an
image level, and not as here on the build level? If this is the case,
there is no need for my change at all.

Regards
Claus


