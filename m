Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id 76C0660249
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 12:34:25 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id h5so52613129igh.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 04:34:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5Vr3SpqM36wOddXtlFaz7qEv9HDxgW4Sly2QnzIJygY=;
	b=dgLWUV8l3lKuEqOLI6SHKts2j1o+LCPh8s05cC5TPCtL9IRtKYknogmVK8kA9h75fN
	r+BO/6mXhxcIDFdqORWVxGLmDkW8C94MEvAnZ9Gw16+XpTOFOR13p9Q8vNLSL3XqCn7m
	LZ77Pl2sGd7EVO6oLq23ys8IK1wWujA8vkDDf82edXZXWQHRR+o2Pm/SM5U7+xx5oU+m
	IHTe8AcS2h36/vNflm7oDZddjj9DDhUS4KBV5TMkqcFyE14nsjuXyiFsg0jR4q7u05bB
	ThXaZA+Iu2CdWhDlvAJjEl6W629Ipn64CUsiVVkCMJ62V1N6jplHhoJ+w+A167561H75
	1LzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5Vr3SpqM36wOddXtlFaz7qEv9HDxgW4Sly2QnzIJygY=;
	b=PPilhJR2wMO4FgXe6nlZmqF/z8JjTtcB/in3d6IcDlNBHvhjwZqePvhc8HnhCR0KnN
	E/OmD90ACxJdqwxZb2WZoXxPPc1zYGG/TrhihoSQwU0BmU/ps6UONqJ/2bbak3mSYjGy
	jXVi8+gDz6EOEuYVgTIHGhT+Da8O5wR3UAN6tYeECEiP24NqCw91G+65A43dMNxBKpct
	1u0NWee52NZLvQpSyEDT83p6JN+65lkJzKR8egTlxcwyk1no4K0aG6ExjOMpDXLK+8wP
	430XTI/KhGTKT8eKM3W1rc6rtfZCyb5z0JmN9uT/iiIAEnmjHbm3NrrPIuuPD/lNUgPM
	zPAQ==
X-Gm-Message-State: AG10YOS1v2vs1gXBM0MAzSdVOQDkY/WnGfjo3efk8uYBpFv0UhKXhKEjHlDTrYlutYbI1Xk57Gz/qXbKY6uqPFbV
X-Received: by 10.50.23.108 with SMTP id l12mr385715igf.78.1453466066529; Fri,
	22 Jan 2016 04:34:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 22 Jan 2016 04:34:07 -0800 (PST)
In-Reply-To: <07d854174cf74c1a89798d2687fe8a374edac748.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<07d854174cf74c1a89798d2687fe8a374edac748.1453029952.git.raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jan 2016 12:34:07 +0000
Message-ID: <CAJTo0LZdouaU6FhRAV-b+fcEY1W0-zohxVQ0B5P4v5jt23YbEQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 15/73] systemd: Update and fix build with uclibc
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
X-List-Received-Date: Fri, 22 Jan 2016 12:34:30 -0000
Content-Type: multipart/alternative; boundary=089e0149cbe896c8a80529eb7098

--089e0149cbe896c8a80529eb7098
Content-Type: text/plain; charset=UTF-8

On 17 January 2016 at 11:35, Khem Raj <raj.khem@gmail.com> wrote:

>  create mode 100644 meta/recipes-core/systemd/systemd
> /0018-include-missing.h-for-getting-secure_getenv-definiti.patch
>  create mode 100644 meta/recipes-core/systemd/systemd
> /0019-socket-util-don-t-fail-if-libc-doesn-t-support-IDN.patch
>

These are missing Upstream-Status.

Ross

--089e0149cbe896c8a80529eb7098
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 January 2016 at 11:35, Khem Raj <span dir=3D"ltr">&lt;<a href=3D"mail=
to:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><div id=3D":ub3" class=3D"a3s" sty=
le=3D"overflow:hidden">=C2=A0create mode 100644 meta/recipes-core/<span cla=
ss=3D"il">systemd</span>/<span class=3D"il">systemd</span>/0018-include-mis=
sing.h-for-getting-secure_getenv-definiti.patch<br>
=C2=A0create mode 100644 meta/recipes-core/<span class=3D"il">systemd</span=
>/<span class=3D"il">systemd</span>/0019-socket-util-don-t-fail-if-libc-doe=
sn-t-support-IDN.patch<br></div></blockquote></div><br>These are missing Up=
stream-Status.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--089e0149cbe896c8a80529eb7098--
