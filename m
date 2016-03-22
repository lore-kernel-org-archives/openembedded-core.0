Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id E83CC60132
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 22:37:43 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id o5so1964696iod.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 15:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1S2LuK/M9QcV0Vzw0BnFMyUK+7Nmxoe2g0JvxO2ZlwM=;
	b=fZP1jK6NgvvuLAI0Kc83Jd/KPsWK4WyhPwrwoi8iZhfvwuoXP3Is//fqf5gdoTGaMf
	KsAgPH67MZe4NSVSFx2EzapRbRk62chbBKhcCoQVIqx61VRrTc0svgSDQbxvSPEc0fPP
	Jb5brRNYsVag5qQT276dSdV2ioPGLSzSyyrIJopa6YdynL7XedTgTy/ZIMO/xlxjXP4r
	3d1oLA7QRycxLalSjjHlZ3aEs1p1fEOd8y5R8+fpInI6HFPCF6TRmDjCoqFYcdetE98k
	74uVwxOTEOzjFwd0xi49cA+nq26xHmsBpznK87bCMJS7ixJhPXqZtMmW7rFTy48bcXHm
	z8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1S2LuK/M9QcV0Vzw0BnFMyUK+7Nmxoe2g0JvxO2ZlwM=;
	b=APClpjR+Wcpogv8o2g7kQpuWhpcJugIRR3CU/nrG5U1rYsDx0faG+FAET+aPEPmYdc
	rFwAKfv2IwNK1pwEik1ZiuvtDanVS3nm9Z42z4Mx5Xg4KMDzWnoiMHmY3VnOtHbA8a0Z
	7vJzzoBDv58Gvm3aEN796O6un7U+czdq6OslHMqMEbroIEn1ef5TWaGut0b/jqZFxJjj
	z2bA1vA3ZkXLX32D7+i6JfG/LhN83+AjKPUXreLO/FBOR1TscE2zBCvRcbGo5w6ucu49
	hbdYhySsqSBR3TN0c5EyLqB0QrjbjG49Jl0tunABaf9xIJqeBEyt83erYofcbAENxRJ2
	R9eA==
X-Gm-Message-State: AD7BkJKH+H2+sbOuQ8ysonepqdGLss9WvVdOsw09NNcm2i4uuFz4RzmTEVtAtMQqm4kIt6uLSvnNtZo1Ro0Q7tsi
X-Received: by 10.107.6.32 with SMTP id 32mr110688iog.99.1458686264339; Tue,
	22 Mar 2016 15:37:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 22 Mar 2016 15:37:24 -0700 (PDT)
In-Reply-To: <1458683790.18406.33.camel@linux.intel.com>
References: <1458670391-26915-1-git-send-email-sgw@linux.intel.com>
	<1458670391-26915-5-git-send-email-sgw@linux.intel.com>
	<CAJTo0LYn1aCCqk5=QV1iug+Zqz1s-=c2iF=mhZSaU6EOPAeR4A@mail.gmail.com>
	<1458683790.18406.33.camel@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Mar 2016 22:37:24 +0000
Message-ID: <CAJTo0LYKCiNA73zWkvXCHSz8-sWKQ4oAbQnqkyCZubf4BJ-xJA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] linux-firmware: Break out some additional firmware
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
X-List-Received-Date: Tue, 22 Mar 2016 22:37:44 -0000
Content-Type: multipart/alternative; boundary=001a113fbf5ca017a3052eaadc1d

--001a113fbf5ca017a3052eaadc1d
Content-Type: text/plain; charset=UTF-8

On 22 March 2016 at 21:56, Saul Wold <sgw@linux.intel.com> wrote:

> > | linux-firmware-iwlwifi-7265D
> > | *** Error: Package name  contains illegal characters, (other than
> > [a-z0-9.+-])
> >
> Gah, no CAPS?  Sorry I did not do the full package specturm tests.


Yeah...  tempting to file a bug against opkg!


> > Also, what Otavio said about splitting out - is C vs D a model thing
> > or a version thing?
> >
> I could merge them, I chose not to because it seems like it was more of
> a model difference vs a version difference, since there were
> overlapping version numbers.  The difference is the Dual band version,
> I think.


Cool, sounds good to leave them split then.

Ross

--001a113fbf5ca017a3052eaadc1d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 March 2016 at 21:56, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span>=
 wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; | linux-fir=
mware-iwlwifi-7265D<br>
&gt; | *** Error: Package name =C2=A0contains illegal characters, (other th=
an<br>
&gt; [a-z0-9.+-])<br>
&gt;<br>
</span>Gah, no CAPS?=C2=A0 Sorry I did not do the full package specturm tes=
ts.</blockquote><div><br></div><div>Yeah... =C2=A0tempting to file a bug ag=
ainst opkg!</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">
&gt; Also, what Otavio said about splitting out - is C vs D a model thing<b=
r>
&gt; or a version thing?<br>
&gt;<br>
</span>I could merge them, I chose not to because it seems like it was more=
 of<br>
a model difference vs a version difference, since there were<br>
overlapping version numbers.=C2=A0 The difference is the Dual band version,=
<br>
I think.</blockquote></div><br>Cool, sounds good to leave them split then.<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a113fbf5ca017a3052eaadc1d--
