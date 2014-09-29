Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 11ED4605B3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 17:23:58 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id cs9so2259033qab.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Sep 2014 10:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ax+ooYVNtHaTd9HeE2jt7eiVVPtpILG5fXuOmTFbXCA=;
	b=lZWhcAB01PrjSt/brsrPn1sE1hy3HQ9kJBWn9EIHKoG0nhgORHYIbW4a/G2OFNa86N
	5v6QoygnAtoBW2ONlMnhWd40b+sYoyJZldTxfaBDCroY4qj2iQ3Nh+D/Lu/9XIcaZVQ+
	UiW3uWQ1LbYOuLKpvt78vN0ewgVa45CLUXORC6FSb/5oN2K/5tScqq8UWxh/4cI+P/RJ
	FayBwtX8Nfw+Y/6KoQRr3O0heRaEyd6GCGN3+ITCagIFaLbbpgHzJUfTt8tNK06VH6Xe
	eLtoHEvTmNSSrpmtka+9GVRd2RnS5hqHD7VUbry1Yj4lRzAWw298SE8oSnIvTXQTX7Ht
	LyEg==
X-Gm-Message-State: ALoCoQkQItiWorZGAU9eyYdV3JYCtWDiRcdV1yzqMHeBbcuLzQsoq8zuHNVHuc6e1avj71YgvXvi
X-Received: by 10.229.121.7 with SMTP id f7mr4226619qcr.28.1412011439720; Mon,
	29 Sep 2014 10:23:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Mon, 29 Sep 2014 10:23:39 -0700 (PDT)
In-Reply-To: <20140929171445.GT25706@jama>
References: <1412001614-15126-1-git-send-email-ross.burton@intel.com>
	<201722111.zmNURQEFnj@comp-006-thk>
	<CAJTo0LZ4RCk5eqdXb2MxchvQkZgiT3+4+yUnNuNwQZcX+0Vm4w@mail.gmail.com>
	<20140929171445.GT25706@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Sep 2014 18:23:39 +0100
Message-ID: <CAJTo0LZQCt67M1L7KyPWLoj=fQOf7eccnMsnVioc-kANHD_DLg@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] base.bbclass: add SRCREV to do_fetch() hash
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
X-List-Received-Date: Mon, 29 Sep 2014 17:24:00 -0000
Content-Type: text/plain; charset=UTF-8

On 29 September 2014 18:14, Martin Jansa <martin.jansa@gmail.com> wrote:
> It will be still mandatory for recipes with multiple SRCREVs (and
> SRCREV_FORMAT).

Hm, should SRCREV_FORMAT also be in the hash?

Ross

