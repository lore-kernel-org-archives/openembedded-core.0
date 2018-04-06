Return-Path: <srifenbark@gmail.com>
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	by mail.openembedded.org (Postfix) with ESMTP id BD9F674536;
	Fri,  6 Apr 2018 22:44:04 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id 126-v6so2499263oig.0;
	Fri, 06 Apr 2018 15:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lTjz4+Rd1vPrsA9lcN8S6K4Xw1ckrqQR22k2hIinpKE=;
	b=EWpyxGA+DvRqB47Bi9pLCg7kso0T3+kzibqQW3B0rZiTuj0bNBpnj2s5C6lISeBPMc
	uaVHM1JvoQaD/HUvJ3bkkWfUpnviwJrbWfP1xANe3S1PRxpAk82wnk0Co30sxnW3muKJ
	0WIDS3yjVWbPE+vYn9MmXuIYXcfPlSvgoALWs+x0SsWWNu/7kPyit68w1VM9tltCTb+T
	wjr421AJcN7ZylHc7sAZyjEjOvZjFzZG0jFj4FfKmxpcNJBGf9hpTNAO06JhQkXQZYZu
	FFVe0pUQMvWY6kZjJiglBaWVXSuTaegijWZMfSDaWVBlvltsHzQ1tUej95/zQtuO5bZ1
	indA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lTjz4+Rd1vPrsA9lcN8S6K4Xw1ckrqQR22k2hIinpKE=;
	b=ezeF8NltBXobPZoqMtMeQwPLxZRySdv9WkRunIqbA8OA1hFcHqe8gby+Q0beTIyP8d
	cBd4nMhCX/3gHY9EwupR/Pvxt3ZMtREjUkv3/ZKfrVmR8nc10pk92JPEskQWpzyNMtsq
	0yisitqTciMm0MO8HWH6i1OFbLuMcRO470Isz7/L/uE8mXaaMliM5wjhgwfK4Fo9rUbp
	sDJ5qEvXBMVRUL8zIxQkgxe5D6HX8QJVPfHwH3Ww0CRGMadEbsfNnfCyqVKbex7z0Rkc
	5prD6QVfoge6xoeeLXbYVbU8NCC6MN8xztvkVuDWGDm31AHFVykhaVdWp17xNCAVod8D
	bb+Q==
X-Gm-Message-State: ALQs6tDcg62O5rZByFcRcCuehzHftHWm/Hfox0ygP7p0M8E1U3f6YSvi
	F4oDW61KxAfIiftHJ2zciOzzPhkjmmVJ9Oi9OQw=
X-Google-Smtp-Source: AIpwx48604v1xQhxz5oLvENRbAtKU8vQzVqcvP4O1ZTZoZ2EDiGnne9EoUD20Dx8vYHteMvxAuwkeRYQNgWoqcSs1mA=
X-Received: by 2002:aca:47c6:: with SMTP id
	u189-v6mr17161476oia.45.1523054645575; 
	Fri, 06 Apr 2018 15:44:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:256a:0:0:0:0:0 with HTTP;
	Fri, 6 Apr 2018 15:44:05 -0700 (PDT)
In-Reply-To: <1523053558.2942.50.camel@linuxfoundation.org>
References: <1523011021.2942.6.camel@linuxfoundation.org>
	<20180406141647.GA19068@linux-uys3>
	<1523028587.2942.13.camel@linuxfoundation.org>
	<CAFNP8Os_Zn-yLT_cZ7fQ8JLjOP8ERDSuA9YOsxQO7LJXDUb68g@mail.gmail.com>
	<1523053558.2942.50.camel@linuxfoundation.org>
From: Scott Rifenbark <srifenbark@gmail.com>
Date: Fri, 6 Apr 2018 15:44:05 -0700
Message-ID: <CAFNP8Our-du_NSFvX6Q-PXAtu5evWA--gwG8TU=mX-_BW9XJwA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	Alexander Kanavin <alexander.kanavin@intel.com>
Subject: Re: [Openembedded-architecture] LAYERSERIES
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
X-List-Received-Date: Fri, 06 Apr 2018 22:44:05 -0000
Content-Type: multipart/alternative; boundary="0000000000001f862f056935cb7b"

--0000000000001f862f056935cb7b
Content-Type: text/plain; charset="UTF-8"

Thanks Richard....

https://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-LAYERSERIES_COMPAT

Scott

On Fri, Apr 6, 2018 at 3:25 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2018-04-06 at 11:16 -0700, Scott Rifenbark wrote:
> > We have this variable appearing in a couple manuals BTW.  If anyone
> > has any feedback on what is being said here I can update.
>
> Some small suggested tweaks:
>
> "Using the LAYERSERIES_COMPAT variable makes it clear when a given
> layer is unmaintained and untested with new releases of OE-Core. "
> ->
> "Using the LAYERSERIES_COMPAT variable allows the layer maintainer to
> indicate which combinations of the layer and OE-Core may be expected to
> work. It gives the system a way to detect when a layer has not been
> tested with new releases of OE-Core, for example if it had become
> unmaintained."
>
> "The OpenEmbedded build system, however, does not produce an error if
> the variable is not set."
> ->
> "The OpenEmbedded build system will warn if the variable is not set for
> any given layer"
>
> Cheers,
>
> Richard
>

--0000000000001f862f056935cb7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks Richard....<br><br><a href=3D"https://www.yoct=
oproject.org/docs/2.5/ref-manual/ref-manual.html#var-LAYERSERIES_COMPAT">ht=
tps://www.yoctoproject.org/docs/2.5/ref-manual/ref-manual.html#var-LAYERSER=
IES_COMPAT</a><br><br></div>Scott<br></div><div class=3D"gmail_extra"><br><=
div class=3D"gmail_quote">On Fri, Apr 6, 2018 at 3:25 PM, Richard Purdie <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" t=
arget=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">On Fri, 2018-04-06 at 11:16 -0700, Scott R=
ifenbark wrote:<br>
&gt; We have this variable appearing in a couple manuals BTW.=C2=A0 If anyo=
ne<br>
&gt; has any feedback on what is being said here I can update.<br>
<br>
Some small suggested tweaks:<br>
<br>
&quot;Using the LAYERSERIES_COMPAT variable makes it clear when a given<br>
layer is unmaintained and untested with new releases of OE-Core. &quot;<br>
-&gt;<br>
&quot;Using the LAYERSERIES_COMPAT variable allows the layer maintainer to<=
br>
indicate which combinations of the layer and OE-Core may be expected to<br>
work. It gives the system a way to detect when a layer has not been<br>
tested with new releases of OE-Core, for example if it had become<br>
unmaintained.&quot;<br>
<br>
&quot;The OpenEmbedded build system, however, does not produce an error if<=
br>
the variable is not set.&quot;<br>
-&gt;<br>
&quot;The OpenEmbedded build system will warn if the variable is not set fo=
r<br>
any given layer&quot;<br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div><br></div>

--0000000000001f862f056935cb7b--
