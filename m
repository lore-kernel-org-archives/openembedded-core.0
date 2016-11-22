Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2E09B605C3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 12:11:45 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id n21so20216651qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 04:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hNJiGoDkOSoIiqyALKyS07h3fIH5PffiIBp1fmNMer4=;
	b=FsWAVYGrSsw77dtjacGJSXDF5otG34mfdyFYBw92tqpMlwuO18uN6rdUO565vFn8Lk
	nSnw8jUArjjMdQw8BgUsX0HiE62mHuiyDOFmPxdYfd2cVxzidn9pLcPiyjHub7lSCbyL
	uxQZkNoAHROuwvJ68W+c0MukMxNTiUH7SoB3WtBPgTMYru+8OzEeoP2TS13Wn1M8pfy0
	QAbokVYFBaOvoIvGH9CgjgS76UxG6YJFvuP69i/nuBiynBof1UgNKMrYlyPh4OYvyJ6L
	3f2WzwJuPj1cpSKJ5GAnzAMr3tef3vOWjASYeHEZaM4pwp8aPN0mp1T2UdNIC1eEWG2m
	aa+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hNJiGoDkOSoIiqyALKyS07h3fIH5PffiIBp1fmNMer4=;
	b=b2YevYCRk2SEPN1fCosGCFoTJHOqM1GM0DU0kSZICtyW8hJjiK5lsUDj6LwtmtvD5k
	I70Mbj5xGpOiac7S+OAaNdVXB5l+SHtnxrXWu6DmnEBfJuRMB2zqGeHC5B8c4duspn15
	cz4DcVcbtsYSQyT4CHwd39pzfmHtwZiJedBs3nQtrBtmnHJicXMwM94gJUCs8GHzPxZr
	vuAdN4eeBe2WYv9c+6XwlMnY1Krxvnmj2BxIVPfotLolyh6QnFWaAwjIQmwb5R2OPJQd
	KeqjICWB4BQnSR2vHCfe9mftV/BU9YYpmmai70gEAUKwOKe+r1Ch+H+1twHFTy/2q4Zp
	gg9w==
X-Gm-Message-State: AKaTC03WBqIyc0mDE7MmzkbU19fZVqkrmudyAFNxTLcH94Q5JL3pLkQfPajkADB80/Jl2BQD9rMkp31lrYNgm/pD
X-Received: by 10.55.5.145 with SMTP id 139mr21708545qkf.77.1479816706581;
	Tue, 22 Nov 2016 04:11:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 22 Nov 2016 04:11:26 -0800 (PST)
In-Reply-To: <lyoa17n2ot.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1479296396-724-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CABcZANmqH9gEhO67-9_0fEinU6FhMxRsgaC0hcVrkxd9_cH1HA@mail.gmail.com>
	<CAJTo0Lb9cJk5Qos0CLkvvrW0QCecVY-0io9rnp1rkHfCZpQrdg@mail.gmail.com>
	<lyoa17n2ot.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Nov 2016 12:11:26 +0000
Message-ID: <CAJTo0LYMQP__k=as6kbPtuU=JK8ZeJ4ucOdTw8NDoefO-+upPw@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Christopher Larson <clarson@kergoth.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: removed broken compiler check
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
X-List-Received-Date: Tue, 22 Nov 2016 12:11:47 -0000
Content-Type: multipart/alternative; boundary=001a114c8f842138bd0541e2ad6d

--001a114c8f842138bd0541e2ad6d
Content-Type: text/plain; charset=UTF-8

On 22 November 2016 at 12:01, Enrico Scholz <enrico.scholz@sigma-chemnitz.de
> wrote:

> Is this check really so useful? gcc + g++ are elementary tools which can
> be expected.
>

But they're not if BUILD_CC is overridden.  For example if the host gcc is
actually too old/new for OE to work and BUILD_CC has been set to point at a
different compiler.

Ross

--001a114c8f842138bd0541e2ad6d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 November 2016 at 12:01, Enrico Scholz <span dir=3D"ltr">&lt;<a href=
=3D"mailto:enrico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico.scholz=
@sigma-chemnitz.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":4yq" class=3D"a3s aXjCH m1588bea83254a2f0">Is this check really=
 so useful? gcc + g++ are elementary tools which can<br>
be expected.<br></div></blockquote></div><br>But they&#39;re not if BUILD_C=
C is overridden.=C2=A0 For example if the host gcc is actually too old/new =
for OE to work and BUILD_CC has been set to point at a different compiler.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a114c8f842138bd0541e2ad6d--
