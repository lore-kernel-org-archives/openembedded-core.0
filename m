Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 93375607AA
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 10:31:55 +0000 (UTC)
Received: by igcmv3 with SMTP id mv3so32891612igc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Dec 2015 02:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=U/6RFXWZVB0ERCOmLkzn/6R+Ilpabw2dJMRO5oghOBE=;
	b=TFpUC32yowuNY0tYo6CM5M/Iwfwd2EpAFe0TzDayayylNlaT+5sfJhfUF3wsy3ecii
	HAT8aTZhQkBrIRAnYiDHez9EbLwbxxSJP7PmArxh0IpwRuZEqESCIE66jvFdUOQIgGKP
	80QyIYJC3Uti6nCaYgguYSge6m1RmjzJi9wlFI4RITUk3AsIfHy7ffYeePnTkQDh/4qe
	rLiJ9YpbsjT8tDvbLY/jNbvQAKXm4Q7ju0Ij0ilosAYOpWQ7JYufcp3riD2AnFY1QSII
	+8a37R1ysFnnvKZg/sDeT553AAAuFFeGMTBsQnlnrgFQQOXLbS3ZyTPq+R3fYEOtRLlv
	l1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=U/6RFXWZVB0ERCOmLkzn/6R+Ilpabw2dJMRO5oghOBE=;
	b=IHCku9sVxxvJz83x6Lom/Rty0KwK9q95e+5sdxMU089LBvDTDSDjUd6zjFylkwBzwS
	g0TcpTF7LWOuBHZaQu4fxdRFWCAKjr4NsEbVWST8kRzkzqxm+ei8WZfZF4UXAFDjgnv3
	DTrIVi3OHAqV6CXmSWGGBjO+3TxKOEZbT75ylrzZcFka1f4hGIEfR0bdEq2hOgUanGIK
	xhZwAI4gifi2dmY4KV6mWYhVf2bG28VS7GuF1Aw4mpD6iyb74FQxo+LHUuNY8+jLuEYW
	58LAap2N4/k9R4Kw5D19CW/sDFqUiNAron8+boDM24p2xQOy+2VzXsRqmQa4gwjGd1BL
	bM1A==
X-Gm-Message-State: ALoCoQm4ReQL7+J48tO/lY8Ac47I7+fHVFZ5HgOxwGWd3UhpzRdQWSMYu0cOWYmomTMSphxtUNPe
X-Received: by 10.50.155.33 with SMTP id vt1mr3187218igb.64.1449225116832;
	Fri, 04 Dec 2015 02:31:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Fri, 4 Dec 2015 02:31:37 -0800 (PST)
In-Reply-To: <5661685E.9080001@linux.intel.com>
References: <cover.1449152021.git.alexander.kanavin@linux.intel.com>
	<CAP9ODKomNG8pbmjH=-k2qVOBrmnopeTjht6devfRJD=mH=NpZQ@mail.gmail.com>
	<5661685E.9080001@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Dec 2015 10:31:37 +0000
Message-ID: <CAJTo0Lbkx3ar8btEZn3idG7nzy979LJTtotpK4qhu_2s1EGcXg@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/9] Move Qt4 recipes to a separate meta-qt4 layer
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
X-List-Received-Date: Fri, 04 Dec 2015 10:31:59 -0000
Content-Type: multipart/alternative; boundary=001a11343daa49ef650526100422

--001a11343daa49ef650526100422
Content-Type: text/plain; charset=UTF-8

On 4 December 2015 at 10:18, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> That's fine with me. Ross, can you squish these commits together in your
> testing branch?
>

Certainly can.  We'll probably need a layer version bump so the autobuilder
can do the right thing but I'll talk to Beth about this first.

Ross

--001a11343daa49ef650526100422
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 December 2015 at 10:18, Alexander Kanavin <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander.=
kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex"><div id=3D":5ip" class=3D"a3s" style=3D"overflow:hidden">That&#39;s fi=
ne with me. Ross, can you squish these commits together in your testing bra=
nch?<br></div></blockquote></div><br>Certainly can.=C2=A0 We&#39;ll probabl=
y need a layer version bump so the autobuilder can do the right thing but I=
&#39;ll talk to Beth about this first.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a11343daa49ef650526100422--
