Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1252874F7A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 16:16:01 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id e78-v6so43376079iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 09:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ucg+JXmBhvtIBOrpVnMsBrC7e8mgYsl8xaaMOp95M6k=;
	b=kDsyfQEoctQIC3HAdF3bz2DJYcrIHbGKVwjAhrYmoceC8n0C8H8Ub1tks9gwN43cO4
	+S5mkdcRt4xVSysyzsQDg/EL80xrdsfU/ltM46QctHxk6bJ6sgLlTzYL3Np1fNMYLnao
	XxN6aXKGw35+guw2kQ08QgDdzvNgkklDk/mxcY2oqN7AQ4eQDAJ+VpN1MnCkv5UjKhuu
	tpUtHXRMj+63f2WZPpHhkUlUpVi27UiY/NmeI9EM+OlsgxE4cIQA+GPzM8kc6QR8vTMQ
	IDXQb6edIrYqSM3DL5Wok/XRRNVyAIDSjwdZ6KYpPAgE8g4lVyRa8Pyie22KeYYwPoRG
	/28w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ucg+JXmBhvtIBOrpVnMsBrC7e8mgYsl8xaaMOp95M6k=;
	b=r+DIRIxyEi/sNEUTZzm9LeWcvU1GLWjsgyR5o4Fxp/AHz9ey5d/4erfV/xQyZu9vlX
	W4MnQ4Ap38PDCZS5/7WzP6+bXX26uyPT3UU5vQKJzGCpNcGVI8o0vuw6qog1tvj8Ek2w
	44Q6oX/UFuoxDfhK5PBvqllJiRh2nVw6B8VFNnGdClslisAFVEGGJBJFBhNc/12jPXwJ
	8po9GsNcdOxIqWTpAk32wjoBzUbTCP0hoa8tsPaZqu6hbGHQvdeWOZTsfDC4Jwoz3x5a
	uXJ80vYyX7rvEXqtD22ndppaIk2iJaY0rF880cj2bUy8LGOICnpxeeKIW1IfXRkvND8S
	6n0Q==
X-Gm-Message-State: ALQs6tBPWkyA5kzwB361Q2YOqyGT5mo+kqpmVe+Q28llgcjSTGiDBbdS
	0I19JhABywzFLqI8mtP9D7cITNyy761kwiAIRF9ckQ==
X-Google-Smtp-Source: AB8JxZpOHYpX9BcBHk7dLdngvLN6V1npgBlhgI3qF8VA7MDIkrTfUH7T7ARM3HN//Y0mSQuOISr/FXBU5F4mX2GQVr4=
X-Received: by 2002:a6b:5507:: with SMTP id
	j7-v6mr52531776iob.23.1525882562893; 
	Wed, 09 May 2018 09:16:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.239.11 with HTTP; Wed, 9 May 2018 09:15:42 -0700 (PDT)
In-Reply-To: <3120035.nktNMt2fzU@yow-masselst-lx1>
References: <1523387170-30191-1-git-send-email-denis@denix.org>
	<3814374.oaZWZoq0et@yow-masselst-lx1>
	<CAJTo0LaHtEh3JBQqnsx1v6c31jbTYe2jLUztLtpiqwDi+W3nLg@mail.gmail.com>
	<3120035.nktNMt2fzU@yow-masselst-lx1>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 May 2018 17:15:42 +0100
Message-ID: <CAJTo0LZPMv1HW-X_iAMa7kP20GyAv8KQy-=nVN53xpU_NiqOJA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] wayland: upgrade to 1.15.0
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
X-List-Received-Date: Wed, 09 May 2018 16:16:02 -0000
Content-Type: multipart/alternative; boundary="000000000000217063056bc83876"

--000000000000217063056bc83876
Content-Type: text/plain; charset="UTF-8"

I'd say that generalising rm -f ${D}${libdir}/libwayland-egl.so* to
libwayland-egl.* should to the trick.

Ross

On 9 May 2018 at 17:09, Mark Asselstine <mark.asselstine@windriver.com>
wrote:

