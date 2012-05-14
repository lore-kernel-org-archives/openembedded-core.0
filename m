Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1STz4H-0005Lp-4M
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 19:28:21 +0200
Received: by yenl13 with SMTP id l13so3909351yen.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 10:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=TlWEigNk1lULrXWGyDBcUEE3Y9QTXYTcxQhCp2PFakE=;
	b=lcpwe5trTAJEuY8fGOcQiFlgZu6K/ME4Rseh6Bz+SbQr48z/SvQEjIfXUvS7b2HDvB
	KNU5mf3bU5WA3pSjCtIZvnp6KXaCddnZW7sIGl9/XKsf9rBgmzwuK35oA1CW2G0BPMoR
	WUO0n/ZoTKVeJPkUlJwqioInOy/yNYH5OPzWJ2Uk0QPHkUwLIwQkGjHftDF1LOYWs3xg
	87Sxo3CpGWf/Np1dR8ofC9NgMpmc98RYxrJ5sqdVjz7+RLMV6O4IXItjc3MkHJXf6x6O
	v0nLWVeioPlhnGlzWm6YtcPwdgMv1AZkh/nJK5hJwfzasNTVYXhqRHJLRqx2mj7nlO6N
	nLyg==
MIME-Version: 1.0
Received: by 10.50.94.200 with SMTP id de8mr4729413igb.21.1337015901465; Mon,
	14 May 2012 10:18:21 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Mon, 14 May 2012 10:18:21 -0700 (PDT)
In-Reply-To: <1337011770-24297-1-git-send-email-jason.wessel@windriver.com>
References: <1337011770-24297-1-git-send-email-jason.wessel@windriver.com>
Date: Mon, 14 May 2012 20:18:21 +0300
Message-ID: <CAF6bG8dzui=doFHHDoWGYXt45utcPwjY81QQRKrCbgHEpaMBQQ@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] bitbake.conf: gracefully work with ccache environment variables
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 May 2012 17:28:21 -0000
Content-Type: text/plain; charset=UTF-8

On 14 May 2012 19:09, Jason Wessel <jason.wessel@windriver.com> wrote:
> The end user of oe-core should be free to turn off ccache, or use an
> external ccache without impacting the sstate sums.

 ...

> I'll send a patch just to add CCACHE_DIR to the BB_HASHBASE_WHITELIST.

 External cache makes sense for anything being built by system
compiler. Caching results of anything produced by OE-built compilers
to user's normal cache is problematic. Rebuild of the compiler itself
will invalidate any such cached files, but caching them in first place
may push more valid results out from the cache. So you are proposing
that user has to opt-out from that behavior (by unsetting his normal
CCACHE_DIR before running bitbake) and no longer opt-in (by adding
CCACHE_DIR to whitelist)


 - ML


