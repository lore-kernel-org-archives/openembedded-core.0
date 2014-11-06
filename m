Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id EA62265D4F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Nov 2014 15:59:20 +0000 (UTC)
Received: by mail-qc0-f171.google.com with SMTP id m20so1004172qcx.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Nov 2014 07:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=P8kHDVyhWqFUBdTcJsFzgQKlwQOj8LcRb0GyN3gH1fw=;
	b=BpYSRgmR20YU2cfy0Up66/NjG+gIXHDkkUAcS63Jc0SIxp1efZvHC8uEcTuK20fode
	NcZwytjm79CtOBACTG4Y8aFWqrt26N+yDVglNM+ibvA3Fc8j8OUoMUgB4uIPoZsuAsfg
	LPVH5xgX0rOJDJYLam9g8Eb01EY7WhkN/WixxUBzuo1mzNK531MpWMUSvAqiYfBg88iz
	QwCBzt4o2Jsxr3b0Nagz0Yf9ZSm74xvL2Ys6ypL/a5sQkhDHDPAqXrbGo3VHVxJr9/Hl
	yKfehKx5vIKD4FvT0f8lySx3MYa6AvhD8GAv+JMBacad/4jfLutm5F9fCAJ7ygBzCae9
	pDGg==
X-Gm-Message-State: ALoCoQmw36j+wJiX30p4IhFm1+YwMzIL74DGaV1AKphU6seGcWrdyZtD5Z/g8V0bgAB8ltUNiuOT
X-Received: by 10.224.2.135 with SMTP id 7mr8332195qaj.64.1415289560727; Thu,
	06 Nov 2014 07:59:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Thu, 6 Nov 2014 07:59:00 -0800 (PST)
In-Reply-To: <cover.1415264548.git.kai.kang@windriver.com>
References: <cover.1415264548.git.kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Nov 2014 15:59:00 +0000
Message-ID: <CAJTo0LZMcgP8KK12YTCX5nZhxZyCrqFJw-qfqERvirUMVNQBoQ@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: Koen Kooi <koen.kooi@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/25] Add machine qemuarm64
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
X-List-Received-Date: Thu, 06 Nov 2014 15:59:30 -0000
Content-Type: multipart/alternative; boundary=001a11c3defa859897050732c7c9

--001a11c3defa859897050732c7c9
Content-Type: text/plain; charset=UTF-8

On 6 November 2014 15:34, Kai Kang <kai.kang@windriver.com> wrote:

> The original configuration files and tune fils for arm arch64 are from
> linaro.
> And we rename it to qemuarm64 for consistency.
>

Awesome.  The bad news is that this doesn't apply to master anymore, can
you rebase it?

Note that poky-contrib:ross/mut has a qemu upgrade in that should be merged
into master shortly, so rebasing onto that (or waiting for that to be
merged first) would be appreciated to avoid having to rebase again.

Cheers,
Ross

--001a11c3defa859897050732c7c9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 November 2014 15:34, Kai Kang <span dir=3D"ltr">&lt;<a href=3D"mailto:=
kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1lc" class=3D"a3s=
" style=3D"overflow:hidden">The original configuration files and tune fils =
for arm arch64 are from linaro.<br>
And we rename it to qemuarm64 for consistency.</div></blockquote></div><br>=
Awesome.=C2=A0 The bad news is that this doesn&#39;t apply to master anymor=
e, can you rebase it?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Note that poky-contrib:ross/mut has a qemu upgrade in that=
 should be merged into master shortly, so rebasing onto that (or waiting fo=
r that to be merged first) would be appreciated to avoid having to rebase a=
gain.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Cheers,</div><div class=3D"gmail_extra">Ross</div></div>

--001a11c3defa859897050732c7c9--
