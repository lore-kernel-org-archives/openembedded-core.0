Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 10BD06011A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:15:40 +0000 (UTC)
Received: by mail-ig0-f181.google.com with SMTP id qe5so4169714igc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 02:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/Me8ky617ssawvSUAKNFF4T44dLVIIaOB6TLe6gxhYc=;
	b=QfKd1NvjGkvGKEB1D3oHjsybb1/0QykHs8rMqvgH1NUcV8bfnsNPh1UvRrUSg6NKfo
	DQa9lnSsTt91cKRQ9XMuaK7w8NX266woVv7Jf6tn0qzNqT1RbrMO2j5BmeQ7oyasHYY/
	0byiF9RpuXx4JiYvYrYx9om8qNBqYf5g851PKfaw4YSLVnmY5Q7JmJeccDYEIVo20kfy
	652CLv2pFJlzYmPk8q38PUkNEPf+fCln+/xJ8KbWyXU7bimqLef2WgxEe70G13HzNhrI
	PlysMSZPAoe4wvO9dobMrYsCyDeGHjS7cBOQMehUPZNQU+XS2C1kgmfQIo/1cKSlDnl+
	LZ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/Me8ky617ssawvSUAKNFF4T44dLVIIaOB6TLe6gxhYc=;
	b=jepypjCR0jozPRVPYEyOaRUbvnpSoJ6iHn8aJf3zpVN4/TvnItMtA6fyTE1TilNJGr
	AfUMP2DwY0c2l+5bipWYDELSpBtJHUjXh9VeTMK5gMhFZN33G5QnFmFApBCm4KWdYler
	FdOLQQwb4blcVVQkqnQbxYaKFzZ0X/zksiTMZdstYA6+qHnd9HukQKtG25Hf+0xrmb/+
	nUPOgTl7L95wrRZCcPMG6KUP1EtW00jB09RJKCiF8qSJA2dm4vniZuEIY5cfjtYIIkf6
	2GvYY56XTqpMoTPiO48s6+JnPefvs3F9T/tx+a/rBtwFNZLJ/goBfY1WcXNJ8pQ1oT5B
	Psow==
X-Gm-Message-State: AOPr4FWK35UEEyCxqFgwBII4kiS7at93SRbzb4Dq3DkoSb7Hl7vP26JqZiYQ6sLaiVD9KaIXvB96cNYK/til2vxC
X-Received: by 10.50.60.132 with SMTP id h4mr9833igr.78.1463130940716; Fri, 13
	May 2016 02:15:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Fri, 13 May 2016 02:15:21 -0700 (PDT)
In-Reply-To: <421b6ddea183b6e3260a8383574a23d078f93132.1463035854.git.jussi.kukkonen@intel.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<421b6ddea183b6e3260a8383574a23d078f93132.1463035854.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 May 2016 10:15:21 +0100
Message-ID: <CAJTo0LZdjMyR=zH2jzAoo4JF8vpL1iUQZdn16E4ghw64iS664w@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/13] wayland-protocols: Add recipe
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
X-List-Received-Date: Fri, 13 May 2016 09:15:42 -0000
Content-Type: multipart/alternative; boundary=bcaec5015c9bfb53620532b5b7e9

--bcaec5015c9bfb53620532b5b7e9
Content-Type: text/plain; charset=UTF-8

On 12 May 2016 at 08:20, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> wayland-protocols is a collection of Wayland protocols split
> out from weston. It is a build dependency for Weston 1.10.
>

* satisfy_dependencies_for: Cannot satisfy the following dependencies for
weston-dev:

 * wayland-protocols (= 1.3-r0) *

 * opkg_install: Cannot install package weston-dev.

Ross

--bcaec5015c9bfb53620532b5b7e9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 May 2016 at 08:20, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><span class=3D"">wayland</span>-pr=
otocols is a collection of <span class=3D"">Wayland</span> protocols split<=
br>
out from weston. It is a build dependency for Weston 1.10.<br></blockquote>=
</div><br><div class=3D"gmail_extra">* satisfy_dependencies_for: Cannot sat=
isfy the following dependencies for weston-dev:</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">=C2=A0* <span class=3D"" style=3D=
"white-space:pre">	</span>wayland-protocols (=3D 1.3-r0) *</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=C2=A0* opkg_install:=
 Cannot install package weston-dev.</div><div class=3D"gmail_extra"><br></d=
iv><div class=3D"gmail_extra">Ross</div></div></div>

--bcaec5015c9bfb53620532b5b7e9--
