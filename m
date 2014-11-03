Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id D83106017E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 17:44:37 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id z107so8993108qgd.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Nov 2014 09:44:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MWBhxgdgI2p6tOay76NmstcpLvvROnIAG8Gx4EQ1asw=;
	b=AJ5+YPsaLteJV6UW4gFQA+SFy2R4YDtL9U3v5ME/BcbLA8YY1Vr7dExw8B7TRzQBBZ
	HL+Hv9TJcB/1TtURC3UrZLbJFrh881KyyQwD8utdZX6H0XHNR7EPzRclK7S1vOn0mCtJ
	b0gCcx4V31U06ATbzc/HIh/ABeRnZTynjPhSx8yN2fw/5GMGRHLn78wzb4Jm1cI/b+0e
	Mxp0uq/M1CK06heUrBh6f38f1QUgdxOcSGPEr5N+PsZeMwgZ8boLenerdHkUduRjuVdl
	mkH+nycpBpz8fAZ6i8UzcODPBIcKxoodiyKdp8wn7FQIuX6z+VQ17HkzVQ3DN0dNZfHl
	TrKQ==
X-Gm-Message-State: ALoCoQkLllq5SGUWH/5oK/soDtfbrMkZ70caCq+Vs/ThE/r2y641SME3MBcG/7NKbh/OEmRHR3pi
X-Received: by 10.140.28.70 with SMTP id 64mr13604267qgy.15.1415036677786;
	Mon, 03 Nov 2014 09:44:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Mon, 3 Nov 2014 09:44:17 -0800 (PST)
In-Reply-To: <5457BD7A.9020806@windriver.com>
References: <1411387952-22717-1-git-send-email-koen.kooi@linaro.org>
	<1C408B9F-5383-488A-AE4C-E18D69800825@dominion.thruhere.net>
	<CAJTo0LYOHMZCoGS342Wnh06LbJWUS1K_aDFfDWG4gxeFswm7EA@mail.gmail.com>
	<A5FE6A94-E1CA-4E02-8B98-D018F14888F7@dominion.thruhere.net>
	<CAJTo0LYm6rqFtJ5jTq=cTGnJDHrYaj7f94RmWR_Lh-LkKqKaiA@mail.gmail.com>
	<07F08083-4EDE-4CC7-AAA7-53019C7978C0@dominion.thruhere.net>
	<1415016627.5111.9.camel@ted>
	<9D7813D1-1BDC-4B46-BE6D-CF05049314E5@linaro.org>
	<5457BD7A.9020806@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 3 Nov 2014 17:44:17 +0000
Message-ID: <CAJTo0LbukP+OZvLXK4R0nZtMbykY10Wr2PNW23+37_JfHeh8Lg@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libpng 1.6.13: fix build for aarch64
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
X-List-Received-Date: Mon, 03 Nov 2014 17:44:47 -0000
Content-Type: multipart/alternative; boundary=001a113a970a861b360506f7e6b2

--001a113a970a861b360506f7e6b2
Content-Type: text/plain; charset=UTF-8

On 3 November 2014 17:38, Mark Hatle <mark.hatle@windriver.com> wrote:

> We've been attempting to aggregate what we (WR) can in:
>
>  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/
> log/?h=kangkai/qemuarm64
>
> But as it's unofficial and we're simply trying to keep the patches we know
> of together..  you'll have to be patient.  The first order of business is
> getting a functional qemuarm64.. it's MOSTLY there, but we're having
> toolchain issues and other things that are simply higher priority for us.
>

Great, thanks Mark.  A functional qemuarm64 that boots core-image-minimal
is a good step in the right direction, then we can experiment with it on
the autobuilder. :)

Patiently awaiting patches,
Ross

--001a113a970a861b360506f7e6b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 3 November 2014 17:38, Mark Hatle <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:mark.hatle@windriver.com" target=3D"_blank">mark.hatle@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":14n" class=
=3D"a3s" style=3D"overflow:hidden">We&#39;ve been attempting to aggregate w=
hat we (WR) can in:<br>
<br>
=C2=A0<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log=
/?h=3Dkangkai/qemuarm64" target=3D"_blank">http://git.yoctoproject.org/<u><=
/u>cgit/cgit.cgi/poky-contrib/<u></u>log/?h=3Dkangkai/qemuarm64</a><br>
<br>
But as it&#39;s unofficial and we&#39;re simply trying to keep the patches =
we know of together..=C2=A0 you&#39;ll have to be patient.=C2=A0 The first =
order of business is getting a functional qemuarm64.. it&#39;s MOSTLY there=
, but we&#39;re having toolchain issues and other things that are simply hi=
gher priority for us.<br></div></blockquote></div><br>Great, thanks Mark.=
=C2=A0 A functional qemuarm64 that boots core-image-minimal is a good step =
in the right direction, then we can experiment with it on the autobuilder. =
:)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Pat=
iently awaiting patches,</div><div class=3D"gmail_extra">Ross</div></div>

--001a113a970a861b360506f7e6b2--
