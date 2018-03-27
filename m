Return-Path: <mans.zigher@gmail.com>
Received: from mail-ot0-f179.google.com (mail-ot0-f179.google.com
	[74.125.82.179])
	by mail.openembedded.org (Postfix) with ESMTP id E54F460102
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 09:37:11 +0000 (UTC)
Received: by mail-ot0-f179.google.com with SMTP id r30-v6so23784618otr.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 02:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lBL4NTjURxFHBBt1Ed1+X8W/rX6fo+QR7VCHAnBsrvY=;
	b=XnJal9rUnOVi6s+9sFqgiBgt6zOtcnse9utBK4EPU5G22lpqp19o5UDUA5MGVWOlic
	Nb8F6cj6y0+A39MhkTB4ih4eUTS+OJGq7E5o+3x4Mqg+Zb3Cr1rvxyEJgqSJKrdANry7
	Q45EiAKoFkHbSVwSrmrooJMSdS0sUyvbINFGNQluIF2PGy08df1nA2Rf5eEN/aNF598k
	4QxrcLMbwN6ZCb2cXh5q4QDdABwyx1+tZsVDDE35rWT376XvnCaaAocD9oLRqGk6kzR4
	nYDG8798JiF6RaJCExvGCyrBTkcdqfUBuI/rrFYUJJG8/GWy7LjQ6Homg4cqAbimt1wN
	nO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lBL4NTjURxFHBBt1Ed1+X8W/rX6fo+QR7VCHAnBsrvY=;
	b=OW2ZeWbxQmRaiGSGTQe/c+WHxskmGHm5B/QcZCInn8ny7ZMWU6HUymIOBfJi2jWczr
	4vNjKOsfumdPdgmaryr6GfJOA9L+geavqRL/7+TMRvIve7c9Z7YHBmS52luY6QPEzlmM
	0FjCCM/4eZICsBd4RprCLKh+5SfffVfvcnloyry9dv1PahyFWAvdyjrrZ9GWsSDEeg5t
	geheOp0c46jELJG7ebJi5HanNQwJ0VTMXzoh1XGWNpHnWaF+aOQHNw022iME1Rp1xLmi
	BHo2L/cvZkqJNgjKLMjdbP9xHsDms44ZQ6zH29uIgxUetmT0MMXOHJcRv1VGz28g4vdS
	tYYA==
X-Gm-Message-State: AElRT7ErMUNDsMnQXs0y6jCKknmHmjief+xCdmP4AmYp3Yr25VtjxpVc
	NXKUsfdcP5PFgj2QaoKCpj6+uuu7pKsqzr7CpBg=
X-Google-Smtp-Source: AG47ELukPkfprbtncu1kq1deS3NOHKfoBJOR3ZoXIbMsILzfjwAt0bs+tbymu1NvYf0xly9gaF4NlfWTkQ/rUc5w8BY=
X-Received: by 2002:a9d:b68:: with SMTP id
	p37-v6mr24245324otd.27.1522143432567; 
	Tue, 27 Mar 2018 02:37:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.74.77.209 with HTTP; Tue, 27 Mar 2018 02:37:12 -0700 (PDT)
In-Reply-To: <CAJTo0Lb8jwMcuEwSwSpMQ_Sy-ry6f9DLmZyBeU6w-EB-it04BA@mail.gmail.com>
References: <CAEhQi8kBYvjB05pny3QWkbdd6c1=OAQhrTwCP15-nNsmhZOxyw@mail.gmail.com>
	<CAJTo0Lb8jwMcuEwSwSpMQ_Sy-ry6f9DLmZyBeU6w-EB-it04BA@mail.gmail.com>
From: =?UTF-8?B?TcOlbnMgWmlnaGVy?= <mans.zigher@gmail.com>
Date: Tue, 27 Mar 2018 11:37:12 +0200
Message-ID: <CAEhQi8kCQi2wLwNMp+VDfWuQoCLGo2ZCLnn6fV5kc0Pc3zncdw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Question about how to get package included in SDK
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
X-List-Received-Date: Tue, 27 Mar 2018 09:37:12 -0000
Content-Type: multipart/alternative; boundary="000000000000986e40056861a25b"

--000000000000986e40056861a25b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your response.

BR
Mans Zigher

2018-03-27 11:03 GMT+02:00 Burton, Ross <ross.burton@intel.com>:

