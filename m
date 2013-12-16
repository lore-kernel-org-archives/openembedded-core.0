Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f181.google.com (mail-vc0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9DB796E488
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 13:50:35 +0000 (UTC)
Received: by mail-vc0-f181.google.com with SMTP id ks9so3113627vcb.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Dec 2013 05:50:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ui2OIDv0fDqTB4LAtrdR8kJcFH4TmhdSaZUjzWhAEpo=;
	b=N8l3jYtSwrzju/IyGEakaC7HHUBz5bMXweQAuLDFH0UMaHFhxrvWKya45iqZ+FPQWM
	y3D1CTqZLWwaqaQJpXfYdXg8fYb/TEy2uyNXAk7L0ExtnQhOTIrWIc43oiAlhRQJMRw5
	E61V/SG95NAyEFXyXxYMx3Q1G1gf+ncw++ZatZrAAO2riBWs98Uhd6eGd0bjSP2+ZHIG
	yzSLJ/Rk8xfKa/xXSR+M9fS2/tIKFCeS0lwkocxrc0yvUhxS6ICEpBIkrwrWYnMRpvcZ
	cwTl4Dy5FQSt+CLasIB1p3E/ab0C9wuKlM0kEoZayzUX4lHN4kHPeRKEHi6I4KH+MeVt
	BzGg==
X-Gm-Message-State: ALoCoQlSlWMy5k2/ABnhT2fHwnEoUVOnjjvIFh37lmAdi24cWZ4LN4Ymv54TEqLm2Q98E1Z8nJj7
X-Received: by 10.52.189.167 with SMTP id gj7mr225067vdc.91.1387201834941;
	Mon, 16 Dec 2013 05:50:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Dec 2013 05:50:14 -0800 (PST)
In-Reply-To: <3470792.PBUdbl2oFv@helios>
References: <1387199725-19052-1-git-send-email-Martin.Jansa@gmail.com>
	<3470792.PBUdbl2oFv@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 16 Dec 2013 13:50:14 +0000
Message-ID: <CAJTo0LbU_37yfGmJUPb4sHVsVB9MtN5BVCpemueKAYyxAt7MXQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gtk+: Add PACKAGECONFIG for directfb
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
X-List-Received-Date: Mon, 16 Dec 2013 13:50:35 -0000
Content-Type: text/plain; charset=UTF-8

On 16 December 2013 13:23, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> I was under the impression that directfb support was removed from GTK+ some
> time ago - is that not the case?

This is for the GTK+ 2 recipe that still had DirectFB support.  I
think it can be best described as barely working, which is why it was
removed in GTK+ 3.

As obviously nobody is actually using the DirectFB support in our GTK+
(probably because nobody is maintaining it upstream), we could just
make X11 a hard dependency instead of respecting the distro features.

Ross

