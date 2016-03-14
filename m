Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 7ACD065D00
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 21:21:55 +0000 (UTC)
Received: by mail-ig0-f170.google.com with SMTP id nk17so50374348igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 14:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EcMgumctwKypINgEgfcNc3LPfi6T9AIoaRJ/klFJ76Q=;
	b=GpTq5ziMqoTP5OJxPwNz0DiPCYG3ayaHsBKz0AYjlAY6s0cRt0pYbjEMf5QFOomqId
	HcsXS4ubxEoxRK011mruI6xMH+WHO2vGcXrwXyS49tLQxTYEYCVJdjW7aofztW+zXOZ6
	01njt2uTUQ4T56FTayGfb57iIKzL0tNNbqu8d43XACNa7J9Wnz2UGgiYt49o13k2dk7v
	igB7Tj5sd6DKkzqnAqRJ0xXcs6SBAL+zDdm/DISZxNMrN0uLyWSClVmf/QCg6dn8MouL
	wjGt6fi9AaUM6PC1PGJiHOhLWY7Ugm5H8TOFJ3GEqUO+3XfH/NN/EodvA13oi/vxPB3y
	ELRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EcMgumctwKypINgEgfcNc3LPfi6T9AIoaRJ/klFJ76Q=;
	b=QOYyYLXhN4ds6Ip00LX8I+zyH5MG6yVFP1rapfmPcx3v2nfyRQyB7/sF5DvUzCQXVw
	bvHc1ZpHVyLob3yzqHVhpmynDaMnGIjW8rG+l9b28W+eAzZqq3+W8e6XIpeGqtWJq9HK
	zII/XFPZp39cP2/alPuQXYjzdWo0EDsM1YbhUJ35TfUOSWQkm9I/4q3N+v16iUgUFZ2z
	43L63bruaYsKli9glhwAkKM0LFWq8Qn/0x0fe2Mt0IruJ4MZWIrNVoc3xpNjk5JcPJbz
	ApT/oaMU0HrRA53f5K+oPJHQ+gbLvbe6WwCMc4d2lGE2xaSVpWr7wua69010ucf/1fXQ
	Hr6g==
X-Gm-Message-State: AD7BkJITH7TRMBPxeia9Vu22lt5wcO7qvrsvYYxwwuyHu0WTtLnoDh8+qQ5pPiu/2FIcsuXo1h/BZ8sNmggjRg==
X-Received: by 10.50.150.1 with SMTP id ue1mr20456340igb.87.1457990516079;
	Mon, 14 Mar 2016 14:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <1457981210-23532-1-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKpGfXsyzE91Nxak39npYTZ-yLw0NkVw91z75=vuVo1UyQ@mail.gmail.com>
	<CAJTo0LaVVaY9gmtzp7tq=77GBj+rCzGBC+2K1CnOoXEk8XCwBw@mail.gmail.com>
	<CAP9ODKq2CDKAxXijkEQH75vV6QKakt2HCSXHOU-HhZ0tCCnzwg@mail.gmail.com>
	<CAJTo0LYfwrc+wteB+ez6gqZbXgM8dJO6PKrB+vf0S6+ANC7ggQ@mail.gmail.com>
	<CAP9ODKopJb0SusuYNubJz9oEMjJUDLyRBjNWDjeFD+tw0iYS3g@mail.gmail.com>
	<CAJTo0Lbx5YajNU5fcRkn1sk43LW1tCLm7p1WxCM=fQqTYo=zWA@mail.gmail.com>
	<CAP9ODKp=+6F6dMDryHOtNcMsmBL3VqHpNwioxpi3AtoxQ3ji9A@mail.gmail.com>
	<CAJTo0LY=BQxpH0Eq=86OnLB7M_bAR5+HhrWg7YqfhVPZgQ6=ng@mail.gmail.com>
	<CAP9ODKqoummpnrf_-4mZgY94u3kRTdmB0AhNX=0LGFAz0yBpVA@mail.gmail.com>
In-Reply-To: <CAP9ODKqoummpnrf_-4mZgY94u3kRTdmB0AhNX=0LGFAz0yBpVA@mail.gmail.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 14 Mar 2016 21:21:46 +0000
Message-ID: <CABcZAN=_-oVgP+8OOggYaGox6GkDLeyhtS5+=dCvgapaKZ0TDw@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, 
	"Burton, Ross" <ross.burton@intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libsdl: Only enable X11 support when the DISTRO supports it
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
X-List-Received-Date: Mon, 14 Mar 2016 21:21:55 -0000
Content-Type: multipart/alternative; boundary=001a11c30f0acc0344052e08de5f

--001a11c30f0acc0344052e08de5f
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 14, 2016 at 2:04 PM Otavio Salvador <
otavio.salvador@ossystems.com.br> wrote:

> On Mon, Mar 14, 2016 at 6:02 PM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >
> > On 14 March 2016 at 20:55, Otavio Salvador
> > <otavio.salvador@ossystems.com.br> wrote:
> >>
> >> I know it however up to now we could know that native and nativesdk
> >> might respect DISTRO_FEATURES and be in sync. Now this is not truth
> >> anymore.
> >
> > It's been like this in master since December and the world hasn't
> exploded
> > just yet :)
>
> Just because nobody complained, up to now, does not make it right.
>

Personally, I agree wholeheartedly with Ross on this, I don't want my
native recipes obeying DISTRO_FEATURES, the policy is entirely different.

--001a11c30f0acc0344052e08de5f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Mar 14, 2016 at 2:04 PM Otavio Salvador &lt;<a href=3D"mailto:otavio.salv=
ador@ossystems.com.br">otavio.salvador@ossystems.com.br</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Mon, Mar 14, 2016 at 6:02 PM, Burton=
, Ross &lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.=
burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 14 March 2016 at 20:55, Otavio Salvador<br>
&gt; &lt;<a href=3D"mailto:otavio.salvador@ossystems.com.br" target=3D"_bla=
nk">otavio.salvador@ossystems.com.br</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I know it however up to now we could know that native and nativesd=
k<br>
&gt;&gt; might respect DISTRO_FEATURES and be in sync. Now this is not trut=
h<br>
&gt;&gt; anymore.<br>
&gt;<br>
&gt; It&#39;s been like this in master since December and the world hasn&#3=
9;t exploded<br>
&gt; just yet :)<br>
<br>
Just because nobody complained, up to now, does not make it right.<br></blo=
ckquote><div><br></div><div>Personally, I agree wholeheartedly with Ross on=
 this, I don&#39;t want my native recipes obeying DISTRO_FEATURES, the poli=
cy is entirely different.</div></div></div>

--001a11c30f0acc0344052e08de5f--
