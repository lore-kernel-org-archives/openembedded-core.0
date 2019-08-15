Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5ED6A6C0F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 20:22:39 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id f22so3251925edt.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2019 13:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ruklLXBPBk71AkHK5sQjO5oxeZcXe7Mc99dWoiQv5t8=;
	b=ENPRhD04a0LTsxcOkGzW8Jh+JrrQOzfDPPjrqTbOlXfEdIZi3Px0tD7pMiiSCjyqRF
	b9GE7tEvsZwRaWTR3SAdvqlgjhUVTqpRCs8H+HgWWBpQuUk5casMx1BCE2RXDgzGTeoQ
	lNo2k4iDHWuNobS4b/kotksahqCLYlRSSe/CsCS0Me8iBwEn9qSx0Zq1dsxaKg9MaH+h
	cFoPEtvYj7rOptsJoMbn62d18m0qnLVsTAKgP5jBMcyaFKyOIg17bzFQbfhY8nO930hs
	WKCQrOj+2CR3dn2Men+EYjyhj3OaygufTY9jPD8Znfx7mSMgkk+eEtJ2cFqg8FNr0GUb
	Gs8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ruklLXBPBk71AkHK5sQjO5oxeZcXe7Mc99dWoiQv5t8=;
	b=TrOlLPStsX7PPBXZeAYjX2nTunx4yQa9FMv6S79NWmIUub1vaOOnmqoEYAl6R3Ekqs
	MiXnW1cjDYijbm2NW2JdkYPZ2Kp6lID+QDNy3l+NF7ZepSgDeVtZG1ro5K4vJjuaQgPZ
	dX1ftIlO9sKIitzpM+rO+qFWtG4c97jHHprdP+pAeeR2BHDvqeon/g90sJ2Qma/JnTMz
	e5zptOj+VytuUCoM4oj9JF/l404PW3kAJVWL3umI+SkrQsJ5Nry1xt1ikF/QRQSj5lzH
	/J+R6LmQGj18tEDbVZU2LXCEy5HfVmVFkWpkJkDMhxo+I5w090YzaA0oKD+rJvEzsYH8
	85Cw==
X-Gm-Message-State: APjAAAVfzqqFTw/0JIHmHgP/o84E25287AsYINfPlMZt9OiiR7tEP2uR
	9subSPJzekhOpyRaPQGRqwpvi/l7HE6Mp2OX27I=
X-Google-Smtp-Source: APXvYqz+hfQWxznF9C6vsKwdM+NzidaVvtIzXWQ8YrOBdcj5T5tvMi7fBJyieymYS2ZTMaLlGyCsrv3J8gb8h7Z0q3A=
X-Received: by 2002:a17:906:1105:: with SMTP id
	h5mr6059751eja.53.1565900559940; 
	Thu, 15 Aug 2019 13:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190814152613.46996-1-alex.kanavin@gmail.com>
	<20190814152613.46996-2-alex.kanavin@gmail.com>
	<23fcfd39e3626c222c41bda1e40099820d82da92.camel@linuxfoundation.org>
	<CANNYZj8mODa0BZCFasxTgqu-CZmGYQYh8Kw-8tp8M86dwehs7Q@mail.gmail.com>
In-Reply-To: <CANNYZj8mODa0BZCFasxTgqu-CZmGYQYh8Kw-8tp8M86dwehs7Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Aug 2019 22:22:36 +0200
Message-ID: <CA+chaQd63NfL=Zp16KYjnCT0h_WKCTsJRAohy3mCw7nQVWkQbg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/3] qemuboot.bbclass: increase the default RAM to 512M
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
X-List-Received-Date: Thu, 15 Aug 2019 20:22:39 -0000
Content-Type: multipart/alternative; boundary="000000000000a100df05902da26a"

--000000000000a100df05902da26a
Content-Type: text/plain; charset="UTF-8"

Maybe we should drop x11 from default DISTRO_FEATURES :)

Will resolve the memory consumption and image size.

