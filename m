Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f41.google.com (mail-qg0-f41.google.com
	[209.85.192.41])
	by mail.openembedded.org (Postfix) with ESMTP id A2C7577047
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 15:20:34 +0000 (UTC)
Received: by qgem9 with SMTP id m9so73424496qge.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 08:20:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=BUQ9qgrqcBnyP0XBqZ6QiGKG1ouKww7GBuMd1OaQJg4=;
	b=gO+yRmk8GOotREwIMN38tovE/plDqa6stBOEJ9EMkLbls20ak84A/AFrumtE9eiqi3
	5BqarG4+fdRCEBaau/btakzxcR3bvdJLVnGHGG4imjLrGjmqCFyoo2BgiYa1eJno1z0E
	b4/KKVsqA7BLmxM8EagIbJJYXcWqx+YUHV2jG3aNVwHO/OUZ2776GkA+dBr/LjYj/EWd
	iAXJG9uyFLX7lLlqao2GLXRe8khWe3568dGLWyqiaa3+vvadgtCV2QoCRa/8cAX8g6Wf
	0AU/rWjY10M1MkOGUTHKAc58KumuK5Olu5NOUYw5fQIL8cUtwepHwm18YIH+dBmw6Oe2
	bgvQ==
X-Gm-Message-State: ALoCoQmhIfsCI2ZRyC53l2YSHB+1D+nWSMM8bdpVct5mtOzfEzm4iSljUBkm1PUs1dAb0YLrk80t
X-Received: by 10.141.28.76 with SMTP id f73mr8340295qhe.17.1445613634146;
	Fri, 23 Oct 2015 08:20:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.82 with HTTP; Fri, 23 Oct 2015 08:20:14 -0700 (PDT)
In-Reply-To: <b1fb2b65b6ffde36ca2d6e8f24874ff7004de038.1445596115.git.pkj@axis.com>
References: <cover.1445596115.git.pkj@axis.com>
	<b1fb2b65b6ffde36ca2d6e8f24874ff7004de038.1445596115.git.pkj@axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Oct 2015 16:20:14 +0100
Message-ID: <CAJTo0LaKdMib+D292Yo4YZy4H96qJ7_BJnppqggV5_8YaP0AcA@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] useradd-staticids.bbclass: Do not require trailing colons
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
X-List-Received-Date: Fri, 23 Oct 2015 15:20:34 -0000
Content-Type: multipart/alternative; boundary=001a11423d0c25bab10522c727b2

--001a11423d0c25bab10522c727b2
Content-Type: text/plain; charset=UTF-8

On 23 October 2015 at 11:38, Peter Kjellerstedt <peter.kjellerstedt@axis.com
> wrote:

> -                        field = line.rstrip().split(":")
> +                        # Make sure there always are at least seven
> elements in
> +                        # the field list. This allows for leaving out
> trailing
> +                        # colons in the passwd file.
> +                        line = line.rstrip() + "::::::"
> +                        field = line.split(":")
>

It's a stylist thing but I prefer padding the field list instead of
manipulating the input string. Something like

  field = line.strip().split(":")
  field += [''] * (7 - len(field))

Ross

--001a11423d0c25bab10522c727b2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 October 2015 at 11:38, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellerst=
edt@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(=
204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":2jn" cla=
ss=3D"" style=3D"overflow:hidden">-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 field =3D line.rstrip().split=
(&quot;:&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # Make sure there always are at least seven elements in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # the field list. This allows for leaving out trailing<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 # colons in the passwd file.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 line =3D line.rstrip() + &quot;::::::&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 field =3D line.split(&quot;:&quot;)</div></blockquote></div><br>=
It&#39;s a stylist thing but I prefer padding the field list instead of man=
ipulating the input string. Something like</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">=C2=A0 field =3D line.strip().split(&q=
uot;:&quot;)</div><div class=3D"gmail_extra">=C2=A0 field +=3D [&#39;&#39;]=
 * (7 - len(field))</div><div class=3D"gmail_extra"><br></div><div class=3D=
"gmail_extra">Ross</div></div>

--001a11423d0c25bab10522c727b2--
