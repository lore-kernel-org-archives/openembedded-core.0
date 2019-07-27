Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1C1B97D667
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jul 2019 01:59:48 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id h21so54428015qtn.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 18:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZI9vTz7hp/J1UkeMCS2S0eDJk3F5MHw7YdElo4MzsJQ=;
	b=e2CwPksZz/HwNYAllWW7qpy5bEzn4Te42XT6vqJ/Q96G0Q9BzplZrE3AHoyh1XvPYZ
	MnKdZ4olFN0VOEr8JHKpltG89xq1nSdVcx8ZAtViezMvp9zdd9ky3sFVzQXAMucVni7m
	egGL3n2pkgOmTkaTIk31RxKs0NCWm60FTUtaiXjo68kgECXE7GxuFcesAVkCd8sEQFms
	AHEK652mL/85t78Tm4RnAbtDb7bBZ5/ot/T53/+pSSkVUIYij/MObGbncjdU3y8ZAOgw
	GcvXE7YDbYjuCsBnPjfmvLtudWav5cUlxECoLf5as/PvId9ZskdgxUcj/33N/tIhA9ke
	gsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZI9vTz7hp/J1UkeMCS2S0eDJk3F5MHw7YdElo4MzsJQ=;
	b=X9IY9gJ5b7Qx/QMPS14IUcdC3xVlErtIE6s1rG0smgMQoMuE89m/5aVSnUjjZFpQ8k
	RZQnGCBn3vSEjvyh49kk+ap6AtfLhHa1MsDHUCK7NxMMC4GZpCFaFo/PDHsf2Yr5y4l4
	fiULAdtfEghUQ19d8Sf62jBistEHPrn9SFpSwnP+Hcdkgtrojd5u/8s2dCwKNbdd6UhL
	L3VovN0rev5SQOErIx9gWub01BVY9oLMgp2PUZFrpX3t56+CxcK4q1bQ/Au+sxSbkmIX
	9yXTAsH3qPRQmOnxZBlYGGSBx8Kn8myRWMkwChlC6VdDVjqD2M5POaP9mo51/x0Em35h
	AvxA==
X-Gm-Message-State: APjAAAW0PsBgDN8JboKb0xmK76OsOgiJQRTr2w/bTzsU743XR/wMjcHE
	pbSQnDbBwKTkfabHFVptcBkXGRJRs3mufWRzMJU=
X-Google-Smtp-Source: APXvYqy8aY+75oq6gy6XUG4Xe9M0F1jG4z75BksswWM6r2r348pjOca6AJc3Qr55pAOmFKfyw9h7crgznqs6TqauDtQ=
X-Received: by 2002:a0c:d2da:: with SMTP id x26mr71759782qvh.51.1564192789642; 
	Fri, 26 Jul 2019 18:59:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190726124125.6238-1-arturo.buzarra@digi.com>
In-Reply-To: <20190726124125.6238-1-arturo.buzarra@digi.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 Jul 2019 18:59:34 -0700
Message-ID: <CAMKF1sp=+wRBVLdY1igR_BAW1EV=U40e2nH1twqQPvkPxnPL6w@mail.gmail.com>
To: Arturo Buzarra <arturo.buzarra@digi.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][thud] lvm2: Fix RDEPEND on lvm2 to lvm2-udevrules
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
X-List-Received-Date: Sat, 27 Jul 2019 01:59:49 -0000
Content-Type: text/plain; charset="UTF-8"

Hi

Please send this to oe-devel mailing list

On Fri, Jul 26, 2019 at 5:54 AM Arturo Buzarra <arturo.buzarra@digi.com> wrote:
>
> Commit c6e963f9e078b728911afed38d31ed234a384154 ("lvm2: Add RDEPEND
> on lvm2 to lvm2-udevrules") added a package dependency due to
> lvm2-udevrules needs dmsetup, however dmsetup was moved to libdevmapper
> in commit 269d009a81d4 ("lvm2: libdevicemapper package needs udev
> rules and dmsetup"), so this dependency should be only for libdevmapper
> instead of the full package.
>
> With the current implementation, a package that has a dependency with
> lvm2-udev rules will include also many unnecessary packages like lvm2,
> lvm2-scripts, etc. and their dependencies.
>
> Signed-off-by: Arturo Buzarra <arturo.buzarra@digi.com>
> ---
>  meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
> index 7bd7b09d8..08287e358 100644
> --- a/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
> +++ b/meta-oe/recipes-support/lvm2/lvm2_2.02.180.bb
> @@ -48,11 +48,11 @@ FILES_${PN}-scripts = " \
>      ${sbindir}/lvmdump \
>  "
>  # Specified explicitly for the udev rules, just in case that it does not get picked
>  # up automatically:
>  FILES_${PN}-udevrules = "${nonarch_base_libdir}/udev/rules.d"
> -RDEPENDS_${PN}-udevrules = "${PN}"
> +RDEPENDS_${PN}-udevrules = "libdevmapper"
>  RDEPENDS_${PN}_append_class-target = " libdevmapper"
>  RDEPENDS_${PN}_append_class-nativesdk = " libdevmapper"
>
>  RDEPENDS_${PN}-scripts = "${PN} (= ${EXTENDPKGV}) bash"
>  RRECOMMENDS_${PN}_class-target = "${PN}-scripts (= ${EXTENDPKGV})"
> --
> 2.22.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

