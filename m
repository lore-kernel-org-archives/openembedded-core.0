Return-Path: <kirgene@gmail.com>
Received: from mail-qe0-f42.google.com (mail-qe0-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id B82AD60EE0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 18:31:40 +0000 (UTC)
Received: by mail-qe0-f42.google.com with SMTP id b4so4515430qen.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Dec 2013 10:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=V0HiQCE8/b3OxPm5ybNV4PtXvAOHj0jTaahbBN7KZRw=;
	b=wd1GZeVzp1urJbIgBxIIdcPPSs1qUluudS6liqLzN5Y2ZvkyuultTBe0yt++P4ke8P
	tMNUpvvSmo+N/0UdqzPD48iZ+jfILO7eYluT311G7VqV/tEYYFLltyPo5OSJH/m9Dp51
	OYFQ5297/yoySHcCwBi89EVetfvNsqKmNV6BJT6wX5x72lSZ6IRidOz0pZ3CuzndrnFB
	lYC49uATBHp6kwsWaR9HgKkED3dLgyoaSAFkZXjKxpAajTplbrmz1kUacTstD4XNE8Ro
	rGOmKdnMi0q89qmadweA4I53YskuPs4c1DJIQvgBFXy50U+XTedkYrDqvyay/bKkVGr9
	gTjA==
MIME-Version: 1.0
X-Received: by 10.49.1.106 with SMTP id 10mr197161368qel.55.1386700299841;
	Tue, 10 Dec 2013 10:31:39 -0800 (PST)
Received: by 10.96.177.105 with HTTP; Tue, 10 Dec 2013 10:31:39 -0800 (PST)
In-Reply-To: <CAJTo0LYZ++Jn2A0y1LPtVqJuPZxHQ7waBUPiNA9xbmEqzsTW8Q@mail.gmail.com>
References: <1386695884-27586-1-git-send-email-kirgene@gmail.com>
	<CAJTo0LYZ++Jn2A0y1LPtVqJuPZxHQ7waBUPiNA9xbmEqzsTW8Q@mail.gmail.com>
Date: Tue, 10 Dec 2013 20:31:39 +0200
Message-ID: <CADV-EXH_DTE7HbOanmB3-WJHPpyZsfWzqf-CC01N3bOfc-n3XA@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] psplash: add support for systems without mmap support.
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
X-List-Received-Date: Tue, 10 Dec 2013 18:31:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

2013/12/10 Burton, Ross <ross.burton@intel.com>:
> Surely if your system has a broken mmap() you've got far bigger
> problems than the splash screen not working?

I'm using Intel Cedartrail platform where mmap is not working properly
with framebuffer.
It's a framebuffer driver problem and such problem may be present on
other platforms too.
Everything else is working as expected.

>
> Also, we're upstream for this so instead of patching the recipe, file
> a bug with a patch for psplash itself.

I had already asked a question here about how I can submit this changes.
I was told to send email to someone of developers of psplash.
I send email to Richard Purdie but there was no reply.

So now I decided to send a patch for psplash recipe.

Best regards,
Yevhen

