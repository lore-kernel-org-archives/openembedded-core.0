Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id D533A719AC
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 00:16:13 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id c21so577240294ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 16:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n1LWTsffq1muFFmGN7Bq7zZ8AGbtWUzd6n3Ho+P5OVs=;
	b=v7hCRlhlSJzVzkneZFdc9PTjirYIf3pub5nZ6FKBr4lnzJYAGH5tPgJKMbcSvXjk3d
	DBPe89uM8YiBws/H4cSVZQSnmO0eA5M5o1EX93sFFFm7RoM5shfbmwMd5gj4j4lbUHy9
	uDCLrr8b8qszW65pYRwLqN/7shzXC1jj/uhCES+HmCk/14g41utxbdohTlhUSz5g5FMU
	qdWaK3S7UFA97qnrxrauik+APggH5xjIHJG3Vsa1NihjPt9ZZ2UincZ6PbiHDxS8Nj/k
	iQDGJSGcZcMkIgjP4a4vjGBgcYc0VELAPiIccD5rP8fLj/NGG6e9iVspw+wySGDi7mBc
	kBiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n1LWTsffq1muFFmGN7Bq7zZ8AGbtWUzd6n3Ho+P5OVs=;
	b=PnkF6OYqUTA9mGhTF/Yi5YqUj2DMjGzZ0RLXgpZ3QB36oag3f/sr0p7E4XPwUjgURD
	sNyThTZxAKFiooYrMYBATLYV0wpD7KmQsTaD1Jged45GonMGA7HEarsOZteK3ZNeixVA
	vcqbhNhZC6eiO3mT9V7YkVtfu19CsowsIDjNZxIUGCQnuYidaXn7XBmv6KGbzUx7qEv6
	wVGfJ6kehJfdbmdT9D+v0bKbak1VpSqapq2KP8WISpcK8DGLrjbI283qHLiHvPPI2ZQM
	nsGcrCeTQPcJ8v/UCCUbw7A9PQJDsQRQNV+1fS4eQsapAGPKAv30zGVbqBZIfbVXDW8S
	df7g==
X-Gm-Message-State: AKaTC00vkukBmesjxiqPLMamcoaNX5V2sy9D1Z8vH8vEPpnuTDsTH7POZul7ExPemBMzI9e/kmNyNOBu0GS0HQ==
X-Received: by 10.107.9.93 with SMTP id j90mr52488218ioi.230.1480983374966;
	Mon, 05 Dec 2016 16:16:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.36.64.199 with HTTP; Mon, 5 Dec 2016 16:16:14 -0800 (PST)
In-Reply-To: <CAJTo0La_rfxyJRgJgjdknqXAACkqxRB3dgqdyiOv7VCa+z8rFA@mail.gmail.com>
References: <20161205163827.21941-1-george.mccollister@gmail.com>
	<CAJTo0La_rfxyJRgJgjdknqXAACkqxRB3dgqdyiOv7VCa+z8rFA@mail.gmail.com>
From: George McCollister <george.mccollister@gmail.com>
Date: Mon, 5 Dec 2016 18:16:14 -0600
Message-ID: <CAFSKS=NvbpPaR038OS+uAK78HQt_DfKuNodJHTQ54Zi5aXV+Ng@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: Depend on nativesdk-python3-misc
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
X-List-Received-Date: Tue, 06 Dec 2016 00:16:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 5, 2016 at 3:21 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 5 December 2016 at 16:38, George McCollister
> <george.mccollister@gmail.com> wrote:
>>
>> Add missing dependency on nativesdk-python3-misc so the imp Python
>> module is installed.
>
>
> So imp is the Python-facing API for 'import', and python-misc is a grab-bag
> of random stuff.  Should imp be moved to be in python3-importlib (where its
> replacement already lives) or moved into python3-core?

importlib is the replacement for imp (it's deprecated since version
3.4) so this sounds reasonable to me. Shall I send a patch to add
imp.py to python3-importlib and another to add python3-importlib to
PACKAGECONFIG[python] in gdb-cross-canadian.inc?

-George

