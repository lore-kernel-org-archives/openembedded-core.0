Return-Path: <mgloff@emacinc.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 04CA87458D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 17:41:52 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id f1-v6so1513473qti.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 10:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=emacinc-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nmW9c6tHcRW4edaa1o9r2yDbtITzfmNiRpsMoQRD2HU=;
	b=Sqp2LIcu1r6go+ce6v8LVi5X3esxoTSyquTD87OTtztEzXrZTO2kZkYjQJlNbl7gEW
	koZJbSLawYqEazOaHjVVh5lM9dvlZffIxfo74Z9fjYwhRk6OuiuMQaMcP9AYuGqM4JB7
	JiWOywKzKDF3ClvezLioKfNPV/DJFu3VzqXPxlqJ5RDd+NkX+2O2LgfT6l68QWgp06Yq
	Vp6pygWlVSOjItMJgsjMdBOeCfmFy2H/QcYHuplmthN2ba7UNx2YyoQr0isr1d3u2kjQ
	LEipkhE8qGiCtDUtjx1mosPZhW3SVv07YFL/5djYglWQJdLS8sRrr2w5bjlRYtDMzz4n
	Oblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nmW9c6tHcRW4edaa1o9r2yDbtITzfmNiRpsMoQRD2HU=;
	b=RzzNwQNT+KR0f4mpHtJNMoct2ojdUmh7d++0cV0KrzcCO/ninpZ//eSNarIifKCk0M
	qoGZV+/wJRz0OjidxUlOxfRd7g/ENm2xwcvbRQOWBisGUbSDwrqi80uxops9lEGi4rQS
	7ccap7/8ybEm8seRfz9eg+Yrffyt5P606uIW2Wy5o8tI3B64RXa6GMvVsC7eknhGwBPz
	/suRClKX79Xuvapj3linjIQwMmkG4r34uxCYLeaIIpVP/+YGBuuuXQmCFCfoNpsLuKc4
	FbplWJlM0OOJyQiitQYzKAUuWj1NXoerfl7L66OAI2piVY46quqrSN3vWzuU3ED6/EC6
	+oww==
X-Gm-Message-State: APt69E2IcuKkBdiu9E/gdS+j8UyiAW/lZ5cEb7tb2nPy4f9A63OMz3QN
	K+m8WxyT4Y58VtoIKfmQ+dAvpIJPdNKCiaWFdgFsMQ==
X-Google-Smtp-Source: AAOMgpePrqruP0Ud+vbu2Ri0wRixYCoJNmLlTN3qXd2NtIS8Ql3ufWCzMTNP+GDV2bXWTCv0rSHg7HbjHmgk3blVxoA=
X-Received: by 2002:aed:35ac:: with SMTP id
	c41-v6mr7536731qte.267.1530294113574; 
	Fri, 29 Jun 2018 10:41:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aed:2f03:0:0:0:0:0 with HTTP; Fri, 29 Jun 2018 10:41:12
	-0700 (PDT)
In-Reply-To: <CANNYZj-NmvChRNb5EaUFYUDqX_QGRfNy0Yj+3Lda-t=uzLUwMA@mail.gmail.com>
References: <CALXw4G6YVNhzjEkz1e9WNW7b-8u0CkRu_6Z2DwjOyp_BQimwwg@mail.gmail.com>
	<CANNYZj8zmttXP7o_fZF6hfYF4MOwyNTNh1csnHp1c9aV-FTCZQ@mail.gmail.com>
	<CALXw4G5TfogpXY27rrnaWvLyrj2HW6F6f450J3GHuM9q=GpOEA@mail.gmail.com>
	<8cf18c72-e899-b425-dc28-9ad2f853ff18@igalia.com>
	<CANNYZj-NmvChRNb5EaUFYUDqX_QGRfNy0Yj+3Lda-t=uzLUwMA@mail.gmail.com>
From: Michael Gloff <mgloff@emacinc.com>
Date: Fri, 29 Jun 2018 12:41:12 -0500
Message-ID: <CALXw4G5ijn+bQnO-NWchk0hBUrZ6mk2OzWYbErmVombio3royQ@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: Sumo webkitgtk fails to compile
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
X-List-Received-Date: Fri, 29 Jun 2018 17:41:53 -0000
Content-Type: multipart/alternative; boundary="0000000000000ab34b056fcb5db0"

