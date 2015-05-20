Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f173.google.com (mail-qc0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id CF6B56AC01
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 15:14:28 +0000 (UTC)
Received: by qctt3 with SMTP id t3so24829811qct.1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 08:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aVlos8T2ShHeEuySU63HS+hIOhRJpech/h83ej+osBE=;
	b=BnK+2VSSBiwZLMxbHcwSQu4KC6gbFhWh14I+o9SVCRE2DqeYv8i/sJz2ryaYRjRYvt
	ci4wgl4V4QUdPYVxDLhctG83prz3sUC3NgxLeZeteq+Jqtlsx9iz0fHWObOv6jwZKgXS
	DmkApzn5ApktSm/gmFpT3BALsZbWeY9fJx/ev4d9xdqB+lyf8fuDFOIGY564j6I+Jzxf
	bvfyvS4b5ApMJlWVYS76oKPAFHg0QxBVeaIZLKTXY+YeBqGpOVLkdpQM0v1TNvQYGb2a
	Mx6DEN5Whq1fLtWjezFG28MUZGCd0hDVxdrTUyJwOOEOolgkogDIDQcpzl2fNszNJZC3
	FAdg==
X-Gm-Message-State: ALoCoQkaxitsLNLQIEDb5zTQj/u0D1DtLRka63AHLVxJn+rVaOVNU0ApmgzJuk22qiqHBh4u1DHN
X-Received: by 10.55.40.18 with SMTP id o18mr13314260qkh.58.1432134868959;
	Wed, 20 May 2015 08:14:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 20 May 2015 08:14:08 -0700 (PDT)
In-Reply-To: <1432107420-36311-1-git-send-email-Chuang.Dong@windriver.com>
References: <1432107420-36311-1-git-send-email-Chuang.Dong@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 20 May 2015 16:14:08 +0100
Message-ID: <CAJTo0La74Xcj0rJZWjUvL_b3WsgNQ7zOE1iC6EUG5yxrpW9+hA@mail.gmail.com>
To: Chuang Dong <Chuang.Dong@windriver.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: add expansion of mkdir_p to configure.in
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
X-List-Received-Date: Wed, 20 May 2015 15:14:30 -0000
Content-Type: multipart/alternative; boundary=001a11440fb8228df0051684e20c

--001a11440fb8228df0051684e20c
Content-Type: text/plain; charset=UTF-8

On 20 May 2015 at 08:37, Chuang Dong <Chuang.Dong@windriver.com> wrote:

> ++AC_SUBST([mkdir_p], ['$(MKDIR_P)'])
>

If the recipe is using mkdir_p then the configure.ac should be calling
AM_PROG_MKDIR_P, surely.  It's not, and I've verified that adding it causes
the variables to be defined correctly.

Ross

--001a11440fb8228df0051684e20c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 May 2015 at 08:37, Chuang Dong <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:Chuang.Dong@windriver.com" target=3D"_blank">Chuang.Dong@windriver.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":44" class=
=3D"a3s" style=3D"overflow:hidden">++AC_SUBST([mkdir_p], [&#39;$(MKDIR_P)&#=
39;])<br></div></blockquote></div><br>If the recipe is using mkdir_p then t=
he <a href=3D"http://configure.ac">configure.ac</a> should be calling AM_PR=
OG_MKDIR_P, surely.=C2=A0 It&#39;s not, and I&#39;ve verified that adding i=
t causes the variables to be defined correctly.</div><div class=3D"gmail_ex=
tra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11440fb8228df0051684e20c--
