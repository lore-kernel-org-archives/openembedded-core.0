Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id D67B076104;
	Wed, 16 Sep 2015 21:17:30 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so43110877igb.0;
	Wed, 16 Sep 2015 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=spUFsMzh04fYNuywQAmPbKpYJwTEJbgNE5xFbvnuN64=;
	b=OnFuf5Guba1HVY/t350SiyvpGDXBcsUipC65YX25wH/B+ALJgvWrgiLwmmDR5xpa4o
	ysaiilBt7PnEEJWYgLN9URrFx/+lc3ZgBfHgwscyjpc2PTcC79gj7KCh5UyUPZRO/PXP
	QkSkgrJBK/CurLx5OMrVMBGLgtcENMziPtlAAzJLKzGA3ztB/zJXH9lvj0cK9ntGu1Ui
	qZlxPEam81KRA0eePeUB2nG6Q0oV+S2BYavQF19CWNUrZAT58jDyKtNhgtwfj0vaoJPZ
	EvowRv3ARZrZIJVURJB38Edi2YtB70vUAPa9AabMvW5IHgl3Nr9btkfOhMP550tTgqKt
	4ibA==
MIME-Version: 1.0
X-Received: by 10.50.82.40 with SMTP id f8mr514202igy.78.1442438250498; Wed,
	16 Sep 2015 14:17:30 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Wed, 16 Sep 2015 14:17:30 -0700 (PDT)
In-Reply-To: <80e3806f09d6c399ccd4ccdf5f83997386ec85bc.1441929533.git.raj.khem@gmail.com>
References: <cover.1441929533.git.raj.khem@gmail.com>
	<e4c70967dd05d254bd59bd4f8a49836c3d499bfb.1441929533.git.raj.khem@gmail.com>
	<80e3806f09d6c399ccd4ccdf5f83997386ec85bc.1441929533.git.raj.khem@gmail.com>
Date: Wed, 16 Sep 2015 23:17:30 +0200
Message-ID: <CALbNGRR=LAdpubkJGdfx=mx5FGiVW=YDTObwRN8JLAnSfiPc=g@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 2/3] systemd: Upgrade 219 -> 225
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
X-List-Received-Date: Wed, 16 Sep 2015 21:17:32 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 11, 2015 at 2:19 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Drop patches that were straight backports from upstream
>
> MIT licence was unused and dropped from systemd sources
> for more details see
> https://github.com/systemd/systemd/commit/8f1e0c5f38cdf7e401ab4d2bb93ad816d08e7715
>
> Drop gtkdoc dependency since libudev API documentation has been converted from gtkdoc into man pages
> Remove packaging gudev as it has moved to separate repository outside
> systemd
>
Is anybody preparing patches for gudev (many packets in meta-oe require it)?

If not I can do so. Is the home for libgudev oe-core or better meta-oe?

Andreas

