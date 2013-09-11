Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f43.google.com (mail-vb0-f43.google.com
	[209.85.212.43])
	by mail.openembedded.org (Postfix) with ESMTP id 60B2260F17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 20:32:23 +0000 (UTC)
Received: by mail-vb0-f43.google.com with SMTP id h11so6433236vbh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 13:32:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=r8Jf8/ui4Fz1+Ez+15wnHSGsPHUVcpoBDAWf3y+w00o=;
	b=XKlfKuGWlP34zHjCu2/GiWOS8IAaY1XLTEY0nO6RuuF6cHoUDCuCDPtbgtLPFZLQ44
	U4f1KXrShbDPR02Yui6EOMu3SBionQemkILd8630nqSGhY1c2qYO5zwIn4qPgZgtA3J2
	+rqb8UsoTahlTwQJvIkp4JO70JHToa3jAJyQezpa+ny5JBB7VbyKwC8h+gzUfoQQ77Ul
	vK3TIRZ0FIvZ6Xe5FkMtgjgGks9+SxNQL4l3xsRZbIidkJiypthfwUEAUNWybjPmXurQ
	Zcl+K/sOE+c+beZ6Z1fxzs/+0X+Zfaz0f2lsoUsJQCKECKoWZxHElk48Ca8aXuCbdWMO
	zgjQ==
X-Gm-Message-State: ALoCoQnloOymQGtFOZm/OrhSpwcOoH5Vpznr1iU3vKfOP3TVawAEyQGPm5ocS5tA+OuE0vXYRrDY
X-Received: by 10.220.164.202 with SMTP id f10mr2968360vcy.25.1378931544986;
	Wed, 11 Sep 2013 13:32:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Wed, 11 Sep 2013 13:32:04 -0700 (PDT)
In-Reply-To: <CAJTo0Lbt25Rd0yz3XGTjhA3+S-55t6DpgyhhDRmxSpxB6HNpTQ@mail.gmail.com>
References: <5230AAB4.2060005@mentor.com>
	<CAJTo0LZMNna84CTpC3QTr6X+kMMcFXCERgsx=8kaqL3PpRr_hw@mail.gmail.com>
	<5230AFB0.7010008@mentor.com>
	<CAJTo0Lbt25Rd0yz3XGTjhA3+S-55t6DpgyhhDRmxSpxB6HNpTQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 11 Sep 2013 21:32:04 +0100
Message-ID: <CAJTo0LYKpMchXASpd97foyAX3rG2_T1SeR0XjQPEdKFfWr+22w@mail.gmail.com>
To: Stefan Seefeld <stefan_seefeld@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: build errors after upgrading
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
X-List-Received-Date: Wed, 11 Sep 2013 20:32:23 -0000
Content-Type: text/plain; charset=UTF-8

On 11 September 2013 19:07, Burton, Ross <ross.burton@intel.com> wrote:
> On 11 September 2013 19:00, Stefan Seefeld <stefan_seefeld@mentor.com> wrote:
>> But meanwhile, what is the appropriate fix on OE trunk, to get back to a
>> working state ?
>
> The appropriate fix would be fixing the configure script.  I'm
> starting a build without opengl now to replicate, unless you can beat
> me to a patch.

I've sent patches for -vesa and -intel to fix their build without GL,
and I've now built a "base" sato image without the opengl feature for
NUC.  Next up: qemux86 and the vmware driver, and then a world build
to verify everything else in oe-core.

Ross

