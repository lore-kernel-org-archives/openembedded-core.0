Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 92F9D7F3AF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 20:38:08 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id 201so63990362qkm.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Aug 2019 13:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=CWr+MgaKny0l1N2j2cMJkgvxe5Xyy9fLlr9WV0MsD2k=;
	b=PgWrPZ0kVXr9Uf6Fuddf7EioVPwISSe+/gDyNgOHuCGNhIXEzMI9JwCVH3DGcEzVsg
	JvRyOBB6iYg001xK0/wl089f1HZktPbK5WICV4JdFe9mzaEi6IslXw/TlJaRmGxdsxlj
	gCH2A1XtIqnKY978pHdxtgCbtKsujpRVm4AC+405Hs7LHR9k/ngJe8yB4V4eUzoqHrCq
	Sf1XAOpfo4kb3wy4GhXWG6EFd7LZeNf1F+5oXx1y05XbqxXKGq2OZ2xyWhjKVDW2TVVR
	faWsh/GtEzMVhzVVSNq16fBLRlb1N98esFqqhbzDClk5jga9h2Bx1GAbL7z/FOonkKtH
	L3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=CWr+MgaKny0l1N2j2cMJkgvxe5Xyy9fLlr9WV0MsD2k=;
	b=QkDFyYSrsuw4GI7T10NWqmRx+GA35eQpSYhUq5UAwrg2BCsDqcvKemsIxFFapOtsVC
	k0XcnPoJJUPEOQBS+IgQhGvMqK+YaSMT+jE5IuYNrA2pPMz2iymbRtVU08XRnr8ZZ17Q
	IKXzEh3VLik59SExUIYxINzzv0Y0+uEVXkTGoHbQvLPScYR+Z3N2E8HQCmqivv2rG2hY
	ZWMYCjnnk93KEtonLXrqnp0P6UJhbT8eB89ch9rMb/xjIMTi3up03eF8jgsqWGbGamUs
	4NPZ79bqiNkE9G5UOMSKfdbWJNc3rQNTYnAAvdmURgy3bIzhMWAl8LCcnUJ10xt8KoQS
	HvZg==
X-Gm-Message-State: APjAAAVT65/Zet0ozE3e8ix+AwEN7ljejROWOFLR1IXvPKvVKM0lif3l
	ktpKbveiNye/qkn4848+4srn+FsfE8usoz+Ru80=
X-Google-Smtp-Source: APXvYqz5OCKEGOmW45k87W9GoAc0+0zzWRW7jqUEQR7sj1+or2hb6jnZ8nDXNjxylhYwRYwZMBQ/3zoeLjWvflMPPLk=
X-Received: by 2002:a37:ef14:: with SMTP id j20mr5281012qkk.474.1565123888945; 
	Tue, 06 Aug 2019 13:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190804000313.34500-1-raj.khem@gmail.com>
	<542cb1bf478aac542ec319a84fb6c3b4a1be097a.camel@linuxfoundation.org>
	<04bfdf5f-0026-a541-d842-d225313c37e9@gmail.com>
	<f13592b2-0461-c997-c1b1-a53c817e8d02@gmail.com>
In-Reply-To: <f13592b2-0461-c997-c1b1-a53c817e8d02@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Aug 2019 13:37:42 -0700
Message-ID: <CAMKF1srw5DS2MrvQjEsuutK+mz2b=mQpXKZji+2KRbqn2r3ssg@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] musl: Update to master tip
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
X-List-Received-Date: Tue, 06 Aug 2019 20:38:08 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Armin

No this does not, but the v2 will.

On Tue, Aug 6, 2019 at 1:32 PM akuster808 <akuster808@gmail.com> wrote:
>
> Khem,
>
> do you know if this update includes  CVE-2019-14697?
>
> Fix:
> https://git.musl-libc.org/cgit/musl/patch/?id=f3ed8bfe8a82af1870ddc8696ed4cc1d5aa6b441
>
> or
> https://git.musl-libc.org/cgit/musl/patch/?id=f3ed8bfe8a82af1870ddc8696ed4cc1d5aa6b441
> https://git.musl-libc.org/cgit/musl/patch/?id=6818c31c9bc4bbad5357f1de14bedf781e5b349e
>
> - Armin
>
> On 8/6/19 9:03 AM, Khem Raj wrote:
>
> On 8/6/19 3:48 AM, Richard Purdie wrote:
>
> On Sat, 2019-08-03 at 17:03 -0700, Khem Raj wrote:
>
> Fix for RISC-V build regression
>
> 64bit time syscall plumbing
>
> Changes are here [1]
>
> [1]
> https://git.musl-libc.org/cgit/musl/log/?qt=range&q=0ce49d0a301b4142741b32773492af90f66ed3ca..6fcb440d91ad972d970984ae3e781d30c0602c9f
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/musl/musl_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> This didn't pass automated testing for qemux86 or qemux86-64:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/899
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/900
>
> seems ssh test failed. I will check
>
> Cheers,
>
> Richard
>
>
>

