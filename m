Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 49E176ACEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:23:20 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id z60so1259286qgd.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 14:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Meam/HDri7g0mGS10spA/oQ0YO/mlOUWK4bEzVw59ew=;
	b=c+YSb9uoeT+cqK+N/c02pGLFy2tlmBPl5W1e1uKq3Wrw50MGOW3BqHZe/v7r7diVQ8
	vj8wZx/E4TNHgi1lJjrLLi+8wo5vDpcI7AuaBwwq/nYyL0794vcnbh3YpX/Zb2odPuYt
	7ar9wRou4Y//18C3QShbqOBh8IO5tAVP45Ha/TJXu79aS90NHTdikMvfucHI5CRRn7J9
	ALIUCeB+aQvCNFlWb0eVpYjdpTWUQE1PHLZCqQUMwp2BVN2tvC0eyWRSz6SAG8YN0EqP
	poAdwOpcPigthfx6YyZTmVxm13gZmaZzfHrXRI7afYGhLMY8b19Zn3cWlaBe1Zy4VK/L
	VouA==
X-Gm-Message-State: ALoCoQkdTVYzPuIJ7ZHiQxNFc/M5lnkiwjRKIQRCg2rNi+uE7iugzROtLFOvtcQkJSO3QtWudIjF
X-Received: by 10.140.48.161 with SMTP id o30mr49238277qga.68.1405545801711;
	Wed, 16 Jul 2014 14:23:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Wed, 16 Jul 2014 14:23:01 -0700 (PDT)
In-Reply-To: <53C6B3DF.3040300@linux.intel.com>
References: <1405437238-28782-1-git-send-email-akuster@mvista.com>
	<CAJTo0La7owsx7Bpz9NDm2AdUtU08n_bWVkVYh-T2MTGRcOxzgw@mail.gmail.com>
	<53C54A18.4030907@mvista.com> <53C6B3DF.3040300@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Jul 2014 22:23:01 +0100
Message-ID: <CAJTo0LbB=Jd5SA1Dg6u3MmHoMHEkq8YGHSMCccHJ8+Dc3XkgeA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] [v2] nettle: update to version 3.0
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
X-List-Received-Date: Wed, 16 Jul 2014 21:23:27 -0000
Content-Type: text/plain; charset=UTF-8

On 16 July 2014 18:18, Saul Wold <sgw@linux.intel.com> wrote:
> The only other concern I have is there is a COPYING.GPLv3, you might want to
> check with the upstream what the intent of having that License file is for,
> do they intend on some parts being v3 and if so which parts?

They'll need a LGPLv3 license alongside the GPLv2 license if they're
dual-licensing, but we should checksum the "LGPLv3 or GPLv2" statement
if it's written down anywhere in the tarball (which I hope it is) so
we get alerted if they ever decide to be LGPLv3+ only.

> I am not sure if the INCOMPATIBLE_LICENSE will handle the OR properly, but
> we should just have one version.

The INCOMPATIBLE_LICENSE checks do handle "or" license statements.

Ross

