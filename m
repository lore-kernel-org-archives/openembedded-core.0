Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D5F766D470
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 08:13:04 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id t4so3522918wrx.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 01:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=Ogx8be/Bp6nl3H0jp0+biEdBuZaHt3I9AdiO1HICO9c=;
	b=KPPBUaRH25DExjZzfEyYyJIDEJGqtbT5tgF8hZHxawVXkLtS+xuW5hVEK/LyYdHepU
	tO3zMLauy9r7r3fGmKOEMbPno2N7SqD75KMYM7pjOhlHTqsF++mA3eSme7hjZyeUxPUc
	W0e49SHDIHAE1cTpqfjBqQo8px4GYa0hMhO+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Ogx8be/Bp6nl3H0jp0+biEdBuZaHt3I9AdiO1HICO9c=;
	b=hmjaURdUy+giin6GaeVX3N8agIWyvfVABEGMe2kqxtcjSKyjp6TuVHoR2f9AmEb1y/
	1s0PwT/IptQgG/NKQ2T74CSM14mVMvWUG2jEAQn8cYO6SldOLqKX2RyvvOYwnX8GdMUE
	kW0GT0O/ZY3cV9TsyPPs5EuBwaQ8gKNYughom5coqNwk5cRQ6iy48++CZEmFdUM0fTZ1
	5KWjoosVWT+NuMjTrYope/fUW59gfsH22vGUIAx9V3/Gdg11wHCdk6CkZrRzZByYhRTf
	LpJGwmJuUlTfryoLEbN0HzH0XIVqv8ESLJfUSdh5XvXq5BLGWKe/RQ7TmETKSAg2bY6h
	0u1g==
X-Gm-Message-State: APjAAAWMApOPZ4juyP+ZywPNJKe4ULaC2phw++tDaWik+r+/XdNsskjS
	/VBCfsPCGQSpKhoo8lyDbvvh9A==
X-Google-Smtp-Source: APXvYqyAldnwQMElDyv+I4AFOuXVlqNeWGI95kGYfkZ8HUntfqKmiv+gYUIa7Cp5vyF4BlbBDIlXQA==
X-Received: by 2002:a5d:4a8d:: with SMTP id o13mr1578386wrq.350.1559203985516; 
	Thu, 30 May 2019 01:13:05 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id 95sm3895254wrk.70.2019.05.30.01.13.03
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 30 May 2019 01:13:04 -0700 (PDT)
Message-ID: <aba82f4358b0479419ccc3412b83c052dce57bf4.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Adrian Bunk <bunk@stusta.de>, Tom Rini <trini@konsulko.com>
Date: Thu, 30 May 2019 09:13:02 +0100
In-Reply-To: <20190529230203.GB16075@localhost>
References: <20190529184328.28470-1-richard.purdie@linuxfoundation.org>
	<20190529184328.28470-2-richard.purdie@linuxfoundation.org>
	<4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
	<8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
	<321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
	<4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
	<20190529221726.GA16075@localhost>
	<20190529222920.GP20781@bill-the-cat>
	<20190529230203.GB16075@localhost>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Thu, 30 May 2019 08:13:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-05-30 at 02:02 +0300, Adrian Bunk wrote:
> On Wed, May 29, 2019 at 06:29:20PM -0400, Tom Rini wrote:
> > On Thu, May 30, 2019 at 01:17:26AM +0300, Adrian Bunk wrote:
> > > On Wed, May 29, 2019 at 10:29:31PM +0100, 
> > > richard.purdie@linuxfoundation.org wrote:
> > > > On Wed, 2019-05-29 at 17:25 -0400, Tom Rini wrote:
> > > > > On Wed, May 29, 2019 at 09:50:22PM +0100, 
> > > > > richard.purdie@linuxfoundation.org wrote:
> > > > > > On Wed, 2019-05-29 at 13:39 -0700, akuster808 wrote:
> > > > > > > On 5/29/19 12:26 PM, richard.purdie@linuxfoundation.org
> > > > > > > wrote:
> > > > > > > > On Wed, 2019-05-29 at 12:21 -0700, akuster808 wrote:
> > > > > > > > > On 5/29/19 11:43 AM, Richard Purdie wrote:
> > > > > > > > > > (From OE-Core rev:
> > > > > > > > > > 29fc9210b973be68de474e75068e4c72371afe5a)
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Richard Purdie <
> > > > > > > > > > richard.purdie@linuxfoundation.org>
> > > > > > > > > With back port to warrior and Thud too?
> > > > > > > > Yes, we'll need to do that if we bring fedora 30
> > > > > > > > workers online
> > > > > > > > on
> > > > > > > > the
> > > > > > > > autobuilder.
> > > > > > > I know the uninative update is required for FC30 but
> > > > > > > changing the
> > > > > > > compression does not.
> > > > > > > 
> > > > > > > This question is about the compression extension
> > > > > > > question.
> > > > > > > 
> > > > > > > Does this mean YP will no longer be providing bz2
> > > > > > > uninatives?
> > > > > > 
> > > > > > Correct, the patch should be straight forward to include
> > > > > > with the
> > > > > > upgrade.
> > > > > 
> > > > > Does that in turn mean we must have host xz-utils?
> > > > 
> > > > It will mean you need a tar which supports the -J option. The
> > > > tests
> > > > I've see so far suggest all our oldest supported distros do...
> > > 
> > > For thud tar >= 1.27 is required, -J was added in 1.22.
> > > 
> > > But Tom is asking about something different:
> > > tar calls "xz -d" for decompression, which needs xz-utils
> > > installed.
> > > 
> > > https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#required-packages-for-the-build-host 
> > > documents that xz has to be installed, but looking at 
> > > meta/conf/bitbake.conf it might be missing in HOSTTOOLS.

uninative runs in a weird early non-worker context and doesn't actually
use HOSTTOOLS so luckily we're covered from that angle.

> > I think it's also missing in for example the crops containers.  So
> > if
> > we're going to backport it, I think maybe we should keep it
> > bz2?  The
> > size difference can't be that much.
> 
> The size difference is surprisingly high - a factor of 5 (sic).
> But in practice the difference between 5 MB and 26 MB
> shouldn't really matter.

I'm torn, partly as if we stick with bz2, we effectively do that
perpetually and given the size difference, we should switch.

Tim mentions we could fix the crops container and I'm tempted to switch
given we're so close with the current patchset...

We can add xz to HOSTTOOLS in master and that makes sense for a number
of other reasons but gets tricky as we can't add it to ASSUME_PROVIDED
as easily due to the libs it provides. I think we only need to worry
about this on master though.

Cheers,

Richard




