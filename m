Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id D05C270034
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 12:11:18 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id u185so83508311iod.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 05:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gGGRExmqlSWk2pPtonwQuU1bHKTI6MASbA0V7AiqVG8=;
	b=1HMitJB0hIPWT7zgXLVmv96k8RecOA/xF1AU27AGel2u6g9VD2EooOMiRCAdKMugme
	mBjRfU8i0G7LuLtfbg8KDtIsW8ZSHT9I6zck15izem6A75eHiEePSbB+rV17GK79k78V
	BI3wL06RpsgEj9Y9cUwaOyYfYtuduuofzHstq4WOU2VDBT8Fy+I9m2Q2fCxLRTzggC6k
	NL1ynr8CfQOlnVOKf+OCLRy7FctMqgI9Vjjid3ulWWlqJXPloqk/2tnqPWl+Z8hKgEXl
	zCXcXoqq/jPMGe9oyucxuuUm6Txf2LrgkQYGd2nr8lHMKrxRLdYa+5z0HjHBgYje2cVS
	PAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gGGRExmqlSWk2pPtonwQuU1bHKTI6MASbA0V7AiqVG8=;
	b=UZR50De8NDjJSRhOUBsQUE2EGkQE+Sz/pRamqfg8BbM2z+sYuSyrbDe8DURw1JnKLD
	AXFXGhMv9+o3EK1EJvOrmPvh+Xi6GXTQJkayZfVSpsC8+udVQ8IixhOfD3N/BANaCBWN
	IqXGEGfxSePx400JpiYsidcGuk85Ti7B32g+YKbpm3x8Y0kquzwUvbMsoPvTOqEzAXRq
	mssdXomnh9s5JQzjRZGHgNj6Ot6XLq4EZcomxDEpFBOPBjgvtlUOsKaR0o+fSAd6xQRT
	VFAIHWfSKmK9RtaQ02Av+A1Btq96FOu9qrIYQfEsQayEix0DJUdkGaJKvsIocp4ccHWK
	V0sg==
X-Gm-Message-State: AOPr4FVO4RMI6SgeAhRx9zmpmWJAjPwAMyNJZCrfwjk37DutaCQ3IjMfb/GIogDSBEO383nTORbUkTNj0qSSytIO
X-Received: by 10.107.179.136 with SMTP id c130mr1835063iof.99.1461240678893; 
	Thu, 21 Apr 2016 05:11:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.106 with HTTP; Thu, 21 Apr 2016 05:10:59 -0700 (PDT)
In-Reply-To: <alpine.LFD.2.20.1604210738320.5726@localhost.localdomain>
References: <alpine.LFD.2.20.1604210738320.5726@localhost.localdomain>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 21 Apr 2016 13:10:59 +0100
Message-ID: <CAJTo0LakXXOvj9_aKmYxy4OdxgP6rOp5EqLZtAajp8iFf7qkuA@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: trying to reconcile OE builds with rpm4-format rpm files built on centos 6
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
X-List-Received-Date: Thu, 21 Apr 2016 12:11:20 -0000
Content-Type: multipart/alternative; boundary=001a1148578c98f14d0530fd9b9a

--001a1148578c98f14d0530fd9b9a
Content-Type: text/plain; charset=UTF-8

On 21 April 2016 at 13:06, Robert P. J. Day <rpjday@crashcourse.ca> wrote:

>   next bit of muttering is, "can we downgrade the OE build to use
> rpm4-format packages?", which is not a path down which i want to walk.
>

Assuming that the obviously correct option of "build the packages inside
OE" really is being written off for mysterious reasons, rpm4 was only just
removed from oe-core (though depending on what releases you're using you
may have never noticed it be added and removed again).  So you could just
recover that from history (oe-core a6e7a86f1635be9a688c56c25e9d215ea4d2cc84
removed it) and fix it up.

Ross

--001a1148578c98f14d0530fd9b9a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 April 2016 at 13:06, Robert P. J. Day <span dir=3D"ltr">&lt;<a href=
=3D"mailto:rpjday@crashcourse.ca" target=3D"_blank">rpjday@crashcourse.ca</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><div id=3D":2oy" class=3D"">=C2=A0=
 next bit of muttering is, &quot;can we downgrade the OE build to use<br>
rpm4-format packages?&quot;, which is not a path down which i want to walk.=
<br></div></blockquote></div><div class=3D"gmail_extra"><br></div>Assuming =
that the obviously correct option of &quot;build the packages inside OE&quo=
t; really is being written off for mysterious reasons,=C2=A0rpm4 was only j=
ust removed from oe-core (though depending on what releases you&#39;re usin=
g you may have never noticed it be added and removed again).=C2=A0 So you c=
ould just recover that from history (oe-core=C2=A0a6e7a86f1635be9a688c56c25=
e9d215ea4d2cc84 removed it) and fix it up.</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1148578c98f14d0530fd9b9a--
