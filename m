Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TR4Y0-0006RV-MN
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 19:15:16 +0200
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 24 Oct 2012 10:01:47 -0700
Received: by mail-oa0-f69.google.com with SMTP id j6so2172865oag.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Oct 2012 10:01:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=YflrYj+TFGt8x1jq98In29Y7IGVKtTKRFQ+lJv0vMws=;
	b=mOM8dCAC004DUpJnOmRmIxWcSdCs7j2IjU94mZMIQHYz7l4CQ76r3s3inirF+6G03/
	oJ0Y5Hl0wjXCv6t0fcvrWcul2MQIjeb2umcdl4SHuxUs+FV5Je4iAYOgcgf9+SjNXxDO
	PgviK51ePpL/ozm1tVOkZ/6X+Jofog0SnpVpM0b21gicg/KKP8DEKjP8t2XJTDtA+Zpb
	sDwHy64cpRXfYi/OxyNIx9iv3PCeM6s2OutkpmB/lkCDTA166t2oy9IUs8ABHomNNhbl
	z/C09j9rK+3c4TpfBBgMad+GE+8CBb7JcyZXG+1Xihni0o+cny/8bgeJsJxHKtBNyjkY
	PsNg==
Received: by 10.60.170.9 with SMTP id ai9mr14003058oec.36.1351098106629;
	Wed, 24 Oct 2012 10:01:46 -0700 (PDT)
Received: by 10.60.170.9 with SMTP id ai9mr14003054oec.36.1351098106548; Wed,
	24 Oct 2012 10:01:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Wed, 24 Oct 2012 10:01:26 -0700 (PDT)
In-Reply-To: <CALbNGRQoX5J5NvPRHc2VAx-D58UvxQmLhunEev09OaxkFwGJKA@mail.gmail.com>
References: <CALbNGRSX3AtHywq3RR3OryKbRWaqL=v2TE+xsuNsDQ3O2PY4hg@mail.gmail.com>
	<1351088462.3259.421.camel@phil-desktop>
	<CALbNGRS7m2mbZD2QhwTrkJAdL2-1Vc_pz8yfkXQ_ZJzESbr0jg@mail.gmail.com>
	<1700131.q7Jk2zQzF1@helios>
	<CALbNGRQoX5J5NvPRHc2VAx-D58UvxQmLhunEev09OaxkFwGJKA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Oct 2012 18:01:26 +0100
Message-ID: <CAJTo0LZ1JTxj6a40eM0RzxRpoY1=DKwLqJiuU7cGjQo_7dYO7w@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Gm-Message-State: ALoCoQnFNYH20CKLe9uDDnJfqNkgRHEETVYF5NL0mW1zmiuQ8VGtrcS2F3dFYlt02zHeTXVnRQmbu47+vz2yFGqUBPt0TyC2BQ0ctMHn9BftQbB/dVcUSbIi0Wneqeuw+CwtesElZvN1GQ4orf15yIqEKl/hi7wXp+85lBaJmaaMvRxZ/UWaUCR2IYeUfxbcFtW6t3SAk5fq
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] Latest head causes challanges
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Oct 2012 17:15:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 24 October 2012 15:49, Andreas M=C3=BCller <schnitzeltony@googlemail.com=
> wrote:
> To me this is a log off and go home. Since when do we care for FHS? I
> thought everything is on it's way to /lib... And I thought on master
> branch I am safe from strange changes these days...

I'm curious as to why it's such a drastic change for you.  Packages
that Do The Right Thing will just work when libexecdir is changed, and
by definition they are binaries that you won't be running yourself.
So what's the problem?

Ross


