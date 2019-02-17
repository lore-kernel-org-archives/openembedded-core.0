Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id CA6917C80B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 11:19:53 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v26so14092355wmh.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Feb 2019 03:19:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=11Kvb7lzDXNhKXP9o+wpWC66ZxloA6605LaEJxpPETE=;
	b=JnZfiFY2yj5WJSPlOshQpPrl+FJej/egcZZ75Gy51gW0QsHT74n0Ry2BBbzkk4S38Z
	PB+++fGjoZCP/Bu280fmfAeuwzYn2pljalre1z+aiC1e86qekYNlTjtf3ERZduKI8Jl7
	4B6Vzkkq6b3lpHKDeHWR3t1LaZ/xccyOs7YqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=11Kvb7lzDXNhKXP9o+wpWC66ZxloA6605LaEJxpPETE=;
	b=hyrviBv0ZrlSzNExgOfwiVsfsRKA9Oo/th5Jaf3YMGNuaf8O8B8roTy9YkeBETz08Z
	4v+SUGe+IESKHo6Pzh1Z6kT+PJpSio5jJy2BfcY0YGh0FNlRzKNnAcob5eNzGe2tFuGt
	U8xvA7P/1lyiOC4MwuUT8IhlL5W+KRg5Dnf3jhOPNaY25YKJDzj9hak4IgBH/J2EpQWf
	DiYzq2TLiYtNiq1T8hU1w/4149hevXUJfrPwcrEiFygFGcezdZwxfZhrL6pkfiCfqNqR
	y1wku6PhKRS4Ce5wK1DhQNNfrMbKzb7Qjm6NbfrdKtSpzHct2tAQOWTF4yyxuaCwtqVO
	OjKw==
X-Gm-Message-State: AHQUAuYpvU17XRdkTKzXOsVnzCVOJIXU0H8gzYlhrdqkcObI0pnm/Xnb
	PGaH7iscBZRCBbqfEAyw2qFUQA==
X-Google-Smtp-Source: AHgI3IYb5fWsFqcb7ZG1v6A19xFILViLOxmgHhhQBm3MiVwPvTTcy1Reh9aMEQ51xC3mhPH0nPhWjg==
X-Received: by 2002:a1c:c60b:: with SMTP id w11mr12366585wmf.39.1550402394180; 
	Sun, 17 Feb 2019 03:19:54 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id q6sm7849883wmq.4.2019.02.17.03.19.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 17 Feb 2019 03:19:53 -0800 (PST)
Message-ID: <dcb1186cb63fc3a8558e6863061576562a63b8ae.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrej Valek <andrej.valek@siemens.com>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 17 Feb 2019 11:19:51 +0000
In-Reply-To: <d1a6ccb19112c13eed8bddba5900bd754717a804.camel@linuxfoundation.org>
References: <20190215082252.2726-1-andrej.valek@siemens.com>
	<20190216194048.6256-1-andrej.valek@siemens.com>
	<d1a6ccb19112c13eed8bddba5900bd754717a804.camel@linuxfoundation.org>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 1/2] busybox: 1.29.3 -> 1.30.1
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
X-List-Received-Date: Sun, 17 Feb 2019 11:19:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2019-02-16 at 21:38 +0000, Richard Purdie wrote:
> On Sat, 2019-02-16 at 20:40 +0100, Andrej Valek wrote:
> > - update to last stable version 1.30.1
> > - remove and refresh already merged patches
> > 
> > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > ---
> >  ...inittab_1.29.3.bb => busybox-inittab_1.30.1.bb} |  0
> >  ...te-check-CONFIG_DESKTOP-before-using-od-t.patch | 83 ----------
> > --
> > ----------
> >  ...-testsuite-check-uudecode-before-using-it.patch |  6 +-
> >  .../{busybox_1.29.3.bb => busybox_1.30.1.bb}       |  5 +-
> >  4 files changed, 5 insertions(+), 89 deletions(-)
> >  rename meta/recipes-core/busybox/{busybox-inittab_1.29.3.bb =>
> > busybox-inittab_1.30.1.bb} (100%)
> >  delete mode 100644 meta/recipes-core/busybox/busybox/0001-
> > testsuite-
> > check-CONFIG_DESKTOP-before-using-od-t.patch
> >  rename meta/recipes-core/busybox/{busybox_1.29.3.bb =>
> > busybox_1.30.1.bb} (89%)
> 
> I had a closer look at this and I think we need to refresh the
> defconfig with the new version of busybox and be explicit about the
> new things we're taking or not taking...

btw, in case it helps, I'd use meld to bring up a comparison of the
old/new defconfigs and use that to merge the pieces back we need/want.

Cheers,

Richard


