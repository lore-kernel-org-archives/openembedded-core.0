Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id 297866D0F0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 08:32:22 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id c14so3735062vea.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Oct 2013 01:32:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gUDzYHJEv06Cg9l0josF2htpGT7mOJvXxpuRjxeFgDs=;
	b=i85L5wUDZ/wMIUwzupU89zWAXJMBFXusEcKHhQjE7YED5J1BtFYM3oRfhWiPeVw+qK
	OpfQmRVWdska/Hrf0cEZIzGjePEsgOV9v48Flo51IKoQ1APXvzZ50mq55lYSXOIFyyaq
	Ge1SJI/A9n1znG1hsO742cbV4T4JRTNYQiGurKPqB3jxeEAAnT8rAkP+7pKOOE3VbmXA
	uabv9UlRuwWuOSRDH1hAiObENM1Jy/CxLDRTkh80G5Jhx+XrP2hL/bTYVhjqftJ2wPY+
	6wIziyfUKGEr89X/MHj2xNI9MVVo1fvysoJCMmp5NBTuTkBxL+Lx8SRtKfKAjJC3pAle
	xYhA==
X-Gm-Message-State: ALoCoQkjDGubr6IvViiBRQEBtB4TjwvI6Ray9OpnKdwQcvQOKYbq9fpOanWbBawJygEee+aP0M+C
X-Received: by 10.220.164.202 with SMTP id f10mr325581vcy.25.1382344343652;
	Mon, 21 Oct 2013 01:32:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 21 Oct 2013 01:32:02 -0700 (PDT)
In-Reply-To: <20131020194345.GB3709@jama>
References: <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
	<20130520130635.GA32431@jama> <20130603151008.GC3279@jama>
	<20130611160434.GI3233@jama> <20130622181656.GK14021@jama>
	<20130725162341.GA3280@jama> <20130808225419.GB17945@jama>
	<20130811114403.GG17945@jama> <20130917123058.GC7313@jama>
	<20131020194345.GB3709@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Oct 2013 09:32:02 +0100
Message-ID: <CAJTo0LaQoFYc601yo4K+OuPUJa2Cq9McPH2nt+41X+EtZQgkUw@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world
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
X-List-Received-Date: Mon, 21 Oct 2013 08:32:23 -0000
Content-Type: text/plain; charset=UTF-8

On 20 October 2013 20:43, Martin Jansa <martin.jansa@gmail.com> wrote:
> libtool-cross-2.4.2: libtool-cross: configure was passed unrecognised options: --with-sysroot
> libxdmcp-1.1.1: libxdmcp: configure was passed unrecognised options: --without-groff --disable-malloc0returnsnull --without-ps2pdf --disable-specs
> libxau-1.0.8: libxau: configure was passed unrecognised options: --without-xmlto --disable-malloc0returnsnull --without-ps2pdf --without-groff --without-fop --disable-specs
[snip many many more lines]

Well at least my QA test works. :)

I thought I'd send patches for a large number of these already that
are in oe-core, but obviously not.  I'll definitely do that shortly.

Ross

