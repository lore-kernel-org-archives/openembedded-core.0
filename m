Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1013773CC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 15:47:03 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so15980240pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Apr 2015 08:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=j+l659oGRw6l62NorEVO6gOk2hqTLOWuiPmBox4LFWc=;
	b=N1+0+MV7LSI0s/6TDG5LB72pXu8g40RYBzWjJk+0xmDqnhFQJzI+zsWchTAJz4L/aV
	qR+uylpYBVzqeSRfKcICP+uLV8aFVpFDVnCKn5XKUURmYafbd7Myo6qftFtrTZZ5rmVB
	w5i8HYDkEMW1PCSvDA3Nauu6Kr32q7o+36k2p+Rawxvk/zi9Ue6Gddds6zcf4x92c/wQ
	t6jG7obzcXv3jxHUSYx1CPI1Il68i/enPErqy3a0urYUsB7YuZVCKGPJm2HOpXrInUoA
	aplw5uCFEEQ9goTTZ/FscT2G2RC9fQHzMH9RyJO4Kd1WN4nFf2mWlJNo3E+BrZUsbJSe
	cdoQ==
MIME-Version: 1.0
X-Received: by 10.66.139.135 with SMTP id qy7mr36903766pab.144.1429026424806; 
	Tue, 14 Apr 2015 08:47:04 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Tue, 14 Apr 2015 08:47:04 -0700 (PDT)
In-Reply-To: <CAJTo0Lan=W35rvFOKO50=suGPNrpJr6uQuQpy8XdW1XhFCoU4Q@mail.gmail.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
	<CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
	<CALbNGRTj61Gh-D=+JcAvTc55RJnMboCBU2kLAi_KE=qmCCwNgg@mail.gmail.com>
	<CAJTo0Lan=W35rvFOKO50=suGPNrpJr6uQuQpy8XdW1XhFCoU4Q@mail.gmail.com>
Date: Tue, 14 Apr 2015 17:47:04 +0200
Message-ID: <CALbNGRTnG3=e8BUOGpSJfd9RbsBaVuO0SUdFAuYrqCd-jGQvvw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Tue, 14 Apr 2015 15:47:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2015 at 4:06 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 14 April 2015 at 15:03, Andreas M=C3=BCller <schnitzeltony@googlemail.=
com>
> wrote:
>>
>> 2. In meta-qt5-extra I have libepoxy in for a while - kwin needs it
>> [1]. Problem with Xorg-Macros: These are build for x11 in distro
>> features only but there are BSPs around (e.g meta-fsl-arm) supporting
>> either x11 or wayland - not both together. So for a wayland only
>> distro epoxy would not build.
>
>
> util-macros doesn't require X11 to build.
>
Right - just tested for wayland-only distro. Forget my last email.

Andreas

