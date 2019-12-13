Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id D43E87F404
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 22:08:30 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id t14so314441wmi.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2019 14:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QVrxsTC6C1JhAnblhFk9cPJhM/l0d4zOQ78BEA0hNCk=;
	b=FN/h8h7zwZl8sHHvrf7/G+SRF43hx0E75dzfcSSW7+k1ob2g3bdv9tPdRR/k7PXOpI
	YXGrlQIlhic1GJr0uaxK7MPuB/foz+r1wu77yi9UTcQeLFp/9IeYBfmtPLJLbp9IpcNt
	LvI7j13Hk/grON5jhgsVb/Ast6LFPKVf6cB5fFYJ5kIJuQjehoRrL7HoFtHGDZDZ44t5
	qHhfeu9L06Iz+m9qHEWWe/a+5cuikinEJPxYIDIVdNf6zikKlFt13HErkMipL1OGaV62
	RsCqBZ2Qzawb7bu4+XPtOzvDAe8WFsJpxLg3PewFY1+eZW/avkivN90r3AFBlBaGK3dl
	tG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QVrxsTC6C1JhAnblhFk9cPJhM/l0d4zOQ78BEA0hNCk=;
	b=oaZDjvrPoEHf1CkHUZWkOFZ4QFOKBxznQtpWQXYC6biCTAXhhM+WL5WdA9GXYZ85oU
	+owlD3BpjOxymjsF2/Y4eTmJpjMZpMffoHehIGtrEmTl4bGaJ3/XLD32fEZPTeXUX5A5
	JkqJUCZWt0yS3WkB9Mki9BjWpsXUjiLBbJnL3qL5Hoq1YNNjA7NE3+US/olbzg2/RtoC
	QnzlkM0ZNo002AVZ0Lea5YJ0PiStXigIQvrNm+7dT6cjd7rYNDwlaCe2pl/nOfZ3SsFl
	WwDix8r28ZnAJIAaklrcoA2orZ7L9KiIvPsHZQ2IFGjiSiu5I0xFDeqcaazeQDv3uNfR
	qc4g==
X-Gm-Message-State: APjAAAXe86HQHOG8sJCxUsmomWkR1Uch2m+czYvFh672WkUKR+WHn1kI
	b0dQWngVaxuSuPlEDHsQ/+kbf8uNw2GTOFK73JWOYA==
X-Google-Smtp-Source: APXvYqxVqyZ9Kwfryg+6B1FvPz/qy82wNhnSjzUh5BAUjRTrpR8gD25qJwKxHMB/IbLdNPOG8KKdQnRFI6EO7FBIKH4=
X-Received: by 2002:a1c:7715:: with SMTP id t21mr15439955wmi.149.1576274911409;
	Fri, 13 Dec 2019 14:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20191213220309.3964324-1-JPEWhacker@gmail.com>
	<1370d17b-c688-ef9a-3bdf-bfa4857d4666@kernel.crashing.org>
In-Reply-To: <1370d17b-c688-ef9a-3bdf-bfa4857d4666@kernel.crashing.org>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 13 Dec 2019 16:08:20 -0600
Message-ID: <CAJdd5GYQKc=Ptnq7viYwVcQkmxYYJ8yxmY3iq7iOQmnZctLpKQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tune-cortexa72-cortexa53: Add tune
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
X-List-Received-Date: Fri, 13 Dec 2019 22:08:31 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 13, 2019 at 4:05 PM Mark Hatle
<mark.hatle@kernel.crashing.org> wrote:
>
>
>
> On 12/13/19 4:03 PM, Joshua Watt wrote:
> > Adds a tune for Cortex-A72 Cortex-A53 big.LITTLE SoCs, e.g.  Rockchip
> > RK3399
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  .../include/tune-cortexa72-cortexa53.inc       | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >  create mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> >
> > diff --git a/meta/conf/machine/include/tune-cortexa72-cortexa53.inc b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> > new file mode 100644
> > index 00000000000..30e49d20769
> > --- /dev/null
> > +++ b/meta/conf/machine/include/tune-cortexa72-cortexa53.inc
> > @@ -0,0 +1,18 @@
> > +DEFAULTTUNE ?= "cortexa72-cortexa53"
> > +require conf/machine/include/arm/arch-armv8a.inc
> > +
> > +TUNEVALID[cortexa72-cortexa53] = "Enable big.LITTLE Cortex-A72.Cortex-A53 specific processor optimizations"
> > +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> > +
> > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "aarch64", " -march=armv8-a", "" ,d)}"
> > +
> > +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", "cortexa72-cortexa53:", "" ,d)}"
> > +
> > +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa72-cortexa53", " -mtune=cortex-a72.cortex-a53", "", d)}"
> > +
> > +# Little Endian base configs
> > +AVAILTUNES += "cortexa72-cortexa53"
> > +ARMPKGARCH_tune-cortexa72-cortexa53 = "cortexa72-cortexa53"
>
> I'm wondering if the pkgarch should be shorter.. This really does make package
> names very long.  (I don't know offhand if that is an actual problem or not.)

I chose this name because there is already a
tune-cortexa57-cortexa53.inc, so the consistency is nice.

>
> Also a similar tune has been used by NXP and Wind River.  So hopefully we don't
> end up with conflicts.
>
> --Mark
>
> > +TUNE_FEATURES_tune-cortexa72-cortexa53 = "${TUNE_FEATURES_tune-aarch64} cortexa72-cortexa53"
> > +PACKAGE_EXTRA_ARCHS_tune-cortexa72-cortexa53 = "${PACKAGE_EXTRA_ARCHS_tune-aarch64} cortexa72-cortexa53"
> > +BASE_LIB_tune-cortexa72-cortexa53 = "lib64"
> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

