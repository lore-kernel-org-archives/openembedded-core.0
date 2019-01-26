Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id EED047C3E8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 11:16:56 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id t27so12842957wra.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 03:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=sHUq5FFGtla0uwN8hqQVB76QxMdBwkvTaWCkmvnzat4=;
	b=SKUx5tTvhrH5CCWq3BaCvD5iRPZp5dPpE6O/kUBQOGQRygoMsjLZGrRqLfNhst6vFV
	FI5x1TWLAFiVjgJ27+5K/p/oXNOrP9muAOT+uS69XBbMz38JiRirWLrBI/zT33GDjFhc
	ZMliFJ9SAk37JZkRMtsx+a85mRu6cyjcVskhg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=sHUq5FFGtla0uwN8hqQVB76QxMdBwkvTaWCkmvnzat4=;
	b=AIXOeFJKmi+vjl9ajpwVzbDasVa91u+2OtDvbdTXGYIIciImO02u7fzBflbyCyp13e
	qkQGmBiKjavdMQe7NoY1BxYWT2sFV0jCEpgthGyGH7WafdTvFp3X+UjHGpIVjkH+VWEe
	pKLTXhsHnmCn2HVI3hHk9GXh7CrzNmq2P0CXD/0MMM/zO0h7Gs1xmMVgQlSvn4cp8yUj
	m3+1K/YBQ6nupJDnRp/CQRiA2i6CrUvBG5gV5BeHguMVjWSG8IgKjeq2nTRm3UWVLHq4
	knybRPZuTM1DYsPmMoDiUPKf5SxpyI+noCZ99XDSk+KUV5hTRFqlBaOKRCkLnsCjADfg
	Njhg==
X-Gm-Message-State: AJcUukd+M3bccpuN+o9INFpG88CsdMmJ/m8PTSyKDcYdOgxJIg4EUgBN
	qFKfP6QndwTz6wot7vUHYEPyBA==
X-Google-Smtp-Source: ALg8bN77i+iILPc1U42+My1ut1tSnVxsskBz6CSLVPEYRKOj8reNDOru2Mu5Oy2B3lE/LYGwERAC7g==
X-Received: by 2002:adf:9c01:: with SMTP id f1mr15357866wrc.286.1548501417217; 
	Sat, 26 Jan 2019 03:16:57 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	p139sm132595258wmd.31.2019.01.26.03.16.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Sat, 26 Jan 2019 03:16:56 -0800 (PST)
Message-ID: <6a7bc5f129bc97b62e657ee1f2d4ed7e5f74e178.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Sat, 26 Jan 2019 11:16:54 +0000
In-Reply-To: <CAJkqNs1W-rwt44Mbyst0rs=V_4ye5RfdAT0kW6ccAODbzQ_4JQ@mail.gmail.com>
References: <CAJkqNs36diCh3qUHA8+ssmi_BGKjgY_xd_bs1sDAFvWwwGp6ew@mail.gmail.com>
	<cc81145d8a0f3fd9771dca0d67d2652f3fe8ad11.camel@linuxfoundation.org>
	<CAJkqNs1W-rwt44Mbyst0rs=V_4ye5RfdAT0kW6ccAODbzQ_4JQ@mail.gmail.com>
User-Agent: Evolution 3.30.4-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] lib/oe/patch.py: Fix applying a directory as a patch
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
X-List-Received-Date: Sat, 26 Jan 2019 11:16:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sat, 2019-01-26 at 11:47 +0100, Tomasz Dziendzielski wrote:
> sob., 26 sty 2019 o 11:34 Richard Purdie
> <richard.purdie@linuxfoundation.org> napisał(a):
> > On Fri, 2019-01-25 at 20:55 +0100, Tomasz Dziendzielski wrote:
> > > If a SRC_URI content ends with '.patch' bitbake is
> > > trying to apply it as it's a patch file.
> > > 
> > > It causes that if we use git repository for 'patch' package
> > > the bare clone is extracted to a directory
> > > (i.e. build/downloads/git2/git.mirror.org.patch/) which is
> > > considered
> > > to be a patch file, so patch.py tries to apply that directory as
> > > a
> > > patch
> > > which ends up with a failure.
> > > 
> > > Signed-off-by: Tomasz Dziendzielski <
> > > tomasz.dziendzielski@gmail.com>
> > > ---
> > >  meta/lib/oe/patch.py | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> > > index 07a40fc50e..3d0b7d7289 100644
> > > --- a/meta/lib/oe/patch.py
> > > +++ b/meta/lib/oe/patch.py
> > > @@ -793,6 +793,8 @@ def patch_path(url, fetch, workdir,
> > > expand=True):
> > >      """Return the local path of a patch, or None if this isn't a
> > > patch"""
> > > 
> > >      local = fetch.localpath(url)
> > > +    if os.path.isdir(local):
> > > +        return
> > 
> > This doesn't match the comment above, "None if this isn't a patch"?
> > Does the rest of the function use "return" or "return None"? It
> > won't
> > matter in practise to python but we should be consistent and fix
> > the
> > value or the comment.
> > 
> > Cheers,
> > 
> > Richard
> > 
> 
> The rest of the function use "return". You prefer me to change the
> comment in a second commit to keep the changes separated or just do
> it within this one?

May as well send a second patch which we can apply first, thanks!

Cheers,

Richard




