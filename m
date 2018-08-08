Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8350978AE3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 18:40:39 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id q12-v6so3518863ual.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=PPr4GPH+CFCgHYyOnTxSuYDbESL80Ds/NnZPOTh06rI=;
	b=Qzu+lUfSnZWFM8au78Syn/P8FWnrDPn98iOPpr2wFzh9iHchvaxzqT/mf+VfYdq2oc
	QjJJpV7MRQRzNsUlICA1tTndd5kXn0bpOtFMgrlQoqvPK9tdgboecRelDKSznga1TwUJ
	WXkvd0Zw6wccocQTVkh/6ENwEZwtHh3PGb+leQk8CgOdnP+d5l2F3bCbQhFtjl2SijIj
	N8xhYQgWu3mTfTCZy9no48SEqA78O7Uj7rVW0Pm6t139obehh72sGHa+PAN9IJ0hUrT+
	8/hj3+qxNNEA+BVjcArpglju20V6mg4GOAocMw/cIjZB18B8Ot4PrhqjAmEGUMj8mkPS
	erpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=PPr4GPH+CFCgHYyOnTxSuYDbESL80Ds/NnZPOTh06rI=;
	b=VPoLVXG55GWbewJ0hgrPZfVacAC1Gnwemj4qrMjOhmVXmhNYmVUeo2JCopZdrUD3aL
	ioESQP4dpHFjjWpWSjncHKoAaL6RkmClKPAzaYV4ksT3QmrOmFum1kmithlwQIlmVu8h
	tDhnBUi21bE1fTg3EnM+w1COrJ6Ipu5C5+K0Mg9TuUI2eyVKmgI1oz6cPvEd/FMJ3+Yv
	mC5Qo4jtcNVPi2dDKGNGLbaVO4KWYXtb3fGCCDMRQzV0aC/48PnrZgqo2UkAKdps2rFv
	dvlwA/JwyoZ9fXzMPaPTxIxJUZIZ/FnqkWV7GYhOwBRPKSw2kMcIitvHW1HBhKMi+VNl
	l5Ow==
X-Gm-Message-State: AOUpUlEVFI8PKghm0FfBGkRJZJ9CzUyWgTJurjbC75cP3z/VIduAFZBb
	Iy9hUfCgxT6V6foTJbwuinKq2dZrUO58gTdd5c8Lbq8W
X-Google-Smtp-Source: AA+uWPwhjt46filzwWaaMh3d/pGti8AggRm7Pd0B1mp5KVL0/kdLwcfenQJpQ+LmgR2nypQW2yhGALbOew7e7IdNEcU=
X-Received: by 2002:ab0:52f1:: with SMTP id
	w46-v6mr2662343uaw.52.1533753640186; 
	Wed, 08 Aug 2018 11:40:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Wed, 8 Aug 2018 11:40:39 -0700 (PDT)
In-Reply-To: <20180808183258.13843.18306@do.openembedded.org>
References: <1533752112-4120-1-git-send-email-armccurdy@gmail.com>
	<20180808183258.13843.18306@do.openembedded.org>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 8 Aug 2018 11:40:39 -0700
Message-ID: <CAJ86T=Uh0vyWHZ=N9v2cWW8O9SL+f=DEYP0mE9EKdyygSdkbTQ@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9wZW5zc2xfMS4wOiBkcm9wIHVubmVjZXNzYXJ5IGNhbGwgdG8gcGVybHBhdGgucGwgZnJvbSBkb19jb25maWd1cmUoKQ==?=
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
X-List-Received-Date: Wed, 08 Aug 2018 18:40:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 8, 2018 at 11:32 AM, Patchwork
<patchwork@patchwork.openembedded.org> wrote:
> == Series Details ==
>
> Series: openssl_1.0: drop unnecessary call to perlpath.pl from do_configure()
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/13430/
> State : failure
>
> == Summary ==
>
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
>
> * Issue             Patches not removed from tree [test_src_uri_left_files]
>   Suggested fix    Amend the patch containing the software patch file removal
>   Patch
>
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.

The dropped patches are being removed, so presumably the test got
confused by the ";subdir=openssl-${PV}/util/" appended to the patch
filename?

  file://find.pl;subdir=openssl-${PV}/util/

> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
>
> ---
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>

