Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 185AD75A31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 16:30:35 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id g203so191864709iof.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Feb 2016 08:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HPbaq2PZPU2y5+m2muFYuJE9A0d/TVTiT8IEvxbqRWk=;
	b=EboTnpFhIa8SlHeqEYmTeJdcjlH2fMuJR7I2Kjvohm7RObDuP+x3I8hi6uha1KLZMO
	hqHl7AQce6H/RJswID7ITHCdWnnolpzhwhB2MVZAuVf0q4ot5LqZi4+pjd5RncEYRllQ
	w0Aie+o8cXDBAWoQm1/go1EKJTpFH8jPI8dLil/8SlwFdSgTTIKq+BA5J3AB6gAtplhw
	IgdeC3ujrbLwTQ66cOeAU6P0Ak23HszHyKVMVjHJ3b3C+jn88KLP2IQUFKm3pJNeWubG
	Yi4WiEEVJeydxF05R6nZZ5hHm0fmU0gdgHalpioZtg527eQJ1yVjYiyoxaQDkDQGK35r
	Fqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HPbaq2PZPU2y5+m2muFYuJE9A0d/TVTiT8IEvxbqRWk=;
	b=Sxrj9uYJmi7LvORTa4FRRpNAkcvH5VKt7zYtPKxrJ57vIMs0WdWpIZDxPcsoY/n59g
	Ij+TEsRIEa9x9vb+FgCk2pOafOqR41idi1N9XcH3p3enNLIxKCxjvBGMKNui6g/xZ94Z
	lJdFVsutopo5kJtIX/vYhfqRBW5iGz6ov16NKRevLqmav4kruSL2TOE5K1b+MZXVzI45
	XTBqrKQPM14RPWELk+HfAwMfw0IiFz3Mx96bJcnLLMb9dDLvOsJ5bQrScIOlQV6nBzLc
	4nBMrHv5QeqQ5m+evE6TCHZPYS4jvF8pXxyelUNecSGkCf3hpmT69BwQwUx/hhhaTKjz
	SwyA==
X-Gm-Message-State: AG10YOR5CTVOM4h3K/YCwZ/cJ+T6bgpgwNeGSgXA5ZzU9bwg8W7JYlGE/OwTOh7798L97Cl2Dp+BzfZHSUc7SORX
X-Received: by 10.107.137.92 with SMTP id l89mr22597393iod.133.1456763436409; 
	Mon, 29 Feb 2016 08:30:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 29 Feb 2016 08:30:17 -0800 (PST)
In-Reply-To: <56D3DD08.5080206@windriver.com>
References: <cover.1456304688.git.liezhi.yang@windriver.com>
	<56D3DD08.5080206@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Feb 2016 16:30:17 +0000
Message-ID: <CAJTo0LZ_+P+OmiPoggE40d-mSGANtesD6phx0rUzp58zPCdE7w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] make vm + live images can build together
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
X-List-Received-Date: Mon, 29 Feb 2016 16:30:38 -0000
Content-Type: multipart/alternative; boundary=001a113ebdb42679de052ceb2b19

--001a113ebdb42679de052ceb2b19
Content-Type: text/plain; charset=UTF-8

On 29 February 2016 at 05:54, Robert Yang <liezhi.yang@windriver.com> wrote:

> Robert Yang (4):
>>    image-live/boot-directdisk.bbclass: remove AUTO_SYSLINUXCFG
>>    boot-directdisk.bbclass: drop IS_VM chechking
>>
>
> The two are merged.
>
>    syslinux.bbclass: make vm and live can be built together
>>    sanity.bbclass: remove conflict checking for image vm and live
>>
>
> How about these 2 please ? These are convenient for testing images,
> otherwise we have to build two times to get virtual machine and live
> images.


Two were easy, two were more complex.  They're in mut now.

Ross

--001a113ebdb42679de052ceb2b19
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 February 2016 at 05:54, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"=
mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">Robert Yang (4):<br>
=C2=A0 =C2=A0image-live/boot-directdisk.bbclass: remove AUTO_SYSLINUXCFG<br=
>
=C2=A0 =C2=A0boot-directdisk.bbclass: drop IS_VM chechking<br>
</blockquote>
<br>
The two are merged.<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0syslinux.bbclass: make vm and live can be built together<br>
=C2=A0 =C2=A0sanity.bbclass: remove conflict checking for image vm and live=
<br>
</blockquote>
<br>
How about these 2 please ? These are convenient for testing images,<br>
otherwise we have to build two times to get virtual machine and live<br>
images.</blockquote></div><br>Two were easy, two were more complex.=C2=A0 T=
hey&#39;re in mut now.</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a113ebdb42679de052ceb2b19--
