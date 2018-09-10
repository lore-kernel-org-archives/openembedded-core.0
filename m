Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id E7A2F60116
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 11:14:12 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id 8-v6so39359326oip.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 04:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ujRV7QncywpcuobQQB4ArgRTEJz6GUxw50azDh6l54k=;
	b=e06rSU4ezqNjvWyqcwhMQz/zeTeq2kazGj12U8o2CKlJNEkoulPiuNaCowBf55S2ED
	sWDlakMu2uhHreC5NBVsLdKF/150QXQC7x/OFMfqBppqIcPcWDxo7KndJafxzaKHPE9w
	MqBoK/VJZg8nJE7+VuZjwabdUeP9fbQoma0LADzGY10vix43g2UpfZzjikVL5drgQZUL
	hp2GcYubMxFykjkn7h7NvTLbLUammaAk13tePeswKGLCqzJu+kJDPSjih2IHsmKKYKMV
	a79Jax8vpt6rZcrNjxUihVI532e7RULnIik/EWLi3P6YpyjiNRrYmrIINIkVeyyySzef
	Egjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ujRV7QncywpcuobQQB4ArgRTEJz6GUxw50azDh6l54k=;
	b=ZV8nQHH8p8eCEDGj796Y28Imb6k+CXXqQUFxTgK3N6d8DZl685bCkUbMFcscwWKhuE
	Qu03jeugh5dAJk6f1ZYFDXgTj2dGRmb715PdniMXQ7NJYLi2uedEvhNAAZMsfDyQ/M6f
	lZF4Z9c9rJyKRXIHKi1OklrNn2n5YfU1JPJTZm8kmB57K/3s/p0l3RXx0tLGzgY8uJDQ
	oqiK9dNXUVsvPI5OCnO1MQNYyRuIIEpWl8J56vMj9Uzc1afmmC26HcZEzIZ12NQVSXU5
	jUonmh/eLmAxYBz0FAXPJg7ErsbMWDUvc1XD8hHS7QqM/FHohfMsR1pg3KNaEwYE5vHl
	HgxA==
X-Gm-Message-State: APzg51DVcib7XJJjjHvpcCtyzMR6TP7A0voPZKxZt1Mg0pxeOiOOvy7X
	jvavGZ5G5eaJe2UDXP/op/RIwZgUZzTo/KubF5HRRw==
X-Google-Smtp-Source: ANB0Vdbv2+l0ajwNEQOtbqA82WjeZaqSjMqDtje2E5y+SI2exH37WiECofbjyhUp+b+atzBMnXHDBMcDogznQ95BIxM=
X-Received: by 2002:aca:a04:: with SMTP id 4-v6mr21942352oik.203.1536578053713;
	Mon, 10 Sep 2018 04:14:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Mon, 10 Sep 2018 04:13:53 -0700 (PDT)
In-Reply-To: <cover.1536009789.git.raj.khem@gmail.com>
References: <cover.1536009789.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Sep 2018 12:13:53 +0100
Message-ID: <CAJTo0LaqQ61iT=wg8qVn0UUaeLaCB=FZ1g=uc6fgMjtKmFOimg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Misc fixes
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
X-List-Received-Date: Mon, 10 Sep 2018 11:14:13 -0000
Content-Type: text/plain; charset="UTF-8"

I never saw these on the list, just the cover letter.

So the serf change introduces three patches, two of which are
backports with nice descriptions but one (0003-gen_def.patch) doesn't
have a description, upstream-status, or signed-off-by.  Can you add
those as appropriate?

Ross

On 3 September 2018 at 22:25, Khem Raj <raj.khem@gmail.com> wrote:
> Some failures seen when host has python3 as python
> build core-image-sato for riscv64
>
> The following changes since commit 929b1b341b4b221ac10c8621bad27abfa7ae70bc:
>
>   openssl: Handle -conf package file conflicts (2018-08-31 15:33:56 +0100)
>
> are available in the Git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib kraj/misc
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc
>
> Khem Raj (3):
>   packagegroup-core-x11-sato: Make weak include for gst-examples
>   serf: Fix Sconstruct build with python 3.7
>   eglinfo: Upgrade contained waf version to 2.0.11 release
>
>  meta/recipes-graphics/eglinfo/eglinfo.inc     |   6 +-
>  meta/recipes-graphics/eglinfo/files/waf       | 169 ++++++++++++++++++
>  .../packagegroup-core-x11-sato.bb             |   5 +-
>  ...print-in-the-scons-file-to-unbreak-b.patch |  29 +++
>  ...-Fix-path-quoting-for-.def-generator.patch |  27 +++
>  .../serf/serf/0003-gen_def.patch              |  22 +++
>  ...11083-fix-building-with-scons-3.0.0-.patch |  29 +++
>  meta/recipes-support/serf/serf_1.3.9.bb       |   7 +-
>  8 files changed, 291 insertions(+), 3 deletions(-)
>  create mode 100755 meta/recipes-graphics/eglinfo/files/waf
>  create mode 100644 meta/recipes-support/serf/serf/0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch
>  create mode 100644 meta/recipes-support/serf/serf/0002-SConstruct-Fix-path-quoting-for-.def-generator.patch
>  create mode 100644 meta/recipes-support/serf/serf/0003-gen_def.patch
>  create mode 100644 meta/recipes-support/serf/serf/0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch
>
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