Well the image size isn't much different, I was just surprised to see
libx11 being included even in core-image-minimal (because systemd -> dbus
-> libx11: "dbus.do_package" -> "libx11.do_packagedata"), but in the end
the difference in ext4 was only 2MB (61MB/63MB), caused by following 4
packages:
libx11-6 core2-64 1:1.6.8-r0.0
libxau6 core2-64 1:1.0.9-r0.15
libxcb1 core2-64 1.13.1-r0.15
libxdmcp6 core2-64 1:1.1.3-r0.15

so I guess embedded no longer have neither small ram nor small flash.



On Thu, Aug 15, 2019 at 6:20 PM Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Wed, 14 Aug 2019 at 18:42, Richard Purdie <
> richard.purdie@linuxfoundation.org> wrote:
>
>> I'm not sure I agree with this.
>>
>> We are meant to work on embedded systems and 256MB should be enough to
>> let us bring up X under qemu.
>>
>> I'm fine with some sdk/ptest images having more memory, that makes
>> sense but 256MB not allowing X under qemu seems rather poor.
>>
>
> I poked a bit more at this. The main difference between vmware emulated
> hardware and std emulated hardware is that X uses the standard 2D
> framebuffer interface for the former, and the full 3D stack for the latter
> (via use of glamor: https://www.freedesktop.org/wiki/Software/Glamor/).
> The 3D stack (mesa and friends) is what causes the memory usage to swell.
>
> It is possible to disable this behaviour and enforce framebuffer usage
> (see 'man modesetting'), and I have verified that the RAM usage drops to
> similar levels as vmware, but that is not the upstream default; they have
> more or less obsoleted 2D drivers and are defaulting to 3D rendering
> nowadays. I'd rather follow that.
>
> Alex
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000a100df05902da26a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Maybe we should drop x11 from default DISTRO_FEATURES :)<d=
iv><br></div><div>Will resolve the memory consumption and image size.</div>=
<div><br></div><div>Well the image size isn&#39;t much different, I was jus=
t surprised to see libx11 being included even in core-image-minimal (becaus=
e=C2=A0systemd -&gt; dbus -&gt; libx11: &quot;dbus.do_package&quot; -&gt; &=
quot;libx11.do_packagedata&quot;), but in the end the difference in ext4 wa=
s only 2MB (61MB/63MB), caused by following 4 packages:</div><div>libx11-6 =
core2-64 1:1.6.8-r0.0<br></div><div>libxau6 core2-64 1:1.0.9-r0.15<br>libxc=
b1 core2-64 1.13.1-r0.15<br>libxdmcp6 core2-64 1:1.1.3-r0.15</div><div><br>=
</div><div>so I guess embedded no longer have neither small ram nor small f=
lash.</div><div><br></div><div><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 15, 2019 at 6:20 PM Al=
exander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_bl=
ank">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">On Wed, 14 Aug=
 2019 at 18:42, Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfo=
undation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">I&#39;m not sure I agree with this.<br>
<br>
We are meant to work on embedded systems and 256MB should be enough to<br>
let us bring up X under qemu.<br>
<br>
I&#39;m fine with some sdk/ptest images having more memory, that makes<br>
sense but 256MB not allowing X under qemu seems rather poor.<br></blockquot=
e><div><br></div><div>I poked a bit more at this. The main difference betwe=
en vmware emulated hardware and std emulated hardware is that X uses the st=
andard 2D framebuffer interface for the former, and the full 3D stack for t=
he latter (via use of glamor: <a href=3D"https://www.freedesktop.org/wiki/S=
oftware/Glamor/" target=3D"_blank">https://www.freedesktop.org/wiki/Softwar=
e/Glamor/</a>). The 3D stack (mesa and friends) is what causes the memory u=
sage to swell.<br></div><div><br></div><div>It is possible to disable this =
behaviour and enforce framebuffer usage (see &#39;man modesetting&#39;), an=
d I have verified that the RAM usage drops to similar levels as vmware, but=
 that is not the upstream default; they have more or less obsoleted 2D driv=
ers and are defaulting to 3D rendering nowadays. I&#39;d rather follow that=
.<br></div><div><br></div><div>Alex<br></div><div><br></div><div><br></div>=
</div></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000a100df05902da26a--
