Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f44.google.com (mail-it0-f44.google.com
	[209.85.214.44])
	by mail.openembedded.org (Postfix) with ESMTP id 276B66067D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 22:31:57 +0000 (UTC)
Received: by mail-it0-f44.google.com with SMTP id u186so47449665ita.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jul 2016 15:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uY6TPCc9Thq4A76wPpRg5nMCgSFDKZOulig1XPo3dSs=;
	b=zipauDbxi1OGhSccO4k4u1HqsWpXuXgdNQDxP8t23WvQ99lLkEcx5Q9Fri8M/E7/7N
	uDnhBtAkbMKds2SG0SdS6ETXWRp8/RTSHJ/1chm+yaIfeR/MxLnjZ5ZGVmwBhXXEB85k
	Gj8jhoegCgMT0bZMAktQZ8C9TAy4T3BFARKBWx2qzS0pyXpPhZgnzNDUVpVH5zYfIY5I
	slwxXL9/kssUwdQ5/xav1f8XUKuslcsBNlHVOEqY+fD/qbQqFLQjV4q499UVqERWi00u
	ygzCkjzQInKpp4PEijJNEb0ibE8U1wpJpJwNBCNqRyB3P0lsDhPra/dnxQNsAuOmBjhi
	gsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uY6TPCc9Thq4A76wPpRg5nMCgSFDKZOulig1XPo3dSs=;
	b=g7VSX6A4o4IrvCcBUB3Pyf64Phb/UsJ83JiQDW8ueKQ2NjB61fGFD2O4cp9JLHxeIJ
	CMsbhIzaFPx6mxGasX791FnmwNmWDxfmv8YjhEafBMC7ebhSyAp/yjTSQK22nok83+Fy
	9di32OJsGcIoD5Ua/qnUtSJAuDjiKeXLPKnW8b3znQ70a4DwOa/1qtGCGoDWhEb8KjK2
	UO8FIjyXMunJlN1Rhc3A4HAxBU3+VM69LRIgnF6/F+KhNwE336R288uIacvZx0a8m5ek
	ejj2nDrbbqLxhqC1va4ycmqwEaPwGVI/sGVJnS659e5fIIUZqeGNu84njf2PM0PpIgJQ
	vlyw==
X-Gm-Message-State: ALyK8tJygj36o4E1jQ8SnCHcBVbNpCicLkbwEEBD7Jq8FLXAYQtpPKUBsfZsaCdjgRBEhRl/KRtiSw3oi7HoGrcl
X-Received: by 10.36.121.204 with SMTP id z195mr61612269itc.22.1469226718245; 
	Fri, 22 Jul 2016 15:31:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 22 Jul 2016 15:31:38 -0700 (PDT)
In-Reply-To: <cover.1469190931.git.paul.eggleton@linux.intel.com>
References: <cover.1469190931.git.paul.eggleton@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Jul 2016 23:31:38 +0100
Message-ID: <CAJTo0LZZD0poopBgYb9BbeJ_UUaJc5KZxTXSV5jndnLJC8EiCQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Extensible SDK improvements
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
X-List-Received-Date: Fri, 22 Jul 2016 22:31:58 -0000
Content-Type: multipart/alternative; boundary=001a114aa466a2d3700538410027

--001a114aa466a2d3700538410027
Content-Type: text/plain; charset=UTF-8

On 22 July 2016 at 13:38, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> Some fixes and enhancements centered around how the toolchain is
> incorporated in the eSDK, as well as a couple of tweaks for buildhistory
> that I found we needed during development.
>

This is happening in mut, could your branch be responsible:

http://errors.yoctoproject.org/Errors/Details/73022/

Ross (who will look further when its not 23:30 on Friday!)

--001a114aa466a2d3700538410027
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 July 2016 at 13:38, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":6oc" class=
=3D"">Some fixes and enhancements centered around how the toolchain is<br>
incorporated in the eSDK, as well as a couple of tweaks for buildhistory<br=
>
that I found we needed during development.</div></blockquote></div><br>This=
 is happening in mut, could your branch be responsible:</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra"><a href=3D"http://errors.=
yoctoproject.org/Errors/Details/73022/">http://errors.yoctoproject.org/Erro=
rs/Details/73022/</a><br></div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross (who will look further when its not 23:30 on Frida=
y!)</div></div>

--001a114aa466a2d3700538410027--
