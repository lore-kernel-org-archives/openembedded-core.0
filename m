Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id A23796C60B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 15:37:06 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id t33so2248638qtt.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 07:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a9C7QNX6NbQP9irdn3VoouegMSwa4A/BOwbudBvL874=;
	b=dgz1UJITA/bS+T8l39XR0H0c14mmABl2rFJ8zyNmbK+5DTuTBdEG1aR1pmUMhjxtV4
	YmX2ZO1WlZ5W7s0uYi3eAiTTPuucJ40vlB6hRrdrhmghgWcyu36KHUJegKf9qDRmBmlu
	8GglEM7rig2xR49zV4LfG0UVL92vzrHjEAwey+KwIpxwl63WZnasF2k7WMi/nalMvItq
	QZmbwhlcp7HH7/24/RPweSCw5x9qrc/QDQSC0b+2FHmDLJB6TZeOTDdi4Le/ShkvI1Sq
	EBsHy8TJhQghrtgnFCqwsZ9kNqY3rAg19cKT6zFaJAkmNcZMtvxW3Z162f0bp2FVgccw
	ryHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a9C7QNX6NbQP9irdn3VoouegMSwa4A/BOwbudBvL874=;
	b=BhMyi00yHxGUpMsywNPhDkXTquMVVBYpdedis9azlrjlSGOD0JqLPA6F9ieLeTT6Im
	cQROJNhzx+lzw1CTY5JOZZMLkjmFQWNhsnygnzM/6NuXsh9PCRDnzX9YVr+oY4zaO4SD
	ebBCvZuX3jeXNN19IID7TwxN+Q6wQ3Sf3Phj0UNIfJsKL42hR2ijkOZjJYTfAPDUdR7Y
	Ag8iXDxsCr4IMJAPWXhO0C3S8Mv8+4etNJ0a0le+8UKbV+F9BJ80e3ytjGd2w9Q6sGgr
	m9Uj3i1jivRDhRot56g4RuZQQGSy8zILKqiXnLukgxz2RXz4uCS6GCb3FBX0lGBSRRMp
	v5Zw==
X-Gm-Message-State: AA+aEWa3x57JbFpBgE3/6+uPET0ahd0QHLdcCHLGbc/6/I98vFrnG9Ln
	yANxRpLn4F5wdQ/3IoWiEpuFD79DtHxg0SxmnHE=
X-Google-Smtp-Source: AFSGD/Vx3wAEYdUM6E8u84L3tYNSvcX5iieH20URrfoLyH+0e/U5exjMT+vmd3JRqeShJZZkGuslVL3wuIp/4gZ+Pg0=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr26335276qvq.55.1545320227067; 
	Thu, 20 Dec 2018 07:37:07 -0800 (PST)
MIME-Version: 1.0
References: <e0464c53-3d11-884c-75bd-1e78aed97ded@linux.intel.com>
	<E4F39B19-40EF-4774-B2B3-6C37A2CB98DC@fuzziesquirrel.com>
	<CAJTo0LayfGOMkwFrLStd9_93fBBG8ZH4b806T5CCo=A1nbTCWg@mail.gmail.com>
	<CAMKF1sp1DLQwANi8sbHp4pP-YPPMbVOOsArUoxa286QAgTx-Lw@mail.gmail.com>
	<CAJTo0Lb1Vq7-UXWKZf5hs4L4HzKAu45HTOnxtFXkOCttA0BiiA@mail.gmail.com>
In-Reply-To: <CAJTo0Lb1Vq7-UXWKZf5hs4L4HzKAu45HTOnxtFXkOCttA0BiiA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Dec 2018 07:36:40 -0800
Message-ID: <CAMKF1speLVxgZXojHO5ZBNO1LQXS4CMFvhK6VEbkeJL3giyMiQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OpenBMC <openbmc@lists.ozlabs.org>,
	Bradley Bishop <bradleyb@fuzziesquirrel.com>,
	James Feist <james.feist@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: flto automake
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
X-List-Received-Date: Thu, 20 Dec 2018 15:37:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 20, 2018 at 4:37 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Thu, 20 Dec 2018 at 01:20, Khem Raj <raj.khem@gmail.com> wrote:
> > > That however leads to the question of should we just change the
> > > defaults? Does anything break if we use gcc-ar instead of ar?
> >
> > Dont think that is a good idea in general since gcc-ar is a wrapper
> > around normal ar
> > passing --plugin=/path/to/lto/plugin/so and that may not be right
> > thing to do always.
>
> Well, I built core-image-sato core-image-weston with AR=gcc-ar
> RANLIB=gcc-ranlib globally and it worked fine.

Please build a lot more. These images cover only handful of recipes
there are problems like

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77576

which we might have to contend.

>
> As we build the cross gcc we know what is in it.  Other toolchains be
> they clang, ICC, or external GCCs, can override AR just like they do
> the other variables.
>

Yes they can, but what doe this buy us ? except we make Core toolchain
gcc dependent one step more.

> Ross

