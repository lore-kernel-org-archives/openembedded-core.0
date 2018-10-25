Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2541B78CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 08:36:20 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id y20-v6so7633008eds.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Oct 2018 01:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=x7w/SvZgVwHnsKKpfeH7kGm7PFr5lVLiuxZVmboVdRY=;
	b=tgYTCeMrfwSRQb0ExNZpLYz+mwODD5/2ukzzxpidXp4ZW9uwIYat0gTael/vamvnWw
	bS0TPqEawj3rqThBpjKiA8WyYmSwLFhHk4YcaEoYXf2tpIFhBF+T7G8jc+fXSgz/OTOZ
	ldm0jxT6GpIReFJ9tiQH1cl4AVgRnya/iafhFDY0oXrTgzzNtNgG75GriwsJo4Zw88FU
	dXUuu/9aAmpItdE2xEMEU6FCsCLtIEIHhc5942EBZqSvUtvQt1b++VT7JIbC4x6g684Y
	NXRaV5hJBJFylxa//vPhRdZwtsRXqQeUQcaqWCoiejFAAubIYoN0HKLK7CIahkq0N1ln
	/SxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=x7w/SvZgVwHnsKKpfeH7kGm7PFr5lVLiuxZVmboVdRY=;
	b=P5rqA5/Kis4gah1I+CEgurz5rRATvEtgwkQX8pUypuFnk/zKy+cn84gtFS8fJkk5b5
	b0Qmh3oQr/52N4Az9E5kdNKd2/W8Z03iOGzWw+P/eFJLXopdT2419n0XyrMBJDpFwQZf
	eoDK9w2LP0zIwWRS0KqrTTlUQaKimmf4R+b3j0WTMF2+5HHOW1/LI8yHqrToS2/MaF8v
	UU8T/0ejtVBsyr8QjwvFRVvGrjwAiFrzIUSpJaSGOy1aE8umhrHJgrNJllJfoOOke0ch
	BZYiU26ba6QNJEF6xLhiP2kaby7eWuVR7g/PYL0l3tO30zDNchWkPGM+MnWC8otUMFC0
	Z92g==
X-Gm-Message-State: AGRZ1gJ8BxjcbenUIdz3nIryytQWXV1ZlfvmVLQaL3hn27MAz5/bvVVa
	6IDGMzBkw0hf6UjH/tomx2FZp0AF
X-Google-Smtp-Source: AJdET5dFxHGEceq2ebLqb1UVDIC/5irww4DeBzhsN3VgMDCYlRbZMyJFQLRT48xYiup/SPTP79IyuQ==
X-Received: by 2002:a50:8acd:: with SMTP id
	k13-v6mr821491edk.189.1540456580538; 
	Thu, 25 Oct 2018 01:36:20 -0700 (PDT)
Received: from ?IPv6:2a01:598:b001:8407:3c06:414d:25c6:2547?
	([2a01:598:b001:8407:3c06:414d:25c6:2547])
	by smtp.gmail.com with ESMTPSA id
	o13-v6sm1495983ejb.34.2018.10.25.01.36.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Oct 2018 01:36:19 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16A404)
In-Reply-To: <CAJTo0LY3gqvFDMzg48s0q4kZZ=WPpdj8u+jb-7gXFGmA-MBbPw@mail.gmail.com>
Date: Thu, 25 Oct 2018 10:36:18 +0200
Message-Id: <A6C49273-61A8-44B5-8E5C-65DE81A27B29@gmail.com>
References: <20181017164326.67111-1-mark.hatle@windriver.com>
	<20181017164326.67111-4-mark.hatle@windriver.com>
	<CAJTo0LY3gqvFDMzg48s0q4kZZ=WPpdj8u+jb-7gXFGmA-MBbPw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] weston: Remove machine specific append
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
X-List-Received-Date: Thu, 25 Oct 2018 08:36:20 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-70F7C999-BB5F-4A36-B277-DA8AC3B8C18D
Content-Transfer-Encoding: 7bit

--Apple-Mail-70F7C999-BB5F-4A36-B277-DA8AC3B8C18D
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

As far as I know virglrenderer works rather well now, and we should take it i=
nto use. WebOS already has support for it.=20
https://lwn.net/Articles/767970/

Alex

> On 18 Oct 2018, at 12.24, Burton, Ross <ross.burton@intel.com> wrote:
>=20
>> On Wed, 17 Oct 2018 at 17:44, Mark Hatle <mark.hatle@windriver.com> wrote=
:
>> -EXTRA_OECONF_append_qemux86 =3D "\
>> +EXTRA_OECONF_append_x86 =3D "\
>>                WESTON_NATIVE_BACKEND=3Dfbdev-backend.so \
>>                "
>=20
> This forces all x86 Westons that are not running inside X11 to use
> fbdev instead of drm.
>=20
> Two questions:
> 1) does qemu still need fbdev or does virtio/drm work now?  (iirc, we
> still have a crippled qemu here)
> 2) Can this be overridden in a config file instead
>=20
> Ross
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--Apple-Mail-70F7C999-BB5F-4A36-B277-DA8AC3B8C18D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">As far as I know virglrenderer works rather=
 well now, and we should take it into use. WebOS already has support for it.=
&nbsp;<div><a href=3D"https://lwn.net/Articles/767970/">https://lwn.net/Arti=
cles/767970/</a><br><div><br></div><div>Alex<br><div dir=3D"ltr"><br>On 18 O=
ct 2018, at 12.24, Burton, Ross &lt;<a href=3D"mailto:ross.burton@intel.com"=
>ross.burton@intel.com</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"=
><div dir=3D"ltr"><span>On Wed, 17 Oct 2018 at 17:44, Mark Hatle &lt;<a href=
=3D"mailto:mark.hatle@windriver.com">mark.hatle@windriver.com</a>&gt; wrote:=
</span><br><blockquote type=3D"cite"><span>-EXTRA_OECONF_append_qemux86 =3D "=
\</span><br></blockquote><blockquote type=3D"cite"><span>+EXTRA_OECONF_appen=
d_x86 =3D "\</span><br></blockquote><blockquote type=3D"cite"><span> &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;WESTON_NATIVE_BACKEND=3Dfbdev-backend.so \</span><br></blockquote><bl=
ockquote type=3D"cite"><span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"</span><br></blockquote><span><=
/span><br><span>This forces all x86 Westons that are not running inside X11 t=
o use</span><br><span>fbdev instead of drm.</span><br><span></span><br><span=
>Two questions:</span><br><span>1) does qemu still need fbdev or does virtio=
/drm work now? &nbsp;(iirc, we</span><br><span>still have a crippled qemu he=
re)</span><br><span>2) Can this be overridden in a config file instead</span=
><br><span></span><br><span>Ross</span><br><span>-- </span><br><span>_______=
________________________________________</span><br><span>Openembedded-core m=
ailing list</span><br><span><a href=3D"mailto:Openembedded-core@lists.openem=
bedded.org">Openembedded-core@lists.openembedded.org</a></span><br><span><a h=
ref=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core">htt=
p://lists.openembedded.org/mailman/listinfo/openembedded-core</a></span><br>=
</div></blockquote></div></div></body></html>=

--Apple-Mail-70F7C999-BB5F-4A36-B277-DA8AC3B8C18D--
