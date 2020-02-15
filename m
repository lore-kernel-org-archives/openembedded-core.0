Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 505D26140D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 23:06:28 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id c20so12861203qkm.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2020 15:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5DuSlil4S+EB6YaTPee598RRHIWb//5JsHPjN1S/ziE=;
	b=nkimHcjVH1YjsNLEWOBMsjrEecpmlfdzOwPKztHJq1t6GkoGMFPtlw7Zbcc1wuEYaw
	1JOo7n/rrya3zpNrxSVBHbysN0Qn8yWb9jqnaExfZr4tQSl8if0YLSDzXogpkVgqAagf
	O1xZ3v6hekYNKYpWXGm9oCdqhk/gKfPwekVTV+R7tgSveslTDefmVd82oP7POoASAZxQ
	Lfs4jJgyRjDYzlSoMIUQaIBGrau+U77dKr6pGiWNhhgKN6VqLiaOG9jKoJksfMz65jzr
	5rU4b55L1V5LP/X/HThkOKePPupRY8s3aJUi93eJ+8Yx2NJ+8F5aaHP3f0D5JKMkDuoY
	bVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5DuSlil4S+EB6YaTPee598RRHIWb//5JsHPjN1S/ziE=;
	b=EEjopsw/gUJgM9qgJVatGi1+tTZecGBdkngf6RLSSPny7S53t11/88UKC6MIcuB224
	GK20UxnGEcVIWforE2CCPC+ohcIQRmi7Km+oy8AF0mx5vsB9DKb16mC2EcdbmyaJB6jY
	u5pO11fRFMuZj8r+RGb9Lrw/fGSiT/bq2uNmqduc+RNCAArpovbER+cg/TuQhhcqQqRK
	cCnPnv1F1+LleQJYs9c8hFbE68DOf6i6oXQ2C12eUtBb3EUqBZi9Jr51A3kZfoEnLO3w
	2XtLjggYqsZq44u09RMEYQB136PrFRhXFPDaMVe+o5NBNGQu9gXTHlR3G/dzDyLDDsMs
	jMfw==
X-Gm-Message-State: APjAAAXE2Dr5lchjVNKis08/Lvmy5zw+Mx4q3/pxjjlwH0zdCDzbMOFI
	XanHFkyh81nC+BKc/xML7bpit/3mGbY4huu0mUs=
X-Google-Smtp-Source: APXvYqx2hnpCQVfEVvPzz8NTAALJ5vaKFhoiDUF71Hs8pAFLwDn6zoKHYRvomI4LN40lkl8IjiQTMMAaNvAGSkv3YDE=
X-Received: by 2002:ae9:ef96:: with SMTP id d144mr8686003qkg.337.1581807988823;
	Sat, 15 Feb 2020 15:06:28 -0800 (PST)
MIME-Version: 1.0
References: <20200215094450.19705-1-alex.kiernan@gmail.com>
	<41bb4973-dc7b-27d2-aee8-7d9e2627018e@gmail.com>
	<CAO5Uq5RGEXL1n+2D7bzz0gOT+wu+6cMzwvKvb5fj491SSUHgdw@mail.gmail.com>
In-Reply-To: <CAO5Uq5RGEXL1n+2D7bzz0gOT+wu+6cMzwvKvb5fj491SSUHgdw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 15 Feb 2020 15:06:02 -0800
Message-ID: <CAMKF1spHBx4EaZMZRYKrTGRVLy+zd1QupG5crfkQp8+O473nNA@mail.gmail.com>
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 1/2] meson.bbclass: Parameterise meson.cross
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
X-List-Received-Date: Sat, 15 Feb 2020 23:06:28 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 15, 2020 at 1:39 PM Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> On Sat, Feb 15, 2020 at 9:18 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On 2/15/20 1:44 AM, Alex Kiernan wrote:
> > > Add MESON_CROSS_BINARIES, MESON_CROSS_PROPERTIES as a colon separated
> > > list of meson properties which are exported into meson.cross.
> > >
> >
> > I am seeing errors
> >
> > 13:14:54   File
> > "/mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/meta/classes/meson.bbclass",
> > line 130
> > 13:14:54     echo "[properties]" > ${WORKDIR}/meson-tracker.cross
> > 13:14:54                       ^
> > 13:14:54 SyntaxError: invalid syntax
> >
>
> Is that tracker from meta-gnome?

yes.

>
>
> --
> Alex Kiernan

