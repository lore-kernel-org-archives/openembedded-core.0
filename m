Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f66.google.com (mail-vk0-f66.google.com
	[209.85.213.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6AFFF78879
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 19:03:28 +0000 (UTC)
Received: by mail-vk0-f66.google.com with SMTP id p12-v6so1177870vkf.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 12:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=PrlvExszEJbE0U56TvQgKJn/3WD4JoeuYHENgEP9BXs=;
	b=VoRj3YwwkZHVBhyA419GPzBcnAJaZ40uv4I8hAOcvCUGHewKJaW+douRo8iA8uJrGP
	jJuDanRciA2XFN+NA8GgG9G+iwjj7LcuCkLF41KV3R7X2Y3tYxMAphSTrPRcUsf14X05
	qXRSWgayYroyMmFnf18dA1KrAtb6Cosa91LycT7oF44/Nb6K8dK0ytwNSxQ9vl+Obb3c
	oiIUwfqNSPMVbVWkVsGmM3WzL2K3NGhAcA5ATrFcvBxsC+ozy0t8MmVrX0w3VD3myVu5
	wvNMECs4PRXnIpIvajxF+tLo/NQRsG7HYIyZsdcSpmvgg7cY1FPO/CU3qKb180crJIN4
	Bv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PrlvExszEJbE0U56TvQgKJn/3WD4JoeuYHENgEP9BXs=;
	b=cja9tVcZcquS395sa7QX5XTHRs/E95Yk51xI9Q9KuVZnoB34/WMZwRgUjx3qwsIYO3
	TCXR0Y83KE9Ciuvz4S/rInF3lmYMTkY1BHH2w+Oi6Appf7NYxIYrC6i8iXlcmmbtqBfS
	zgr9Q96iVhz1RRugOPs3wx/tDtKX86PnF67oJlQ0tSS3AZ8p/uzu9QOCbv0CWKnHSdfn
	yb856ivt5si2jWAlrkHH4VmtcZbVSpqsnD4ZFCzzzH0SUbLUd7l1OPDKowLVR6r4eNce
	z05SD/N83FJk/sFf0A4P9XjJOK3TlvMM1+ENeMaeJLweVaO6+XBSSF+2Yiw97P6xHP/T
	DCFw==
X-Gm-Message-State: AOUpUlHhXt9G0ULcqYY+KtkrVcda1xZKfkyfiiQr1bizOHPGLxshRV8o
	+EHUxU2MjNdX02lwfRbylLRR8CQx2SUvVhii+KU=
X-Google-Smtp-Source: AAOMgpeMCwmAFnWXqGKpGoWoLfOuQiohm5PEWbziilsMx3M2qjseGPRJf0ce+CKEXSohFN0d/41jiyDC7YwNQttThyU=
X-Received: by 2002:a1f:1584:: with SMTP id
	126-v6mr1557056vkv.146.1531854208930; 
	Tue, 17 Jul 2018 12:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <1531850817-26274-1-git-send-email-armccurdy@gmail.com>
	<CAMKF1sp3z1n+t5QKgbiWn6MkXEGOEFF_8G_X=1dYFTcx48U3RQ@mail.gmail.com>
	<CAJ86T=WYor_Gf2dpio37Yu86bmCfeDht9s6p02XFgH_2QDOv9w@mail.gmail.com>
	<CAMKF1spGseSt53y4jON1S0sX8VFn4MfuQhyfPNfh3zK0Jt4asQ@mail.gmail.com>
	<CAJ86T=XhVww9055CC8dcyySHPhiRfK1bDPdoyQwzFCXorep6yg@mail.gmail.com>
In-Reply-To: <CAJ86T=XhVww9055CC8dcyySHPhiRfK1bDPdoyQwzFCXorep6yg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Jul 2018 12:03:02 -0700
Message-ID: <CAMKF1sq9kgwckZkcmRTmstHjNf8LxpYoBWugK3bAKcU1sD=7iQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] curl: disable C source code generator
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
X-List-Received-Date: Tue, 17 Jul 2018 19:03:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jul 17, 2018 at 11:49 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Tue, Jul 17, 2018 at 11:37 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Tue, Jul 17, 2018 at 11:34 AM Andre McCurdy <armccurdy@gmail.com> wrote:
> >>
> >> On Tue, Jul 17, 2018 at 11:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> > On Tue, Jul 17, 2018 at 11:07 AM Andre McCurdy <armccurdy@gmail.com> wrote:
> >> >>
> >> >> The --libcurl command line option causes curl to generate C source
> >> >> code which, when compiled and linked with libcurl, creates a binary
> >> >> which behaves in the same way as curl when run with the other options
> >> >> passed on the curl command line.
> >> >>
> >> >>   https://curl.haxx.se/docs/manpage.html#--libcurl
> >> >>
> >> >> It's a development tool and not generally useful on the target,
> >> >> especially if the target doesn't contain a toolchain etc.
> >> >>
> >> >
> >> > probably better to have it controlled via packageconfig knob
> >>
> >> Really? Why?
> >
> > We do have people building SDKs for SBCs which ship development
> > environments on targets and I believe
> > it does not hurt to use packageconfig. Do you see downsides ?
>
> It's an extremely obscure feature and I think PACKAGECONFIG options
> should be reserved for stuff which we want to advertise as being
> something a general user might want or need to control.
>
> Of course there are targets which have toolchains, but I think the
> chance that someone wants or needs to develop fixed function curl
> replacement binaries on the target is close to zero.
>

Since we are disabling a feature, that concerns a bit.

> >> >> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> >> >> ---
> >> >>  meta/recipes-support/curl/curl_7.61.0.bb | 1 +
> >> >>  1 file changed, 1 insertion(+)
> >> >>
> >> >> diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
> >> >> index 03d627e..cc983fd 100644
> >> >> --- a/meta/recipes-support/curl/curl_7.61.0.bb
> >> >> +++ b/meta/recipes-support/curl/curl_7.61.0.bb
> >> >> @@ -49,6 +49,7 @@ PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
> >> >>  PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
> >> >>
> >> >>  EXTRA_OECONF = " \
> >> >> +    --disable-libcurl-option \
> >> >>      --disable-ntlm-wb \
> >> >>      --enable-crypto-auth \
> >> >>      --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
> >> >> --
> >> >> 1.9.1
> >> >>
> >> >> --
> >> >> _______________________________________________
> >> >> Openembedded-core mailing list
> >> >> Openembedded-core@lists.openembedded.org
> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core

