Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5D09A797A9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 16:06:36 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id f17-v6so14698293qkh.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kPmNYF/JtwQyv9gm4LWGKrecCmONpjncpBGl0avD3gQ=;
	b=Vzok/NAd+L+l9D4g/qSw4NwFlq6vsR+vzx7akDAgPeGdrL8Sh6MqJYRQGF+Uvdija0
	xGTqojHBZDdp60zGUXbzV5OveWaSx2D++gh3VHJMG8/thJY14+McPFPuKnuaeS0aBFdY
	USmvQgH01jZZ1xQt7kTEvkQPlSigXjfiOcNIREG/gYJI/eUkQVc0Yye1NAa/PvSKCspc
	fDDWlGYyp0GTbEigL3gRZJRtLhEzaFTxoXt52gMxcdpZb9MT95//zUbXw2ibIy56/ZWb
	9aMaQt0H0WbWrY13o8UPpOkp2QYNyOQXvJZ4Eg2N8G/0HpEEdKdKzrGwrnJGjqj0xo+J
	xaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kPmNYF/JtwQyv9gm4LWGKrecCmONpjncpBGl0avD3gQ=;
	b=aXvPH84AHkcHxBzbHHjAFd6FNi3ZvihR3nDK0yi7rP5sADquK8Z66TL/U1T2Ns+No8
	6nrk1ytUP8aAAs/o/3qzWcGgp8Qb67O+/FJ8ZZxex4aGFZr3N8tdMKsTinVDRC7zmasL
	UJwFVR5qvPhXmcEgekJ04cPlcWmezlKg8b5m7FvQfjqdZdKr5tlMd1GI1AxID579qhym
	0r8sP0vWK74hPNj8RWvFI9W/JWx1efMcQMW6VNF2aG5cPKCTNpgSR6B6qGLurVXdfa8K
	HyRJpSw0Bp+PN9hBydQ5Wk2C21FvlqIPyCMhrV1NDiQtAGPoFQsWFeubq6VSgHEkC1yH
	3j3A==
X-Gm-Message-State: APzg51Ci5nxvrbvt/hzDU2rapsG9Xl7YQrtuM5byjOapk6VjB7nYBkVV
	0TDZfBbySj2B2BTUsbzuQponeQiKIuZhrH5MgSI=
X-Google-Smtp-Source: ANB0VdaBcDDMwXG1F9Dc7H3hljlEpQgOfHzSb556/XoxPyDScbN/um6ME3qBfjNyEoMxY7OgjwjiDrOggjsByNsdwPc=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr15884720qkm.2.1536595597098;
	Mon, 10 Sep 2018 09:06:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1536009789.git.raj.khem@gmail.com>
	<CAJTo0LaqQ61iT=wg8qVn0UUaeLaCB=FZ1g=uc6fgMjtKmFOimg@mail.gmail.com>
In-Reply-To: <CAJTo0LaqQ61iT=wg8qVn0UUaeLaCB=FZ1g=uc6fgMjtKmFOimg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 10 Sep 2018 09:06:11 -0700
Message-ID: <CAMKF1spcqZEu2eakfcAtYT=76h3_YnK9xKRfUZSOacXC7ieL7Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 10 Sep 2018 16:06:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 10, 2018 at 4:14 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> I never saw these on the list, just the cover letter.
>
> So the serf change introduces three patches, two of which are
> backports with nice descriptions but one (0003-gen_def.patch) doesn't
> have a description, upstream-status, or signed-off-by.  Can you add
> those as appropriate?
>
Good find !
This series is already in. So I sent a new patch to address this here
https://patchwork.openembedded.org/patch/154772/

> Ross
>
> On 3 September 2018 at 22:25, Khem Raj <raj.khem@gmail.com> wrote:
> > Some failures seen when host has python3 as python
> > build core-image-sato for riscv64
> >
> > The following changes since commit 929b1b341b4b221ac10c8621bad27abfa7ae70bc:
> >
> >   openssl: Handle -conf package file conflicts (2018-08-31 15:33:56 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://git.openembedded.org/openembedded-core-contrib kraj/misc
> >   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/misc
> >
> > Khem Raj (3):
> >   packagegroup-core-x11-sato: Make weak include for gst-examples
> >   serf: Fix Sconstruct build with python 3.7
> >   eglinfo: Upgrade contained waf version to 2.0.11 release
> >
> >  meta/recipes-graphics/eglinfo/eglinfo.inc     |   6 +-
> >  meta/recipes-graphics/eglinfo/files/waf       | 169 ++++++++++++++++++
> >  .../packagegroup-core-x11-sato.bb             |   5 +-
> >  ...print-in-the-scons-file-to-unbreak-b.patch |  29 +++
> >  ...-Fix-path-quoting-for-.def-generator.patch |  27 +++
> >  .../serf/serf/0003-gen_def.patch              |  22 +++
> >  ...11083-fix-building-with-scons-3.0.0-.patch |  29 +++
> >  meta/recipes-support/serf/serf_1.3.9.bb       |   7 +-
> >  8 files changed, 291 insertions(+), 3 deletions(-)
> >  create mode 100755 meta/recipes-graphics/eglinfo/files/waf
> >  create mode 100644 meta/recipes-support/serf/serf/0001-Fix-syntax-of-a-print-in-the-scons-file-to-unbreak-b.patch
> >  create mode 100644 meta/recipes-support/serf/serf/0002-SConstruct-Fix-path-quoting-for-.def-generator.patch
> >  create mode 100644 meta/recipes-support/serf/serf/0003-gen_def.patch
> >  create mode 100644 meta/recipes-support/serf/serf/0004-Follow-up-to-r1811083-fix-building-with-scons-3.0.0-.patch
> >
> > --
> > 2.18.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

