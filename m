Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 137E07BE5E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Dec 2018 14:51:01 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id i145so15470884ita.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Dec 2018 06:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=itp1VfB3c02/vwWB1/MZPifWXzZ6FP2XPI4pmDgu3s4=;
	b=RdYiBUS03G3bKbpg/GLGBWGpHr6IMBbcSuY5YF1gcdM1VTOz32jb+fTGRFm8CY1xRa
	Ebjg8GOFihg0pstqUxVoi4Tq2J4wP9ECd051UjIQJsxGH3Dix+Ye4P3sHNfbFSJDiyD5
	6miuWOxRJ4Fkt4CX87aWrmJ8/LPOpkOvKtryUfzNXwADKf0h9XmZTmJNTmjYRbkFAIcd
	CbBDeFNC5WHc5x3sGYZZoQRqJZIHTfdHwxHiEhICWc41uHChAqeU8gjFOH+5JegPAQ6I
	sXA1NT3QHzFPwbnh4lV3iBMhFjEKnkneS+aZZPTyG8CkKFB2VFxAjdj7Nq0WdtQ49gSg
	XaOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=itp1VfB3c02/vwWB1/MZPifWXzZ6FP2XPI4pmDgu3s4=;
	b=kM7q/yhI9FYxRkKF+Yw4TLNI4YLoZ3Z7hq9QRaA3bkRrMn4iYDBI6k79vZglGAGqYb
	4k0CtJOR6S4EmVZp44Myvcv4RtYNKVib9fVCxzJNEW+vCTcV+h5bRu4UTjysXg+OYFji
	kHC+b2Q+R0x5d7VHq/g2Z8ZVnFndIjwxQ1fijlA9YCzH0ZIroLI90ENhbnroLWLD4Etj
	xh+6eJvU4v0Pp38W5JFmZaTbk7k04lFhQM0wmRyCJvEGUAyP+soqPjVGHet56B917SZq
	PLN43FKt9y4dxkJVMWV/i6XEvmj0kCmjPXBy5fGqowzuF/8Prbl8tf9nBkojILrqx7X/
	j5Lg==
X-Gm-Message-State: AA+aEWZyODPBfP2z391jqpHUelQFZI5Yfswld6dmElWIy9pFGaLcYjhe
	yWOEBqRZDQw+SUf8tqeal/7ve5MW3QN2jYt+JtJruA==
X-Google-Smtp-Source: AFSGD/VngKwxTCy3fuKaZ11LvwOdwdKHy+/2XiY52146BW7PIV2MbOmxZxeTMebVfYzrPbtfZ6QU32Fg4bzjhHOD1dU=
X-Received: by 2002:a24:8e43:: with SMTP id h64mr8817744ite.26.1544971862887; 
	Sun, 16 Dec 2018 06:51:02 -0800 (PST)
MIME-Version: 1.0
References: <20181214170859.1737-1-ross.burton@intel.com>
	<CAMKF1soyF4xOFmsGeWjj6DYtQhAvFdems5KMsNx9CRJPrYB+HQ@mail.gmail.com>
In-Reply-To: <CAMKF1soyF4xOFmsGeWjj6DYtQhAvFdems5KMsNx9CRJPrYB+HQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 16 Dec 2018 14:50:50 +0000
Message-ID: <CAJTo0La2VPWyrw2mAUGDYiUNVs_vToecpCZUuUqNxeuhox6u_Q@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "popt: update SRC_URI"
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
X-List-Received-Date: Sun, 16 Dec 2018 14:51:02 -0000
Content-Type: text/plain; charset="UTF-8"

Only that rpm5.org is the canonical site, although if there are
unlikely to be future releases this is mostly academic.

Ross
On Fri, 14 Dec 2018 at 23:38, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Dec 14, 2018 at 9:09 AM Ross Burton <ross.burton@intel.com> wrote:
> >
> > Go back to use rpm5.org, as it's the canonical host for popt.  The host is back up now.
> >
>
> is there any disadvantage of keep using fossies.org ?
> after all it kept us afloat in bad times :)
>
> > This reverts commit 347ee336dcc94e6fa4e4788117013615b90abd70.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
> > ---
> >  meta/recipes-support/popt/popt_1.16.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/popt/popt_1.16.bb b/meta/recipes-support/popt/popt_1.16.bb
> > index 377d1084495..478288f9bf2 100644
> > --- a/meta/recipes-support/popt/popt_1.16.bb
> > +++ b/meta/recipes-support/popt/popt_1.16.bb
> > @@ -8,7 +8,7 @@ PR = "r3"
> >
> >  DEPENDS = "virtual/libiconv"
> >
> > -SRC_URI = "https://fossies.org/linux/misc/popt-${PV}.tar.gz \
> > +SRC_URI = "http://rpm5.org/files/popt/popt-${PV}.tar.gz \
> >             file://pkgconfig_fix.patch \
> >             file://popt_fix_for_automake-1.12.patch \
> >             file://disable_tests.patch \
> > --
> > 2.11.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

