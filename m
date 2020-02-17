Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f193.google.com (mail-vk1-f193.google.com
	[209.85.221.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6656153A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 19:29:41 +0000 (UTC)
Received: by mail-vk1-f193.google.com with SMTP id b2so4876549vkk.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 11:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ys2SI0SNBaYuOUuCcvViWK0i1SADtxkwzSUc+MzEdfs=;
	b=e5B+WgwdbJeh8oG9PZwVKryVPS1cgExFZ6cepHRR54OlCbLClGmyLhS9XZ9LKCcec+
	BoXQreYbfEjPdVhUSj8tzVcUMClJ12d+Fdx5pjzP3Qzrr+PVPniI6DDXFtczz5WeZBYp
	yHRIc+2bzQeCdZxVv1MLEeXAkRRF0wCqb1EmV8GKg6pOSsVxK2KqWW27Fwou1Xvp31WL
	8PFLvje5h/QEETFGl3u3K1gozwJS2sZwJBVDSQKAiiyhavF7Hws6oXNHcTFhW/QJNQQv
	X8jD3j7LHDr7RMlbZp55ZrUOpaBY/MRTnFDu6KK+5jq83+bZbGfZZZ7lHUZkqRCuX6IZ
	WClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ys2SI0SNBaYuOUuCcvViWK0i1SADtxkwzSUc+MzEdfs=;
	b=bidBtqJlXwh3JFS0qHdKCnP8ZOLD3n7mf5oR7CsDGzorm8SAXDaUeH+iL/JFcth1xW
	INcQrwl9inW0UEVVFENWdbPOg6bqkKEsRulzY28vfcjkonmQ0PTWfSqX3lIJtfgcasJu
	BCr7vU4pM3k1d5XOuMAslw0r74apUXmItRFNszNDYOABy+7GcHZ4gCGpCBp7P/zyh6Nz
	oDl0tfDwTpX+j7eOqULRANFQLys8EsuYEDXG8GwL5szqnNM7EDJvRxztVXKb4YWd854Z
	3q8TE0KDJJlHhncld+FQP7PNLDgTmBe1549kQwYVfM0q/YFppDzqEdj7hDXHqpX4zhIB
	kkMw==
X-Gm-Message-State: APjAAAX2ciUhl/i76Dq0xz5l5IVI8PZjy5B2pbFHwiLld6N8hyeHzIAb
	J0xKW3BQJtyqhCptRSt5PwMqSBUfhhLFJlJbNV4=
X-Google-Smtp-Source: APXvYqynnsScX5MYffCS58UHW3JK1FYY8Oxs/PdKi1TL4A0Gu7xTJ9xidudhlP0LRzavcE4s3DEgzLVY/2d5fLLE0Ck=
X-Received: by 2002:a1f:7cc2:: with SMTP id x185mr6419149vkc.1.1581967782820; 
	Mon, 17 Feb 2020 11:29:42 -0800 (PST)
MIME-Version: 1.0
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
	<20200216155015.21738-5-alex.kanavin@gmail.com>
	<CAMKF1sppws+PSjDojzi7+=p_UjEkEafGa1_WtRLCpqO_73nhGA@mail.gmail.com>
	<CANNYZj8W0A12inq_K3kiShN7dsU3tsTuOgh4LZAtP-QcUVDaXQ@mail.gmail.com>
	<CAMKF1so86RKsiAXC=vzpT0wu8E=jiFMzJsVBdGb7SQ2TKxBo6Q@mail.gmail.com>
	<CANNYZj_k+iXWB_V3PQOv8eE8Pvwt8B-q4=x_F4e4hzisW-NXaA@mail.gmail.com>
	<CAMKF1spO36x=P-ts28+BEg+Pvw5FcEWNpyNyJGXcFB_jXSohUA@mail.gmail.com>
	<CANNYZj8ZC_pVkSHTisPryOJE7GfMqot5a=5uP5LUm3fB0nVMYw@mail.gmail.com>
	<CANNYZj9u8f+qD_3RTb+9O9cbNBk0UgteBcV_d7X2ffpCkg4UxA@mail.gmail.com>
	<CAMKF1srMfa-0ADdKErgwXhQa6ypDL7RGznsBQ0ET7cZ29ErzXA@mail.gmail.com>
In-Reply-To: <CAMKF1srMfa-0ADdKErgwXhQa6ypDL7RGznsBQ0ET7cZ29ErzXA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 17 Feb 2020 20:29:31 +0100
Message-ID: <CANNYZj_ktJg=JF=nTPvHWBajA+7t2zMPwZmbUFLOKRWD1uP4_A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/10] weston-init: use the drm backend rather than fbdev one
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
X-List-Received-Date: Mon, 17 Feb 2020 19:29:42 -0000
Content-Type: multipart/alternative; boundary="000000000000bdc01b059eca93e4"

--000000000000bdc01b059eca93e4
Content-Type: text/plain; charset="UTF-8"

On Mon, 17 Feb 2020 at 19:45, Khem Raj <raj.khem@gmail.com> wrote:

>
> hw acceleration is not going to work for non-x86 qemus, while other
> qemus should be fixed but not
> by breaking them first. As suggested limit this change to tested
> architectures and it would be fine.
> then if interested to fix it globally make changes to fix rest of
> qemus and then instrument global change
> after that
>

arm64 qemu should work, as it is using the same video hardware as x86_64.
My computing resources are severely limited right now, so I cannot try it
out immediately unfortunately, but I'll get to it, or you are welcome to
try and report.
Mips can be either fixed like suggested, or be a specific exception.

For the rest of the targets, I see that you have extended the fbdev
fallback to qemuall only on Jan 9 this year. So it's very unlikely anyone
is using them to run weston (not to mention how painfully slow that would
be), and so it would just be wasteful to test or fix them.

Alex

--000000000000bdc01b059eca93e4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, 17 Feb 2020 at 19:45, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><br>
hw acceleration is not going to work for non-x86 qemus, while other<br>
qemus should be fixed but not<br>
by breaking them first. As suggested limit this change to tested<br>
architectures and it would be fine.<br>
then if interested to fix it globally make changes to fix rest of<br>
qemus and then instrument global change<br>
after that<br></blockquote><div><br></div><div>arm64 qemu should work, as i=
t is using the same video hardware as x86_64. My computing resources are se=
verely limited right now, so I cannot try it out immediately unfortunately,=
 but I&#39;ll get to it, or you are welcome to try and report.</div><div></=
div><div></div><div>Mips can be either fixed like suggested, or be a specif=
ic exception. <br></div><div><br></div><div>For the rest of the targets, I =
see that you have extended the fbdev fallback to qemuall only on Jan 9 this=
 year. So it&#39;s very unlikely anyone is using them to run weston (not to=
 mention how painfully slow that would be), and so it would just be wastefu=
l to test or fix them.<br></div><br><div>Alex<br></div></div></div>

--000000000000bdc01b059eca93e4--
