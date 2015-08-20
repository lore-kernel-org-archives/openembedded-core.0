Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0E49476ABC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 16:48:12 +0000 (UTC)
Received: by igbjg10 with SMTP id jg10so133061843igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=I0yVnxvc3GGw9hsnprB5d+Uu7ZhsYsrtu6W2eMqF4cU=;
	b=txnBke+I0RGMogfk1laQsdNECvJdBDOtVpeKabYT/CpRRfYyY2rAH4ecR28B/VTAf3
	kAgljdC0MeF46qfMc7xTie/QT4YRsY3RTKDjcxzqhTxgSbizLFEJ8lsLd12QOHwYwaXU
	RKk2aIvE1WHAUCBBFIxrb1JVRFxUvaB8BbQOBwQEgEDcQ/LiB24TFmAxURMCkMUa/7MZ
	v1pdL86hDZzAUAPqplMco88ZXyX5yZUtg3Kw2wxYAmRVMeDKXTv8y3e3FXOnKL3B1/4E
	EGEU73QWeP3dF+VDsc9m0HmVBI9ge/oq7/M/mZYWLrQktLAgnbw0ncreXz7wFawxAdCY
	D2ZQ==
X-Received: by 10.50.50.69 with SMTP id a5mr33428620igo.68.1440089292718; Thu,
	20 Aug 2015 09:48:12 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.71 with HTTP; Thu, 20 Aug 2015 09:47:53 -0700 (PDT)
In-Reply-To: <20150820073410.GA18330@jupiter.iwi.intel.com>
References: <1439991165-13121-1-git-send-email-brendan.le.foll@intel.com>
	<1439991165-13121-3-git-send-email-brendan.le.foll@intel.com>
	<CABcZANnhYzCmt0yZHayQ4TxQMgQ1DPYwZRAXJMH-9sovCHY6mg@mail.gmail.com>
	<20150820073410.GA18330@jupiter.iwi.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 20 Aug 2015 09:47:53 -0700
X-Google-Sender-Auth: ReEWTyzLVrUZV98hjA7br_TblII
Message-ID: <CABcZANn8jM4uCx68B5H20iUHOseYXtZpsUHVtmSTxXbNp6y1ig@mail.gmail.com>
To: Brendan Le Foll <brendan.le.foll@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] toolchain-shar-extract.sh: better default install path for extensible SDK
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
X-List-Received-Date: Thu, 20 Aug 2015 16:48:13 -0000
Content-Type: multipart/alternative; boundary=089e010d9e9ebd0526051dc0eac6

--089e010d9e9ebd0526051dc0eac6
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 20, 2015 at 12:34 AM, Brendan Le Foll <brendan.le.foll@intel.com
> wrote:

> On Wed, Aug 19, 2015 at 06:52:49PM +0100, Christopher Larson wrote:
> >    On Wed, Aug 19, 2015 at 6:32 AM, <[1]brendan.le.foll@intel.com>
> wrote:
> >
> >    From: Brendan Le Foll <[2]brendan.le.foll@intel.com>
> >    Extensible SDK cannot be installed as root so by default offer to
> >    install it in
> >    user's home directory under distro/distro_version replacing the normal
> >    SDK
> >    version '+' char with a '_' as that's a restricted character for
> >    bitbake
> >    Signed-off-by: Brendan Le Foll <[3]brendan.le.foll@intel.com>
> >
> >    Why not use a metadata variable for the default, replacing with @@ as
> >    with the other metadata variables, rather than hardcoding the default
> >    in the .sh where it can't be easily overridden by the distro or user?
>
> '~' seemed like a good option for all SDKs/distros seemed like a
> decent 'default' to me and the rest is fairly customisable with
> SDK_TITLE which has to be set anyways. Or do you mean a different var?
>

I don't really see the point of making something "fairly customizable",
personally, when it's trivial to make it completely customizable by using a
metadata variable, the way we do for nearly everything else.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--089e010d9e9ebd0526051dc0eac6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Aug 20, 2015 at 12:34 AM, Brendan Le Foll <span dir=3D"ltr">&lt;<a =
href=3D"mailto:brendan.le.foll@intel.com" target=3D"_blank">brendan.le.foll=
@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1tk" class=3D"a3s" style=3D"overflow:hidden">On Wed, Aug 19, 2015 at 0=
6:52:49PM +0100, Christopher Larson wrote:<br>
&gt;=C2=A0 =C2=A0 On Wed, Aug 19, 2015 at 6:32 AM, &lt;[1]<a href=3D"mailto=
:brendan.le.foll@intel.com">brendan.le.foll@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 From: Brendan Le Foll &lt;[2]<a href=3D"mailto:brendan.le=
.foll@intel.com">brendan.le.foll@intel.com</a>&gt;<br>
<span class=3D"">&gt;=C2=A0 =C2=A0 Extensible SDK cannot be installed as ro=
ot so by default offer to<br>
&gt;=C2=A0 =C2=A0 install it in<br>
&gt;=C2=A0 =C2=A0 user&#39;s home directory under distro/distro_version rep=
lacing the normal<br>
&gt;=C2=A0 =C2=A0 SDK<br>
&gt;=C2=A0 =C2=A0 version &#39;+&#39; char with a &#39;_&#39; as that&#39;s=
 a restricted character for<br>
&gt;=C2=A0 =C2=A0 bitbake<br>
</span>&gt;=C2=A0 =C2=A0 Signed-off-by: Brendan Le Foll &lt;[3]<a href=3D"m=
ailto:brendan.le.foll@intel.com">brendan.le.foll@intel.com</a>&gt;<br>
<span class=3D"">&gt;<br>
&gt;=C2=A0 =C2=A0 Why not use a metadata variable for the default, replacin=
g with @@ as<br>
&gt;=C2=A0 =C2=A0 with the other metadata variables, rather than hardcoding=
 the default<br>
&gt;=C2=A0 =C2=A0 in the .sh where it can&#39;t be easily overridden by the=
 distro or user?<br>
<br>
</span>&#39;~&#39; seemed like a good option for all SDKs/distros seemed li=
ke a<br>
decent &#39;default&#39; to me and the rest is fairly customisable with<br>
SDK_TITLE which has to be set anyways. Or do you mean a different var?</div=
></blockquote></div><br>I don&#39;t really see the point of making somethin=
g &quot;fairly customizable&quot;, personally, when it&#39;s trivial to mak=
e it completely customizable by using a metadata variable, the way we do fo=
r nearly everything else.<br>-- <br><div class=3D"gmail_signature">Christop=
her Larson<br>clarson at kergoth dot com<br>Founder - BitBake, OpenEmbedded=
, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engineer, Mentor Grap=
hics</div>
</div></div>

--089e010d9e9ebd0526051dc0eac6--
