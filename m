Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id ADC2D60620
	for <openembedded-core@lists.openembedded.org>;
	Sun,  2 Oct 2016 13:38:28 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id s13so55034868pfd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Oct 2016 06:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n0+OniAb+gI/tONEdNghkoPSFlu7tFbdkZyUl9x2sd8=;
	b=K9eSzCHnG4iJsKkeZZytWnk3gXXUfyC6aGSZnAn95YOk0s3XS/oBWKU1AshH9nzVWq
	mLCNk8bgRDMiDt3CiR1RAEVVY371TdjSabdTLe9tn3ds2+Ak9Z9X1Khzb/rclQoEoZfn
	8ZG1Q7UFc4HcCGSdTZ1oc3+AFgtFBtwvGQ6G3BD5lwCp6TutqzjqWaYWcR+8QAnP7fpA
	QCsDwFKDF8v/IoAlXi9PvW7WCjDYUySF/3lD4qew1PsErsYR/s7ZhOMxAlNPwKwYZTAK
	q15fnJVUiNzqDrKLQjr8gwuJPOqAjvkQq0/bOnLOqphuE4mOw4s65DKvTrLIy6e9vTcS
	Lkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n0+OniAb+gI/tONEdNghkoPSFlu7tFbdkZyUl9x2sd8=;
	b=VNj7IGl5fupKxMXXkLFt2kpKrlURXIZOUlCUQ/+HWKfqu4+kQeZWWP1PoC4NNhvqFB
	9NeBn0V2uku37eV665Pv94aTrv1MAEgxddSETwjDNE2PaWBJbtXWy5RK18DbVFy5kYtZ
	SBJa1QEAHJoEHyfIwcyFpg0JPcGACvpARO/DqwGlmlbj9TDF1eqtZKV/9DqLMwDn5Sbf
	1X/vGUfWIxjYk+qoucNi98KtSVh+FJPh2nhCwlhuXm8QWAOPF3yQFsFqrqgbITJ5SeDc
	rIHM0qbLMGz2hnvviuOgamsbiXM8l7NMWv9wwPpVW7XK5TvaDSd1SnVeuwbbogGItG01
	PCVA==
X-Gm-Message-State: AA6/9RnUNndVYbst0Nkw0SXjtohhVLXF+mx/aByDZtAkO+BePWk8QUm9/FOcwRehHBoca5/umQ+4/lwnwoxW5Q==
X-Received: by 10.98.91.197 with SMTP id p188mr29396347pfb.101.1475415509884; 
	Sun, 02 Oct 2016 06:38:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.26.233 with HTTP; Sun, 2 Oct 2016 06:38:29 -0700 (PDT)
In-Reply-To: <CANwerB39TPL571sPZb-bVxLFNUn2CfO8bUVQg51PpXQv61S-Zg@mail.gmail.com>
References: <4dd9e59c-8ba5-29a3-5128-05c0cba9fcde@mlbassoc.com>
	<CANwerB39TPL571sPZb-bVxLFNUn2CfO8bUVQg51PpXQv61S-Zg@mail.gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Sun, 2 Oct 2016 22:38:29 +0900
Message-ID: <CACrLJgAVzZsNV1P3WtNp=81E6HU=cpeNakYLT0GM1-znhJ2zGw@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
Cc: Gary Thomas <gary@mlbassoc.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Taskhash mismatch?
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
X-List-Received-Date: Sun, 02 Oct 2016 13:38:28 -0000
Content-Type: multipart/alternative; boundary=94eb2c039fda5ce59f053de1f13d

--94eb2c039fda5ce59f053de1f13d
Content-Type: text/plain; charset=UTF-8

Please update meta-raspberrypi layer to
http://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/commit/?id=4c02c7ce07121c2f5367204445f93199d828bb10

Thanks
Changhyeok

2016-10-02 20:51 GMT+09:00 Jonathan Liu <net147@gmail.com>:

