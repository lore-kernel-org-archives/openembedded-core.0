Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id ACD8479C41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 15:29:06 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id o17-v6so34760761qtr.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 08:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XYX0+A5IIpWGrNAhDjQ2hlk0F3HKHD07fzXqCmDwgMc=;
	b=kzREfR90+9WbL8Vqr+WHY3S0X9jc2ygotH4NJu2USyfwc+XpwWbeYvbMlsHYUZ7FZr
	sL+Q8o94IJ5q72eYHCP7bnwct726YvLutDbYcCIOyrc1ID4ML+1dkXsOvOv89m4FEhMz
	qPVB3Nns3WY+VSox4M4k+nqj+dGLgcbqvZ/9vRzYHPrB5jRCBwGqKWJXnPlT1FCVy1Sq
	OsBUA895c34zxbKmQDbRRlRLm6lEpVgGF7MXtKGEmF/LzUI+kmpq6OsyjfcMQivnoyXO
	8COdoSrZ1AaB8CSij9hrSb0YPYr1Yj2yOAswiaUl8PJJMKGF7fcVat6jln6iIkLbo9j9
	7V9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XYX0+A5IIpWGrNAhDjQ2hlk0F3HKHD07fzXqCmDwgMc=;
	b=XPVJprbz8eKgU9JAGlT/Swjmrpr6Hz35tuzk7Abst8D1uEw98r157ztLJSAXdhfTq4
	Seol7hNU7XtayEgSsiCkc2v8HSf7y0iO/z5bYlAh6N5UG6Z+ud6/SjPyFUfNvVZJXppp
	bPPkIxlmsPAW/fLUuFq1/y1l0PPmd/fzWc+7FRmkBjb2mp+XRoY3ZVy2lL96n2d35PKm
	oWiPvaGWcW6Hx7srcqtGGjEsaS4f/W4o8KR5SeNCgM+JLoMaDQR+AyQGtt0PqatVdXOx
	/E5vNdKAb5bSO0GbSCX0Imwl0bJE1iqPUbRaiQadefmUoaJcF7bYfEUEdIXgJRkeD/IX
	zkmg==
X-Gm-Message-State: ABuFfojlLbSEuwFjL4zutipqJDpOhFJslp2syyvU9Dtmd3mwsguOWWIp
	VbQwENXdeRXj5a4mF8VMg6nC3NmMa50VvkO2mag=
X-Google-Smtp-Source: ACcGV61eGtact8x5aP8pQ4P0HTALBModNm9NMOzw8aEX5bXSqRzGVSZSOC5RDwBE84M0zUz74AzcdMJq7FrrwXSNKSE=
X-Received: by 2002:ad4:41cc:: with SMTP id a12mr30447771qvq.55.1539876547186; 
	Thu, 18 Oct 2018 08:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <20181017104243.801-1-pascal.bach@siemens.com>
	<CAMKF1spO151yKD1O9Dx_sKEu1shSN976+kykQ9FoXKd6fstQVw@mail.gmail.com>
	<9e88a77b-a611-8c04-465b-41eca2a085c5@siemens.com>
In-Reply-To: <9e88a77b-a611-8c04-465b-41eca2a085c5@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 Oct 2018 08:28:41 -0700
Message-ID: <CAMKF1somO_+n1w=ek=vcv1p=RuX-3m1tiho+qi7P_z4xocgefQ@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/4] cmake.bbclass improvements
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
X-List-Received-Date: Thu, 18 Oct 2018 15:29:06 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 18, 2018 at 7:58 AM Pascal Bach <pascal.bach@siemens.com> wrote:
>
>
> On 17.10.2018 20:50, Khem Raj wrote:
> > On Wed, Oct 17, 2018 at 3:43 AM Pascal Bach <pascal.bach@siemens.com> wrote:
> >> This patchset is unmodified from v3. It is just rebased on top of master which
> >> already includes a fixed version of libproxy and piglit.
> >>
> >> I built all cmake based recipes in oe-core (qemuarm64) and did not find any more issues.
> >>
> > Can you run world builds on meta-openembedded repositories with
> > this series applied and also compile some other large projects which
> > use cmake like meta-browser
> I can try but usually I get into trouble with the proxy because there are always some recipes that fetch from some location via some protocol that doesn't work.

Once the current cycle of builds is done on OE
builders I will try to schedule this in OE builds and
see where it ends up. hopefully by this weekend.

>
> >
> >> Pascal Bach (4):
> >>   cmake.bbclass: use CMAKE_SYSTEM_LIBRARY_PATH instead of
> >>     CMAKE_LIBRARY_PATH
> >>   cmake.bbclass: search both sysroot-native and host for native packages
> >>   cmake.bbclass: move CMAKE_NO_SYSTEM_FROM_IMPORTED to toolchain.cmake
> >>   cmake.bbclass: allow cmake to find hosttools
> >>
> >>  meta/classes/cmake.bbclass | 24 +++++++++++++++---------
> >>  1 file changed, 15 insertions(+), 9 deletions(-)
> >>
> >> --
> >> 2.11.0
> >>
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

