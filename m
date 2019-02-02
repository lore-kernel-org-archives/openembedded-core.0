Return-Path: <andre.draszik@gmail.com>
Received: from mail-it1-f196.google.com (mail-it1-f196.google.com
	[209.85.166.196])
	by mail.openembedded.org (Postfix) with ESMTP id C09F07C2E2
	for <openembedded-core@lists.openembedded.org>;
	Sat,  2 Feb 2019 10:02:36 +0000 (UTC)
Received: by mail-it1-f196.google.com with SMTP id c9so13757353itj.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Feb 2019 02:02:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OttRDpmK2NJ+Qoc3PRQMVc5hvBsbsRDy/jd7i7yI5UE=;
	b=bmp58Ah6MOx7OImxTvzPgaGJ6fPkxpYogPyIcpdZTwg+tcNBjUkvJzA4Vxx9fUF2jh
	WZQ7oC6J2rNT+1oA/rW9C7So2terndDt0CURU+ru4MpidjTxtzF6sl8OZWnB1TKASwbF
	HjwE/FfYsH/6YzQIP/vDfioEMAKi3pP3l3fOwwhdBN9aBGoyOWI5zCGGfFA+dy3AW4xp
	BK1OUTSxhtNHhH6H273PJipvUze6PgwKBFv6nRdN8EXW3Q6XsvmMmUQAB7h+q10iCkor
	qutMhZ6/VpDnpKueXeMa8t/NaMwzHvUCwi/cJDk3oHDNaG++s+3jO3DoWb2sUUpvDUDu
	aO6w==
X-Gm-Message-State: AHQUAuaBgJb0byKNvlU70fWGToZphJ8uV1IbskRv+jsvXytGXqeeAuxP
	1NSew0uMlWYZK4IyKe/NmIvg+qKS3tbuvw==
X-Google-Smtp-Source: AHgI3IZZtZVKSpMHYY9PjnGNbPNn3vuPCQ6tAV7Nl7nLfsn2kjkO9nTVvSTf7l5feUf1Z9oriRjrpw==
X-Received: by 2002:a05:660c:58a:: with SMTP id
	g10mr3698209itk.167.1549101757668; 
	Sat, 02 Feb 2019 02:02:37 -0800 (PST)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com.
	[209.85.166.45])
	by smtp.gmail.com with ESMTPSA id t7sm4110041iom.27.2019.02.02.02.02.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Feb 2019 02:02:36 -0800 (PST)
Received: by mail-io1-f45.google.com with SMTP id m19so7936654ioh.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Feb 2019 02:02:36 -0800 (PST)
X-Received: by 2002:a6b:b706:: with SMTP id h6mr23963172iof.295.1549101756799; 
	Sat, 02 Feb 2019 02:02:36 -0800 (PST)
MIME-Version: 1.0
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
	<6a968439b13cc6e02c74c75f4441fc7918443794.camel@linuxfoundation.org>
In-Reply-To: <6a968439b13cc6e02c74c75f4441fc7918443794.camel@linuxfoundation.org>
From: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Date: Sat, 2 Feb 2019 10:02:23 +0000
X-Gmail-Original-Message-ID: <CAKUP++vho2RwL7kUYPcRuxh1zc9KhD1KuZ3681xqrkh+hXKVqg@mail.gmail.com>
Message-ID: <CAKUP++vho2RwL7kUYPcRuxh1zc9KhD1KuZ3681xqrkh+hXKVqg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 00/12] util-linux: one package per binary
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
X-List-Received-Date: Sat, 02 Feb 2019 10:02:36 -0000
Content-Type: multipart/alternative; boundary="000000000000ef65ee0580e65b95"

--000000000000ef65ee0580e65b95
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think I know why, I'll post an update in a while.

Andre

On Fri, 1 Feb 2019, 08:32 Richard Purdie <richard.purdie@linuxfoundation.or=
g
wrote:

> On Wed, 2019-01-16 at 12:51 +0000, Andr=C3=A9 Draszik wrote:
> > v4:
> > * update patch 06/15
> >   * unconditionally assign PACKAGE_PREPROCESS_FUNCS
> > * update patch 07/15
> >   * introduce update_files() helper function
>
> Ran this in -next but we saw things like:
>
> ERROR: util-linux-2.32.1-r0 do_package: QA Issue: util-linux:
> Files/directories were installed but not shipped in any package:
>   /usr/bin/x86_64
>   /usr/bin/i386
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them or delete them within
> do_install
>
> (from
> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/267662/raw
> )
> qemuarm was similar:
> https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/267853/raw
>
> so something isn't quite right :(
>
> I'll retry with a small subset of the series of patches until we figure
> this out.
>
> Cheers,
>
> Richard
>
>

--000000000000ef65ee0580e65b95
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>I think I know why, I&#39;ll post an update in a whi=
le.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Andre<br><br><div cl=
ass=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr">On Fri, 1 Feb 2019, 08:32=
 Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">r=
ichard.purdie@linuxfoundation.org</a> wrote:<br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">On Wed, 2019-01-16 at 12:51 +0000, Andr=C3=A9 Draszik wrote:<br>
&gt; v4:<br>
&gt; * update patch 06/15<br>
&gt;=C2=A0 =C2=A0* unconditionally assign PACKAGE_PREPROCESS_FUNCS<br>
&gt; * update patch 07/15<br>
&gt;=C2=A0 =C2=A0* introduce update_files() helper function<br>
<br>
Ran this in -next but we saw things like:<br>
<br>
ERROR: util-linux-2.32.1-r0 do_package: QA Issue: util-linux:<br>
Files/directories were installed but not shipped in any package:<br>
=C2=A0 /usr/bin/x86_64<br>
=C2=A0 /usr/bin/i386<br>
Please set FILES such that these items are packaged. Alternatively if<br>
they are unneeded, avoid installing them or delete them within<br>
do_install<br>
<br>
(from<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/267662/=
raw" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilder.yo=
ctoproject.org/typhoon/api/v2/logs/267662/raw</a><br>
)<br>
qemuarm was similar:<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/api/v2/logs/267853/=
raw" rel=3D"noreferrer noreferrer" target=3D"_blank">https://autobuilder.yo=
ctoproject.org/typhoon/api/v2/logs/267853/raw</a><br>
<br>
so something isn&#39;t quite right :(<br>
<br>
I&#39;ll retry with a small subset of the series of patches until we figure=
<br>
this out.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div></div>

--000000000000ef65ee0580e65b95--
