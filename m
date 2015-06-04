Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 41DEF609B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 20:07:13 +0000 (UTC)
Received: by qgep100 with SMTP id p100so21279145qge.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 13:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7t4M3zRtFaHy/6i5aUoDsQ7weY1jJ1ehKYJk4RWisXA=;
	b=jcj+pynUQLB41KC8EBq0rgFCENZ/rE6Cn5MGkHDka09ZpEVjTQCJZBz/OkPHAndb3X
	Hvbpv6uGgrsMSNvbiFcmWIzNPIlspJGuavjcgwgX3XJFzMPrfIhlE3GTplAraO6Hz03u
	fOOFD2cGwxMk6flFwER2DApIFg+lfM/Ar9CX7EOXPBi7yx5BWNZjAgVwQ8dp7rgMrqGs
	NPDe2v22MkbCSuiPfA49XOAF9R8s+nj/VdgP65WlSTd6xkLCx5qy2K9omSZT9i+4IyRL
	Cs4GPNR4K1UYLYy52UsNrAI+b4OTopz3aPkeoQAGMojOZaGJQx6fR9rtp7y/h25lxDiH
	C4vA==
X-Gm-Message-State: ALoCoQkMZ/bDJKmp4cZd27WQojjhoarPRj4M6Y7fzQg/cXITc5eb+5C0OWS3tJpWG5diVQ8MIEol
X-Received: by 10.55.18.155 with SMTP id 27mr75125958qks.36.1433448434979;
	Thu, 04 Jun 2015 13:07:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 4 Jun 2015 13:06:54 -0700 (PDT)
In-Reply-To: <814ba904a75c25027560113d0317fbc092e9d8b7.1433443273.git.anibal.limon@linux.intel.com>
References: <cover.1433443273.git.anibal.limon@linux.intel.com>
	<814ba904a75c25027560113d0317fbc092e9d8b7.1433443273.git.anibal.limon@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 4 Jun 2015 21:06:54 +0100
Message-ID: <CAJTo0Laqurme0RPGf7AQ1b5P-esYmwW48nA=VfzHtcfq8i1DmQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 4/4] distrodata: Use Python CSV instead of did by hand
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
X-List-Received-Date: Thu, 04 Jun 2015 20:07:16 -0000
Content-Type: multipart/alternative; boundary=001a11473796c56ac50517b6b852

--001a11473796c56ac50517b6b852
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 4 June 2015 at 19:42, An=C3=ADbal Lim=C3=B3n <anibal.limon@linux.intel.c=
om> wrote:

> Fix CSV generation in distrodata class using Python CSV
> module before it some errors happen when read due to
> incorrect quoting/delimiters.
>

So whereas before the SRC_URI field in checkpkg.cvs generally just listed
the first entry (the main source) it now lists the entire of SRC_URI.
Presumably this bug fix is desired behaviour?

Ross

--001a11473796c56ac50517b6b852
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 June 2015 at 19:42, An=C3=ADbal Lim=C3=B3n <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:anibal.limon@linux.intel.com" target=3D"_blank">anibal.limon@l=
inux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div=
 style=3D"overflow:hidden">Fix CSV generation in distrodata class using Pyt=
hon CSV<br>
module before it some errors happen when read due to<br>
incorrect quoting/delimiters.</div></blockquote></div><br>So whereas before=
 the SRC_URI field in checkpkg.cvs generally just listed the first entry (t=
he main source) it now lists the entire of SRC_URI.=C2=A0 Presumably this b=
ug fix is desired behaviour?</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Ross</div></div>

--001a11473796c56ac50517b6b852--