> On Wednesday, May 9, 2018 12:03:26 PM EDT Burton, Ross wrote:
> > On 9 May 2018 at 17:00, Mark Asselstine <mark.asselstine@windriver.com>
> >
> > wrote:
> > > I am also seeing build failures due to this conflict:
> > >
> > > ERROR: libglu-2_9.0.0-0 do_prepare_recipe_sysroot: The file /usr/lib64/
> > > libwayland-egl.la is installed by both wayland and mesa, aborting
> > > ..
> > > ERROR: mesa-2_18.0.2-r0 do_package: QA Issue: mesa: Files/directories
> were
> > >
> > > installed but not shipped in any package:
> > >   /usr/lib64/libwayland-egl.la
> > >
> > > Please set FILES such that these items are packaged. Alternatively if
> they
> > > are
> > > unneeded, avoid installing them or delete them within do_install.
> > > mesa: 1 installed and not shipped files. [installed-vs-shipped]
> > >
> > > is someone working on a fix or should I take some time to put something
> > > together?
> >
> > As it appears you can test quickly then I think you just drew the short
> > straw.  Should be a trivial patch...
>
> I knew that this had a 50/50 chance of going this way :). Lunch then a
> fix. I
> assume then we will go with Martin's suggestion of an explicit remove in
> mesa.inc?
>
> Mark
>
> >
> > Ross
>
>
>
>
>

--000000000000217063056bc83876
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;d say that generalising=C2=A0<span style=3D"font-siz=
e:12.800000190734863px">rm -f ${D}${libdir}/libwayland-egl.</span><wbr styl=
e=3D"font-size:12.800000190734863px"><span style=3D"font-size:12.8000001907=
34863px">so* to libwayland-egl.* should to the trick.</span><br style=3D"fo=
nt-size:12.800000190734863px"><div><span style=3D"font-size:12.800000190734=
863px"><br></span></div><div><span style=3D"font-size:12.800000190734863px"=
>Ross</span></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">On 9 May 2018 at 17:09, Mark Asselstine <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:mark.asselstine@windriver.com" target=3D"_blank">mark.asselstin=
e@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On Wednesday, May 9, 2018 12:03:26 PM EDT Burton, Ross wrote:=
<br>
&gt; On 9 May 2018 at 17:00, Mark Asselstine &lt;<a href=3D"mailto:mark.ass=
elstine@windriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
&gt; <br>
&gt; wrote:<br>
&gt; &gt; I am also seeing build failures due to this conflict:<br>
&gt; &gt; <br>
&gt; &gt; ERROR: libglu-2_9.0.0-0 do_prepare_recipe_sysroot: The file /usr/=
lib64/<br>
&gt; &gt; <a href=3D"http://libwayland-egl.la" rel=3D"noreferrer" target=3D=
"_blank">libwayland-egl.la</a> is installed by both wayland and mesa, abort=
ing<br>
&gt; &gt; ..<br>
&gt; &gt; ERROR: mesa-2_18.0.2-r0 do_package: QA Issue: mesa: Files/directo=
ries were<br>
&gt; &gt; <br>
&gt; &gt; installed but not shipped in any package:<br>
&gt; &gt;=C2=A0 =C2=A0/usr/lib64/<a href=3D"http://libwayland-egl.la" rel=
=3D"noreferrer" target=3D"_blank">libwayland-egl.la</a><br>
&gt; &gt; <br>
&gt; &gt; Please set FILES such that these items are packaged. Alternativel=
y if they<br>
&gt; &gt; are<br>
&gt; &gt; unneeded, avoid installing them or delete them within do_install.=
<br>
&gt; &gt; mesa: 1 installed and not shipped files. [installed-vs-shipped]<b=
r>
&gt; &gt; <br>
&gt; &gt; is someone working on a fix or should I take some time to put som=
ething<br>
&gt; &gt; together?<br>
&gt; <br>
&gt; As it appears you can test quickly then I think you just drew the shor=
t<br>
&gt; straw.=C2=A0 Should be a trivial patch...<br>
<br>
</span>I knew that this had a 50/50 chance of going this way :). Lunch then=
 a fix. I <br>
assume then we will go with Martin&#39;s suggestion of an explicit remove i=
n <br>
mesa.inc?<br>
<br>
Mark<br>
<br>
&gt; <br>
&gt; Ross<br>
<br>
<br>
<br>
<br>
</blockquote></div><br></div>

--000000000000217063056bc83876--
