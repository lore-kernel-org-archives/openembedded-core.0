Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 34D3C7319F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 14:06:08 +0000 (UTC)
Received: by mail-qk0-f174.google.com with SMTP id s63so146285938qkb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 07:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qaOf17ggbTOYV312Id6dpCINyVtYPSbO/HXJU7uBON4=;
	b=wrQh6Cs4VN4SmhpgAGPXtfuOAk6Q8cZgoN0j+QbXWDz+5xUZdrZqIrV0VJQS/4dHcd
	h+9JjuwPZ/9sDrKRIT0q5GWlSfxXEQETU0tS06qJlUls6/Y3PfmNenP9lbnXSqIOw4pU
	Fl9usDWYT335Rjmkzi2d6GEgBX49SZD/HjRg7OJJtcsJMW+nu3al2O/1iSyhVkKi2p3f
	k4eHmbXPwJIbCwMHhcefcf4/3FHXS/IRzhskBTGVwstxQzLyLJvUywGC4wIH4Vncn3on
	+zbKvya4f33LXZBjJaa76XSOKsCioyvnfSet5lD1h5yAZ5ssXjrfNT2uvHWYh+kb+2Kc
	JEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qaOf17ggbTOYV312Id6dpCINyVtYPSbO/HXJU7uBON4=;
	b=MJ8PHqjqI7rFsUQFJyii0roOeexpEi0lIQaJ8lK8ZX9BJKjcZXv5KeW+9dkbF8ZZRI
	OlR0vo7JxyAVnj3NbvhUIF5b09V1dW3mdPQBQJwYCupJieB7rRyWBLNb1peZdPMA89wI
	QqeAQs/iATfcp+dchER5K7gxvD3J06tg7rL5LIU2oEJmY9h9Apvup2DAC0L4MH7dyJcw
	64rlWL/ANw8nCTGeQRnPxKB+L8kS5H1LOw0N3LBkykZBxN2VDuw2eXAH6Rpvsn5iKI/f
	UWHKVbDKpI+zHdmAUtYDxLEBqtag/t9My5OG1Yk3zK4MFWSIOFjP4Xvwfpxx5YxKUXiI
	D1GQ==
X-Gm-Message-State: AEkooutS8IlqeVWYMRgNgXxYdJvpWQZ9hVCInLwCA1IjeIbQKwsxO05E4mTg4I6m/RNvf+VLP5I49PCOb2s4EA==
X-Received: by 10.55.124.132 with SMTP id x126mr68696063qkc.113.1470060369345; 
	Mon, 01 Aug 2016 07:06:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Mon, 1 Aug 2016 07:06:08 -0700 (PDT)
In-Reply-To: <7603e18c-345c-ddcf-cd95-14df64b60077@gravedo.de>
References: <7603e18c-345c-ddcf-cd95-14df64b60077@gravedo.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 1 Aug 2016 10:06:08 -0400
Message-ID: <CADkTA4Ng8BoOou9UiS_dh8+x=Z2_1OJYPiWYkkD2cD3MHk0pxA@mail.gmail.com>
To: Simon Fels <morphis@gravedo.de>
Cc: Yocto Project Discussion <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Snaps on Yocto/OpenEmbedded
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
X-List-Received-Date: Mon, 01 Aug 2016 14:06:11 -0000
Content-Type: multipart/alternative; boundary=94eb2c05ac8a1d099d0539031a37

--94eb2c05ac8a1d099d0539031a37
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 1, 2016 at 7:32 AM, Simon Fels <morphis@gravedo.de> wrote:

> Hey everyone,
>
> I've worked on a new layer recently which brings snaps to any
> Yocto/OpenEmbedded based system.
>
> If you have never heard about snaps yet you will find most details at
> http://snapcraft.io/ but generally snaps are a new packaging format made
> with security and fast updates in mind and allows applications to be
> packaged once but run everywhere no matter of the distribution used or a
> particular device type.
>
> The layer is currently named meta-snappy and is available at
> https://github.com/morphis/meta-snappy
>
>
I had a quick browse this morning, and one question that jumped to mind was
if the oe-meta-go layer was causing problems for go/go-cross support ? I was
carrying some go/go-inc changes in meta-virtualization as well, but recent
reports
are that oe-meta-go should work for everything now.

I'm just asking, since it doesn't make sense for meta-virt or other layers
to
continue to carry go build infrastructure when it could be unified.

Bruce


> It comes with some basic instructions how to get quickly started. A
> basic tour through the snap system and how to use it is available at
> http://snapcraft.io/
>
> If you have any questions, bugs or contributions feel free to get in
> contact with me.
>
> regards,
> Simon
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c05ac8a1d099d0539031a37
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Mon, Aug 1, 2016 at 7:32 AM, Simon Fels <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:morphis@gravedo.de" target=3D"_blank">morphis@gravedo.de</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Hey everyone,<br>
<br>
I&#39;ve worked on a new layer recently which brings snaps to any<br>
Yocto/OpenEmbedded based system.<br>
<br>
If you have never heard about snaps yet you will find most details at<br>
<a href=3D"http://snapcraft.io/" rel=3D"noreferrer" target=3D"_blank">http:=
//snapcraft.io/</a> but generally snaps are a new packaging format made<br>
with security and fast updates in mind and allows applications to be<br>
packaged once but run everywhere no matter of the distribution used or a<br=
>
particular device type.<br>
<br>
The layer is currently named meta-snappy and is available at<br>
<a href=3D"https://github.com/morphis/meta-snappy" rel=3D"noreferrer" targe=
t=3D"_blank">https://github.com/morphis/meta-snappy</a><br>
<br></blockquote><div><br></div><div>I had a quick browse this morning, and=
 one question that jumped to mind was</div><div>if the oe-meta-go layer was=
 causing problems for go/go-cross support ? I was</div><div>carrying some g=
o/go-inc changes in meta-virtualization as well, but recent reports</div><d=
iv>are that oe-meta-go should work for everything now.</div><div><br></div>=
<div>I&#39;m just asking, since it doesn&#39;t make sense for meta-virt or =
other layers to=C2=A0</div><div>continue to carry go build infrastructure w=
hen it could be unified.</div><div><br></div><div>Bruce</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
It comes with some basic instructions how to get quickly started. A<br>
basic tour through the snap system and how to use it is available at<br>
<a href=3D"http://snapcraft.io/" rel=3D"noreferrer" target=3D"_blank">http:=
//snapcraft.io/</a><br>
<br>
If you have any questions, bugs or contributions feel free to get in<br>
contact with me.<br>
<br>
regards,<br>
Simon<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--94eb2c05ac8a1d099d0539031a37--
