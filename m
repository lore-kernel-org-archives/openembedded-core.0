Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id D313A7639E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 12:53:51 +0000 (UTC)
Received: by qkdv3 with SMTP id v3so17407417qkd.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 05:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mOVjcbHPdnt3HMGk4fmO+hPMQGCq52OILikVAehuRps=;
	b=afZBDKkhj0gU8bx33IgRFDzJ6spQQk1jkftyaRMRo+TuU24j7oPCLpcDYoJU1C96PD
	fm6ucep0OOIyEl1kqQyLG63nWuwxno5iv+68omhf7hJ7inVfG7wvumLzjcs5RJN9PUeN
	GesRTrX6FsCuF8blI9iK/Hlm0NXy0tAEpuaPD9ACvD+dpB3r5zTR0tfJYNq5HIfPwhtq
	m7y69pHk3MKfxZXXi48WxzZF0mYAw+7eFRgR8lgdE/rQl6aAnOf8Zx7WlNCTh8b61T18
	HbvE16JokE+If63zgZcjQ+/7LtdftQFGf3fW5mRXlUc9+GB02P9FZuODh1PsRLydTcYJ
	L7aQ==
X-Gm-Message-State: ALoCoQmlUUQKiI3A/HObRnPRT5Qb/+jAw5zev6lFgoDMTahgkZfgDYBTIe/+7D78jb1VVMv+SGCv
X-Received: by 10.55.17.170 with SMTP id 42mr65869992qkr.29.1438260831060;
	Thu, 30 Jul 2015 05:53:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.195 with HTTP; Thu, 30 Jul 2015 05:53:31 -0700 (PDT)
In-Reply-To: <CABcZANnM9ATkuV_ZT9+hhwh4Y1cepEfmVamWkvMDjzowMvQRhw@mail.gmail.com>
References: <1438103507-63604-1-git-send-email-abdur_rehman@mentor.com>
	<CAJTo0LZiEWScYqCJBfzrMQ=02vkb9jd5a-6+VvSZBqePZgr7yg@mail.gmail.com>
	<8663FA6B07BCC94795FAD21C9CC5ACF73783C098@EU-MBX-01.mgc.mentorg.com>
	<CAJTo0LZ8qasC_Out4=1KHyskj5KovxDL6+BPGoKTS8=FquBYcA@mail.gmail.com>
	<CABcZAN=W1_aW1YXAkR25TO0DM=iHoCzPrrBCNGhpw+pq3aJauA@mail.gmail.com>
	<CAJTo0La49fhabdZHEJonC=Q16-PJuHzGCP1bBLcxC9ZLimAZqA@mail.gmail.com>
	<CABcZANnM9ATkuV_ZT9+hhwh4Y1cepEfmVamWkvMDjzowMvQRhw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Jul 2015 13:53:31 +0100
Message-ID: <CAJTo0LatBaSsow-h=3UTjurFyY9=PLvzi8efSohni8uXtMf=Nw@mail.gmail.com>
To: Christopher Larson <chris_larson@mentor.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] watchdog: kill update-rc.d when not using sysvinit
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
X-List-Received-Date: Thu, 30 Jul 2015 12:53:54 -0000
Content-Type: multipart/alternative; boundary=001a1135bd02ee2548051c1731c9

--001a1135bd02ee2548051c1731c9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 29 July 2015 at 21:09, Christopher Larson <chris_larson@mentor.com>
wrote:

> The dependency on initscripts via VIRTUAL-RUNTIME_initscripts is a
>> DEPENDS, so it's build time.  The runtime dependency is on
>> initscripts-functions.
>>
>> As far as I'm aware the sysv-generator used the rcX.d symlinks generated
>> by update-rcd to decide what to start when, so you can't just disable th=
e
>> class and expect it to still work.
>>
>
> VIRTUAL-RUNTIME_initscripts is installed at runtime (as you can tell by
> its name) in packagegroup-core-boot and packagegroup-core-full-cmdline
> both. If I don=E2=80=99t want it in my images, wiping the variable is the=
 only
> method that makes any sense.


So there's the problem, and breaking watchdog isn't solving it.

Ross

--001a1135bd02ee2548051c1731c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 July 2015 at 21:09, Christopher Larson <span dir=3D"ltr">&lt;<a href=
=3D"mailto:chris_larson@mentor.com" target=3D"_blank">chris_larson@mentor.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D""=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gm=
ail_quote"><div>The dependency on initscripts via VIRTUAL-RUNTIME_initscrip=
ts is a DEPENDS, so it&#39;s build time.=C2=A0 The runtime dependency is on=
 initscripts-functions.</div><div><br></div><div>As far as I&#39;m aware th=
e sysv-generator used the rcX.d symlinks generated by update-rcd to decide =
what to start when, so you can&#39;t just disable the class and expect it t=
o still work.</div><span><font color=3D"#888888"><div></div></font></span><=
/div></blockquote></div><br></span>VIRTUAL-RUNTIME_initscripts is installed=
 at runtime (as you can tell by its name) in packagegroup-core-boot and=C2=
=A0packagegroup-core-full-cmdline both. If I don=E2=80=99t want it in my im=
ages, wiping the variable is the only method that makes any sense.</blockqu=
ote></div><br>So there&#39;s the problem, and breaking watchdog isn&#39;t s=
olving it.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ex=
tra">Ross</div></div>

--001a1135bd02ee2548051c1731c9--