--0000000000000ab34b056fcb5db0
Content-Type: text/plain; charset="UTF-8"

I'm not sure either why I am seeing this and thought that this would have
been also seen on the autobuilder. Is there some configuration on the AB
that does not trigger the clash? Can anyone else validate the clash with a
fresh checkout of Sumo?

Michael

On Thu, Jun 28, 2018 at 6:14 AM, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> TBH, I'm not sure why Michael is seeing this failure either. Sumo does
> get built on the AB against several qemu targets, and the failure does
> not happen there.
>
> Alex
>
> 2018-06-28 4:28 GMT+02:00 Carlos Alberto Lopez Perez <clopez@igalia.com>:
> > On 27/06/18 19:27, Michael Gloff wrote:
> >> # GL/GLES header clash: both define the same thing, differently, on 32
> bit
> >> x86
> >> EXTRA_OECMAKE_append_x86 = " -DUSE_GSTREAMER_GL=OFF "
> >> EXTRA_OECMAKE_append_x86-x32 = " -DUSE_GSTREAMER_GL=OFF "
> >>
> >> I think the best thing to do it to turn off USE_GSTREAMER_GL for all
> >> architectures. Would a patch doing so be acceptable? I've verified that
> it
> >> will build with the _armv5 case.
> >
> > USE_GSTREAMER_GL is a feature of WebKitGTK+ that allows it to leverage
> > hardware-accelerated video decoding (for example: on i.MX6).
> >
> > I think is acceptable to disable this for ARMv5 (because, AFAIK, there
> > isn't any ARMv5 hardware that can leverage this in any case), but this
> > should remain enabled for other architectures.
> >
> >
>

--0000000000000ab34b056fcb5db0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m not sure either why I am seeing this and thou=
ght that this would have been also seen on the autobuilder. Is there some c=
onfiguration on the AB that does not trigger the clash? Can anyone else val=
idate the clash with a fresh checkout of Sumo?</div><div><br></div><div>Mic=
hael<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Thu, Jun 28, 2018 at 6:14 AM, Alexander Kanavin <span dir=3D"ltr">&lt=
;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@g=
mail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">TBH, I&#=
39;m not sure why Michael is seeing this failure either. Sumo does<br>
get built on the AB against several qemu targets, and the failure does<br>
not happen there.<br>
<br>
Alex<br>
<br>
2018-06-28 4:28 GMT+02:00 Carlos Alberto Lopez Perez &lt;<a href=3D"mailto:=
clopez@igalia.com">clopez@igalia.com</a>&gt;:<br>
&gt; On 27/06/18 19:27, Michael Gloff wrote:<br>
&gt;&gt; # GL/GLES header clash: both define the same thing, differently, o=
n 32 bit<br>
&gt;&gt; x86<br>
&gt;&gt; EXTRA_OECMAKE_append_x86 =3D &quot; -DUSE_GSTREAMER_GL=3DOFF &quot=
;<br>
&gt;&gt; EXTRA_OECMAKE_append_x86-x32 =3D &quot; -DUSE_GSTREAMER_GL=3DOFF &=
quot;<br>
&gt;&gt;<br>
&gt;&gt; I think the best thing to do it to turn off USE_GSTREAMER_GL for a=
ll<br>
&gt;&gt; architectures. Would a patch doing so be acceptable? I&#39;ve veri=
fied that it<br>
&gt;&gt; will build with the _armv5 case.<br>
&gt;<br>
&gt; USE_GSTREAMER_GL is a feature of WebKitGTK+ that allows it to leverage=
<br>
&gt; hardware-accelerated video decoding (for example: on i.MX6).<br>
&gt;<br>
&gt; I think is acceptable to disable this for ARMv5 (because, AFAIK, there=
<br>
&gt; isn&#39;t any ARMv5 hardware that can leverage this in any case), but =
this<br>
&gt; should remain enabled for other architectures.<br>
&gt;<br>
&gt;<br>
</blockquote></div><br></div>

--0000000000000ab34b056fcb5db0--
