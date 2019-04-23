Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD4646D494
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 22:22:15 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id s15so22157585wra.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 15:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=t8PD2dIvUtctSVLGAWNnQlQOtN4FzEU0Rq9izp+pt5o=;
	b=Wpwv9DKEVfOdxLu/ZjluS9PQSDEVY03eC+j6Tg/mLBijgQTJ0y7K5AAhOzOSBZfN9d
	9fJmWSMNlFIZUxlzA3g/IdsI9CG+fIADuR8xjHhy+fIMgKguiWQt8GRtCcyOP+akzDAq
	cHO52s9Cz9HxnG326cHHfnmO+J82pnsWql+Zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=t8PD2dIvUtctSVLGAWNnQlQOtN4FzEU0Rq9izp+pt5o=;
	b=VVKRP7AqDqGw0IUjuuyLXoXIlU+VLLiUiCIpzMNt6/NkSZqDpsOsDrX22Ke3xB97vb
	HFJsPJSm5y24q72O6hXfqWMchLD8ti8C0DMqY1WkQEysdbgfTwDF8btwaruQis6Btj/8
	aZV9ONtZtEVSUlvYNfrLvHX/M7YzFpEG6XadtktRxmy0WiYD4q/uPdt/SawmdbhkhEvJ
	mOcPDqQK5kQYRalrTIWtzcL9XwZFYtKnsD+pUPbIhbKLhjDo0WgSufetPJrlPgJMp0rT
	hEtI12+q5aSC4ORSDjxRrO8gYWYvch2wHPnvxsnwPs8AX/ICHq1dE/TkMQHnk3EdcoG0
	uGpw==
X-Gm-Message-State: APjAAAWjTrHxYIAvSX7xCyJf2oABdoMg9DfVj0W0KkLGj+WsBW6qHGaK
	Kka6nEwvYmboWnQruebTNDOh3Q==
X-Google-Smtp-Source: APXvYqxBE5q9RKgxOmaAnKSvheLhDk1JWPQOZatDFr+i+5qWsvV1WTzzLOVB1VBoUxuUK5kJrGjYlw==
X-Received: by 2002:a5d:5284:: with SMTP id c4mr18140693wrv.281.1556058136431; 
	Tue, 23 Apr 2019 15:22:16 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n18sm13241583wrt.16.2019.04.23.15.22.15
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 23 Apr 2019 15:22:15 -0700 (PDT)
Message-ID: <e6b4feb2584669c83dabbf50761f2e68b990140f.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Tom Rini <trini@konsulko.com>
Date: Tue, 23 Apr 2019 23:22:14 +0100
In-Reply-To: <20190423220106.GA30419@bill-the-cat>
References: <1555869425-7613-1-git-send-email-trini@konsulko.com>
	<1555869425-7613-2-git-send-email-trini@konsulko.com>
	<6d594af6f152f129047dd75c8d42a52e1c6e7687.camel@linuxfoundation.org>
	<20190423220106.GA30419@bill-the-cat>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] vim: Update to 8.1.1198
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
X-List-Received-Date: Tue, 23 Apr 2019 22:22:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2019-04-23 at 18:01 -0400, Tom Rini wrote:
> On Tue, Apr 23, 2019 at 04:02:49PM +0100, Richard Purdie wrote:
> > On Sun, 2019-04-21 at 13:57 -0400, Tom Rini wrote:
> > > This brings us to the current version of vim.
> > > 
> > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > ---
> > >  meta/recipes-support/vim/{vim-tiny_8.1.1017.bb => vim-
> > > tiny_8.1.1198.bb} | 0
> > >  meta/recipes-support/vim/{vim_8.1.1017.bb =>
> > > vim_8.1.1198.bb}           | 2 +-
> > >  2 files changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta/recipes-support/vim/{vim-tiny_8.1.1017.bb => vim-
> > > tiny_8.1.1198.bb} (100%)
> > >  rename meta/recipes-support/vim/{vim_8.1.1017.bb => vim_8.1.1198.bb}
> > > (98%)
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527
> 
> Does the current version even work in this case?  Digging down into
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/527/steps/7/logs/step1b
> there's a certain level of "how does that even work today then?" that
> springs to mind.
> 
> I need a few more details to know how to reproduce this locally as I
> don't see whatever must be in site.conf/etc to turn regular poky into
> no-x11.  The errors are also around iconv stuff so maybe nls is also
> removed here?  Thanks!

perhaps simpler, qemux86-world also failed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/515

with:

| /home/pokybuild/yocto-worker/qemux86-world/build/build/tmp/work/i586-
poky-linux/vim/8.1.1198-r0/recipe-sysroot-native/usr/bin/msgfmt: Cannot
convert from "ISO-8859-2" to "UTF-8". msgfmt relies on iconv(), and
iconv() does not support this conversion.
| make[2]: *** [gvim.desktop] Error 1

So perhaps there is host contamination and this works one some build
machine setups but not more minimal ones?

The build configuration hasn't changed, just the new version upgrade
and the other patch. I suppose its possible it depends which of our
workers its built upon but that seems unlikely for two world failures
(no-x11 is also a world failure).

Cheers,

Richard


