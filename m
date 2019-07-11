Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0B37EF5A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 10:26:39 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k8so11454691iot.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 03:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=booK3sKsuDr9k6P92xwWrHltr6ncO2VOHamPtANRrlc=;
	b=W5YEOacIPn6ex92bs9nGFhCeApWKNsQAbjK4lgXaFP6LXKczeO37MNmzSzkkiKslHc
	iNB6l/yW0vao9+0OCImk4SwQ5s+PFWoy24wgHhOaHeK1sMPq+aU2qCBa2hLbrdK86TrU
	lVpUkswVudmTRHQR8FCPWcn7/K4KTikFVDJqKo7E+0yje9NVgL5CJA1PSxWp4kU+AJZa
	DctmQ8Op3hzhn7B0gXYE1FzyiocIgCyqfaMx/ViGU05YCoyGBURB+JDbuRmQL7Li2u+f
	1Ey873Q88wbSNmp/X5El9099GsgZO/+8Sw4UUq+a0Uew/XrPoesB1xjkArUH/Fq/DHDv
	fXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=booK3sKsuDr9k6P92xwWrHltr6ncO2VOHamPtANRrlc=;
	b=TZ1tc84EUStDfftARRO86T55E4guImRIBOZdaXES7GwgTTXW7e2rwfqYZwr60fWlAq
	XvjZrOlYE+f1y0TbBqDuEikGOGZf0MhfJv0y6k4qxwmzPdnqr3lhF3vqdB2+Spo7AzpA
	7jx3AVQufw9qUJUBDdEsfW199oGuKgb4an0eTpe+/E+sM26poYXaO4FODBRgqhxAbajP
	RDfWoOFoCFuqmwsz2GhOmJ4Nl7SN/Ifv5rd0DdfTo7qMQyVlrgYJn+IDMY1T72OdQNUs
	7nc2beEMyh3FeO/q9Vi2SbeRIiNgJOUWoQvWFjnvLFQ/9x9tdcq/qawnnnJe0ClDo5SI
	xdxw==
X-Gm-Message-State: APjAAAVSrvX7W8JPb8FhZ+zxFG9UwKan6qMyxEx+wqtcnzXj1u00EANU
	0HV48oYJyPBOlyZlXlqSYBxMfwie6d3J4AfvdSXAVw==
X-Google-Smtp-Source: APXvYqy5ocTsqsmwvnXh7A6u5J6ZSBtQad1Rx+8AF43o8513mjvT+LQEB1cpdLtKhW6/0yWlKgymn+koWphz1amwwS0=
X-Received: by 2002:a5e:a708:: with SMTP id b8mr3584610iod.25.1562840800348;
	Thu, 11 Jul 2019 03:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561724553.git.liezhi.yang@windriver.com>
	<37d251c3a3f0b81fa910df996f54bc0be22cf846.1561724553.git.liezhi.yang@windriver.com>
	<CAJTo0LYyTbnvKE2_YAK4_Xu1csQaqLcMg5fCKCMxJ49vk3SepA@mail.gmail.com>
	<add0a48c-e769-9b86-1de7-88a156b3a599@windriver.com>
In-Reply-To: <add0a48c-e769-9b86-1de7-88a156b3a599@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2019 11:26:28 +0100
Message-ID: <CAJTo0LaNjqmPG0RnRmeNOOeVqnX=muVCeyWcjtFW+1gnidRQmw@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] waf: python2 -> python3
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
X-List-Received-Date: Thu, 11 Jul 2019 10:26:39 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Jul 2019 at 03:59, Robert Yang <liezhi.yang@windriver.com> wrote:
> On 6/28/19 8:15 PM, Burton, Ross wrote:
> > Did you just do the minimum required, or take a new copy of waf from upstream?
> >
> > (https://gitlab.com/ita1024/waf/)
>
> I checked the one from upstream, it is still python2. The waf is the only one
> which still requires python2 in oe-core. We can get rid of python2 after this
> patch, what's your opinion, please?

If that's the case then YES YES YES.  :)

Ross

