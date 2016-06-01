Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id EC3FC766A3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 15:39:16 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id p194so3687807iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2016 08:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=HLDWfBSKie08FM0nQu3+yBu2ESujvbU3Ns+0LFWhjM0=;
	b=k4w8LsUOvbGadSsFNczcwKfmXNfNlpFUtRKcFxyCt8/3VWQbRLvpiEkP7uBeZQfYoD
	n4YkeBfWuw5RwRNdRnfWtwV+RshnGFtUpRzffrZTO3JbGLyE9mhSvfsx/EGqVlrEkygH
	y2OXfH1rz3LzH4pIhkZn6NYAztsdc4RcbFt0qtd9PB28aNWmGQURDmLIT89wqsDgByDw
	FK1OCQE59kMve6q4ErnQkrZLUWj2mdFQl9Vdiqnhc7uH+91Wh+hfoHA5jybQbGJm5kth
	M2w9fd/NCtc2zzhOuaaZUKI0E78OVbA9c2QE4Ublo5P4hkixTjgD1gDsMq63n6+OLpaC
	/DBQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=HLDWfBSKie08FM0nQu3+yBu2ESujvbU3Ns+0LFWhjM0=;
	b=JAVGwfXXgSxBTDCUqK9/kXSr8BJ0e/ox+82i5Gs/LgpMwd0daWNwMUy3pCzsTtdMYk
	x7hpU3bSwSDorx+2mq7uK9BUhnC8WlS+4oehuBdMMHt6PE9N0gk94FaykmEXJGXj8UFQ
	tHm6ULST9DejCwUW77Ztey2iceX9ws5+WP4gpJEpEI6zfYbLeSbTTMwDzQlx4ZRiZheA
	paaFKTEpzkbV5MmC0bjs6YUIyyg/gn33IjteYaeoxFOVG6MBIElppKNQUgmx5/ZQ6W/c
	TG5mHzO7oYvyX9J/6jdQ2mhreTVLttkWTqzV2c0/YwmlgPdbqwVwekmFG9ic++dQN5cS
	WfYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=HLDWfBSKie08FM0nQu3+yBu2ESujvbU3Ns+0LFWhjM0=;
	b=fmA2g1M9QZNVT7lziKK70jHbzxyIY5bSTdgZvqitP75kmc2eI6JT1OI/MGTb2DGNkq
	y00hyaodBHhCQlrimyueZUqKvX99tOoqI8M5MpGIXDLb0BXJy/MP2JVb2II9sf3+GT7L
	8r8BnyYOKdLy2lLYEoKkoxGdWp6+x96nBUMmFouymqkRIjJ2Xh2xeS2d/074Rlw50KCE
	YH4SndKZlaOH8QZKJzneLdtMzxuSxROpoliZcVCm4cc8KCKL72r3BU+J7i+yvd356FQc
	3elopmbuFUKyr+SVqmASp/MMIrIME1FcYDu7VcVIykxkD4xeVDZEa3aX8hgX+Ws4eF2o
	PFmg==
X-Gm-Message-State: ALyK8tL4qr9PuBqhQXNVcaRbe/tt0De0OUf8NAp3NDDWyEYL247sxJpzh3RL0booRuR34Ge0QcBPSvxMVBdfqg==
X-Received: by 10.107.188.71 with SMTP id m68mr6903867iof.1.1464795557223;
	Wed, 01 Jun 2016 08:39:17 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Wed, 1 Jun 2016 08:38:57 -0700 (PDT)
In-Reply-To: <1464784540-2786-20-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1464784540-2786-20-git-send-email-richard.purdie@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 1 Jun 2016 08:38:57 -0700
X-Google-Sender-Auth: hqMmNRZtVUbjjgvo9Xg9zn5iJG8
Message-ID: <CABcZAN=nGbbf1-iETNmmomL2rhyCGEpnk2cWZThhm8zHHHLGGg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 20/22] devtool.py: Fix parsing of bitbake-layers' output
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
X-List-Received-Date: Wed, 01 Jun 2016 15:39:19 -0000
Content-Type: multipart/alternative; boundary=94eb2c0772a6db625b0534394a55

--94eb2c0772a6db625b0534394a55
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 1, 2016 at 5:35 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>
> Current parsing was picking wrong targets, leading to the following
> problem:
>
>         AssertionError: Command 'bitbake  Parsing recipes..done. -e'
> returned non-zero exit status 1:
>
> Signed-off-by: Leonardo Sandoval <
> leonardo.sandoval.gonzalez@linux.intel.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>

We should probably think about redirecting parsing messages to stderr, at
the least in the standalone scripts, since that's out of band from the
intended output.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c0772a6db625b0534394a55
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jun 1, 2016 at 5:35 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div id=3D":1t4" class=3D"a3s aXjCH m1550bf8a4f57d490">From: Leonard=
o Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com=
">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;<br>
<br>
Current parsing was picking wrong targets, leading to the following problem=
:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 AssertionError: Command &#39;bitbake=C2=A0 Pars=
ing recipes..done. -e&#39; returned non-zero exit status 1:<br>
<br>
Signed-off-by: Leonardo Sandoval &lt;<a href=3D"mailto:leonardo.sandoval.go=
nzalez@linux.intel.com">leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;<=
br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;</div></blockquote><=
/div><br>We should probably think about redirecting parsing messages to std=
err, at the least in the standalone scripts, since that&#39;s out of band f=
rom the intended output.<br>-- <br><div class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<=
br>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Sen=
ior Software Engineer, Mentor Graphics</div>
</div></div>

--94eb2c0772a6db625b0534394a55--
