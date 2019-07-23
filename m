Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 651BD7DE37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 07:47:27 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id z3so79895819iog.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2019 00:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=GOb4F0FY9BWlCUMFfQk8s7iZhdW3YVU5j5D9A7GhMcw=;
	b=fRFKDxAWtipCdHOg7AHSbn0SK8/J1Hyol18atR/ugdg+bnETcspq+7xcn2iH6GckBs
	zIt/iJbRI94VfJ3yHZyZmmMs5ezIRUUmY8BDPL4hAgdFR2P0lriVAri8ToeCukAU/oPT
	1NjDLV+TgGSsh9+8HBdwpUtygP57bN3P2FFU6+zIxnk4pzELeKfnzQGq5xKs8c32VOLM
	PLRHF1s746U2cTNc8eJCTjBjQ/stAr4vSgsn5UCfVnwpsYVWnhrHYjb8qQnQg9OCM0Db
	wecgjN2i0fPwZMsmc3yTEvm6TQxKpGs5qQEpc7jxVyhrR+r12O3VtUASIGCre1IFC8/E
	1GLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=GOb4F0FY9BWlCUMFfQk8s7iZhdW3YVU5j5D9A7GhMcw=;
	b=JWUgVRiq1ZSXMePtSI/JcTdwqN9tl9P5BRqtEV2Vfs2D8kzqlg9AAs6NoAdV2UAXX3
	f/1WnxbyJwb3L4K8QovbjwvtcF1ET9yJUPQs6POYdgyTSk2af1DalQ5yNk5+W7ME/2FH
	8nftZSy1YKUjz2DNRUGL0h57bbSF0CODTPoeYXoRehoBICuOc5IsP4Y4FGoYriuBTY9g
	5jw0TC4k3Wzq22uRCnATIOAEppX92e+N0gpwXpyTWdJWS/yvoUdF+AqDNwlYBUS+DoZA
	w6aTnDWwVnTorm5GUzeO5NjEd2EZx8W32wJmcn5ShaC2aLFlI8fgnwA5goSOMBikg+Dp
	8KtA==
X-Gm-Message-State: APjAAAVwgKulj20Y6LryMl1EtlXisBqPUot8yXUK2DFec6qVXXyDlmoH
	9eX7mz8N/RMwtzG2qi0P7r8yeAxsViXn0fxu+vZgfg==
X-Google-Smtp-Source: APXvYqwm7DSz+QIsXS1CxWBTp2Dt7Eqcyqnbgh/iq5mY2Mo2GaXK95d1tf+bZYMkgKnQoCaAot36XfpdwJvpeHPmv2k=
X-Received: by 2002:a02:b395:: with SMTP id p21mr78894772jan.31.1563868048081; 
	Tue, 23 Jul 2019 00:47:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190722001812.14947-1-open.source@oleksandr-kravchuk.com>
	<CAJTo0LaVCn47fzpMYcsO9sjwgRpaexGYDRxrrvoWTVny1uVQ_g@mail.gmail.com>
	<20190723054328.GA27144@localhost>
In-Reply-To: <20190723054328.GA27144@localhost>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Jul 2019 08:47:16 +0100
Message-ID: <CAJTo0LZDXcLhYqvgYmY4-hX4Uc+ZJniDhqWkrjtaYu_k58Fr8w@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH 1/6] python-scons: update to 3.1.0
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
X-List-Received-Date: Tue, 23 Jul 2019 07:47:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Jul 2019 at 06:43, Adrian Bunk <bunk@stusta.de> wrote:
> On Mon, Jul 22, 2019 at 10:51:35AM +0100, Burton, Ross wrote:
> > Do we need the Python 2 variation of scons in oe-core, or even at all?
>
> Regarding the latter, do you see what is needed for making gpsd in
> meta-oe working with the Python 3 variant?
>
> Upstream seems to support it, but it fails to build.
>
> I thought I knew what the problem was, but it turned out to be wrong.

So that's a 'yes', fair enough.  Is gpsd the only piece that needs it?

Ross

