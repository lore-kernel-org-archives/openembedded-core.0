Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f179.google.com (mail-io0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5D50E7899D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Mar 2018 23:14:57 +0000 (UTC)
Received: by mail-io0-f179.google.com with SMTP id e7so12297678ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Mar 2018 15:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WwrarnIdZkCIjTORCWd3p3p+hjYS119etkn17Vyus8M=;
	b=BMftxtsUoMZqzBMAWEp6wPBfjnvDppNZrE/ayzvUlxhInMfewLeaP0juY3vgST7Xjj
	wqzPqsDYAJFMLPjuY+m6GcN9KkCwSYbsJnuwrTKU85yH07PMPOicRucYakT124Hed4+e
	0xyUOudbKWiwZJuDx0mwKMmoSoswo6/PTs30laCh15/Z0wFOiVP44jfamJAZ1p0xbTOO
	duIX8CqL218M8A5g2200vZwvxtewt5ifuIRTRnq4y58cCLet2JW+zFyLbUePlPxfnGFV
	BVLVIq7CwSMBpBj69a9Xc0Ie+DuWJiHRe7Ju3/BZ2Gn74aRJyxvjpoujE/OVttaJY5Is
	pDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WwrarnIdZkCIjTORCWd3p3p+hjYS119etkn17Vyus8M=;
	b=OfZqs59dvqhZafbGhZfwlbBKcT6rEZioH1/4ael/oPOOEJ6mETUhSAVE9R8QI3Ef3M
	e0kmCMPdUIoAL34v6bhB7a3Yffj6rLtPCpVl5wpu5wBI1l3l3PIOwL/SkTPlYIYopB3P
	MzndSPkTBR/Ga429j8+erprG4CLoEF3GB+YLu60oYEOPuuqQfUMuPdfzgwbrvFMgN4kc
	/L1wEIPcy9Crx6tg0Leu8wtvMffyYCc41nt2eTZVNjWVqCxksBrPtecLmf6I8shkx2ie
	kraQcarDx3o0griZAYUzIVPgbid3bcEc3Zx7Ke7DboNDx99F0jcVJZ9egH5jyMo72KsG
	1NcQ==
X-Gm-Message-State: AElRT7Ei3vQGR5gbxoabNbxiTzaQnp2dS4fdyZpuKl06wOuHi3t62Rrr
	P80xlquRk3UIfiafmx0c/L86ktX1yEzbAZFI1R31TQ==
X-Google-Smtp-Source: AG47ELv9jbi9a6LpAxjMrvFyVbVVjQpmAol3Zt77zyRuambFW1jVuHf5FrXGxD8nWV9Zq5Ci2twYBRmDnLJ8Po9Ers0=
X-Received: by 10.107.37.212 with SMTP id l203mr8577328iol.20.1520032498568;
	Fri, 02 Mar 2018 15:14:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.200 with HTTP; Fri, 2 Mar 2018 15:14:38 -0800 (PST)
In-Reply-To: <CADkTA4PhUCCDD93y6k7wFFgdp0BdGFx45kU+at2gYt06ABQeAg@mail.gmail.com>
References: <1519845645-21713-1-git-send-email-bruce.ashfield@windriver.com>
	<20180301082802.GA16294@mbabyjoh-desk.ger.corp.intel.com>
	<CAJTo0LYxPA=4=qQZSm0_AbWHCCG+=0j0+2pzmFrV76nxG7DRww@mail.gmail.com>
	<CAMKF1soPjqqARZJdqi1W5Qcq6uCFymyzrGcXh-_HPrvgFgdW1w@mail.gmail.com>
	<CADkTA4PhUCCDD93y6k7wFFgdp0BdGFx45kU+at2gYt06ABQeAg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Mar 2018 23:14:38 +0000
Message-ID: <CAJTo0LZLq1pjVeGA5ze-Lds7b==sEJpR6daJ-jmp95yROcbrkQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kernel-devsrc: restructure for out of tree (and on target) module builds
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
X-List-Received-Date: Fri, 02 Mar 2018 23:14:57 -0000
Content-Type: multipart/alternative; boundary="001a11405f161fee220566762574"

--001a11405f161fee220566762574
Content-Type: text/plain; charset="UTF-8"

On 2 March 2018 at 19:29, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:

> Yah. I've already removed that in my updated WIP version of the patch,
> I'm just trying to complete
> the work and get the scripts building on target with musl .. I assume
> I can use the c library variable
> and select the right package ?
>

Until we have a virtual provider to magically pick the right one, this
would be the most correct:

RDEPENDS_append_libc-glibc = " glibc-utils"
RDEPENDS_append_libc-musl = " musl-utils"

I guess you could assume that any existing libc has a utils package and
just use ${TCLIBC}-utils though.

Ross

--001a11405f161fee220566762574
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 2 March 2018 at 19:29, Bruce Ashfield <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.as=
hfield@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;border-left-col=
or:rgb(204,204,204);padding-left:1ex">Yah. I&#39;ve already removed that in=
 my updated WIP version of the patch,<br>
I&#39;m just trying to complete<br>
the work and get the scripts building on target with musl .. I assume<br>
I can use the c library variable<br>
and select the right package ?<br></blockquote><div><br></div><div>Until we=
 have a virtual provider to magically pick the right one, this would be the=
 most correct:</div><div><br></div><div>RDEPENDS_append_libc-glibc =3D &quo=
t; glibc-utils&quot;</div><div>RDEPENDS_append_libc-musl =3D &quot; musl-ut=
ils&quot;</div><div><br></div><div>I guess you could assume that any existi=
ng libc has a utils package and just use ${TCLIBC}-utils though.</div><div>=
<br></div><div>Ross</div></div></div></div>

--001a11405f161fee220566762574--