> The main problem is that protoc isn't in the protobuf packages, but
> protobuf-compiler (as can be seen with oe-pkgdata-util list-pkg-files
> -p protobuf).
>
> Add nativesdk-protobuf-compiler to TOOLCHAIN_HOST_TASK.  You'll also
> want to use _append instead of +=3D so you don't remove more than you
> add.
>
> Ross
>
> On 27 March 2018 at 09:25, M=C3=A5ns Zigher <mans.zigher@gmail.com> wrote=
:
> > Hi,
> >
> > I have package that require protobuf and the compiler protoc. I have
> > included the following
> >
> > DEPENDS +=3D " protobuf protobuf-native"
> >
> > and
> >
> > RDEPENDS_${PN} +=3D " protobuf"
> >
> > The build works as intended the problem now is that the protoc is not
> > included in the SDK. In the Yocto ref manual I found the following
> > description for TOOLCHAIN_HOST_TASK
> >
> > "This variable lists packages the OpenEmbedded build system uses when
> > building an SDK, which contains a cross-development environment. The
> > packages specified by this variable are part of the toolchain set that
> runs
> > on the SDKMACHINE, and each package should usually have the prefix
> > nativesdk-."
> >
> > So I have also in by image bb-file included the following
> >
> > TOOLCHAIN_HOST_TASK +=3D " nativesdk-protobuf"
> >
> > The build passed without any errors but the protoc is still not include=
d
> in
> > the native sdk. It  is form some reason included in the target part. I
> would
> > really appreciate if you could en-light me on this topic on how to
> include a
> > package in the sdk.
> >
> > BR
> > Mans Zigher
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--000000000000986e40056861a25b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Thanks for your response.</div><div=
><br></div><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial;float:none;display:inline">BR</span></div><div><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">Mans Zigher</span></div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">2018-03-27 11:03 GMT+02:00 Burton, Ross <span =
dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">=
ross.burton@intel.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The=
 main problem is that protoc isn&#39;t in the protobuf packages, but<br>
protobuf-compiler (as can be seen with oe-pkgdata-util list-pkg-files<br>
-p protobuf).<br>
<br>
Add nativesdk-protobuf-compiler to TOOLCHAIN_HOST_TASK.=C2=A0 You&#39;ll al=
so<br>
want to use _append instead of +=3D so you don&#39;t remove more than you<b=
r>
add.<br>
<br>
Ross<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On 27 March 2018 at 09:25, M=C3=A5ns Zigher &lt;<a href=3D"mailto:mans.zigh=
er@gmail.com">mans.zigher@gmail.com</a>&gt; wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I have package that require protobuf and the compiler protoc. I have<b=
r>
&gt; included the following<br>
&gt;<br>
&gt; DEPENDS +=3D &quot; protobuf protobuf-native&quot;<br>
&gt;<br>
&gt; and<br>
&gt;<br>
&gt; RDEPENDS_${PN} +=3D &quot; protobuf&quot;<br>
&gt;<br>
&gt; The build works as intended the problem now is that the protoc is not<=
br>
&gt; included in the SDK. In the Yocto ref manual I found the following<br>
&gt; description for TOOLCHAIN_HOST_TASK<br>
&gt;<br>
&gt; &quot;This variable lists packages the OpenEmbedded build system uses =
when<br>
&gt; building an SDK, which contains a cross-development environment. The<b=
r>
&gt; packages specified by this variable are part of the toolchain set that=
 runs<br>
&gt; on the SDKMACHINE, and each package should usually have the prefix<br>
&gt; nativesdk-.&quot;<br>
&gt;<br>
&gt; So I have also in by image bb-file included the following<br>
&gt;<br>
&gt; TOOLCHAIN_HOST_TASK +=3D &quot; nativesdk-protobuf&quot;<br>
&gt;<br>
&gt; The build passed without any errors but the protoc is still not includ=
ed in<br>
&gt; the native sdk. It=C2=A0 is form some reason included in the target pa=
rt. I would<br>
&gt; really appreciate if you could en-light me on this topic on how to inc=
lude a<br>
&gt; package in the sdk.<br>
&gt;<br>
&gt; BR<br>
&gt; Mans Zigher<br>
&gt;<br>
&gt;<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
</font></span></blockquote></div><br></div>

--000000000000986e40056861a25b--
