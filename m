Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id CBD7160620
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 10:45:35 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id 97so3424282iok.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 03:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jSDhieJQvKAKeOZk9pnkhYKrtjI+/NUgC9ETg0sh3xc=;
	b=hdhh+3qcSM3+EbBBz8jI9dlcLy4Yf5xDZRcE4bg+Lma0rveemNTY65C7fLnB7VdCSV
	LR0xznbrDRw4DMCfV47QRn7whK4oQ9NVeRCMP6Eff4CONmZBg4X7IhD07anAxi6Usn0j
	9YFQ3CY928+DxV1peSqE546vRHHkDvNw5qyT1ZktTeGWw34gOTqbjLpbKHLwhq9k2oB/
	DqZ8RzW4GBHgHhikZZIOM+ZWzT3RduDEViUGvlFf32+7Ic3+nHL8/57ACv5WWduNust/
	n6Ht1654eblupbGzJeD0P3rTsg4wNJmM7/MaodkzlpcbAgUIJQA/i0FntzQo5ZVAOxVL
	NPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jSDhieJQvKAKeOZk9pnkhYKrtjI+/NUgC9ETg0sh3xc=;
	b=BvOwd80tVq4vEgcjYgQm2D5OHQS01EgVVEawUYuVAlD2DFaoumw3S/OuBmGFk3VjKK
	YSd+4Uc6MTiRsmbVt9N9vswenfsz3+qal2m0PMcCP1sDmHckKrgOF2hNzCMpHelXtbbw
	UhVYnoHQDWm6eCGzAu7JhM6IPAf+swj0MHsBhBIfdqts+UGGtd+CLLW/nnP5h4Ulmihw
	InDyOHcrChAtBVYLV6faS58cQODYV2YlA4qSVtjafd2eAmnvcAZ+1dI2LnA+WAgA81lS
	Ytj4BPKez+nS0dOB5T+MrPWyfAlh+40p6UAPifnQrhkS8NiOSb9UxCYWgXMYHt+A1UmT
	UEmg==
X-Gm-Message-State: AMCzsaVd2DgOtNtcXTuNskQc3F4qtOcLrxNrRdasUGmt4eaZxez9CyJS
	Oovq/8ti2ad0FayIifYEMLM+Uz0tFcrBGdZCI5ixAw==
X-Google-Smtp-Source: AOwi7QCe4Ksd++1LNq8+0bchlSL1YPjqnTlaR6pFRE3caGVnWS2kTBytbcXcRdigm38g+MdVNgIajny1udprj8f69YI=
X-Received: by 10.107.57.3 with SMTP id g3mr1902681ioa.210.1507286736558; Fri,
	06 Oct 2017 03:45:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.59.22 with HTTP; Fri, 6 Oct 2017 03:45:16 -0700 (PDT)
In-Reply-To: <20171005074607.20260-1-n.merinov@inango-systems.com>
References: <20171005074607.20260-1-n.merinov@inango-systems.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Oct 2017 11:45:16 +0100
Message-ID: <CAJTo0LZsvj+er5x+GjOQ_sXBGWE2wOhyEJKi=ndjZy2qwMRCSw@mail.gmail.com>
To: Nikolay Merinov <n.merinov@inango-systems.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] utils.bbclass: Support applications with keys in check_app_exist function
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
X-List-Received-Date: Fri, 06 Oct 2017 10:45:35 -0000
Content-Type: multipart/alternative; boundary="001a114ac18081f5df055ade8ad9"

--001a114ac18081f5df055ade8ad9
Content-Type: text/plain; charset="UTF-8"

On 5 October 2017 at 08:46, Nikolay Merinov <n.merinov@inango-systems.com>
wrote:

> check_app_exist function must support cases when "app" variable defined
> as "progname --keys". For example BUILD_CC="gcc -march=x86-64" must
> pass sanity check.
>

Whilst this is useful, -march should be in BUILD_CFLAGS.

Ross

--001a114ac18081f5df055ade8ad9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 5 October 2017 at 08:46, Nikolay Merinov <span dir=3D"l=
tr">&lt;<a href=3D"mailto:n.merinov@inango-systems.com" target=3D"_blank">n=
.merinov@inango-systems.com</a>&gt;</span> wrote:<br><div class=3D"gmail_ex=
tra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">check_app_ex=
ist function must support cases when &quot;app&quot; variable defined<br>
as &quot;progname --keys&quot;. For example BUILD_CC=3D&quot;gcc -march=3Dx=
86-64&quot; must<br>
pass sanity check.<br></blockquote><div><br></div><div>Whilst this is usefu=
l, -march should be in BUILD_CFLAGS.</div><div><br></div><div>Ross=C2=A0</d=
iv></div></div></div>

--001a114ac18081f5df055ade8ad9--
