Return-Path: <lee.nipper@gmail.com>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id E9CE075E80;
	Mon,  7 Sep 2015 14:24:47 +0000 (UTC)
Received: by qgt47 with SMTP id 47so62983543qgt.2;
	Mon, 07 Sep 2015 07:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=2bj0fsg1ky0O1+M4LCaTJpYS7uzqc0chJU9tfeLeduY=;
	b=jnPE3PkwNt4a6lxqpcvfxq4+Gk2REKHz7NrD5RLo0VJtJ9hDEBQFkxAMnYLM6qzdnQ
	XQ7MlnY0fMsDMrIt8VBVGOhdGemqtqQ2JeeWnLOU8qZoRHZQr4C9RlplXvy/Ot1nIFMK
	Cx7VBpc973/XTt1phalZLqyM/clTGa9QKgaslaYeZqTBxk8oX/RjbiQyyUKq81VibShH
	bRcBjkHkxfw+ieze+IfkHPvVTT0513K6Hsz4lzfQgcGptZO7kJU/V6e/6nma+eDaoLse
	3DmN0YVKw+k8uENwnzSq+H+1SWqwd6bmiqXLKLyV/ejgJiofDJazhEmUiN9OlB9MHe5H
	CmIg==
X-Received: by 10.141.28.21 with SMTP id f21mr11219985qhe.13.1441635887696;
	Mon, 07 Sep 2015 07:24:47 -0700 (PDT)
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com.
	[209.85.220.180]) by smtp.gmail.com with ESMTPSA id
	q76sm6904311qkq.22.2015.09.07.07.24.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Sep 2015 07:24:47 -0700 (PDT)
Received: by qkdw123 with SMTP id w123so17299496qkd.0;
	Mon, 07 Sep 2015 07:24:46 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.55.198.92 with SMTP id b89mr26652870qkj.102.1441635886918;
	Mon, 07 Sep 2015 07:24:46 -0700 (PDT)
Received: by 10.140.25.165 with HTTP; Mon, 7 Sep 2015 07:24:46 -0700 (PDT)
In-Reply-To: <55ED7E38.8050201@dresearch-fe.de>
References: <55E949A4.9050805@dresearch-fe.de> <55EAD217.3010806@topic.nl>
	<55ED383E.6070005@dresearch-fe.de>
	<55ED7E38.8050201@dresearch-fe.de>
Date: Mon, 7 Sep 2015 09:24:46 -0500
Message-ID: <CALg11mjA1HpV7eGBZ0c2bsATPmBb-oDpLBhF-ZWuUy8niY9TPQ@mail.gmail.com>
From: Lee Nipper <lee.nipper@linux.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: "sub" machine types?
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
X-List-Received-Date: Mon, 07 Sep 2015 14:24:49 -0000
Content-Type: multipart/alternative; boundary=001a114787a6ef740c051f2902e4

--001a114787a6ef740c051f2902e4
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 7, 2015 at 7:08 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote:

> On 07.09.2015 09:09, Steffen Sledz wrote:
> > On 05.09.2015 13:29, Mike Looijmans wrote:
> >> ... and I think the u-boot recipe recently learned to have multiple
> targets, so you can build multiple bootloaders for a single machine too.
> >
> > That sounds great. Can someone give a pointer to some documentation or
> examples for that?
>
> Is it correct to just replace the UBOOT_MACHINE item in the machine config
> with something like this?
>
> UBOOT_CONFIG ??= "sub1 sub2 sub3"
> UBOOT_CONFIG[sub1] = "mymachine_sub1_config"
> UBOOT_CONFIG[sub2] = "mymachine_sub2_config"
> UBOOT_CONFIG[sub3] = "mymachine_sub3_config"
>
>
Looks right.

I think you may also want to add something like:

KERNEL_DEVICETREE ??= "sub1.dtb  sub2.dtb  sub3.dtb"

--001a114787a6ef740c051f2902e4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Sep 7, 2015 at 7:08 AM, Steffen Sledz <span dir=3D"ltr">&lt;<a href=
=3D"mailto:sledz@dresearch-fe.de" target=3D"_blank">sledz@dresearch-fe.de</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex"><span class=3D"">On 07.09.2015 09:=
09, Steffen Sledz wrote:<br>
&gt; On 05.09.2015 13:29, Mike Looijmans wrote:<br>
&gt;&gt; ... and I think the u-boot recipe recently learned to have multipl=
e targets, so you can build multiple bootloaders for a single machine too.<=
br>
&gt;<br>
&gt; That sounds great. Can someone give a pointer to some documentation or=
 examples for that?<br>
<br>
</span>Is it correct to just replace the UBOOT_MACHINE item in the machine =
config with something like this?<br>
<br>
UBOOT_CONFIG ??=3D &quot;sub1 sub2 sub3&quot;<br>
UBOOT_CONFIG[sub1] =3D &quot;mymachine_sub1_config&quot;<br>
UBOOT_CONFIG[sub2] =3D &quot;mymachine_sub2_config&quot;<br>
UBOOT_CONFIG[sub3] =3D &quot;mymachine_sub3_config&quot;<br>
<div class=3D""><div class=3D"h5"><br></div></div></blockquote><div><br></d=
iv><div>Looks right.</div><div><br></div><div>I think you may also want to =
add something like:</div><div><br></div><div>KERNEL_DEVICETREE ??=3D &quot;=
sub1.dtb =C2=A0sub2.dtb =C2=A0sub3.dtb&quot;</div><div><br></div><div><br><=
/div></div></div></div>

--001a114787a6ef740c051f2902e4--
