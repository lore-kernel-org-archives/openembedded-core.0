Return-Path: <armccurdy@gmail.com>
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
	[209.85.222.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8A16E7DE82
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2019 02:07:59 +0000 (UTC)
Received: by mail-ua1-f68.google.com with SMTP id r7so1634701ual.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 May 2019 19:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NnHEeG9ds+KuL4AdX1zoPiXeOJtsJQyRYhcA8+uTXQo=;
	b=I0PDwSflX85XmRQ5FKnDQiClPtRukYjlOIPgMsxGdiTw3oO7Re5quLul5w9gTPl6EN
	yutS+SiEewWtuLId+ahkte8pBbf6tbDEUrkPfoUentahTXPReFy6ndx/gMhhp6wq1ARV
	v3ye/QD+0HhawyVRx4lIKVuMDtHO7YofZ6hDifw+upqOXyZ2m4yTNJzqEElo+VkKlQL+
	pVQzsZuiV2sCuB6zs/Lr2+/n1oTWwVoVZw7DI2RySuzB295uO+FHRdpXEk73lJBsmAUV
	nH6vRb6dwWeyacDkMf0G/Qf683mZ1vRBh7JNUiG96do+EqcRMIFTGfHA8059jdVw+7ar
	UbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NnHEeG9ds+KuL4AdX1zoPiXeOJtsJQyRYhcA8+uTXQo=;
	b=V7kwflocsuLPnMn4lEMemNRtuWLsPs4slZjYEyf6H2xIx43W23Xms4+va30UVf4jJ5
	eZrXAs+XFFfEIkY2RXojoUZ2H2qKNea+9Fh75GOna60jXL7IdXaqnBIgSd2ZNNG9v8Pa
	BPln8ERhbzsWd5HUBDDpmCvnRtn76u4Q9HxODSRhegrDs0DF7AlxDMxeRdRC9sDw5DNT
	nnS2CvYe8QBvUH6fkJpWMhLu6Lj+CnHdct/rbnbZd0Ni8IhRXejZ9h2rkn4hAC9iKsNN
	8cSCYAZiMSdPEqJwxQNnH5TlCy+Ljd2pSHUs2i0EYBTQEp1Wcv4m6/hvUN2+aHVfHpQr
	PXTw==
X-Gm-Message-State: APjAAAWAaRLVqUYa81vipldZKMzMKj4h4KJan/NYaYr+IFM40d1gweKj
	dQqhWy0vzYpdlwByvJDZjYKpduKW9YtEBiQZDAI=
X-Google-Smtp-Source: APXvYqyNhXi7jx6/Jicom8vQAHzn0RxP69IsRk/6/XZWoBA7zsGRcUSi9Hmt07dwu0ZV8yyWyE17NTUEFJ/iKQCdzxc=
X-Received: by 2002:a9f:3045:: with SMTP id i5mr33187492uab.81.1558577280358; 
	Wed, 22 May 2019 19:08:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190522082954.24027-1-bunk@stusta.de>
	<CAMKF1sq6rAKP-dVYa1F9Ae_LOo6uSUO8wHebTaytROasdLUDNQ@mail.gmail.com>
In-Reply-To: <CAMKF1sq6rAKP-dVYa1F9Ae_LOo6uSUO8wHebTaytROasdLUDNQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 22 May 2019 19:07:48 -0700
Message-ID: <CAJ86T=V+vBAbb7rFfB8qAJYYk9BcJDpSp98LnxvjLXHW7hPQ8Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH] squashfs-tools: Mark as incompatible with musl
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
X-List-Received-Date: Thu, 23 May 2019 02:07:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 22, 2019 at 6:35 PM Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, May 22, 2019 at 1:30 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > Silently ignoring FNM_EXTMATCH makes fnmatch()
> > behave different from what callers expect.
> >
> > Mark as incompatible with musl instead of risking
> > broken runtime behaviour.
> >
> > The practical consequences should be small since
> > what is used in OE is mainly squashfs-tools-native.

The OE patch seems to take the same approach as the (3 year old)
upstream fix for the same issue, so if there are concerns maybe good
to raise them with upstream...

  https://github.com/plougher/squashfs-tools/commit/4280e74de14070869787a9166242f9ce2dafd82e

It does look dubious to me though... and since the patterns passed to
fnmatch() look like they ultimately come from the command line,
problems might only show up with more advanced usage of the squashfs
tools.

