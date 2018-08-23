Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 50AF279549
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 16:47:04 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t25-v6so6485364wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 09:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=z3JOsq2GZJfsbOttcF+AEH3coAZs+qASlx3h0NXk+8o=;
	b=LAM/7+LKsv28HdKLiPPA6WTpvhUTG484ObtFGEhhTsHDXJ2SCT1xGoigcTkj80lzYf
	C/NAf/dv+lC6qIiIr62CraXWmbMR5iWyp11ToLFRhingMKxjCMc0z6QxzHuNnXc+7Ky2
	lHhvX/xHPuHQrumnR7P7Za9J//rBN+agBuie4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=z3JOsq2GZJfsbOttcF+AEH3coAZs+qASlx3h0NXk+8o=;
	b=h3RR+JB4iFVvS0TfQ3bPm1Fpk3EnZrQIhJd960EUVUT+5azF2k+tnFxs0R1Z5VhLi6
	UPgKwXXZhghTcGRYYvxMxRNFIkteKvrCjvlONyIbYfZuvC91EV3rMvFiICssGgm8GGa3
	+cVuJGNj6R62sPIFUt/tsYsA0WgUP5mSQy+5bseLSBaU/84vvLwzJRl4F2QcKv80z0y/
	GyNPEJiZPmqD4vEUeGGINyseQvbl1UmhOp4wdmt5rLQ8wpg3V8VubbALEwqvZB5flHZ8
	EUpReN42GYVrWNDXIPqhC2u1Pturs4X/AjMuvcVbj4ippqqvwysdK5pj1lqgkP7GXbPU
	kWpg==
X-Gm-Message-State: APzg51DOsNfUqDOOO7iMWL591+6zipBCWWI92Z/WlEFL8KEqFnK51wdV
	d+yT3mhdcznMiNLn4b/n2YPsFA==
X-Google-Smtp-Source: ANB0VdaTTHfImgnxaFsR79xxv3YXqWD+kG73Y+q6AOg4Kvm4wyEQVPF3t3QgpkGS16ZZdDGCk/VD/w==
X-Received: by 2002:a1c:36e4:: with SMTP id
	y97-v6mr5463456wmh.71.1535042824967; 
	Thu, 23 Aug 2018 09:47:04 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h75-v6sm784420wma.46.2018.08.23.09.47.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 23 Aug 2018 09:47:04 -0700 (PDT)
Message-ID: <15914ed0e215c54338998783d1e386dddabe66c0.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Derek Straka <derek@asterius.io>, kergoth@gmail.com
Date: Thu, 23 Aug 2018 17:47:02 +0100
In-Reply-To: <CADNbA1qYW6AzgTmiCuwVj_XkEmFq7rqWCoz+5dBP_PPtuH_79w@mail.gmail.com>
References: <20180816062633.29868-1-anuj.mittal@intel.com>
	<CAJ86T=Wzi5hzFUfChDLKTDyKf+X9_EUjFvPE9wfSp5UXaQycaA@mail.gmail.com>
	<188b139f-5d52-b2e3-fdd7-e231deb56052@intel.com>
	<CAJ86T=W5cVZ+VEdRVi96-QRx5BhmTPpWZ1HU29UuXhmrZbS6Xg@mail.gmail.com>
	<5a6bf05b6a04f09ed3f148c996a2b6d0d562924d.camel@linuxfoundation.org>
	<CABcZANmK_H5kPGp2UQMBTszEXW3D++f8404c-GANqpaRShzffQ@mail.gmail.com>
	<CADNbA1qYW6AzgTmiCuwVj_XkEmFq7rqWCoz+5dBP_PPtuH_79w@mail.gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: enable profile optimized builds
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
X-List-Received-Date: Thu, 23 Aug 2018 16:47:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-08-23 at 12:40 -0400, Derek Straka wrote:
> +1 for this being opt in.  It's a substantial hit to build time
> 
> On Thu, Aug 23, 2018 at 12:21 PM Christopher Larson <kergoth@gmail.co
> m> wrote:
> > IMO PGO should really stay opt-in, not opt-out, given the
> > performance impact.

I'm not arguing against that however I'd note that the performance of
the resulting python binary is substantially different too, much more
that you'd think.

For older distros where we use buildtools tarball on the builders, pgo
python binaries should help significantly with things like bitbake
parsing speed (I'd love to see numbers).

Cheers,

Richard

