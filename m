Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id B73EC747BC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 08:01:19 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id u62-v6so666892ita.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Apr 2018 01:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=0vhXL0MF/ISHaBhsXl1/qRQx7dOeuWusRF913KqGwIU=;
	b=KsBXVrN1rneICc+hT2wOPCScmV1+NaEjqMA+bU04H8T1TdW7VSh9XB5PJ1b4IhHVnX
	f4XjtPz91kOU6FccUzpqXdEF8f9jj2Kg531iLz+mGWqukPbpYrlU8zT2ebE3o+MOOIMY
	bTSVDCe5pCcpyRtr4kPDgP6KC+52jBRtIuYOPVUE2+3ojiwRA8BG9WmYD01YfBzLvOEO
	b1AmnAw7wMiCDPQ3m1zCfUy/ku0X1Ld9J7wDhLMMdEAg3gIWloNGTGtXTuZwQwDU4Bhs
	ztBuFtQmFcgbCE1uNGH+ZIBnyWgok9APJKat2BQTT9+fomUiJdxgaN5MCh+X1uy1Hie1
	sJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=0vhXL0MF/ISHaBhsXl1/qRQx7dOeuWusRF913KqGwIU=;
	b=I8wrpyBihrmun75uyOeFJMvH6FrT2EjXBZ4hPWe6m/rZtWaxb9tyi/YfCMBZh1BpLL
	F2pVSWU5dp//xo7jVEEGayT88MdfUyK3dtECiADIYs8/4/Ll5GI1fMMH1hwalst5ls6s
	t69EctyYrCTLjkTkRMPUvV6q1npcA9dw3rg4BSvgkARtjvNNTZo3RLbA1ojib/eXFU2G
	XlGnPbKJMbVh/IIKj9Sp/q2qmSEVI6D5G7SSCYq3kkg7dTxaQg3oQxbm7rq8tImb8QvH
	fAm6MkE0b0iC+WzSvF0KIwikLfX+MgWBVKmkfCLNrS/ZiOReGBhEoQZS7Z6cJoCnTp3B
	yiFQ==
X-Gm-Message-State: AElRT7FdCt6yEbQA2O6M/WAafl+CW7vTHe8dBNphtvyouvGTs8ZnFyNb
	qtZi348L4Zy+GxOBnJTohiPbil3iGz3g29rCjNo=
X-Google-Smtp-Source: AIpwx496MeqPDgsMTfcdHnnCKKrGrPsGNrvcNcooE5EDGhbvog47phwbAGMK+o9QcW8aDwRqX81zmjUOR5MXA32jeRA=
X-Received: by 2002:a24:9987:: with SMTP id
	a129-v6mr16274981ite.124.1523001681056; 
	Fri, 06 Apr 2018 01:01:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.176.144 with HTTP; Fri, 6 Apr 2018 01:01:00 -0700 (PDT)
In-Reply-To: <CAPGMVzHrMfL77A2A2+JLFugomdnW_OB2EikVamyqTJjqoDxmUA@mail.gmail.com>
References: <CAPGMVzHrMfL77A2A2+JLFugomdnW_OB2EikVamyqTJjqoDxmUA@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Fri, 6 Apr 2018 10:01:00 +0200
Message-ID: <CAB2nKc9jjdKaRLa0-2Ky-QFoG9kJYQiYC0xMuYegAsFmF943WQ@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [meta-ros] ros build error on poky
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
X-List-Received-Date: Fri, 06 Apr 2018 08:01:20 -0000
Content-Type: multipart/alternative; boundary="0000000000003125190569297645"

--0000000000003125190569297645
Content-Type: text/plain; charset="UTF-8"

Hi,

You should contact ROS mailing-list or ROS maintainers,
see
https://github.com/bmwcarit/meta-ros#important-resources
https://github.com/bmwcarit/meta-ros#maintainers

Best regards,
Vincent

2018-04-06 9:04 GMT+02:00 Rajath C S <rajathcs.1996@gmail.com>:

