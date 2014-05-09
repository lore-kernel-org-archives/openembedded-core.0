Return-Path: <ticotimo@gmail.com>
X-Greylist: delayed 1430 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 09 May 2014 17:10:49 UTC
Received: from mail-la0-f45.google.com (unknown [209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id B414D6059B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 May 2014 17:10:48 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id gl10so82673lab.32
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 May 2014 10:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=9Te4dZ0yKd/u8IaBdDHiKkxZ/FXByoMRQR4VZ6dBjXA=;
	b=ygrZAJLRGjDdBs4wHORl8SbAJkAQcsDtIvlU0VI0W2vY780UdJkMSo62qjDHpUvx5m
	nXibgwH6042YZ3MeANslS7+ekyrFf8QOgrvGb6FSUPbDCzOKxPwUFP6c8cZXVtC73IYV
	y1+M/yokFA9I2CXiw3g22GMfF27xJSLcIs/zuLFCeLMKy/A0BwkUMAgMS4l3bP18uouy
	xLnVo+0p4YntZchXfbsPG9PMJDl5lLrP44wdYhVqn0sU7yWjTxQqc7ZDtcDy5hWSJ626
	Ul5nuI5Td9+W1rgkTDicVObXX23hKTltLURa5VQMCPqNKdwhicxvt+XIEc0qTVwtaZqH
	/G8A==
MIME-Version: 1.0
X-Received: by 10.112.46.97 with SMTP id u1mr2366039lbm.50.1399654019536; Fri,
	09 May 2014 09:46:59 -0700 (PDT)
Received: by 10.114.216.4 with HTTP; Fri, 9 May 2014 09:46:59 -0700 (PDT)
In-Reply-To: <CAJTo0LYAv1e0ko7jK6mm9Uz1Hsqvd7rq8dYshogVAE8mCMa=Aw@mail.gmail.com>
References: <1399645908-14499-1-git-send-email-ticotimo@gmail.com>
	<CAJTo0LYCdUJMPN8+pZWXrvsRc9fyiq7gm2dOh0N3gRcqWFP1CA@mail.gmail.com>
	<20140509150721.GA22774@jama>
	<CAJTo0LYAv1e0ko7jK6mm9Uz1Hsqvd7rq8dYshogVAE8mCMa=Aw@mail.gmail.com>
Date: Fri, 9 May 2014 09:46:59 -0700
Message-ID: <CANx9H-AZ2CfjewGUEDRyzsspqtES_XQt0f15oY61VY4RLK523w@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] weston: add lcms, libpoppler-glib dependenies
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
X-List-Received-Date: Fri, 09 May 2014 17:10:52 -0000
Content-Type: multipart/alternative; boundary=001a113497e6a49cab04f8fa58ad

--001a113497e6a49cab04f8fa58ad
Content-Type: text/plain; charset=UTF-8

Consider this patch DOA. I'll try over the weekend to apply a more
appropriate fix, unless someone else wants to jump in. There are plenty of
other packages on the list :)


On Fri, May 9, 2014 at 8:18 AM, Burton, Ross <ross.burton@intel.com> wrote:

> On 9 May 2014 16:07, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> For a start libpoppler isn't in oe-core, so this causes a build
> >> failure for everyone not using meta-oe.
> >>
> >> These are for the basic test applications: I'd prefer to see a patch
> >> that either forcibly disabled the checks or added configure options so
> >> the dependencies can be controlled.
> >
> > FWIW: I've sent WIP patch a while ago, but never finished it
> > http://patchwork.openembedded.org/patch/57011/
> >
> > IIRC it doesn't apply to current version now.
>
> If definitely doesn't apply to master: weston doesn't check for
> poppler anymore as the PDF viewer was removed.
>
> LCMS should have an explicit with/without as it is used for colour
> management in the server.
>
> Ross
>

--001a113497e6a49cab04f8fa58ad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Consider this patch DOA. I&#39;ll try over the weekend to =
apply a more appropriate fix, unless someone else wants to jump in. There a=
re plenty of other packages on the list :)<br></div><div class=3D"gmail_ext=
ra">
<br><br><div class=3D"gmail_quote">On Fri, May 9, 2014 at 8:18 AM, Burton, =
Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=
=3D"_blank">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<div class=3D"">On 9 May 2014 16:07, Martin Jansa &lt;<a href=3D"mailto:mar=
tin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;&gt; For a start libpoppler isn&#39;t in oe-core, so this causes a buil=
d<br>
&gt;&gt; failure for everyone not using meta-oe.<br>
&gt;&gt;<br>
&gt;&gt; These are for the basic test applications: I&#39;d prefer to see a=
 patch<br>
&gt;&gt; that either forcibly disabled the checks or added configure option=
s so<br>
&gt;&gt; the dependencies can be controlled.<br>
&gt;<br>
&gt; FWIW: I&#39;ve sent WIP patch a while ago, but never finished it<br>
&gt; <a href=3D"http://patchwork.openembedded.org/patch/57011/" target=3D"_=
blank">http://patchwork.openembedded.org/patch/57011/</a><br>
&gt;<br>
&gt; IIRC it doesn&#39;t apply to current version now.<br>
<br>
</div>If definitely doesn&#39;t apply to master: weston doesn&#39;t check f=
or<br>
poppler anymore as the PDF viewer was removed.<br>
<br>
LCMS should have an explicit with/without as it is used for colour<br>
management in the server.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Ross<br>
</font></span></blockquote></div><br></div>

--001a113497e6a49cab04f8fa58ad--
