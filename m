Return-Path: <riku.voipio@linaro.org>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id A304C6102E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 10:29:08 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id k15so2169200qaq.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 03:29:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=bTxKlJQfEVRtU8XUl1bwN6pUx480jcOYjYgNLaJguLw=;
	b=LMm4mWLK133xusaviwtLA+U+nkMAq32N0oGEGs9djfTo/hOk8+5DS9qPv7vy7neiZy
	6FQ6ivE4j/vtQNXwj/tywlWfEDEiDyfWRL4T+BB27cvXUHK/mcmlXfs2lw3o8GkJf0iS
	hudv1dZ0fck3JUOSsacWBB7lmbDQfdcCJAfsTpGGyR5aVdl4ReUCllf1jWZZBaHac1JQ
	0DtU0KkP34fSyb+YGsShXHKSdT2TKyp+ZXEFm1R5YdQcLa0oJtfk+kJc2xdMekl1IWLe
	0YfcPkrnsnVCVDPKJRQmaOVZaDI5w0sxLZz9yLWO9ibW+jYJtu5oUWTTaGMAWsHTTQWC
	vS7w==
X-Gm-Message-State: ALoCoQlgehBM3L1e/y2Uv4U0j+Ez1JcU2lXACGz/QFvvR9gjIOITMyUwnwXzXi5CKIrUqvWjDxKQ
MIME-Version: 1.0
X-Received: by 10.224.73.200 with SMTP id r8mr12869350qaj.72.1380536949841;
	Mon, 30 Sep 2013 03:29:09 -0700 (PDT)
Received: by 10.49.71.232 with HTTP; Mon, 30 Sep 2013 03:29:09 -0700 (PDT)
In-Reply-To: <1379757244.18603.192.camel@ted>
References: <CAAqcGH=avmRB5GS23tj+JjckQ1Y-RrTnTkQmBHTFggnwDbihRA@mail.gmail.com>
	<1379757244.18603.192.camel@ted>
Date: Mon, 30 Sep 2013 13:29:09 +0300
Message-ID: <CAAqcGHkrqYdVr8f87rqEfLQY8nYO5rC87m2CUJFdtS=gTmK42Q@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "saul.wold" <saul.wold@intel.com>, openembedded-core@lists.openembedded.org
Subject: Re: Using pigz-native from sstate-cache while zlib-native is not there yet
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
X-List-Received-Date: Mon, 30 Sep 2013 10:29:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Richard,

On 21 September 2013 12:54, Richard Purdie
> do_unpack[depends] += "gzip-native:do_populate_sysroot"
>
> which I think should address the problem?
>
> If anyone is interested, the reproducer is:
>
> bitbake pigz-native
> bitbake zlib-native -c clean
> bitbake core-image-minimal -c populate_lic --no-setscene -f

> however your system needs to have an old version of zlib on it which
> pigz-native can't run against. The line above fixes it.

I verified on ubuntu precise that the above steps do not cause the
zlib relocation error anymore. I see the fix is alreadt in OE-core,
thanks!

Riku

