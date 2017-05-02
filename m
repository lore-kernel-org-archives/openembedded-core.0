Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B799B60778
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 00:31:35 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id y10so857149wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 May 2017 17:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=abHiZs7CmkYe9dIlWWBBsShsKkmpjzgYr1EY2A1+Ecg=;
	b=h+g1zkgCD8v3OF5Mwx/H0EbwG8J7SorJydQvCdfONRKe4UjaqHxgvOwGjf1U+4JSnp
	itCMLUsqZoW64jH6Tv8ndmm13W3YtKJzAFa21ZeAWEt+nUQeS6/eM0huuqXIALyxg+CW
	2RHb3oEaMdAY3YXhmqW1IVTZsSrAi3bt5qPUD31qAE7pQfsMZPbqSCPnZQB97E4GwMj/
	4XiwowOWDkY62c2TFc7+fcaSieq1xSbmb3rUDPm3XQNIzfg5OHrraHLIPIjfo/FmBFUA
	2NT+ZLXkXfrFIptENAD1wuPSB2f8B2zkcoIYXTqeJOI0Mu3lhLvfIUFdCZ/siGz7dhi3
	Kbeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=abHiZs7CmkYe9dIlWWBBsShsKkmpjzgYr1EY2A1+Ecg=;
	b=Y2pl6BO+cgTUEyXzBtUFMDDOmQ4AZt06XOxQOsY/x8KJKt89NrMYEtX1Zeok4cIKDO
	xGoqidTim2WZoUcCq1kXv1MoZhyzsx4YnmsTlJuZWlZ4VdsWf2fps0b+6FTnokmHm/LW
	fe0x/2Ild3HMRe9d3lMA6nsxwkEybyzY2Wsh5Tu7vwIjxNDoe7N7q63LthXxjZWkZOgM
	4zE03g5Pg1g7wD/b12JXLQokfN5uXCDKq+CtLMEHVRZc62mw8grX1uMzk3Flk/Sj2q/g
	a0SvA31p3Lt73LUNEDavpds+NipEAQsuTwhWWkBV8ljz5e4FoXzjf3NzZB/S0z61SAc8
	xvlg==
X-Gm-Message-State: AN3rC/5Lp3c64Tv8A7eN1UyL+yaqRKhAAS4biHIxJu3P6GK1yjey6S1W
	nM+Cu97zkcgNHPuvfPc7QlbkYWVEvw==
X-Received: by 10.28.4.69 with SMTP id 66mr355080wme.65.1493685096572; Mon, 01
	May 2017 17:31:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.172.100 with HTTP; Mon, 1 May 2017 17:31:35 -0700 (PDT)
In-Reply-To: <1493672344-21965-6-git-send-email-juro.bystricky@intel.com>
References: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
	<1493672344-21965-6-git-send-email-juro.bystricky@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 1 May 2017 17:31:35 -0700
Message-ID: <CAJ86T=UTvBSXmX4S9Fmt3+dPr7sY8U9DC-9SR4PKRS3gsTmURQ@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 5/6] busybox.inc: improve reproducibility
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
X-List-Received-Date: Tue, 02 May 2017 00:31:36 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 1, 2017 at 1:59 PM, Juro Bystricky <juro.bystricky@intel.com> wrote:
> For reproducible builds do not generate build timestamp as part of
> the version string.

Maybe just do that by default?

> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/recipes-core/busybox/busybox.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 375632d..3e991f9 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -138,6 +138,9 @@ do_configure () {
>
>  do_compile() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
> +       if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
> +               export KCONFIG_NOTIMESTAMP=1
> +       fi
>         if [ "${BUSYBOX_SPLIT_SUID}" = "1" -a x`grep "CONFIG_FEATURE_INDIVIDUAL=y" .config` = x ]; then
>         # split the .config into two parts, and make two busybox binaries
>                 if [ -e .config.orig ]; then
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

