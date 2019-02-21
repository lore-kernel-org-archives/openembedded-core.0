Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5C2C17CBB2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 15:05:00 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id p25so31553391qtb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2019 07:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=WPzgV0896BAKbz8RStXmmQBJpyXFBBCBjKhCjWg/r2I=;
	b=bn7LXtG+DVtjlY8feAGuAnvve3gQItQQoP4+L/j4Ogpe9scsPgRFV3Q0NTcpGnFapi
	RA0QwMYJSh8SwkmSMk3vROsd1naOQdhDqFta6vZNNeccmcPMbN4yOSwChGz6lxz0qE0e
	BIspdPt0U4Qh1o3uFxNYzbXZFZi7yzDM2bnlCAciI/0rrl9XYOk4EUl2HAkfUO4Zc3HW
	up9GSaNfzZwChxjiHD0EUg3m5JDgEM5cqEY18O9ViSAtSyY6+mxEskbc1QX72cJkVno0
	eeOBskWwWWxZKNJYpum+VDUlU/xTRnnw//BfwNvqggEuizQdCRSHPVjkWBqhtOSz80b1
	b0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=WPzgV0896BAKbz8RStXmmQBJpyXFBBCBjKhCjWg/r2I=;
	b=cDUveiG7jyi69udWyrT/5Dn2k6sMQlMxLi0SOPscaD6RGogWqgLwUEhw1emsvSNro/
	DHY8CCHhf5S+3yWwrfLZgLbQ6Ac6iZTlXX14mOvkE9ZLSadNRAbhfogUGTUIu0xbIj8F
	j/3aXM8kYtVgweefcurNZeGhJoajfCo2+ocDe9lkCZVpustBCW+1AMnRBgzvvnzSShS1
	GWw8OeYazk3VHX0Z8cGqz5S0y42N7fQbXEppKutZQBz/yEIAnDQRe85NtugG7z9vfKtj
	hZFVVTCpNtpbaco8+cZllXvG0TOs2753+xBHZfTHURTfal26FGJ5/RuNVmGuB+BSANOt
	a/ZQ==
X-Gm-Message-State: AHQUAuYwzIJ30fUPmS5L7iGJbC6UColN88Y1DpeyudhSCR8Y57DTHnB9
	mrS7mnUJXtm8LV+5ZCvzML2ROe/5HRCn2tJuZvE=
X-Google-Smtp-Source: AHgI3IYbSd128pMokSYeAOZGO40v+/9YOf3OFBXD87qf8pDnGwZvxkYg60I2pD/a58A+tks8Iu8QK/0VbprySrZZ0JY=
X-Received: by 2002:a0c:b660:: with SMTP id q32mr14239963qvf.50.1550761500327; 
	Thu, 21 Feb 2019 07:05:00 -0800 (PST)
MIME-Version: 1.0
References: <20190220211034.27159-1-fabio.berton@ossystems.com.br>
	<451a3c0d5250062208cb29a8e16e9c8373538ce6.camel@intel.com>
	<CAMKF1sqss0=crDQ0pGGA8FHXjjRYv+9tHE5i5ohZneipW6J7TA@mail.gmail.com>
	<CAMKF1srcbPFfGcEFWdNT+P=bmv+eweQN4d2uR_Cena8tvBvd1A@mail.gmail.com>
	<CANNYZj8v+j1r5pM_1kRS77PXzu6GkUCYkxYwg8zHmJjQvBRHsQ@mail.gmail.com>
In-Reply-To: <CANNYZj8v+j1r5pM_1kRS77PXzu6GkUCYkxYwg8zHmJjQvBRHsQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 21 Feb 2019 07:04:34 -0800
Message-ID: <CAMKF1spi6OhkAa7O0a7kVhovvsAn3MYBfwk=yA5Y51NBo3RoEQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"otavio@ossystems.com.br" <otavio@ossystems.com.br>
Subject: Re: [RFC][PATCH v3] mesa: Convert recipe to use meson build system
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
X-List-Received-Date: Thu, 21 Feb 2019 15:05:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 21, 2019 at 7:01 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Thu, 21 Feb 2019 at 15:56, Khem Raj <raj.khem@gmail.com> wrote:
> > > still seeing errors when building for rpi3-64
> > >
> > > | checking for xrandr... no
> > > | configure: error: Package requirements (xrandr) were not met:
> > > |
> > > | No package 'xrandr' found
> > > |
> > > | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> > > | installed software in a non-standard prefix.
> > >
> >
> > This is fixed with latest commit so we can move on but there is new one
> > on aarch64/rpi
> >
> > https://errors.yoctoproject.org/Errors/Details/229582/
> >
> > seems to be due to this commit.
> >
> > https://gitlab.freedesktop.org/mesa/drm/commit/b541d21a0a908bf98d44375720f4430297720743
> >
> > probably a revert of the above patch is what can get us further.
>
> Shouldn't we rather add a dependency on the component providing the
> missing include?

fredreno build uses its own copy of libdrm IIRC and this might end up
in unexpected results
so revert would be safest

>
> Alex