> On 2 October 2016 at 18:28, Gary Thomas <gary@mlbassoc.com> wrote:
> > Can someone explain this error?
> >
> > ERROR: video-demo-image-1.0-r0 do_image_rpi_sdimg: Taskhash mismatch
> > 7b8eab500890bd7cd6a00b70740800f1 versus 9471c988c4adee881554263bd10f7196
> for
> > /local/poky-cutting-edge/meta-rpi/packages/images/video-
> demo-image.bb.do_image_rpi_sdimg
> > ERROR: Taskhash mismatch 7b8eab500890bd7cd6a00b70740800f1 versus
> > 9471c988c4adee881554263bd10f7196 for
> > /local/poky-cutting-edge/meta-rpi/packages/images/video-
> demo-image.bb.do_image_rpi_sdimg
> >
> > I'm building with Poky/Yocto + meta-raspberrypi:
> > meta              = "master:725e66e1d08ae000d8f68455ddca0e192080dc1f"
> > meta-raspberrypi  = "master:4817e2c087097c02755d6309304878e42cf61d3c"
> >
> > As far as I can tell, the image was created even though the error.
> >
> > Thanks for any pointers
> >
> > --
> > ------------------------------------------------------------
> > Gary Thomas                 |  Consulting for the
> > MLB Associates              |    Embedded world
> > ------------------------------------------------------------
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> It happens to me sometimes as well in meta-raspberrypi layer.
> Interesting thing is that it doesn't happen in the meta-sunxi layer
> for me which has a very similar image class, although without the
> device-tree auto-detection and splitting code.
>
> I haven't been able to explain it.
>
> Regards,
> Jonathan
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--94eb2c039fda5ce59f053de1f13d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Please update meta-raspberrypi layer to=C2=A0<a href=3D"ht=
tp://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/commit/?id=3D4c02c=
7ce07121c2f5367204445f93199d828bb10">http://git.yoctoproject.org/cgit/cgit.=
cgi/meta-raspberrypi/commit/?id=3D4c02c7ce07121c2f5367204445f93199d828bb10<=
/a><div><br></div><div>Thanks</div><div>Changhyeok</div></div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">2016-10-02 20:51 GMT+09:00 Jon=
athan Liu <span dir=3D"ltr">&lt;<a href=3D"mailto:net147@gmail.com" target=
=3D"_blank">net147@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div class=3D"HOEnZb"><div class=3D"h5">On 2 October 2016 at 18:28, Gar=
y Thomas &lt;<a href=3D"mailto:gary@mlbassoc.com">gary@mlbassoc.com</a>&gt;=
 wrote:<br>
&gt; Can someone explain this error?<br>
&gt;<br>
&gt; ERROR: video-demo-image-1.0-r0 do_image_rpi_sdimg: Taskhash mismatch<b=
r>
&gt; 7b8eab500890bd7cd6a00b70740800<wbr>f1 versus 9471c988c4adee881554263bd=
10f71<wbr>96 for<br>
&gt; /local/poky-cutting-edge/meta-<wbr>rpi/packages/images/video-<wbr>demo=
-image.bb.do_image_rpi_<wbr>sdimg<br>
&gt; ERROR: Taskhash mismatch 7b8eab500890bd7cd6a00b70740800<wbr>f1 versus<=
br>
&gt; 9471c988c4adee881554263bd10f71<wbr>96 for<br>
&gt; /local/poky-cutting-edge/meta-<wbr>rpi/packages/images/video-<wbr>demo=
-image.bb.do_image_rpi_<wbr>sdimg<br>
&gt;<br>
&gt; I&#39;m building with Poky/Yocto + meta-raspberrypi:<br>
&gt; meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:=
<wbr>725e66e1d08ae000d8f68455ddca0e<wbr>192080dc1f&quot;<br>
&gt; meta-raspberrypi=C2=A0 =3D &quot;master:<wbr>4817e2c087097c02755d63093=
04878<wbr>e42cf61d3c&quot;<br>
&gt;<br>
&gt; As far as I can tell, the image was created even though the error.<br>
&gt;<br>
&gt; Thanks for any pointers<br>
&gt;<br>
&gt; --<br>
&gt; ------------------------------<wbr>------------------------------<br>
&gt; Gary Thomas=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 Consulting for the<br>
&gt; MLB Associates=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 =C2=A0 Embedded world<br>
&gt; ------------------------------<wbr>------------------------------<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
<br>
</div></div>It happens to me sometimes as well in meta-raspberrypi layer.<b=
r>
Interesting thing is that it doesn&#39;t happen in the meta-sunxi layer<br>
for me which has a very similar image class, although without the<br>
device-tree auto-detection and splitting code.<br>
<br>
I haven&#39;t been able to explain it.<br>
<br>
Regards,<br>
Jonathan<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--94eb2c039fda5ce59f053de1f13d--
