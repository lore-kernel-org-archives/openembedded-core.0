Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2E11E71C71
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 23:04:59 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id k69so10716152wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 16:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r6o1XhIyxZ1vXFyLFi8lVbNX/b9AgHNUl1coJQtcMBA=;
	b=pT2GuG3/EFVUUR0/ioW7wlgilRPc/XECuM8px18FkNaUBShHhBz52eUKdbdYhVqbdJ
	CQHOwUOgWIbPqcw2+wJeqAe5XU2uP/6PRjVC/t0/f7RIw7+JqFXT6L6wSu6ltECLhz3f
	ZZASDx4VnFJqIw90xxoCYtJihyKI8xWv/apZcoxiPMaCBW8CMgzz+xy8w9t2dElt8sFP
	nLnnGTr0eHQ3E2yvnR4djgJP4kz5FCTrWIxKj93fGHSthTY7MI8EzAX2iFNRnVfJgLCV
	rhpwopM6LQ9DdvOkKyj3t9k0zK2sdj6HX/TTX3mF/WbF3AZNrWJIzZ0YRaP8hqaGOt2K
	0X3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r6o1XhIyxZ1vXFyLFi8lVbNX/b9AgHNUl1coJQtcMBA=;
	b=M5KbmCokJQU4emEoAeVBUE7yH9GplALBN68MgDK/z5tFoOEv1b3edl285wmi53dhVd
	yImMllvF7XM9iDJF8WHSOl5Ka+Z/HIWxJszJ3fTPL5jRsxGOomINeXfhYfTq2nJ4L5cN
	D5aXgAyCdBtf0SU0V9JOHWq7y29h6LQ0XZkCG+Gb4T/lGVTfb+5TbU9ubATSiofU30Pv
	lHNG9dcl9N1svJNqoCaUkliroIq9c1VLT3I0VTIUEJZeQxjLOt/jqI9yeruvXlf8BYq3
	7VZEm5lLREx3nkSxUkAMfmEIS/NX9/7jmNdotRap/kkeYZPilcv4fNV6Dpnbgie+fd3X
	M9Mg==
X-Gm-Message-State: AIVw1139OOFWBftbSWAbr1XKTyjcgBCZV8JjaOW9hnw1jyLJCu7YdKHt
	8m6Y/XfZeV0PPzoA1Aft0XawOjAsmQ==
X-Received: by 10.80.147.197 with SMTP id o63mr1188504eda.194.1500505500784;
	Wed, 19 Jul 2017 16:05:00 -0700 (PDT)
MIME-Version: 1.0
References: <1500417901-4667-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1spivq5cRcMDz-uehbqWRUzXyJf6TQ53sOtmFJu+_i1iqw@mail.gmail.com>
	<CAJ86T=XT9yufogwxMbV-0dW1ooYdvy5DOequ_X4fRQ7=nFWdOQ@mail.gmail.com>
	<CAMKF1soRVeHPLh_LFSxpcGG=1u1OcKvMv3yEifihP_Y7Y-eXUw@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119BDF6B@ORSMSX112.amr.corp.intel.com>
	<CAMKF1sop5dtZZ101eCSS=a7Sb1e9nz6sKXsPYNLDqa19MCj=ag@mail.gmail.com>
	<CAJTo0LZRBNbU9-QmJ_ufVK3QFeHjXOMoj2G0hgnp+2eQk_82Jg@mail.gmail.com>
In-Reply-To: <CAJTo0LZRBNbU9-QmJ_ufVK3QFeHjXOMoj2G0hgnp+2eQk_82Jg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jul 2017 23:04:49 +0000
Message-ID: <CAMKF1sq7dTwNPerkeDBr8-47Ypu0AbgyGTKdeQub4rNcPTufvA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-7.inc: add new warning "Wnot-cross-compiler"
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
X-List-Received-Date: Wed, 19 Jul 2017 23:05:00 -0000
Content-Type: multipart/alternative; boundary="f403045c809e5b9cfe0554b3a92f"

--f403045c809e5b9cfe0554b3a92f
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 19, 2017 at 6:35 PM Burton, Ross <ross.burton@intel.com> wrote:

>
> On 19 July 2017 at 23:32, Khem Raj <raj.khem@gmail.com> wrote:
>
>> it solves x86 specific issues alone
>>
>
> It solves host = target issues, so if you're building for ARM on an
> aarch64 server you can have the same issues.
>

In theory I agree in practice it may be not that
Common let's see what gcc community has to say about such a patch


> Ross
>

--f403045c809e5b9cfe0554b3a92f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Wed, Jul 19, 2017 =
at 6:35 PM Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com">ross.b=
urton@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 19 July 2017 =
at 23:32, Khem Raj <span>&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div id=3D"m_4467448118916213597:1n6" class=3D"m_446744811891=
6213597a3s m_4467448118916213597aXjCH m_4467448118916213597m15d5cfc982cc349=
6">it solves x86 specific issues alone<br></div></blockquote></div><br></di=
v></div><div><div class=3D"gmail_extra">It solves host =3D target issues, s=
o if you&#39;re building for ARM on an aarch64 server you can have the same=
 issues.</div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"au=
to">In theory I agree in practice it may be not that</div><div dir=3D"auto"=
>Common let&#39;s see what gcc community has to say about such a patch=C2=
=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div><d=
iv class=3D"gmail_extra"></div></div><div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">Ross</div></div></blockquote></div></div>

--f403045c809e5b9cfe0554b3a92f--
