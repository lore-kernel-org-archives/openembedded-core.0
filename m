Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 0CB2060664
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 10:00:46 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id fb10so8710774pad.37
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 03:00:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=M9PYRYfi6QY4TO3jgRLcBnOPHxpEhsBLrkMe3GZR9as=;
	b=JthGKFLSV91Om3xpgIGN3R2I+sszljyjH4CubHn967c8nFpLRhdAdumeF8PJf8vUZ6
	lOzZ2ItEzUTCgHxR5RDlV6+FdCj22v53HuQM3y+Ll1+4sCRrSfc6AKsSdlDWBQXM03SI
	B9Pzqu4Mz4dtXyQSfcxkYabDBM1iN+OR3FR5MrGs0F/w49Wdh+xCayi4rAjs5RgTl/NK
	If9YhbIDCU0uYq51xwNX976inyKSuWe6tE0NNYerunvQVuboPbg9dD0haZ4hN/0U2lDF
	Ao4i2xAl88BHRhYUYeRvix7btagyXyMog3W7jkopqYPOKeVTTaVoRv5E8XujMb9hmXV2
	3oqA==
X-Gm-Message-State: ALoCoQm+lBMV1nieQRoiJg46fTARmqSBs6vmzS8gK6o9KYUw+HwvWUcp7KwCVDwKml6QBisOAkzW
MIME-Version: 1.0
X-Received: by 10.68.189.72 with SMTP id gg8mr231740pbc.201.1376388046881;
	Tue, 13 Aug 2013 03:00:46 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.37.237 with HTTP; Tue, 13 Aug 2013 03:00:46 -0700 (PDT)
In-Reply-To: <CAJTo0Lbp4fUNEoyehK6KtMQm2-GXTg_Jiift37gXgCDjmh676Q@mail.gmail.com>
References: <1375082184-14871-1-git-send-email-lpapp@kde.org>
	<10585858-000F-43F4-80AF-5622D08A91D7@gmail.com>
	<CAOMwXhMPmoFo+bYz9NAijJevWvizNFm0rsbVn1fPNHCS4Kf7yw@mail.gmail.com>
	<CAOMwXhPK5VqtvhSopZb+CFaRcfV=x9FQT9-TuEyEn7gPotCGTw@mail.gmail.com>
	<CAJTo0LZJpOhqMVyLyKTHmL_JrPpUG7rY_-rRpd2kQk7TTpTDXw@mail.gmail.com>
	<CAOMwXhMx5Ky7HQAYxMP7_CyYOLqDPKz6TRsmVvZe0Cu-r-Vvkw@mail.gmail.com>
	<CAJTo0Lbp4fUNEoyehK6KtMQm2-GXTg_Jiift37gXgCDjmh676Q@mail.gmail.com>
Date: Tue, 13 Aug 2013 11:00:46 +0100
X-Google-Sender-Auth: 95i2eIGwfkVGq2f0DtY2VtnyRvU
Message-ID: <CAOMwXhPqdK9WvKmPD6rO33x==c8Dt0z5DrMBEx_s8G+t4nrLpg@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] busybox-1.21.1/defconfig: disable rfkill
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
X-List-Received-Date: Tue, 13 Aug 2013 10:00:47 -0000
Content-Type: multipart/alternative; boundary=e89a8ff1c85e9b9c5704e3d15080

--e89a8ff1c85e9b9c5704e3d15080
Content-Type: text/plain; charset=ISO-8859-1

Why are you referring to defconfig when I mentioned several times, the
problem is the inc file and a python function; i.e. not the kernel, nor the
busybox config?


On Tue, Aug 13, 2013 at 10:58 AM, Burton, Ross <ross.burton@intel.com>wrote:

> On 13 August 2013 10:52, Laszlo Papp <lpapp@kde.org> wrote:
> > As we have already discussed that, it is not any clear at all without
> > example. Yes, the end user does not really care about the internal
> > implementation of the feature ....
> >
> > Please provide useful examples and tutorials how to use a feature
> especially
> > when a user (and apparently others posting here) is such clueless.
>
> Personally I've never touched busybox configuration so this is
> untested.  However it claims to support configuration fragments as
> used by the kernel (as both busybox and the kernel use the same
> configuration system), so this section in the kernel documentation
> should be useful:
>
>
> http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration
>
> tl;dr: put a file such as myconfig.cfg in SRC_URI which contains the
> configuration variables you want set.
>
> Ross
>

--e89a8ff1c85e9b9c5704e3d15080
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Why are you referring to defconfig when I mentioned severa=
l times, the problem is the inc file and a python function; i.e. not the ke=
rnel, nor the busybox config?</div><div class=3D"gmail_extra"><br><br><div =
class=3D"gmail_quote">
On Tue, Aug 13, 2013 at 10:58 AM, Burton, Ross <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On 13 August 2013 10:52, Laszlo Papp &lt;<a href=3D"mailt=
o:lpapp@kde.org">lpapp@kde.org</a>&gt; wrote:<br>
&gt; As we have already discussed that, it is not any clear at all without<=
br>
&gt; example. Yes, the end user does not really care about the internal<br>
&gt; implementation of the feature ....<br>
&gt;<br>
&gt; Please provide useful examples and tutorials how to use a feature espe=
cially<br>
&gt; when a user (and apparently others posting here) is such clueless.<br>
<br>
</div>Personally I&#39;ve never touched busybox configuration so this is<br=
>
untested. =A0However it claims to support configuration fragments as<br>
used by the kernel (as both busybox and the kernel use the same<br>
configuration system), so this section in the kernel documentation<br>
should be useful:<br>
<br>
<a href=3D"http://www.yoctoproject.org/docs/current/kernel-dev/kernel-dev.h=
tml#changing-the-configuration" target=3D"_blank">http://www.yoctoproject.o=
rg/docs/current/kernel-dev/kernel-dev.html#changing-the-configuration</a><b=
r>

<br>
tl;dr: put a file such as myconfig.cfg in SRC_URI which contains the<br>
configuration variables you want set.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div><br></div>

--e89a8ff1c85e9b9c5704e3d15080--