> 1. i'd like to know does the process being followed in this link lead us
> to installation of ROS-kinetic / indigo or others, hope i am clear..? that
> is want to know if the process of including and compiling meta-ros layer
> for yocto equal to install ros on ubuntu i mean in literal sense
>
> http://wiki.ros.org/hydro/Installation/OpenEmbedded
>
> 2. Is the wxwidgets_2.9.5.bb recipe important because i am getting the
> below error when 'bitbake roslaunch' is used
>
> ERROR: ExpansionError during parsing /home/jarvis/poky/meta-ros/
> recipes-extended/wxwidgets/wxwidgets_2.9.5.bb                          |
> ETA:  0:02:07
> Traceback (most recent call last):
> bb.data_smart.ExpansionError: Failure expanding variable CXXFLAGS[:=],
> expression was ${@oe_filter_out('-fvisibility-inlines-hidden', ' -O2
> -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/home/
> jarvis/poky/openembedded-core/build/tmp-glibc/work/i586-oe-
> linux/wxwidgets/2.9.5-r0=/usr/src/debug/wxwidgets/2.9.5-r0
> -fdebug-prefix-map=/home/jarvis/poky/openembedded-core/
> build/tmp-glibc/work/i586-oe-linux/wxwidgets/2.9.5-r0/recipe-sysroot-native=
> -fdebug-prefix-map=/home/jarvis/poky/openembedded-core/
> build/tmp-glibc/work/i586-oe-linux/wxwidgets/2.9.5-r0/recipe-sysroot=
> -fvisibility-inlines-hidden', d)} which triggered exception NameError: name
> 'oe_filter_out' is not defined
>
>
> Thanks
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--0000000000003125190569297645
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div><br></div><div>You should contact ROS mailin=
g-list or ROS maintainers,=C2=A0</div><div>see=C2=A0</div><div><a href=3D"h=
ttps://github.com/bmwcarit/meta-ros#important-resources">https://github.com=
/bmwcarit/meta-ros#important-resources</a>=C2=A0</div><div><a href=3D"https=
://github.com/bmwcarit/meta-ros#maintainers">https://github.com/bmwcarit/me=
ta-ros#maintainers</a></div><div><br><div>Best regards,</div><div>Vincent</=
div></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2=
018-04-06 9:04 GMT+02:00 Rajath C S <span dir=3D"ltr">&lt;<a href=3D"mailto=
:rajathcs.1996@gmail.com" target=3D"_blank">rajathcs.1996@gmail.com</a>&gt;=
</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div><div>1. i&=
#39;d like to know does the process being followed in this link lead us to =
installation of ROS-kinetic / indigo or others, hope i am clear..? that is =
want to know if the process of including and compiling meta-ros layer for y=
octo equal to install ros on ubuntu i mean in literal sense<br><br><a href=
=3D"http://wiki.ros.org/hydro/Installation/OpenEmbedded" target=3D"_blank">=
http://wiki.ros.org/hydro/<wbr>Installation/OpenEmbedded</a><br><br></div>2=
. Is the <a href=3D"http://wxwidgets_2.9.5.bb" target=3D"_blank">wxwidgets_=
2.9.5.bb</a> recipe important because i am getting the below error when &#3=
9;bitbake roslaunch&#39; is used<br><br>ERROR: ExpansionError during parsin=
g /home/jarvis/poky/meta-ros/<wbr>recipes-extended/wxwidgets/<a href=3D"htt=
p://wxwidgets_2.9.5.bb" target=3D"_blank">wxw<wbr>idgets_2.9.5.bb</a>=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0<wbr>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| ETA:=C2=A0 0:02:07<br>Traceback (most recent call last):<br>bb.data_smart=
.ExpansionError: Failure expanding variable CXXFLAGS[:=3D], expression was =
${@oe_filter_out(&#39;-<wbr>fvisibility-inlines-hidden&#39;, &#39; -O2 -pip=
e -g -feliminate-unused-debug-types -fdebug-prefix-map=3D/home/<wbr>jarvis/=
poky/openembedded-core/<wbr>build/tmp-glibc/work/i586-oe-<wbr>linux/wxwidge=
ts/2.9.5-r0=3D/usr/<wbr>src/debug/wxwidgets/2.9.5-r0 -fdebug-prefix-map=3D/=
home/<wbr>jarvis/poky/openembedded-core/<wbr>build/tmp-glibc/work/i586-oe-<=
wbr>linux/wxwidgets/2.9.5-r0/<wbr>recipe-sysroot-native=3D -fdebug-prefix-m=
ap=3D/home/<wbr>jarvis/poky/openembedded-core/<wbr>build/tmp-glibc/work/i58=
6-oe-<wbr>linux/wxwidgets/2.9.5-r0/<wbr>recipe-sysroot=3D=C2=A0 -fvisibilit=
y-inlines-hidden&#39;, d)} which triggered exception NameError: name &#39;o=
e_filter_out&#39; is not defined<br><br><br></div>Thanks<br></div>
<br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--0000000000003125190569297645--
