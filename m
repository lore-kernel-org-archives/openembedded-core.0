Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f45.google.com (mail-vk0-f45.google.com
	[209.85.213.45])
	by mail.openembedded.org (Postfix) with ESMTP id A055F60762
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 12:56:32 +0000 (UTC)
Received: by mail-vk0-f45.google.com with SMTP id g189so11458352vke.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 05:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tPqYf3PU87YuW09U3TiWEk+VPiY8R3/yImyVlzI3GR8=;
	b=W41UOqyc/8DYdem5Jve/cdbbvGB+zNH0snY3FLi6k4FYQ+OMdPbkZU/0lomamWi3aB
	LpkqL7oqywBicwR1pO8d0szBVdfqlqBue1SJHeoFLr10p03xsbzCXJroEfFnt8cW06S9
	XlrqsJtzwVg9lPonFwBfAgEs4YUErmsUaAK78jgZjOAI0uqqeJ/C0boknIsHIIojmyHE
	06soGDCIRsmy+xU7+HD0bJGsvNmbw+eAcsDnrEnUHfLcWNiOxModegSmU3FglLJRkCIt
	RqUPcmMQbg6jyGIAYS5dSHe2FurHSpFsnMr02YRraxyErwjxtZRFSALQyuIXI9EB3lSx
	H5QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tPqYf3PU87YuW09U3TiWEk+VPiY8R3/yImyVlzI3GR8=;
	b=Rs5K75AZtePznBomRWf/AVIMwQK0BUy7SD/ODIe0G0IxpXCHRPHI5FOFOPRFitPjYz
	d18699wPB55wPTZ5gq5fIK8OgiUeQAWon4heBiieBMyZB74S6qv0a3ShdC0DC/0h56/v
	TxT59BpFoM4ajZ0GjP6nIn4eiyCFZ6ZAc0APvvIOtT5MpRVcygDJ5sfFbg3DWsu4czon
	ovUc6kXwk4qgEahBiqJzZlgdZoLEk59dZ9gRSKpxO+8vwdu1CHikRjFQJKxWNexX2IAN
	QrMYYQ9KdYDIdmy1A+WmZ1LxSceVlypfz679p5i65UWO4dEjt4hxbZniCx7viIgXW2s8
	AQ8w==
X-Gm-Message-State: AIVw11212jbIf9vJBRm68yXL/ocKgQDegPcjCjjKukFuaC4bx+nqyvXN
	RQBw0PHbEgq/zke413zr2rKAipoorQ==
X-Received: by 10.31.92.2 with SMTP id q2mr9802505vkb.170.1501505793641; Mon,
	31 Jul 2017 05:56:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.120.212 with HTTP; Mon, 31 Jul 2017 05:56:33 -0700 (PDT)
In-Reply-To: <20170731125036.GG16135@bill-the-cat>
References: <1501491388-15182-1-git-send-email-liu.ming50@gmail.com>
	<20170731125036.GG16135@bill-the-cat>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 31 Jul 2017 14:56:33 +0200
Message-ID: <CALatG=4BPZ2T4VEh0Sq4v8-amm5pL4C-uh88eZ0xwahfdANVkA@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] meta: drop do_bootdirectdisk do_vmimg references
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
X-List-Received-Date: Mon, 31 Jul 2017 12:56:32 -0000
Content-Type: multipart/alternative; boundary="001a114d44d275538a05559c8f29"

--001a114d44d275538a05559c8f29
Content-Type: text/plain; charset="UTF-8"

> And there's no references to image_type_uboot.bbclass left, either, yes?

Yes, just double checked, there is no references to image_type_uboot.

//Ming Liu

2017-07-31 14:50 GMT+02:00 Tom Rini <trini@konsulko.com>:

> On Mon, Jul 31, 2017 at 10:56:28AM +0200, liu.ming50@gmail.com wrote:
>
> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >
> > do_bootdirectdisk and do_vmimg had been dropped by commit 929ba563:
> > [ image: Convert vmdk/vdi/qcow2 to strict CONVERSION_CMD types ]
> >
> > Also drop the references to them and image-vm.
> >
> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> And there's no references to image_type_uboot.bbclass left, either, yes?
> If so:
>
> Reviewed-by: Tom Rini <trini@konsulko.com>
>
> Thanks!
>
> --
> Tom
>

--001a114d44d275538a05559c8f29
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-size:14px">&gt; And there&#39;s no ref=
erences to image_type_uboot.bbclass left, either, yes?</span><br style=3D"f=
ont-size:14px"><br style=3D"font-size:14px"><div>Yes, just double checked, =
there is no references to=C2=A0<span style=3D"font-size:14px">image_type_ub=
oot.</span></div><div><span style=3D"font-size:14px"><br></span></div><div>=
<span style=3D"font-size:14px">//Ming Liu</span></div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">2017-07-31 14:50 GMT+02:00 Tom R=
ini <span dir=3D"ltr">&lt;<a href=3D"mailto:trini@konsulko.com" target=3D"_=
blank">trini@konsulko.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
><span class=3D"">On Mon, Jul 31, 2017 at 10:56:28AM +0200, <a href=3D"mail=
to:liu.ming50@gmail.com">liu.ming50@gmail.com</a> wrote:<br>
<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascopco.c=
om">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt;<br>
&gt; do_bootdirectdisk and do_vmimg had been dropped by commit 929ba563:<br=
>
&gt; [ image: Convert vmdk/vdi/qcow2 to strict CONVERSION_CMD types ]<br>
&gt;<br>
&gt; Also drop the references to them and image-vm.<br>
&gt;<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atl=
ascopco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
<br>
</span>And there&#39;s no references to image_type_uboot.bbclass left, eith=
er, yes?<br>
If so:<br>
<br>
Reviewed-by: Tom Rini &lt;<a href=3D"mailto:trini@konsulko.com">trini@konsu=
lko.com</a>&gt;<br>
<br>
Thanks!<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Tom<br>
</font></span></blockquote></div><br></div>

--001a114d44d275538a05559c8f29--
