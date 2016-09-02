Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id AE58C770D0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 11:56:59 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id c198so32871747ith.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Sep 2016 04:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fuQVvJ+e7zZHV48/so0fYRi0T8Ys+lX8KtLwDv9weQg=;
	b=ynk+rh7UZZsp/A5z4DB5TNdA4PtvKGv3Wr8zu868uj8H4fj0v7/f1SxfzqLZGQ7TBs
	09Jk4apb5ehchhQO4lW9US/e4l7gmMeXdjgNJmin7ZJF+B+BYVFfAiXBJQPAbs2IPldE
	zJPfVawRsAaMVOX2Z7H2dMZd+AA5ZQQWV/OWFEol6CLKbcUhm0O8jUCSlCmwZs1N7TIW
	uzUYNrw6Lc1UYhLPpjUHucbqspeS3x9NsclSmpYn4OTFvCAqGSrXFx0tPGNks8HQoVrY
	4e/nGBn2k8zhXupuOktM1nHPkBM2Luf26bP7HWpDYLF5712g3RC9+9TCyFDCkjtR4OHc
	c17g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fuQVvJ+e7zZHV48/so0fYRi0T8Ys+lX8KtLwDv9weQg=;
	b=U5/2UnYnVVe244hJAYtla+9PES++RKAPoDt2cJrBNIErxa50wFKoolXNdPmTYraDpJ
	2bycVqJVDadOMdV92YTUPOf6V6O6lYqzr2g5FkPv4LyBmM7gywwHr+K+vgXnszDqsg0E
	bR1ccg68X72119pLWSgxTp2yv6379lOzIr7pvGi2AsEB26WmdttSY5XwbBHJDbcz8uFl
	WhSeUVyPT8a2hADp3JvVMz+FKEqsVVL/1WX0HIltgGe01FMqYQXyjnc2XJ5OWMaYa302
	bM19nPhqUdvYyEdEz04RlKNKNh+xkXstY9OJ4HetSzUdlnH0K5RJY2Gv/BhJXTmYGSsY
	BcGQ==
X-Gm-Message-State: AE9vXwP2OioJfE87jrosTbTmXTZ2veyjiarZikMApaYyQx6jBTa6HRDrWIL6YbRkpGy2d7IApRvDjuZBe8DahF8Z
X-Received: by 10.36.20.204 with SMTP id 195mr4242715itg.83.1472817420674;
	Fri, 02 Sep 2016 04:57:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Fri, 2 Sep 2016 04:56:40 -0700 (PDT)
In-Reply-To: <ly60qgxzp3.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lya8ftx7w4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1472662673.29583.90.camel@linuxfoundation.org>
	<ly60qgxzp3.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 2 Sep 2016 12:56:40 +0100
Message-ID: <CAJTo0LafVEqcVF02+naw8JvbzF2fi2y+Ws=OH0+=OgAyDNSt1A@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Replacement for tslib?
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
X-List-Received-Date: Fri, 02 Sep 2016 11:57:03 -0000
Content-Type: multipart/alternative; boundary=001a1143e4e42dbce2053b8507e8

--001a1143e4e42dbce2053b8507e8
Content-Type: text/plain; charset=UTF-8

On 1 September 2016 at 00:53, Enrico Scholz <enrico.scholz@sigma-chemnitz.de
> wrote:

> I am not aware of any way how /dev/input/eventX values can be calibrated
> within the kernel.
>
> Most capacitive touchscreens are doing this calibration in hardware
> so that values correspond 1:1 to screen coordinates.  But resistive
> touchscreens return usually only the raw 10-12 bit ADC values in
> ABS_X/Y.
>

tslib is still available in meta-oe, or I'd suggest looking at libinput.

Ross

--001a1143e4e42dbce2053b8507e8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 1 September 2016 at 00:53, Enrico Scholz <span dir=3D"ltr">&lt;<a href=
=3D"mailto:enrico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico.scholz=
@sigma-chemnitz.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">=
<div id=3D":mv" class=3D"a3s aXjCH m156e3071f505f618">I am not aware of any=
 way how /dev/input/eventX values can be calibrated<br>
within the kernel.<br>
<br>
Most capacitive touchscreens are doing this calibration in hardware<br>
so that values correspond 1:1 to screen coordinates.=C2=A0 But resistive<br=
>
touchscreens return usually only the raw 10-12 bit ADC values in<br>
ABS_X/Y.</div></blockquote></div><br>tslib is still available in meta-oe, o=
r I&#39;d suggest looking at libinput.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Ross</div></div>

--001a1143e4e42dbce2053b8507e8--
